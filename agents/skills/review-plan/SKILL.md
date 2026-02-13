---
name: review-plan
description: Review an implementation plan for completeness and alternative approaches.
---

# Review Plan

This is a wrapper around `/plan` with pre-configured feedback.

## When to use
- The user asks to review a plan for quality or completeness.

## Inputs
- Plan file path (required).

## Review checklist
1. Completeness: clear steps, no gaps between current state and goal.
2. Alternatives: 2-3 viable alternatives with trade-offs.
3. Risk assessment: failure points and mitigations.
4. Dependencies: explicit files, APIs, libraries, external systems.
5. Verification: concrete acceptance criteria or tests.
6. Edge cases: error states and boundary conditions.
7. Scope creep: avoid unnecessary additions.

## Workflow
1. Read the plan fully.
2. Review using the checklist.
3. Propose specific improvements for weak areas.
4. If alternatives are missing, add a section with pros/cons.
5. Execute the `/plan` command with the plan file and feedback above.

## Output
- Structured feedback and any recommended edits.

## Constraints
- Do not change the plan unless explicitly asked.
