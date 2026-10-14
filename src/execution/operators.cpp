#include "vquery/execution/operators.hpp"
#include <algorithm>

namespace vquery {
namespace {
template <bool Aos, Query Q> class ScanRow final : public RowSource {
public:
  ScanRow(const Tables &t, std::size_t begin, std::size_t end)
      : table_(t), begin_(begin), end_(end) {}
  void open(ExecutionContext &) override { at_ = begin_; }
  bool next(Row &out) override {
    if (at_ == end_)
      return false;
    if constexpr (Aos) {
      const auto &r = table_.facts[at_];
      out.score = r.score;
      out.amount = r.amount;
      if constexpr (Q == Query::group_sum)
        out.key = r.group_id;
      if constexpr (Q == Query::join_group_sum)
        out.customer_id = r.customer_id;
    } else {
      out.score = table_.columns.score[at_];
      out.amount = table_.columns.amount[at_];
      if constexpr (Q == Query::group_sum)
        out.key = table_.columns.group_id[at_];
      if constexpr (Q == Query::join_group_sum)
        out.customer_id = table_.columns.customer_id[at_];
    }
    ++at_;
    return true;
  }
  void close() noexcept override { at_ = end_; }

private:
  const Tables &table_;
  std::size_t begin_, end_, at_{};
};
class FilterRow final : public RowSource {
public:
  FilterRow(std::unique_ptr<RowSource> child, std::uint32_t cutoff)
      : child_(std::move(child)), cutoff_(cutoff) {}
  void open(ExecutionContext &context) override { child_->open(context); }
  bool next(Row &out) override {
    while (child_->next(out))
      if (out.score < cutoff_)
        return true;
    return false;
  }
  void close() noexcept override { child_->close(); }

private:
  std::unique_ptr<RowSource> child_;
  std::uint32_t cutoff_;
};
class JoinRow final : public RowSource {
public:
  JoinRow(std::unique_ptr<RowSource> child, const JoinTable &join)
      : child_(std::move(child)), join_(join) {}
  void open(ExecutionContext &context) override { child_->open(context); }
  bool next(Row &out) override {
    while (child_->next(out)) {
      if (auto region = join_.find(out.customer_id)) {
        out.key = *region;
        return true;
      }
    }
    return false;
  }
  void close() noexcept override { child_->close(); }

private:
  std::unique_ptr<RowSource> child_;
  const JoinTable &join_;
};
class ScanBatch final : public BatchSource {
public:
  ScanBatch(const Tables &t, Query q, std::size_t begin, std::size_t end)
      : table_(t), query_(q), begin_(begin), end_(end) {}
  void open(ExecutionContext &context) override {
    at_ = begin_;
    batch_size_ = context.batch_size;
  }
  bool next(Batch &out) override {
    if (at_ == end_)
      return false;
    const auto n = std::min(batch_size_, end_ - at_);
    out = {};
    out.score = std::span(table_.columns.score).subspan(at_, n);
    out.amount = std::span(table_.columns.amount).subspan(at_, n);
    if (query_ == Query::group_sum)
      out.key = std::span(table_.columns.group_id).subspan(at_, n);
    if (query_ == Query::join_group_sum)
      out.customer_id = std::span(table_.columns.customer_id).subspan(at_, n);
    out.physical_count = out.logical_count = n;
    at_ += n;
    return true;
  }
  void close() noexcept override { at_ = end_; }

private:
  const Tables &table_;
  Query query_;
  std::size_t begin_, end_, at_{}, batch_size_{};
};
class FilterBatch final : public BatchSource {
public:
  FilterBatch(std::unique_ptr<BatchSource> child, std::uint32_t cutoff)
      : child_(std::move(child)), cutoff_(cutoff) {}
  void open(ExecutionContext &context) override {
    selected_ = make_buffer<std::uint32_t>(context.budget);
    selected_.resize(context.batch_size);
    child_->open(context);
  }
  bool next(Batch &out) override {
    Batch in;
    while (child_->next(in)) {
      std::size_t count = 0;
      for (std::size_t i = 0; i < in.logical_count; ++i) {
        const auto p = in.position(i);
        if (in.score[p] < cutoff_)
          selected_[count++] = static_cast<std::uint32_t>(p);
      }
      if (!count)
        continue;
      out = in;
      out.logical_count = count;
      out.selection = {selected_.data(), count};
      return true;
    }
    return false;
  }
  void close() noexcept override {
    child_->close();
    Buffer<std::uint32_t> empty(selected_.get_allocator());
    selected_.swap(empty);
  }

private:
  std::unique_ptr<BatchSource> child_;
  std::uint32_t cutoff_;
  Buffer<std::uint32_t> selected_;
};
class JoinBatch final : public BatchSource {
public:
  JoinBatch(std::unique_ptr<BatchSource> child, const JoinTable &join)
      : child_(std::move(child)), join_(join) {}
  void open(ExecutionContext &context) override {
    keys_ = make_buffer<std::uint32_t>(context.budget);
    amounts_ = make_buffer<std::int64_t>(context.budget);
    keys_.resize(context.batch_size);
    amounts_.resize(context.batch_size);
    child_->open(context);
  }
  bool next(Batch &out) override {
    Batch in;
    while (child_->next(in)) {
      std::size_t count = 0;
      for (std::size_t i = 0; i < in.logical_count; ++i) {
        const auto p = in.position(i);
        if (auto value = join_.find(in.customer_id[p])) {
          keys_[count] = *value;
          amounts_[count] = in.amount[p];
          ++count;
        }
      }
      if (!count)
        continue;
      out = {};
      out.key = {keys_.data(), count};
      out.amount = {amounts_.data(), count};
      out.physical_count = out.logical_count = count;
      return true;
    }
    return false;
  }
  void close() noexcept override {
    child_->close();
    Buffer<std::uint32_t> keys(keys_.get_allocator());
    keys_.swap(keys);
    Buffer<std::int64_t> amounts(amounts_.get_allocator());
    amounts_.swap(amounts);
  }

private:
  std::unique_ptr<BatchSource> child_;
  const JoinTable &join_;
  Buffer<std::uint32_t> keys_;
  Buffer<std::int64_t> amounts_;
};
template <bool Aos>
std::unique_ptr<RowSource> make_scan(const Tables &t, Query q, std::size_t begin, std::size_t end) {
  switch (q) {
  case Query::filter_sum:
    return std::make_unique<ScanRow<Aos, Query::filter_sum>>(t, begin, end);
  case Query::group_sum:
    return std::make_unique<ScanRow<Aos, Query::group_sum>>(t, begin, end);
  case Query::join_group_sum:
    return std::make_unique<ScanRow<Aos, Query::join_group_sum>>(t, begin, end);
  }
  throw Error(ErrorCode::invalid_argument, "unknown query");
}
} // namespace
std::unique_ptr<RowSource> row_pipeline(const Tables &t, QuerySpec q, std::size_t begin,
                                        std::size_t end, const JoinTable *join) {
  auto scan =
      t.aos ? make_scan<true>(t, q.query, begin, end) : make_scan<false>(t, q.query, begin, end);
  std::unique_ptr<RowSource> source = std::make_unique<FilterRow>(std::move(scan), q.cutoff);
  if (join)
    source = std::make_unique<JoinRow>(std::move(source), *join);
  return source;
}
std::unique_ptr<BatchSource> batch_scan(const Tables &t, Query q, std::size_t begin,
                                        std::size_t end) {
  if (t.aos || begin > end || end > t.fact_count)
    throw Error(ErrorCode::invalid_argument, "invalid batch scan range/layout");
  return std::make_unique<ScanBatch>(t, q, begin, end);
}
std::unique_ptr<BatchSource> batch_filter(std::unique_ptr<BatchSource> child,
                                          std::uint32_t cutoff) {
  return std::make_unique<FilterBatch>(std::move(child), cutoff);
}
std::unique_ptr<BatchSource> batch_pipeline(const Tables &t, QuerySpec q, std::size_t begin,
                                            std::size_t end, const JoinTable *join) {
  auto source = batch_filter(batch_scan(t, q.query, begin, end), q.cutoff);
  if (join)
    source = std::make_unique<JoinBatch>(std::move(source), *join);
  return source;
}
} // namespace vquery
