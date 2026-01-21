---
name: update-plan
description: Iterate on an existing implementation plan (generated in .agents/plans/)
mode: orchestrator
argument-hint: <path to plan file>
---

# Iterate Implementation Plan

You are tasked with updating an existing implementation plan based on user feedback. You should be skeptical, thorough, and ensure changes are grounded in actual codebase reality.

## Initial Response

When this command is invoked:

1. **Parse the input to identify**:
   - Plan file path (e.g., `.agents/plans/2025-10-16-feature.md`)
   - Requested changes/feedback

2. **Handle different input scenarios**:

   **If plan file provided but NO feedback**:

   ```
   I've found the plan at [path]. What changes would you like to make?

   For example:
   - "Add a phase for migration handling"
   - "Update the success criteria to include performance tests"
   - "Adjust the scope to exclude feature X"
   - "Split Phase 2 into two separate phases"
   ```

   Wait for user input.

   **If BOTH plan file AND feedback provided**:
   - Proceed immediately to Step 1
   - No preliminary questions needed

## Process Steps

### Step 1: Read and Understand Current Plan

1. **Read the existing plan file COMPLETELY**:
   - Use the Read tool WITHOUT limit/offset parameters
   - Understand the current structure, phases, and scope
   - Note the success criteria and implementation approach

2. **Understand the requested changes**:
   - Parse what the user wants to add/modify/remove
   - Identify if changes require codebase research
   - Determine scope of the update

### Step 2: Research If Needed

**Only spawn research tasks if the changes require new technical understanding.**

If the user's feedback requires understanding new code patterns or validating assumptions:

1. **Create a research todo list**

2. **Spawn parallel sub-tasks for research**:
   Use the right agent for each type of research:

   **Be EXTREMELY specific about directories**:
   - Include full path context in prompts

3. **Read any new files identified by research**:
   - Read them FULLY into the main context
   - Cross-reference with the plan requirements

4. **Wait for ALL sub-tasks to complete** before proceeding

### Step 3: Present Understanding and Approach

Before making changes, confirm your understanding:

```
Based on your feedback, I understand you want to:
- [Change 1 with specific detail]
- [Change 2 with specific detail]

My research found:
- [Relevant code pattern or constraint]
- [Important discovery that affects the change]

I plan to update the plan by:
1. [Specific modification to make]
2. [Another modification]

Does this align with your intent?
```

Get user confirmation before proceeding.

### Step 4: Update the Plan

1. **Make focused, precise edits** to the existing plan:
   - Use the Edit tool for surgical changes
   - Maintain the existing structure unless explicitly changing it
   - Keep all file:line references accurate
   - Update success criteria if needed

2. **Ensure consistency**:
   - If adding a new phase, ensure it follows the existing pattern
   - If modifying scope, update "What We're NOT Doing" section
   - If changing approach, update "Implementation Approach" section

3. **Preserve quality standards**:
   - Include specific file paths and line numbers for new content
   - Write measurable success criteria
   - Keep language clear and actionable

### Step 5: Review

**Present the changes made**:

```
I've updated the plan at `.agents/plans/[filename].md`

Changes made:
- [Specific change 1]
- [Specific change 2]

The updated plan now:
- [Key improvement]
- [Another improvement]

Would you like any further adjustments?
```

**Be ready to iterate further** based on feedback

## Important Guidelines

1. **Be Skeptical**:
   - Don't blindly accept change requests that seem problematic
   - Question vague feedback - ask for clarification
   - Verify technical feasibility with code research
   - Point out potential conflicts with existing plan phases

2. **Be Surgical**:
   - Make precise edits, not wholesale rewrites
   - Preserve good content that doesn't need changing
   - Only research what's necessary for the specific changes
   - Don't over-engineer the updates

3. **Be Thorough**:
   - Read the entire existing plan before making changes
   - Research code patterns if changes require new technical understanding
   - Ensure updated sections maintain quality standards
   - Verify success criteria are still measurable

4. **Be Interactive**:
   - Confirm understanding before making changes
   - Show what you plan to change before doing it
   - Allow course corrections
   - Don't disappear into research without communicating

5. **Track Progress**:
   - Use TodoWrite to track update tasks if complex
   - Update todos as you complete research
   - Mark tasks complete when done

6. **No Open Questions**:
   - If the requested change raises questions, ASK
   - Research or get clarification immediately
   - Do NOT update the plan with unresolved questions
   - Every change must be complete and actionable

## Example Interaction Flows

**Scenario 1: User provides just plan file**

```
User: /iterate_plan .agents/plans/2025-10-16-feature.md
Assistant: I've found the plan. What changes would you like to make?
User: Split Phase 2 into two phases - one for backend, one for frontend
Assistant: [Proceeds with update]
```

**Scenario 2: User provides everything upfront**

```
User: /iterate_plan .agents/plans/2025-10-16-feature.md - add phase for error handling
Assistant: [Reads plan, researches error handling patterns, updates plan]
```
