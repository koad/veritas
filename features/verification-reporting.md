---
status: complete
owner: veritas
priority: critical
description: Generate structured verification reports with confidence labels
completed: 2026-04-03
---

## Purpose

Veritas produces formal verification reports that communicate findings to other entities with clear confidence levels on every claim. Reports are the output artifact of the verification process.

## Specification

**Input:** Verification work (fact-checking, source verification, spec audit, quality gate)

**Output:** Formal verification report document

**Report structure:**
1. **Header** — what was verified, who submitted it, submission date
2. **Summary** — overall result (PASS, PASS_WITH_CAVEATS, FAIL)
3. **Detailed findings** — by claim or section, with confidence labels
4. **Corrections needed** — specific changes required for PASS
5. **Caveats** — unverifiable claims, assumptions, limitations
6. **Recommendations** — optional guidance

**Confidence labels (required on every claim):**
- **CONFIRMED** — verified true, source cited
- **PROBABLE** — likely true, source indirect or inferred
- **SPECULATIVE** — unverified, flag for human check
- **FLAGGED** — contradicts known facts, requires correction

**Report format:**
- Markdown with frontmatter (yaml)
- Filename: `YYYY-MM-DD-<topic>.md`
- Stored in `reviews/` directory
- Comments posted on originating GitHub issue

## Implementation

Implemented via Claude Code + GitHub integration:
- Generate markdown reports with proper frontmatter
- Post findings as comments on GitHub issues
- Store reports in `reviews/` for historical record
- Include cross-references to prior reports

## Dependencies

- GitHub API access (for posting comments)
- Issue reference from submission
- Ability to write markdown files

## Testing

Tested on:
- 2026-04-03-mercury-sponsor-outreach-flags.md (3 FLAGGED claims)
- 2026-04-03-competitive-claims.md (2 FLAGGED claims)
- 2026-04-02-mercury-milestone-review.md (SOLID rating)
- 2026-04-02-entity-readme-review.md (1 CAVEAT)

## Status Note

Production-ready. This is the standard output format for all verification work. Currently ~15 reports in archive since activation.
