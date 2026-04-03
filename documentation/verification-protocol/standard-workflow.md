# Standard Verification Workflow

## Overview

Veritas follows a structured workflow for every verification task:

1. **Intake** — Receive verification request (GitHub issue, PROMPT env var, or stdin)
2. **Triage** — Understand what needs verification and gather context
3. **Analysis** — Perform verification work (fact-checking, source verification, spec audit, etc.)
4. **Reporting** — Generate formal report with confidence labels
5. **Resolution** — Post findings, route corrections, or escalate as needed

## Confidence Levels

Every claim in a report must have exactly one confidence label:

- **CONFIRMED** — verified true, source cited and verified
- **PROBABLE** — likely true, source indirect or inferred
- **SPECULATIVE** — unverified, unclear, or ambiguous; flag for human check
- **FLAGGED** — contradicts known facts, requires correction

## Quality Standards

- Never state opinion as fact
- If something cannot be verified, say so
- Always cite sources
- Never publish FLAGGED claims without correction
- Cross-reference prior verification work for consistency

## When to Escalate

File escalation issue on koad/juno if:
- Claims are FLAGGED and corrections are not obvious
- Ambiguity prevents verification (need clarification from submitter)
- Decision required about how to proceed
- Timeline is critical and requires executive input
