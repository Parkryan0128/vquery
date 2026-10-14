#include "vquery/execution/operators.hpp"
#include <barrier>
#include <gtest/gtest.h>
#include <map>
#include <random>
#include <system_error>

using namespace vquery;
namespace {
auto memory() { return std::make_shared<MemoryBudget>(128 * 1024 * 1024); }
// Deliberately independent of the engine's hash, filter, and aggregate code.
std::vector<ResultRow> reference(Query q, std::uint32_t cutoff, const std::vector<FactRow> &facts,
                                 const std::vector<CustomerRow> &customers) {
  std::map<std::uint32_t, std::pair<std::uint64_t, std::int64_t>> groups;
  if (q == Query::filter_sum)
    groups.emplace(0, std::pair<std::uint64_t, std::int64_t>{0, 0});
  for (const auto &f : facts) {
    if (f.score >= cutoff)
      continue;
    if (q == Query::join_group_sum) {
      for (const auto &c : customers)
        if (f.customer_id == c.customer_id) {
          auto &v = groups[c.region_id];
          ++v.first;
          v.second += f.amount;
        }
    } else {
      auto &v = groups[q == Query::filter_sum ? 0 : f.group_id];
      ++v.first;
      v.second += f.amount;
    }
  }
  std::vector<ResultRow> out;
  for (const auto &[key, value] : groups)
    out.push_back({key, value.first, value.second});
  return out;
}
std::vector<ResultRow> run(Query query, Engine engine, const std::vector<FactRow> &facts,
                           const std::vector<CustomerRow> &customers, std::uint32_t cutoff = 5000,
                           std::size_t batch = 2048, unsigned threads = 1) {
  auto budget = memory();
  const auto table = from_fixture(engine, query, facts, customers, budget);
  ExecutionContext context{engine, batch, threads, budget};
  std::vector<ResultRow> copy;
  {
    auto result = execute({query, cutoff}, table, context);
    canonicalize(result);
    copy.assign(result.rows.begin(), result.rows.end());
  }
  EXPECT_EQ(budget->snapshot().query, 0u);
  return copy;
}
void all_modes(Query q, const std::vector<FactRow> &facts,
               const std::vector<CustomerRow> &customers, std::uint32_t cutoff, std::size_t batch) {
  const auto expected = reference(q, cutoff, facts, customers);
  for (auto engine : {Engine::row_aos, Engine::row_soa, Engine::batch_soa})
    EXPECT_EQ(run(q, engine, facts, customers, cutoff, batch), expected);
  for (unsigned t : {2, 4})
    EXPECT_EQ(run(q, Engine::batch_soa, facts, customers, cutoff, batch, t), expected);
}
} // namespace
TEST(Execution, EmptyAndBoundaryValues) {
  for (auto q : {Query::filter_sum, Query::group_sum, Query::join_group_sum}) {
    for (auto cutoff : {0u, 1u, 10000u}) {
      all_modes(q, {}, {}, cutoff, 256);
      std::vector<FactRow> facts{{UINT32_MAX, UINT32_MAX, 1'000'000, 0}, {0, 0, 0, 9999}};
      std::vector<CustomerRow> customers;
      if (q == Query::join_group_sum)
        customers = {{UINT32_MAX, 15}, {0, 0}};
      all_modes(q, facts, customers, cutoff, 256);
    }
  }
}
TEST(Execution, BatchTailsAndEmptyIntermediateBatches) {
  for (std::size_t b : {256, 512, 1024, 2048, 4096, 8192})
    for (auto n : {b - 1, b, b + 1, 2 * b + 1}) {
      std::vector<FactRow> facts(n);
      for (std::size_t i = 0; i < n; ++i)
        facts[i] = {i < b ? 99u : 0u, static_cast<std::uint32_t>(i % 17),
                    static_cast<std::int64_t>(i % 1000), i < b ? 9999u : 0u};
      for (auto q : {Query::filter_sum, Query::group_sum, Query::join_group_sum}) {
        std::vector<CustomerRow> customers;
        if (q == Query::join_group_sum)
          customers = {{0, 3}};
        all_modes(q, facts, customers, 5000, b);
        if (q == Query::join_group_sum)
          all_modes(q, facts, customers, 10000, b);
      }
    }
}
TEST(Execution, OneHundredSeedsAgainstIndependentOracle) {
  for (std::uint64_t seed = 0; seed < 100; ++seed) {
    SCOPED_TRACE(seed);
    std::mt19937_64 rng(seed);
    const auto n = rng() % 2001, m = rng() % 129;
    std::vector<FactRow> facts(n);
    std::vector<CustomerRow> customers(m);
    for (std::size_t i = 0; i < m; ++i)
      customers[i] = {static_cast<std::uint32_t>(i), static_cast<std::uint32_t>(rng() % 16)};
    for (auto &f : facts)
      f = {static_cast<std::uint32_t>(rng() % 160), static_cast<std::uint32_t>(rng() % 1200),
           static_cast<std::int64_t>(rng() % 1'000'001), static_cast<std::uint32_t>(rng() % 10000)};
    for (auto q : {Query::filter_sum, Query::group_sum, Query::join_group_sum})
      all_modes(q, facts, q == Query::join_group_sum ? customers : std::vector<CustomerRow>{},
                static_cast<std::uint32_t>(rng() % 10001), 256);
  }
}
TEST(Execution, DuplicateBuildKeysFailEvenWithoutProbeRows) {
  for (auto engine : {Engine::row_aos, Engine::row_soa, Engine::batch_soa}) {
    auto budget = memory();
    const std::vector<CustomerRow> customers{{0, 1}, {0, 2}};
    const auto table = from_fixture(engine, Query::join_group_sum, {}, customers, budget);
    ExecutionContext context{engine, 256, 1, budget};
    EXPECT_THROW(execute({Query::join_group_sum, 0}, table, context), Error);
    EXPECT_EQ(budget->snapshot().query, 0u);
  }
}
TEST(Execution, SelectionCompositionAndReopen) {
  auto budget = memory();
  std::vector<FactRow> facts(777);
  for (std::size_t i = 0; i < facts.size(); ++i)
    facts[i] = {0, 0, static_cast<std::int64_t>(i), static_cast<std::uint32_t>(i % 7)};
  auto table = from_fixture(Engine::batch_soa, Query::filter_sum, facts, {}, budget);
  ExecutionContext context{Engine::batch_soa, 256, 1, budget};
  auto source =
      batch_filter(batch_filter(batch_scan(table, Query::filter_sum, 0, facts.size()), 5), 3);
  for (int pass = 0; pass < 2; ++pass) {
    source->open(context);
    Batch out;
    std::size_t count = 0;
    while (source->next(out)) {
      ASSERT_GT(out.logical_count, 0u);
      for (std::size_t i = 0; i < out.logical_count; ++i) {
        auto p = out.position(i);
        ASSERT_LT(p, out.physical_count);
        EXPECT_LT(out.score[p], 3u);
        EXPECT_EQ(out.amount[p] % 7, out.score[p]);
        ++count;
      }
    }
    EXPECT_EQ(count, 333u);
    source->close();
    source->close();
    EXPECT_EQ(budget->snapshot().query, 0u);
  }
}
TEST(Execution, AllocationFailureUnwindsPartialOpenAndHashBuild) {
  Config c;
  c.rows = 300;
  c.dim_rows = 12;
  c.query = Query::join_group_sum;
  for (std::size_t fail = 0; fail < 24; ++fail) {
    auto budget = memory();
    auto table = generate(c, budget);
    budget->fail_after(fail);
    ExecutionContext context{c.engine, 256, 1, budget};
    try {
      auto result = execute({c.query, 5000}, table, context);
    } catch (const Error &e) {
      EXPECT_EQ(e.code(), ErrorCode::allocation_failed);
    }
    EXPECT_EQ(budget->snapshot().query, 0u);
  }
}
TEST(Execution, SimultaneousWorkerFailuresAndLaunchFailure) {
  Config c;
  c.rows = 3000;
  c.query = Query::group_sum;
  auto budget = memory();
  auto table = generate(c, budget);
  std::barrier rendezvous(4);
  ExecutionHooks hooks;
  hooks.before_worker = [&](unsigned i) {
    rendezvous.arrive_and_wait();
    throw std::runtime_error("worker " + std::to_string(i));
  };
  ExecutionContext context{c.engine, 256, 4, budget, &hooks};
  try {
    auto result = execute({c.query, 5000}, table, context);
    FAIL() << "expected worker error";
  } catch (const Error &e) {
    EXPECT_EQ(e.code(), ErrorCode::worker_failed);
    EXPECT_STREQ(e.what(), "worker 0");
  }
  EXPECT_EQ(budget->snapshot().query, 0u);
  hooks.before_worker = {};
  hooks.before_launch = [](unsigned i) {
    if (i == 2)
      throw std::system_error(std::make_error_code(std::errc::resource_unavailable_try_again));
  };
  EXPECT_THROW(execute({c.query, 5000}, table, context), Error);
  EXPECT_EQ(budget->snapshot().query, 0u);
}

