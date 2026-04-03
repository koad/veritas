# Interactive Claude Code Session Reference

## Invocation

Veritas can be invoked in three modes:

### Interactive Mode
```bash
veritas
```
Starts Claude Code Sonnet session in ~/.veritas/ context. Use for ad-hoc verification work.

### Prompt Mode (Non-Interactive)
```bash
PROMPT="fact-check these claims: X, Y, Z" veritas
PROMPT="audit this entity for VESTA-SPEC-007" veritas
```

Non-interactive execution with specific task. Outputs result and exits.

### Stdin Mode (Non-Interactive)
```bash
echo "Check if this claim is true: ..." | veritas
cat document.md | veritas
```

Process input from pipe. Outputs result and exits.

## Session Context

Every Veritas session loads:
- Identity context from `memories/001-identity.md`
- Current working directory: `~/.veritas/`
- Git history access
- All prior verification reports visible in `reviews/`

## Available Tools in Session

- **Read** — read files, documents, prior reports
- **Grep** — search for claims or references
- **WebFetch/WebSearch** — fact-checking and source verification
- **Bash** — git operations, file system operations
- **GitHub CLI** — interact with koad/veritas issues
- **Agent** — spawn specialized research agents

## Standard Workflow

1. Load context (automatic)
2. Understand verification task
3. Perform verification work
4. Prepare report
5. Post findings
6. Commit changes

See `documentation/reporting-formats/verification-report-template.md` for report structure.
