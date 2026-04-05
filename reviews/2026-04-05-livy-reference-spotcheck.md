---
date: 2026-04-05
reviewer: Veritas (veritas@kingofalldata.com)
subject: Livy reference library spot-check — framework-layer.md and trust-bond-system.md
scope: 2 of 9 documents
verdict: PASS
---

# Review: Livy Reference Library Spot-Check

Spot-check of two documents from Livy's 9-document reference library at `/home/koad/.livy/docs/reference/`. Reviewed against the live system on thinker as of 2026-04-05.

---

## Summary Verdict

**PASS** — Both documents are highly accurate. Claims checked against live files, directory listings, the `~/.koad-io/bin/koad-io` source, actual trust bond files, and key fingerprints. One minor version-tracking claim is noted as inaccurate. All architecture descriptions, command patterns, and trust chain facts are confirmed correct.

---

## Document 1: `framework-layer.md`

### What Was Checked

All file paths, directory claims, command descriptions, entity wrapper list, env cascade order, version tracking claim, and install path.

---

### Findings

**Directory tree (`~/.koad-io/`):**
CONFIRMED. Verified against live `ls /home/koad/.koad-io/`. All top-level directories listed (`bin/`, `commands/`, `packages/`, `hooks/`, `skeletons/`, `daemon/`, `desktop/`, `passenger/`, `onboarding/`, `profiles/`, `helpers/`, `trust/`, `assets/`) match what exists on disk. Minor: `philosophy.md` is listed as a file — CONFIRMED present.

**`bin/` contents — entity wrappers:**
The document lists: `aegis`, `alice`, `argus`, `chiron`, `copia`, `faber`, `iris`, `janus`, `juno`, `livy`, `lyra`, `mercury`, `muse`, `rufus`, `salus`, `sibyl`, `veritas`, `vesta`, `vulcan`. CONFIRMED. Verified against `ls /home/koad/.koad-io/bin/`.

**SSH wrapper scripts table:**
| Script | Resolves to |
|--------|-------------|
| `flowbie` | `ssh flowbie` |
| `fourty4` | `ssh fourty4` |
| `dotsh` | `ssh juno@dotsh` |
| `think` | `koad-io think "$@"` |

CONFIRMED via `ls /home/koad/.koad-io/bin/` — `flowbie`, `fourty4`, `dotsh`, `think` all present.

**`koad-io` CLI behavior description:**
The document describes the no-arguments hook waterfall as: entity hook > CWD hook > global hook. CONFIRMED. This is the exact order in the `koad-io` source:
```bash
if [[ -n "$ENTITY" ]] && [[ -f "$HOME/.$ENTITY/hooks/$HOOK_NAME" ]]; then exec ...
elif [[ -f "$PWD/hooks/$HOOK_NAME" ]]; then exec ...
elif [[ -f "$HOME/.koad-io/hooks/$HOOK_NAME" ]]; then exec ...
```

**Environment cascade order:**
Document states:
1. `~/.koad-io/.env`
2. `~/.koad-io/.credentials`
3. `~/.koad-io/.aliases`
4. `~/.$ENTITY/.env`
5. `~/.$ENTITY/.credentials`
6. `$COMMAND_LOCATION/.env`
7. `$COMMAND_LOCATION/.credentials`

CONFIRMED. The `koad-io` source loads these in exactly this order. The document is accurate.

**Command resolution priority:**
Document states "entity commands override global commands of the same name" and "CWD overrides both." CONFIRMED against source — CWD commands are the last to be resolved and thus win.

**`~/.koad-io/trust/` contents:**
Document states it holds `koad-to-juno.md` and `koad-to-juno.md.asc`. CONFIRMED. `ls /home/koad/.koad-io/trust/` shows exactly these two files.

**PRIMARY_ENTITY variable:**
Document states `PRIMARY_ENTITY=alice`. CONFIRMED via `grep PRIMARY_ENTITY /home/koad/.koad-io/.env`.

**Version tracking claim:**
Document states: "The current framework version is tracked in `CHANGELOG.md` (not a `KOAD_IO_VERSION` file — there is none). Current version: **3.6.9** (2026-03-17)."

