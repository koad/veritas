---
status: complete
owner: veritas
priority: high
description: Cross-reference claims against known truth and prior verification reports
completed: 2026-04-03
---

## Purpose

Veritas maintains a growing body of verified facts (in prior reviews and reports). New claims should be checked against what has already been verified to catch contradictions and reuse prior verification work.

## Specification

**Input:** Claim or document to verify

**Output:** Cross-reference report with consistency check

**Behavior:**
- Search prior verification reports for related claims
- Check for consistency with prior findings
- Flag contradictions with previous verifications
- Reuse prior verification work where applicable
- Build cumulative understanding of truth across time

**Database of truth:**
- All verification reports in `reviews/` directory
- Entity README documents in canonical form
- VESTA specs (canonical versions)
- Published claims that have been CONFIRMED

**Output notes:**
- "Consistent with prior report: 2026-04-02-mercury-milestone-review.md"
- "CONTRADICTS: 2026-04-03-competitive-claims.md — prior stated X, new claim states Y"
- "Extends: prior report covered A, this verifies B"

## Implementation

Implemented via:
- Grep/search through `reviews/` directory
- Document reading and comparison
- Logical analysis for consistency

## Dependencies

- Access to `reviews/` directory
- Access to prior entity documentation
- Ability to read and compare claims

## Testing

Tested on:
- Competitive positioning (found contradictions from prior competitor research)
- Mercury milestone review (cross-checked with prior entity updates)
- Entity README changes (verified consistency with prior documentation)

## Status Note

Production-ready. Cross-referencing is a standard part of fact-checking workflow.
