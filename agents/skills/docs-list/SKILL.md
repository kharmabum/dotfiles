---
name: docs-list
description: List docs/ markdown files and validate front-matter (summary/read_when) before changes.
---

# Docs List

Run the repo's docs listing helper before making changes so you read the right docs first.

## When to use

- The repo has a `docs/` folder and the task could be covered by existing documentation.

## Workflow

1. Check for an existing docs list entrypoint in this order:
- `npm run docs:list`
- `pnpm run docs:list`
- `bin/docs-list`
- `scripts/docs-list.ts`

2. If none exist, offer to copy the shared script from:
- `/Users/jfoust/.dotfiles/agents/scripts/docs-list.ts`

3. Run the lister (example):

```bash
tsx scripts/docs-list.ts
```

4. Read any docs whose `read_when` hints match the task.

## Notes

- The script expects to live at `scripts/docs-list.ts` with `docs/` at repo root.
- Keep the script byte-identical when sharing it across repos.
