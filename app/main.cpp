#include "options.hpp"
#include <iostream>

int main(int argc, char **argv) {
  try {
    const auto options = vquery::cli::parse(argc, argv, false);
    if (options.help) {
      std::cout << vquery::cli::help(false);
      return 0;
    }
    const auto &c = options.config;
    auto budget = std::make_shared<vquery::MemoryBudget>(c.memory_limit);
    const auto table = vquery::generate(c, budget);
    vquery::ExecutionContext context{c.engine, c.batch_size, c.threads, budget};
    auto result = vquery::execute({c.query, c.cutoff}, table, context);
    const auto checksum = vquery::canonicalize(result);
    if (options.json)
      std::cout << vquery::cli::result_json(c, table, result, checksum) << '\n';
    else {
      std::cout << "query=" << vquery::name(c.query) << " engine=" << vquery::name(c.engine)
                << " input_checksum=" << vquery::hex_checksum(table.input_checksum)
                << " result_checksum=" << vquery::hex_checksum(checksum) << '\n';
      std::cout << "key\tcount\tsum\n";
      for (const auto &row : result.rows)
        std::cout << (c.query == vquery::Query::filter_sum ? "-" : std::to_string(row.key)) << '\t'
                  << row.count << '\t' << row.sum << '\n';
    }
    if (!std::cout)
      throw vquery::Error(vquery::ErrorCode::output_failed, "result output failed");
    return 0;
  } catch (...) {
    return vquery::cli::report_exception();
  }
}
