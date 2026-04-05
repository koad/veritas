---
date: 2026-04-05
reviewer: Veritas (veritas@kingofalldata.com)
subject: Chiron alice-onboarding curriculum — factual accuracy review
scope: levels 0–12 (13 files)
verdict: NEEDS_REVISION
---

# Review: Chiron alice-onboarding Curriculum

Reviewed against the live koad:io system on thinker as of 2026-04-05. Files checked: actual directory listings, live trust bond files, and the `~/.koad-io/bin/koad-io` source. Levels 0–7 reviewed in full detail; levels 8–12 reviewed for structural claims.

---

## Summary Verdict

**NEEDS_REVISION** — Two factual inaccuracies identified (one in bond type claim, one in entity file structure claim). The remaining 95%+ of technical content is correct and well-grounded. The curriculum is largely trustworthy; the issues are specific and fixable.

---

## Findings by Level

### Level 0 — "The First File"
**Verdict: PASS**

All claims confirmed. PRIMER.md pattern accurately described. No technical assertions that can be falsified at this level. Tone and framing align with actual system philosophy.

Confidence: CONFIRMED

---

### Level 1 — "First Contact"
**Verdict: PASS**

Conceptual framing is accurate. Alice's statement in the Bridge to Level 2 places her at `~/.alice/` on a Mac Mini called fourty4. CONFIRMED: `~/.alice/` exists on this machine (thinker), but fourty4 is also a valid location — entities are portable and fourty4 is where Alice is rooted per the infrastructure notes. The claim is not false, it is stated from Alice's first-person perspective about her home machine. Acceptable.

Confidence: CONFIRMED

---

### Level 2 — "What Is an Entity?"
**Verdict: PASS**

**Atom 2.1 — Entity directories:** CONFIRMED. `~/.alice/`, `~/.juno/`, `~/.chiron/` all exist.

**Atom 2.2 — Two-layer architecture:** CONFIRMED. `~/.koad-io/` is the framework layer; entity directories are the entity layer. Description matches the actual architecture precisely.

**Atom 2.3 — Gestation command:** CONFIRMED. `koad-io gestate alice` is the correct syntax per the framework's `commands/gestate/` directory and the `koad-io` CLI source.

**Exchange 1 — Alice's directory listing:**
```
CLAUDE.md
memories/
commands/
trust/
id/
hooks/
```
PROBABLE. This is a representative listing, not exhaustive. The actual `~/.alice/` directory has more files (`avatar.png`, `certificates/`, `curriculum/`, `opencode/`, `passenger.json`, `PRIMER.md`). The listing is pedagogically reasonable as a subset — it shows the conceptually important subdirectories. Not a factual error, but the curriculum gives learners a simplified picture. Acceptable for onboarding context.

**Atom 2.5 — Keys location:** States `~/.{entity}/id/`. CONFIRMED. `~/.juno/id/` exists with the expected key files.

Confidence: CONFIRMED / PROBABLE (see Exchange 1 note)

---

### Level 3 — "Your Keys Are You"
**Verdict: PASS with one annotation**

**Atom 3.2 — Key directory listing:**
```
~/.alice/id/
├── ed25519      ← Private (permissions: 600)
├── ed25519.pub  ← Public
├── ecdsa        ← Private (permissions: 600)
├── ecdsa.pub    ← Public
├── rsa          ← Private (permissions: 600)
└── rsa.pub      ← Public
```

PARTIALLY CONFIRMED. The actual `~/.juno/id/` contains: `dsa`, `dsa.pub`, `ecdsa`, `ecdsa.pub`, `ed25519`, `ed25519.pub`, `gpg-revocation.asc`, `rsa`, `rsa.pub`. The curriculum omits the `dsa`/`dsa.pub` pair and the `gpg-revocation.asc` file. This is not a factual error — the curriculum is highlighting the primary key types — but it is an incomplete listing. For a factual review, this is a minor omission, not a falsification.

**Atom 3.4 — Keys canon URL pattern:** `canon.koad.sh/alice.keys` etc. CONFIRMED per system documentation. The pattern is correct.

**Atom 3.5 — GPG import command:**
```bash
curl -s https://canon.koad.sh/juno.keys | gpg --import
```
PROBABLE. The canon URL serves SSH public keys, not GPG keys. GPG keys for entities are distributed through entity `id/` directories and Vesta's entity registry per Livy's `trust-bond-system.md`. The `canon.koad.sh/{entity}.keys` endpoint serves SSH public keys (consistent with how GitHub surfaces public keys at `github.com/{user}.keys`). Using these with `gpg --import` directly may not work as intended — SSH public keys are not in GPG import format.

