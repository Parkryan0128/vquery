"""Exercise the actual executables and persisted benchmark failure states."""

import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
import resource
import signal

CLI, BENCH = map(Path, sys.argv[1:3])
GOOGLETEST_SOURCE = Path(sys.argv[3]) if len(sys.argv) > 3 else CLI.parent / "_deps/googletest-src"
sys.argv = sys.argv[:1]
ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from summarize import load_run
from run_bench import arguments, configuration


def invoke(binary, *flags, success=True):
    result = subprocess.run([str(binary), *map(str, flags)], text=True, capture_output=True)
    if (result.returncode == 0) != success:
        raise AssertionError(
            f"unexpected exit {result.returncode}: {result.stdout}\n{result.stderr}"
        )
    return result


class Contracts(unittest.TestCase):
    def test_benchmark_completion_stdout_failure_invalidates_run(self):
        with tempfile.TemporaryDirectory() as directory, open(os.devnull, "rb") as output:
            path = Path(directory) / "run.jsonl"
            result = subprocess.run(
                [
                    str(BENCH),
                    "--query",
                    "filter-sum",
                    "--engine",
                    "batch-soa",
                    "--rows",
                    "0",
                    "--warmup",
                    "0",
                    "--repetitions",
                    "1",
                    "--output",
                    str(path),
                ],
                stdout=output,
                stderr=subprocess.PIPE,
                text=True,
            )
            self.assertNotEqual(result.returncode, 0)
            self.assertEqual(json.loads(result.stderr)["status"], "output_failed")
            meta = json.loads(Path(str(path) + ".meta.json").read_text())
            self.assertEqual(meta["completed_samples"], 1)
            self.assertEqual(meta["completion_state"], "failed")
            self.assertEqual(meta["run_status"], "output_failed")
            with self.assertRaisesRegex(ValueError, "failed"):
                load_run(path, True)

    def test_manifest_configuration_matches_executable_defaults_and_overrides(self):
        flags = arguments({"query": "filter-sum", "engine": "batch-soa"}, {})
        payload = json.loads(invoke(CLI, *flags, "--format", "json").stdout)
        self.assertEqual(configuration(flags), payload["config"])
        for query in ("filter-sum", "group-sum", "join-group-sum"):
            for engine in ("row-aos", "row-soa", "batch-soa"):
                for overrides in (
                    {},
                    {
                        "cutoff": 0,
                        "seed": str((1 << 64) - 1),
                        "memory-limit-mib": 32,
                        "groups": 7,
                        "dim-rows": 13,
                        "match-rate": "0.1234",
                        "distribution": "hot-key-90",
                        "batch-size": 8192,
                        "threads": 4,
                    },
                ):
                    with self.subTest(query=query, engine=engine, overrides=overrides):
                        flags = arguments(
                            {"query": query, "engine": engine}, {"rows": 0, **overrides}
                        )
                        payload = json.loads(invoke(CLI, *flags, "--format", "json").stdout)
                        self.assertEqual(configuration(flags), payload["config"])

    def test_buffered_stdout_failure_is_reported(self):
        def deny_file_writes():
            signal.signal(signal.SIGXFSZ, signal.SIG_IGN)
            resource.setrlimit(resource.RLIMIT_FSIZE, (0, 0))

        for binary, flags in (
            (
                CLI,
                [
                    "--query",
                    "filter-sum",
                    "--engine",
                    "batch-soa",
                    "--rows",
                    "0",
                    "--format",
                    "json",
                ],
            ),
            (CLI, ["--help"]),
            (BENCH, ["--help"]),
        ):
            with tempfile.TemporaryFile() as output:
                result = subprocess.run(
                    [str(binary), *flags],
                    stdout=output,
                    stderr=subprocess.PIPE,
                    text=True,
                    preexec_fn=deny_file_writes,
                    # The injected file limit also truncates LLVM profiles at process exit.
                    env={**os.environ, "LLVM_PROFILE_FILE": "/dev/null"},
                )
                self.assertNotEqual(result.returncode, 0)
                self.assertEqual(json.loads(result.stderr)["status"], "output_failed")

    def test_release_preset_resets_stale_cache_and_rejects_empty_tests(self):
        with tempfile.TemporaryDirectory() as directory:
            build = Path(directory) / "build"
            base = ["cmake", "--preset", "release", "-B", str(build)]
            dependency = GOOGLETEST_SOURCE
            commands = [
                base
                + [
                    "-DVQUERY_BUILD_TESTS=OFF",
                    "-DVQUERY_SANITIZER=thread",
                    f"-DFETCHCONTENT_SOURCE_DIR_GOOGLETEST={dependency}",
                ],
                base,
            ]
            for command in commands:
                result = subprocess.run(command, cwd=ROOT, capture_output=True, text=True)
                self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            cache = (build / "CMakeCache.txt").read_text()
            self.assertIn("VQUERY_BUILD_TESTS:BOOL=ON\n", cache)
            self.assertIn("VQUERY_SANITIZER:STRING=\n", cache)
            empty = Path(directory) / "empty"
            empty.mkdir()
            result = subprocess.run(
                ["ctest", "--preset", "release", "--test-dir", str(empty)],
                cwd=ROOT,
                text=True,
                capture_output=True,
            )
            self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)

    def test_invalid_arguments(self):
        base = ["--query", "filter-sum", "--engine", "batch-soa"]
        for flags in (
            ["--rows", "-1"],
            ["--rows", "100000001"],
            ["--rows", "1", "--rows", "2"],
            ["--cutoff", "10001"],
            ["--groups", "8"],
            ["--dim-rows", "8"],
            ["--distribution", "uniform"],
            ["--batch-size", "17"],
            ["--threads", "3"],
            ["--unknown", "1"],
            ["--rows"],
        ):
            with self.subTest(flags=flags):
                failure = invoke(CLI, *base, *flags, success=False)
                self.assertIn("invalid_argument", failure.stderr)
        invoke(CLI, "--query", "filter-sum", "--engine", "row-aos", "--threads", 2, success=False)
        invoke(
            CLI, "--query", "filter-sum", "--engine", "row-soa", "--batch-size", 256, success=False
        )
        invoke(
            CLI,
            "--query",
            "join-group-sum",
            "--engine",
            "batch-soa",
            "--match-rate",
            "0.12345",
            success=False,
        )

    def test_complete_outputs_and_empty_semantics(self):
        for query in ("filter-sum", "group-sum", "join-group-sum"):
            expected = None
            for engine, threads in (
                ("row-aos", 1),
                ("row-soa", 1),
                ("batch-soa", 1),
                ("batch-soa", 4),
            ):
                flags = [
                    "--query",
                    query,
                    "--engine",
                    engine,
                    "--threads",
                    threads,
                    "--rows",
                    1025,
                    "--format",
                    "json",
                ]
                if query == "join-group-sum":
                    flags += ["--dim-rows", 32, "--match-rate", "0.5"]
                payload = json.loads(invoke(CLI, *flags).stdout)
                identity = [
                    payload[k]
                    for k in (
                        "rows",
                        "input_checksum",
                        "result_checksum",
                        "selected_rows",
                        "joined_rows",
                    )
                ]
                if expected is not None:
                    self.assertEqual(identity, expected)
                expected = identity
            empty = json.loads(
                invoke(
                    CLI, "--query", query, "--engine", "batch-soa", "--rows", 0, "--format", "json"
                ).stdout
            )
            self.assertEqual(
                empty["rows"],
                [{"key": None, "count": 0, "sum": 0}] if query == "filter-sum" else [],
            )

    def test_benchmark_lifecycle(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "run.jsonl"
            flags = [
                "--query",
                "filter-sum",
                "--engine",
                "batch-soa",
                "--rows",
                513,
                "--warmup",
                0,
                "--repetitions",
                4,
                "--output",
                path,
            ]
            invoke(BENCH, *flags)
            meta, samples, eligible = load_run(path, include_exploratory=True)
            self.assertEqual(meta["completed_samples"], 4)
            self.assertEqual(len(samples), 4)
            self.assertFalse(eligible)
            original = path.read_bytes()
            invoke(BENCH, *flags, success=False)
            self.assertEqual(path.read_bytes(), original)
            with self.assertRaises(ValueError):
                load_run(path)
            for field in ("input", "result"):
                failed = Path(directory) / f"wrong-{field}.jsonl"
                payload = json.loads(
                    invoke(
                        CLI,
                        "--query",
                        "filter-sum",
                        "--engine",
                        "batch-soa",
                        "--rows",
                        513,
                        "--format",
                        "json",
                    ).stdout
                )
                checksums = {k: payload[f"{k}_checksum"] for k in ("input", "result")}
                checksums[field] = "0000000000000000"
                invoke(
                    BENCH,
                    *flags[:-1],
                    failed,
                    "--expected-input-checksum",
                    checksums["input"],
                    "--expected-result-checksum",
                    checksums["result"],
                    "--validation-id",
                    "a" * 64,
                    success=False,
                )
                failure = json.loads(Path(str(failed) + ".meta.json").read_text())
                self.assertEqual(failure["run_status"], "correctness_failed")
                self.assertEqual(failure["completion_state"], "failed")
                with self.assertRaises(ValueError):
                    load_run(failed, True)

    def test_runner_end_to_end(self):
        with tempfile.TemporaryDirectory() as directory:
            output = Path(directory) / "results"
            result = subprocess.run(
                [
                    sys.executable,
                    ROOT / "scripts/run_bench.py",
                    "--exploratory",
                    "--build-dir",
                    CLI.parent,
                    "--manifest",
                    ROOT / "bench/manifests/smoke.json",
                    "--output-dir",
                    output,
                ],
                text=True,
                capture_output=True,
            )
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            summary = json.loads((output / "summary.json").read_text())
            self.assertEqual(len(summary["runs"]), 15)
            self.assertEqual(summary["excluded"], [])
            for raw in output.glob("*.jsonl"):
                meta, _, eligible = load_run(raw, True)
                self.assertFalse(eligible)
                self.assertEqual(meta["validation_manifest"], "validation.json")

    def test_row_only_manifest_still_compares_engines(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            manifest = root / "row-only.json"
            manifest.write_text(
                json.dumps(
                    {
                        "schema_version": 1,
                        "warmup": 0,
                        "repetitions": 1,
                        "cases": [{"query": "filter-sum", "engine": "row-aos", "rows": 17}],
                    }
                )
            )
            output = root / "results"
            result = subprocess.run(
                [
                    sys.executable,
                    ROOT / "scripts/run_bench.py",
                    "--exploratory",
                    "--build-dir",
                    CLI.parent,
                    "--manifest",
                    manifest,
                    "--output-dir",
                    output,
                ],
                capture_output=True,
                text=True,
            )
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            validation = json.loads((output / "validation.json").read_text())
            self.assertEqual(
                {entry["config"]["engine"] for entry in validation["validated"]},
                {"row-aos", "row-soa", "batch-soa"},
            )

    def test_integer_rate_and_option_boundaries(self):
        base = ["--query", "group-sum", "--engine", "batch-soa", "--rows", 0]
        for option, values in {
            "seed": ["", "-1", "+1", "1.0", "1x", " 1", "18446744073709551616"],
            "groups": ["0", "1000001", "4294967296"],
            "memory-limit-mib": ["0", "18446744073709551615"],
            "distribution": ["zipf"],
            "format": ["csv"],
            "batch-size": ["0", "128", "16384"],
        }.items():
            for value in values:
                with self.subTest(option=option, value=value):
                    error = invoke(CLI, *base, f"--{option}", value, success=False)
                    self.assertEqual(json.loads(error.stderr)["status"], "invalid_argument")
        for flags in (
            [],
            ["--query", "nope", "--engine", "batch-soa"],
            ["--query", "filter-sum", "--engine", "nope"],
            ["positional"],
            ["--query", "filter-sum", "--engine", "batch-soa", "--format"],
        ):
            self.assertEqual(
                json.loads(invoke(CLI, *flags, success=False).stderr)["status"], "invalid_argument"
            )
        join = ["--query", "join-group-sum", "--engine", "batch-soa", "--rows", 17, "--dim-rows", 1]
        for rate in ("-0.1", "0.", ".5", "1.0001", "2", "0.00001", "nan", "0.x", "00.5"):
            self.assertEqual(
                json.loads(invoke(CLI, *join, "--match-rate", rate, success=False).stderr)[
                    "status"
                ],
                "invalid_argument",
            )
        for rate, bps in (
            ("0", 0),
            ("0.0001", 1),
            ("0.5", 5000),
            ("0.9999", 9999),
            ("1.0000", 10000),
        ):
            payload = json.loads(
                invoke(
                    CLI,
                    *join,
                    "--match-rate",
                    rate,
                    "--seed",
                    2**64 - 1,
                    "--distribution",
                    "hot-key-90",
                    "--format",
                    "json",
                ).stdout
            )
            self.assertEqual(payload["config"]["match_rate_bps"], bps)
            self.assertEqual(payload["config"]["seed"], 2**64 - 1)

    def test_text_output_matches_json_and_help(self):
        for binary in (CLI, BENCH):
            self.assertIn("--query", invoke(binary, "--help").stdout)
        for query in ("filter-sum", "group-sum", "join-group-sum"):
            flags = ["--query", query, "--engine", "row-aos", "--rows", 31]
            payload = json.loads(invoke(CLI, *flags, "--format", "json").stdout)
            text = invoke(CLI, *flags, "--format", "text").stdout.splitlines()
            self.assertIn(payload["result_checksum"], text[0])
            self.assertEqual(text[1], "key\tcount\tsum")
            expected = [
                f"{'-' if r['key'] is None else r['key']}\t{r['count']}\t{r['sum']}"
                for r in payload["rows"]
            ]
            self.assertEqual(text[2:], expected)

    def test_benchmark_validation_options(self):
        with tempfile.TemporaryDirectory() as directory:
            output = Path(directory) / "run.jsonl"
            base = [
                "--query",
                "filter-sum",
                "--engine",
                "batch-soa",
                "--rows",
                0,
                "--output",
                output,
            ]
            for flags in (
                ["--repetitions", 0],
                ["--expected-input-checksum", "a" * 16],
                ["--expected-input-checksum", "a" * 15],
                ["--expected-result-checksum", "g" * 16],
                ["--validation-id", "A" * 64],
                ["--format", "json"],
            ):
                with self.subTest(flags=flags):
                    error = invoke(BENCH, *base, *flags, success=False)
                    self.assertEqual(json.loads(error.stderr)["status"], "invalid_argument")
                    self.assertFalse(output.exists())
            invoke(BENCH, *base[:-2], success=False)

    def test_calibrated_benchmark_and_escaped_filename(self):
        with tempfile.TemporaryDirectory() as directory:
            output = Path(directory) / 'quote"slash\\newline\n한글.jsonl'
            invoke(
                BENCH,
                "--query",
                "group-sum",
                "--engine",
                "batch-soa",
                "--rows",
                100000,
                "--warmup",
                2,
                "--repetitions",
                1,
                "--output",
                output,
            )
            meta, samples, _ = load_run(output, True)
            self.assertEqual(meta["warmup"], 2)
            self.assertGreaterEqual(meta["repetitions_in_sample"], 1)
            self.assertEqual(samples[0]["metadata_path"], output.name + ".meta.json")

    def test_unicode_line_separators_in_benchmark_filenames(self):
        with tempfile.TemporaryDirectory() as directory:
            for separator in ("\u0085", "\u2028", "\u2029"):
                with self.subTest(separator=hex(ord(separator))):
                    output = Path(directory) / f"run{separator}name.jsonl"
                    invoke(
                        BENCH,
                        "--query",
                        "filter-sum",
                        "--engine",
                        "batch-soa",
                        "--rows",
                        17,
                        "--warmup",
                        0,
                        "--repetitions",
                        2,
                        "--output",
                        output,
                    )
                    # These characters are valid within JSON strings, not record delimiters.
                    lines = output.read_bytes().split(b"\n")
                    self.assertEqual(len(lines), 3)
                    self.assertEqual(lines[-1], b"")
                    expected = [json.loads(line) for line in lines[:-1]]
                    for ending in (b"\n", b"\r\n"):
                        with self.subTest(ending=ending):
                            output.write_bytes(ending.join(lines))
                            meta, samples, eligible = load_run(output, True)
                            self.assertEqual(meta["completion_state"], "complete")
                            self.assertEqual(samples, expected)
                            self.assertFalse(eligible)

    def test_budget_failure_and_existing_output_are_not_successful_runs(self):
        with tempfile.TemporaryDirectory() as directory:
            output = Path(directory) / "run.jsonl"
            flags = [
                "--query",
                "group-sum",
                "--engine",
                "batch-soa",
                "--rows",
                100000,
                "--memory-limit-mib",
                1,
            ]
            self.assertEqual(
                json.loads(invoke(CLI, *flags, success=False).stderr)["status"], "memory_limit"
            )
            invoke(BENCH, *flags, "--output", output, success=False)
            meta = json.loads(Path(str(output) + ".meta.json").read_text())
            self.assertEqual(meta["run_status"], "memory_limit")
            self.assertEqual(meta["completed_samples"], 0)
            with self.assertRaises(ValueError):
                load_run(output, True)
            raw = Path(directory) / "existing.jsonl"
            raw.write_text("keep me")
            invoke(BENCH, *flags, "--output", raw, success=False)
            self.assertEqual(raw.read_text(), "keep me")
            self.assertFalse(Path(str(raw) + ".meta.json").exists())
            blocked = Path(directory) / "blocked"
            blocked.write_text("not a directory")
            invoke(BENCH, *flags, "--output", blocked / "run.jsonl", success=False)

    def test_late_file_write_failure_invalidates_earlier_samples(self):
        def limit_file_size():
            signal.signal(signal.SIGXFSZ, signal.SIG_IGN)
            resource.setrlimit(resource.RLIMIT_FSIZE, (4096, 4096))

        with tempfile.TemporaryDirectory() as directory:
            output = Path(directory) / "limited.jsonl"
            result = subprocess.run(
                [
                    str(BENCH),
                    "--query",
                    "filter-sum",
                    "--engine",
                    "batch-soa",
                    "--rows",
                    "513",
                    "--warmup",
                    "0",
                    "--repetitions",
                    "10",
                    "--output",
                    str(output),
                ],
                capture_output=True,
                text=True,
                preexec_fn=limit_file_size,
                env={**os.environ, "LLVM_PROFILE_FILE": "/dev/null"},
            )
            self.assertNotEqual(result.returncode, 0)
            self.assertEqual(json.loads(result.stderr)["status"], "output_failed")
            meta = json.loads(Path(str(output) + ".meta.json").read_text())
            self.assertEqual(meta["completion_state"], "failed")
            self.assertGreater(meta["completed_samples"], 0)
            self.assertLess(meta["completed_samples"], 10)
            with self.assertRaises(ValueError):
                load_run(output, True)


if __name__ == "__main__":
    unittest.main()
