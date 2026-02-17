---
name: plan
description: Create detailed implementation plans with thorough research and iteration.
---

# Implementation Plan

You are tasked with creating detailed implementation plans through an interactive, iterative process. Be skeptical, thorough, and collaborative.

## When to use

- The user wants a detailed implementation plan with phases and verification steps.

## Inputs

- The user request.
- Any referenced files or prior research documents.

## Preflight (required)

- Read all mentioned files immediately and fully.
- Use the Read tool without limit/offset parameters.
- Do not spawn sub-tasks before reading mentioned files yourself.

## Workflow

### Step 1: Context Gathering & Initial Analysis

1. Read all mentioned files fully.
2. If no existing research doc was provided, optionally spawn research tasks:
   - Find relevant source files, configs, and tests.
   - Trace data flow and key functions.
   - Return file:line references.
   - Read all identified files fully in the main context.
3. Analyze and verify understanding:
   - Cross-reference requirements with actual code.
   - Identify discrepancies or misunderstandings.
   - Note assumptions that need verification.
   - Determine true scope based on codebase reality.
4. Present informed understanding and focused questions:

```
Based on the ticket and my research of the codebase, I understand we need to [accurate summary].

I've found that:
- [Current implementation detail with file:line reference]
- [Relevant pattern or constraint discovered]
- [Potential complexity or edge case identified]

Questions that my research couldn't answer:
- [Specific technical question that requires human judgment]
- [Business logic clarification]
- [Design preference that affects implementation]
```

Only ask questions that cannot be answered through code investigation.

### Step 2: Research & Discovery

1. If the user corrects any misunderstanding:
   - Do not just accept the correction.
   - Spawn new research tasks to verify.
   - Read specific files/directories mentioned.
2. Create a research todo list.
3. Spawn parallel sub-tasks for comprehensive research.
4. Wait for all sub-tasks to complete.
5. Present findings and design options:

```
Based on my research, here's what I found:

**Current State:**
- [Key discovery about existing code]
- [Pattern or convention to follow]

**Design Options:**
1. [Option A] - [pros/cons]
2. [Option B] - [pros/cons]

**Open Questions:**
- [Technical uncertainty]
- [Design decision needed]

Which approach aligns best with your vision?
```

### Step 3: Plan Structure Development

1. Propose an initial outline:

```
Here's my proposed plan structure:

## Overview
[1-2 sentence summary]

## Implementation Phases:
1. [Phase name] - [what it accomplishes]
2. [Phase name] - [what it accomplishes]
3. [Phase name] - [what it accomplishes]

Does this phasing make sense? Should I adjust the order or granularity?
```

2. Get feedback on structure before writing details.

### Step 4: Detailed Plan Writing

1. Write the plan to `.agents/plans/YYYY-MM-DD-ENG-XXXX-description.md`.
   - Use `date +%Y-%m-%d` for the date.
   - Omit the ticket if none exists.
2. Use the template at `/Users/jfoust/.dotfiles/agents/skills/plan/references/plan_template.md`.

### Step 5: Review

1. Present the draft plan location and request feedback:

```
I've created the initial implementation plan at:
`.agents/plans/YYYY-MM-DD-ENG-XXXX-description.md`

Please review it and let me know:
- Are the phases properly scoped?
- Are the success criteria specific enough?
- Any technical details that need adjustment?
- Missing edge cases or considerations?
```

2. Iterate until the user is satisfied.

## Completion

When the plan is approved:

- Confirm the final plan location.
- Do not proceed to implementation.
- Do not use ExitPlanMode or other tools to transition.

## Output

- A plan file under `.agents/plans/` plus a concise summary.

## Constraints

- Read files fully; no partial reads.
- Do not proceed to detailed writing without confirming plan structure.
