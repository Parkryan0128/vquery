"""Check the report against real archived records without requiring plotting packages."""

import copy
import json
from pathlib import Path
import shutil
import sys
import tempfile
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from study import load_study, speedups

ARCHIVE = ROOT / "results/published/apple-m5-2026-10-14"


class Study(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory()
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        (self.root / "manifests").mkdir()
        (self.root / "core").mkdir()
        self.spec = json.loads((ARCHIVE / "manifests/core.json").read_text())
        self.spec["cases"] = self.spec["cases"][:2]
        self.save_spec()
        for name in (
            "0000.jsonl",
            "0000.jsonl.meta.json",
            "0001.jsonl",
            "0001.jsonl.meta.json",
            "validation.json",
        ):
            shutil.copyfile(ARCHIVE / "core" / name, self.root / "core" / name)

    def save_spec(self):
        (self.root / "manifests/core.json").write_text(json.dumps(self.spec))

    def load(self):
        with patch("study.SUITES", ("core",)):
            return load_study(self.root)

    def test_complete_archive_preserves_published_analysis(self):
        suites, identity, _ = load_study(ARCHIVE)
        published = json.loads((ROOT / "docs/figures/analysis.json").read_text())
        self.assertEqual(suites, published["suites"])
        self.assertEqual(identity, published["identity"])
        self.assertEqual(
            speedups(suites),
            tuple(
                published[k] for k in ("core_speedups", "parallel_speedups", "repeated_matrices")
            ),
        )
        self.assertEqual(sum(len(rows) for rows in suites.values()), 201)

    def test_optional_rss_can_be_missing_null_or_partially_available(self):
        path = self.root / "core/0000.jsonl"
        samples = [json.loads(line) for line in path.read_text().splitlines()]
        for sample in samples:
            sample.pop("process_peak_rss_bytes")
        for available in (False, True):
            with self.subTest(available=available):
                samples[0]["process_peak_rss_bytes"] = None
                if available:
                    samples[-1]["process_peak_rss_bytes"] = 12345
                path.write_text("".join(json.dumps(sample) + "\n" for sample in samples))
                rows = self.load()[0]["core"]
                self.assertEqual(rows[0]["process_peak_rss_bytes"], 12345 if available else None)
                self.assertIsNotNone(rows[1]["process_peak_rss_bytes"])

    def test_reordered_and_repeated_manifest_cases_are_accepted(self):
        self.spec["cases"] = list(reversed(self.spec["cases"])) + self.spec["cases"]
        self.save_spec()
        self.assertEqual(len(self.load()[0]["core"]), 2)

    def test_changed_workload_is_rejected_even_when_file_count_matches(self):
        original = copy.deepcopy(self.spec)
        for key, value in (("seed", 999), ("cutoff", 0), ("memory-limit-mib", 8192)):
            with self.subTest(key=key):
                self.spec = copy.deepcopy(original)
                self.spec["defaults"][key] = value
                self.save_spec()
                with self.assertRaisesRegex(ValueError, "configuration differs"):
                    self.load()
        self.spec = original
        self.spec["cases"][0]["rows"] += 1
        self.save_spec()
        with self.assertRaisesRegex(ValueError, "configuration differs"):
            self.load()

    def test_changed_timing_or_schedule_is_rejected(self):
        original = copy.deepcopy(self.spec)
        for key, value in (("warmup", 4), ("repetitions", 16), ("schedule_seed", 7)):
            with self.subTest(key=key):
                self.spec = copy.deepcopy(original)
                self.spec[key] = value
                self.save_spec()
                with self.assertRaisesRegex(ValueError, "differs from experiment manifest"):
                    self.load()

    def test_missing_or_extra_runs_are_rejected(self):
        path = self.root / "core/0001.jsonl"
        content = path.read_bytes()
        path.unlink()
        with self.assertRaisesRegex(ValueError, "run files"):
            self.load()
        path.write_bytes(content)
        (self.root / "core/extra.jsonl").write_bytes(content)
        with self.assertRaisesRegex(ValueError, "run files"):
            self.load()

    def test_duplicate_configuration_cannot_replace_a_missing_case(self):
        directory = self.root / "core"
        content = (directory / "0000.jsonl").read_text()
        (directory / "0001.jsonl").write_text(
            content.replace("0000.jsonl.meta.json", "0001.jsonl.meta.json")
        )
        shutil.copyfile(directory / "0000.jsonl.meta.json", directory / "0001.jsonl.meta.json")
        with self.assertRaisesRegex(ValueError, "duplicate configuration"):
            self.load()

    def test_mixed_hosts_and_invalid_schedule_types_are_rejected(self):
        path = self.root / "core/0001.jsonl.meta.json"
        original = json.loads(path.read_text())
        for field, value in (
            ("platform", "another host"),
            ("schedule_seed", None),
            ("schedule_seed", True),
        ):
            with self.subTest(field=field, value=value):
                meta = copy.deepcopy(original)
                if field == "platform":
                    meta["environment"][field] = value
                else:
                    meta[field] = value
                path.write_text(json.dumps(meta))
                with self.assertRaises(ValueError):
                    self.load()

    def test_speedups_reject_different_inputs_between_engines(self):
        suites, _, _ = load_study(ARCHIVE)
        for field, value in (("seed", 7), ("cutoff", 0), ("threads", 4)):
            with self.subTest(field=field):
                changed = copy.deepcopy(suites)
                changed["core"][0]["config"][field] = value
                with self.assertRaisesRegex(ValueError, "incomparable"):
                    speedups(changed)


if __name__ == "__main__":
    unittest.main()
