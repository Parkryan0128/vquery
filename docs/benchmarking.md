# Benchmark protocol

The primary measurement is a complete query over prepared, memory-resident input. The runner is `scripts/run_bench.py`; the timed executable is `vquery_bench`. Use Release without sanitizers, LTO, or PGO for the baseline. Record compiler flags and keep them identical across engines. Diagnostic instrumentation belongs in separate runs.

## Workloads

Default conditions: N=1,000,000, cutoff=5000, groups=1024, M=100,000, match rate=1, uniform keys, B=2048, T=1, seed=42. Only applicable parameters are passed to each query/engine.

| Experiment | Variable | Scope |
| --- | --- | --- |
| Core | N={100K, 1M, 10M} | Three engines × three queries; 27 configurations |
| Selectivity | cutoff={0, 100, 1000, 5000, 10000} | Q1, all engines |
| Group cardinality | groups={1, 1024, 100000} | Q2, all engines |
| Group skew | uniform / hot-key-90 | Q2, groups=1024, all engines |
| Join build size | M={1K, 100K, 1M} | Q3, all engines |
| Join match rate | {0, 0.5, 1} | Q3, all engines |
| Join skew | uniform / hot-key-90 | Q3, all engines |
| Batch size | {256, 512, 1024, 2048, 4096, 8192} | All queries, batch engine |
| Threads | {1, 2, 4} | All queries, batch engine, N=10M |

The checked-in manifests define the runnable cases. Sensitivity sweeps change one factor and the runner removes exact duplicate flags. Repeat representative findings with seeds 7 and 2026 in separate output directories to distinguish input variation from timing variation.

## Preflight

Publication candidates require a clean checkout and the `build/release` directory. The runner configures/builds Release and runs CTest with no-tests treated as an error. Publication checks inspect both compiler and executable-linker flags, including Release-specific flags. Sanitizers, coverage/instrumentation, profile-guided optimization, LTO, and indirect response-file flags require an exploratory run. Older publication metadata without all four flag fields is incomplete under this check; rerun the configuration to collect it. Exploratory runs can use a custom build or dirty tree; their summaries remain labeled accordingly.

For each logical input, preflight compares complete sorted result arrays, input checksums, and result checksums from single-threaded `row-aos`, `row-soa`, and `batch-soa`. It also checks each requested batch/thread configuration. Resolved output configurations must match the requested flags and CLI defaults; manifest bounds and match-rate syntax are checked before building or creating output. The independent oracle is used in small correctness tests; large preflight runs compare engines.

`validation.json` records resolved configurations, observed row counts, checksums, source state, and SHA-256 identities of both executables. Its own SHA-256 digest is the validation ID. Binary/source state is checked before and after timing each configuration. Full result arrays are discarded before timing begins, and timed processes start fresh.

Every warmup and measured result is checked against preflight after stopping the timer. An input or result mismatch fails the whole run. A standalone invocation can supply expected checksums, but matching them alone does not make it a publication candidate; the summary also needs a valid manifest and all three single-thread controls.

## Time and memory

| Included in query time | Excluded |
| --- | --- |
| Plan creation, defensive configuration/shape checks, state allocation | Generation, layout preparation, full fixture validation |
| Serial join build and duplicate detection | Reference computation and cross-engine comparison |
| Scan, filter, probe, aggregation, hash growth | Result sorting and checksums |
| Thread startup, joins, and merge | JSON/file/console output |
| Result materialization and intermediate cleanup | Returned-result and input destruction |

Each invocation uses fresh query state. Input stays resident, and the system allocator may reuse freed memory; this is neither a cold-cache nor a cold-allocation experiment.

Three warmups and 15 measured samples are the defaults. Sort warmup durations and use their median (the integer midpoint for an even count). If it is below 10 ms, K=`ceil(100ms / median)`; otherwise K=1. Reject K>10000 and zero-duration queries. Zero warmups deliberately select K=1 for exploration. Keep K fixed across samples.

A sample sums K separately timed queries and divides by K. Check, consume, and destroy each result outside its timer. Report median and inclusive IQR; fewer than four samples have no IQR. Flag IQR/median>10%, retain every sample, and use a new run directory for a rerun. Grouped samples do not support p99 claims.

Managed input bytes and query peak bytes track allocator requests. Old/new hash buffers overlap during growth, and parallel worker buffers share one limit. Query peaks include final results and reset after those results die. Process RSS is a separate, cumulative high-water mark that includes input and runtime allocations; it is not incremental query memory.

## Files and validation

A result directory contains:

- `validation.json`: preflight evidence and executable identities.
- `NNNN.jsonl`: one record per requested sample.
- `NNNN.jsonl.meta.json`: run configuration, K, environment, status, and completion state.
- `summary.csv` and `summary.json`: accepted runs and reasons for exclusion.

Raw JSONL files are created exclusively. Metadata starts incomplete and is replaced atomically after successful output close. Failures attempt to record a failed state even when closing the raw file fails. This detects interrupted runs; it is not an fsync durability guarantee. References use local filenames so a complete directory can be moved.

Sample fields include the full resolved configuration plus:

```text
schema_version, run_id, trial, validation_id, input_checksum, result_checksum,
repetitions_in_sample, elapsed_ns_total, elapsed_ns_per_query,
selected_rows, joined_rows, result_rows, managed_input_bytes,
managed_query_peak_bytes, process_peak_rss_bytes, validation_status,
status, metadata_path
```

Checksums are 16 lowercase hexadecimal digits; validation IDs are 64. Inapplicable fields are null. Match rates are integer basis points in records. Q3 samples leave `selected_rows` null to avoid another scan; preflight records that count. Q1/Q2 samples have null `joined_rows`. With K>1, query peak is the maximum among the K invocations.

A summary rejects the entire run for failed/incomplete metadata, missing/extra/duplicate trials, invalid JSON or field types, inconsistent durations/configurations/counts, budget violations, stale identities, or disagreeing/missing controls. It continues inspecting other run files. A publication flag also requires clean-source, tested Release metadata, at least three warmups, and 15 samples. Exploratory results need `--include-exploratory` when summarized directly.

The study reader in `scripts/study.py` also matches each suite's run configurations, warmup count, sample count, and schedule seed against its archived experiment manifest. Duplicate configurations, mixed hosts/builds, and core engine comparisons with different input settings are rejected. `scripts/plot_study.py` uses this validated data to regenerate figures; the validation tests do not require Matplotlib.

## Interpretation

Throughput is N/query time, including Q3's build cost; show M beside join measurements. Speedup compares medians for the same logical input, hardware, build, and protocol. Parallel efficiency is single-thread time divided by T-thread time and then by T. Keep platforms and instrumented builds separate.

Record CPU/core counts, RAM/cache information, affinity, OS, compiler/library, flags, source revision, executable hashes, generator version, clock, and timestamp. Missing hardware/RSS information is null. Publication thread counts must fit the detected physical cores. Record power/thermal conditions manually where the runner cannot determine them.

Profiles and PMU counters can help explain results, but elapsed time alone cannot establish a cache mechanism. Whole-process counters include generation and setup. Execution-scoped perf control and diagnostic hash counters remain future work; label unsupported events unavailable and inspect SIMD separately through compiler remarks/assembly. The [Apple M5 study](performance.md) publishes timing results, compiler diagnostics, and delayed whole-process stack samples with their limitations.
