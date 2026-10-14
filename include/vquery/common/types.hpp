#pragma once
#include "vquery/common/memory.hpp"
#include <cstdint>
#include <string_view>

namespace vquery {
enum class Engine { row_aos, row_soa, batch_soa };
enum class Query { filter_sum, group_sum, join_group_sum };
enum class Distribution { uniform, hot_key_90 };
inline std::string_view name(Engine v) {
  switch (v) {
  case Engine::row_aos:
    return "row-aos";
  case Engine::row_soa:
    return "row-soa";
  case Engine::batch_soa:
    return "batch-soa";
  }
  return "unknown";
}
inline std::string_view name(Query v) {
  switch (v) {
  case Query::filter_sum:
    return "filter-sum";
  case Query::group_sum:
    return "group-sum";
  case Query::join_group_sum:
    return "join-group-sum";
  }
  return "unknown";
}
inline std::string_view name(Distribution v) {
  return v == Distribution::uniform ? "uniform" : "hot-key-90";
}
struct Config {
  Engine engine = Engine::batch_soa;
  Query query = Query::filter_sum;
  std::size_t rows = 1'000'000, dim_rows = 100'000;
  std::uint32_t groups = 1024, cutoff = 5000, match_rate_bps = 10000;
  Distribution distribution = Distribution::uniform;
  std::uint64_t seed = 42;
  std::size_t batch_size = 2048;
  unsigned threads = 1;
  std::size_t memory_limit = std::size_t{4096} * 1024 * 1024;
};
struct FactRow {
  std::uint32_t customer_id, group_id;
  std::int64_t amount;
  std::uint32_t score;
};
struct CustomerRow {
  std::uint32_t customer_id, region_id;
};
struct Aggregate {
  std::uint64_t count{};
  std::int64_t sum{};
};
struct ResultRow {
  std::uint32_t key{};
  std::uint64_t count{};
  std::int64_t sum{};
  bool operator==(const ResultRow &) const = default;
};
struct QueryResult {
  Query query;
  Buffer<ResultRow> rows;
};
inline void validate_batch_size(std::size_t size) {
  if (size < 256 || size > 8192 || (size & (size - 1)) != 0)
    throw Error(ErrorCode::invalid_argument, "unsupported batch size");
}
void validate_config(const Config &);
} // namespace vquery
