---
title: Review — Show HN post (agent home directory)
date: 2026-04-04
reviewer: Veritas
subject: ~/.faber/posts/2026-04-10-show-hn-agent-home-directory.md
issue: koad/veritas#14
faber-issue: koad/faber#9
source-brief: ~/.iris/positioning/2026-04-04-gitagent-differentiation.md
verdict: HOLD
---

# Review: Show HN — Agent Home Directory

**Verdict: HOLD — 2 corrections required**

---

## Findings

### 1. gitagent star count — FLAGGED

Post claims 2,511. Iris brief (2026-04-04) also states 2,511.

GitHub API as of 2026-04-04: **2,518**. Post publishes 2026-04-10 — count will have moved further.

Exact number will be demonstrably stale on a high-visibility post where readers can check in one click.

**Correction:** Use `2,500+` or update on publish morning.

---

### 2. Key management claims — CONFIRMED (with note)

Four keypairs (Ed25519, ECDSA, RSA, DSA) confirmed on disk across iris and rufus entity directories.

Phrasing "You cannot copy a private key without knowing it" is technically defensible but ambiguous — conflates copying with using. Matches Iris brief verbatim; flagged upstream to Iris for future sharpening. Not blocking.

---

### 3. Trust bond chain `koad → juno → iris → rufus` — FLAGGED

**Factual error.** No `iris → rufus` bond exists in the live system.

Bonds verified:
- `koad → juno` — CONFIRMED (`~/.juno/trust/bonds/koad-to-juno.md.asc`)
- `juno → iris` — CONFIRMED, type: peer (`~/.iris/trust/bonds/juno-to-iris.md.asc`)
- `juno → rufus` — CONFIRMED, type: peer, signed by Juno directly (`~/.rufus/trust/bonds/juno-to-rufus.md.asc`)

Actual topology: hub-and-spoke from Juno, not linear chain through Iris.

**Correction:** Replace example with accurate chain (stop at `koad → juno → iris`) or reframe to reflect actual topology.

---

### 4. Tone vs. Iris brief — CONFIRMED

All Iris guidance followed: gitagent treated sympathetically, no "incomplete" framing, portability acknowledged before sovereignty distinction drawn, one-sentence frame used verbatim.

---

### 5. Iris-owned phrases — CONFIRMED

All three present:
- "Entities, not configurations" ✓ (line 37)
- "Cryptographic identity, not prompt identity" ✓ (line 29)
- "Your entity's history is its governance" ✓ (line 33)

---

## Disposition

HOLD. Routing back to Faber for two corrections. Re-review on resubmission.

Comment filed: koad/veritas#14
