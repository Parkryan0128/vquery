#pragma once
#include "vquery/common/checksum.hpp"
#include <span>

namespace vquery {
struct FactColumns {
  Buffer<std::uint32_t> customer_id, group_id, score;
  Buffer<std::int64_t> amount;
  explicit FactColumns(const std::shared_ptr<MemoryBudget> &budget)
      : customer_id(make_buffer<std::uint32_t>(budget, MemoryCategory::input)),
        group_id(make_buffer<std::uint32_t>(budget, MemoryCategory::input)),
        score(make_buffer<std::uint32_t>(budget, MemoryCategory::input)),
        amount(make_buffer<std::int64_t>(budget, MemoryCategory::input)) {}
};
struct Tables {
  std::shared_ptr<MemoryBudget> budget;
  bool aos;
  Query query;
  std::size_t fact_count{}, customer_count{};
  Buffer<FactRow> facts;
  FactColumns columns;
  Buffer<CustomerRow> customers;
  Buffer<std::uint32_t> customer_keys, regions;
  std::uint64_t input_checksum{};
  Tables(std::shared_ptr<MemoryBudget> memory, Engine engine, Query q);
  Tables(const Tables &) = default;
  Tables(Tables &&) noexcept = default;
  Tables &operator=(Tables &&) noexcept = default;
  Tables &operator=(const Tables &other) {
    // Copy all buffers before replacing either the data or its budget owner.
    if (this != &other) {
      Tables copy(other);
      *this = std::move(copy);
    }
    return *this;
  }
  void allocate(std::size_t n, std::size_t m);
  void set_fact(std::size_t i, const FactRow &row);
  void set_customer(std::size_t i, const CustomerRow &row);
  FactRow fact(std::size_t i) const;
  CustomerRow customer(std::size_t i) const;
  void validate_shape() const;
  void validate_values() const;
  void update_checksum();
};
Tables from_fixture(Engine, Query, std::span<const FactRow>, std::span<const CustomerRow>,
                    std::shared_ptr<MemoryBudget>);
Tables generate(const Config &, std::shared_ptr<MemoryBudget>);
} // namespace vquery
