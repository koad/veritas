---
status: draft
owner: veritas
priority: high
description: Process GitHub issues from koad/veritas verification queue
---

## Purpose

Automate intake and processing of verification requests submitted as GitHub issues on koad/veritas. This command reads the issue queue, processes each issue, and files verification reports.

## Interface

**Usage:**
```bash
veritas-github-intake [--limit N] [--process-all]
```

**Arguments:**
- `--limit N` — Process only first N issues (default: list only)
- `--process-all` — Process entire queue and close resolved issues

**Output:** JSON report with processing results

## Specification

**Behavior:**
1. List all open issues on koad/veritas
2. For each issue:
   - Read issue title and description
   - Parse verification request type (fact-check, spec-audit, etc.)
   - Extract claim/document to verify
   - Perform verification work
   - Generate report
   - Comment on issue with findings
   - Close issue or route back to submitter

**Output format:**
```json
{
  "processed": 3,
  "passed": 2,
  "failed": 1,
  "escalated": 0,
  "issues": [
    {"number": 5, "status": "PASS", "report": "2026-04-03-claim-X.md"},
    ...
  ]
}
```

## Dependencies

- GitHub CLI (`gh` command)
- Standard verification workflow (fact-checking, reporting, etc.)
- All verification features complete

## Testing

Will test on:
- Sample GitHub issues
- Batch processing workflow
- Error handling (missing context, ambiguous claims)

## Status Note

Blocked on: GitHub issue intake feature completion (planned for 2026-04-10)
