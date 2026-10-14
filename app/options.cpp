#include "options.hpp"
#include <algorithm>
#include <charconv>
#include <iostream>
#include <map>
#include <set>

namespace vquery::cli {
namespace {
std::uint64_t integer(std::string_view value, int base = 10) {
  std::uint64_t number{};
  const auto [end, ec] = std::from_chars(value.data(), value.data() + value.size(), number, base);
  if (ec != std::errc{} || end != value.data() + value.size())
    throw Error(ErrorCode::invalid_argument, "invalid unsigned integer: " + std::string(value));
  return number;
}
std::uint32_t narrow(std::uint64_t n) {
  if (n > UINT32_MAX)
    throw Error(ErrorCode::invalid_argument, "integer exceeds uint32 range");
  return static_cast<std::uint32_t>(n);
}
std::uint32_t rate(std::string_view s) {
  const auto dot = s.find('.');
  const auto whole = s.substr(0, dot);
  const auto fraction = dot == std::string_view::npos ? std::string_view{} : s.substr(dot + 1);
  if ((whole != "0" && whole != "1") || fraction.size() > 4 ||
      (dot != std::string_view::npos && fraction.empty()))
    throw Error(ErrorCode::invalid_argument, "match rate must be 0..1 with at most four decimals");
  std::uint64_t part = fraction.empty() ? 0 : integer(fraction);
  for (std::size_t i = fraction.size(); i < 4; ++i)
    part *= 10;
  const auto bps = integer(whole) * 10000 + part;
  if (bps > 10000)
    throw Error(ErrorCode::invalid_argument, "match rate exceeds one");
  return static_cast<std::uint32_t>(bps);
}
} // namespace
Options parse(int argc, char **argv, bool benchmark) {
  Options o;
  std::map<std::string, std::string> args;
  std::set<std::string> allowed{"query",  "engine",     "rows",       "dim-rows",
                                "groups", "cutoff",     "match-rate", "distribution",
                                "seed",   "batch-size", "threads",    "memory-limit-mib"};
  if (benchmark)
    for (auto key : {"warmup", "repetitions", "output", "expected-input-checksum",
                     "expected-result-checksum", "validation-id"})
      allowed.insert(key);
  else
    allowed.insert("format");
  for (int i = 1; i < argc; ++i) {
    std::string key = argv[i];
    if (key == "--help") {
      o.help = true;
      continue;
    }
    if (!key.starts_with("--") || !allowed.contains(key.substr(2)))
      throw Error(ErrorCode::invalid_argument, "unknown option: " + key);
    if (i + 1 >= argc || std::string_view(argv[i + 1]).starts_with("--"))
      throw Error(ErrorCode::invalid_argument, "missing option value: " + key);
    if (!args.emplace(key.substr(2), argv[++i]).second)
      throw Error(ErrorCode::invalid_argument, "duplicate option: " + key);
  }
  if (o.help)
    return o;
  if (!args.contains("query") || !args.contains("engine"))
    throw Error(ErrorCode::invalid_argument, "--query and --engine are required; see --help");
  auto &c = o.config;
  if (args["query"] == "filter-sum")
    c.query = Query::filter_sum;
  else if (args["query"] == "group-sum")
    c.query = Query::group_sum;
  else if (args["query"] == "join-group-sum")
    c.query = Query::join_group_sum;
  else
    throw Error(ErrorCode::invalid_argument, "unknown query");
  if (args["engine"] == "row-aos")
    c.engine = Engine::row_aos;
  else if (args["engine"] == "row-soa")
    c.engine = Engine::row_soa;
  else if (args["engine"] == "batch-soa")
    c.engine = Engine::batch_soa;
  else
    throw Error(ErrorCode::invalid_argument, "unknown engine");
  if (c.engine != Engine::batch_soa && args.contains("batch-size"))
    throw Error(ErrorCode::invalid_argument, "batch-size only applies to batch-soa");
  if (c.query != Query::group_sum && args.contains("groups"))
    throw Error(ErrorCode::invalid_argument, "groups only applies to group-sum");
  if (c.query != Query::join_group_sum &&
      (args.contains("dim-rows") || args.contains("match-rate")))
    throw Error(ErrorCode::invalid_argument, "join options only apply to join-group-sum");
  if (c.query == Query::filter_sum && args.contains("distribution"))
    throw Error(ErrorCode::invalid_argument, "distribution does not apply to filter-sum");
  for (const auto &[key, value] : args) {
    if (key == "rows")
      c.rows = integer(value);
    else if (key == "dim-rows")
      c.dim_rows = integer(value);
    else if (key == "groups")
      c.groups = narrow(integer(value));
    else if (key == "cutoff")
      c.cutoff = narrow(integer(value));
    else if (key == "match-rate")
      c.match_rate_bps = rate(value);
    else if (key == "seed")
      c.seed = integer(value);
    else if (key == "batch-size")
      c.batch_size = integer(value);
    else if (key == "threads")
      c.threads = narrow(integer(value));
    else if (key == "memory-limit-mib") {
      auto mib = integer(value);
      if (mib > SIZE_MAX / (1024 * 1024))
        throw Error(ErrorCode::invalid_argument, "memory limit overflow");
      c.memory_limit = mib * 1024 * 1024;
    } else if (key == "distribution") {
      if (value == "uniform")
        c.distribution = Distribution::uniform;
      else if (value == "hot-key-90")
        c.distribution = Distribution::hot_key_90;
      else
        throw Error(ErrorCode::invalid_argument, "unsupported distribution");
    } else if (key == "format") {
      if (value != "text" && value != "json")
        throw Error(ErrorCode::invalid_argument, "format must be text or json");
      o.json = value == "json";
    } else if (key == "warmup")
      o.warmup = integer(value);
    else if (key == "repetitions")
      o.repetitions = integer(value);
    else if (key == "output")
      o.output = value;
    else if (key == "expected-input-checksum" || key == "expected-result-checksum") {
      if (value.size() != 16)
        throw Error(ErrorCode::invalid_argument, "checksums require 16 hex digits");
      auto checksum = integer(value, 16);
      if (key == "expected-input-checksum")
        o.expected_input = checksum;
      else
        o.expected_result = checksum;
    } else if (key == "validation-id") {
      if (value.size() != 64 || !std::all_of(value.begin(), value.end(), [](unsigned char x) {
            return (x >= '0' && x <= '9') || (x >= 'a' && x <= 'f');
          }))
        throw Error(ErrorCode::invalid_argument, "validation-id requires 64 lowercase hex digits");
      o.validation_id = value;
    }
  }
  validate_config(c);
  if (o.repetitions == 0)
    throw Error(ErrorCode::invalid_argument, "repetitions must be positive");
  const auto tuple_count = unsigned(o.expected_input.has_value()) +
                           unsigned(o.expected_result.has_value()) +
                           unsigned(!o.validation_id.empty());
  if (tuple_count != 0 && tuple_count != 3)
    throw Error(ErrorCode::invalid_argument, "validation flags must be supplied together");
  if (benchmark && o.output.empty())
    throw Error(ErrorCode::invalid_argument, "benchmark requires --output");
  return o;
}
std::string help(bool benchmark) {
  return std::string(benchmark ? "vquery_bench" : "vquery") +
         R"( --query NAME --engine NAME [options]
  Queries: filter-sum, group-sum, join-group-sum
  Engines: row-aos, row-soa, batch-soa
  --rows N                  Fact rows (default 1000000)
  --cutoff N                score < cutoff, 0..10000 (default 5000)
  --groups N                Q2 key domain (default 1024)
  --dim-rows N              Q3 build rows (default 100000)
  --match-rate P            Q3 match probability, up to four decimals
  --distribution NAME       Q2/Q3: uniform or hot-key-90
  --seed N                  Unsigned 64-bit seed (default 42)
  --batch-size N            Batch engine: 256,512,1024,2048,4096,8192
  --threads N               Batch engine: 1,2,4; row engines: 1
  --memory-limit-mib N      Managed buffer budget (default 4096)
)" +
         (benchmark
              ? R"(  --output PATH             New JSONL file (required; existing files rejected)
  --warmup N                Warmup queries (default 3)
  --repetitions N           Measured samples (default 15)
  --expected-input-checksum HEX --expected-result-checksum HEX --validation-id HEX
                            Validation tuple, supplied by scripts/run_bench.py
)"
              : "  --format text|json        Result output (default text)\n");
}
int report_exception() {
  try {
    throw;
  } catch (const Error &e) {
    std::cerr << error_json(name(e.code()), e.what()) << '\n';
  } catch (const std::bad_alloc &) {
    std::cerr << error_json("allocation_failed", "allocation failed") << '\n';
  } catch (const std::exception &e) {
    std::cerr << error_json("runtime_error", e.what()) << '\n';
  } catch (...) {
    std::cerr << error_json("runtime_error", "unknown failure") << '\n';
  }
  return 1;
}
} // namespace vquery::cli
