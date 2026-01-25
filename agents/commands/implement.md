---
name: implement
description: Implement technical plans from .agents/plans with verification
argument-hint: <path to plan file>
---

# Implement Plan

You are tasked with implementing an approved technical plan from `.agents/plans/`. These plans contain phases with specific changes and success criteria.

## Getting Started

When given a plan path:

- Read the plan completely and check for any existing checkmarks (- [x])
- **Read files fully** - never use limit/offset parameters, you need complete context
- Think deeply about how the pieces fit together
- Create a todo list to track your progress
- Start implementing if you understand what needs to be done

If no plan path provided, ask for one.

## Implementation Philosophy

Plans are carefully designed, but reality can be messy. Your job is to:

- Follow the plan's intent while adapting to what you find
- Implement each phase fully before moving to the next
- Stop working and wait for user review before proceeding to the next phase - unless specific told otherwise.
- Verify your work makes sense in the broader codebase context
- Update checkboxes in the plan as you complete sections

When things don't match the plan exactly, think about why and communicate clearly. The plan is your guide, but your judgment matters too.

If you encounter a mismatch:

- STOP and think deeply about why the plan can't be followed
- Present the issue clearly:

  ```
  Issue in Phase [N]:
  Expected: [what the plan says]
  Found: [actual situation]
  Why this matters: [explanation]

  How should I proceed?
  ```

## Verification Approach

After implementing a phase:

- Run the success criteria checks (usually `make test` covers everything)
- Fix any issues before proceeding
- Update your progress in both the plan and your todos
- Check off completed items in the plan file itself
- **Pause for human verification**: After completing all automated verification for a phase, pause and inform the user that the phase is ready for manual testing. Use this format:

  ```
  Phase [N] Complete - Ready for Manual Verification

  Automated verification passed:
  - [List automated checks that passed]

  Let me know when review and manual testing is complete so I can proceed to Phase [N+1].
  ```

If instructed to execute multiple phases consecutively, skip the pause until the last specified phase. Otherwise, assume you are just doing one phase.

## If You Get Stuck

When something isn't working as expected:

- First, make sure you've read and understood all the relevant code
- Consider if the codebase has evolved since the plan was written
- Present the mismatch clearly and ask for guidance

## Resuming Work

If the plan has existing checkmarks:

- Trust that completed work is done
- Pick up from the first unchecked item
- Verify previous work only if something seems off

**Important Notes**

- DO NOT automatically proceed to the next phase - wait for user verification - unless specifically told otherwise.
