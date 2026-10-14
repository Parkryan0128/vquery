#!/usr/bin/env python3
"""Reject incomplete runs before computing any descriptive statistics."""
import argparse
import csv
import hashlib
import json
import math
from pathlib import Path
import statistics


def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True).encode()


def manifest_id(manifest):
    return hashlib.sha256(canonical({k: v for k, v in manifest.items() if k != "validation_id"})).hexdigest()


def load_run(raw_path, include_exploratory=False):
    """Return (metadata, samples), or raise ValueError for the whole run."""
    raw_path = Path(raw_path)
    meta_path = Path(str(raw_path) + ".meta.json")
    meta = json.loads(meta_path.read_text())
    if meta.get("completion_state") != "complete" or meta.get("run_status") != "ok":
        raise ValueError("run failed or was not finalized")
    samples = [json.loads(line) for line in raw_path.read_text().splitlines() if line.strip()]
    requested = meta.get("requested_samples")
    if type(requested) is not int or requested < 1 or len(samples) != requested or meta.get("completed_samples") != requested:
        raise ValueError("missing or extra samples")
    if sorted(s.get("trial", -1) for s in samples) != list(range(requested)):
        raise ValueError("duplicate or missing trial index")
    for sample in samples:
        if sample.get("status") != "ok" or sample.get("run_id") != meta.get("run_id"):
            raise ValueError("sample failed or belongs to another run")
        if sample.get("schema_version") != 1 or sample.get("validation_id") != meta.get("validation_id"):
            raise ValueError("sample schema/validation identity mismatch")
        if sample.get("metadata_path") != meta_path.name:
            raise ValueError("sample metadata reference mismatch")
        if any(sample.get(k) != v for k, v in meta["config"].items()):
            raise ValueError("sample configuration differs from metadata")
        k = sample.get("repetitions_in_sample")
        total = sample.get("elapsed_ns_total")
        elapsed = sample.get("elapsed_ns_per_query")
        if type(k) is not int or k < 1 or k != meta.get("repetitions_in_sample"):
            raise ValueError("invalid repetition count")
        if type(total) is not int or total <= 0 or not isinstance(elapsed, (int, float)) or not math.isfinite(elapsed) or elapsed <= 0:
            raise ValueError("invalid duration")
        if not math.isclose(elapsed, total / k, rel_tol=1e-12):
            raise ValueError("inconsistent normalized duration")
    for field in ("input_checksum", "result_checksum", "result_rows", "validation_status"):
        if len({s.get(field) for s in samples}) != 1:
            raise ValueError(f"inconsistent {field} across samples")
    validated = False
    reference = meta.get("validation_manifest")
    if reference:
        if Path(reference).name != reference:
            raise ValueError("validation manifest must be a local filename")
        manifest = json.loads((raw_path.parent / reference).read_text())
        if manifest_id(manifest) != meta.get("validation_id") or manifest.get("validation_id") != meta.get("validation_id"):
            raise ValueError("validation manifest digest mismatch")
        if meta.get("binaries") != manifest.get("binaries"):
            raise ValueError("executable identity mismatch")
        if meta.get("source") != manifest.get("source"):
            raise ValueError("source identity mismatch")
        matches = [entry for entry in manifest["validated"] if entry["config"] == meta["config"]]
        if len(matches) != 1:
            raise ValueError("configuration absent or ambiguous in validation")
        expected = matches[0]
        if any(s.get("input_checksum") != expected["input_checksum"] or
               s.get("result_checksum") != expected["result_checksum"] or
               s.get("result_rows") != expected["result_rows"] or
               s.get("validation_status") != "checksums_matched" for s in samples):
            raise ValueError("sample does not match validated results")
        validated = True
    eligible = validated and meta.get("publication_eligible") is True
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
        except (ValueError, KeyError, TypeError, OSError) as error:
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
