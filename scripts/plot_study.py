#!/usr/bin/env python3
"""Validate a complete study and regenerate its figures and numerical analysis."""

import argparse
import json
import os
from pathlib import Path
import tempfile

os.environ.setdefault("MPLCONFIGDIR", str(Path(tempfile.gettempdir()) / "vquery-matplotlib"))
os.environ.setdefault("XDG_CACHE_HOME", str(Path(tempfile.gettempdir()) / "vquery-cache"))
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt

from records import ENGINES, QUERIES
from study import find, load_study, speedups

TITLES = {
    "filter-sum": "Filter + sum",
    "group-sum": "Group by + sum",
    "join-group-sum": "Join + group by",
}
COLORS = ("#2563eb", "#d97706", "#0f766e")
MARKERS = ("o", "s", "^")


def style(axis):
    axis.spines[["top", "right"]].set_visible(False)
    axis.grid(axis="y", color="#e2e8f0", linewidth=0.7)
    axis.set_axisbelow(True)


def errors(rows):
    return [
        [r["median_ms"] - r["q25_ms"] for r in rows],
        [r["q75_ms"] - r["median_ms"] for r in rows],
    ]


def save(fig, directory, name, title, subtitle):
    fig.suptitle(title, fontsize=16, fontweight="bold", y=0.99, x=0.07, ha="left")
    fig.text(0.07, 0.89, subtitle, fontsize=10, color="#475569")
    fig.tight_layout(rect=(0.015, 0.075, 1, 0.85), w_pad=2.0)
    fig.savefig(directory / (name + ".png"), dpi=180, facecolor="white")
    fig.savefig(directory / (name + ".svg"), facecolor="white", metadata={"Date": None})
    plt.close(fig)


