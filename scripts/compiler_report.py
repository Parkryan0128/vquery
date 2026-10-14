#!/usr/bin/env python3
"""Emit Clang loop diagnostics and assembly using the configured Release flags."""

import argparse
import json
from pathlib import Path
import shlex
import subprocess

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--build-dir", type=Path, default=ROOT / "build/release")
    parser.add_argument("--output-dir", type=Path, required=True)
    args = parser.parse_args()
    commands = json.loads((args.build_dir / "compile_commands.json").read_text())
    args.output_dir.mkdir(parents=True, exist_ok=False)
    records = []
    for name in ("operators", "execute"):
        entry = next(c for c in commands if Path(c["file"]) == ROOT / f"src/execution/{name}.cpp")
        original = entry.get("arguments") or shlex.split(entry["command"])
        flags, i = [], 0
        while i < len(original):
            if original[i] == "-o":
                i += 2
            elif original[i] == "-c":
                i += 1
            else:
                flags.append(original[i])
                i += 1
        compiler = subprocess.check_output([flags[0], "--version"], text=True)
        if "clang" not in compiler.lower():
            raise ValueError("this diagnostic helper requires Clang")
        assembly = args.output_dir.resolve() / f"{name}.s"
        flags += [
            "-S",
            "-Rpass=loop-vectorize",
            "-Rpass-missed=loop-vectorize",
            "-Rpass-analysis=loop-vectorize",
            "-o",
            str(assembly),
        ]
        result = subprocess.run(
            flags, cwd=entry["directory"], text=True, capture_output=True, check=True
        )

        def scrub(text):
            return text.replace(str(ROOT), "<repo>")

        (args.output_dir / f"{name}.remarks.txt").write_text(scrub(result.stderr))
        assembly.write_text(scrub(assembly.read_text()))
        records.append(
            {
                "translation_unit": f"src/execution/{name}.cpp",
                "compiler": compiler,
                "command": [scrub(flag) for flag in flags],
            }
        )
    (args.output_dir / "commands.json").write_text(json.dumps(records, indent=2) + "\n")
    print(f"Wrote compiler diagnostics to {args.output_dir}")


if __name__ == "__main__":
    main()
