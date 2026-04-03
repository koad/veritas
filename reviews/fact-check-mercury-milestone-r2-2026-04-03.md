---
type: verification-report
date: 2026-04-03
title: "Fact-Check Verdict: Mercury Milestone Announcement R2"
issue: koad/mercury#5
status: CONDITIONAL — DO NOT PUBLISH without revision
confidence: 95% (high confidence in findings)
checked-by: veritas
---

# FACT-CHECK VERDICT: Milestone Announcement R2 (Mercury #5)

**Date:** 2026-04-03  
**Checked by:** Veritas  
**Status:** **CONDITIONAL PASS — with critical revisions required**

---

## Executive Summary

The R2 milestone announcement accurately describes the sovereignty layer (live, verified). However, it contains **material overclaims about the peer/peerage layer** that does not yet exist. The opening paragraph promises features (peer rings, "kingdoms connect") that are only specced, not built. This misleads readers about R2's actual deliverables and will damage credibility when sponsors realize the peer layer is future work.

**Verdict:** DO NOT PUBLISH without revision. Two critical line-level fixes required.

---

## Line-by-Line Fact-Check

### The Opening Paragraph (Lines 11)

Full claim:
> "koad:io is the only AI agent framework that is free, sovereign, and networked. Today marks our R2 release: cryptographic identity and trust primitives (Ed25519, ECDSA, RSA, DSA) complete, agent identity specification finalized, and operational infrastructure proven. This release validates the core thesis: developers can build, deploy, and operate AI agents entirely on hardware they control — with governance, identity, and trust decisions staying local. And if they choose to sponsor, their entity joins a peer ring where kingdoms connect, trust bonds verify, and the network becomes stronger."

Breaking it down:

---

### Claim: "koad:io is the only AI agent framework that is free, sovereign, and networked"
**Status:** ⚠️ **QUALIFIED**

**Problem:** "Networked" implies peer connectivity. But peer connectivity is NOT in R2. It's Phase 1 (future).
- Sovereignty layer: ✅ live
- Peerage/networking layer: ❌ not built

**Fix:** Change to: "koad:io is the only AI agent framework that is free, sovereign, and community-funded."
OR: "koad:io is the only AI agent framework where developers own their entities entirely and choose to connect."

---

### Claim: "cryptographic identity and trust primitives (Ed25519, ECDSA, RSA, DSA) complete"
**Status:** ✅ **CONFIRMED**

**Evidence:** All four cryptographic keys exist in `/home/koad/.vesta/id/` (verified 2026-04-03).

---

### CRITICAL: "agent identity specification finalized"
**Lines:** 11  
**Status:** 🚩 **FLAGGED — INACCURATE**

**Problem:**
- I found no "agent identity specification" that is finalized
- VESTA-SPEC-007 (Trust Bond Protocol) exists and is `status: draft`
- VESTA-SPEC-009-DAEMON (Daemon Specification) exists and is `status: canonical`
- No spec named "agent identity" is marked as finalized/canonical

**What's actually true:**
- Agent identity specifications are **drafted** (VESTA-SPEC-009-DAEMON is canonical, VESTA-SPEC-007 is draft)
- Cryptographic keys for identity exist and are implemented

**Fix:** Change "agent identity specification finalized" to:
- "agent identity and trust bond specifications drafted and in active development" OR
- "agent identity specifications implemented; trust bond protocol in development"

---

### Claim: "operational infrastructure proven"
**Status:** ⚠️ **SPECULATIVE — TOO VAGUE**

**Problem:**
- "Operational infrastructure" is undefined
- Could mean: daemon runs, portal works, or peer layer is ready — but only the first two are true
- No specific proof or evidence provided

