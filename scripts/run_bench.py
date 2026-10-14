#!/usr/bin/env python3
"""Validate complete outputs, bind them to binaries, then collect timed samples."""
import argparse
from datetime import datetime, timezone
import hashlib
import json
import os
from pathlib import Path
import platform
import random
import subprocess
import sys

from summarize import manifest_id, summarize

ROOT = Path(__file__).resolve().parents[1]
COMMON = {"rows", "cutoff", "seed", "threads", "memory-limit-mib"}
QUERY_OPTIONS = {"filter-sum": set(), "group-sum": {"groups", "distribution"},
                 "join-group-sum": {"dim-rows", "match-rate", "distribution"}}


def call(command, **kwargs):
    return subprocess.run([str(x) for x in command], check=True, text=True, **kwargs)


def digest(path):
    with Path(path).open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def atomic_json(path, value):
    temporary = Path(str(path) + ".tmp")
    with temporary.open("x") as stream:
        json.dump(value, stream, sort_keys=True, indent=2)
        stream.write("\n")
    temporary.replace(path)


def source_state():
    revision = call(["git", "rev-parse", "HEAD"], cwd=ROOT, capture_output=True).stdout.strip()
    dirty = bool(call(["git", "status", "--porcelain", "--untracked-files=all"], cwd=ROOT, capture_output=True).stdout)
    return {"revision": revision, "dirty": dirty}


def arguments(case, defaults):
    query, engine = case["query"], case["engine"]
    if query not in QUERY_OPTIONS or engine not in ("row-aos", "row-soa", "batch-soa"):
        raise ValueError("unknown query or engine in manifest")
    allowed = COMMON | QUERY_OPTIONS[query] | ({"batch-size"} if engine == "batch-soa" else set())
    if set(case) - allowed - {"query", "engine"}:
        raise ValueError(f"inapplicable case options: {set(case) - allowed - {'query', 'engine'}}")
    merged = {**defaults, **case}
    if engine != "batch-soa":
        if case.get("threads", 1) != 1:
            raise ValueError("row case requests parallel execution")
        merged["threads"] = 1
    result = ["--query", query, "--engine", engine]
    for key in sorted(allowed):
        if key in merged:
            result.extend(["--" + key, str(merged[key])])
    return result


def semantic_key(config):
    return json.dumps({k: v for k, v in config.items() if k not in
                       {"engine", "batch_size", "threads", "memory_limit_bytes"}}, sort_keys=True)


def build_environment(build):
    values = {}
    cache = build / "CMakeCache.txt"
    if cache.exists():
        wanted = {"CMAKE_BUILD_TYPE", "CMAKE_CXX_COMPILER", "CMAKE_CXX_FLAGS", "CMAKE_CXX_FLAGS_RELEASE", "VQUERY_SANITIZER"}
        for line in cache.read_text().splitlines():
            if "=" in line and ":" in line.split("=", 1)[0]:
                left, value = line.split("=", 1)
                key = left.split(":", 1)[0]
                if key in wanted:
                    values[key] = value
    hardware = {"physical_cores": None, "memory_bytes": None, "cache_description": None}
    if sys.platform == "darwin":
        def sysctl(key):
            try:
                return call(["sysctl", "-n", key], capture_output=True).stdout.strip()
            except (OSError, subprocess.CalledProcessError):
                return None
        physical, memory = sysctl("hw.physicalcpu"), sysctl("hw.memsize")
        hardware.update(physical_cores=int(physical) if physical else None,
                        memory_bytes=int(memory) if memory else None)
        hardware["cache_description"] = {key: sysctl(key) for key in
                                         ("hw.l1icachesize", "hw.l1dcachesize", "hw.l2cachesize", "hw.l3cachesize")}
        hardware["cpu_model"] = sysctl("machdep.cpu.brand_string")
    elif sys.platform.startswith("linux"):
        # Count only physical cores visible in this process's affinity mask.
        allowed = set(os.sched_getaffinity(0)) if hasattr(os, "sched_getaffinity") else set(range(os.cpu_count() or 0))
        cores = set()
        for cpu in allowed:
            topology = Path(f"/sys/devices/system/cpu/cpu{cpu}/topology")
            if (topology / "core_id").exists():
                cores.add(((topology / "physical_package_id").read_text().strip(), (topology / "core_id").read_text().strip()))
        hardware["physical_cores"] = len(cores) or None
        for line in Path("/proc/meminfo").read_text().splitlines():
            if line.startswith("MemTotal:"):
                hardware["memory_bytes"] = int(line.split()[1]) * 1024
        try:
            hardware["cache_description"] = call(["lscpu"], capture_output=True).stdout
        except (OSError, subprocess.CalledProcessError):
            pass
    compiler = values.get("CMAKE_CXX_COMPILER")
    compiler_version = call([compiler, "--version"], capture_output=True).stdout if compiler else None
    return {"platform": platform.platform(), "machine": platform.machine(), "logical_cpus": os.cpu_count(),
            "cpu": platform.processor(), "affinity": sorted(os.sched_getaffinity(0)) if hasattr(os, "sched_getaffinity") else None,
            "timestamp_utc": datetime.now(timezone.utc).isoformat(), "cmake": values,
            "compiler_version": compiler_version, "hardware": hardware}


