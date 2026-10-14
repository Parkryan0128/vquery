#include "options.hpp"
#include <sstream>

namespace vquery::cli {
std::string quote(std::string_view text) {
  std::ostringstream out;
  out << '"';
  constexpr char hex[] = "0123456789abcdef";
  for (unsigned char c : text) {
    if (c == '"' || c == '\\')
      out << '\\' << c;
    else if (c < 32)
      out << "\\u00" << hex[c >> 4] << hex[c & 15];
    else
      out << c;
  }
  out << '"';
  return out.str();
}
std::string config_json(const Config &c) {
  const bool group = c.query == Query::group_sum, join = c.query == Query::join_group_sum;
  std::ostringstream out;
  out << "{\"engine\":" << quote(name(c.engine)) << ",\"query\":" << quote(name(c.query))
      << ",\"rows\":" << c.rows << ",\"cutoff\":" << c.cutoff << ",\"seed\":" << c.seed
      << ",\"groups\":" << (group ? std::to_string(c.groups) : "null")
      << ",\"dim_rows\":" << (join ? std::to_string(c.dim_rows) : "null")
      << ",\"match_rate_bps\":" << (join ? std::to_string(c.match_rate_bps) : "null")
      << ",\"distribution\":" << (group || join ? quote(name(c.distribution)) : "null")
      << ",\"batch_size\":"
      << (c.engine == Engine::batch_soa ? std::to_string(c.batch_size) : "null")
      << ",\"threads\":" << c.threads << ",\"memory_limit_bytes\":" << c.memory_limit
      << ",\"generator_version\":" << generator_version
      << ",\"serialization_version\":" << serialization_version << "}";
  return out.str();
}
std::string result_json(const Config &c, const Tables &table, QueryResult &result,
                        std::uint64_t checksum) {
  std::uint64_t selected = 0, matched = 0;
  for (std::size_t i = 0; i < table.fact_count; ++i)
    if (table.fact(i).score < c.cutoff)
      ++selected;
  for (const auto &r : result.rows)
    matched += r.count;
  std::ostringstream out;
  out << "{\"schema_version\":1,\"config\":" << config_json(c)
      << ",\"input_checksum\":" << quote(hex_checksum(table.input_checksum))
      << ",\"result_checksum\":" << quote(hex_checksum(checksum))
      << ",\"selected_rows\":" << selected << ",\"joined_rows\":"
      << (c.query == Query::join_group_sum ? std::to_string(matched) : "null") << ",\"rows\":[";
  bool first = true;
  for (const auto &r : result.rows) {
    if (!first)
      out << ',';
    first = false;
    out << "{\"key\":" << (c.query == Query::filter_sum ? "null" : std::to_string(r.key))
        << ",\"count\":" << r.count << ",\"sum\":" << r.sum << '}';
  }
  out << "]}";
  return out.str();
}
std::string error_json(std::string_view code, std::string_view message) {
  return "{\"status\":" + quote(code) + ",\"error\":" + quote(message) + "}";
}
} // namespace vquery::cli
