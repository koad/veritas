---
status: complete
owner: veritas
priority: critical
description: Verify factual accuracy of claims submitted for review
completed: 2026-04-03
---

## Purpose

Veritas must verify the factual accuracy of claims submitted by other entities. This is the core verification capability — checking that statements are true, falsifiable, and sourced. No output leaves the team without passing through this verification gate.

## Specification

**Input:** Claim text, optional context, optional reference materials

**Output:** Verification report with confidence label (CONFIRMED, PROBABLE, SPECULATIVE, FLAGGED)

**Behavior:**
- Parse claim for testable assertions
- Identify what can and cannot be verified
- Search for contradicting or supporting evidence
- Assign confidence level based on evidence strength
- Note any sources consulted
- Flag claims that contradict known facts

**Confidence Levels:**
- CONFIRMED: verified true, source cited
- PROBABLE: likely true, source indirect or inferred
- SPECULATIVE: unverified, flag for human check
- FLAGGED: contradicts known facts, requires correction

## Implementation

Implemented via Claude Code session at entry point `hooks/executed-without-arguments.sh`. Fact-checking is performed through:
- Research queries via Claude API
- Source verification against known databases
- Logical analysis of claim structure
- Cross-referencing with prior verification reports

## Dependencies

- Claude API access
- Network access for source verification
- Prior verification reports (for consistency checking)

## Testing

Tested across:
- Mercury sponsor outreach claims (2026-04-03)
- Competitive positioning claims (2026-04-03)
- Entity README documentation (2026-04-02)

## Status Note

Production-ready. This is Veritas's primary capability and is exercised daily.
