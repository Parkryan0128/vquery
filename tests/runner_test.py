"""A late failure must invalidate every sample, including earlier successes."""
import copy
import json
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
from summarize import load_run, manifest_id, summarize


class Summaries(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.path = Path(self.temp.name) / "run.jsonl"
        config = {"query": "filter-sum", "engine": "batch-soa", "rows": 10}
        self.manifest = {"schema_version": 1, "binaries": {"vquery": "a" * 64, "vquery_bench": "b" * 64},
                         "validated": [{"config": config, "input_checksum": "1" * 16, "result_checksum": "2" * 16, "result_rows": 1}]}
        self.manifest["validation_id"] = manifest_id(self.manifest)
        self.meta = {"config": config, "completion_state": "complete", "run_status": "ok", "run_id": "fixture",
                     "requested_samples": 4, "completed_samples": 4, "repetitions_in_sample": 2,
                     "validation_id": self.manifest["validation_id"], "binaries": self.manifest["binaries"],
                     "publication_eligible": True, "validation_manifest": "validation.json"}
        self.samples = [{**config, "schema_version": 1, "run_id": "fixture", "trial": i, "status": "ok",
                         "validation_id": self.meta["validation_id"], "metadata_path": "run.jsonl.meta.json",
                         "input_checksum": "1" * 16, "result_checksum": "2" * 16, "result_rows": 1,
                         "validation_status": "checksums_matched", "repetitions_in_sample": 2,
                         "elapsed_ns_total": 200 + i * 20, "elapsed_ns_per_query": 100 + i * 10,
                         "managed_query_peak_bytes": 1024} for i in range(4)]

    def save(self):
        self.path.write_text("".join(json.dumps(s) + "\n" for s in self.samples))
        Path(str(self.path) + ".meta.json").write_text(json.dumps(self.meta))
        (self.path.parent / "validation.json").write_text(json.dumps(self.manifest))

    def test_statistics_and_stale_summary_removal(self):
        self.save()
        rows, errors = summarize(self.path.parent)
        self.assertEqual(errors, [])
        self.assertEqual(rows[0]["median_ns"], 115)
        self.assertEqual(rows[0]["iqr_ns"], 15)
        self.meta.update(completion_state="failed", run_status="memory_limit")
        self.save()
        rows, errors = summarize(self.path.parent)
        self.assertEqual(rows, [])
        self.assertEqual(len(errors), 1)
        self.assertFalse((self.path.parent / "summary.csv").exists())

    def test_corruption_rejects_entire_run(self):
        original = copy.deepcopy((self.meta, self.samples, self.manifest))
        def mutate_trial():
            self.samples[-1]["trial"] = 0
        def truncate():
            self.samples.pop()
        def stale_manifest():
            self.manifest["binaries"]["vquery"] = "c" * 64
        def wrong_result():
            self.samples[2]["result_checksum"] = "f" * 16
        def invalid_time():
            self.samples[0]["elapsed_ns_per_query"] = 1
        def unfinished():
            self.meta["completion_state"] = "incomplete"
        def late_failure():
            self.samples[-1]["status"] = "correctness_failed"
        for mutation in (mutate_trial, truncate, stale_manifest, wrong_result, invalid_time, unfinished, late_failure):
            with self.subTest(mutation=mutation.__name__):
                self.meta, self.samples, self.manifest = copy.deepcopy(original)
                mutation(); self.save()
                with self.assertRaises(ValueError):
                    load_run(self.path, True)
                self.assertEqual(summarize(self.path.parent, True)[0], [])
        self.meta, self.samples, self.manifest = copy.deepcopy(original)
        self.save()
        with self.path.open("a") as stream:
            stream.write('{"truncated":')
        self.assertEqual(summarize(self.path.parent, True)[0], [])


if __name__ == "__main__":
    unittest.main()
