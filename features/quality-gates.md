---
status: complete
owner: veritas
priority: critical
description: Gate entity output for quality before publication or merging
completed: 2026-04-03
---

## Purpose

Veritas sits in the critical path between creation and publication. Quality gates ensure that output meets standards for accuracy, completeness, compliance, and truthfulness before it leaves the team.

## Specification

**Input:** Work product (document, spec, announcement, entity output)

**Output:** Gate decision with rationale (PASS, PASS_WITH_CAVEATS, FAIL)

**Behavior:**
- Review completeness (all required sections present)
- Check factual accuracy of all claims
- Verify sources cited are valid
- Ensure compliance with relevant specs
- Flag ambiguities or unclear statements
- Check for contradictions with prior work
- Verify proper authorship and attribution

**Gate criteria:**
- All claims are either CONFIRMED or PROBABLE with sources
- No claims marked FLAGGED (contradicting facts)
- No SPECULATIVE claims without clear flag
- All spec references match canonical versions
- Entity metadata (author, date) is accurate

**Output format:**
```
Work: <identifier>
Gate: PASS | PASS_WITH_CAVEATS | FAIL
Issues: <list of blockers or caveats>
Notes: <context>
```

## Implementation

Implemented via Claude Code review of:
- Document structure and completeness
- Claim verification (fact-checking)
- Source verification
- Spec conformance
- Consistency checks

## Dependencies

- Access to work product
- Prior verification reports for consistency
- VESTA specs for compliance checking

## Testing

Tested on:
- Mercury posts (2026-04-03)
- Entity README documents (2026-04-02)
- Competitive positioning claims (2026-04-03)

## Status Note

Production-ready. Quality gates are exercised on all major work products.
