#include "vquery/hash/hash_table.hpp"
#include "vquery/storage/tables.hpp"
#include <gtest/gtest.h>
#include <limits>

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
