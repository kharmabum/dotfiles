---
name: dump
description: Compile the current session context, findings, and history into a structured Markdown handoff report for future sub-agents.
---

# Dump

## When to use

- Create a durable, high-fidelity handoff of the current session state.
- Capture what was tried, what worked, and what failed.

## Inputs

- Optional topic or filename slug.

## Workflow

1. Determine the report filename.
   - Use the provided argument as the base name, or generate a descriptive slug.
   - Format: `./agents/research/YYYY-MM-DD_{topic_slug}.md`
   - Ensure the directory exists.
2. Analyze context.
   - Review conversation history, tools used, and files accessed.
   - Identify the core problem statement and current state.
   - Identify code artifacts (files, snippets, diffs).
   - Identify explicit failures or dead ends encountered.
3. Generate report content (required structure below).
4. Write the report to `./agents/research/`.
5. Output to user: confirm path and that the report is ready.

## Report structure (required)

- `# Title & Metadata`: date, branch, user.
- `## Executive Summary`: 2-3 sentence overview of the goal.
- `## Context & State`:
  - Relevant files (with paths).
  - Key code snippets (fenced code blocks).
  - External links or documentation references.
- `## Work Performed`:
  - Chronological summary of actions taken.
  - Include failures and why they failed (errors, dead ends).
- `## Unresolved Questions / Blockers`.
- `## Handoff Instructions` for the next agent/engineer.

## Output

- File: `./agents/research/YYYY-MM-DD_{topic_slug}.md`

## Constraints

- Be explicit and honest about failures.
- Keep it factual and high-fidelity for a future handoff.
