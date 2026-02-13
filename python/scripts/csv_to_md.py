#!/usr/bin/env python3
# /// script
# requires-python = ">=3.11"
# dependencies = [
# ]
# ///

# Purpose: Convert a CSV file to a Markdown table.

from __future__ import annotations

import argparse
import csv
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, Sequence


@dataclass(frozen=True)
class CsvOptions:
    path: Path
    delimiter: str | None
    has_header: bool
    encoding: str
    pretty: bool


def parse_args(argv: Sequence[str]) -> CsvOptions:
    parser = argparse.ArgumentParser(
        description="Convert a CSV file to a Markdown table.",
    )
    parser.add_argument("path", type=Path, help="Path to the CSV file.")
    parser.add_argument(
        "--delimiter",
        help="CSV delimiter (default: auto-detect).",
    )
    parser.add_argument(
        "--no-header",
        action="store_true",
        help="Treat the first row as data (auto-generate header).",
    )
    parser.add_argument(
        "--encoding",
        default="utf-8",
        help="File encoding (default: utf-8).",
    )
    parser.add_argument(
        "--pretty",
        action="store_true",
        help="Pad columns to align for readable output.",
    )

    args = parser.parse_args(argv)
    delimiter = args.delimiter if args.delimiter else None
    return CsvOptions(
        path=args.path,
        delimiter=delimiter,
        has_header=not args.no_header,
        encoding=args.encoding,
        pretty=args.pretty,
    )


def sniff_dialect(sample: str) -> csv.Dialect:
    try:
        return csv.Sniffer().sniff(sample)
    except csv.Error:
        return csv.excel


def read_csv_rows(options: CsvOptions) -> list[list[str]]:
    if not options.path.exists():
        raise FileNotFoundError(options.path)

    with options.path.open("r", encoding=options.encoding, newline="") as handle:
        if options.delimiter is None:
            sample = handle.read(4096)
            handle.seek(0)
            dialect = sniff_dialect(sample)
            reader = csv.reader(handle, dialect=dialect)
        else:
            reader = csv.reader(handle, delimiter=options.delimiter)
        return [list(row) for row in reader]


def normalize_rows(rows: Iterable[Sequence[str]]) -> list[list[str]]:
    row_list = [list(row) for row in rows]
    if not row_list:
        return []
    max_cols = max(len(row) for row in row_list)
    padded: list[list[str]] = []
    for row in row_list:
        if len(row) < max_cols:
            padded.append(row + [""] * (max_cols - len(row)))
        else:
            padded.append(row)
    return padded


def escape_cell(value: str) -> str:
    escaped = value.replace("|", r"\|").replace("\n", "<br>")
    return escaped.strip()


def format_table(rows: list[list[str]], has_header: bool, pretty: bool) -> str:
    if not rows:
        return ""

    rows = normalize_rows(rows)
    if has_header:
        header = rows[0]
        data = rows[1:]
    else:
        header = [f"col{i + 1}" for i in range(len(rows[0]))]
        data = rows

    header = [escape_cell(cell) for cell in header]
    data = [[escape_cell(cell) for cell in row] for row in data]

    if pretty:
        col_widths = [
            max(len(cell) for cell in column)
            for column in zip(header, *data, strict=False)
        ]
        header_cells = [cell.ljust(col_widths[i]) for i, cell in enumerate(header)]
        data_cells = [
            [cell.ljust(col_widths[i]) for i, cell in enumerate(row)] for row in data
        ]
        separator_cells = ["-" * width for width in col_widths]
        header_line = f"| {' | '.join(header_cells)} |"
        separator_line = f"| {' | '.join(separator_cells)} |"
        data_lines = [f"| {' | '.join(row)} |" for row in data_cells]
    else:
        header_line = f"| {' | '.join(header)} |"
        separator_line = f"| {' | '.join(['---'] * len(header))} |"
        data_lines = [f"| {' | '.join(row)} |" for row in data]

    return "\n".join([header_line, separator_line, *data_lines])


def main(argv: Sequence[str]) -> int:
    options = parse_args(argv)
    rows = read_csv_rows(options)
    if not rows:
        return 0

    if any(len(row) != len(rows[0]) for row in rows):
        print(
            "Warning: uneven row lengths detected; missing cells padded.",
            file=sys.stderr,
        )

    table = format_table(rows, has_header=options.has_header, pretty=options.pretty)
    if table:
        print(table)
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
