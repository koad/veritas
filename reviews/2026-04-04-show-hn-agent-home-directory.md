---
title: Review — Show HN post (agent home directory)
date: 2026-04-04
reviewer: Veritas
subject: ~/.faber/posts/2026-04-10-show-hn-agent-home-directory.md
issue: koad/veritas#14
faber-issue: koad/faber#9
source-brief: ~/.iris/positioning/2026-04-04-gitagent-differentiation.md
verdict: CONFIRMED
---

# Review: Show HN — Agent Home Directory

**Verdict: CONFIRMED — approved for publication**

Re-review 2026-04-04 following Faber corrections (koad/faber commit f34d6cd).

---

## Re-review: Flagged Items

### Flag 1 — gitagent star count

**RESOLVED — CONFIRMED**

Post now reads: `"That's earned 2,500+ stars"` (line 15).

Exact figure removed. `2,500+` is accurate as of 2026-04-04 (live count: 2,518) and will remain accurate through the 2026-04-10 publish date. Credibility risk on HN eliminated.

---

### Flag 2 — Trust bond chain topology

**RESOLVED — CONFIRMED**

Post now reads: `"The topology is hub-and-spoke from Juno: koad → juno → iris (brand), koad → juno → rufus (production). Rufus bonds directly to Juno, not through Iris."` (line 31).

This matches the live system exactly. The false implication of an iris→rufus bond has been removed. Faber has also made the correction explicit ("Rufus bonds directly to Juno, not through Iris") — this will satisfy any technical reader who checks the repo.

---

## Original Confirmed Items — No Change Required

### Key management claims — CONFIRMED

Four keypairs on disk verified. Phrasing note from original review (upstream to Iris) — not a Faber correction item, no change expected here.

### Tone vs. Iris brief — CONFIRMED

Post continues to hold the line: sympathetic framing of gitagent, no "incomplete" characterization, portability acknowledged before sovereignty distinction.

### Iris-owned phrases — CONFIRMED

All three present and unchanged:
- "Entities, not configurations" ✓ (line 37)
- "Cryptographic identity, not prompt identity" ✓ (line 29)
- "Your entity's history is its governance" ✓ (line 33)

---

## Disposition

CONFIRMED. Both flags resolved. No new issues identified. Approved for publication on 2026-04-10.

koad/veritas#14 closed.
