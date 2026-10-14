#pragma once
#include "vquery/common/types.hpp"
#include <algorithm>
#include <iomanip>
#include <sstream>

namespace vquery {
inline constexpr unsigned generator_version = 1, serialization_version = 1;
inline std::uint64_t mix64(std::uint64_t x) noexcept {
  x = (x ^ (x >> 30)) * UINT64_C(0xbf58476d1ce4e5b9);
  x = (x ^ (x >> 27)) * UINT64_C(0x94d049bb133111eb);
  return x ^ (x >> 31);
}
struct KeyHash {
  std::uint64_t operator()(std::uint32_t key) const noexcept {
    return mix64(std::uint64_t(key) ^ UINT64_C(0xd6e8feb86659fd93));
  }
};
class Checksum {
public:
  void byte(std::uint8_t x) noexcept {
    value_ ^= x;
    value_ *= UINT64_C(1099511628211);
  }
  void u32(std::uint32_t x) noexcept {
    for (unsigned i = 0; i < 4; ++i) {
      byte(static_cast<std::uint8_t>(x));
      x >>= 8;
    }
  }
  void u64(std::uint64_t x) noexcept {
    for (unsigned i = 0; i < 8; ++i) {
      byte(static_cast<std::uint8_t>(x));
      x >>= 8;
    }
  }
  void text(std::string_view value) {
    u64(value.size());
    for (auto c : value)
      byte(static_cast<std::uint8_t>(c));
  }
  std::uint64_t value() const noexcept { return value_; }

private:
  std::uint64_t value_ = UINT64_C(14695981039346656037);
};
inline std::string hex_checksum(std::uint64_t value) {
  std::ostringstream out;
  out << std::hex << std::setfill('0') << std::setw(16) << value;
  return out.str();
}
inline std::uint64_t canonicalize(QueryResult &result) {
  std::sort(result.rows.begin(), result.rows.end(),
            [](const auto &a, const auto &b) { return a.key < b.key; });
  Checksum sum;
  sum.text("vquery-result-v1");
  sum.text(name(result.query));
  sum.u64(result.rows.size());
  for (const auto &row : result.rows) {
    if (result.query != Query::filter_sum)
      sum.u32(row.key);
    sum.u64(row.count);
    sum.u64(static_cast<std::uint64_t>(row.sum));
  }
  return sum.value();
}
} // namespace vquery
