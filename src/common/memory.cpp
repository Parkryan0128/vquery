#include "vquery/common/memory.hpp"
#include <algorithm>
#include <cassert>

namespace vquery {
void MemoryBudget::reserve(std::size_t bytes, MemoryCategory category) {
  std::lock_guard guard(mutex_);
  if (bytes > limit_ - total_)
    throw Error(ErrorCode::memory_limit, "managed memory budget exceeded");
  if (allocations_left_ == 0)
    throw std::bad_alloc();
  if (allocations_left_ != std::numeric_limits<std::size_t>::max())
    --allocations_left_;
  total_ += bytes;
  live_[static_cast<std::size_t>(category)] += bytes;
  query_peak_ = std::max(query_peak_, live_[1]);
}
void MemoryBudget::release(std::size_t bytes, MemoryCategory category) noexcept {
  std::lock_guard guard(mutex_);
  auto &live = live_[static_cast<std::size_t>(category)];
  assert(live >= bytes && total_ >= bytes);
  live -= bytes;
  total_ -= bytes;
}
MemorySnapshot MemoryBudget::snapshot() const {
  std::lock_guard guard(mutex_);
  return {live_[0], live_[1], query_peak_, total_};
}
void MemoryBudget::reset_query_peak() {
  std::lock_guard guard(mutex_);
  if (live_[1] != 0)
    throw Error(ErrorCode::invalid_argument, "previous query buffers are still alive");
  query_peak_ = 0;
}
void MemoryBudget::fail_after(std::size_t n) {
  std::lock_guard guard(mutex_);
  allocations_left_ = n;
}
} // namespace vquery
