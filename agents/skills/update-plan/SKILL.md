---
name: update-plan
description: Update an existing implementation plan in .agents/plans based on user feedback.
---

# Update Plan

## When to use
- The user wants changes to an existing plan in `.agents/plans/`.

## Inputs
- Plan file path.
- Requested changes or feedback.

## Initial Response
- If the plan file is provided but no feedback:
  - Ask what changes they want.
  - Provide examples (add phase, adjust success criteria, split phases).
- If both plan file and feedback are provided, proceed.

## Workflow
1. Read the existing plan fully (no limit/offset).
2. Parse requested changes and determine if new research is required.
3. Research only if needed:
   - Create a research todo list.
   - Spawn parallel sub-tasks.
   - Read new files fully.
   - Wait for all sub-tasks to complete.
4. Present understanding and proposed modifications for confirmation.
5. Apply focused edits to the plan.
6. Summarize updates and ask for further adjustments.

## Quality Guidelines
- Be skeptical: verify feasibility, question vague requests.
- Be surgical: precise edits, no wholesale rewrites.
- Be thorough: update success criteria and references if needed.
- Be interactive: confirm intent before editing.
- Track progress with todos if complex.
- No open questions in the final plan.

## Output
- Updated plan file with precise, minimal edits.

## Constraints
- Do not introduce unresolved questions into the plan.
- Preserve structure unless changes require otherwise.
- Verify technical assumptions with code when needed.
