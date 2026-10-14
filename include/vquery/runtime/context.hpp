#pragma once
#include "vquery/common/types.hpp"
#include <functional>
#include <stop_token>

namespace vquery {
struct ExecutionHooks {
  std::function<void(unsigned)> before_launch;
  std::function<void(unsigned)> before_worker;
};
struct ExecutionContext {
  Engine engine;
  std::size_t batch_size;
  unsigned threads;
  std::shared_ptr<MemoryBudget> budget;
  const ExecutionHooks *hooks = nullptr;
  // Internal worker cancellation, copied into operators during open().
  // execute() supplies its own token; this is not a partial-result public API.
  std::stop_token stop{};
};
struct QuerySpec {
  Query query;
  std::uint32_t cutoff;
};
} // namespace vquery
