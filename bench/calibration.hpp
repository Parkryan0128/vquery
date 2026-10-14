#pragma once
#include "vquery/common/error.hpp"
#include <algorithm>
#include <cstdint>
#include <span>

namespace vquery::bench {
// Warmup durations are nanoseconds. Sort in place; keep K fixed for the run.
inline std::size_t repetitions_per_sample(std::span<std::uint64_t> warmups) {
  if (warmups.empty())
    return 1;
  std::sort(warmups.begin(), warmups.end());
  const auto middle = warmups.size() / 2;
  auto median = warmups[middle];
  if (warmups.size() % 2 == 0)
    median = warmups[middle - 1] + (median - warmups[middle - 1]) / 2;
  if (median == 0)
    throw Error(ErrorCode::invalid_argument, "query below clock resolution");
  if (median >= 10'000'000)
    return 1;
  const auto k = (100'000'000 + median - 1) / median;
  if (k > 10000)
    throw Error(ErrorCode::invalid_argument,
                "automatic calibration exceeds 10000 queries per sample; increase rows or "
                "use --warmup 0 for exploration");
  return static_cast<std::size_t>(k);
}
} // namespace vquery::bench