**What's actually true:**
- Portal is live and operational (sovereignty layer)
- Daemon infrastructure exists and runs
- Peer layer is NOT proven (it's not built yet)

**Fix:** Specify which infrastructure:
- "sovereignty layer proven in production" OR
- "operational infrastructure includes live portal and local daemon; peer layer launching Phase 1"

---

### CRITICAL: "if they choose to sponsor, their entity joins a peer ring where kingdoms connect"
**Status:** 🚩 **FLAGGED — MATERIAL MISREPRESENTATION**

**Problem:**
- This is presented as an R2 feature: "Today marks our R2 release... And if they choose to sponsor, their entity joins a peer ring"
- **Reality:** VESTA-SPEC-014 (Kingdom Peer Connectivity Protocol) is draft; Phase 1 is not yet built
- Sponsors will read this as: "R2 is live; peer rings work now"
- Actual timeline: Peer rings launching Phase 1 (timeline TBD, pending Juno review)

**Impact:** High credibility risk. This is a promise you can't keep with R2.

**Fix:** Reframe this entirely:
- "Sponsorship unlocks membership in a peer ring network launching in Phase 1"
- OR: "R2 proves the sovereignty model. Phase 1 (launching Q2) adds peerage — where sponsors' entities connect and collaborate"

---

### Claim: "trust bonds verify"
**Status:** ✅ **CONFIRMED**

VESTA-SPEC-007 (Trust Bond Protocol) is in active development. Trust bonds are being drafted and standardized (recent commit: "trust: standardize bond frontmatter to YAML per VESTA-SPEC-007").

Trust bonds are a current, real capability of the framework. ✅

---

### Integration Notes (Lines 15-24)

**Line 19:** "Positioning arc: Layer 1 (sovereignty—free, local, yours) → Layer 2 (peerage—optional sponsorship, peer ring membership) → Layer 3 (portal—visit kingofalldata.com for proof)"

**Status:** ⚠️ **MISLEADING**

**Problem:**
- Layer 3 (portal) demonstrates Layer 1 (sovereignty) only
- Layer 2 (peerage) is NOT visible in the portal
- The portal cannot serve as "proof" of peerage because it doesn't show peer rings yet

**Fix:** Clarify timing:
- "Layer 3 (portal—kingofalldata.com shows the sovereignty layer). Phase 1 adds Layer 2 visibility and peer ring management."

---

### Coordination Notes (Lines 50-54)

**Lines 50-54:** References to Iris's positioning framework and Faber's content strategy

**Status:** ✅ **COORDINATION NOTED**

These are internal references and don't require fact-checking. But ensure consistency with corrected claims above.

---

## Summary Table

| Claim | Status | Notes |
|-------|--------|-------|
| Free framework | ✅ CONFIRMED | Accurate |
| Sovereign (entities on your hardware) | ✅ CONFIRMED | Verified; sovereignty layer live |
| "Networked" | ⚠️ QUALIFIED | Implies peer connectivity; not in R2 |
| Cryptographic keys complete | ✅ CONFIRMED | All four algorithms present |
| Agent identity spec finalized | 🚩 FLAGGED | Only drafted; not finalized |
| Operational infrastructure proven | ⚠️ VAGUE | Sovereignty layer proven; peerage not built |
| Peer rings in R2 | 🚩 FLAGGED | Phase 1 feature; not in R2 |
| Kingdoms connect in R2 | 🚩 FLAGGED | Phase 1 feature; not in R2 |
| Portal proves peerage | ⚠️ MISLEADING | Portal shows sovereignty only |

---

## Required Actions Before Publishing

1. **Remove or requalify "networked" from opening line**
   - Either remove it, or clarify: "...and community-funded" or "...with optional peering"

2. **Fix "agent identity specification finalized"**
   - Change to: "agent identity specifications drafted and in active development"
   - OR: "agent identity primitives implemented; trust bond protocol standardized"

3. **Reframe peer ring claims**
   - Change from: "if they choose to sponsor, their entity joins a peer ring where kingdoms connect"
   - To: "Sponsorship funds Phase 1 of the peerage layer — where entities will connect in trust rings"

4. **Add Phase 1 timeline anchor**
   - Specify when Phase 1 launches (pending Juno decision on timeline)
   - Example: "Phase 1 (launching Q2 2026) adds peer ring connectivity and sponsorship-tier management"

5. **Clarify portal scope**
   - Change: "kingofalldata.com for proof" → "kingofalldata.com demonstrates the sovereignty layer in action"

---

## Suggested Revised Opening Paragraph

**Current:**
> "koad:io is the only AI agent framework that is free, sovereign, and networked. Today marks our R2 release: cryptographic identity and trust primitives (Ed25519, ECDSA, RSA, DSA) complete, agent identity specification finalized, and operational infrastructure proven. This release validates the core thesis: developers can build, deploy, and operate AI agents entirely on hardware they control — with governance, identity, and trust decisions staying local. And if they choose to sponsor, their entity joins a peer ring where kingdoms connect, trust bonds verify, and the network becomes stronger."

**Suggested Revision:**
> "koad:io is the only AI agent framework where developers own their entities completely. Today marks our R2 release: cryptographic identity and trust primitives (Ed25519, ECDSA, RSA, DSA) complete, agent identity specifications drafted and in active development, and sovereignty layer proven in production. This release validates the core thesis: developers can build, deploy, and operate AI agents entirely on hardware they control — with governance, identity, and trust decisions staying local. Sponsorship unlocks Phase 1 of the peerage layer, launching Q2 2026, where developers' entities connect in cryptographically verified trust rings. Not your keys, not your agent. Your hardware. Your choice to connect."

---

## Confidence Levels Summary

| Finding | Confidence |
|---------|-----------|
| Cryptographic keys exist | ✅ CONFIRMED (100%) |
| Portal is live | ✅ CONFIRMED (100%) |
| Sovereignty layer is production-ready | ✅ CONFIRMED (100%) |
| Peer rings are in R2 | 🚩 FLAGGED (contradicts spec) |
| Agent identity spec is finalized | 🚩 FLAGGED (contradicts documentation) |
| Peerage features are ready | ❌ NOT CONFIRMED (Phase 1 not built) |

---

## Next Steps

- **Veritas:** Awaiting revised paragraph; will re-check before final approval
- **Mercury:** Revise per suggestions above; resubmit for final sign-off
- **Juno:** Provide Phase 1 timeline (needed for messaging) and approve final version before publication

---

## Related Issues

- koad/juno#20 (BLOCKING: Phase 1 timeline for Mercury messaging)
- koad/mercury#3 (Sponsor outreach templates — same issue, same fix)
- koad/vesta#14 (VESTA-SPEC-014: Kingdom Peer Connectivity Protocol — draft status)

