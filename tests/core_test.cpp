#include "vquery/hash/hash_table.hpp"
#include "vquery/storage/tables.hpp"
#include <barrier>
#include <gtest/gtest.h>
#include <limits>
#include <thread>

using namespace vquery;
namespace {
auto memory(std::size_t bytes = 64 * 1024 * 1024) { return std::make_shared<MemoryBudget>(bytes); }
struct CollisionHash {
  std::size_t operator()(std::uint32_t) const noexcept { return 1023; }
};
} // namespace
TEST(Memory, RejectsBeforeAllocationAndRollsBack) {
  auto budget = memory(16);
  {
    auto data = make_buffer<std::uint64_t>(budget);
    data.resize(2);
    EXPECT_EQ(budget->snapshot().query, 16u);
    EXPECT_THROW(data.resize(3), Error);
    EXPECT_EQ(data.size(), 2u);
    EXPECT_EQ(budget->snapshot().query, 16u);
  }
  EXPECT_EQ(budget->snapshot().total, 0u);
  budget->reset_query_peak();
  EXPECT_EQ(budget->snapshot().query_peak, 0u);
  budget->fail_after(0);
  auto data = make_buffer<int>(budget);
  EXPECT_THROW(data.resize(1), std::bad_alloc);
  EXPECT_EQ(budget->snapshot().total, 0u);
}
TEST(Memory, MoveSwapCopyAndRebindKeepOwners) {
  auto a = memory(), b = memory();
  {
    auto x = make_buffer<int>(a), y = make_buffer<int>(b);
    x.resize(10, 7);
    y.resize(20, 8);
    y = std::move(x);
    EXPECT_EQ(a->snapshot().query, 40u);
    EXPECT_EQ(b->snapshot().query, 0u);
    x = make_buffer<int>(b);
    x.resize(5, 4);
    x.swap(y);
    EXPECT_EQ(x[0], 7);
    EXPECT_EQ(y[0], 4);
    auto copy = make_buffer<int>(b);
    copy = x;
    EXPECT_EQ(copy.get_allocator(), BudgetAllocator<int>(b, MemoryCategory::query));
    BudgetAllocator<double> rebound(x.get_allocator());
    EXPECT_EQ(rebound, BudgetAllocator<double>(a, MemoryCategory::query));
    EXPECT_THROW(a->reset_query_peak(), Error);
  }
  EXPECT_EQ(a->snapshot().total, 0u);
  EXPECT_EQ(b->snapshot().total, 0u);
}
TEST(Memory, ReturnedBufferOwnsBudgetLifetime) {
  std::weak_ptr<MemoryBudget> weak;
  Buffer<int> result;
  {
    auto budget = memory();
    weak = budget;
    result = make_buffer<int>(budget);
    result.resize(3, 9);
  }
  EXPECT_FALSE(weak.expired());
  EXPECT_EQ(result[2], 9);
  result = Buffer<int>{};
  EXPECT_TRUE(weak.expired());
}
TEST(Memory, OverflowDoesNotReserve) {
  auto budget = memory();
  BudgetAllocator<std::uint64_t> alloc(budget, MemoryCategory::query);
  EXPECT_THROW(alloc.allocate(SIZE_MAX / sizeof(std::uint64_t) + 1), Error);
  EXPECT_EQ(budget->snapshot().total, 0u);
}
TEST(Hash, CollisionWraparoundBoundaryKeysAndGrowth) {
  auto budget = memory();
  {
    HashTable<Aggregate, CollisionHash> map(budget);
    for (std::uint32_t i = 0; i < 1800; ++i) {
      auto &value = map.find_or_insert(i);
      value = {i + 1, static_cast<std::int64_t>(i) * 3};
    }
    map.find_or_insert(UINT32_MAX) = {99, 123};
    EXPECT_EQ(map.size(), 1801u);
    EXPECT_GT(map.capacity(), 1024u);
    for (std::uint32_t i = 0; i < 1800; ++i) {
      ASSERT_NE(map.find(i), nullptr);
      EXPECT_EQ(map.find(i)->sum, static_cast<std::int64_t>(i) * 3);
    }
    EXPECT_EQ(map.find(UINT32_MAX)->count, 99u);
    EXPECT_EQ(map.find(2000), nullptr);
    EXPECT_THROW(map.insert_unique(0, {1, 1}), Error);
  }
  EXPECT_EQ(budget->snapshot().query, 0u);
}
TEST(Hash, FailedGrowthPreservesExistingData) {
  auto budget = memory(50000);
  HashTable<Aggregate> map(budget);
  for (std::uint32_t i = 0; i < 716; ++i)
    map.find_or_insert(i) = {1, i};
  const auto before = budget->snapshot().query;
  EXPECT_NO_THROW(map.find_or_insert(0).count++);
  EXPECT_EQ(map.capacity(), 1024u);
  EXPECT_THROW(map.find_or_insert(716), Error);
  EXPECT_EQ(map.size(), 716u);
  EXPECT_EQ(budget->snapshot().query, before);
  for (std::uint32_t i = 0; i < 716; ++i)
    ASSERT_NE(map.find(i), nullptr);
}
TEST(Hash, CapacityBounds) {
  EXPECT_EQ(HashTable<int>::capacity_for(0), 1u);
  EXPECT_EQ(HashTable<int>::capacity_for(1), 2u);
  EXPECT_THROW(HashTable<int>::capacity_for(SIZE_MAX), Error);
}
TEST(Generator, GoldenAndLayoutAgreement) {
  Config c;
  c.rows = 3;
  c.seed = 42;
  auto soa = generate(c, memory());
  c.engine = Engine::row_aos;
  auto aos = generate(c, memory());
  EXPECT_EQ(hex_checksum(soa.input_checksum), "331fe0f8f27066a0");
  EXPECT_EQ(soa.input_checksum, aos.input_checksum);
  for (std::size_t i = 0; i < c.rows; ++i) {
    auto x = soa.fact(i), y = aos.fact(i);
    EXPECT_EQ(x.customer_id, y.customer_id);
    EXPECT_EQ(x.group_id, y.group_id);
    EXPECT_EQ(x.score, y.score);
    EXPECT_EQ(x.amount, y.amount);
  }
  c.engine = Engine::batch_soa;
  c.query = Query::join_group_sum;
  c.rows = 1000;
  c.dim_rows = 10;
  auto joined = generate(c, memory());
  EXPECT_EQ(hex_checksum(joined.input_checksum), "87a7457bc600ecec");
}
TEST(Generator, IndependentColumnStreamsAndEmptyDimension) {
  Config a;
  a.query = Query::group_sum;
  a.rows = 2000;
  auto first = generate(a, memory());
  a.groups = 17;
  a.distribution = Distribution::hot_key_90;
  auto second = generate(a, memory());
  for (std::size_t i = 0; i < a.rows; ++i) {
    EXPECT_EQ(first.fact(i).score, second.fact(i).score);
    EXPECT_EQ(first.fact(i).amount, second.fact(i).amount);
  }
  a.query = Query::join_group_sum;
  a.dim_rows = 0;
  a.match_rate_bps = 0;
  auto empty = generate(a, memory());
  EXPECT_EQ(empty.customer_count, 0u);
}
TEST(Storage, BoundsAndShapeAreChecked) {
  std::vector<FactRow> facts{{0, UINT32_MAX, 1'000'000, 9999}};
  auto table = from_fixture(Engine::batch_soa, Query::group_sum, facts, {}, memory());
  table.columns.score.clear();
  EXPECT_THROW(table.validate_shape(), Error);
  facts[0].amount = -1;
  EXPECT_THROW(from_fixture(Engine::row_aos, Query::group_sum, facts, {}, memory()), Error);
}

