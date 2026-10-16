#include "vquery/storage/tables.hpp"

namespace vquery {
void validate_config(const Config &c) {
  if (c.rows > 100'000'000 || c.dim_rows > 10'000'000 || c.groups < 1 || c.groups > 1'000'000 ||
      c.cutoff > 10000 || c.match_rate_bps > 10000 || c.memory_limit == 0)
    throw Error(ErrorCode::invalid_argument, "configuration exceeds supported bounds");
  if (c.threads != 1 && c.threads != 2 && c.threads != 4)
    throw Error(ErrorCode::invalid_argument, "threads must be 1, 2, or 4");
  if (c.engine != Engine::batch_soa && c.threads != 1)
    throw Error(ErrorCode::invalid_argument, "row engines support one thread");
  validate_batch_size(c.batch_size);
  if (c.query == Query::join_group_sum && c.dim_rows == 0 && c.match_rate_bps != 0)
    throw Error(ErrorCode::invalid_argument, "empty dimension requires match rate zero");
}
Tables::Tables(std::shared_ptr<MemoryBudget> memory, Engine engine, Query q)
    : budget(std::move(memory)), aos(engine == Engine::row_aos), query(q),
      facts(make_buffer<FactRow>(budget, MemoryCategory::input)), columns(budget),
      customers(make_buffer<CustomerRow>(budget, MemoryCategory::input)),
      customer_keys(make_buffer<std::uint32_t>(budget, MemoryCategory::input)),
      regions(make_buffer<std::uint32_t>(budget, MemoryCategory::input)) {}
void Tables::allocate(std::size_t n, std::size_t m) {
  if (n > 100'000'000 || m > 10'000'000)
    throw Error(ErrorCode::invalid_input, "table row limit exceeded");
  if (query != Query::join_group_sum && m)
    throw Error(ErrorCode::invalid_input, "dimension is only valid for Q3");
  // Reserve every column before changing any size or discarding existing rows.
  // A failed reserve may retain capacity, but leaves the table's contents intact.
  if (aos) {
    facts.reserve(n);
    customers.reserve(m);
    facts.resize(n);
    customers.resize(m);
  } else {
    columns.customer_id.reserve(n);
    columns.group_id.reserve(n);
    columns.score.reserve(n);
    columns.amount.reserve(n);
    customer_keys.reserve(m);
    regions.reserve(m);
    columns.customer_id.resize(n);
    columns.group_id.resize(n);
    columns.score.resize(n);
    columns.amount.resize(n);
    customer_keys.resize(m);
    regions.resize(m);
  }
  fact_count = n;
  customer_count = m;
}
void Tables::set_fact(std::size_t i, const FactRow &r) {
  if (aos)
    facts[i] = r;
  else {
    columns.customer_id[i] = r.customer_id;
    columns.group_id[i] = r.group_id;
    columns.amount[i] = r.amount;
    columns.score[i] = r.score;
  }
}
void Tables::set_customer(std::size_t i, const CustomerRow &r) {
  if (aos)
    customers[i] = r;
  else {
    customer_keys[i] = r.customer_id;
    regions[i] = r.region_id;
  }
}
FactRow Tables::fact(std::size_t i) const {
  if (aos)
    return facts[i];
  return {columns.customer_id[i], columns.group_id[i], columns.amount[i], columns.score[i]};
}
CustomerRow Tables::customer(std::size_t i) const {
  if (aos)
    return customers[i];
  return {customer_keys[i], regions[i]};
}
void Tables::validate_shape() const {
  const bool valid =
      aos ? facts.size() == fact_count && customers.size() == customer_count
          : columns.customer_id.size() == fact_count && columns.group_id.size() == fact_count &&
                columns.amount.size() == fact_count && columns.score.size() == fact_count &&
                customer_keys.size() == customer_count && regions.size() == customer_count;
  if (!valid)
    throw Error(ErrorCode::invalid_input, "table columns have inconsistent lengths");
}
void Tables::validate_values() const {
  validate_shape();
  for (std::size_t i = 0; i < fact_count; ++i) {
    auto r = fact(i);
    if (r.amount < 0 || r.amount > 1'000'000 || r.score > 9999)
      throw Error(ErrorCode::invalid_input, "fact value outside supported bounds");
  }
  for (std::size_t i = 0; i < customer_count; ++i)
    if (customer(i).region_id > 15)
      throw Error(ErrorCode::invalid_input, "region outside supported bounds");
}
void Tables::update_checksum() {
  Checksum h;
  h.text("vquery-input-v1");
  h.text("facts");
  h.u64(fact_count);
  for (std::size_t i = 0; i < fact_count; ++i) {
    auto r = fact(i);
    h.u32(r.customer_id);
    h.u32(r.group_id);
    h.u64(static_cast<std::uint64_t>(r.amount));
    h.u32(r.score);
  }
  h.text("customers");
  h.u64(customer_count);
  for (std::size_t i = 0; i < customer_count; ++i) {
    auto r = customer(i);
    h.u32(r.customer_id);
    h.u32(r.region_id);
  }
  input_checksum = h.value();
}
Tables from_fixture(Engine engine, Query query, std::span<const FactRow> facts,
                    std::span<const CustomerRow> customers, std::shared_ptr<MemoryBudget> budget) {
  Tables table(std::move(budget), engine, query);
  table.allocate(facts.size(), customers.size());
  for (std::size_t i = 0; i < facts.size(); ++i)
    table.set_fact(i, facts[i]);
  for (std::size_t i = 0; i < customers.size(); ++i)
    table.set_customer(i, customers[i]);
  table.validate_values();
  table.update_checksum();
  return table;
}
} // namespace vquery
