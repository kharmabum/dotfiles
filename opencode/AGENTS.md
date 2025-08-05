# GLOBAL_AGENT_POLICY

================================================================
SECTION: CORE PRINCIPLES

- P1: Always re-read the original task before finalizing output.
- P2: Minimize scope: smallest viable, incremental, reversible change.
- P3: Communicate succinctly; no surplus prose.
- P4: Prefer clarity over cleverness; refuse premature abstraction.
- P5: Surface (do not silently fix) material issues in security, performance, reliability.
- P6: Separate pure domain logic from side-effectful edges (I/O, DB, network).
- P7: Honor explicit user constraints over inferred optimization.

================================================================
SECTION: OPERATIONAL MODES

[PLANNING_MODE]

- Rerun requirement checklist (P1) at start & end.
- Ensure each delivered artifact maps to an explicit requirement.
- Answer in minimum words needed for precision.
- Provide plan inline; DO NOT persist plan to a markdown file pre‑coding.
- Identify side effects & isolate them (see SIDE_EFFECTS).

[CODING_MODE]

- Apply smallest diff; avoid drive‑by refactors.
- Do NOT fix linting errors unless explicitly requested.
- Enforce strict typing where possible (see TYPING).
- DRY within reason (see DRY_POLICY).
- Keep documentation concise, professional, non-redundant.
- Prefer composition over inheritance; avoid needless generalization.
- Preserve existing comments; do not remove them.
- Summarize each file/class purpose (single concise header or docstring).
- Notify (do not auto-fix) significant security/performance/reliability deficiencies.

[TESTING_MODE]

- Add / modify tests proportionate to change scope.
- Do NOT perform or suggest manual browser validation unless explicitly asked.
- Focus on deterministic, unit/pure tests for core logic; integration tests at boundaries.

================================================================
SECTION: EXTERNAL FILE LOADING

- EFL_ROOT: `~/.config/opencode/`
- EFL1: When a file reference is encountered, use Read tool _lazily_ (on-demand only).
- EFL2: Do NOT pre-load all references; no bulk or speculative reads.
- EFL3: Once loaded, treat file content as _mandatory overriding instructions_ (supersedes defaults where conflicting).
- EFL4: Follow referenced files recursively only when needed for the current task.
- EFL5: Cache mentally; re-open only if clarification required. Avoid redundant reads.
- EFL6: Record (in reasoning, not output) which external files influenced current answer.
- EFL7: If a referenced file is missing/inaccessible, report succinctly with required path and proceed conservatively.
- EFL8: Never hallucinate file contents; if not loaded, explicitly note requirement to load before relying.
- EFL9: Do not expose full file content unless necessary; extract only relevant directives.

================================================================
SECTION: CHANGE MANAGEMENT

- CM1: One conceptual change per commit/diff.
- CM2: No mixing of style-only edits with functional changes.
- CM3: Defer large refactors; instead, annotate opportunities (see META_NOTES section if supported).
- CM4: If a critical deficiency (security, perf, reliability) is observed, report succinctly with recommended minimal fix path.

================================================================
SECTION: DOCUMENTATION & COMMENTS

- D1: Minimal comments: only for non-obvious intent, invariants, subtle algorithms, edge cases.
- D2: Do NOT add comments that restate self-evident code.
- D3: Keep or update existing comments; do not delete without cause.
- D4: Each file/class: single brief purpose summary (1–2 lines).
- D5: Docstrings: professional, concise; avoid narrative unless clarifying complexity.

================================================================
SECTION: TYPING

- T1: Use strict/static types wherever language/tooling allows.
- T2: In docstrings (when adding), include inner element types: e.g. `Collection<ODSContractData>`, `array{field:string,date_start:string,date_end:string}`, `int[]`.
- T3: Do NOT duplicate docstring type info already expressed unambiguously in code signatures.
- T4: Prefer explicit return/parameter types over inference when it removes ambiguity for maintainers or downstream tooling.

================================================================
SECTION: DRY_POLICY

- DRY1: Remove duplication that risks divergence or inflates maintenance.
- DRY2: Allow repetition if abstraction would:
  - Obscure intent,
  - Introduce leaky/generalized constructs without a real domain concept,
  - Increase change surface disproportionately.
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
SECTION: COMMENT / WARNING EMISSION

- WARN1: When encountering major security/performance/reliability concern, output a succinct NOTE block:
  Format: `NOTE[category]: issue → minimal recommended action (impact if ignored).`
- WARN2: Do not auto-apply large corrective refactors unless explicitly authorized.

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

================================================================
SECTION: PROHIBITIONS

- PROH1: No unsanctioned broad refactors.
- PROH2: No redundant docstring type duplication.
- PROH3: No verbose architectural essays unless explicitly requested.
- PROH4: No browser/manual UI validation steps unless asked.
- PROH5: Do not remove existing comments without justification.

# END GLOBAL_AGENT_POLICY
