# Tests

Run `cmake --preset debug`, `cmake --build --preset debug`, and `ctest --preset debug --parallel 4`. Repeat with `release`; use `asan-ubsan` and `tsan` separately on Linux. CTest fails if no tests are discovered.

The suite currently has 38 GoogleTests and three Python suite entries. Those Python suites contain 15 executable/integration tests, 18 runner/record tests, and eight archived-study tests: 41 CTest entries, 79 named tests in total. Several tests iterate over configurations or failure positions; the entry count is not a count of every input examined.

## Contract coverage

| Area | Normal execution | Boundaries and failures | Tests |
| --- | --- | --- | --- |
| Query results | Q1/Q2/Q3 in row-aos, row-soa, and batch-soa at 1/2/4 threads | Empty/single rows, cutoff 0/1/10000, keys 0/UINT32_MAX, sums above 32 bits, empty dimension, unmatched probes, duplicate build keys | `execution_test.cpp`: independent map aggregate and nested-loop join; 100 randomized seeds |
| Batch processing | Every supported B; selection composition; row/batch subranges | B-1/B/B+1/2B+1, rejected intermediate batches, uneven/fewer-rows-than-workers ranges, reopen and repeated close, partial open failure, cancellation | `execution_test.cpp` |
| Generated data | AoS/SoA checksum agreement, uniform and hot-key workloads | Seeds 0/UINT64_MAX, singleton group/customer domains, empty dimension, 0/near-zero/half/near-one/full match rates, score/amount stream independence | `core_test.cpp`, `execution_test.cpp` |
| Hash tables | Lookup, update, unique insertion, iteration, growth | Forced collisions and wraparound, minimum capacity, capacity overflow, duplicate keys, failed rehash, insertion aliasing, copy accounting and failure rollback | `core_test.cpp` |
| Memory ownership | Reserve/release, peak reset, move/swap/rebind, table copies, results outliving input/context | Shared-budget contention, limit rejection, size overflow, partial preparation failure, injected failures through worker state/merge/final output | `core_test.cpp`, `execution_test.cpp` |
| Parallel failure handling | Exact full-array agreement at 1/2/4 threads | Simultaneous worker errors, failure during thread launch, stop requests, no surviving query allocations | `execution_test.cpp`, Linux TSan |
| CLI | All queries/engines, JSON and text, help, supported rate syntax, maximum seed | Missing/duplicate/inapplicable flags, malformed/overflowing integers, invalid bounds/rates, memory exhaustion, failed stdout writes | `cli_test.py` |
| Benchmark | All 15 smoke configurations, calibration, new files, metadata, escaped filenames | No overwrite, mismatched checksums, invalid validation tuple, initial budget failure, real file-write failure after earlier samples, failed completion-message output | `cli_test.py`, `benchmark_test.cpp` |
| Calibration | Odd/even medians, K rounding, no-warmup path | 10 ms threshold, K=10000 and K>10000, zero duration, large durations without overflow | `benchmark_test.cpp` |
| Runner and summaries | Full-output controls, all query record types, median/IQR, small exploratory summaries, resolved CLI defaults/overrides | Wrong requested input, invalid manifest bounds/rates, missing controls, parallel-only control, impossible counts/budget, stale manifests, wrong types, nonfinite/duplicate JSON, incomplete/failed/truncated runs, stale CSV removal, instrumented build flags and incomplete flag metadata | `runner_test.py`, `cli_test.py` |
| Performance study | Recalculate all 201 archived runs and published comparisons; reordered/repeated manifest cases | Changed workload/timing/schedule, missing/extra/replaced runs, duplicate configurations, mixed hosts, incomparable engine inputs | `study_test.py`; standard-library-only validation runs in every CTest job |

Tests compare every result key/count/sum, not just checksums. The reference uses standard containers and a nested-loop join; it does not reuse engine hash/filter/aggregate code. The allocation sweep advances the failure point until a successful execution occurs for every query at 1/2/4 threads, checking cleanup after each attempt. Probability checks use fixed seeds and broad bounds, not timing or nondeterministic sampling.

## Coverage measurement

On macOS, use the compiler's matching LLVM tools through `xcrun`; on Linux, use matching `clang++`, `llvm-profdata`, and `llvm-cov`. The example assumes the Debug build has already fetched GoogleTest.

```bash
cmake -S . -B build/coverage -G Ninja \
  -DCMAKE_BUILD_TYPE=Debug -DVQUERY_BUILD_TESTS=ON \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_CXX_FLAGS='-fprofile-instr-generate -fcoverage-mapping' \
  -DFETCHCONTENT_SOURCE_DIR_GOOGLETEST="$PWD/build/debug/_deps/googletest-src"
cmake --build build/coverage --parallel 4

# Choose a fresh directory after each source/build change.
mkdir -p build/coverage/profiles-1
LLVM_PROFILE_FILE="$PWD/build/coverage/profiles-1/%p-%m.profraw" \
  ctest --test-dir build/coverage --output-on-failure --parallel 4
xcrun llvm-profdata merge -sparse build/coverage/profiles-1 -o build/coverage/run.profdata
xcrun llvm-cov report build/coverage/vquery_tests \
  -object build/coverage/vquery -object build/coverage/vquery_bench \
  -instr-profile=build/coverage/run.profdata \
  -ignore-filename-regex='(_deps|tests|Xcode|CommandLineTools)'
```

The 2026-10-14 follow-up measured 96.85% of production C++ lines and 93.71% of branch outcomes (tests, dependencies, and SDK headers excluded). Every production function represented in the report ran. Execution files were 98.72%/98.91% by line; generator and calibration were 100%. This includes C++ reached through Python integration tests; it is not Python line coverage.

Apple LLVM's combined report warns about hash-zero coverage stubs for inline functions unused in one executable but used in another. The covered definitions appear in the combined report. The file-size failure children send LLVM profiles to `/dev/null`: the injected write limit would otherwise corrupt profiles and add profiler errors to stderr. Their assertions still run in all test builds, but those children do not increase the coverage percentage.

Remaining uncovered paths include system-allocator failures after a successful budget reservation, uncommon stream/OS failures, unknown exception fallbacks, and invalid enum fallbacks. Injected budget failures exercise the practical cleanup paths without deliberately exhausting machine memory. Coverage does not establish absence of bugs, exhaust thread schedules, or replace the separate sanitizer jobs. The maximum 100M-row input size is validated at the argument boundary; regular CI does not allocate the full maximum dataset.
