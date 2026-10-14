# Performance study status

The execution and benchmark infrastructure is implemented. The controlled Linux study (M6) and final report (M7) are pending. No speedup or cache-effect claim is established by the correctness tests or smoke manifest.

The initial macOS/ARM64 exploratory check completed all 27 core configurations with 3 warmups and 15 samples each, including input/output validation and calibrated repetition. This verifies the measurement workflow; these local runs are not the Linux study or a performance claim.

## Reproduction inputs

Use a clean checkout, C++20 Clang 17+ or GCC 13+, CMake 3.25+, Ninja, and Python 3.11+. Run from the repository root. The runner builds and tests the Release preset before validating and timing publication candidates. Reserve a new output directory for every invocation.

```bash
python3 scripts/run_bench.py --manifest bench/manifests/core.json \
  --output-dir results/local/core
python3 scripts/run_bench.py --manifest bench/manifests/sensitivity.json \
  --output-dir results/local/sensitivity
python3 scripts/run_bench.py --manifest bench/manifests/parallel.json \
  --output-dir results/local/parallel
```

The parallel manifest needs four available physical cores. Run timing jobs sequentially on an otherwise idle Linux x86-64 host. Record power policy, CPU affinity, thermal conditions, and any environment facts the runner cannot determine. Pin a suitable core set externally when available; the runner records its inherited affinity. Do not pool macOS, CI, diagnostic, or sanitizer measurements with the primary Linux results.

Each directory contains `validation.json`, one JSONL and metadata file per configuration, `summary.csv`, and `summary.json`. Preserve all files together. `publication_eligible` means the runner's validation and repetition protocol passed; it does not certify isolation, hardware-counter evidence, or completion of this report. Review environment metadata before selecting data for publication.

The core matrix has 27 configurations. Sensitivity sweeps vary one parameter at a time and remove duplicate defaults. Thread scaling has nine configurations. Repeat representative findings with seeds 7 and 2026 using separate manifests/output directories; separate input variation from repeated timing variation.

## Questions to test before optimization

1. Does selection-vector indirection lose its advantage at high selectivity? Compare Q1 at each cutoff, inspect generated loops and compiler vectorization remarks, then measure a single implementation change under the same configuration.
2. Does the join become limited by hash-probe locality as the build grows? Record actual table capacity and footprint, compare M sweeps, and collect supported PMU events and sampled stacks. Elapsed time alone cannot prove a cache explanation.
3. At what N does startup and merging outweigh parallel work? Include per-query worker creation and join in all timings and compare 1/2/4 threads against the same batch engine.

## Remaining release evidence

- [ ] Complete environment and clean-source metadata on the selected Linux host.
- [ ] Core, selectivity, cardinality, join-size/match-rate/skew, batch-size, and thread-scaling measurements.
- [ ] Compiler SIMD diagnostics and assembly inspection, separate from primary timing builds.
- [ ] Hash capacity/probe diagnostics and sampled profiles; currently not instrumented.
- [ ] At least two hypotheses assessed with evidence, including ineffective changes.
- [ ] Plots with medians/IQR, matched-input speedups, memory, and thread efficiency.
- [ ] Selected raw artifacts under `results/published/`, figure sources, and clean-checkout reproduction.

A future Linux profiling helper must label whole-process counters explicitly: generation and setup are included unless execution-scoped perf control is implemented. Do not infer query cycles per row from whole-process counters. Record unsupported events as unavailable.
