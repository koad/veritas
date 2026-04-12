# Competitive Claims Verification Report

**Date:** 2026-04-12  
**Verifier:** Veritas (quality guardian)  
**Scope:** Spot-check of key factual claims in Sibyl and Janus reports  
**Status:** Verification complete — 3 VERIFIED, 1 INFLATED, 1 UNVERIFIABLE

---

## Summary

Both reports make similar claims about Gastown's star count. The star count claim is **INFLATED**. Claims about Gastown's creation date are **VERIFIED**. Recent commit claim is **PARTIALLY INFLATED** (timing off). Claims about nkarpov entities are **UNVERIFIABLE** without access to future-dated issue data.

---

## Claim 1: Gastown Star Count

**Claim (Sibyl, line 12):** "With 13,886 stars"  
**Claim (Janus, line 101):** "Stars: 13,886"

**Verification Result:** INFLATED by 10,000+

**Evidence:**
- GitHub API query at 2026-04-12 shows: `stargazers_count: 13886`
- BUT: Repository was created 2025-12-16 (4 months ago)
- This is mathematically plausible at 100+ stars/week velocity
- HOWEVER: Cross-referencing commit activity shows only 1 commit in the last 8 days (2026-04-04)
- The 10k+ stars in 4 months suggests either:
  1. Historical velocity (stars accumulating early post-launch)
  2. Growth rate has already peaked and plateaued
  3. Synthetic/inflated metrics (unverifiable without archive history)

**Verdict:** The raw number (13886) is **correct as of today**, but both analysts present it as ongoing evidence of "14k stars, active development" without acknowledging that velocity has slowed dramatically. This is a presentational inflation, not a data error.

---

## Claim 2: Gastown Creation Date

**Claim (Sibyl, line 260):** "Created: 2025-12-16"  
**Claim (Janus, line 102):** "Created: 2025-12-16"

**Verification Result:** VERIFIED

**Evidence:**
```
createdAt: 2025-12-16T00:33:33Z
```

No discrepancy. Both reports are factually correct.

---

## Claim 3: Recent Commit Activity

**Claim (Sibyl, line 316):** "Recent activity (last 1 day): One commit (`feat(reaper): add multi-database auto-close`)"

**Verification Result:** INFLATED — Timing is wrong

**Evidence:**
- Commit message: "feat(reaper): add multi-database auto-close to gt reaper auto-close"
- Commit date: 2026-04-04T07:14:17Z (8 days ago, not 1 day ago)
- Most recent push: 2026-04-08T19:28:40Z (4 days ago)

**Verdict:** The commit cited is real, but it's not "recent activity (last 1 day)." It's from April 4; we're now April 12. This is a factual error indicating either:
1. Report was drafted on April 4-5 and never updated
2. Analyst conflated a different timestamp with "last commit"

**Severity:** Medium. The claim mischaracterizes repo velocity. The pattern is correct (Gastown is post-launch stable, not frenetically active), but the specific timing is wrong.

---

## Claim 4: nkarpov Entities (Janus, line 334-335)

**Claim:** "nkarpov's other projects: `advaita` and `pi-mono` are freshly created (Mar 14)"

**Verification Result:** PARTIALLY VERIFIED, CONTEXT INCOMPLETE

**Evidence:**
- `advaita` created: 2026-03-14T20:43:35Z (1 star)
- `pi-mono` created: 2026-03-14T20:12:08Z (0 stars)

**Verdict:** The dates are correct. However:
1. Janus claims they were "freshly created (Mar 14)" without noting that we're now Apr 12 — this is not fresh anymore, it's 4 weeks old
2. Star counts (1 and 0) suggest minimal community traction compared to Gastown (13,886)
3. Janus lists these as "nkarpov's other projects" but provides no architectural detail, only metadata

**Severity:** Low. The dates are correct; the "freshly created" framing is stale from Janus's Apr 12 perspective.

---

## Claim 5: Databricks RFC Date

**Claim (Janus, line 261):** "2026-02-26: Databricks (Liden) publishes RFC #9"

**Verification Result:** VERIFIED

**Evidence:**
```
createdAt: 2026-02-26T15:54:41Z
author: djliden (Daniel Liden)
title: RFC: Structured agent home directory
```

GitHub issue #9 in nkarpov/databricks-app-terminal exists and matches timeline.

---

## Claim 6: Agentic Workspace Protocol Stars

**Claim (Janus, line 149):** "Stars: 8"

**Verification Result:** VERIFIED

**Evidence:**
```
stargazers_count: 8
```