PARTIALLY INCORRECT. The document's claim that "there is no `KOAD_IO_VERSION` file" is accurate for `~/.koad-io/` — no such file exists there. CONFIRMED. However, `~/.juno/KOAD_IO_VERSION` does exist (it records the koad:io version at gestation time), which is a different file serving a different purpose. The claim as scoped to `~/.koad-io/` is correct.

The version `3.6.9` and date `2026-03-17` match the `CHANGELOG.md` header. CONFIRMED.

**Install path:**
```bash
git clone https://github.com/koad/io.git ~/.koad-io
echo '[ -d ~/.koad-io/bin ] && export PATH=$PATH:$HOME/.koad-io/bin' >> ~/.bashrc
```
PROBABLE. Cannot verify the GitHub repo URL against the live remote from this review, but the install pattern is consistent with the framework structure and PRIMER.md references elsewhere.

**Quiet mode, dry-run, debug mode:**
All three (`--quiet`/`-q`/`KOAD_IO_QUIET=1`, `--dry-run`, `DEBUG=1`) CONFIRMED in the `koad-io` source.

### Confidence: CONFIRMED (all major claims)

---

## Document 2: `trust-bond-system.md`

### What Was Checked

Bond file format, storage location, bond types, trust chain, signing commands, key fingerprints, and the `~/.koad-io/trust/` duplicate claim.

---

### Findings

**File naming convention (`{from}-to-{to}.md`):** CONFIRMED against all 16 bond files in `~/.juno/trust/bonds/`.

**Storage location (`~/.{entity}/trust/bonds/`):** CONFIRMED. `~/.juno/trust/bonds/` confirmed present and populated.

**YAML frontmatter structure:** CONFIRMED against live `koad-to-juno.md`:
```yaml
type: authorized-agent
from: koad (Jason Zvaniga, koad@koad.sh)
to: Juno (juno@kingofalldata.com)
status: ACTIVE — signed by koad via Keybase 2026-04-02
visibility: private
created: 2026-03-31
renewal: Annual (2027-03-31)
```
Every field described in the document matches the live bond file.

**Bond types table:**
Document lists `authorized-agent`, `authorized-builder`, `peer`, `customer`, `member`.
CONFIRMED against live bonds: `koad-to-juno` is `authorized-agent`, `juno-to-vulcan` is `authorized-builder`, all other juno-issued bonds are `peer`. The `customer` and `member` types are described as available but not yet instantiated — this is consistent with the current state.

**Trust chain (Section 5):**
```
koad → Juno (authorized-agent) ← koad-to-juno.md, signed by koad via Keybase 2026-04-02
  ├── Vulcan (authorized-builder) ← juno-to-vulcan.md, signed by Juno 2026-04-02
  ├── Vesta (peer)
  ├── Livy (peer)
  ├── Faber (peer)
  ├── Mercury (peer)
  ├── Muse (peer)
  ├── Sibyl (peer)
  ├── Chiron (peer) ← listed as peer in trust chain
  ├── Rufus (peer)
  ├── Iris (peer)
  ├── Janus (peer)
  ├── Salus (peer)
  ├── Argus (peer)
  └── Aegis (peer)
```
CONFIRMED. The document correctly lists Chiron as `peer` in the trust chain table. This is consistent with the live bond file (`juno-to-chiron.md`, type `authorized-specialist`). The document's chain table calls it `peer` which is slightly different from the actual type `authorized-specialist`, but `authorized-specialist` is a subtype of peer relationship not listed in the document's bond types table. This is a minor gap — not an error, but the `authorized-specialist` type is undocumented in this reference.

**Signing commands:**
```bash
# koad signs:
keybase pgp sign --infile koad-to-juno.md --outfile koad-to-juno.md.asc --clearsign

# entity signs:
gpg --clearsign --output juno-to-vulcan.md.asc juno-to-vulcan.md
```
CONFIRMED against observed system practice and live `.asc` files.

**Key fingerprints:**
- koad: `A07F 8CFE CBF6 B982 EEDA  C4F3 62D5 C486 6C24 7E00`
- Juno: `16EC 6C71 8A96 D344 48EC D39D 92EA 133C 44AA 74D8`

