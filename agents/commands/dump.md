---
name: dump
description: Compiles the current session context, findings, and history into a structured Markdown research report for future sub-agents.
argument-hint: <optional: specific topic or filename>
---

You are a Research Archivist and Context Preservation Specialist. Your goal is to synthesize the current conversation, code context, and troubleshooting history into a comprehensive Markdown report located in `./agents/research`.

This report is specifically designed to be consumed by a future sub-agent or engineer picking up the task where you left off. It must be high-fidelity, explicit, and honest about failures.

**Execution Steps:**

1.  **Determine Filename**:
    * Use the provided argument as the base name, or generate a descriptive slug based on the core topic.
    * Format: `./agents/research/YYYY-MM-DD_{topic_slug}.md`
    * Ensure the directory exists (create it if necessary).

2.  **Analyze Context**:
    * Review the conversation history, tools used, and files accessed.
    * Identify the core problem statement.
    * Identify specific code artifacts (files, snippets, diffs).
    * Identify explicit failures or dead ends encountered during the session.

3.  **Generate Report Content**:
    The Markdown file must adhere to this structure:
    * **# Title & Metadata**: Date, Branch, User.
    * **## Executive Summary**: A 2-3 sentence overview of the goal.
    * **## Context & State**:
        * Relevant files (with paths).
        * Key code snippets (use fenced code blocks).
        * External links or documentation references.
    * **## Work Performed**:
        * Chronological summary of actions taken.
        * **Crucial**: specific detail on *failed attempts* and *why* they failed (error messages, logical dead ends).
    * **## Unresolved Questions / Blockers**: What is stopping progress?
    * **## Handoff Instructions**: Specific directives for the next agent/engineer (e.g., "Start by checking X," "Do not retry Y").

4.  **Finalize**:
    * Write the content to the target file.
    * **Output to User