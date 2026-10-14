#pragma once
#include "vquery/common/checksum.hpp"
#include <limits>

namespace vquery {
template <class Value, class Hash = KeyHash> class HashTable {
public:
  explicit HashTable(std::shared_ptr<MemoryBudget> budget, std::size_t capacity = 1024)
      : budget_(std::move(budget)), keys_(make_buffer<std::uint32_t>(budget_)),
        values_(make_buffer<Value>(budget_)), occupied_(make_buffer<std::uint8_t>(budget_)) {
    if (!capacity || (capacity & (capacity - 1)))
      throw Error(ErrorCode::invalid_argument, "hash capacity must be a power of two");
    rehash(capacity);
  }
  HashTable(const HashTable &) = default;
  HashTable(HashTable &&) = default;
  HashTable &operator=(HashTable &&) = default;
  HashTable &operator=(const HashTable &other) {
    // Buffer copy assignment alone would retain the destination's old allocator.
    if (this != &other) {
      HashTable copy(other);
      *this = std::move(copy);
    }
    return *this;
  }
  static std::size_t capacity_for(std::size_t entries) {
    std::size_t cap = 1;
    while (entries > load_limit(cap))
      cap = doubled(cap);
    return cap;
  }
  const Value *find(std::uint32_t key) const noexcept {
    const auto slot = locate(key);
    return occupied_[slot] ? &values_[slot] : nullptr;
  }
  Value &find_or_insert(std::uint32_t key) {
    auto slot = locate(key);
    if (occupied_[slot])
      return values_[slot];
    if (size_ + 1 > load_limit(capacity())) {
      rehash(doubled(capacity()));
      slot = locate(key);
    }
    occupied_[slot] = 1;
    keys_[slot] = key;
    values_[slot] = Value{};
    ++size_;
    return values_[slot];
  }
  // Copy before growth: the caller may pass a value already stored in this table.
  void insert_unique(std::uint32_t key, Value value) {
    if (find(key))
      throw Error(ErrorCode::invalid_input, "duplicate dimension key");
    find_or_insert(key) = value;
  }
  template <class Fn> void for_each(Fn &&fn) const {
    for (std::size_t i = 0; i < capacity(); ++i)
      if (occupied_[i])
        fn(keys_[i], values_[i]);
  }
  std::size_t size() const noexcept { return size_; }
  std::size_t capacity() const noexcept { return keys_.size(); }

private:
  static std::size_t load_limit(std::size_t cap) noexcept {
    return (cap / 10) * 7 + ((cap % 10) * 7) / 10;
  }
  static std::size_t doubled(std::size_t cap) {
    if (cap > std::numeric_limits<std::size_t>::max() / 2)
      throw Error(ErrorCode::allocation_failed, "hash capacity overflow");
    return cap * 2;
  }
  std::size_t locate(std::uint32_t key) const noexcept {
    auto slot = static_cast<std::size_t>(hash_(key)) & (capacity() - 1);
    while (occupied_[slot] && keys_[slot] != key)
      slot = (slot + 1) & (capacity() - 1);
    return slot;
  }
  void rehash(std::size_t cap) {
    auto keys = make_buffer<std::uint32_t>(budget_);
    auto values = make_buffer<Value>(budget_);
    auto used = make_buffer<std::uint8_t>(budget_);
    keys.resize(cap);
    values.resize(cap);
    used.resize(cap);
    for_each([&](std::uint32_t key, const Value &value) {
      auto slot = static_cast<std::size_t>(hash_(key)) & (cap - 1);
      while (used[slot])
        slot = (slot + 1) & (cap - 1);
      used[slot] = 1;
      keys[slot] = key;
      values[slot] = value;
    });
    keys_.swap(keys);
    values_.swap(values);
    occupied_.swap(used);
  }
  std::shared_ptr<MemoryBudget> budget_;
  Buffer<std::uint32_t> keys_;
  Buffer<Value> values_;
  Buffer<std::uint8_t> occupied_;
  std::size_t size_{};
  Hash hash_;
};
} // namespace vquery
