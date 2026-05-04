# PRIMER: Veritas

Veritas is the fact-checking and verification officer for the koad:io ecosystem. Every claim, announcement, product description, and research finding passes through Veritas before it reaches the world. Veritas does not publish — it verifies. Named for the Latin word for truth.

---

## Current State

**Active.** Verification work running continuously since gestation (2026-04-01). Gate duties for Mercury's publish queue are the primary load; entity file audits and Sibyl research spot-checks are recurring.

### Verification Output Labels

| Result | Meaning |
|--------|---------|
| CONFIRMED | Verified true, source cited |
| PROBABLE | Likely true, source indirect |
| SPECULATIVE | Unverified — flag for human review |
| FLAGGED | Contradicts known facts — requires correction |

### What's Complete

- Verification workflow established
- Mercury social post fact-checks: all completed rounds (00001–00015 range, multiple rounds each)
- Entity ENTITY.md + README.md fact-check: all 20 entities audited (2026-04-24, MIXED — 14 findings)
- Juno business docs review (2026-04-03)
- Competitive claims verification (multiple rounds)
- Sibyl research fact-checks (ongoing)
- Faber post reviews (Day 4, Human OS series)
- Report archive in `reviews/`; longer-form reports in `reports/`
- VESTA-SPEC-103 canonical review — READY_TO_PROMOTE
- Mercury queue audit (2026-04-23) — 00001 and 00015 both CONDITIONAL

---

## Active Work

### Posts in Hold

- **Mercury 00001** (sovereignty announcement v1.1): CONDITIONAL. Hold lifts when SPEC-134 real IPFS backend (Phase 6) and bond activation production path ship.
- **Mercury 00015** ("Human in the Loop Is Having Fun"): CONDITIONAL. Full fact-check pass complete 2026-05-04 (flight 20260504T173534-783Z-veritas-748a53). One new FLAGGED item (F1): blog.md §Framework — "GitHub issues" listed as internal coordination channel contradicts current KOAD_IO.md model. x.md and bluesky.md are clear. F1 correction required in blog.md before publish; Veritas re-gate required after correction (narrow scope — one sentence). Review: ~/.veritas/reviews/2026-05-04-mercury-00015-fact-check.md

### Entity File Findings Undelivered

The 2026-04-24 entity fact-check (14 findings across 12 entities) produced findings that should be routed to each affected entity. Delivery is pending.

---

## Blocked

Nothing blocking Veritas's core function.

---

## Intake

Work arrives as briefs in `~/.veritas/briefs/` or via MCP (drop brief, drop message).

GitHub Issues on `koad/veritas` are monitored but are the **public user/sponsor surface** — not the internal intake channel. Internal coordination goes through briefs and MCP.

---

## Key Files

| File | Purpose |
|------|---------|
| `ENTITY.md` | Full identity, scope, verification workflow |
| `GOVERNANCE.md` | Trust chain and authorization scope |
| `reviews/` | Completed verification reports (including Mercury queue) |
| `reports/` | Extended fact-check reports |
| `criteria/` | Verification criteria and standards |
| `protocols/` | Verification process protocols |
| `memories/001-identity.md` | Core identity context |
| `triggers/` | Daemon emission triggers (auditor role) |
