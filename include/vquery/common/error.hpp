#pragma once
#include <stdexcept>
#include <string>
#include <string_view>

namespace vquery {
enum class ErrorCode {
  invalid_argument,
  invalid_input,
  memory_limit,
  allocation_failed,
  worker_failed,
  correctness_failed,
  output_failed
};
inline std::string_view name(ErrorCode code) {
  switch (code) {
  case ErrorCode::invalid_argument:
    return "invalid_argument";
  case ErrorCode::invalid_input:
    return "invalid_input";
  case ErrorCode::memory_limit:
    return "memory_limit";
  case ErrorCode::allocation_failed:
    return "allocation_failed";
  case ErrorCode::worker_failed:
    return "worker_failed";
  case ErrorCode::correctness_failed:
    return "correctness_failed";
  case ErrorCode::output_failed:
    return "output_failed";
  }
  return "unknown";
}
class Error : public std::runtime_error {
public:
  Error(ErrorCode code, const std::string &message) : std::runtime_error(message), code_(code) {}
  ErrorCode code() const noexcept { return code_; }

private:
  ErrorCode code_;
};
} // namespace vquery