def run(args):
    spec = json.loads(args.manifest.read_text())
    if spec.get("schema_version") != 1 or not spec.get("cases"):
        raise ValueError("manifest requires schema_version 1 and nonempty cases")
    state = source_state()
    if not args.exploratory:
        if state["dirty"]:
            raise ValueError("publication runs require a clean checkout; commit first or use --exploratory")
        if args.build_dir.resolve() != (ROOT / "build/release").resolve():
            raise ValueError("publication runs use build/release; custom builds require --exploratory")
        call(["cmake", "--preset", "release"], cwd=ROOT)
        call(["cmake", "--build", "--preset", "release"], cwd=ROOT)
        call(["ctest", "--preset", "release"], cwd=ROOT)
    binaries = {"vquery": args.build_dir / "vquery", "vquery_bench": args.build_dir / "vquery_bench"}
    identities = {name: digest(path) for name, path in binaries.items()}
    args.output_dir.mkdir(parents=True, exist_ok=False)
    environment = build_environment(args.build_dir)
    defaults = spec.get("defaults", {})
    if set(defaults) - COMMON - {"groups", "dim-rows", "match-rate", "distribution", "batch-size"}:
        raise ValueError("unknown default option in manifest")
    cases = []
    seen = set()
    for case in spec["cases"]:
        flags = arguments(case, defaults)
        threads = int(dict(zip(flags[::2], flags[1::2])).get("--threads", 1))
        physical = environment["hardware"]["physical_cores"]
        if not args.exploratory and threads > 1 and (physical is None or threads > physical):
            raise ValueError("parallel publication runs must fit the detected physical-core budget")
        if tuple(flags) not in seen:
            seen.add(tuple(flags)); cases.append(flags)
    expected_by_input, validated, work = {}, [], []
    validation_cache = {}

    def validate(flags):
        if tuple(flags) in validation_cache:
            return validation_cache[tuple(flags)]
        payload = json.loads(call([binaries["vquery"], *flags, "--format", "json"], capture_output=True).stdout)
        key = semantic_key(payload["config"])
        if key in expected_by_input:
            previous = expected_by_input[key]
            if payload["input_checksum"] != previous["input_checksum"] or payload["rows"] != previous["rows"] or payload["result_checksum"] != previous["result_checksum"]:
                raise ValueError("cross-engine full-output validation failed")
        else:
            expected_by_input[key] = payload
        record = {key: payload[key] for key in ("config", "input_checksum", "result_checksum", "selected_rows", "joined_rows")}
        record["result_rows"] = len(payload["rows"])
        if not any(entry["config"] == record["config"] for entry in validated):
            validated.append(record)
        validation_cache[tuple(flags)] = record
        return record

    for index, flags in enumerate(cases):
        record = validate(flags)
        # Every batch-only sweep still has an independent row execution control.
        if record["config"]["engine"] == "batch-soa":
            control = dict(zip(flags[::2], flags[1::2]))
            control["--engine"] = "row-soa"; control["--threads"] = "1"; control.pop("--batch-size", None)
            validate([item for pair in control.items() for item in pair])
        work.append((index, flags, record))
        print(f"Validated {index+1}/{len(cases)} configurations", flush=True)
    manifest = {"schema_version": 1, "source": state, "binaries": identities, "validated": validated}
    manifest["validation_id"] = manifest_id(manifest)
    atomic_json(args.output_dir / "validation.json", manifest)
    # All result arrays have served their purpose; timed processes start fresh.
    expected_by_input.clear(); validation_cache.clear()
    random.Random(spec.get("schedule_seed", 42)).shuffle(work)
    warmup, repetitions = spec.get("warmup", 3), spec.get("repetitions", 15)
    for index, flags, record in work:
        if identities != {name: digest(path) for name, path in binaries.items()} or state != source_state():
            raise ValueError("source or executables changed after validation")
        output = args.output_dir / f"{index:04d}.jsonl"
        command = [binaries["vquery_bench"], *flags, "--warmup", warmup, "--repetitions", repetitions,
                   "--output", output, "--expected-input-checksum", record["input_checksum"],
                   "--expected-result-checksum", record["result_checksum"], "--validation-id", manifest["validation_id"]]
        call(command)
        if identities != {name: digest(path) for name, path in binaries.items()} or state != source_state():
            raise ValueError("source or executables changed during timing")
        meta_path = Path(str(output) + ".meta.json")
        meta = json.loads(meta_path.read_text())
        meta.update(validation_manifest="validation.json", binaries=identities, source=state,
                    environment=environment, schedule_seed=spec.get("schedule_seed", 42),
                    publication_eligible=not args.exploratory and warmup >= 3 and repetitions >= 15,
                    observations={"selected_rows": record["selected_rows"], "joined_rows": record["joined_rows"]})
        atomic_json(meta_path, meta)
    rows, rejected = summarize(args.output_dir, include_exploratory=args.exploratory or repetitions < 15 or warmup < 3)
    if rejected or len(rows) != len(cases):
        raise ValueError(f"summary rejected runs: {rejected}")
    print(f"Completed {len(rows)} validated runs: {args.output_dir}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--build-dir", type=Path, default=ROOT / "build/release")
    parser.add_argument("--exploratory", action="store_true", help="Allow dirty/custom builds; never mark results publishable")
    args = parser.parse_args()
    args.build_dir = args.build_dir.resolve()
    args.output_dir = args.output_dir.resolve()
    try:
        run(args)
    except (ValueError, OSError, subprocess.CalledProcessError) as error:
        print(f"Benchmark stopped: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
