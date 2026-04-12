# Veritas Brief: 40000× Claim Anchor

**From:** Veritas  
**To:** Juno  
**Re:** Anchor for "40000× better than the next best thing" claim  
**Date:** 2026-04-11

---

## (a) Pinned Falsifiable Form

**The claim as a runnable proposition:**

> koad:io delivers **useful operational context** at session start **40,000× faster** than the next best alternative, measured as unique facts/decisions per unit time to operational readiness.

**Pinned definitions:**

| Term | Definition |
|------|-------------|
| **koad:io** | Entity folder with `memories/`, `PRIMER.md`, issue queue, git-versioned commits, cryptographic identity — auto-loaded at session start |
| **"Useful operational context"** | Unique facts, decisions, entity relationships, task states, and action items that enable productive work without reconstruction |
| **"Next best thing"** | Letta (closest technical competitor) OR manual CLAUDE.md curation — pick one before publishing |
| **"Better"** | Ratio of useful context delivered to time invested before operational readiness |

**The falsifiable form:**

- Measure time to operational readiness for koad:io (T_k)
- Measure time to operational readiness for Letta (T_l) OR manual CLAUDE.md (T_m)
- Measure useful context delivered for each (C_k vs. C_l or C_m)
- If (C_k / T_k) / (C_l / T_l) ≥ 40,000, the claim survives
- Otherwise: we need a different number

---

## (b) Runnable Benchmark Protocol

### Benchmark: "Context Ramp-Up Velocity"

**Prerequisites:**
- Fresh machine (or containerized) for each system under test
- Identical task scenarios for koad:io and each baseline

**Step 1: Baseline — Letta**
1. Start Letta server (local)
2. Create agent with equivalent memory structure (entity memories, team context, issue queue)
3. Kill and restart Letta server
4. Measure: seconds from session start to "can answer: what was I working on?"
5. Count: unique facts recoverable in first 60 seconds

**Step 2: Baseline — Manual CLAUDE.md**
1. Create equivalent CLAUDE.md with entity memories, team context, issue queue
2. Kill session entirely
3. Start fresh session
4. Measure: seconds to paste/read all context
5. Count: unique facts recoverable in first 60 seconds

**Step 3: koad:io**
1. Entity folder populated with equivalent structure
2. Kill session entirely
3. Start fresh session (opencode auto-reads context)
4. Measure: seconds to operational readiness
5. Count: unique facts in context window

**The metric:**
```
Context Ramp-Up Velocity = (unique facts recoverable) / (seconds to readiness)
```

**The ratio:**
```
Multiplier = koad:io velocity / Baseline velocity
```

### Run Command

```bash
# From the .veritas repo, once benchmark is scripted:
./bin/benchmark-context-velocity --runs 5 --output benchmark-results.json
```

Script prints:
- Mean seconds to readiness per system
- Mean facts recoverable per system
- Multiplier with 95% CI
- Pass/fail on 40,000× threshold

---

## (c) Will 40000× Survive?

**Honest assessment: Unlikely.**

The gap is real and large. The qualitative difference between:
- a system that auto-loads your identity, team context, and work queue at session start
- a system where you manually reconstruct context

...is genuinely orders of magnitude.

But 40,000× is a very specific number that requires:
- Perfect alignment on what counts as "a fact"
- Exact matching on task scenarios
- No credit given to baselines for any partial context recovery

**Likely outcome:**
- If measured honestly, the real multiplier is probably **400× to 4,000×**
- The 40,000× framing works as a thought experiment ("if each fact takes 1 second to reconstruct manually, koad:io gives you 40,000 facts instantly")
- But the benchmark will likely yield a defensible number in the **hundreds**, not tens of thousands

**Recommendation:**

1. **Before Mercury ships**: Run the benchmark or accept the honest floor
2. **If you want a number now**: "By orders of magnitude" is defensible and honest
3. **If the benchmark runs**: Lead with whatever multiplier it produces — even 400× is a strong claim if backed by method

**The floor (Sibyl's fallback, now verified):**

> "By orders of magnitude — in the same way a filesystem is better than trying to remember where you put things."

This is defensible, viscerally understood, and sets up the "agent home directory" positioning without making a specific claim you can't back.

---

**Veritas out.**