TEST(Hash, FixedHashVectors) {
  EXPECT_EQ(KeyHash{}(0), UINT64_C(0xb55a8fa067537a73));
  EXPECT_EQ(KeyHash{}(1), UINT64_C(0x509252f3a8113dfc));
  EXPECT_EQ(KeyHash{}(UINT32_MAX), UINT64_C(0x13e3f7b9953ddd63));
}

TEST(Hash, UniqueInsertCanCopyAnExistingValueAcrossGrowth) {
  auto budget = memory();
  HashTable<Aggregate> table(budget);
  for (std::uint32_t i = 0; i < 716; ++i)
    table.find_or_insert(i) = {i + 10, static_cast<std::int64_t>(i) * 100};
  const auto &value = *table.find(42);
  table.insert_unique(716, value);
  ASSERT_GT(table.capacity(), 1024u);
  ASSERT_NE(table.find(716), nullptr);
  EXPECT_EQ(table.find(716)->count, 52u);
  EXPECT_EQ(table.find(716)->sum, 4200);
}

TEST(Storage, CopyAssignmentTransfersTheBudgetWithTheBuffers) {
  for (auto engine : {Engine::row_aos, Engine::batch_soa}) {
    auto source_budget = memory(), old_budget = memory();
    {
      const std::vector<FactRow> facts{{7, 9, 123, 4}};
      const std::vector<CustomerRow> customers{{7, 15}};
      auto source = from_fixture(engine, Query::join_group_sum, facts, customers, source_budget);
      auto destination = from_fixture(engine, Query::join_group_sum, facts, customers, old_budget);
      const auto input_bytes = source_budget->snapshot().input;
      destination = source;
      EXPECT_EQ(destination.budget, source_budget);
      EXPECT_EQ(source_budget->snapshot().input, 2 * input_bytes);
      EXPECT_EQ(old_budget->snapshot().total, 0u);
      EXPECT_EQ(destination.fact(0).amount, 123);
      EXPECT_EQ(destination.customer(0).region_id, 15u);
      destination.set_fact(0, {7, 9, 456, 4});
      EXPECT_EQ(source.fact(0).amount, 123);
    }
    EXPECT_EQ(source_budget->snapshot().total, 0u);
    EXPECT_EQ(old_budget->snapshot().total, 0u);
  }
}

