---
name: proposal
description: Generate a comprehensive technical proposal for the active repository.
---

# Create Technical Proposal

Generate a comprehensive technical proposal for the active repository and save it to `docs/proposals/YYYY-MM-DD-{feature-name}.md`.

## Inputs

You need the following context before writing:

1. **Research or plan documents** — prior analysis from `.agents-local/research/` or `.agents-local/plans/`
2. **Problem statement** — what pain point is being solved and who is affected
3. **Proposed approach** — high-level solution direction
If any of these are missing, ask before proceeding.

**Audience**: Full-stack software engineers. Use precise technical language, reference code by file path and symbol name (e.g., `app/Services/FooService.php::calculateTotal()`), and skip high-level explainers that a senior SWE wouldn't need.

## Process

### 1. Context Analysis

Read all provided context files and extract:

- Problem statement and motivation
- Current state analysis with code references (e.g., `OverviewRepository::getSuppliers()`)
- Proposed changes and approach
- Identified risks and constraints
- Testing strategy (if present)

Identify gaps: missing stakeholder impact, unclear scope boundaries, unaddressed alternatives, missing migration considerations, missing schema change details.

### 2. Write Proposal

Use today's date (run `date +%Y-%m-%d` to get it — do not guess). Save to `docs/proposals/YYYY-MM-DD-{feature-name}.md` using the template below. Fill in every section that applies; leave inapplicable sections empty.

### 3. Iterate

Present the draft to the user. Note which sections you left empty and offer to remove them. Iterate until approved.

## Style Guidelines

- Assume readers are full-stack SWEs — no need to explain standard patterns or terminology
- Keep sections concise — reviewers skim
- Use tables for structured data with short values (schema changes, impacted files, comparisons). Convert to list format when cells contain prose or the table exceeds ~80 chars wide — wide tables are unreadable in raw markdown.
- Drop `---` horizontal rules between sections — headings already provide structure
- Include ASCII diagrams for architecture
- Reference code by file path and symbol name (e.g., `app/Repositories/FooRepository.php::query()`) — avoid line numbers, which go stale
- Show request/response payloads and code examples, not just descriptions
- Be explicit about tradeoffs and alternatives considered
- **Remove sections that don't apply** — the template is a menu, not a checklist

---

## Template

```markdown
# [Feature Name] Technical Proposal

**Author**: [Name]
**Date**: [YYYY-MM-DD]
**Status**: Draft | In Review | Approved | Rejected | Implemented

## 1. Problem Statement

[Lead with the pain point, not the solution]

### Who is affected?
- [User group 1]: [Impact]
- [User group 2]: [Impact]

## 2. Proposed Solution

[High-level approach in 2-3 paragraphs]

### Architecture Overview

[ASCII diagram showing component relationships]

### Key Design Decisions

1. **[Decision 1]**: [Rationale]
2. **[Decision 2]**: [Rationale]

## 3. Comparison: Current vs Proposed

| Aspect          | Current              | Proposed             |
| --------------- | -------------------- | -------------------- |
| Complexity      | [Description]        | [Description]        |
| Reusability     | [Description]        | [Description]        |
| Dependencies    | [Count/list]         | [Count/list]         |
| Code Size       | [Estimate]           | [Estimate]           |
| Testability     | [Rating/description] | [Rating/description] |
| Maintainability | [Rating/description] | [Rating/description] |
| Effort          | [Estimate]           | N/A                  |

## 4. Dependencies

- **[System/Service]** ([Integration/Data]) — [What it provides]
  - **Status**: Available / Needed
  - **Blocking**: Yes / No
  - [Additional notes]

- **[Database/Store]** ([Integration/Data]) — [What data needed]
  - **Status**: Available / Needed
  - **Blocking**: Yes / No
  - [Additional notes]

## 5. Schema Changes

| Table   | Column   | Type   | Nullable | Default | Purpose       |
| ------- | -------- | ------ | -------- | ------- | ------------- |
| [table] | [column] | [type] | Yes/No   | [val]   | [description] |

## 6. What We're NOT Building

Explicitly out of scope to prevent scope creep:

- [ ] **[Feature/capability 1]** — [Why excluded]
- [ ] **[Feature/capability 2]** — [Why excluded]
- [ ] **[Feature/capability 3]** — [Why excluded]

## 7. Risk Assessment

- **[Category]**: [Risk description]
  - Likelihood: Low/Med/High | Impact: Low/Med/High
  - Mitigation: [Strategy]

- **[Category]**: [Risk description]
  - Likelihood: Low/Med/High | Impact: Low/Med/High
  - Mitigation: [Strategy]

## 8. Architecture Decisions

1. **[What was decided]**
   - **Rationale**: [Why this option]
   - **Rejected**: [Alt 1] — [why rejected]; [Alt 2] — [why rejected]

2. **[What was decided]**
   - **Rationale**: [Why this option]
   - **Rejected**: [Alt 1] — [why rejected]

## 9. Impacted Areas

| Area     | File(s)            | What Changes  | Risk   |
| -------- | ------------------ | ------------- | ------ |
| [Area 1] | `path/to/file.ext` | [Description] | Low    |
| [Area 2] | `path/to/other.ext`| [Description] | Medium |

## 10. Testing Strategy

- **Unit**: [What's tested]. [Gaps, targets, etc.]
- **Integration**: [What's tested]. [Gaps, targets, etc.]
- **E2E**: [What's tested]. [Gaps, targets, etc.]

## 11. Usage Examples

### Current Usage

```[language]
// How it works today
[code example]
```

### Proposed Usage

```[language]
// How it will work after implementation
[code example]
```

## 12. Questions for Reviewers

- [Specific technical question needing reviewer input]
- [Design decision where you want feedback]

## References

- Related Tickets: [rdar://... or ticket links]
- Similar Implementation: [`File::method()`]
