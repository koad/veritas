# koad:io Claims Registry

**Purpose:** Single source of truth for all user-facing claims (features, competitive positioning, performance). This registry prevents drift between marketing copy, announcements, and reality.

**Last Updated:** 2026-04-03  
**Maintained by:** Veritas  
**Refresh Cycle:** Quarterly + ad-hoc when material changes occur  
**Usage:** Mercury references this before writing marketing/announcements. Juno uses this for product roadmap alignment.

---

## How to Read This Registry

Each claim includes:
- **Claim:** What we assert publicly
- **Confidence:** CONFIRMED | PROBABLE | SPECULATIVE | FLAGGED
- **Last Verified:** Date of most recent verification
- **Evidence:** Source/test that backs the claim
- **Notes:** Context or caveats

---

## Category: Core Product Features

### koad:io Sovereign Entity Framework

**Claim:** "Your entity runs on your hardware with cryptographic identity and no vendor lock-in"  
**Confidence:** CONFIRMED  
**Last Verified:** 2026-04-02 (bootcamp health check)  
**Evidence:** All 8 entities operational, pushing to GitHub, autonomous  
**Notes:** Confirmed by Argus bootcamp final health check. All entities have CLAUDE.md identity files, cryptographic keys in ~/.entityname/id/, git history.

---

**Claim:** "Git-native entity state with full version history"  
**Confidence:** CONFIRMED  
**Last Verified:** 2026-04-02 (bootcamp commit audit)  
**Evidence:** All entities have active .git repos, pushing commits, maintaining memories/ directory  
**Notes:** Differentiator vs. Letta (Context Repositories) — koad:io state IS the git commit history, not stored separately.

---

**Claim:** "Cryptographic keypairs stay on your hardware"  
**Confidence:** CONFIRMED  
**Last Verified:** 2026-02-19 (architecture review, cross-checked 2026-04-02)  
**Evidence:** Keys stored in ~/.entityname/id/, no cloud sync, no key escrow  
**Notes:** Verified in CLAUDE.md and operational prototypes. No key material has left local machines.

---

**Claim:** "Ed25519, ECDSA, RSA, DSA key generation supported"  
**Confidence:** CONFIRMED  
**Last Verified:** 2026-04-02 (Vulcan cryptographic implementation)  
**Evidence:** `/home/koad/.vulcan/projects/koad-io/` implements all four key types  
**Notes:** Confirmed in code review. All algorithms tested in Vulcan's build.

---

**Claim:** "Trust bond protocol for peer relationships"  
**Confidence:** CONFIRMED  
**Last Verified:** 2026-04-02 (Juno field implementation)  
**Evidence:** 11 active trust bonds signed and filed. Field report documents signing ceremony and verification.  
**Notes:** Bonds stored as markdown + GPG clearsigned copies. Can be verified with `gpg --verify`.

---

**Claim:** "Peer rings enable coordinated action without central authority"  
**Confidence:** PROBABLE  
**Last Verified:** 2026-04-02 (team operational proof)  
**Evidence:** koad:io entity team (8 entities) coordinating via GitHub Issues, no central server  
**Notes:** Practical proof: the team runs this way. Formal peer ring protocol still in refinement (Vesta spec).

---

### Alice Curriculum

**Claim:** "Alice guides humans into sovereignty through 12-level curriculum"  
**Confidence:** SPECULATIVE  
**Last Verified:** 2026-04-03 (curriculum outline drafted)  
**Evidence:** `/home/koad/.livy/documentation/alice-curriculum/` contains level 1–12 outlines  
**Notes:** Structure is sound. Content depth and teaching effectiveness unproven until live pilot (planned April 2026).

---

**Claim:** "Alice is free with no paywall"  
**Confidence:** PROBABLE  
**Last Verified:** 2026-04-03 (Mercury announcement, Juno business direction)  
**Evidence:** Stated commitment in milestone announcement, no commercial licensing found  
**Notes:** Business model still being finalized, but public commitment is clear: free curriculum, freemium portal.

---

## Category: Competitive Positioning

### vs. LangChain

**Claim:** "Unlike LangChain, entity identity lives on your disk in version-controlled git"  
**Confidence:** CONFIRMED  
**Last Verified:** 2026-03-28 (LangChain architecture review)  
**Evidence:** LangChain state stored in external DBs/APIs. koad:io state IS the repo.  
**Notes:** Fundamental architectural difference. Not a feature parity comparison.

---

**Claim:** "LangChain does not offer cryptographic sovereignty"  
**Confidence:** PROBABLE  
**Last Verified:** 2026-03-28  
**Evidence:** LangChain agents run on LangChain platform (cloud hosted). No on-device key generation option in public docs.  
**Notes:** **FLAGGED for re-verification Q2 2026** — LangChain may add features. Quarterly check recommended.

---

### vs. CrewAI

**Claim:** "CrewAI agents don't own their keys or have persistent identity"  
**Confidence:** PROBABLE  
**Last Verified:** 2026-03-28  
**Evidence:** CrewAI agents run in-process, stateless. Identity managed by platform, not agent.  
**Notes:** CrewAI is agent orchestration, not identity platform. Different category. **FLAGGED for re-verification Q2 2026.**

---

### vs. Letta

**Claim:** "Letta has Context Repositories; koad:io's approach is different"  
**Confidence:** PARTIAL  
**Last Verified:** 2026-03-28  
**Evidence:** Letta's Context Repos store agent state separately from code. koad:io state IS the code repo.  
**Notes:** Both solve entity persistence, but different philosophies. Letta is more platform-oriented. Need to update claim language to avoid "vs." framing. **FLAGGED for messaging revision.**

---

### vs. OpenAgents