TEST(Hash, CopyAssignmentTransfersTheBudgetAndCanGrow) {
  auto source_budget = memory(), old_budget = memory();
  {
    HashTable<int> source(source_budget), destination(old_budget);
    source.insert_unique(42, 7);
    const auto bytes = source_budget->snapshot().query;
    destination = source;
    EXPECT_EQ(source_budget->snapshot().query, 2 * bytes);
    EXPECT_EQ(old_budget->snapshot().query, 0u);
    // A later rehash must continue charging the same owner.
    for (std::uint32_t i = 0; i < 1000; ++i)
      destination.find_or_insert(i) = static_cast<int>(i);
    EXPECT_EQ(*source.find(42), 7);
    EXPECT_EQ(*destination.find(42), 42);
    EXPECT_EQ(old_budget->snapshot().query, 0u);
  }
  EXPECT_EQ(source_budget->snapshot().total, 0u);
  EXPECT_EQ(old_budget->snapshot().total, 0u);
}

TEST(Storage, FailedCopyAssignmentPreservesTheDestination) {
  auto source_budget = memory(), destination_budget = memory();
  const std::vector<FactRow> facts{{0, 0, 42, 0}};
  auto source = from_fixture(Engine::batch_soa, Query::group_sum, facts, {}, source_budget);
  auto destination =
      from_fixture(Engine::row_aos, Query::filter_sum, facts, {}, destination_budget);
  const auto before = destination_budget->snapshot().total;
  source_budget->fail_after(1);
  EXPECT_THROW(destination = source, std::bad_alloc);
  EXPECT_EQ(destination.budget, destination_budget);
  EXPECT_EQ(destination.query, Query::filter_sum);
  EXPECT_TRUE(destination.aos);
  EXPECT_NO_THROW(destination.validate_values());
  EXPECT_EQ(destination_budget->snapshot().total, before);
  EXPECT_EQ(destination.fact(0).amount, 42);
}

TEST(Hash, FailedCopyAssignmentLeavesBothTablesUsable) {
  auto a = memory(), b = memory();
  HashTable<int> source(a), destination(b);
  source.insert_unique(1, 10);
  destination.insert_unique(2, 20);
  const auto a_bytes = a->snapshot().query, b_bytes = b->snapshot().query;
  a->fail_after(1);
  EXPECT_THROW(destination = source, std::bad_alloc);
  EXPECT_EQ(*destination.find(2), 20);
  EXPECT_EQ(destination.find(1), nullptr);
  EXPECT_EQ(*source.find(1), 10);
  EXPECT_EQ(a->snapshot().query, a_bytes);
  EXPECT_EQ(b->snapshot().query, b_bytes);
}

TEST(Hash, SmallCapacityStillLeavesAnEmptyProbeSlot) {
  auto budget = memory();
  EXPECT_THROW(HashTable<int>(budget, 0), Error);
  EXPECT_THROW(HashTable<int>(budget, 3), Error);
  HashTable<int> table(budget, 1);
  EXPECT_EQ(table.find(0), nullptr);
  table.insert_unique(0, 10);
  EXPECT_EQ(*table.find(0), 10);
  EXPECT_EQ(table.find(UINT32_MAX), nullptr);
  table.insert_unique(UINT32_MAX, 20);
  EXPECT_EQ(*table.find(UINT32_MAX), 20);
}