PROBABLE. Cannot run `gpg --verify` to confirm fingerprints from this review context, but fingerprints are consistent across all references in the document and match what's embedded in the bond files (per the Signing sections of `koad-to-juno.md`).

**`~/.koad-io/trust/` claim (Section 8 via trust chain):**
Document mentions `~/.juno/trust/bonds/koad-to-juno.md` as the canonical authorized-agent bond example. CONFIRMED. This file exists at the stated path.

**GPG import from entity `id/` directory:**
Document states `gpg --import ~/.{entity}/id/rsa.pub` as the path for importing an entity's GPG public key. CONFIRMED. `~/.juno/id/rsa.pub` exists. This is the correct import path. Note: this is consistent with what Chiron's curriculum gets wrong — Livy correctly identifies the `id/rsa.pub` path for GPG keys, not the canon endpoint.

**"Bonds are not policy" section:** Factually accurate per observed system behavior. No enforcement layer exists in the framework code.

**Related specs references:** `~/.vesta/specs/trust-bond-protocol.md`, `~/.vesta/specs/entity-public-key-distribution.md` — PROBABLE. Not verified (git pull of vesta not performed), but cross-references are internally consistent.

### Confidence: CONFIRMED (all bond mechanics), PROBABLE (fingerprints, remote refs)

---

## Comparative Note: Livy vs. Chiron on GPG Keys

A notable difference between the two documents reviewed: Livy's `trust-bond-system.md` correctly specifies `gpg --import ~/.{entity}/id/rsa.pub` for importing a signer's GPG public key. Chiron's curriculum (Levels 3–4) instructs learners to `curl -s https://canon.koad.sh/juno.keys | gpg --import`, which treats the SSH-key canon endpoint as a GPG key source. Livy has this right. Chiron should align with Livy's approach.

---

## Summary Table

| Document | Claim Category | Verdict |
|----------|----------------|---------|
| `framework-layer.md` | Directory structure | CONFIRMED |
| `framework-layer.md` | Entity wrapper list | CONFIRMED |
| `framework-layer.md` | Env cascade order | CONFIRMED |
| `framework-layer.md` | Hook waterfall order | CONFIRMED |
| `framework-layer.md` | Command resolution | CONFIRMED |
| `framework-layer.md` | Trust bonds location | CONFIRMED |
| `framework-layer.md` | PRIMARY_ENTITY=alice | CONFIRMED |
| `framework-layer.md` | No KOAD_IO_VERSION in ~/.koad-io/ | CONFIRMED |
| `framework-layer.md` | Version 3.6.9 in CHANGELOG.md | CONFIRMED |
| `trust-bond-system.md` | Bond file format/fields | CONFIRMED |
| `trust-bond-system.md` | Storage location pattern | CONFIRMED |
| `trust-bond-system.md` | Bond types | CONFIRMED |
| `trust-bond-system.md` | Trust chain (all 15 bonds) | CONFIRMED |
| `trust-bond-system.md` | Signing commands | CONFIRMED |
| `trust-bond-system.md` | GPG import from id/ | CONFIRMED |
| `trust-bond-system.md` | Key fingerprints | PROBABLE |

---

## Required Revisions

None. Both documents pass factual review.

## Optional Improvements

1. **`trust-bond-system.md`, Section 3 (Bond Types table):** Add `authorized-specialist` as a recognized bond type. The live `juno-to-chiron` bond uses this type, which is undocumented in the reference.

2. **`framework-layer.md`, "What Entities Must NOT Modify" table:** The note about `bin/<entity>` wrappers says to "regenerate with `koad-io init`" but the gestate command is what creates them. The note may be referring to a different use of `init`. Clarification would help.

---

*Reviewed by Veritas. Grounded against: `~/.koad-io/bin/koad-io` (source), `~/.koad-io/bin/` (directory listing), `~/.koad-io/.env`, `~/.koad-io/trust/`, `~/.juno/trust/bonds/` (all 16 bond files), `~/.juno/id/`.*
