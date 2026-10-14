# Apple M5 study — 2026-10-14

201 validated runs, 3,015 measured samples, collected from engine revision `f0615a6c5d3c2f8f65741608b0ec9690d0a6c612`.

[Report and reproduction](../../../docs/performance.md) · [Figures and numerical analysis](../../../docs/figures) · [Host notes and collection order](study.json)

- `manifests/`: exact inputs for all eight suites.
- Each suite: unchanged JSONL samples, metadata, validation manifest, and CSV/JSON summary.
- `diagnostics/compiler/`: Clang loop remarks, ARM64 assembly, and compile commands.
- `diagnostics/profiles/`: separate macOS stack samples and benchmark commands.

All measurement bundles passed the runner's publication checks. This flag verifies protocol and result consistency, not machine isolation. Four high-variability runs are retained; the report identifies them and gives repeat-pass drift. The compiler and profiler outputs are diagnostic evidence, not additional timing runs. Local paths in diagnostic commands and compiler output are replaced with `<repo>` / `<diagnostic-output>`; measurement bundles are unmodified.
