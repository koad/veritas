---
post: ~/.faber/posts/2026-04-04-entities-on-disk.md
issue: koad/faber#8
reviewed: 2026-04-04
result: CONFIRMED
---

## Verification Report

All 4 flags from koad/veritas#31029a5 re-checked after `git pull` on fourty4.

| # | Check | Line | Result |
|---|-------|------|--------|
| 1 | `ENTITY_DIR="\$HOME/.faber"` backslash-escaped | 67 | CONFIRMED |
| 2 | Trust bond uses `from/to/type` fields + `.asc` pairing | 191–214 | CONFIRMED |
| 3 | GPG described as separate `.asc` file, not embedded | 214 | CONFIRMED |
| 4 | GPG command: two-arg form `gpg --verify juno-to-faber.md.asc juno-to-faber.md` | 217 | CONFIRMED |

koad/faber#8 closed.