TEST(Execution, SingleRowAndWideSums) {
  const std::vector<CustomerRow> customers{{0, 15}};
  for (auto q : {Query::filter_sum, Query::group_sum, Query::join_group_sum}) {
    const auto dimension = q == Query::join_group_sum ? customers : std::vector<CustomerRow>{};
    all_modes(q, {{0, 0, 1'000'000, 0}}, dimension, 1, 256);
    const std::vector<FactRow> facts(5000, {0, 0, 1'000'000, 0});
    all_modes(q, facts, dimension, 1, 256);
    const auto out = run(q, Engine::batch_soa, facts, dimension, 1, 256, 4);
    ASSERT_EQ(out.size(), 1u);
    EXPECT_EQ(out[0].sum, INT64_C(5'000'000'000));
  }
}

TEST(Execution, PublicPipelinesRejectInvalidInputsBeforeScanning) {
  const std::vector<FactRow> facts{{0, 0, 1, 0}};
  auto budget = memory();
  for (auto engine : {Engine::row_aos, Engine::row_soa}) {
    auto table = from_fixture(engine, Query::filter_sum, facts, {}, budget);
    EXPECT_THROW(row_pipeline(table, {Query::filter_sum, 1}, 0, 2, nullptr), Error);
    EXPECT_THROW(row_pipeline(table, {Query::filter_sum, 1}, 1, 0, nullptr), Error);
    EXPECT_THROW(row_pipeline(table, {Query::group_sum, 1}, 0, 1, nullptr), Error);
    EXPECT_THROW(row_pipeline(table, {Query::filter_sum, 10001}, 0, 1, nullptr), Error);
  }
  auto table = from_fixture(Engine::batch_soa, Query::filter_sum, facts, {}, budget);
  EXPECT_THROW(batch_scan(table, Query::filter_sum, 0, 2), Error);
  EXPECT_THROW(batch_scan(table, Query::group_sum, 0, 1), Error);
  EXPECT_THROW(batch_filter(nullptr, 5000), Error);
  ExecutionContext context{Engine::batch_soa, 0, 1, budget};
  auto scan = batch_scan(table, Query::filter_sum, 0, 1);
  EXPECT_THROW(scan->open(context), Error);
  auto filter = batch_filter(batch_scan(table, Query::filter_sum, 0, 1), 1);
  for (auto size : {0u, 17u, 1000000u}) {
    context.batch_size = size;
    EXPECT_THROW(filter->open(context), Error);
    filter->close();
    EXPECT_EQ(budget->snapshot().query, 0u);
  }
  auto join_table = from_fixture(Engine::batch_soa, Query::join_group_sum, facts, {}, budget);
  EXPECT_THROW(row_pipeline(join_table, {Query::join_group_sum, 1}, 0, 1, nullptr), Error);
  EXPECT_THROW(batch_pipeline(join_table, {Query::join_group_sum, 1}, 0, 1, nullptr), Error);
}

TEST(Execution, CancellationIsObservedBetweenEmptyPhysicalBatches) {
  struct CancellingSource final : BatchSource {
    std::stop_source stop;
    unsigned calls{};
    std::uint32_t score = 9999;
    void open(ExecutionContext &) override {}
    bool next(Batch &out) override {
      if (++calls > 8)
        return false;
      stop.request_stop();
      out = {};
      out.score = {&score, 1};
      out.physical_count = out.logical_count = 1;
      return true;
    }
    void close() noexcept override {}
  };
  auto budget = memory();
  auto child = std::make_unique<CancellingSource>();
  auto *observed = child.get();
  ExecutionContext context{Engine::batch_soa, 256, 1, budget};
  context.stop = child->stop.get_token();
  auto filter = batch_filter(std::move(child), 0);
  filter->open(context);
  Batch batch;
  EXPECT_FALSE(filter->next(batch));
  EXPECT_EQ(observed->calls, 1u);
  filter->close();
  EXPECT_EQ(budget->snapshot().query, 0u);

  const std::vector<FactRow> facts(513, {0, 0, 1, 0});
  auto table = from_fixture(Engine::batch_soa, Query::filter_sum, facts, {}, budget);
  auto scan = batch_scan(table, Query::filter_sum, 0, facts.size());
  std::stop_source stop;
  context.stop = stop.get_token();
  scan->open(context);
  EXPECT_TRUE(scan->next(batch));
  stop.request_stop();
  EXPECT_FALSE(scan->next(batch));
  scan->close();
}