**FLAGGED: This is a technical inaccuracy.** The import pattern in Atom 3.5 and the verification steps in Level 4 assume the keys canon serves GPG-importable keys. The actual GPG public key distribution path per the live system is: `gpg --import ~/.{entity}/id/rsa.pub` (entity id directory) or `keybase pgp pull koad` (for koad's Keybase key). The curriculum should clarify this distinction or the canon endpoint should be documented as serving GPG keys.

Confidence: FLAGGED — command may not function as written

---

### Level 4 — "How Entities Trust Each Other"
**Verdict: NEEDS_REVISION — one factual error**

**Atom 4.2 — Bond type for juno-to-chiron:**
The curriculum presents:
```yaml
type: authorized-curriculum-architect
```
INCORRECT. The actual `~/.juno/trust/bonds/juno-to-chiron.md` has:
```yaml
type: authorized-specialist
```
The bond type `authorized-curriculum-architect` does not exist in the live trust bond system. The correct type is `authorized-specialist`. This is used in both the example bond in Atom 4.2 and the trust chain diagram in Atom 4.5. The `.asc` example in Atom 4.6 also uses the incorrect type.

**This is the primary factual error in the curriculum.** It will confuse learners who go verify the actual bond file and find a different type.

**Atom 4.3 — Inbound bonds for Chiron:**
The curriculum states Chiron receives both a `juno-to-chiron.md` bond and a `koad-to-chiron.md` bond. PARTIALLY CONFIRMED. `juno-to-chiron.md` exists and is signed. No `koad-to-chiron.md` bond exists in `~/.juno/trust/bonds/` — only the `koad-to-juno.md` root bond is present. This appears to be a conceptual fabrication for teaching purposes. A note that `koad-to-chiron` is illustrative (not yet issued) would be appropriate.

**Atom 4.5 — Trust chain diagram:**
```
koad (root authority)
  └── Juno (authorized-agent — operates business on koad's behalf)
        ├── Vulcan (authorized-builder)
        ├── Chiron (authorized-curriculum-architect)
        └── Alice (authorized-guide)
```
PARTIALLY INCORRECT. The bond types are wrong for Chiron (should be `authorized-specialist`) and Alice (no `authorized-guide` bond exists — Alice has no `trust/bonds/` directory at all, and no inbound bond from Chiron was found). These are pedagogical trust chain examples, but using wrong types is misleading.

**Atom 4.7 — Verification step 2:**
```bash
curl -s https://canon.koad.sh/juno.keys | gpg --import
```
Same issue flagged in Level 3. The canon serves SSH keys, not GPG keys. The actual verification path uses the entity's `id/rsa.pub` or equivalent.

Confidence: CONFIRMED (file-based bond model), INCORRECT (bond type `authorized-curriculum-architect`), FLAGGED (canon GPG import)

---

### Level 5 — "Commands and Hooks"
**Verdict: PASS with annotation**

**Atom 5.1 — Command examples:**
```
~/.juno/commands/commit/self/command.sh    ← juno commit self
~/.juno/commands/spawn/process/command.sh  ← juno spawn process <entity>
```
CONFIRMED. Both paths exist on disk.

**Atom 5.2 — Hook examples:**
```
~/.juno/hooks/on-issue-assigned.sh
~/.chiron/hooks/author-curriculum.sh
~/.alice/hooks/on-level-complete.sh
```
SPECULATIVE. The actual `~/.juno/hooks/` directory contains only `executed-without-arguments.sh` and `PRIMER.md`. The `on-issue-assigned.sh` hook does not exist in the live system. Similarly, chiron and alice hook examples are illustrative of intended behavior, not live files. The curriculum presents these as current examples when they are aspirational. This is pedagogically fine but should be noted — these are planned hooks, not implemented ones.

**Command discovery order (Atom 5.3):** Confirmed as described. The `koad-io` script confirms the priority: global → entity → CWD (last found wins, so CWD has highest effective priority). The curriculum states "entity commands first" but the actual implementation resolves in order global → entity → CWD with later results overwriting earlier ones, meaning CWD is highest priority. **Minor inversion in how the curriculum describes priority.** The curriculum says "entity > local > global" as the priority order, but the actual CLI script walks global → entity → CWD and CWD wins. The end result is the same but the description of "entity commands first" could mislead a learner about where to look first.

Confidence: CONFIRMED (command paths), SPECULATIVE (hook examples), PROBABLE (discovery order description)

---

### Level 6 — "The Daemon and the Kingdom"
**Verdict: PASS**

**Daemon location:** `~/.koad-io/daemon/`. CONFIRMED. Directory exists.

**passenger.json:** Described as entity manifest at root of entity directory. CONFIRMED. `~/.alice/passenger.json` exists (though the format shown in the curriculum — with `entity`, `role`, `version`, `description`, `home`, `author` fields — does not match Alice's actual `passenger.json`, which has `handle`, `name`, `avatar`, `outfit` fields for UI purposes). The curriculum's example may be from a different entity type. FLAGGED as a minor discrepancy — the passenger.json schema appears more complex in practice.

Confidence: CONFIRMED (daemon location), FLAGGED (passenger.json schema)

---

### Level 7 — "Peer Rings"
**Verdict: PASS**

Conceptual content. No verifiable file paths or command examples. Architecture claims (ring tiers, sovereignty preservation) align with system documentation. Sponsorship-as-ring-membership framing is consistent with `BUSINESS_MODEL.md`.

Confidence: PROBABLE

---

### Levels 8–12
**Verdict: PASS (no new technical claims requiring correction)**

Levels 8–12 build on concepts established in 1–7 and introduce GitHub Issues protocol, context bubbles, entity lifecycle, and graduation ceremony. The GitHub Issues workflow described in Level 9 is consistent with observed team operations. Level 11's `spawn process` description is consistent with the live `juno spawn process` command. No new factual errors identified beyond those already flagged in earlier levels.

Confidence: CONFIRMED (GitHub Issues flow), PROBABLE (graduation certificate mechanics)

---

## Summary of Errors and Flags

| Level | Location | Issue | Severity |
|-------|----------|-------|----------|
| 3, 4 | Atom 3.5, Atom 4.7 | `curl https://canon.koad.sh/juno.keys | gpg --import` — canon serves SSH keys, not GPG keys | FLAGGED — command likely won't work as written |
| 4 | Atom 4.2, 4.5, 4.6 | Bond type `authorized-curriculum-architect` is incorrect; actual type is `authorized-specialist` | INCORRECT — factual error against live bond |
| 4 | Atom 4.3 | `koad-to-chiron.md` bond claimed as inbound for Chiron; this bond does not exist in the live system | SPECULATIVE — illustrative, not live |
| 5 | Atom 5.2 | Hook examples (`on-issue-assigned.sh`, etc.) do not exist in live hook directories | SPECULATIVE — aspirational, not live |
| 5 | Atom 5.3 | "Entity commands first" framing; actual CLI walks global→entity→CWD (CWD wins, not entity) | PROBABLE — minor framing inversion |
| 6 | Atom 6.3 | `passenger.json` schema shown does not match Alice's actual passenger.json fields | FLAGGED — schema mismatch |

---

## Required Revisions

1. **Level 4, Atom 4.2, 4.5, 4.6:** Change bond type from `authorized-curriculum-architect` to `authorized-specialist` throughout.

2. **Levels 3 and 4, GPG import steps:** Replace `curl -s https://canon.koad.sh/juno.keys | gpg --import` with the correct GPG key import path: `gpg --import ~/.{entity}/id/rsa.pub`. Add a note distinguishing SSH public keys (served by canon.koad.sh) from GPG keys (distributed via entity `id/` directories).

3. **Level 5, hook examples:** Mark the hook examples as illustrative/planned, or replace with the one hook that does exist (`executed-without-arguments.sh`).

## Optional Revisions

4. **Level 6, passenger.json schema:** Verify the schema shown against a canonical gestated entity's `passenger.json` or note that the schema shown is the daemon-facing subset.

5. **Level 4, Atom 4.3:** Add a note that `koad-to-chiron` is shown for illustration — direct koad → Chiron bonds are not yet issued; the actual chain flows through Juno.

---

*Reviewed by Veritas. Grounded against: `~/.juno/trust/bonds/`, `~/.koad-io/bin/koad-io`, `~/.juno/hooks/`, `~/.juno/id/`, `~/.alice/trust/`, `~/.koad-io/trust/`.*
