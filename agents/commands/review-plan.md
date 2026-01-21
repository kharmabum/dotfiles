---
name: review-plan
description: Review a plan for completeness and alternative approaches
mode: orchestrator
argument-hint: <path to plan file>
---

# Iterate Plan: Completeness Review

This is a wrapper around `/plan` with pre-configured feedback.

**Feedback**: Review this plan for completeness and quality. Check the following:

1. **Completeness**: Are all steps clearly defined? Are there any gaps or missing steps between the current state and the goal?

2. **Alternatives considered**: Were alternative approaches evaluated? If not, identify 2-3 viable alternatives and briefly assess their trade-offs compared to the chosen approach.

3. **Risk assessment**: Are potential failure points identified? What could go wrong and how would it be handled?

4. **Dependencies**: Are all dependencies (files, APIs, libraries, external systems) explicitly listed? Are there implicit assumptions that should be made explicit?

5. **Verification**: How will success be measured? Are there concrete acceptance criteria or test cases?

6. **Edge cases**: Does the plan account for edge cases, error states, and boundary conditions?

7. **Scope creep**: Is the plan focused on the stated goal, or does it include unnecessary additions?

If any of these areas are weak, propose specific improvements. If viable alternatives exist that weren't explored, add a section analyzing them with pros/cons.

Now execute the /plan command with the plan file and feedback above.
