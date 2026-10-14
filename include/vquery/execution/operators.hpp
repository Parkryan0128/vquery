#pragma once
#include "vquery/hash/hash_table.hpp"
#include "vquery/runtime/context.hpp"
#include "vquery/storage/tables.hpp"

namespace vquery {
using JoinTable = HashTable<std::uint32_t>;
struct Row {
  std::uint32_t score{}, key{}, customer_id{};
  std::int64_t amount{};
};
struct Batch {
  std::span<const std::uint32_t> score, key, customer_id;
  std::span<const std::int64_t> amount;
  std::span<const std::uint32_t> selection;
  std::size_t physical_count{}, logical_count{};
  std::size_t position(std::size_t i) const noexcept {
    return selection.empty() ? i : selection[i];
  }
};
struct RowSource {
  virtual ~RowSource() = default;
  virtual void open(ExecutionContext &) = 0;
  virtual bool next(Row &) = 0;
  virtual void close() noexcept = 0;
};
struct BatchSource {
  virtual ~BatchSource() = default;
  virtual void open(ExecutionContext &) = 0;
  virtual bool next(Batch &) = 0;
  virtual void close() noexcept = 0;
};
std::unique_ptr<RowSource> row_pipeline(const Tables &, QuerySpec, std::size_t, std::size_t,
                                        const JoinTable *);
std::unique_ptr<BatchSource> batch_scan(const Tables &, Query, std::size_t, std::size_t);
std::unique_ptr<BatchSource> batch_filter(std::unique_ptr<BatchSource>, std::uint32_t);
std::unique_ptr<BatchSource> batch_pipeline(const Tables &, QuerySpec, std::size_t, std::size_t,
                                            const JoinTable *);
QueryResult execute(QuerySpec, const Tables &, ExecutionContext &);
} // namespace vquery
