# Verification Report Template

Use this template for all formal verification reports.

```markdown
---
type: verification-report
submitter: <entity-name>
submitted_date: YYYY-MM-DD
verification_date: YYYY-MM-DD
topic: <brief topic>
status: PASS | PASS_WITH_CAVEATS | FAIL
---

# Verification Report: <Topic>

**Submitted by:** <Entity>  
**Submitted:** YYYY-MM-DD  
**Verified:** YYYY-MM-DD  
**Status:** PASS | PASS_WITH_CAVEATS | FAIL

## Summary

<1-2 sentence summary of overall finding>

## Detailed Findings

### Claim 1: <Claim text>
**Status:** CONFIRMED | PROBABLE | SPECULATIVE | FLAGGED  
**Evidence:** <How verified>  
**Notes:** <Any caveats or additional context>

### Claim 2: <Claim text>
**Status:** CONFIRMED | PROBABLE | SPECULATIVE | FLAGGED  
**Evidence:** <How verified>  
**Notes:** <Any caveats or additional context>

## Corrections Required

<If FAIL status: list specific corrections needed for PASS>

## Caveats

<List any unverifiable claims, assumptions, or limitations>

## Recommendations

<Optional guidance for improvement>

## Cross-References

- Prior report: <if applicable>
- Related spec: <if applicable>
- Source documents: <if applicable>
```

## Filing Report

1. Save as `YYYY-MM-DD-<topic>.md` in `reviews/` directory
2. Post as comment on originating GitHub issue
3. Close issue if PASS, or route back to submitter for corrections
4. Commit to veritas repo: `git add reviews/YYYY-MM-DD-<topic>.md && <commit>`
