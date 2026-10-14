"""A late failure must invalidate every sample, including earlier successes."""

import copy
import json
from pathlib import Path
import sys
import tempfile
import unittest
from argparse import Namespace
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
from summarize import load_run, manifest_id, summarize
from run_bench import ROOT, arguments, configuration, load_manifest, run, validation_controls
from records import BUILD_FLAG_FIELDS, publication_build, result_counts


class Summaries(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.path = Path(self.temp.name) / "run.jsonl"
        config = {
            "query": "filter-sum",
            "engine": "batch-soa",
            "rows": 10,
            "cutoff": 5000,
            "seed": 42,
            "groups": None,
            "dim_rows": None,
            "match_rate_bps": None,
            "distribution": None,
            "batch_size": 2048,
            "threads": 1,
            "memory_limit_bytes": 4096 * 1024 * 1024,
            "generator_version": 1,
            "serialization_version": 1,
        }
        self.manifest = {
            "schema_version": 1,
            "source": {"revision": "c" * 40, "dirty": False},
            "binaries": {"vquery": "a" * 64, "vquery_bench": "b" * 64},
            "validated": [
                {
                    "config": config,
                    "input_checksum": "1" * 16,
                    "result_checksum": "2" * 16,
                    "result_rows": 1,
                    "selected_rows": 5,
                    "joined_rows": None,
                }
            ],
        }
        for engine in ("row-aos", "row-soa"):
            control = copy.deepcopy(self.manifest["validated"][0])
            control["config"].update(engine=engine, batch_size=None)
            self.manifest["validated"].append(control)
        self.manifest["validation_id"] = manifest_id(self.manifest)
        self.meta = {
            "schema_version": 1,
            "warmup": 3,
            "source": self.manifest["source"],
            "environment": {
                "cmake": {
                    "CMAKE_BUILD_TYPE": "Release",
                    "VQUERY_SANITIZER": "",
                    "VQUERY_BUILD_TESTS": "ON",
                    **dict.fromkeys(BUILD_FLAG_FIELDS, ""),
                }
            },
            "config": config,
            "completion_state": "complete",
            "run_status": "ok",
            "run_id": "fixture",
            "requested_samples": 15,
            "completed_samples": 15,
            "repetitions_in_sample": 2,
            "validation_id": self.manifest["validation_id"],
            "binaries": self.manifest["binaries"],
            "publication_eligible": True,
            "validation_manifest": "validation.json",
        }
        self.samples = [
            {
                **config,
                "schema_version": 1,
                "run_id": "fixture",
                "trial": i,
                "status": "ok",
                "validation_id": self.meta["validation_id"],
                "metadata_path": "run.jsonl.meta.json",
                "input_checksum": "1" * 16,
                "result_checksum": "2" * 16,
                "result_rows": 1,
                "validation_status": "checksums_matched",
                "repetitions_in_sample": 2,
                "elapsed_ns_total": 200 + i * 20,
                "elapsed_ns_per_query": 100 + i * 10,
                "selected_rows": 5,
                "joined_rows": None,
                "managed_query_peak_bytes": 1024,
                "managed_input_bytes": 200,
            }
            for i in range(15)
        ]

    def save(self):
        self.path.write_text("".join(json.dumps(s) + "\n" for s in self.samples))
        Path(str(self.path) + ".meta.json").write_text(json.dumps(self.meta))
        (self.path.parent / "validation.json").write_text(json.dumps(self.manifest))

    def bind_manifest(self):
        self.manifest["validation_id"] = manifest_id(self.manifest)
        self.meta["validation_id"] = self.manifest["validation_id"]
        for sample in self.samples:
            sample["validation_id"] = self.manifest["validation_id"]

    def test_instrumented_build_flags_cannot_be_marked_publishable(self):
        build = self.meta["environment"]["cmake"]
        for key, value in (
            ("CMAKE_CXX_FLAGS", "-fsanitize=address,undefined"),
            ("CMAKE_CXX_FLAGS_RELEASE", "-O3 -fprofile-instr-generate -fcoverage-mapping"),
            ("CMAKE_CXX_FLAGS_RELEASE", "-O3 --coverage"),
            ("CMAKE_CXX_FLAGS_RELEASE", "-O3 -fprofile-use=training.profdata"),
            ("CMAKE_CXX_FLAGS_RELEASE", "-O3 -flto=thin"),
            ("CMAKE_EXE_LINKER_FLAGS", "-fsanitize=thread"),
        ):
            with self.subTest(key=key, value=value):
                original = build[key]
                build[key] = value
                self.save()
                with self.assertRaisesRegex(ValueError, "publication"):
                    load_run(self.path, True)
                build[key] = original

    def test_publication_build_requires_complete_flag_metadata(self):
        build = self.meta["environment"]["cmake"]
        for key in BUILD_FLAG_FIELDS:
            for value in (None, [], True):
                with self.subTest(key=key, value=value):
                    build[key] = value
                    self.save()
                    with self.assertRaisesRegex(ValueError, "publication"):
                        load_run(self.path, True)
                    build[key] = ""

    def test_instrumented_builds_remain_available_for_exploration(self):
        self.meta["environment"]["cmake"]["CMAKE_CXX_FLAGS"] = "-fsanitize=address"
        self.meta["publication_eligible"] = False
        self.save()
        _, _, eligible = load_run(self.path, True)
        self.assertFalse(eligible)

    def test_all_queries_can_be_summarized_with_validated_counts(self):
        original = copy.deepcopy((self.meta, self.samples, self.manifest))
        for query in ("filter-sum", "group-sum", "join-group-sum"):
            with self.subTest(query=query):
                self.meta, self.samples, self.manifest = copy.deepcopy(original)
                config = {**self.meta["config"], "query": query}
                if query == "group-sum":
                    config.update(groups=17, distribution="hot-key-90")
                if query == "join-group-sum":
                    config.update(dim_rows=3, match_rate_bps=5000, distribution="uniform")
                self.meta["config"] = config
                joined = 3 if query == "join-group-sum" else None
                for entry in self.manifest["validated"]:
                    engine = entry["config"]["engine"]
                    entry["config"] = {
                        **config,
                        "engine": engine,
                        "batch_size": 2048 if engine == "batch-soa" else None,
                    }
                    entry["joined_rows"] = joined
                for sample in self.samples:
                    sample.update(config)
                    sample.update(
                        selected_rows=None if query == "join-group-sum" else 5, joined_rows=joined
                    )
                self.bind_manifest()
                self.save()
                rows, errors = summarize(self.path.parent)
                self.assertEqual(errors, [])
                self.assertEqual(len(rows), 1)
                self.assertTrue(rows[0]["publication_eligible"])

    def test_partial_or_parallel_only_controls_are_rejected(self):
        original = copy.deepcopy(self.manifest)
        for missing_engine in ("row-aos", "row-soa", "batch-soa"):
            with self.subTest(missing_engine=missing_engine):
                self.manifest = copy.deepcopy(original)
                if missing_engine == "batch-soa":
                    # The measured parallel case is not a single-thread control.
                    self.manifest["validated"][0]["config"]["threads"] = 4
                    self.meta["config"]["threads"] = 4
                    for sample in self.samples:
                        sample["threads"] = 4
                else:
                    self.manifest["validated"] = [
                        e
                        for e in self.manifest["validated"]
                        if e["config"]["engine"] != missing_engine
                    ]
                self.bind_manifest()
                self.save()
                with self.assertRaisesRegex(ValueError, "cross-engine"):
                    load_run(self.path, True)

    def test_invalid_counts_and_budget_are_rejected(self):
        original = copy.deepcopy(self.samples)
        for field, value in (
            ("selected_rows", -1),
            ("selected_rows", 11),
            ("selected_rows", True),
            ("selected_rows", 4),
            ("joined_rows", 1),
            ("result_rows", 0),
            ("managed_input_bytes", self.meta["config"]["memory_limit_bytes"]),
        ):
            with self.subTest(field=field, value=value):
                self.samples = copy.deepcopy(original)
                # Alter all samples to verify checks against validation, not just consistency.
                for sample in self.samples:
                    sample[field] = value
                self.save()
                with self.assertRaises(ValueError):
                    load_run(self.path, True)

    def test_exploratory_summary_with_fewer_than_four_samples(self):
        self.samples = self.samples[:1]
        self.meta.update(requested_samples=1, completed_samples=1, publication_eligible=False)
        self.save()
        self.assertEqual(summarize(self.path.parent)[0], [])
        rows, errors = summarize(self.path.parent, True)
        self.assertEqual(errors, [])
        self.assertIsNone(rows[0]["iqr_ns"])
        self.assertFalse(rows[0]["high_variability"])
        self.assertFalse(rows[0]["publication_eligible"])

    def test_join_counts_reject_impossible_results(self):
        config = {
            **self.meta["config"],
            "query": "join-group-sum",
            "dim_rows": 3,
            "match_rate_bps": 5000,
            "distribution": "uniform",
        }
        counts = {"selected_rows": 5, "joined_rows": 3, "result_rows": 2}
        result_counts(counts, config)
        result_counts({**counts, "selected_rows": None}, config, timed=True)
        for change, settings in (
            ({"joined_rows": 6}, {}),
            ({"result_rows": 0}, {}),
            ({"result_rows": 4}, {}),
            ({}, {"match_rate_bps": 0}),
            ({}, {"match_rate_bps": 10000}),
            ({}, {"cutoff": 0}),
            ({}, {"cutoff": 10000}),
        ):
            with self.subTest(change=change, settings=settings):
                with self.assertRaises(ValueError):
                    result_counts({**counts, **change}, {**config, **settings})
        with self.assertRaises(ValueError):
            result_counts(counts, config, timed=True)
        with self.assertRaises(ValueError):
            result_counts({"joined_rows": 0, "result_rows": 0}, config, timed=True)
        with self.assertRaises(ValueError):
            result_counts({**counts, "selected_rows": None}, {**config, "cutoff": 0}, timed=True)
        result_counts(
            {"selected_rows": None, "joined_rows": 0, "result_rows": 0},
            {**config, "cutoff": 0},
            timed=True,
        )

    def test_statistics_and_stale_summary_removal(self):
        self.save()
        rows, errors = summarize(self.path.parent)
        self.assertEqual(errors, [])
        self.assertEqual(rows[0]["median_ns"], 170)
        self.assertEqual(rows[0]["iqr_ns"], 70)
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

        for mutation in (
            mutate_trial,
            truncate,
            stale_manifest,
            wrong_result,
            invalid_time,
            unfinished,
            late_failure,
        ):
            with self.subTest(mutation=mutation.__name__):
                self.meta, self.samples, self.manifest = copy.deepcopy(original)
                mutation()
                self.save()
                with self.assertRaises(ValueError):
                    load_run(self.path, True)
                self.assertEqual(summarize(self.path.parent, True)[0], [])
        self.meta, self.samples, self.manifest = copy.deepcopy(original)
        self.save()
        with self.path.open("a") as stream:
            stream.write('{"truncated":')
        self.assertEqual(summarize(self.path.parent, True)[0], [])

    def test_malformed_record_does_not_abort_other_runs(self):
        self.save()
        good = self.path.read_text()
        for content in ("null\n", "[]\n", "1\n", '{"trial":0,"trial":1}\n', '{"trial":NaN}\n'):
            with self.subTest(content=content):
                bad = self.path.parent / "bad.jsonl"
                bad.write_text(content)
                Path(str(bad) + ".meta.json").write_text(
                    Path(str(self.path) + ".meta.json").read_text()
                )
                rows, errors = summarize(self.path.parent)
                self.assertEqual(len(rows), 1)
                self.assertEqual(len(errors), 1)
                self.assertEqual(self.path.read_text(), good)
        for content in ("null", "[]", '{"schema_version":1,"schema_version":2}'):
            Path(str(bad) + ".meta.json").write_text(content)
            self.assertEqual(len(summarize(self.path.parent)[0]), 1)
        (self.path.parent / "validation.json").write_text("null")
        self.assertEqual(summarize(self.path.parent)[0], [])

    def test_publication_protocol_cannot_be_bypassed_by_a_flag(self):
        original = copy.deepcopy(self.meta)
        for change in (
            {"warmup": 0},
            {"source": {"revision": "c" * 40, "dirty": True}},
            {"environment": {"cmake": {"CMAKE_BUILD_TYPE": "Debug"}}},
        ):
            with self.subTest(change=change):
                self.meta = {**original, **change}
                self.save()
                with self.assertRaises(ValueError):
                    load_run(self.path, True)
        self.meta = original
        self.manifest["validated"] = self.manifest["validated"][:1]
        self.manifest["validation_id"] = manifest_id(self.manifest)
        self.meta["validation_id"] = self.manifest["validation_id"]
        for sample in self.samples:
            sample["validation_id"] = self.manifest["validation_id"]
        self.save()
        with self.assertRaisesRegex(ValueError, "cross-engine"):
            load_run(self.path, True)

    def test_wrong_field_types_and_nonfinite_values_are_rejected(self):
        original = copy.deepcopy(self.samples)
        for field, value in (
            ("elapsed_ns_per_query", True),
            ("elapsed_ns_per_query", float("inf")),
            ("trial", False),
            ("managed_query_peak_bytes", -1),
            ("input_checksum", None),
            ("result_rows", []),
        ):
            with self.subTest(field=field, value=value):
                self.samples = copy.deepcopy(original)
                self.samples[0][field] = value
                self.save()
                self.assertEqual(summarize(self.path.parent, True)[0], [])


class RunnerInput(unittest.TestCase):
    def test_runner_rejects_a_valid_result_for_the_wrong_requested_input(self):
        case = {"query": "filter-sum", "engine": "row-aos", "rows": 10}
        payload = {"config": configuration(arguments({**case, "rows": 11}, {}))}
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            manifest = root / "manifest.json"
            manifest.write_text(json.dumps({"schema_version": 1, "cases": [case]}))
            args = Namespace(
                manifest=manifest,
                build_dir=ROOT / "build/debug",
                output_dir=root / "results",
                exploratory=True,
            )
            with (
                patch(
                    "run_bench.source_state", return_value={"revision": "c" * 40, "dirty": False}
                ),
                patch("run_bench.call", return_value=Namespace(stdout=json.dumps(payload))),
                patch("run_bench.digest", return_value="a" * 64),
                patch(
                    "run_bench.build_environment", return_value={"hardware": {"physical_cores": 4}}
                ),
            ):
                with self.assertRaisesRegex(ValueError, "configuration differs"):
                    run(args)
            self.assertFalse((args.output_dir / "validation.json").exists())
            self.assertEqual(list(args.output_dir.glob("*.jsonl")), [])

    def test_publication_flag_policy_handles_quoted_and_indirect_flags(self):
        build = {
            "CMAKE_BUILD_TYPE": "Release",
            "VQUERY_SANITIZER": "",
            "VQUERY_BUILD_TESTS": "ON",
            **dict.fromkeys(BUILD_FLAG_FIELDS, ""),
        }
        build["CMAKE_CXX_FLAGS"] = '-Wall -DNOTE="profile and coverage" -fno-omit-frame-pointer'
        build["CMAKE_CXX_FLAGS_RELEASE"] = "-O3 -DNDEBUG"
        publication_build(build)
        for flag in (
            "-fprofile-arcs",
            "-fcs-profile-generate",
            "-fauto-profile=data.afdo",
            "-finstrument-functions",
            "-pg",
            "-ftest-coverage",
            "@extra-flags.rsp",
        ):
            with self.subTest(flag=flag):
                build["CMAKE_CXX_FLAGS_RELEASE"] = flag
                with self.assertRaisesRegex(ValueError, "publication"):
                    publication_build(build)

    def test_runner_rejects_instrumentation_before_creating_results(self):
        build = {
            "CMAKE_BUILD_TYPE": "Release",
            "VQUERY_SANITIZER": "",
            "VQUERY_BUILD_TESTS": "ON",
            **dict.fromkeys(BUILD_FLAG_FIELDS, ""),
        }
        build["CMAKE_CXX_FLAGS"] = "-fsanitize=undefined"
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            manifest = root / "manifest.json"
            manifest.write_text(
                json.dumps(
                    {"schema_version": 1, "cases": [{"query": "filter-sum", "engine": "row-aos"}]}
                )
            )
            args = Namespace(
                manifest=manifest,
                build_dir=ROOT / "build/release",
                output_dir=root / "results",
                exploratory=False,
            )
            with (
                patch(
                    "run_bench.source_state", return_value={"revision": "c" * 40, "dirty": False}
                ),
                patch("run_bench.call"),
                patch("run_bench.digest", return_value="a" * 64),
                patch("run_bench.build_environment", return_value={"cmake": build}),
            ):
                with self.assertRaisesRegex(ValueError, "publication"):
                    run(args)
            self.assertFalse(args.output_dir.exists())

    def test_invalid_manifest_is_rejected_before_work(self):
        valid = {"schema_version": 1, "cases": [{"query": "filter-sum", "engine": "row-aos"}]}
        cases = [
            None,
            [],
            {},
            {**valid, "cases": [None]},
            {**valid, "cases": [{}]},
            {**valid, "defaults": []},
            {**valid, "warmup": True},
            {**valid, "repetitions": 0},
            {**valid, "repetitons": 15},
            {**valid, "cases": [{"query": [], "engine": "row-aos"}]},
            {**valid, "defaults": {"rows": None}},
            *(
                {**valid, "defaults": {key: value}}
                for key, value in (
                    ("rows", 100_000_001),
                    ("cutoff", 10001),
                    ("memory-limit-mib", 0),
                    ("seed", 1 << 64),
                )
            ),
            *(
                {
                    **valid,
                    "cases": [
                        {"query": "join-group-sum", "engine": "batch-soa", "match-rate": rate}
                    ],
                }
                for rate in ("1.0001", "0.12345", ".5", "1.", "1e-1", "nan", True)
            ),
            {**valid, "cases": [{"query": "join-group-sum", "engine": "batch-soa", "dim-rows": 0}]},
            {**valid, "cases": [{"query": "group-sum", "engine": "batch-soa", "groups": 0}]},
            {**valid, "cases": [{"query": "filter-sum", "engine": "batch-soa", "threads": 3}]},
            {**valid, "cases": [{"query": "filter-sum", "engine": "batch-soa", "batch-size": 257}]},
        ]
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "manifest.json"
            for case in cases:
                with self.subTest(case=case):
                    path.write_text(json.dumps(case))
                    with self.assertRaises(ValueError):
                        load_manifest(path)
            path.write_text(json.dumps(valid))
            self.assertEqual(load_manifest(path), valid)

    def test_every_engine_has_independent_controls(self):
        for engine in ("row-aos", "row-soa", "batch-soa"):
            flags = ["--query", "filter-sum", "--engine", engine, "--rows", "10"]
            controls = [dict(zip(c[::2], c[1::2])) for c in validation_controls(flags)]
            self.assertEqual({c["--engine"] for c in controls}, {"row-aos", "row-soa", "batch-soa"})
            for control in controls:
                self.assertEqual(control["--threads"], "1")
                self.assertEqual("--batch-size" in control, control["--engine"] == "batch-soa")


if __name__ == "__main__":
    unittest.main()
