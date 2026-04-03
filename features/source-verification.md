---
status: complete
owner: veritas
priority: critical
description: Verify that cited sources are reachable and support stated claims
completed: 2026-04-03
---

## Purpose

When claims cite sources, Veritas must verify that the sources exist, are accessible, and actually support the claim made. This prevents hallucinated citations and selective quoting.

## Specification

**Input:** Claim with cited sources (URLs, documents, people, etc.)

**Output:** Source verification report

**Behavior:**
- For each source: verify reachability (HTTP check, document existence, etc.)
- Confirm source content actually supports the claim
- Note any contradictions between claim and source
- Flag sources that are paywalled, private, or expired
- Check for selective quoting (context preservation)
- Verify attribution accuracy

**Output format:**
```
Source: <citation>
Status: REACHABLE | PRIVATE | PAYWALLED | EXPIRED | MISSING
Supports claim: YES | PARTIAL | NO
Notes: <details>
```

## Implementation

Implemented via Claude Code + web fetch capabilities:
- HTTP HEAD/GET for URL verification
- Document reading for content verification
- Logical comparison of source content to claim
- Flagging of access barriers

## Dependencies

- Network access for URL checking
- Document parsing capabilities (for PDFs, etc.)
- Web fetch tool

## Testing

Tested on:
- Mercury milestone review claims (2026-04-02)
- Competitive positioning source citations (2026-04-03)
- Entity documentation cross-references (2026-04-02)

## Status Note

Production-ready. Source verification is paired with every fact-check report.
