"""Validate archived experiment matrices and calculate descriptive comparisons."""

import json
import statistics

from records import ENGINES, QUERIES, integer
from run_bench import arguments, configuration, load_manifest
from summarize import load_run

SUITES = (
    "core",
    "sensitivity",
    "parallel",
    "parallel-small",
    "seed-checks",
    "join-build",
    "core-repeat",
    "parallel-repeat",
)


def config_key(config):
    return json.dumps(config, sort_keys=True)


def find(records, **conditions):
    matches = [r for r in records if all(r["config"][k] == v for k, v in conditions.items())]
    if len(matches) != 1:
        raise ValueError(f"expected one measurement for {conditions}, found {len(matches)}")
    return matches[0]


def load_study(directory):
    suites, signature, environment = {}, None, None
    for suite in SUITES:
        spec = load_manifest(directory / "manifests" / f"{suite}.json")
        expected = {tuple(arguments(case, spec.get("defaults", {}))) for case in spec["cases"]}
        expected_configs = {config_key(configuration(flags)) for flags in expected}
        if len(expected_configs) != len(expected):
            raise ValueError(f"{suite}: manifest contains equivalent configurations")
        files = sorted((directory / suite).glob("*.jsonl"))
        if len(files) != len(expected):
            raise ValueError(f"{suite}: expected {len(expected)} run files, found {len(files)}")
        rows, seen = [], set()
        for path in files:
            meta, samples, eligible = load_run(path)
            if not eligible:
                raise ValueError(f"{path}: study contains exploratory results")
            for field, expected_value in (
                ("warmup", spec.get("warmup", 3)),
                ("requested_samples", spec.get("repetitions", 15)),
                ("schedule_seed", spec.get("schedule_seed", 42)),
            ):
                if integer(meta.get(field), field) != expected_value:
                    raise ValueError(f"{path}: {field} differs from experiment manifest")
            env = meta["environment"]
            identity = {
                "source": meta["source"],
                "binaries": meta["binaries"],
                "platform": env["platform"],
                "machine": env["machine"],
                "cmake": env["cmake"],
                "compiler_version": env["compiler_version"],
                "hardware": env["hardware"],
                "affinity": env["affinity"],
                "standard_library": meta["standard_library"],
            }
            if signature is None:
                signature, environment = identity, env
            elif identity != signature:
                raise ValueError(f"{path}: source, binaries, build, or host differs within study")
            config = meta["config"]
            key = config_key(config)
            if key not in expected_configs:
                raise ValueError(f"{path}: configuration differs from experiment manifest")
            if key in seen:
                raise ValueError(f"{suite}: duplicate configuration")
            seen.add(key)
            values = [s["elapsed_ns_per_query"] for s in samples]
            q1, median, q3 = statistics.quantiles(values, n=4, method="inclusive")
            rows.append(
                {
                    "file": str(path.relative_to(directory)),
                    "config": config,
                    "samples": len(samples),
                    "median_ms": median / 1e6,
                    "q25_ms": q1 / 1e6,
                    "q75_ms": q3 / 1e6,
                    "iqr_percent": (q3 - q1) / median * 100,
                    "managed_input_bytes": samples[0]["managed_input_bytes"],
                    "managed_query_peak_bytes": max(s["managed_query_peak_bytes"] for s in samples),
                    "process_peak_rss_bytes": max(
                        (
                            s["process_peak_rss_bytes"]
                            for s in samples
                            if s["process_peak_rss_bytes"] is not None
                        ),
                        default=None,
                    ),
                }
            )
        suites[suite] = rows
    return suites, signature, environment


def speedups(suites):
    core = []
    for query in QUERIES:
        for n in (100000, 1000000, 10000000):
            timings = {e: find(suites["core"], query=query, engine=e, rows=n) for e in ENGINES}
            controls = [
                {k: v for k, v in row["config"].items() if k not in {"engine", "batch_size"}}
                for row in timings.values()
            ]
            if any(control != controls[0] for control in controls[1:]):
                raise ValueError(f"core: incomparable configurations for {query}, rows={n}")
            core.append(
                {
                    "query": query,
                    "rows": n,
                    "batch_vs_row_aos": timings["row-aos"]["median_ms"]
                    / timings["batch-soa"]["median_ms"],
                    "batch_vs_row_soa": timings["row-soa"]["median_ms"]
                    / timings["batch-soa"]["median_ms"],
                }
            )
    parallel = []
    for suite in ("parallel-small", "parallel"):
        for row in suites[suite]:
            config = row["config"]
            base = find(suites[suite], **{**config, "threads": 1})
            speedup = base["median_ms"] / row["median_ms"]
            parallel.append(
                {
                    "query": config["query"],
                    "rows": config["rows"],
                    "threads": config["threads"],
                    "speedup": speedup,
                    "efficiency": speedup / config["threads"],
                }
            )
    repeats = []
    for suite in ("core", "parallel"):
        for row in suites[suite]:
            repeated = find(suites[suite + "-repeat"], **row["config"])
            repeats.append(
                {
                    "original": row["file"],
                    "repeat": repeated["file"],
                    "median_change_percent": (repeated["median_ms"] / row["median_ms"] - 1) * 100,
                }
            )
    return core, parallel, repeats
