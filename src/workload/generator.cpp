#include "vquery/storage/tables.hpp"
#include <array>
#include <random>

namespace vquery {
namespace {
std::uint64_t sample(std::mt19937_64 &rng, std::uint64_t bound) {
  // Reject the incomplete low interval; unsigned negation wraps by definition.
  const auto threshold = (std::uint64_t{0} - bound) % bound;
  std::uint64_t x;
  do {
    x = rng();
  } while (x < threshold);
  return x % bound;
}
} // namespace
Tables generate(const Config &c, std::shared_ptr<MemoryBudget> budget) {
  validate_config(c);
  Tables table(std::move(budget), c.engine, c.query);
  const bool join = c.query == Query::join_group_sum, group = c.query == Query::group_sum;
  const std::uint64_t m = join ? c.dim_rows : 100'000, groups = group ? c.groups : 1024;
  const auto match_bps = join ? c.match_rate_bps : 10000;
  const bool group_hot = group && c.distribution == Distribution::hot_key_90;
  const bool join_hot = join && c.distribution == Distribution::hot_key_90;
  table.allocate(c.rows, join ? c.dim_rows : 0);
  // Stream IDs: score, amount, group uniform, group skew decision, group tail,
  // match decision, match uniform, match skew decision, match tail, nonmatch, region.
  std::array<std::mt19937_64, 11> streams;
  for (std::size_t i = 0; i < streams.size(); ++i)
    streams[i].seed(mix64(c.seed ^ (UINT64_C(0x9e3779b97f4a7c15) * (i + 1))));
  for (std::size_t i = 0; i < c.rows; ++i) {
    const auto score = sample(streams[0], 10000), amount = sample(streams[1], 1'000'001);
    const auto gu = sample(streams[2], groups), gh = sample(streams[3], 10000),
               gt = sample(streams[4], groups > 1 ? groups - 1 : 1);
    const auto md = sample(streams[5], 10000), mu = sample(streams[6], m ? m : 1);
    const auto mh = sample(streams[7], 10000), mt = sample(streams[8], m > 1 ? m - 1 : 1);
    const auto missing = m + sample(streams[9], (UINT64_C(1) << 32) - m);
    const auto gid = group_hot ? (groups == 1 || gh < 9000 ? 0 : 1 + gt) : gu;
    const auto matched = join_hot ? (m <= 1 || mh < 9000 ? 0 : 1 + mt) : mu;
    table.set_fact(i, {static_cast<std::uint32_t>(md < match_bps ? matched : missing),
                       static_cast<std::uint32_t>(gid), static_cast<std::int64_t>(amount),
                       static_cast<std::uint32_t>(score)});
  }
  for (std::size_t i = 0; i < table.customer_count; ++i)
    table.set_customer(
        i, {static_cast<std::uint32_t>(i), static_cast<std::uint32_t>(sample(streams[10], 16))});
  table.update_checksum();
  return table;
}
} // namespace vquery
