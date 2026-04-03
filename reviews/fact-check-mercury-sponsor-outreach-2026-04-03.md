---
type: verification-report
date: 2026-04-03
title: "Fact-Check Verdict: Mercury Sponsor Outreach Templates"
issue: koad/mercury#3
status: CONDITIONAL — DO NOT SEND without corrections
confidence: 95% (high confidence in findings)
checked-by: veritas
---

# FACT-CHECK VERDICT: Sponsor Outreach Templates (Mercury #3)

**Date:** 2026-04-03  
**Checked by:** Veritas  
**Status:** **CONDITIONAL PASS — with critical line-level flags**

---

## Executive Summary

The outreach templates accurately position koad:io as free and sovereignty-focused. **However, they contain material misrepresentations about daemon peer connectivity status.** The templates present peer rings and kingdom-to-kingdom connections as current, ready-to-use features. In reality, VESTA-SPEC-014 is draft, and Phase 1 (peer discovery, TLS, basic streaming) has not yet been built. This creates false expectations with sponsors.

**Verdict:** DO NOT SEND without corrections. One structural fix required. One placeholder unfilled.

---

## Line-by-Line Fact-Check

### Claim: "koad:io is free, no paywall"
**Lines:** 11, 49, 72, 200  
**Status:** ✅ **CONFIRMED**  
**Evidence:** Framework architecture (VESTA-SPEC-005) shows paywall exemption. Sponsorship unlocks peerage membership, not framework features. Accurate.

---

### Claim: kingofalldata.com is live
**Lines:** 87, 121, 150, 204  
**Status:** ✅ **CONFIRMED**  
**Evidence:** User report 2026-04-03. Portal is operational.

---

### CRITICAL: "daemon joins a trust ring where kingdoms connect to kingdoms"
**Lines:** 19-22, 51-52, 82-85, 120-121, 149-151  
**Status:** 🚩 **FLAGGED — MATERIAL MISREPRESENTATION**

**Problem:**
- Templates claim peer connectivity is ready: "Your daemon joins a trust ring," "Peer connections are the product," "kingdom-to-kingdom pipes."
- **Reality:** VESTA-SPEC-014 (Kingdom Peer Connectivity Protocol) is marked `status: draft` (line 602) and states "Implementation begins after Juno review" (line 29).
- **Section 10 (Implementation Phases)** defines Phase 1 as future work: "Daemon peer port and certificate infrastructure... Sponsor sync protocol... Worker state streaming only."
- Phase 1 is **not yet built.**

**Impact:** Sponsors will invest based on a feature that doesn't exist and won't for weeks/months. This violates your positioning principles ("No hype, work speaks for itself").

**Correction needed:**
- Reposition peer connectivity as "coming in Phase 1" or "roadmap: peerage layer launching Q2"
- Lead with sovereignty (live, proven) → then position peerage as "founding-sponsor privilege" to beta-test the peer layer
- Remove or requalify claims like "daemon joins a trust ring" and "kingdom-to-kingdom pipes"

---

### Claim: "Portal is proof of transparent governance in action"
**Lines:** 87-88, 121, 150, 182  
**Status:** ⚠️ **PARTIAL — MISLEADING IN CONTEXT**

**Problem:**
- kingofalldata.com is live (sovereignty layer)
- But it does not yet expose peer connections, trust rings, or "transparent governance" of the daemon peer layer
- The spec (VESTA-SPEC-014, Section 6) describes portal integration as **Phase 1** (not yet built)
- Sponsors visiting the portal will NOT see what you're describing

**Impact:** Sponsors click the link expecting to see peer ring governance. They see sovereignty layer only. Credibility hit.

**Correction:** Reframe portal as "Sovereign Kingdom Dashboard" (not peer ring proof). Save "transparent peer governance proof" for Phase 1 release.

---

### Claim: "Cryptographic implementation complete (Ed25519, ECDSA, RSA, DSA)"
**Lines:** 92 (Variant 2), [also Milestone Announcement line 11]  
**Status:** ✅ **CONFIRMED**  
**Evidence:** Keys exist at `/home/koad/.vesta/id/` (checked 2026-04-03):
```
ed25519, ed25519.pub
ecdsa, ecdsa.pub
rsa, rsa.pub
dsa, dsa.pub
```

---

### Claim: "Agent identity and trust bond specifications drafted"
**Lines:** 93 (Variant 2)  
**Status:** ✅ **CONFIRMED (partially)**

**Evidence:**
- VESTA-SPEC-007 (Trust Bond Protocol) exists, marked `status: draft`
- Recent commit (5ffce6e): "trust: standardize bond frontmatter to YAML per VESTA-SPEC-007"
- Spec is in active development

**Note:** The phrase "drafted" is accurate (spec exists but not finalized). ✅

---

### Claim: "Operational infrastructure tested in production"
**Lines:** 94 (Variant 2)  
**Status:** ⚠️ **SPECULATIVE — VAGUE**

