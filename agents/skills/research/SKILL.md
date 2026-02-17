---
name: research
description: Research the codebase comprehensively using sub-agents and produce a structured research document.
---

# Research Codebase

You are tasked with conducting comprehensive research across the codebase to answer user questions by spawning parallel sub-agents and synthesizing their findings.

## When to use

- The user needs a technical map or explanation of current codebase state.

## Inputs

- User question or research topic.
- Any referenced files or tickets.

## Primary Objective

- Document and explain the current codebase: what exists, where it is, and how components interact.

## Preflight (required)

- Read any directly mentioned files first.
- Use the Read tool without limit/offset parameters.
- Do not spawn sub-tasks before reading mentioned files in the main context.

## Workflow

### Step 1: Read mentioned files

- Read tickets, docs, JSON, or other referenced files fully before research decomposition.

### Step 2: Analyze and decompose the question

- Break the request into composable research areas.
- Consider architectural patterns and component interactions.
- Create a research plan to track subtasks.

### Step 3: Spawn parallel sub-agent tasks

- Use locator agents first, then analyzers on promising findings.
- Run multiple agents in parallel when searching different areas.
- Keep prompts focused on read-only operations.

### Step 4: Wait and synthesize

- Wait for all sub-agents to complete.
- Prioritize live codebase findings as primary truth.
- Connect findings across components.
- Include specific file paths and line numbers.
- Verify all paths are correct.

### Step 5: Gather metadata

- Prepare metadata for the research document.
- Filename: `.agents/research/YYYY-MM-DD-ENG-XXXX-description.md` (omit ticket if none).

### Step 6: Write research document

- Use `/Users/jfoust/.dotfiles/agents/skills/research/references/research_template.md`.
- Include YAML frontmatter and required sections.
- Do not use placeholder values.

### Step 7: Add GitHub permalinks (if applicable)

- Check branch and status: `git branch --show-current`, `git status`.
- If on main/master or pushed, resolve repo info: `gh repo view --json owner,name`.
- Replace local refs with permalinks: `https://github.com/{owner}/{repo}/blob/{commit}/{file}#L{line}`.

### Step 8: Sync and present findings

- Provide a concise summary and key references.
- Ask for follow-up questions.

### Step 9: Handle follow-up questions

- Append to the same research document.
- Update frontmatter `last_updated` and add `last_updated_note`.
- Add `## Follow-up Research [timestamp]` section.

## Important Notes

- Always use parallel task agents to maximize efficiency.
- Always run fresh research; do not rely solely on existing docs.
- Keep research docs self-contained.
- Keep the main agent focused on synthesis, not deep file reading.
- Encourage sub-agents to find examples and usage patterns.
- Follow the numbered steps in order.
- Always read mentioned files fully before spawning sub-tasks.
- Always gather metadata before writing the document.
- Never write the research document with placeholder values.
- Keep frontmatter fields consistent and use snake_case.
- Tags should be relevant to the research topic and components studied.

## Output

- Research document in `.agents/research/` plus a concise summary.

## Constraints

- Do not implement changes or propose enhancements unless explicitly asked.
- Do not perform root cause analysis.
- Do not critique the current implementation.
- Read files fully; no partial reads.
