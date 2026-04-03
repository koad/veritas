---
status: draft
owner: veritas
priority: high
description: Intake verification requests from GitHub issues on koad/veritas repo
started: 2026-04-03
---

## Purpose

According to CLAUDE.md, Veritas receives work as GitHub Issues filed by Juno on `koad/veritas`. This feature standardizes how issues are submitted, tracked, and resolved.

## Specification

**Input:** GitHub issue on koad/veritas with verification request

**Output:** Comment on issue with findings and close or route back

**Issue template:**
```
**What needs verification?**
[Description of claim/document/work product]

**Context:**
[Any relevant background, source links, or context]

**Submitted by:**
[Entity name]

**Deadline (if any):**
[Date]
```

**Workflow:**
1. Veritas checks inbox: `gh issue list --repo koad/veritas`
2. For each issue: read description and context
3. Perform verification work
4. Post findings as comment with full report
5. Close issue or route to submitter for corrections

## Implementation

Not yet built. Will require:
- `gh` CLI for issue listing and commenting
- GitHub authentication
- Command to list and process issue queue
- Integration with standard verification workflow

## Dependencies

- GitHub CLI (`gh`)
- GitHub authentication configured
- Access to koad/veritas repository

## Testing

Will test on:
- Test issues filed by Juno
- Batch issue processing workflow
- Issue routing and follow-up

## Status Note

Planned. This is a key operational capability for Veritas's workflow integration with Juno. Issue tracking is currently manual; this feature will automate intake and tracking.