**Problem:**
- "Operational infrastructure" is undefined. Which infrastructure? Daemon? Portal? Peer layer?
- No evidence of production testing provided
- Could mean: framework tested (yes), peer layer tested (no — not built)
- Makes a broad claim without specificity

**Recommendation:** Either remove or specify: "Sovereignty layer tested in production" (more accurate). Avoid vague "operational infrastructure" in sponsor communication.

---

### ISSUE: Placeholder Text Not Filled
**Line:** 95 (Variant 2)  
**Status:** 🚩 **BLOCKER**

```
Early feedback from [TEAM MEMBERS]
```

This is not filled in. Must either:
1. **Remove** this bullet (cleanest)
2. **Fill in** names: "Early feedback from [specific team member, specific feedback]"

Do NOT send with brackets. [TEAM MEMBERS] is a placeholder.

---

### Claim: vLLM partnership framing (Variant 3)
**Lines:** 106-131  
**Status:** ✅ **ACCURATE**

vLLM and koad:io are complementary. The framing is sound: vLLM = execution layer, koad:io = governance + peerage layer. No factual issues here.

---

### Claim: Positioning arc (Sovereignty → Peerage → Portal)
**Lines:** 196-210  
**Status:** ⚠️ **SEMANTICALLY WEAK**

"Layer 3: Portal — kingofalldata.com is infrastructure, not marketing"

**Problem:** Portal demonstrates Layer 1 (sovereignty) only right now. It doesn't demonstrate Layer 2 (peerage) because that's not built. Don't promise "infrastructure proof" of something not yet implemented.

**Fix:** "Layer 3: Portal — kingofalldata.com shows the sovereignty layer in action. Phase 1 (launching Q2) adds peer layer visibility."

---

## Summary Table

| Claim | Status | Notes |
|-------|--------|-------|
| Free framework, no paywall | ✅ CONFIRMED | Accurate |
| kingofalldata.com live | ✅ CONFIRMED | Verified 2026-04-03 |
| Daemon peer connectivity ready | 🚩 FLAGGED | Not built; spec only |
| Peer rings as current feature | 🚩 FLAGGED | Overclaim; Phase 1 pending |
| Portal as peer proof | ⚠️ PARTIAL | Misleading; shows sovereignty only |
| Cryptographic keys complete | ✅ CONFIRMED | All four algorithms present |
| Trust bond spec drafted | ✅ CONFIRMED | VESTA-SPEC-007 active |
| Operational infrastructure proven | ⚠️ VAGUE | Needs specificity |
| [TEAM MEMBERS] placeholder | 🚩 BLOCKER | Unfilled; cannot send |

---

## Required Actions Before Sending

1. **Remove or heavily qualify all peer connectivity claims** (Lines 19-22, 51-52, 82-85, 120-121, 149-151)
   - Replace with: "Sponsorship unlocks membership in our peer ring network launching in Q2"
   - OR pivot entirely to: "Sponsorship funds Phase 1 development of the peer layer"

2. **Reframe portal claim** (Line 87-88, 121, 150, 182)
   - Change from: "Portal is proof of peer governance"
   - To: "Portal demonstrates sovereign kingdom dashboard. Peer layer launching Phase 1 (Q2)."

3. **Remove placeholder** (Line 95, Variant 2)
   - Delete "[TEAM MEMBERS]" bullet entirely, OR
   - Fill with specific names and feedback quotes

4. **Add specificity to "operational infrastructure"** (Line 94)
   - Specify which infrastructure has been tested (sovereignty layer? daemon?)

---

## Positioning Suggestion

**Current:** "The daemon IS the ring of trust. Peer connections are the product."  
**Better:** "The daemon is the sovereignty layer. Sponsorship funds the peer ring network (Phase 1, launching Q2)."

This resets expectations, emphasizes what's real (sovereignty), and positions sponsors as *funders of Phase 1* rather than users of a non-existent feature.

---

## Confidence Levels

| Finding | Confidence |
|---------|-----------|
| Free framework claim | ✅ 100% (CONFIRMED) |
| kingofalldata.com is live | ✅ 100% (CONFIRMED) |
| Cryptographic keys exist | ✅ 100% (CONFIRMED) |
| Peer connectivity not in R2 | 🚩 98% (contradicts VESTA-SPEC-014) |
| [TEAM MEMBERS] unfilled | ✅ 100% (direct file evidence) |
| Portal shows sovereignty only | ✅ 95% (inference from spec + current state) |

---

## Next Steps

- **Veritas:** Awaiting corrections; will re-check before final sign-off
- **Mercury:** Make corrections; resend for final fact-check
- **Juno:** Decide Phase 1 timeline (needed for messaging) and approve revised templates

---

## Related Issues

- koad/juno#20 (BLOCKING: Phase 1 timeline for Mercury messaging)
- koad/vesta#14 (VESTA-SPEC-014: Kingdom Peer Connectivity Protocol — draft status)

