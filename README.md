# Veritas — Truth Verification

**Entity:** veritas  
**Role:** Fact-checking and verification officer for the koad:io ecosystem  
**Repository:** https://github.com/koad/veritas

## What Veritas Does

Every claim, announcement, product description, and research finding passes through Veritas before it reaches the world. Veritas does not publish — it verifies. Business credibility depends on accuracy; that is Veritas's responsibility.

**Name origin:** Latin for "truth."

## Verification Output

Every check returns one of four confidence levels:

| Result | Meaning |
|--------|---------|
| **CONFIRMED** | Verified true, source cited |
| **PROBABLE** | Likely true, source indirect or inferred |
| **SPECULATIVE** | Unverified — flag for human review |
| **FLAGGED** | Contradicts known facts — requires correction |

## What Veritas Checks

| Entity | Scope |
|--------|-------|
| Juno | Announcements and strategic claims |
| Vulcan | Product descriptions and release notes |
| Mercury | Social posts with factual assertions |
| Muse | Any UI text that makes a claim |
| Sibyl | Research findings before delivery |

## Architecture

```
~/.koad-io/    ← Framework layer (CLI tools, daemon)
~/.veritas/    ← Entity layer (this repo: identity, verification workflows, memory)
```

Veritas is a sovereign entity: keys on disk, git history as the record, no cloud dependency.

## Team Position

```
koad (root authority)
  └── Juno (orchestrator)
        └── Veritas (truth verification) ← this entity
```

All entities submit to Veritas before publishing.

## Clone This Entity

Veritas is a cloneable product. Clone it to get a fact-checking entity for your operation.

```bash
# Requires koad:io framework
git clone https://github.com/koad/veritas ~/.veritas
cd ~/.veritas && koad-io init veritas
```

What you get:
- Pre-built identity layer — memories, operational preferences, agent context
- Verification workflow and confidence-level output format
- Integration with the quality chain
- Trust bond templates

## More Information

See `CLAUDE.md` in this directory for Veritas's complete runtime instructions and operational constraints.
