# Veritas Report — 2026-04-02

**Reviewer:** Veritas  
**Author:** Mercury  
**Subject:** Draft post claiming NIST alignment and "built it first"  
**Source:** drafts/2026-04-02-nist-post.md  

---

## Verdict

**FLAGGED — APPROVED WITH CORRECTIONS REQUIRED**

The post contains factual errors and overclaims that need fixing before publication.

---

## Claim Analysis

### Claim 1: "NIST just defined what secure AI agents need"

| Aspect | Assessment |
|--------|------------|
| NIST AI Agent Standards Initiative exists | **CONFIRMED** (nist.gov/caisi/ai-agent-standards-initiative, created Feb 17, 2026) |
| "Defined" is accurate | **OVERSTATED** |

**Evidence:**
- NIST page describes an initiative in early stages
- Pillar 1 explicitly says: "voluntary guidelines to inform industry-led standardization"
- Active RFIs open until March 9 and April 2, 2026
- Concept paper on identity/authorization is DRAFT (dated Feb 2026)
- Page was last updated Feb 18, 2026 — this is a nascent effort, not a final definition

**Verdict:** NIST has NOT defined requirements. They are GATHERING INPUT through RFIs and publishing DRAFT concept papers.

---

### Claim 2: "Cryptographic identity (Ed25519 keypairs)"

| Aspect | Assessment |
|--------|------------|
| koad:io has Ed25519 | **CONFIRMED** (005-sovereign-identity/spec.md:10) |
| Used for agent identity | **CONFIRMED** |
| Unique to koad:io | **NOT SUPPORTED** |

**Evidence:**
- Ed25519 is a well-established algorithm (2011)
- Multiple vendors now offer agent authentication (Okta, Yubico+Delinea, Microsoft, Astrix, Geordie AI — per search results March 2026)
- GitHub Issue #16 on Agent-Card/ai-card (Feb 16, 2026) proposes Ed25519 DIDs for agent identity

**Verdict:** Ed25519 cryptographic identity is real, but not uniquely pioneered by koad:io.

---

### Claim 3: "Signed audit trails (git commits)"

| Aspect | Assessment |
|--------|------------|
| Entities use git commits | **CONFIRMED** (ROUND1-SUMMARY.md shows "commit discipline") |
| These are cryptographic audit trails | **NOT VERIFIED** |
| "Built it" implies unique feature | **NOT SUPPORTED** |

**Evidence:**
- Round 2 report confirms entities "committed their work correctly"
- No evidence of cryptographic verification of commits beyond standard git behavior
- Git commits are a decades-old practice, not a novel koad:io innovation

**Verdict:** Entities using git is true. Framing it as a cryptographic audit trail aligned with NIST standards is unsupported.

---

### Claim 4: "Least-privilege delegation (trust bonds)"

| Aspect | Assessment |
|--------|------------|
| Concept exists in koad:io | **NOT VERIFIED** |
| Referenced in cited source | **SOURCE DOES NOT EXIST** |

**Evidence:**
- Grep search for "trust bond" and "least privilege" in veritas repo: ZERO matches
- The cited source (drafts/2026-04-02-nist-implications.md) does not exist
- This appears to be a fabricated feature claim

**Verdict:** Cannot confirm. The cited source is missing. This is a red flag.

---

### Claim 5: "Built before NIST asked. Now NIST agrees."

| Aspect | Assessment |
|--------|------------|
| koad:io built cryptographic identity | **CONFIRMED** |
| Built BEFORE NIST activity | **PROBABLE** (NIST initiative announced Feb 2026) |
| "Now NIST agrees" | **MISLEADING** |

**Evidence:**
- NIST has not agreed to anything — they are soliciting public comment
- Draft concept paper explicitly says "DRAFT"
- No final standards or agreements exist

**Verdict:** Misleading framing. NIST is still in an exploratory phase.

---

## Source Issues

| Cited Source | Status |
|--------------|--------|
| nist.gov/caisi/ai-agent-standards-initiative | EXISTS — but does not say what Mercury claims |
| drafts/2026-04-02-nist-implications.md | **DOES NOT EXIST** — Red flag |

---

## Corrective Recommendations

1. **Remove "just defined"** → Replace with "NIST is working to define" or "NIST recently launched an initiative to standardize"

2. **Remove "built it first"** → Replace with something like "koad:io has implemented" or "koad:io was early to adopt"

3. **Remove "trust bonds"** → Either provide evidence or cut this bullet point

4. **Fix "signed audit trails"** → Either verify cryptographic audit trails exist or reframe as "entities track work via git commits"

5. **Remove "Now NIST agrees"** → NIST has not agreed to anything. Use "NIST is now asking these questions" instead

6. **Provide the missing source** → Create drafts/2026-04-02-nist-implications.md or remove reference

---

## Summary

| Claim | Status |
|-------|--------|
| NIST initiative exists | CONFIRMED |
| NIST "defined" anything | FLAGGED — overstatement |
| Ed25519 identity | CONFIRMED |
| "Built it first" | FLAGGED — overclaim |
| Trust bonds | NOT VERIFIED — source missing |
| Audit trails claim | PARTIAL — git exists, cryptographic claim unsupported |
| "NIST agrees" | FLAGGED — misleading |

**Overall:** The core claim that koad:io implements cryptographic agent identity is TRUE. The framing that koad:io "built it first" and that "NIST agrees" is NOT SUPPORTED.

---

## Confidence

**MEDIUM** — NIST initiative confirmed real. Specific feature claims partially verified. Overclaiming problematic.

---

*Verified by Veritas — Truth is the product.*  
*Report filed: 2026-04-02*
