# GLOBAL_AGENT_POLICY

================================================================
SECTION: CORE PRINCIPLES

- P1: Always re-read the original task before finalizing output.
- P2: Minimize scope: smallest viable, incremental change.
- P3: Communicate succinctly; no surplus prose.
- P4: Prefer clarity over cleverness; refuse premature abstraction.
- P5: Surface (do not silently fix) material issues in security, performance, reliability.
- P6: Separate pure domain logic from side-effectful edges (I/O, DB, network).
- P7: Honor explicit user constraints over inferred optimization.
- P8: Prefer coherence and internal consistency over backwards compatibility unless explicitly requested.

================================================================
SECTION: OPERATIONAL MODES

[PLANNING_MODES]

- Rerun requirement checklist (P1) at start & end.
- Ensure each delivered artifact maps to an explicit requirement.
- Answer in minimum words needed for precision.
- Provide plan inline; DO NOT persist plan to a markdown file pre‑coding.
- Identify side effects & isolate them (see SIDE_EFFECTS).

[CODING_MODES]

- Apply smallest diff; avoid drive‑by refactors.
- Do NOT fix linting errors unless explicitly requested.
- Enforce strict typing where possible (**see** TYPING).
- DRY within reason (see DRY_POLICY).
- Keep documentation concise, professional, non-redundant.
- Prefer composition over inheritance; avoid needless generalization.
- Preserve existing comments; do not remove them.
- Summarize each file/class purpose (single concise header or docstring).
- Notify (do not auto-fix) significant security/performance/reliability deficiencies.

[TESTING_MODES]

- Add / modify tests proportionate to change scope.
- Do NOT perform or suggest manual browser validation unless explicitly asked.
- Focus on deterministic, unit/pure tests for core logic; integration tests at boundaries.

================================================================
SECTION: CHANGE MANAGEMENT

- CM1: One conceptual change per commit/diff.
- CM2: Avoid mixing refactors and stylistic changes with functional changes.
- CM3: Defer large refactors; instead, annotate opportunities (see META_NOTES section if supported).
- CM4: If a critical deficiency (security, perf, reliability) is observed, leave a comment in the code with recommended minimal fix path.
- CM5: Do not auto-apply large corrective refactors unless explicitly authorized.
- ================================================================
  SECTION: DOCUMENTATION & COMMENTS

- D1: Minimal comments: only for non-obvious intent, invariants, subtle algorithms, edge cases.
- D2: Do NOT add comments that restate self-evident code.
- D3: Keep or update existing comments; do not delete without cause.
- D4: Each file/class: single brief purpose summary (1–2 lines).
- D5: Docstrings: professional, concise; avoid narrative unless clarifying complexity.

================================================================
SECTION: TYPING

- T1: Use strict/static types wherever language/tooling allows.
- T2: Do NOT duplicate docstring type info already expressed unambiguously in code signatures.
- T3: Prefer explicit return/parameter types over inference when it removes ambiguity for maintainers or downstream tooling.

================================================================
SECTION: DRY_POLICY

- DRY1: Remove duplication that risks divergence or inflates maintenance.
- DRY2: Allow repetition if abstraction would obscure intent or increase change surface disproportionately.
- DRY3: Abstract only after ≥2–3 concrete, stable repetitions that share a real semantic concept.

================================================================
SECTION: SIDE_EFFECTS

- SE1: Confine DB, network, filesystem, environment, time, randomness to boundary modules.
- SE2: Core logic units should be pure (inputs → outputs, no hidden state) where practical.
- SE3: Pass side-effect capabilities via explicit interfaces / parameters, not global state.
- SE4: Facilitate testability by mocking/substituting boundary adapters.

================================================================
SECTION: ENCAPSULATION

- ENC1: Hide implementation details behind modules/classes/functions with minimal public surface.
- ENC2: Expose only behavior needed by current known clients.
- ENC3: Avoid premature generalization / configuration scaffolding without concrete need.
- ENC4: Keep invariants internal; enforce via narrow APIs.

================================================================
SECTION: COMPOSITION & REUSE

- COMP1: Favor composing small focused units over deep inheritance or speculative frameworks.
- COMP2: Consolidate only when shared behavior is semantically aligned (see DRY3).
- COMP3: Reject superficial similarity abstractions that reduce clarity.

================================================================
SECTION: EXECUTION CHECKLIST (Apply Before Final Answer)

1. Re-read original task (P1).
2. Confirm requested mode; apply relevant section rules.
3. Identify minimal viable change; ensure no mixed refactors.
4. Ensure strict typing additions (T1–T3) where valuable.
5. Evaluate duplication vs abstraction (DRY1–DRY3).
6. Verify side effects isolated (SE1–SE3).
7. Add/retain only necessary comments; ensure file/class purpose summary present.
8. Add/update focused tests (when feasible).
9. Scan for significant security/performance/reliability issues; emit NOTE if present.
10. Final pass: requirements coverage + succinctness.

================================================================
SECTION: RESPONSE STYLE (LLM OUTPUT)

- STYLE1: Default to terse bullet or structured block unless user asks for narrative.
- STYLE2: Provide code diff or file content only; avoid extraneous commentary.
- STYLE3: When refusing additional scope (e.g., linting error fixes not requested), cite rule reference plainly (e.g., “Per CODING_MODE rule: not fixing TS errors unless requested.”)

# END GLOBAL_AGENT_POLICY
