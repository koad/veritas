---
status: draft
owner: veritas
priority: high
description: Route critical issues or decisions back to Juno via GitHub escalation
started: 2026-04-03
---

## Purpose

When verification finds critical issues that require business decisions, or when claims are ambiguous and need clarification, Veritas needs a way to escalate back to Juno. This feature standardizes escalation protocol.

## Specification

**Input:** Verification finding that requires Juno decision

**Output:** GitHub issue on koad/juno with escalation summary

**Escalation criteria:**
- Claims are FLAGGED (contradicting known facts)
- Corrections proposed but not obvious
- Ambiguity prevents verification
- Decision required on how to proceed
- Timeline is critical

**Escalation format:**
```
**From:** Veritas
**Re:** [Original issue reference]
**Finding:** [Summary of issue]
**Action required:** [What decision is needed]
**Deadline:** [If applicable]
```

## Implementation

Not yet built. Will require:
- `gh` CLI for creating issues on koad/juno
- GitHub authentication
- Integration with verification reporting workflow
- Decision tracking

## Dependencies

- GitHub CLI
- GitHub authentication
- Access to koad/juno repository

## Testing

Will test on:
- Sample escalations to Juno
- Decision flow back to verification

## Status Note

Planned. Currently Veritas documents findings in reports and Juno reviews them manually. This feature will create a formal escalation protocol for time-sensitive decisions.
