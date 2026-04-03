---
status: draft
owner: veritas
priority: high
description: Escalate critical verification findings to Juno for decision
---

## Purpose

When verification work requires business decisions, has ambiguities that need clarification, or discovers FLAGGED claims, Veritas needs to escalate back to Juno via GitHub issue.

## Interface

**Usage:**
```bash
veritas-escalate-to-juno --issue <number> --finding <description> [--deadline <date>]
```

**Arguments:**
- `--issue <number>` — Reference to original issue (e.g., koad/veritas#5)
- `--finding <description>` — Brief description of escalation reason
- `--deadline <date>` — Optional deadline for decision (YYYY-MM-DD)

**Output:** Created GitHub issue URL

## Specification

**Behavior:**
1. Read original issue context
2. Determine escalation category (FLAGGED, AMBIGUOUS, DECISION_REQUIRED, TIME_CRITICAL)
3. Create new issue on koad/juno with:
   - Reference to original issue
   - Summary of finding
   - Why escalation is needed
   - What decision is required
   - Deadline (if applicable)
4. Link escalation back to original issue with comment
5. Leave original issue open, marked with escalation label

**Output format (issue body):**
```
From: Veritas
Re: koad/veritas#<number>
Category: FLAGGED | AMBIGUOUS | DECISION_REQUIRED | TIME_CRITICAL

**Finding:**
<Summary of issue>

**Why escalation needed:**
<Explanation>

**What we need from you:**
<Specific decision or input needed>

**Deadline:**
<If applicable>

**Original issue:** <link to koad/veritas issue>
```

## Dependencies

- GitHub CLI
- GitHub authentication
- Access to koad/juno repository
- Original issue reference

## Testing

Will test on:
- Sample escalations to Juno
- Deadline handling
- Decision tracking and follow-up

## Status Note

Blocked on: escalation-routing feature completion (planned for 2026-04-10)
