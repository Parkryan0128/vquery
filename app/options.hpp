#pragma once
#include "vquery/execution/operators.hpp"
#include <filesystem>
#include <optional>
#include <string>

namespace vquery::cli {
struct Options {
  Config config;
  bool help = false, json = false;
  std::size_t warmup = 3, repetitions = 15;
  std::filesystem::path output;
  std::optional<std::uint64_t> expected_input, expected_result;
  std::string validation_id;
};
Options parse(int argc, char **argv, bool benchmark);
std::string help(bool benchmark);
std::string quote(std::string_view);
std::string config_json(const Config &);
std::string result_json(const Config &, const Tables &, QueryResult &, std::uint64_t);
std::string error_json(std::string_view, std::string_view);
int report_exception();
} // namespace vquery::cli