TEST(Storage, RejectsInvalidFixturesAndReleasesPartialAllocations) {
  for (auto engine : {Engine::row_aos, Engine::row_soa, Engine::batch_soa}) {
    auto budget = memory();
    for (auto fact : {FactRow{0, 0, -1, 0}, FactRow{0, 0, 1'000'001, 0}, FactRow{0, 0, 0, 10000}}) {
      const std::vector<FactRow> facts{fact};
      EXPECT_THROW(from_fixture(engine, Query::filter_sum, facts, {}, budget), Error);
      EXPECT_EQ(budget->snapshot().total, 0u);
    }
    const std::vector<CustomerRow> customers{{0, 16}};
    EXPECT_THROW(from_fixture(engine, Query::join_group_sum, {}, customers, budget), Error);
    EXPECT_THROW(from_fixture(engine, Query::filter_sum, {}, customers, budget), Error);
    EXPECT_EQ(budget->snapshot().total, 0u);
    Tables table(budget, engine, Query::join_group_sum);
    EXPECT_THROW(table.allocate(100'000'001, 0), Error);
    EXPECT_THROW(table.allocate(0, 10'000'001), Error);
  }
  EXPECT_THROW((BudgetAllocator<int>(nullptr, MemoryCategory::input)), Error);
  for (std::size_t fail = 0; fail < 6; ++fail) {
    auto budget = memory();
    budget->fail_after(fail);
    Config c;
    c.rows = 10;
    c.dim_rows = 2;
    c.query = Query::join_group_sum;
    EXPECT_THROW(generate(c, budget), std::bad_alloc);
    EXPECT_EQ(budget->snapshot().total, 0u);
  }
}

TEST(Generator, SkewSingletonDomainsAndJoinMatchBoundaries) {
  for (auto distribution : {Distribution::uniform, Distribution::hot_key_90}) {
    for (std::uint64_t seed : {UINT64_C(0), UINT64_MAX}) {
      Config c;
      c.rows = 10000;
      c.seed = seed;
      c.distribution = distribution;
      c.query = Query::group_sum;
      for (auto groups : {1u, 17u}) {
        c.groups = groups;
        auto table = generate(c, memory());
        std::size_t zeros = 0;
        for (std::size_t i = 0; i < c.rows; ++i) {
          EXPECT_LT(table.fact(i).group_id, groups);
          zeros += table.fact(i).group_id == 0;
        }
        if (groups == 1)
          EXPECT_EQ(zeros, c.rows);
        else if (distribution == Distribution::hot_key_90) {
          EXPECT_GT(zeros, 8500u);
          EXPECT_LT(zeros, 9500u);
        } else
          EXPECT_LT(zeros, 1000u);
      }
      c.query = Query::join_group_sum;
      for (auto dim : {0u, 1u, 17u}) {
        c.dim_rows = dim;
        for (auto match : {0u, 1u, 5000u, 9999u, 10000u}) {
          if (dim == 0 && match != 0)
            continue;
          c.match_rate_bps = match;
          auto table = generate(c, memory());
          std::size_t matches = 0, hot = 0;
          for (std::size_t i = 0; i < c.rows; ++i) {
            const auto key = table.fact(i).customer_id;
            matches += key < dim;
            hot += key == 0;
          }
          if (match == 0)
            EXPECT_EQ(matches, 0u);
          if (match == 10000) {
            EXPECT_EQ(matches, c.rows);
            if (dim == 1)
              EXPECT_EQ(hot, c.rows);
            else if (distribution == Distribution::hot_key_90) {
              EXPECT_GT(hot, 8500u);
              EXPECT_LT(hot, 9500u);
            }
          }
          if (match == 5000) {
            EXPECT_GT(matches, 4500u);
            EXPECT_LT(matches, 5500u);
          }
          EXPECT_NO_THROW(table.validate_values());
        }
      }
    }
  }
}

TEST(Memory, ConcurrentReservationsCannotExceedOneSharedBudget) {
  auto budget = memory(sizeof(std::uint64_t));
  std::array<Buffer<std::uint64_t>, 4> buffers;
  std::array<bool, 4> rejected{};
  std::array<std::jthread, 4> workers;
  std::barrier gate(5);
  for (std::size_t i = 0; i < workers.size(); ++i) {
    buffers[i] = make_buffer<std::uint64_t>(budget);
    workers[i] = std::jthread([&, i] {
      gate.arrive_and_wait();
      try {
        buffers[i].resize(1);
      } catch (const Error &error) {
        rejected[i] = error.code() == ErrorCode::memory_limit;
      }
    });
  }
  gate.arrive_and_wait();
  for (auto &worker : workers)
    worker.join();
  EXPECT_EQ(std::count(rejected.begin(), rejected.end(), true), 3);
  EXPECT_EQ(budget->snapshot().total, sizeof(std::uint64_t));
  EXPECT_EQ(budget->snapshot().query_peak, sizeof(std::uint64_t));
  for (auto &buffer : buffers)
    buffer = make_buffer<std::uint64_t>(budget);
  EXPECT_EQ(budget->snapshot().total, 0u);
}
