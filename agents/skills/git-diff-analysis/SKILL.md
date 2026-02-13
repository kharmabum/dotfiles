---
name: git-diff-analysis
description: Efficiently summarize changes using the git-diff CLI tool.
---

# Git Diff Analysis

Analyze changes to the current branch to provide structured context for analysis or summarization.

## Instructions

Perform the following analysis steps and output each section as formatted markdown.

### Step 1: Merge-Base Detection

Determine the base branch and merge-base commit:

1. If a base branch argument is provided, use it
2. Otherwise, check `git reflog show <current-branch>` for the branch origin
3. Fall back to `git merge-base` with main/uat/dev

Output:

```markdown
## Base Reference

- **Base branch**: <detected base>
- **Merge base commit**: <commit hash>
- **Commits on branch**: <count>

Detection method: <how the base was determined>
```

### Step 2: Intent Extraction

Extract commit messages to understand the purpose of the changes:

```bash
git log $(git merge-base <base> HEAD)..HEAD --pretty=format:"%h - %s"
```

Output:

```markdown
## Commit Intent

**Summary**: <2-3 sentence summary of what the commits accomplish>

**Commits**:

1. `<hash>` - <message>
2. ...
```

### Step 3: Diff Statistics

Gather summary statistics:

```bash
git diff --stat $(git merge-base <base> HEAD)..HEAD | tail -1
```

Output:

```markdown
## Diff Statistics

- **Files changed**: <N>
- **Insertions**: <N>
- **Deletions**: <N>
- **Net change**: <+/- N lines>
```

### Step 4: Diff Content

Gather diff content with custom git-diff tool:

```bash
git-diff <base>
```

Output:

```markdown
## Diff Contents

<git-diff output>
```

## Output

Present all four sections in order: Base Reference, Commit Intent, Diff Statistics, Diff Contents
