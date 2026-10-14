#!/usr/bin/env python3
"""Reject incomplete runs before computing any descriptive statistics."""
import argparse
import csv
import hashlib
import json
import math
from pathlib import Path
import statistics

from records import (CONFIG_FIELDS, config_record, decode_record, hex_string, integer, object_record,
                     read_record, semantic_key)


def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True, allow_nan=False).encode()


def manifest_id(manifest):
    return hashlib.sha256(canonical({k: v for k, v in manifest.items() if k != "validation_id"})).hexdigest()


def load_run(raw_path, include_exploratory=False):
    """Return (metadata, samples, eligible), or reject the entire run."""
    raw_path = Path(raw_path)
    meta_path = Path(str(raw_path) + ".meta.json")
    meta = read_record(meta_path)
    integer(meta.get("schema_version"), "metadata schema_version", 1, 1)
    config_record(meta.get("config"))
    if not isinstance(meta.get("run_id"), str) or not meta["run_id"]:
        raise ValueError("missing run identity")
    integer(meta.get("warmup"), "warmup")
    if meta.get("completion_state") != "complete" or meta.get("run_status") != "ok":
        raise ValueError("run failed or was not finalized")
    samples = [decode_record(line) for line in raw_path.read_text(encoding="utf-8").splitlines() if line.strip()]
    requested = integer(meta.get("requested_samples"), "requested_samples", 1)
    integer(meta.get("completed_samples"), "completed_samples")
    integer(meta.get("repetitions_in_sample"), "repetitions_in_sample", 1, 10000)
    if len(samples) != requested or meta["completed_samples"] != requested:
        raise ValueError("missing or extra samples")
    if sorted(integer(s.get("trial"), "trial") for s in samples) != list(range(requested)):
        raise ValueError("duplicate or missing trial index")
    for sample in samples:
        if sample.get("status") != "ok" or sample.get("run_id") != meta.get("run_id"):
            raise ValueError("sample failed or belongs to another run")
        integer(sample.get("schema_version"), "sample schema_version", 1, 1)
        if sample.get("validation_id") != meta.get("validation_id"):
            raise ValueError("sample schema/validation identity mismatch")
        if sample.get("metadata_path") != meta_path.name:
            raise ValueError("sample metadata reference mismatch")
        if not CONFIG_FIELDS.issubset(sample):
            raise ValueError("sample is missing configuration fields")
        config_record({k: sample[k] for k in CONFIG_FIELDS})
        if any(sample.get(k) != v for k, v in meta["config"].items()):
            raise ValueError("sample configuration differs from metadata")
        k = sample.get("repetitions_in_sample")
        total = integer(sample.get("elapsed_ns_total"), "elapsed_ns_total", 1)
        elapsed = sample.get("elapsed_ns_per_query")
        if type(k) is not int or k < 1 or k != meta.get("repetitions_in_sample"):
            raise ValueError("invalid repetition count")
        if type(elapsed) not in (int, float) or not math.isfinite(elapsed) or elapsed <= 0:
            raise ValueError("invalid duration")
        if not math.isclose(elapsed, total / k, rel_tol=1e-12):
            raise ValueError("inconsistent normalized duration")
        hex_string(sample.get("input_checksum"), 16, "input_checksum")
        hex_string(sample.get("result_checksum"), 16, "result_checksum")
        integer(sample.get("result_rows"), "result_rows", maximum=max(1, meta["config"]["rows"]))
        integer(sample.get("managed_query_peak_bytes"), "managed_query_peak_bytes")
        integer(sample.get("managed_input_bytes"), "managed_input_bytes")
        if sample.get("process_peak_rss_bytes") is not None:
            integer(sample["process_peak_rss_bytes"], "process_peak_rss_bytes")
        if sample.get("validation_status") not in ("unchecked", "checksums_matched"):
            raise ValueError("invalid validation status")
    for field in ("input_checksum", "result_checksum", "result_rows", "validation_status"):
        if len({s.get(field) for s in samples}) != 1:
            raise ValueError(f"inconsistent {field} across samples")
    validated = False
    reference = meta.get("validation_manifest")
    if reference is not None:
        if not isinstance(reference, str) or not reference or Path(reference).name != reference:
            raise ValueError("validation manifest must be a local filename")
        manifest = read_record(raw_path.parent / reference)
        integer(manifest.get("schema_version"), "manifest schema_version", 1, 1)
        hex_string(manifest.get("validation_id"), 64, "validation_id")
        identities = object_record(manifest.get("binaries"), "executable identities")
        for executable in ("vquery", "vquery_bench"):
            hex_string(identities.get(executable), 64, executable)
        source = object_record(manifest.get("source"), "source identity")
        revision = source.get("revision")
        hex_string(revision, 64 if isinstance(revision, str) and len(revision) == 64 else 40, "source revision")
        if type(source.get("dirty")) is not bool:
            raise ValueError("source dirty flag must be boolean")
        entries = manifest.get("validated")
        if not isinstance(entries, list) or not entries:
            raise ValueError("validation entries must be a nonempty array")
        for entry in entries:
            object_record(entry, "validation entry")
            config_record(entry.get("config"))
            hex_string(entry.get("input_checksum"), 16, "validated input checksum")
            hex_string(entry.get("result_checksum"), 16, "validated result checksum")
            integer(entry.get("result_rows"), "validated result_rows", maximum=max(1, entry["config"]["rows"]))
        if manifest_id(manifest) != meta.get("validation_id") or manifest.get("validation_id") != meta.get("validation_id"):
            raise ValueError("validation manifest digest mismatch")
        if meta.get("binaries") != manifest.get("binaries"):
            raise ValueError("executable identity mismatch")
        if meta.get("source") != manifest.get("source"):
            raise ValueError("source identity mismatch")
        matches = [entry for entry in entries if entry["config"] == meta["config"]]
        if len(matches) != 1:
            raise ValueError("configuration absent or ambiguous in validation")
        expected = matches[0]
        if any(s.get("input_checksum") != expected["input_checksum"] or
               s.get("result_checksum") != expected["result_checksum"] or
               s.get("result_rows") != expected["result_rows"] or
               s.get("validation_status") != "checksums_matched" for s in samples):
            raise ValueError("sample does not match validated results")
        controls = [entry for entry in entries if semantic_key(entry["config"]) == semantic_key(meta["config"])]
        engines = {entry["config"]["engine"] for entry in controls}
        if len(engines) < 2 or (meta["config"]["engine"] == "batch-soa" and "row-soa" not in engines):
            raise ValueError("validation is missing a cross-engine control")
        if any(any(entry[field] != expected[field] for field in
                   ("input_checksum", "result_checksum", "result_rows")) for entry in controls):
            raise ValueError("cross-engine validation records disagree")
        validated = True
    eligible = validated and meta.get("publication_eligible") is True
    if eligible:
        environment = object_record(meta.get("environment"), "environment")
        build = object_record(environment.get("cmake"), "build configuration")
        if (meta["warmup"] < 3 or requested < 15 or meta["source"]["dirty"] or
                build.get("CMAKE_BUILD_TYPE") != "Release" or build.get("VQUERY_SANITIZER") != "" or
                build.get("VQUERY_BUILD_TESTS") != "ON"):
            raise ValueError("publication metadata does not satisfy the timing/build protocol")
    if not eligible and not include_exploratory:
        raise ValueError("exploratory run; use --include-exploratory to inspect")
    return meta, samples, eligible


