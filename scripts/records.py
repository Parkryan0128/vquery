"""Strict decoding and shared invariants for benchmark artifacts."""

import json
import re
import shlex

U64_MAX = (1 << 64) - 1
ENGINES = ("row-aos", "row-soa", "batch-soa")
QUERIES = ("filter-sum", "group-sum", "join-group-sum")
BUILD_FLAG_FIELDS = (
    "CMAKE_CXX_FLAGS",
    "CMAKE_CXX_FLAGS_RELEASE",
    "CMAKE_EXE_LINKER_FLAGS",
    "CMAKE_EXE_LINKER_FLAGS_RELEASE",
)
CONFIG_FIELDS = {
    "query",
    "engine",
    "rows",
    "cutoff",
    "seed",
    "groups",
    "dim_rows",
    "match_rate_bps",
    "distribution",
    "batch_size",
    "threads",
    "memory_limit_bytes",
    "generator_version",
    "serialization_version",
}


def object_record(value, label):
    if not isinstance(value, dict):
        raise ValueError(f"{label} must be a JSON object")
    return value


def integer(value, label, minimum=0, maximum=U64_MAX):
    if type(value) is not int or not minimum <= value <= maximum:
        raise ValueError(f"{label} must be an integer in [{minimum}, {maximum}]")
    return value


def hex_string(value, length, label):
    if not isinstance(value, str) or re.fullmatch(f"[0-9a-f]{{{length}}}", value) is None:
        raise ValueError(f"{label} must contain {length} lowercase hexadecimal digits")
    return value


def decode_record(text):
    def pairs(items):
        result = {}
        for key, value in items:
            if key in result:
                raise ValueError(f"duplicate JSON field: {key}")
            result[key] = value
        return result

    def invalid_constant(value):
        raise ValueError(f"non-finite JSON number: {value}")

    return object_record(
        json.loads(text, object_pairs_hook=pairs, parse_constant=invalid_constant), "record"
    )


def read_record(path):
    return decode_record(path.read_text(encoding="utf-8"))


def config_record(config):
    object_record(config, "config")
    if set(config) != CONFIG_FIELDS:
        raise ValueError("configuration fields do not match schema version 1")
    if config["query"] not in QUERIES or config["engine"] not in ENGINES:
        raise ValueError("unknown query or engine")
    integer(config["rows"], "rows", maximum=100_000_000)
    integer(config["cutoff"], "cutoff", maximum=10_000)
    integer(config["seed"], "seed")
    integer(config["memory_limit_bytes"], "memory_limit_bytes", 1)
    integer(config["generator_version"], "generator_version", 1, 1)
    integer(config["serialization_version"], "serialization_version", 1, 1)
    threads = integer(config["threads"], "threads", 1, 4)
    if threads not in (1, 2, 4) or (config["engine"] != "batch-soa" and threads != 1):
        raise ValueError("invalid thread count")
    if config["engine"] == "batch-soa":
        batch = integer(config["batch_size"], "batch_size", 256, 8192)
        if batch not in (256, 512, 1024, 2048, 4096, 8192):
            raise ValueError("invalid batch size")
    elif config["batch_size"] is not None:
        raise ValueError("row engines must have a null batch size")
    active = set()
    if config["query"] == "group-sum":
        integer(config["groups"], "groups", 1, 1_000_000)
        active = {"groups", "distribution"}
    elif config["query"] == "join-group-sum":
        integer(config["dim_rows"], "dim_rows", maximum=10_000_000)
        integer(config["match_rate_bps"], "match_rate_bps", maximum=10_000)
        if config["dim_rows"] == 0 and config["match_rate_bps"] != 0:
            raise ValueError("empty dimension requires zero match rate")
        active = {"dim_rows", "match_rate_bps", "distribution"}
    if "distribution" in active and config["distribution"] not in ("uniform", "hot-key-90"):
        raise ValueError("invalid distribution")
    for key in {"groups", "dim_rows", "match_rate_bps", "distribution"} - active:
        if config[key] is not None:
            raise ValueError(f"inactive configuration field must be null: {key}")
    return config


def publication_build(build):
    object_record(build, "build configuration")
    if (
        build.get("CMAKE_BUILD_TYPE") != "Release"
        or build.get("VQUERY_SANITIZER") != ""
        or build.get("VQUERY_BUILD_TESTS") != "ON"
    ):
        raise ValueError("publication requires a tested Release build without sanitizers")
    for field in BUILD_FLAG_FIELDS:
        flags = build.get(field)
        if not isinstance(flags, str):
            raise ValueError(f"publication requires recorded build flags: {field}")
        for flag in shlex.split(flags):
            if flag in ("--coverage", "-pg", "-p") or flag.startswith(
                (
                    "-fsanitize",
                    "-fprofile",
                    "-fcs-profile",
                    "-fauto-profile",
                    "-fcoverage",
                    "-ftest-coverage",
                    "-finstrument-functions",
                    "-flto",
                    "@",
                )
            ):
                raise ValueError(
                    f"publication build contains diagnostic, profile, LTO, or indirect flags: {flag}"
                )


def semantic_key(config):
    return json.dumps(
        {
            k: v
            for k, v in config.items()
            if k not in {"engine", "batch_size", "threads", "memory_limit_bytes"}
        },
        sort_keys=True,
    )


def result_counts(record, config, *, timed=False):
    """Check counts without scanning input again in the timed process."""
    query, rows = config["query"], config["rows"]
    if not {"selected_rows", "joined_rows", "result_rows"}.issubset(record):
        raise ValueError("missing result count fields")
    selected = record.get("selected_rows")
    joined = record.get("joined_rows")
    if timed and query == "join-group-sum":
        if selected is not None:
            raise ValueError("timed join samples must leave selected_rows null")
    else:
        integer(selected, "selected_rows", maximum=rows)
        if (
            config["cutoff"] == 0
            and selected != 0
            or config["cutoff"] == 10000
            and selected != rows
        ):
            raise ValueError("selected_rows disagrees with filter cutoff")
    if query == "join-group-sum":
        limit = 0 if config["cutoff"] == 0 else rows
        integer(joined, "joined_rows", maximum=limit if selected is None else selected)
        if config["match_rate_bps"] == 0 and joined != 0:
            raise ValueError("zero match rate must produce zero joined rows")
        if config["match_rate_bps"] == 10000:
            expected = rows if config["cutoff"] == 10000 else selected
            if expected is not None and joined != expected:
                raise ValueError("full match rate must retain every selected row")
    elif joined is not None:
        raise ValueError("joined_rows only applies to join-group-sum")
    count = integer(record.get("result_rows"), "result_rows", maximum=max(1, rows))
    if query == "filter-sum":
        if count != 1:
            raise ValueError("global aggregate must return one result row")
    else:
        retained = joined if query == "join-group-sum" else selected
        domain = min(16, config["dim_rows"]) if query == "join-group-sum" else config["groups"]
        if count > min(retained, domain) or (count == 0) != (retained == 0):
            raise ValueError("group count disagrees with retained rows or key domain")
