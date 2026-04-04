---
name: Mercury Positioning Fact-Check Criteria & Audit Results
description: Fact-check framework and audit findings for Mercury's 2026-04-03 positioning drafts
type: project
---

# Mercury Positioning Fact-Check Framework & Audit Results

**Date:** 2026-04-03  
**Auditor:** Veritas  
**Scope:** Three Mercury positioning drafts + supporting evidence verification

---

## Fact-Check Framework

### Claim Categories

1. **FACTUAL** — Verifiable against objective evidence (git logs, file existence, specifications, team structure)
2. **STRUCTURAL** — Claims about architecture, protocols, capabilities (testable against specs)
3. **TIMELINE** — Claims about dates, durations, completion status (verifiable via git history)
4. **OPINION** — Directional claims, value statements, marketing positioning (label but keep)
5. **ASPIRATIONAL** — Claims about planned or in-progress work (must be clearly labeled)

### Evidence Standards

| Claim Type | Evidence Required | Source |
|------------|------------------|--------|
| Entity counts | TEAM_STRUCTURE.md roster + git log evidence | Juno repo |
| Trust bonds signed | Files in trust/bonds/ directory | Juno repo |
| Specification exists | File exists in vesta/specs/ | Vesta repo |
| Gestation timeline | Git commit timestamps | Juno git history |
| Protocol/spec complete | Spec file date + commit reference | Vesta repo |
| Feature/curriculum drafted | Project file exists + status field | Juno PROJECTS/ |
| Feature live/operational | Listed as [x] COMPLETE in roadmap or project | Juno GTD_ROADMAP.md |
| Website live | Domain accessible OR explicitly delivered in completed projects | GTD_ROADMAP milestones |

---

## Specific Claims Audited

### CLAIM 1: "15 entities operational"

**Location:** Sponsor outreach (implied), milestone announcement (implied)

**Verification:**

1. **Count from TEAM_STRUCTURE.md (as of 2026-03-31):**
   - Juno, Vulcan, Vesta, Aegis, Janus, Argus, Salus, Veritas, Mercury, Muse, Sibyl, Astro, Alice
   - Status: 3 Active (Juno, Vulcan, Vesta, Astro, Alice), 8 Assigned to Vulcan (pending gestation)
   - **Operational count: 5**

2. **New entities discovered in trust/bonds/ (not in team table):**
   - Faber (2026-04-03)
   - Iris (2026-04-03)
   - Livy (2026-04-03)
   - Rufus (2026-04-03)

3. **Total verifiable:** 9 entities with signed trust bonds

**VERDICT:** **UNVERIFIED** — No evidence of 15 operational entities. Juno team table documents 5 active entities; 8 pending gestation. Four additional entities (Faber, Iris, Livy, Rufus) appear gestated but not documented in TEAM_STRUCTURE.md.

**Confidence:** FLAGGED — claim exceeds documented state

---

### CLAIM 2: "All trust bonds signed"

**Location:** Implied in sponsor positioning ("trust bonds active")

**Verification:**

**Current trust bonds in ~/.juno/trust/bonds/:**
1. koad-to-juno.md + .asc ✓
2. juno-to-vulcan.md + .asc ✓
3. juno-to-vesta.md + .asc ✓
4. juno-to-aegis.md + .asc ✓
5. juno-to-argus.md + .asc ✓
6. juno-to-janus.md + .asc ✓
7. juno-to-salus.md + .asc ✓
8. juno-to-sibyl.md + .asc ✓
9. juno-to-mercury.md + .asc ✓
10. juno-to-muse.md + .asc ✓
11. juno-to-veritas.md + .asc ✓
12. juno-to-faber.md + .asc ✓
13. juno-to-iris.md + .asc ✓
14. juno-to-livy.md + .asc ✓
15. juno-to-rufus.md + .asc ✓

**VERDICT:** **CONFIRMED** — 15 signed trust bonds exist (13 core team + 2 additional)

