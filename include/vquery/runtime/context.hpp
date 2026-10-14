#pragma once
#include "vquery/common/types.hpp"
#include <functional>

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
};
struct QuerySpec {
  Query query;
  std::uint32_t cutoff;
};
} // namespace vquery
