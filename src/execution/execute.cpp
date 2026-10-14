#include "vquery/execution/operators.hpp"
#include <array>
#include <exception>
#include <stop_token>
#include <system_error>
#include <thread>

namespace vquery {
namespace {
struct State {
  Aggregate global;
  std::unique_ptr<HashTable<Aggregate>> groups;
  explicit State(Query q, const std::shared_ptr<MemoryBudget> &budget) {
    if (q != Query::filter_sum)
      groups = std::make_unique<HashTable<Aggregate>>(budget);
  }
  void add(std::uint32_t key, std::int64_t amount) {
    auto &target = groups ? groups->find_or_insert(key) : global;
    ++target.count;
    target.sum += amount;
  }
  void merge(const State &other) {
    if (groups)
      other.groups->for_each([&](auto key, const auto &value) {
        auto &target = groups->find_or_insert(key);
        target.count += value.count;
        target.sum += value.sum;
      });
    else {
      global.count += other.global.count;
      global.sum += other.global.sum;
    }
  }
  QueryResult finish(Query query, const std::shared_ptr<MemoryBudget> &budget) const {
    QueryResult result{query, make_buffer<ResultRow>(budget)};
    if (groups) {
      result.rows.reserve(groups->size());
      groups->for_each([&](auto key, const auto &value) {
        result.rows.push_back({key, value.count, value.sum});
      });
    } else
      result.rows.push_back({0, global.count, global.sum});
    return result;
  }
};
std::unique_ptr<State> run_range(QuerySpec q, const Tables &tables, ExecutionContext context,
                                 std::size_t begin, std::size_t end, const JoinTable *join,
                                 std::stop_token stop) {
  auto state = std::make_unique<State>(q.query, context.budget);
  if (context.engine == Engine::batch_soa) {
    auto source = batch_pipeline(tables, q, begin, end, join);
    source->open(context);
    Batch batch;
    while (!stop.stop_requested() && source->next(batch)) {
      for (std::size_t i = 0; i < batch.logical_count; ++i) {
        auto p = batch.position(i);
        state->add(q.query == Query::filter_sum ? 0 : batch.key[p], batch.amount[p]);
      }
    }
    source->close();
  } else {
    auto source = row_pipeline(tables, q, begin, end, join);
    source->open(context);
    Row row;
    while (source->next(row))
      state->add(row.key, row.amount);
    source->close();
  }
  return state;
}
QueryResult execute_impl(QuerySpec q, const Tables &tables, ExecutionContext &context) {
  if (context.budget != tables.budget || q.query != tables.query || q.cutoff > 10000 ||
      tables.aos != (context.engine == Engine::row_aos))
    throw Error(ErrorCode::invalid_argument, "query, storage, or budget mismatch");
  Config check;
  check.engine = context.engine;
  check.query = q.query;
  check.batch_size = context.batch_size;
  check.threads = context.threads;
  check.cutoff = q.cutoff;
  validate_config(check);
  tables.validate_shape();
  std::unique_ptr<JoinTable> join;
  if (q.query == Query::join_group_sum) {
    join =
        std::make_unique<JoinTable>(context.budget, JoinTable::capacity_for(tables.customer_count));
    for (std::size_t i = 0; i < tables.customer_count; ++i) {
      const auto r = tables.customer(i);
      join->insert_unique(r.customer_id, r.region_id);
    }
  }
  if (context.threads == 1) {
    auto state = run_range(q, tables, context, 0, tables.fact_count, join.get(), {});
    return state->finish(q.query, context.budget);
  }
  std::array<std::unique_ptr<State>, 4> states;
  std::array<std::exception_ptr, 4> errors;
  std::stop_source cancellation;
  std::vector<std::jthread> workers;
  workers.reserve(context.threads);
  try {
    for (unsigned i = 0; i < context.threads; ++i) {
      if (context.hooks && context.hooks->before_launch)
        context.hooks->before_launch(i);
      const auto begin = (tables.fact_count / context.threads) * i +
                         std::min<std::size_t>(i, tables.fact_count % context.threads);
      const auto end = (tables.fact_count / context.threads) * (i + 1) +
                       std::min<std::size_t>(i + 1, tables.fact_count % context.threads);
      workers.emplace_back([&, i, begin, end, token = cancellation.get_token()] {
        try {
          if (context.hooks && context.hooks->before_worker)
            context.hooks->before_worker(i);
          states[i] = run_range(q, tables, context, begin, end, join.get(), token);
        } catch (...) {
          errors[i] = std::current_exception();
          cancellation.request_stop();
        }
      });
    }
  } catch (...) {
    cancellation.request_stop();
    for (auto &w : workers)
      w.join();
    throw;
  }
  for (auto &w : workers)
    w.join();
  for (unsigned i = 0; i < context.threads; ++i)
    if (errors[i])
      std::rethrow_exception(errors[i]);
  State merged(q.query, context.budget);
  for (unsigned i = 0; i < context.threads; ++i) {
    merged.merge(*states[i]);
    states[i].reset();
  }
  return merged.finish(q.query, context.budget);
}
} // namespace
QueryResult execute(QuerySpec q, const Tables &tables, ExecutionContext &context) {
  try {
    return execute_impl(q, tables, context);
  } catch (const Error &) {
    throw;
  } catch (const std::bad_alloc &) {
    throw Error(ErrorCode::allocation_failed, "allocation failed during execution");
  } catch (const std::system_error &e) {
    throw Error(ErrorCode::worker_failed, e.what());
  } catch (const std::exception &e) {
    throw Error(ErrorCode::worker_failed, e.what());
  } catch (...) {
    throw Error(ErrorCode::worker_failed, "unknown execution failure");
  }
}
} // namespace vquery
