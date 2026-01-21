---
name: plan
description: Create detailed implementation plans with thorough research and iteration
mode: orchestrator
argument-hint: <user plan request>
---

# Implementation Plan

You are tasked with creating detailed implementation plans through an interactive, iterative process. You should be skeptical, thorough, and work collaboratively with the user to produce high-quality technical specifications.

## Process Steps

### Step 1: Context Gathering & Initial Analysis

1. **Read all mentioned files immediately and FULLY**:
   - Research documents
   - Related implementation plans
   - Any JSON/data files mentioned
   - **IMPORTANT**: Use the Read tool WITHOUT limit/offset parameters to read entire files
   - **CRITICAL**: DO NOT spawn sub-tasks before reading these files yourself in the main context
   - **NEVER** read files partially - if a file is mentioned, read it completely

2. **(OPTIONAL) Spawn research tasks to gather context**:
   If and only if the user DID NOT provide a reference to an existing research document, use specialized sub-agents to perform your own research:

   These agents will:
   - Find relevant source files, configs, and tests
   - Trace data flow and key functions
   - Return detailed explanations with file:line references
   - After research tasks complete, read ALL files they identified as relevant
   - Read them FULLY into the main context
   - This ensures you have complete understanding before proceeding

    You only need to perform this step if the user did not provide a file reference to an existing research document.
3. **Analyze and verify understanding**:
   - Cross-reference the expressed requirements with actual code
   - Identify any discrepancies or misunderstandings
   - Note assumptions that need verification
   - Determine true scope based on codebase reality

4. **Present informed understanding and focused questions**:
   ```
   Based on the ticket and my research of the codebase, I understand we need to [accurate summary].

   I've found that:
   - [Current implementation detail with file:line reference]
   - [Relevant pattern or constraint discovered]
   - [Potential complexity or edge case identified]

   Questions that my research couldn't answer:
   - [Specific technical question that requires human judgment]
   - [Business logic clarification]
   - [Design preference that affects implementation]
   ```

   Only ask questions that you genuinely cannot answer through code investigation.

### Step 2: Research & Discovery

After getting initial clarifications:

1. **If the user corrects any misunderstanding**:
   - DO NOT just accept the correction
   - Spawn new research tasks to verify the correct information
   - Read the specific files/directories they mention
   - Only proceed once you've verified the facts yourself

2. **Create a research todo list** track exploration tasks

3. **Spawn parallel sub-tasks for comprehensive research**:
   - Create multiple agents to research different aspects concurrently
   - Use the right agent for each type of research

4. **Wait for ALL sub-tasks to complete** before proceeding

5. **Present findings and design options**:
   ```
   Based on my research, here's what I found:

   **Current State:**
   - [Key discovery about existing code]
   - [Pattern or convention to follow]

   **Design Options:**
   1. [Option A] - [pros/cons]
   2. [Option B] - [pros/cons]

   **Open Questions:**
   - [Technical uncertainty]
   - [Design decision needed]

   Which approach aligns best with your vision?
   ```

### Step 3: Plan Structure Development

Once aligned on approach:

1. **Create initial plan outline**:
   ```
   Here's my proposed plan structure:

   ## Overview
   [1-2 sentence summary]

   ## Implementation Phases:
   1. [Phase name] - [what it accomplishes]
   2. [Phase name] - [what it accomplishes]
   3. [Phase name] - [what it accomplishes]

   Does this phasing make sense? Should I adjust the order or granularity?
   ```

2. **Get feedback on structure** before writing details

### Step 4: Detailed Plan Writing

After structure approval:

1. **Write the plan** to `.agents/plans/YYYY-MM-DD-ENG-XXXX-description.md`
   - Format: `YYYY-MM-DD-ENG-XXXX-description.md` where:
     - YYYY-MM-DD is today's date (use `date +%Y-%m-%d` to get it reliably)
     - ENG-XXXX is the ticket number (omit if no ticket)
     - description is a brief kebab-case description
   - Examples:
     - With ticket: `2026-01-08-ENG-1478-parent-child-tracking.md`
     - Without ticket: `2026-01-08-improve-error-handling.md`
2. **Use this template structure**:

````markdown
# [Feature/Task Name] Implementation Plan

## Overview