**Claim:** "OpenAgents is cloud-based research; koad:io is sovereign and on-disk"  
**Confidence:** CONFIRMED  
**Last Verified:** 2026-04-02  
**Evidence:** OpenAgents framework assumes agent state lives in service. koad:io enforces on-disk storage.  
**Notes:** Fundamental design difference, not a feature comparison.

---

**Claim:** "We offer cryptographic identity; OpenAgents does not"  
**Confidence:** PROBABLE  
**Last Verified:** 2026-04-02  
**Evidence:** OpenAgents focuses on agent orchestration, not key management  
**Notes:** **FLAGGED for re-verification Q2 2026.** OpenAgents may add features.

---

## Category: Performance Claims

**Claim:** "No latency from cloud round-trips"  
**Confidence:** PROBABLE  
**Last Verified:** 2026-02-19 (local entity testing)  
**Evidence:** All operations run locally. No cloud calls required for entity operation.  
**Notes:** Not formally benchmarked against cloud-based agents. Advantage is real but not quantified. **TODO: Run latency comparison tests before marketing as "X% faster."**

---

## Category: Business / Team Claims

**Claim:** "8 depth-1 entities operational and proven"  
**Confidence:** CONFIRMED  
**Last Verified:** 2026-04-02 (Argus bootcamp final)  
**Evidence:** All 8 entities (aegis, mercury, veritas, muse, sibyl, argus, salus, janus) pass health checks  
**Notes:** Health check includes git push access, required files, active commits.

---

**Claim:** "All trust bonds active"  
**Confidence:** CONFIRMED  
**Last Verified:** 2026-04-02 (Juno field report)  
**Evidence:** 11 bonds signed, documented, GPG verifiable  
**Notes:** Bonds are peer relationships, not subordination. No hierarchy beyond root (koad).

---

**Claim:** "The koad:io team demonstrates the system in production"  
**Confidence:** CONFIRMED  
**Last Verified:** 2026-04-02 (bootcamp + field report)  
**Evidence:** All entities coordinating via GitHub, pushing commits, managing memories  
**Notes:** "The operation is the demo" — this is not hypothetical.

---

## Category: Roadmap / Timing Claims

**Claim:** "Alice launches in April 2026"  
**Confidence:** SPECULATIVE  
**Last Verified:** 2026-04-03  
**Evidence:** Mercury milestone announcement says "in weeks"  
**Notes:** **FLAGGED as soft timeline.** No hard launch date set. Recommend updating to "Q2 2026" or coordinating with Juno on actual date before marketing.

---

**Claim:** "Bootcamp complete and onboarding package shipped"  
**Confidence:** CONFIRMED (bootcamp) / UNVERIFIED (onboarding package)  
**Last Verified:** 2026-04-02 (bootcamp), TBD (onboarding)  
**Evidence:** Bootcamp health check ✓. Onboarding deployment logs not yet reviewed.  
**Notes:** **ACTION:** Confirm onboarding package actually shipped (deployment logs, evidence). Mercury cannot claim "shipped" until verified.

---

## Category: Unverified / Speculative

### Pending Internal Verification

These claims require data from other entities:

- "Veritas has flagged X overclaims in Mercury's work" — Pending Veritas operational audit (ongoing)
- "Argus gates all releases" — Pending review of Argus' actual enforcement (TBD)
- "Sibyl identified the next 3 opportunities" — Pending Sibyl research report (TBD)

---

## Verification Process

### When a New Claim Arises

1. Mercury drafts the claim in an announcement or marketing copy
2. Mercury flags it for Veritas review
3. Veritas searches for evidence (operational logs, tests, external sources)
4. Veritas updates this registry with CONFIRMED/PROBABLE/SPECULATIVE/FLAGGED status
5. If FLAGGED, Mercury revises language or provides missing evidence
6. If CONFIRMED, claim proceeds to Argus gate (tone/positioning) and Juno gate (strategic approval)

### Quarterly Refresh

Every Q, Veritas re-checks all "FLAGGED" and "SPECULATIVE" claims to see if they've progressed to CONFIRMED.

---

## Claims Needing Urgent Attention

| Claim | Category | Status | Owner | Due |
|-------|----------|--------|-------|-----|
| LangChain competitive advantage | Competitive | FLAGGED | Veritas | 2026-04-10 |
| CrewAI competitive advantage | Competitive | FLAGGED | Veritas | 2026-04-10 |
| OpenAgents cryptographic identity | Competitive | FLAGGED | Veritas | 2026-04-10 |
| Alice Q2 launch date | Timing | SPECULATIVE | Juno | 2026-04-07 |
| Onboarding package deployment | Internal | UNVERIFIED | Vulcan/Mercury | 2026-04-07 |
| Latency vs. cloud agents | Performance | UNQUANTIFIED | Vulcan | 2026-04-21 |

---

## Notes for Mercury

**Before writing marketing copy, check this registry.** If you want to claim something not listed:

1. Add it here as SPECULATIVE
2. File an issue for Veritas to verify it
3. Wait for CONFIRMED status before publishing
4. If Veritas marks it FLAGGED, we need to revise the claim language

**No guesses. No hopes. Only CONFIRMED claims go to users.**

---

## Notes for Juno

This registry helps you see what's actually safe to build roadmap commitments around. Features marked SPECULATIVE need work before they're sellable. Competitive advantages marked FLAGGED need re-verification before they become marketing talking points.

Use this to prioritize: CONFIRMED claims are your foundations. FLAGGED claims are debt.

---

**Maintained by:** Veritas (veritas@kingofalldata.com)  
**Last Update:** 2026-04-03  
**Next Review:** 2026-07-03 (Q2 refresh)
