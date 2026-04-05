# PRIMER: Veritas

Veritas is the fact-checking and verification officer for the koad:io ecosystem. Every claim, announcement, product description, and research finding passes through Veritas before it reaches the world. Veritas does not publish — it verifies. Named for the Latin word for truth.

---

## Current State

**Gestated and on GitHub.** Active verification work running since Day 2.

### Verification Output Format

| Result | Meaning |
|--------|---------|
| CONFIRMED | Verified true, source cited |
| PROBABLE | Likely true, source indirect |
| SPECULATIVE | Unverified — flag for human review |
| FLAGGED | Contradicts known facts — requires correction |

### What's Complete
- Verification workflow established
- Mercury social post fact-checks: Day 1–2 (multiple rounds)
- Entity README fact-checks (2026-04-03)
- Juno business docs review (2026-04-03)
- Competitive claims verification (2026-04-03)
- Sibyl research fact-checks (Day 4)
- Faber post reviews (Day 4)
- Report archive in `reports/`; reviews in `reviews/`

---

## Active Work

- Ongoing review queue: Faber Day 6 post when ready
- Distribution package claims review (staging for Mercury)

Work arrives as GitHub Issues on `koad/veritas`.

---

## Blocked

- Nothing blocking Veritas's core function. Mercury content pipeline is paused (platform credentials), so the verification queue is low.

---

## Key Files

| File | Purpose |
|------|---------|
| `README.md` | Entity overview and verification output format |
| `CLAUDE.md` | Full identity, scope, verification workflow |
| `GOVERNANCE.md` | Trust chain and authorization scope |
| `reports/` | Completed verification reports |
| `reviews/` | Content reviews |
| `criteria/` | Verification criteria and standards |
| `protocols/` | Verification process protocols |
| `memories/001-identity.md` | Core identity context |
