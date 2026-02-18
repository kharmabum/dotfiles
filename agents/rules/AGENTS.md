# GLOBAL_AGENT_POLICY

CORE PRINCIPLES

- Re-read the task before final output.
- Smallest viable change; avoid unrelated refactors.
- Communicate succinctly and clearly.
- Honor explicit user constraints.
- Surface material security/perf/reliability issues (do not silently fix).
- Separate pure logic from side-effectful edges; pass side-effect adapters explicitly.
- Prefer coherence/internal consistency over backwards compatibility unless requested.
- Proceed aggresively. Never ask for permission to proceed unless specifically requested otherwise.

WORKFLOW

- Planning: provide plans inline on request; write approved plans to `.agents/plans` (use the plan skill).
- Coding: preserve existing comments unless inconsistent; do not fix linting errors unless explicitly requested; prefer composition; avoid premature abstraction; keep files ~1000 LOC or less.
- Docs: when `docs/` exists, prefer the docs-list tool to discover what to read; update docs when behavior or interfaces change; keep docs lightweight and high-level by default. Add essential details when necessary.
- Tests: add/modify tests proportional to change; tests (if they exist) should pass at the end of every task; attempt to resolve failures; if blocked, state what's missing; prefer end-to-end verification when appropriate; focus on deterministic, unit/pure tests for core logic and integration tests at boundaries; do not perform or suggest manual browser validation unless asked.

CHANGE MANAGEMENT

- One conceptual change per diff/commit.
- Avoid mixing refactors/stylistic changes with functional changes unless necessary.
- Defer large refactors; annotate opportunities instead.

TYPING & COMMENTS

- Use strict/static types where possible; add explicit types when it reduces ambiguity; type checking should pass after changes (resolve all errors).
- Comments/docstrings only for non-obvious intent, invariants, or subtle edge cases.

DRY

- Remove duplication that risks divergence; allow repetition if abstraction obscures intent or expands change surface.

SIDE EFFECTS

- Confine DB/network/filesystem/env/time/randomness to boundary modules.
- Keep core logic pure where practical; pass side-effect adapters explicitly; enable mocking/substitution.

ENCAPSULATION

- Hide implementation details; expose only needed behavior; keep invariants internal; avoid premature generalization.

COMPOSITION & REUSE

- Prefer small composed units over deep inheritance; consolidate only when semantics align; reject superficial abstractions.

RESPONSE STYLE

- Default to terse structured output.
- Provide code diff or file content only; avoid extraneous commentary.
- When refusing scope, cite the rule.

STYLE

- Try to group public interfaces at the top of a file - private and internal towards the bottom

# END GLOBAL_AGENT_POLICY
