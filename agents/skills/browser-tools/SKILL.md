---
name: browser-tools
description: Drive Chrome via DevTools for navigation, evaluation, screenshots, and content extraction without MCP.
---

# Browser Tools

Use a lightweight CLI to control Chrome through the DevTools protocol.

## When to use

- You need browser automation or page inspection without a full MCP server.
- You need screenshots, DOM picking, console logs, or readable content extraction.

## Workflow

1. Start Chrome with remote debugging:

```bash
node /Users/jfoust/.dotfiles/agents/scripts/browser-tools.ts start
```

2. Common commands (examples):

```bash
node /Users/jfoust/.dotfiles/agents/scripts/browser-tools.ts nav "https://example.com"
node /Users/jfoust/.dotfiles/agents/scripts/browser-tools.ts eval "document.title"
node /Users/jfoust/.dotfiles/agents/scripts/browser-tools.ts screenshot
node /Users/jfoust/.dotfiles/agents/scripts/browser-tools.ts pick "Select the button"
node /Users/jfoust/.dotfiles/agents/scripts/browser-tools.ts console --follow
node /Users/jfoust/.dotfiles/agents/scripts/browser-tools.ts search "query" --content
node /Users/jfoust/.dotfiles/agents/scripts/browser-tools.ts content "https://example.com"
```

## Notes

- Requires Chrome and Node.js with `puppeteer-core` available in the environment.
- The default remote debugging port is `9222`.
