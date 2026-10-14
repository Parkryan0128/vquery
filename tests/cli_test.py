"""Exercise the actual executables and persisted benchmark failure states."""
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
import resource
import signal

CLI, BENCH = map(Path, sys.argv[1:3])
sys.argv = sys.argv[:1]
ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from summarize import load_run


def invoke(binary, *flags, success=True):
    result = subprocess.run([str(binary), *map(str, flags)], text=True, capture_output=True)
    if (result.returncode == 0) != success:
        raise AssertionError(f"unexpected exit {result.returncode}: {result.stdout}\n{result.stderr}")
    return result


class Contracts(unittest.TestCase):
    def test_buffered_stdout_failure_is_reported(self):
        def deny_file_writes():
            signal.signal(signal.SIGXFSZ, signal.SIG_IGN)
            resource.setrlimit(resource.RLIMIT_FSIZE, (0, 0))

        for flags in (["--query", "filter-sum", "--engine", "batch-soa", "--rows", "0", "--format", "json"],
                      ["--help"]):
            with tempfile.TemporaryFile() as output:
                result = subprocess.run([str(CLI), *flags], stdout=output, stderr=subprocess.PIPE,
                                        text=True, preexec_fn=deny_file_writes)
                self.assertNotEqual(result.returncode, 0)
                self.assertEqual(json.loads(result.stderr)["status"], "output_failed")

    def test_release_preset_resets_stale_cache_and_rejects_empty_tests(self):
        with tempfile.TemporaryDirectory() as directory:
            build = Path(directory) / "build"
            base = ["cmake", "--preset", "release", "-B", str(build)]
            dependency = CLI.parent / "_deps/googletest-src"
            commands = [base + ["-DVQUERY_BUILD_TESTS=OFF", "-DVQUERY_SANITIZER=thread",
                                f"-DFETCHCONTENT_SOURCE_DIR_GOOGLETEST={dependency}"], base]
            for command in commands:
                result = subprocess.run(command, cwd=ROOT, capture_output=True, text=True)
                self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            cache = (build / "CMakeCache.txt").read_text()
            self.assertIn("VQUERY_BUILD_TESTS:BOOL=ON\n", cache)
            self.assertIn("VQUERY_SANITIZER:STRING=\n", cache)
            empty = Path(directory) / "empty"
            empty.mkdir()
            result = subprocess.run(["ctest", "--preset", "release", "--test-dir", str(empty)],
                                    cwd=ROOT, text=True, capture_output=True)
            self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)

    def test_invalid_arguments(self):
        base = ["--query", "filter-sum", "--engine", "batch-soa"]
        for flags in (["--rows", "-1"], ["--rows", "100000001"], ["--rows", "1", "--rows", "2"],
                      ["--cutoff", "10001"], ["--groups", "8"], ["--dim-rows", "8"],
                      ["--distribution", "uniform"], ["--batch-size", "17"], ["--threads", "3"],
                      ["--unknown", "1"], ["--rows"]):
            with self.subTest(flags=flags):
                failure = invoke(CLI, *base, *flags, success=False)
                self.assertIn("invalid_argument", failure.stderr)
        invoke(CLI, "--query", "filter-sum", "--engine", "row-aos", "--threads", 2, success=False)
        invoke(CLI, "--query", "filter-sum", "--engine", "row-soa", "--batch-size", 256, success=False)
        invoke(CLI, "--query", "join-group-sum", "--engine", "batch-soa", "--match-rate", "0.12345", success=False)

    def test_complete_outputs_and_empty_semantics(self):
        for query in ("filter-sum", "group-sum", "join-group-sum"):
            expected = None
            for engine, threads in (("row-aos", 1), ("row-soa", 1), ("batch-soa", 1), ("batch-soa", 4)):
                flags = ["--query", query, "--engine", engine, "--threads", threads, "--rows", 1025, "--format", "json"]
                if query == "join-group-sum":
                    flags += ["--dim-rows", 32, "--match-rate", "0.5"]
                payload = json.loads(invoke(CLI, *flags).stdout)
                identity = [payload[k] for k in ("rows", "input_checksum", "result_checksum", "selected_rows", "joined_rows")]
                if expected is not None:
                    self.assertEqual(identity, expected)
                expected = identity
            empty = json.loads(invoke(CLI, "--query", query, "--engine", "batch-soa", "--rows", 0, "--format", "json").stdout)
            self.assertEqual(empty["rows"], [{"key": None, "count": 0, "sum": 0}] if query == "filter-sum" else [])

    def test_benchmark_lifecycle(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "run.jsonl"
            flags = ["--query", "filter-sum", "--engine", "batch-soa", "--rows", 513,
                     "--warmup", 0, "--repetitions", 4, "--output", path]
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
                payload = json.loads(invoke(CLI, "--query", "filter-sum", "--engine", "batch-soa", "--rows", 513, "--format", "json").stdout)
                checksums = {k: payload[f"{k}_checksum"] for k in ("input", "result")}
                checksums[field] = "0000000000000000"
                invoke(BENCH, *flags[:-1], failed, "--expected-input-checksum", checksums["input"],
                       "--expected-result-checksum", checksums["result"], "--validation-id", "a" * 64, success=False)
                failure = json.loads(Path(str(failed) + ".meta.json").read_text())
                self.assertEqual(failure["run_status"], "correctness_failed")
                self.assertEqual(failure["completion_state"], "failed")
                with self.assertRaises(ValueError):
                    load_run(failed, True)

    def test_runner_end_to_end(self):
        with tempfile.TemporaryDirectory() as directory:
            output = Path(directory) / "results"
            result = subprocess.run([sys.executable, ROOT / "scripts/run_bench.py", "--exploratory",
                                     "--build-dir", CLI.parent, "--manifest", ROOT / "bench/manifests/smoke.json",
                                     "--output-dir", output], text=True, capture_output=True)
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
            manifest.write_text(json.dumps({"schema_version": 1, "warmup": 0, "repetitions": 1,
                                           "cases": [{"query": "filter-sum", "engine": "row-aos", "rows": 17}]}))
            output = root / "results"
            result = subprocess.run([sys.executable, ROOT / "scripts/run_bench.py", "--exploratory",
                                     "--build-dir", CLI.parent, "--manifest", manifest, "--output-dir", output],
                                    capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            validation = json.loads((output / "validation.json").read_text())
            self.assertEqual({entry["config"]["engine"] for entry in validation["validated"]},
                             {"row-aos", "row-soa", "batch-soa"})


if __name__ == "__main__":
    unittest.main()