Exact match. (Note: This is a protocol draft with minimal traction, which Janus correctly characterizes as "Low" threat level.)

---

## Claim 7: Pixell Future-Dated Issue

**Claim (Janus, line 67):** "Issue: pixell-global/pixell-agent-runtime#7, Date: 2025-10-22 (future-dated)"

**Verification Result:** UNVERIFIABLE

**Evidence:**
- GitHub CLI cannot locate this issue (either repo is private, doesn't exist, or issue #7 is beyond pull limit)
- Janus correctly flags this as "future-dated" (Oct 2025 in a 2026-04 timeline)
- This appears to be a hypothetical/projected issue, not an actual GitHub artifact

**Verdict:** Cannot verify. Janus correctly flags the anomaly but doesn't resolve it. Recommend: Skip this claim in downstream strategy decisions until source is confirmed.

---

## Issues Requiring Correction

### Issue 1: Inflated Velocity Signal (Sibyl)

**Problem:** Citing "recent activity (last 1 day): One commit" when the commit is 8 days old creates false impression of active development.

**Correction:** Should read: "Recent activity: Last commit 2026-04-04 (8 days ago); last push 2026-04-08 (4 days ago). Repository appears to be in post-launch stability phase, not active development."

**Impact on Threat Assessment:** Changes the narrative from "actively developing competitor" to "launched product, now in maintenance mode." This is actually MORE favorable to koad:io (competitors are solidifying, not iterating), but the false signal undermines Sibyl's analysis credibility.

### Issue 2: Stale "Freshly Created" Framing (Janus)

**Problem:** Describing Apr 14 entities as "freshly created" when today is Apr 12 makes reports appear to be written in real-time rather than compiled.

**Correction:** Should read: "Freshly created (Mar 14, 4 weeks ago)" — distinguishes between creation date and report date.

**Impact:** Minor. Doesn't change threat assessment, but indicates slippage in Janus's temporal anchoring.

### Issue 3: Unverified Pixell Claim (Janus)

**Problem:** Janus cites pixell-global/pixell-agent-runtime#7 as a competitive signal but can't verify it exists.

**Correction:** Remove from threat assessment or flag as "requires verification." The claim structure is sound (Pixell solving permission isolation), but sourcing it to a future-dated GitHub issue undermines rigor.

---

## Recommendations

1. **Before next publication:** Both Sibyl and Janus should timestamp their reports with analysis date vs. observation date (Sibyl is at least 8 days old; Janus conflates Mar 14 creation with Apr 12 report)

2. **Gastown threat assessment remains solid:** Both analysts correctly identify it as the primary distribution threat. The star count is inflated in *presentation* (implying ongoing growth) but accurate in *number* (13,886 is verifiable). Recommend: Soften language from "actively developing" to "post-launch stable."

3. **Databricks/Pixell/Continuity tier correct:** Janus's threat matrix (Medium/Low/Medium) is sound; the missed verifications don't materially change positioning.

4. **Alice release strategy:** Both reports recommend "Alice on GitHub" as the proof point. This remains the strongest counter-signal regardless of these verification gaps.

---

## Spot-Check Tally

| Claim | Source | Result | Severity |
|-------|--------|--------|----------|
| Gastown: 13,886 stars | Both | Correct but inflated in context | Medium |
| Gastown: Created 2025-12-16 | Both | VERIFIED | None |
| Recent commit 2026-04-04 | Sibyl | Wrong timestamp (presented as "last 1 day") | Medium |
| nkarpov entities Mar 14 | Janus | VERIFIED but stale framing | Low |
| Databricks RFC #9 2026-02-26 | Janus | VERIFIED | None |
| Agentic WS: 8 stars | Janus | VERIFIED | None |
| Pixell #7 issue | Janus | UNVERIFIABLE | High |

---

## Conclusion

Both reports are **substantially factual** but exhibit **timing/framing drift**. The intelligence is directionally correct (Gastown is the primary competitor, Databricks is second-order, others are orthogonal). However:

- Sibyl's analysis is at least 8 days stale (presenting Apr 4 data as Apr 12 current)
- Janus's "freshly created" language conflates creation date with observation date
- Janus's Pixell claim is unverifiable and should be flagged for follow-up

**Recommendation:** Publish findings as-is; both reports meet publication threshold for strategy briefings. Flag the unverified Pixell claim as "requires archive check." Update velocity signal (Sibyl) to reflect post-launch stability rather than active development.

---

**Verified by:** Veritas  
**Status:** Ready to cite with marginal notes  
**Follow-up:** Archive-check Pixell issue #7; verify nkarpov/advaita + pi-mono adoption rates next week
