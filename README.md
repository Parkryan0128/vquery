# VQuery

An in-memory query execution engine written in C++20.

It runs filtering, aggregation, and hash joins one row at a time or in column batches. The three engines use the same input values and hash tables, so their results and execution costs can be compared. Batch execution also supports multiple threads.

[Performance results](docs/performance.md) · [Benchmark protocol](docs/benchmarking.md)

## How it works

The engine:

1. Generates reproducible fact and customer tables directly into row or column storage.
2. Builds a customer hash table when the query includes a join.
3. Scans facts and filters rows with `score < cutoff`.
4. Accumulates counts and sums globally, by group, or by joined customer region.
5. Uses separate fact ranges and aggregate state for parallel workers, then merges their results.
6. Returns an owned result and releases intermediate buffers. Sorting, checksums, and output happen after execution.

```text
filter-sum       Scan → Filter → Global aggregate

group-sum        Scan → Filter → Hash aggregate

join-group-sum          Customers → Hash build
                                        │
                Facts → Scan → Filter → Probe → Hash aggregate
```

The execution modes are:

| Engine | Storage | Processing | Threads |
| --- | --- | --- | --- |
| `row-aos` | Row structs | One row per operator call | 1 |
| `row-soa` | Contiguous column arrays | One row per operator call | 1 |
| `batch-soa` | Contiguous column arrays | One batch per operator call | 1, 2, 4 |

Comparing the two row engines isolates storage layout. Comparing `row-soa` with `batch-soa` includes dispatch, loop structure, and when values are loaded or copied. Batching does not by itself imply CPU SIMD.

Batch Scan borrows column views. Filter keeps selection indices, and Join compacts matches into reusable output buffers. Grouped aggregation uses an open-addressed hash table with linear probing. Each parallel worker owns its pipeline and aggregate state; the join table is built once and shared for reads.

## Measured results

On an Apple M5 with 24 GiB RAM, the single-thread batch engine was **1.41–1.58× faster than `row-soa`** for the three default queries at one million facts. Release build, Apple Clang 17, batch size 2048, cutoff 5000, seed 42; medians of 15 samples after three warmups:

| Query | `row-aos` | `row-soa` | `batch-soa` | Batch speedup vs `row-soa` |
| --- | ---: | ---: | ---: | ---: |
| Filter + sum | 4.512 ms | 4.146 ms | 2.702 ms | 1.53× |
| Group by + sum | 8.521 ms | 6.704 ms | 4.762 ms | 1.41× |
| Join + group by | 9.767 ms | 9.561 ms | 6.055 ms | 1.58× |

![Query latency across input sizes, with median and IQR](docs/figures/core-latency.png)

At ten million facts, four batch workers achieved **2.75–3.65× speedup** over one worker across the three queries and two measurement passes. At ten thousand facts, four workers made filter and group aggregation slower. Each execution includes worker creation, merging, and the join's serial build.

![Parallel speedup at four input sizes](docs/figures/parallel.png)

The study contains **201 runs and 3,015 samples**, including selectivity, cardinality, skew, join-size, batch-size, seed, and repeat checks. Four runs exceeded 10% IQR/median and are retained and identified in the report. These results describe one macOS desktop; Linux replication and hardware-counter attribution remain future work.

[Results and bottleneck analysis](docs/performance.md) · [Raw data and environment](results/published/apple-m5-2026-10-14) · [Figure generation](scripts/plot_study.py)

## Usage

Count and sum selected rows:

```bash
./build/debug/vquery --query filter-sum --engine row-aos \
  --rows 100000 --cutoff 5000
```

Group selected rows using four batch workers:

```bash
./build/debug/vquery --query group-sum --engine batch-soa \
  --rows 100000 --groups 1024 --batch-size 2048 --threads 4 --format json
```

Join facts to customers, then aggregate by region:

```bash
./build/debug/vquery --query join-group-sum --engine batch-soa \
  --rows 100000 --dim-rows 10000 --match-rate 0.5 --cutoff 5000
```

`--seed` controls generated data. `--distribution hot-key-90` concentrates group keys or matching customer keys on key zero. Supported batch sizes are 256, 512, 1024, 2048, 4096, and 8192. Both executables list their options with `--help`.

