#include "calibration.hpp"
#include "options.hpp"
#include <algorithm>
#include <chrono>
#include <cstdio>
#include <fcntl.h>
#include <iostream>
#include <sstream>
#include <sys/resource.h>
#include <unistd.h>

namespace {
using namespace vquery;
using Clock = std::chrono::steady_clock;
class NewFile {
public:
  explicit NewFile(const std::filesystem::path &path) {
    const int fd = ::open(path.c_str(), O_WRONLY | O_CREAT | O_EXCL, 0644);
    if (fd < 0)
      throw Error(ErrorCode::output_failed, "cannot create new output: " + path.string());
    file_ = ::fdopen(fd, "w");
    if (!file_) {
      ::close(fd);
      throw Error(ErrorCode::output_failed, "cannot open output stream");
    }
  }
  ~NewFile() {
    if (file_)
      std::fclose(file_);
  }
  NewFile(const NewFile &) = delete;
  NewFile &operator=(const NewFile &) = delete;
  void write(const std::string &text) {
    if (std::fwrite(text.data(), 1, text.size(), file_) != text.size() || std::fflush(file_) != 0)
      throw Error(ErrorCode::output_failed, "failed to write output");
  }
  void close() {
    if (file_) {
      auto *f = file_;
      file_ = nullptr;
      if (std::fclose(f) != 0)
        throw Error(ErrorCode::output_failed, "failed to close output");
    }
  }

private:
  std::FILE *file_{};
};
void replace_metadata(const std::filesystem::path &path, const std::string &content,
                      const std::string &id) {
  auto temporary = path;
  temporary += ".tmp-" + id;
  NewFile file(temporary);
  file.write(content + "\n");
  file.close();
  std::filesystem::rename(temporary, path);
}
std::string rss() {
  rusage usage{};
  if (getrusage(RUSAGE_SELF, &usage) != 0)
    return "null";
#ifdef __APPLE__
  return std::to_string(static_cast<std::uint64_t>(usage.ru_maxrss));
#else
  return std::to_string(static_cast<std::uint64_t>(usage.ru_maxrss) * 1024);
#endif
}
std::string standard_library() {
#ifdef _LIBCPP_VERSION
  return "libc++ " + std::to_string(_LIBCPP_VERSION);
#elif defined(__GLIBCXX__)
  return "libstdc++ " + std::to_string(__GLIBCXX__);
#else
  return "unavailable";
#endif
}
struct Measurement {
  std::uint64_t ns, checksum, count;
  std::size_t rows, peak;
};
Measurement measure(const cli::Options &options, const Tables &table, ExecutionContext &context) {
  context.budget->reset_query_peak();
  const auto start = Clock::now();
  auto result = execute({options.config.query, options.config.cutoff}, table, context);
  const auto end = Clock::now();
  const auto ns = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
  if (ns <= 0)
    throw Error(ErrorCode::invalid_argument, "query below clock resolution");
  const auto checksum = canonicalize(result);
  if (options.expected_result && checksum != *options.expected_result)
    throw Error(ErrorCode::correctness_failed, "result checksum differs from validation");
  std::uint64_t count = 0;
  for (const auto &r : result.rows)
    count += r.count;
  return {static_cast<std::uint64_t>(ns), checksum, count, result.rows.size(),
          context.budget->snapshot().query_peak};
}
std::string metadata(const cli::Options &o, std::string_view id, std::string_view state,
                     std::string_view status, std::size_t complete, std::size_t k,
                     std::string_view message) {
  std::ostringstream out;
  out << "{\"schema_version\":1,\"run_id\":" << cli::quote(id)
      << ",\"config\":" << cli::config_json(o.config) << ",\"warmup\":" << o.warmup
      << ",\"requested_samples\":" << o.repetitions << ",\"completed_samples\":" << complete
      << ",\"repetitions_in_sample\":" << k
      << ",\"calibration\":\"median warmup; below 10ms target 100ms; max K=10000\""
      << ",\"completion_state\":" << cli::quote(state) << ",\"run_status\":" << cli::quote(status)
      << ",\"validation_status\":"
      << cli::quote(o.expected_result ? "checksums_matched" : "unchecked")
      << ",\"validation_id\":" << (o.validation_id.empty() ? "null" : cli::quote(o.validation_id))
      << ",\"compiler\":" << cli::quote(__VERSION__)
      << ",\"standard_library\":" << cli::quote(standard_library())
      << ",\"fact_row_bytes\":" << sizeof(FactRow)
      << ",\"customer_row_bytes\":" << sizeof(CustomerRow)
      << ",\"clock\":{\"steady\":true,\"period_num\":" << Clock::period::num
      << ",\"period_den\":" << Clock::period::den << "}"
      << ",\"error\":" << (message.empty() ? "null" : cli::quote(message)) << "}";
  return out.str();
}
int run(const cli::Options &options) {
  const auto &c = options.config;
  const auto output_path = std::filesystem::absolute(options.output);
  auto metadata_path = output_path;
  metadata_path += ".meta.json";
  std::filesystem::create_directories(output_path.parent_path());
  if (std::filesystem::exists(metadata_path))
    throw Error(ErrorCode::output_failed, "metadata already exists");
  const auto stamp = std::chrono::duration_cast<std::chrono::nanoseconds>(
                         std::chrono::system_clock::now().time_since_epoch())
                         .count();
  const auto id = std::to_string(stamp) + "-" + std::to_string(getpid());
  NewFile output(output_path);
  {
    NewFile meta(metadata_path);
    meta.write(metadata(options, id, "incomplete", "running", 0, 1, "") + "\n");
    meta.close();
  }
  std::size_t completed = 0, k = 1;
  try {
    auto budget = std::make_shared<MemoryBudget>(c.memory_limit);
    const auto table = generate(c, budget);
    if (options.expected_input && table.input_checksum != *options.expected_input)
      throw Error(ErrorCode::correctness_failed, "input checksum differs from validation");
    ExecutionContext context{c.engine, c.batch_size, c.threads, budget};
    std::vector<std::uint64_t> warmups;
    warmups.reserve(options.warmup);
    for (std::size_t i = 0; i < options.warmup; ++i)
      warmups.push_back(measure(options, table, context).ns);
    k = bench::repetitions_per_sample(warmups);
    for (std::size_t trial = 0; trial < options.repetitions; ++trial) {
      std::uint64_t total = 0;
      std::size_t peak = 0;
      Measurement last{};
      for (std::size_t i = 0; i < k; ++i) {
        last = measure(options, table, context);
        total += last.ns;
        peak = std::max(peak, last.peak);
      }
      const auto config = cli::config_json(c);
      std::ostringstream row;
      row.precision(17);
      row << "{\"schema_version\":1,\"run_id\":" << cli::quote(id) << ",\"trial\":" << trial << ','
          << config.substr(1, config.size() - 2) << ",\"validation_id\":"
          << (options.validation_id.empty() ? "null" : cli::quote(options.validation_id))
          << ",\"input_checksum\":" << cli::quote(hex_checksum(table.input_checksum))
          << ",\"result_checksum\":" << cli::quote(hex_checksum(last.checksum))
          << ",\"repetitions_in_sample\":" << k << ",\"elapsed_ns_total\":" << total
          << ",\"elapsed_ns_per_query\":" << static_cast<double>(total) / static_cast<double>(k)
          << ",\"selected_rows\":"
          << (c.query == Query::join_group_sum ? "null" : std::to_string(last.count))
          << ",\"joined_rows\":"
          << (c.query == Query::join_group_sum ? std::to_string(last.count) : "null")
          << ",\"result_rows\":" << last.rows
          << ",\"managed_input_bytes\":" << budget->snapshot().input
          << ",\"managed_query_peak_bytes\":" << peak << ",\"process_peak_rss_bytes\":" << rss()
          << ",\"validation_status\":"
          << cli::quote(options.expected_result ? "checksums_matched" : "unchecked")
          << ",\"status\":\"ok\",\"metadata_path\":"
          << cli::quote(metadata_path.filename().string()) << "}\n";
      output.write(row.str());
      ++completed;
    }
    output.close();
    replace_metadata(metadata_path, metadata(options, id, "complete", "ok", completed, k, ""), id);
    std::cout << "Wrote " << completed << " samples to " << output_path << '\n' << std::flush;
    if (!std::cout)
      throw Error(ErrorCode::output_failed, "benchmark output failed");
    return 0;
  } catch (...) {
    auto failure = std::current_exception();
    std::string code = "runtime_error", message = "unknown failure";
    try {
      std::rethrow_exception(failure);
    } catch (const Error &e) {
      code = name(e.code());
      message = e.what();
    } catch (const std::bad_alloc &) {
      code = "allocation_failed";
      message = "allocation failed";
    } catch (const std::exception &e) {
      message = e.what();
    } catch (...) {
      // Retain the fallback code/message for non-standard exceptions.
    }
    try {
      output.close();
    } catch (...) {
      // A buffered write may fail again on close; still try to record the failure.
    }
    try {
      replace_metadata(metadata_path, metadata(options, id, "failed", code, completed, k, message),
                       id);
    } catch (...) {
      // Keep the original query/output failure; incomplete metadata is rejected.
    }
    std::rethrow_exception(failure);
  }
}
} // namespace
int main(int argc, char **argv) {
  try {
    auto options = vquery::cli::parse(argc, argv, true);
    if (options.help) {
      std::cout << vquery::cli::help(true) << std::flush;
      if (!std::cout)
        throw vquery::Error(vquery::ErrorCode::output_failed, "help output failed");
      return 0;
    }
    return run(options);
  } catch (...) {
    return vquery::cli::report_exception();
  }
}
