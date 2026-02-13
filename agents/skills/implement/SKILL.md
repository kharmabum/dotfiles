---
name: implement
description: Implement technical plans from .agents/plans with verification and phase control.
---

# Implement Plan

You are tasked with implementing an approved technical plan from `.agents/plans/`. These plans contain phases with specific changes and success criteria.

## When to use

- Execute an approved implementation plan stored in `.agents/plans`.

## Inputs

- Plan file path (required).

## Getting Started

- Read the plan completely and check for any existing checkmarks (`- [x]`).
- Read files fully; never use limit/offset parameters.
- Think through how the pieces fit together.
- Create a todo list to track progress.
- If no plan path is provided, ask for one.

## Implementation Philosophy

- Follow the plan's intent while adapting to what you find.
- Implement each phase fully before moving to the next.
- Stop and wait for user review before proceeding to the next phase unless specifically told otherwise.
- Verify changes make sense in the broader codebase context.
- Update checkboxes in the plan as you complete sections.

## Mismatch handling

If the plan does not match reality, stop and ask:

```
Issue in Phase [N]:
Expected: [what the plan says]
Found: [actual situation]
Why this matters: [explanation]

How should I proceed?
```

## Verification Approach

After implementing a phase:

- Run the success criteria checks (often `make test`).
- Fix any issues before proceeding.
- Update progress in the plan and your todos.
- Check off completed items in the plan file.
- Pause for manual verification using this format:

```
Phase [N] Complete - Ready for Manual Verification

Automated verification passed:
- [List automated checks that passed]

Let me know when review and manual testing is complete so I can proceed to Phase [N+1].
```

If instructed to execute multiple phases consecutively, skip the pause until the last specified phase.

## Resuming Work

- If the plan has existing checkmarks, trust completed work is done.
- Pick up from the first unchecked item.
- Verify previous work only if something seems off.

## Output

- Updated implementation and plan file with completed items checked.

## Constraints

- Do not proceed to the next phase without explicit approval unless told otherwise.
- Read plan files fully; no partial reads.
