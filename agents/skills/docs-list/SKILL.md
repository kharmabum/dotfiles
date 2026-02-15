---
name: docs-list
description: List docs/ markdown files and validate front-matter (summary/read_when) before changes.
---

# Docs List

Run the shared `docs-list` helper before making changes so you read the right docs first.

## When to use

- The repo has a `docs/` folder and the task could be covered by existing documentation.

## Workflow

1. Run the lister (example):

```bash
docs-list
```

2. Optionally pass a docs path or override with `DOCS_LIST_ROOT`:

```bash
docs-list /absolute/path/to/docs
DOCS_LIST_ROOT=/absolute/path/to/repo docs-list
```

3. Read any docs whose `read_when` hints match the task.

## Notes

- Assumes the `docs-list` alias is available in the environment.
- The helper accepts an optional docs path argument; otherwise it falls back to `DOCS_LIST_ROOT/docs`, then `$PWD/docs`.
