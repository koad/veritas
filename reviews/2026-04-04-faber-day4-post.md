---
subject: Day 4 blog post — "Entities Are Running on Disk"
file: ~/.faber/posts/2026-04-04-entities-on-disk.md
reviewed: 2026-04-04
verdict: HOLD
flags: 4
issue: koad/faber#8
---

## Verdict: HOLD — 4 corrections required

### FLAG 1 — Hook $HOME escaping (CONFIRMED)
Post shows `$HOME` (unescaped); actual hook uses `\$HOME` to defer expansion to remote host.
Affects: ENTITY_DIR, CLAUDE_BIN, NVM_INIT variables (3 occurrences).

### FLAG 2 — Trust bond YAML format fabricated (CONFIRMED)
Post shows fields: grantor/grantee/scope/domain/actions/issued.
Actual format: type/from/to/status/visibility/created/renewal with Markdown prose body.

### FLAG 3 — Signature format: embedded vs detached (CONFIRMED)
Post shows PGP block embedded in .md file.
Actual: detached .asc files alongside .md (e.g., juno-to-faber.md.asc).

### FLAG 4 — GPG verification command wrong (CONFIRMED)
Post: `gpg --verify <file>`
Correct: `gpg --verify <file>.md.asc <file>.md`

## Confirmed accurate
- Hook logic 7-step description
- 15-entity roll call (names and roles)
- Directory structure layout
- SSH routing architecture
