---
status: complete
owner: veritas
priority: high
description: Interactive Claude Code session for ad-hoc verification work
completed: 2026-04-03
---

## Purpose

Veritas can be invoked as an interactive Claude Code session for real-time verification work. This is the flexible, conversational mode that allows Juno or other entities to ask Veritas questions and get immediate feedback without formal issue submission.

## Specification

**Input:** Interactive commands via Claude Code or environment variable

**Interface:** 
```bash
veritas                          # Interactive session in ~/.veritas/
PROMPT="fact-check X" veritas    # Non-interactive, specific task
echo "check this" | veritas      # Stdin-based, specific task
```

**Behavior:**
- Load Veritas identity from `memories/001-identity.md`
- Enter Claude Code session in `~/.veritas/` context
- If PROMPT provided, run non-interactively and output results
- If stdin provided, process input and output results
- If neither, start interactive Sonnet session

## Implementation

Implemented in `hooks/executed-without-arguments.sh`:
- Reads PROMPT from environment or stdin
- Loads identity context
- Spawns `claude` command with appropriate flags
- Uses Sonnet model for interactive sessions
- Higher model (big-pickle) available via OPENCODE_MODEL env var

## Dependencies

- Claude Code CLI (`claude` command)
- Identity file at `memories/001-identity.md`
- Veritas entity directory at `~/.veritas/`

## Testing

Tested through:
- Direct invocation in Claude Code sessions
- PROMPT-based verification tasks
- Stdin-based batch verification

## Status Note

Production-ready. This is the primary entry point for Veritas when invoked by Juno or other entities.