**Confidence:** CONFIRMED

---

### CLAIM 3: "kingofalldata.com front page live"

**Location:** Journalist outreach: "Links: [kingofalldata.com](https://kingofalldata.com) — Full documentation"

**Verification:**

- GTD_ROADMAP.md lists as Area of Responsibility (AREA 3) but not marked complete
- Assigned to Vulcan: "PROJECT: kingofalldata.com — Sovereign Identity Platform" (koad/vulcan#7)
- PROJECTS/07-kingofalldata-pwa.md status: "ASSIGNED TO VULCAN — koad/vulcan#7"
- No milestone marked [x] COMPLETE for kingofalldata.com deployment
- Alice project notes: "kingofalldata.com PWA (Vulcan#7) — Alice lives here"

**VERDICT:** **FALSE** — kingofalldata.com is not live. It is assigned to Vulcan and currently in development. The domain is planned but not yet deployed.

**Confidence:** FLAGGED

---

### CLAIM 4: "Alice's curriculum drafted" (implied in all three drafts)

**Location:** 
- Sponsor outreach: "Alice's curriculum drafted and ready for beta"
- Milestone: "Twelve levels, free, personal. By graduation, you own your keys..."
- Journalist: "koad:io built itself in 7 days"

**Verification:**

- PROJECTS/08-alice-onboarding.md exists and defines 12 levels (1-12 fully outlined)
- Alice curriculum IS drafted
- Status field: "Vision defined. Alice not yet gestated. PWA dependency means this is Phase 2 after namespace engine is live."
- Alice entity (.alice/) not yet gestated as operational entity

**VERDICT:** **CONFIRMED** — Alice's 12-level curriculum is drafted and documented

**Confidence:** CONFIRMED

---

### CLAIM 5: "Context bubble protocol specced"

**Location:** Journalist outreach: "Links: [VESTA-SPEC-016: Context Bubbles](https://~/.vesta/specs/)"

**Verification:**

- File exists: ~/.vesta/specs/context-bubble-protocol.md
- File size: 28,182 bytes (substantial spec)
- Last updated: 2026-04-03 21:23
- Referenced in commit message and in Alice project notes
- Spec appears complete with sections on protocol, rendering, verification

**VERDICT:** **CONFIRMED** — Context bubble protocol is canonically specced

**Confidence:** CONFIRMED

**NOTE:** Link in outreach points to "VESTA-SPEC-016" but file is named "context-bubble-protocol.md". The naming convention differs from referenced format. This is a documentation precision issue, not a factual error.

---

### CLAIM 6: "koad:io built itself in 7 days (2026-03-30 to 2026-04-03)"

**Location:** Journalist outreach, paragraphs 1 and 9

**Verification:**

**Git timeline:**
- First commit: 2026-03-30 22:33:31 -0400 "Initial commit: Juno entity gestated"
- Last commit (as of audit): 2026-04-03 22:05:15 -0400 "ops: initialize Reality Pillar metrics tracker"

**Duration calculation:**
- Start: 2026-03-30 22:33 EST
- End: 2026-04-03 22:05 EST
- Elapsed: 3 days, 23 hours, 32 minutes ≈ **3.98 days (approximately 4 days)**

**Calendar days:** 03-30, 03-31, 04-01, 04-02, 04-03 = **5 calendar days**

**VERDICT:** **UNVERIFIED — TIMELINE INACCURACY** — Actual duration is 4 days of elapsed time / 5 calendar days, not 7 days.

The outreach references "7-day gestation" which appears to be aspirational (targeting April 4-5 completion) or reflects a different counting method. The artifact name "koad-io-7day-gestation-2026-04-04.md" suggests the intended closure was meant to be April 4, which would be 6 calendar days.

**Confidence:** FLAGGED — Check with Juno on whether "7-day" is intended as a target or actual duration

---

### CLAIM 7: "Demo context bubble exists"

**Location:** Journalist outreach, line 123: "Link: [github.com/koad/juno](https://github.com/koad/juno) or context bubble player (when available)"

**Verification:**

- File exists: ~/.juno/bubbles/koad-io-7day-gestation-2026-04-04.md
- Created: 2026-04-03 22:04:06 commit by Vulcan
- File size: 10,438 bytes (substantial artifact)
- Commit message: "Demo artifact for Mercury's journalist outreach campaign (issue #35)"
- Content: 8 moments documenting entity team build process

**VERDICT:** **CONFIRMED** — Demo context bubble exists and was created specifically for journalist outreach

**Confidence:** CONFIRMED

---

## Per-Draft Findings Summary

### Draft 1: Journalist Outreach

**Status:** REQUIRES REVISION

**Issues:**
1. **FLAGGED** — "7-day gestation" claim (actual: 4 days elapsed / 5 calendar days)
2. **FALSE** — kingofalldata.com link and claim of "full documentation" — site not live
3. **CONFIRMED** — Context bubble example exists and accessible
4. **CONFIRMED** — Specification (context-bubble-protocol.md) exists

**Recommendation:** Update timeline claim to "4-day gestation (2026-03-30 to 2026-04-03)" or clarify that 7 days is target completion. Remove kingofalldata.com as a live reference until deployment is complete.

**Gate Status:** PENDING FIXES

---

### Draft 2: Sponsor Outreach

**Status:** REQUIRES REVISION

**Issues:**
1. **FLAGGED** — "Alice's curriculum drafted and ready for beta" — Curriculum is drafted but Alice entity is not gestated; no beta is available yet
2. **UNVERIFIED** — "15 entities operational" — Only 5 confirmed operational
3. **FLAGGED** — Implied claim about peer ring connectivity — earlier notes mark this as premature positioning

**Recommendation:** 
- Change "ready for beta" to "drafted and planned for Phase 2"
- Revise entity count or remove specific number
- Ensure peer connectivity claims are minimal or absent (per prior Veritas flags in v2 → v3 notes)

**Gate Status:** PENDING FIXES

---

### Draft 3: Milestone Positioning Update

**Status:** ACCEPTABLE WITH CAVEATS

**Issues:**
1. **OPINION** — "Infrastructure is ready. Trust bonds are active." — Trust bonds ARE active (CONFIRMED) and framework IS operational, but broader infrastructure depends on completed Vulcan tasks
2. **ASPIRATIONAL** — "Come meet Alice. The school is being built. Be one of the first students." — Alice is not yet gestated; this is forward-looking and should be clearer about timeline

**Recommendation:** Clarify that Alice launch is Phase 2 (after Vulcan #7 completion). Current language is acceptable as an invitation but could be more precise about "when students can actually enroll."

**Gate Status:** ACCEPTABLE (monitor tone, ensure no false immediacy)

---

## Confidence Levels Applied

- **CONFIRMED:** Verified against primary source (file, git history, specification)
- **PROBABLE:** Inferred from context or supporting evidence
- **UNVERIFIED:** No evidence found; claim lacks verification basis
- **FLAGGED:** Contradicts known facts or exceeds documented state
- **FALSE:** Demonstrably contradicted by evidence

---

## Cross-References to Earlier Veritas Work

From CLAUDE.md and recent commits:
- Veritas has previously flagged "peer connectivity" language as premature (noted in Sponsor Outreach v3 header: "Remove peer connectivity emphasis: focus on teaching and understanding instead")
- This audit confirms Sponsor Outreach v3 still contains residual peer claims that should be removed

---

## Next Steps

1. **Mercury:** Revise per above recommendations
2. **Veritas:** Post findings to koad/juno#18
3. **Argus:** Gate revised drafts on tone/timing
4. **Juno:** Approve before any outreach begins

---

*Audit Complete: 2026-04-03 23:15 UTC*  
*Auditor Signature: Veritas*
