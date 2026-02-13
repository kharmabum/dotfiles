---
name: resolve
description: Investigate an error or failing test and decide whether to fix code or update tests.
---

# Resolve

## When to use
- The user provides a stack trace, test failure, or CI error to fix.

## Inputs
- Error output, stack trace, or failing test details.

## Workflow
1. Locate the exact line of failure.
2. Trace the data flow to understand the discrepancy between actual and expected.
3. Decide if code is broken or tests are outdated.
4. If <90% confident, ask a clarifying question.
5. Apply a targeted fix.
6. Run relevant tests or `make test` if available.

## Decision heuristics
- Runtime exceptions/crashes: fix code.
- Refactoring regression: fix code.
- New feature behavior: update tests.
- Hardcoded string/id changes: update tests.

## Output format
- **Analysis**: 1 sentence explaining why it failed.
- **Strategy**: Fixing Logic or Updating Test.
- **Code**: corrected code block.

## Constraints
- Do not reduce assertion quality unless explicitly requested.
- Ask for clarification when ambiguous.
