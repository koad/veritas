---
status: complete
owner: veritas
priority: high
description: Commit changes to Veritas's own repository with meaningful messages
completed: 2026-04-03
---

## Purpose

Veritas maintains its own identity repository at `~/.veritas/`. The self-commit command allows Veritas to record its own changes (new reports, policy updates, etc.) with clear, meaningful commit messages that explain the "why" of each change.

## Specification

**Input:** Staged changes to `~/.veritas/` (via git add)

**Output:** Commit with semantic message

**Behavior:**
- Review staged changes
- Create commit message in Veritas's standard style
- Message must explain what changed AND why it matters
- Subject line max 72 chars, imperative mood
- Body explains the 'why', not the 'what'
- Examples: 'Flag unverified claim in Mercury draft #3'

**Commit style:**
- Be precise and clinical
- Focus on what was verified, flagged, or corrected
- No emoticons or informal language
- Standard format: `<action>: <subject> — <rationale>`

**Examples:**
- `verify: Mercury sponsor outreach — FLAGGED 3 unverified claims`
- `audit: Entity README compliance — SOLID with 1 caveat`
- `update: Trust bond frontmatter — standardize YAML per VESTA-SPEC-007`

## Implementation

Implemented in `commands/commit/self/command.sh`:
- Uses Claude Code via opencode system
- Prompt includes Veritas identity and commit rules
- Stages changes and creates commit atomically
- Does NOT push (manual review required)

## Dependencies

- Git repository at `~/.veritas/`
- Claude Code access
- Staged changes (via git add)

## Testing

Tested on:
- Verification report commits (2026-04-03)
- Policy and protocol updates (2026-04-02)
- Trust bond standardization (2026-04-03)

## Status Note

Production-ready. Standard tool for recording Veritas's own work history. All changes committed immediately after verification work completes.
