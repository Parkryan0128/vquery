#pragma once
#include "vquery/common/error.hpp"
#include <array>
#include <cstddef>
#include <limits>
#include <memory>
#include <mutex>
#include <type_traits>
#include <utility>
#include <vector>

namespace vquery {
enum class MemoryCategory : std::size_t { input, query };
struct MemorySnapshot {
  std::size_t input{}, query{}, query_peak{}, total{};
};
class MemoryBudget {
public:
  explicit MemoryBudget(std::size_t limit) : limit_(limit) {}
  void reserve(std::size_t bytes, MemoryCategory category);
  void release(std::size_t bytes, MemoryCategory category) noexcept;
  MemorySnapshot snapshot() const;
  void reset_query_peak();
  // Deterministic allocation-failure injection; not exposed by the CLI.
  void fail_after(std::size_t successful_allocations);

private:
  mutable std::mutex mutex_;
  std::size_t limit_, total_{}, query_peak_{};
  std::array<std::size_t, 2> live_{};
  std::size_t allocations_left_ = std::numeric_limits<std::size_t>::max();
};

template <class T> class BudgetAllocator {
public:
  using value_type = T;
  using is_always_equal = std::false_type;
  using propagate_on_container_copy_assignment = std::false_type;
  using propagate_on_container_move_assignment = std::true_type;
  using propagate_on_container_swap = std::true_type;
  BudgetAllocator() : budget_(std::make_shared<MemoryBudget>(0)) {}
  BudgetAllocator(std::shared_ptr<MemoryBudget> budget, MemoryCategory category)
      : budget_(std::move(budget)), category_(category) {
    if (!budget_)
      throw Error(ErrorCode::invalid_argument, "null memory budget");
  }
  BudgetAllocator(const BudgetAllocator &) noexcept = default;
  BudgetAllocator &operator=(const BudgetAllocator &) noexcept = default;
  // Retain a usable allocator in moved-from containers, too.
  BudgetAllocator(BudgetAllocator &&other) noexcept
      : budget_(other.budget_), category_(other.category_) {}
  BudgetAllocator &operator=(BudgetAllocator &&other) noexcept {
    budget_ = other.budget_;
    category_ = other.category_;
    return *this;
  }
  template <class U>
  BudgetAllocator(const BudgetAllocator<U> &other) noexcept
      : budget_(other.budget_), category_(other.category_) {}
  T *allocate(std::size_t n) {
    if (n > std::numeric_limits<std::size_t>::max() / sizeof(T))
      throw Error(ErrorCode::allocation_failed, "allocation size overflow");
    const auto bytes = n * sizeof(T);
    budget_->reserve(bytes, category_);
    try {
      return std::allocator<T>{}.allocate(n);
    } catch (...) {
      budget_->release(bytes, category_);
      throw;
    }
  }
  void deallocate(T *p, std::size_t n) noexcept {
    std::allocator<T>{}.deallocate(p, n);
    budget_->release(n * sizeof(T), category_);
  }
  template <class U> bool operator==(const BudgetAllocator<U> &other) const noexcept {
    return budget_ == other.budget_ && category_ == other.category_;
  }
  friend void swap(BudgetAllocator &a, BudgetAllocator &b) noexcept {
    using std::swap;
    swap(a.budget_, b.budget_);
    swap(a.category_, b.category_);
  }

private:
  template <class> friend class BudgetAllocator;
  std::shared_ptr<MemoryBudget> budget_;
  MemoryCategory category_ = MemoryCategory::query;
};
template <class T> using Buffer = std::vector<T, BudgetAllocator<T>>;
template <class T>
Buffer<T> make_buffer(const std::shared_ptr<MemoryBudget> &budget,
                      MemoryCategory category = MemoryCategory::query) {
  return Buffer<T>(BudgetAllocator<T>(budget, category));
}
} // namespace vquery