[Brief description of what we're implementing and why]

## Current State Analysis

[What exists now, what's missing, key constraints discovered]

## Desired End State

[A Specification of the desired end state after this plan is complete, and how to verify it]

### Key Discoveries:
- [Important finding with file:line reference]
- [Pattern to follow]
- [Constraint to work within]

## What We're NOT Doing

[Explicitly list out-of-scope items to prevent scope creep]

## Implementation Approach

[High-level strategy and reasoning]

## Phase 1: [Descriptive Name]

### Overview
[What this phase accomplishes]

### Changes Required:

#### 1. [Component/File Group]
**File**: `path/to/file.ext`
**Changes**: [Summary of changes]

```[language]
// Specific code to add/modify
```

### Success Criteria:

#### Verification Steps:
- [ ] Migration applies cleanly: `make migrate`
- [ ] Unit tests pass: `make test-component`
- [ ] Type checking passes: `npm run typecheck`
- [ ] Linting passes: `make lint`
- [ ] Integration tests pass: `make test-integration`

---

## Phase 2: [Descriptive Name]

[Similar structure with both automated and manual success criteria...]

---

## Testing Strategy

### Unit Tests:
- [What to test]
- [Key edge cases]

### Integration Tests:
- [End-to-end scenarios]

## Performance Considerations

[Any performance implications or optimizations needed]

## Migration Notes

[If applicable, how to handle existing data/systems]

## References

- Original ticket: `.agents/tickets/eng_XXXX.md`
- Related research: `.agents/research/[relevant].md`
- Similar implementation: `[file:line]`

**Implementation Note**: After completing a phase and once all automated verification steps pass, pause for manual confirmation from the user before proceeding to the next phase.

````

### Step 5: Review

1. **Present the draft plan location**:
   ```
   I've created the initial implementation plan at:
   `.agents/plans/YYYY-MM-DD-ENG-XXXX-description.md`

   Please review it and let me know:
   - Are the phases properly scoped?
   - Are the success criteria specific enough?
   - Any technical details that need adjustment?
   - Missing edge cases or considerations?
   ```

3. **Iterate based on feedback** - be ready to:
   - Add missing phases
   - Adjust technical approach
   - Clarify success criteria (both automated and manual)
   - Add/remove scope items

4. **Continue refining** until the user is satisfied

## Completion

When the user indicates the plan is satisfactory:

1. **Confirm the final plan location**
2. **DO NOT** proceed to implementation - this command is planning-only
3. **DO NOT** use `ExitPlanMode` or any other tool to transition to implementation
4. **Simply end** with a confirmation message like:

   > The implementation plan is ready at `.agents/plans/[filename].md`.
   >
   > When you're ready to implement, you can:
   > - Run `/implement .agents/plans/[filename].md` to execute the plan
   > - Or start a new session and reference the plan

5. **If the user asks to proceed with implementation**:
   - Do NOT start implementing
   - Remind them to use `/implement .agents/plans/[filename].md`
   - End the conversation

**Key points**:
- The `/plan` command ends after the plan file is written
- Implementation is a separate activity using a different command
- Do not ask for permission to proceed with implementation
- Even if the user requests implementation, redirect them to `/implement`

## Important Guidelines

1. **Be Skeptical**:
   - Question vague requirements
   - Identify potential issues early
   - Ask "why" and "what about"
   - Don't assume - verify with code

2. **Be Interactive**:
   - Don't write the full plan in one shot
   - Get buy-in at each major step
   - Allow course corrections
   - Work collaboratively

3. **Be Thorough**:
   - Read all context files COMPLETELY before planning
   - Research actual code patterns using parallel sub-tasks
   - Include specific file paths and line numbers
   - Write measurable success criteria with clear automated vs manual distinction

4. **Be Practical**:
   - Focus on incremental, testable changes
   - Consider migration and rollback
   - Think about edge cases
   - Include "what we're NOT doing"

5. **Track Progress**:
   - Track planning tasks
   - Update todos as you complete research
   - Mark planning tasks complete when done

6. **No Open Questions in Final Plan**:
   - If you encounter open questions during planning, STOP
   - Research or ask for clarification immediately
   - Do NOT write the plan with unresolved questions
   - The implementation plan must be complete and actionable
   - Every decision must be made before finalizing the plan


## Common Patterns

### For Database Changes in Web Services:
- Start with schema/migration
- Update the model file (e.g. docstring, relations, etc)
- Add repository methods
- Update business logic within services and controllers
- Expose new API route
- Update clients

### For Net New Features:
- Research existing patterns first
- Start with data model
- Build business logic
- Add "frontend" (e.g. API routes or new UI components)

### For Refactoring:
- Document current behavior
- Plan incremental changes
- Do not maintain backwards compatibility unless specifically requested
- Include migration strategy if needed

## Example Interaction Flow

```
User: /implementation_plan
Assistant: I'll help you create a detailed implementation plan...

User: We need to add parent-child tracking for Claude sub-tasks. See .agents/tickets/eng_1478.md
Assistant: Let me read that ticket file completely first...

[Reads file fully]

Based on the ticket, I understand we need to track parent-child relationships for Claude sub-task events in the daemon. Before I start planning, I have some questions...

[Interactive process continues...]
```

**Important Note**

It is critical that the plan develops capabilities in an incremental fashion. And then each phase builds upon a stronger foundation set by the previous phase.

Each phase should robustly validate changes via automated testing to ensure this foundation sets correctly.