A cutoff of zero rejects every row; 10000 accepts every row. The global aggregate returns one zero-valued row for empty input, while grouped queries return no rows. Customer keys must be unique; unmatched facts are discarded and duplicate customer keys are errors. An empty generated dimension requires `--match-rate 0`.

The default managed-buffer budget is 4096 MiB, set with `--memory-limit-mib`. It covers input, hash tables, batch buffers, and results, including concurrent workers and buffer growth. Thread stacks and other runtime allocations are outside that limit; process RSS is reported separately.

This version uses fixed integer schemas and three plans assembled in code. SQL parsing, persistent storage, file ingestion, NULLs, strings, and many-to-many joins are not implemented. The supported limits are 100 million facts and 10 million customers, subject to the memory budget.

[Query semantics, buffer lifetimes, and options](docs/architecture.md) · [Generator and checksum encoding](docs/decisions.md)

## Project structure

```text
include/vquery/   Public types, table and operator interfaces, hash table, allocator
src/common/      Memory accounting
src/storage/     Row and column storage, fixture validation
src/workload/    Deterministic input generation
src/execution/   Scan, filter, join, aggregation, workers, and merge
app/             Query CLI and text/JSON output
bench/           Query timing, calibration, and experiment manifests
scripts/         Cross-engine validation, benchmark runs, and summaries
tests/           Correctness, ownership, concurrency, failure, and CLI tests
docs/            Execution details, test coverage, and benchmark protocol
```

## Build

Requirements:

- Linux or macOS
- A C++20 compiler and standard library with `std::jthread`
- CMake 3.25+, Ninja, and Python 3.11+

```bash
cmake --preset debug
cmake --build --preset debug --parallel 4
```

CMake checks `std::jthread` support and fetches GoogleTest from a pinned archive. CI uses GCC 13 and Clang 18 on Linux, and Apple Clang on macOS 26.

## Tests

```bash
ctest --preset debug --parallel 4

cmake --preset release
cmake --build --preset release --parallel 4
ctest --preset release --parallel 4
```

Run the address and undefined-behavior sanitizers on Linux:

```bash
cmake --preset asan-ubsan
cmake --build --preset asan-ubsan --parallel 4
ctest --preset asan-ubsan --parallel 4
```

Use the `tsan` preset for ThreadSanitizer. CI runs both sanitizer configurations separately.

Tests compare every result key, count, and sum against independent map-based aggregation and a nested-loop join. They cover all query/engine modes, supported batches and thread counts, 100 randomized seeds, empty inputs, tail batches, skew, hash collisions and growth, allocation failures, worker failures, and result lifetimes. Executable tests also check argument errors, output failures, and benchmark files.

[Test coverage and reproduction commands](docs/testing.md)

## Benchmarks

Run the small smoke suite using the Debug build:

```bash
python3 scripts/run_bench.py --manifest bench/manifests/smoke.json \
  --build-dir build/debug --output-dir results/local/smoke --exploratory
```

From a clean checkout, run the core comparison:

```bash
python3 scripts/run_bench.py --manifest bench/manifests/core.json \
  --output-dir results/local/core
python3 scripts/summarize.py --input-dir results/local/core
```

The core matrix contains 27 configurations: three engines, three queries, and 100K/1M/10M fact rows. Separate `sensitivity.json` and `parallel.json` manifests vary selectivity, key distributions, join size, batch size, and thread count.

The runner builds and tests Release, compares complete outputs across engines, and records source and executable identities before timing. The default is three warmups and 15 samples, with repeated queries grouped when runs are short. Summaries report median and IQR. Query time includes allocation, join build, thread startup, merging, and intermediate cleanup; generation and result checking are outside the timer.

Each run needs a new output directory. Raw samples, metadata, validation records, and summaries are kept together. A failed or incomplete run is excluded as a whole. Debug, sanitizer, coverage, and other diagnostic builds can be inspected with `--exploratory` and are excluded from publication comparisons.

The published [Apple M5 study](docs/performance.md) includes the complete measurement bundles, compiler diagnostics, sampled stacks, limitations, and commands to repeat the study or regenerate the figures.

## Contact

Ryan Park · [Email](mailto:parkryan0128@gmail.com) · [LinkedIn](https://www.linkedin.com/in/parkryan0128) · [GitHub](https://github.com/Parkryan0128)