def summarize(directory, include_exploratory=False):
    directory = Path(directory)
    rows, rejected = [], []
    for path in sorted(directory.glob("*.jsonl")):
        try:
            meta, samples, eligible = load_run(path, include_exploratory)
            values = [s["elapsed_ns_per_query"] for s in samples]
            median = statistics.median(values)
            iqr = None
            if len(values) >= 4:
                q1, _, q3 = statistics.quantiles(values, n=4, method="inclusive")
                iqr = q3 - q1
            row = dict(meta["config"])
            row.update(run_id=meta["run_id"], samples=len(values), median_ns=median,
                       iqr_ns=iqr, high_variability=iqr is not None and iqr / median > .10,
                       input_rows_per_second=row["rows"] * 1e9 / median,
                       managed_query_peak_bytes=max(s["managed_query_peak_bytes"] for s in samples),
                       publication_eligible=eligible, raw_file=path.name)
            rows.append(row)
        except (ValueError, KeyError, TypeError, OverflowError, OSError) as error:
            rejected.append({"file": path.name, "reason": str(error)})
    if rows:
        with (directory / "summary.csv").open("w", newline="") as out:
            writer = csv.DictWriter(out, fieldnames=list(rows[0]))
            writer.writeheader()
            writer.writerows(rows)
    else:
        (directory / "summary.csv").unlink(missing_ok=True)
    (directory / "summary.json").write_text(json.dumps({"runs": rows, "excluded": rejected}, indent=2) + "\n")
    return rows, rejected


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input-dir", type=Path, required=True)
    parser.add_argument("--include-exploratory", action="store_true")
    args = parser.parse_args()
    rows, rejected = summarize(args.input_dir, args.include_exploratory)
    print(f"Summarized {len(rows)} runs; excluded {len(rejected)} runs.")
    for entry in rejected:
        print(f"  {entry['file']}: {entry['reason']}")
    return 0 if rows else 1


if __name__ == "__main__":
    raise SystemExit(main())