def figures(suites, parallel, directory, host):
    plt.rcParams.update(
        {
            "font.family": "DejaVu Sans",
            "font.size": 10,
            "axes.labelcolor": "#334155",
            "text.color": "#0f172a",
            "svg.hashsalt": "vquery-study-v1",
        }
    )
    fig, axes = plt.subplots(1, 3, figsize=(12, 4.5))
    for axis, query in zip(axes, QUERIES):
        for engine, color, marker in zip(ENGINES, COLORS, MARKERS):
            rows = [
                find(suites["core"], query=query, engine=engine, rows=n, threads=1, cutoff=5000)
                for n in (100000, 1000000, 10000000)
            ]
            axis.errorbar(
                [0, 1, 2],
                [r["median_ms"] for r in rows],
                yerr=errors(rows),
                color=color,
                marker=marker,
                capsize=3,
                linewidth=1.8,
                label=engine,
            )
        axis.set(
            title=TITLES[query],
            xticks=[0, 1, 2],
            xticklabels=["100K", "1M", "10M"],
            xlabel="Fact rows",
            yscale="log",
            ylabel="Query time (ms, log scale)",
        )
        style(axis)
    handles, labels = axes[0].get_legend_handles_labels()
    fig.legend(handles, labels, loc="lower center", ncol=3, frameon=False)
    save(
        fig,
        directory,
        "core-latency",
        "Execution time across three fixed query plans",
        f"{host} · single thread · cutoff 5000 · median and IQR of {suites['core'][0]['samples']} samples; lower is faster",
    )

    fig, axes = plt.subplots(1, 2, figsize=(11, 4.6))
    for engine, color, marker in zip(ENGINES, COLORS, MARKERS):
        shared = {
            "engine": engine,
            "rows": 1000000,
            "threads": 1,
            "batch_size": 2048 if engine == "batch-soa" else None,
        }
        rows = [
            find(suites["sensitivity"], **shared, query="filter-sum", cutoff=c)
            for c in (0, 100, 1000, 5000, 10000)
        ]
        axes[0].errorbar(
            [0, 1, 10, 50, 100],
            [r["median_ms"] for r in rows],
            yerr=errors(rows),
            color=color,
            marker=marker,
            capsize=3,
            label=engine,
        )
        rows = [
            find(
                suites["sensitivity"],
                **shared,
                query="join-group-sum",
                dim_rows=m,
                match_rate_bps=10000,
                distribution="uniform",
            )
            for m in (1000, 100000, 1000000)
        ]
        axes[1].errorbar(
            [1000, 100000, 1000000],
            [r["median_ms"] for r in rows],
            yerr=errors(rows),
            color=color,
            marker=marker,
            capsize=3,
            label=engine,
        )
    axes[0].set(
        title="Filter + sum",
        xticks=[0, 10, 50, 100],
        xlabel="Requested pass rate (%)",
        ylabel="Query time (ms)",
        ylim=(0, None),
    )
    axes[1].set(
        title="Join + group by",
        xscale="log",
        xticks=[1000, 100000, 1000000],
        xticklabels=["1K", "100K", "1M"],
        xlabel="Customer rows (log scale)",
        ylabel="Query time (ms)",
        ylim=(0, None),
    )
    for axis in axes:
        style(axis)
    handles, labels = axes[0].get_legend_handles_labels()
    fig.legend(handles, labels, loc="lower center", ncol=3, frameon=False)
    save(
        fig,
        directory,
        "sensitivity",
        "Input conditions change the cost of each plan",
        f"{host} · 1M facts · single thread · median and IQR of {suites['sensitivity'][0]['samples']} samples",
    )

    fig, axes = plt.subplots(1, 3, figsize=(12, 4.5))
    for axis, query in zip(axes, QUERIES):
        axis.plot([1, 2, 4], [1, 2, 4], "--", color="#94a3b8", linewidth=1, label="Ideal")
        for n, color, marker in zip(
            (10000, 100000, 1000000, 10000000),
            ("#94a3b8", "#d97706", "#2563eb", "#0f766e"),
            ("x", "s", "o", "^"),
        ):
            rows = [
                next(
                    r
                    for r in parallel
                    if r["query"] == query and r["rows"] == n and r["threads"] == t
                )
                for t in (1, 2, 4)
            ]
            axis.plot(
                [1, 2, 4],
                [r["speedup"] for r in rows],
                marker=marker,
                color=color,
                label={10000: "10K", 100000: "100K", 1000000: "1M", 10000000: "10M"}[n],
            )
        axis.set(
            title=TITLES[query],
            xlabel="Threads",
            ylabel="Speedup vs one thread",
            xticks=[1, 2, 4],
            ylim=(0, None),
        )
        style(axis)
    handles, labels = axes[0].get_legend_handles_labels()
    fig.legend(handles, labels, loc="lower center", ncol=5, frameon=False, title="Fact rows")
    save(
        fig,
        directory,
        "parallel",
        "Parallel scaling depends on input size",
        f"{host} · batch-soa · ratios of medians · includes join build, startup, merge, and cleanup",
    )

    fig, axes = plt.subplots(1, 2, figsize=(11, 4.6))
    for axis, m in zip(axes, (100000, 1000000)):
        for n, label, color, marker in (
            (0, "Empty probe control", COLORS[1], "s"),
            (1000000, "1M facts", COLORS[2], "o"),
        ):
            rows = [
                find(
                    suites["join-build"],
                    query="join-group-sum",
                    engine="batch-soa",
                    rows=n,
                    dim_rows=m,
                    threads=t,
                )
                for t in (1, 2, 4)
            ]
            axis.errorbar(
                [1, 2, 4],
                [r["median_ms"] for r in rows],
                yerr=errors(rows),
                color=color,
                marker=marker,
                capsize=3,
                label=label,
            )
        axis.set(
            title=f"{m:,} customers",
            xlabel="Threads",
            ylabel="Query time (ms)",
            xticks=[1, 2, 4],
            ylim=(0, None),
        )
        style(axis)
    handles, labels = axes[0].get_legend_handles_labels()
    fig.legend(handles, labels, loc="lower center", ncol=2, frameon=False)
    save(
        fig,
        directory,
        "join-build",
        "The join rebuilds its customer table on every execution",
        f"{host} · batch-soa · empty probe still includes build, allocation, and cleanup; it is not a phase timer",
    )


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input-dir", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    args = parser.parse_args()
    suites, signature, env = load_study(args.input_dir)
    core, parallel, repeats = speedups(suites)
    all_rows = [r for rows in suites.values() for r in rows]
    analysis = {
        "identity": signature,
        "runs": len(all_rows),
        "samples": sum(r["samples"] for r in all_rows),
        "high_variability": [r["file"] for r in all_rows if r["iqr_percent"] > 10],
        "core_speedups": core,
        "parallel_speedups": parallel,
        "repeated_matrices": repeats,
        "suites": suites,
    }
    args.output_dir.mkdir(parents=True, exist_ok=True)
    (args.output_dir / "analysis.json").write_text(json.dumps(analysis, indent=2) + "\n")
    host = env["hardware"].get("cpu_model") or env["machine"]
    figures(suites, parallel, args.output_dir, host)
    print(
        f"Validated {analysis['runs']} runs / {analysis['samples']} samples; "
        f"{len(analysis['high_variability'])} runs have IQR/median > 10%."
    )
    print(f"Wrote four PNG/SVG figures and analysis.json to {args.output_dir}")


if __name__ == "__main__":
    main()
