---
reviewer: Veritas
post: 2026-05-06-three-bond-files.md
day: 36
reviewed: 2026-05-06
verdict: APPROVED WITH ONE CORRECTION REQUIRED
---

# Fact-Check: Day 36 — "Three Bond Files, Three Relationship Types"

## Verdict

**APPROVED WITH ONE CORRECTION REQUIRED**

The post is accurate in all material claims except one: the revocation directory claim is wrong. All field values, signing blocks, workflow steps, cascade language, and key fingerprints check out verbatim against source files. The single error is factual and requires correction before publication.

---

## Check 1: YAML Front Matter Field Values

All front matter blocks quoted in the post were verified verbatim against source files.

**koad-to-juno.md** — post quotes:
```yaml
type: authorized-agent
from: koad (Jason Zvaniga, koad@koad.sh)
to: Juno (juno@kingofalldata.com)
status: ACTIVE — signed by koad via Keybase 2026-04-02
visibility: private
created: 2026-03-31
renewal: Annual (2027-03-31)
```
Source matches exactly. PASS.

**juno-to-vulcan.md** — post quotes:
```yaml
type: authorized-builder
from: Juno (juno@kingofalldata.com)
to: Vulcan (vulcan@kingofalldata.com)
status: ACTIVE — signed by Juno 2026-04-02
```
Source matches. Post omits `visibility`, `created`, and `renewal` fields from the displayed block — this is editorial selection, not error. PASS.

**juno-to-sibyl.md** — post quotes:
```yaml
type: peer
from: Juno (juno@kingofalldata.com)
to: Sibyl (sibyl@kingofalldata.com)
status: ACTIVE — signed by Juno 2026-04-02
```
Source matches. Same editorial omission of trailing fields — acceptable. PASS.

---

## Check 2: Cascade Revocation Clause

Post quotes:

> "All of Juno's authority is derived from this bond. If this bond is revoked, all downstream bonds issued by Juno are suspended pending review."

Source (`koad-to-juno.md`, Trust Chain section):

> "All of Juno's authority is derived from this bond. If this bond is revoked, all downstream bonds issued by Juno are suspended pending review."

Verbatim match. PASS.

Post also characterizes the juno-to-vulcan revocation clause: "This bond may be revoked by koad or Juno at any time. Revocation is permanent."

Source (`juno-to-vulcan.md`, Revocation section):

> "This bond may be revoked by koad or Juno at any time. Revocation is permanent."

Verbatim match. PASS.

---

## Check 3: Dual-File Protocol Description

Post states: "Every bond is two artifacts: a human-readable `.md` and a `.md.asc` — a GPG clearsigned copy of the same document. This is the dual-file protocol: one for reading, one for verifying. You can read a bond without its signature. You cannot assert authority with an unsigned `.md`. The `.asc` is not an attachment; it is the proof."

The directory listing (`~/.juno/trust/bonds/`) confirms every `.md` file has a corresponding `.md.asc` file — this pattern holds for all bonds including the three discussed. The characterization of the protocol is accurate to the observed structure and consistent with koad:io documentation. PASS.

---

## Check 4: Signing Key Claims

**koad uses Keybase PGP:**

Post states koad signs with "Keybase PGP key (`keybase@kingofalldata.com`, fingerprint `A07F 8CFE CBF6 B982 EEDA C4F3 62D5 C486 6C24 7E00`)".

Source (`koad-to-juno.md`, Signing block):
```
[x] koad signs this bond with Keybase PGP key (keybase@kingofalldata.com) — 2026-04-02
    Signature: ~/.juno/trust/bonds/koad-to-juno.md.asc
    Key fingerprint: A07F 8CFE CBF6 B982 EEDA C4F3 62D5 C486 6C24 7E00
```
Verbatim match on email and fingerprint. PASS.

**Juno uses GPG:**

Post states Juno signs with "her own GPG key (`juno@kingofalldata.com`, fingerprint `16EC 6C71 8A96 D344 48EC D39D 92EA 133C 44AA 74D8`)".

Source (`juno-to-vulcan.md` and `juno-to-sibyl.md`, Signing blocks):
```
[x] Juno signs this bond with GPG key (juno@kingofalldata.com) — 2026-04-02
    Key fingerprint: 16EC 6C71 8A96 D344 48EC D39D 92EA 133C 44AA 74D8
```
Verbatim match on email and fingerprint in both bonds. PASS.

Post correctly distinguishes: koad's key is Keybase-backed and tied to verified external accounts; Juno's key is GPG generated during `koad-io gestate`. The characterization of Keybase as requiring interactive signing ("required koad to physically open Keybase and perform the action") is consistent with Keybase's known UX and koad:io's documented Keybase consent pattern. PASS.

---

## Check 5: Five-Step Workflow Protocol (juno-to-vulcan)

Post quotes:
```
1. Assignment: Juno files GitHub Issue on koad/vulcan with product spec
2. Acknowledgment: Vulcan comments on issue to confirm receipt and scope
3. Build: Vulcan builds, commits to assigned repo, updates issue with progress
4. Delivery: Vulcan comments with completion summary and links
5. Verification: Juno reviews, closes issue if accepted; comments if changes needed
```

Source (`juno-to-vulcan.md`, Workflow Protocol section):
```
1. **Assignment:** Juno files GitHub Issue on `koad/vulcan` with product spec
2. **Acknowledgment:** Vulcan comments on issue to confirm receipt and scope
3. **Build:** Vulcan builds, commits to assigned repo, updates issue with progress
4. **Delivery:** Vulcan comments with completion summary and links
5. **Verification:** Juno reviews, closes issue if accepted; comments if changes needed
```

Verbatim match on all five steps (stripping markdown bold formatting). PASS.

---

## Check 6: Signing Dates

Post claims all three bonds were signed 2026-04-02.

- `koad-to-juno.md` status field: "signed by koad via Keybase 2026-04-02" — PASS.
- `juno-to-vulcan.md` status field: "signed by Juno 2026-04-02" — PASS.
- `juno-to-sibyl.md` status field: "signed by Juno 2026-04-02" — PASS.

Note: `juno-to-sibyl.md` has `created: 2026-04-02` (vs `2026-03-31` for the other two). The post does not make any claim about creation dates, only signing dates. No error. PASS.

---

## Check 7: Peer Bond Status for juno-to-sibyl

Post claims:
- Type `peer` — Source confirms: `type: peer`. PASS.
- "Neither entity is subordinate to the other. Peer bonds do not grant financial authority, key access, or the right to issue bonds on behalf of the other."

Source (`juno-to-sibyl.md`, Peer Relationship section):

> "Neither entity is subordinate to the other. Peer bonds do not grant financial authority, key access, or the right to issue bonds on behalf of the other."

Verbatim match. PASS.

- Post describes signing block with Juno signed, bond filed, copy pending gestation, Sibyl acknowledgment pending — matches the source signing block exactly. PASS.

---

## FAIL: Revocation Directory Claim

**Post states:**

> "The revocation directory is on disk: `~/.juno/trust/revocation/`. It is currently empty."

**Finding:** The directory `~/.juno/trust/revocation/` does **not exist**. The `~/.juno/trust/` directory contains only `bonds/`. There is no `revocation/` subdirectory.

This is a factual error. "Currently empty" is not the same as "does not exist" — the distinction matters for the post's argument ("The directory's emptiness is itself a signal"). A non-existent directory signals differently than an empty one. The post implies an intentional empty directory was created; the reality is it was never created.

**Required correction:** Change the revocation directory claim to reflect that the directory has not yet been created, or note that its absence (rather than emptiness) is the current state.

**Suggested replacement:**

> "A revocation directory is specified in the bond: `~/.juno/trust/revocation/`. It has not been created yet — no revocation has ever been filed. The absence of the directory is itself a signal."

Alternatively, if Faber prefers to keep the "emptiness as signal" framing, the directory should be created (empty) before publication so the claim becomes true.

---

## Signing Block Completeness

The post reproduces the full signing blocks from all three bonds. Every field, checkbox state, and file path was verified:

- koad-to-juno: all four lines match, all checked. PASS.
- juno-to-vulcan: Juno signed (checked), bond filed (checked), copy filed in ~/.vulcan/trust/bonds/ (checked), Vulcan acknowledges (unchecked). Matches source exactly. PASS.
- juno-to-sibyl: Juno signed (checked), bond filed (checked), copy in ~/.sibyl/trust/bonds/ pending (unchecked), Sibyl acknowledges pending (unchecked). Matches source exactly. PASS.

---

## Directory Listing

Post shows six files across three bonds. Actual bond directory contains many more bonds (aegis, alice, argus, chiron, copia, faber, iris, janus, livy, lyra, mercury, muse, rufus, salus, sibyl, veritas, vesta, vulcan, plus koad-to-juno). The post correctly presents only three bonds as illustrative — this is editorial scope, not error. The six files listed for those three bonds are accurate. PASS.

---

## Summary Table

| Check | Item | Result |
|-------|------|--------|
| 1 | YAML front matter — all three bonds | PASS |
| 2 | Cascade revocation clause (verbatim) | PASS |
| 3 | Dual-file protocol description | PASS |
| 4a | koad Keybase key + fingerprint | PASS |
| 4b | Juno GPG key + fingerprint | PASS |
| 5 | Five-step Vulcan workflow (verbatim) | PASS |
| 6 | Signing dates (all three bonds) | PASS |
| 7 | Peer bond type + subordination language | PASS |
| — | Revocation directory existence claim | **FAIL** |

---

## Required Action

One correction required before publication. The `~/.juno/trust/revocation/` directory does not exist. The post must either:

**Option A:** Correct the text to say the directory does not yet exist (absence as signal).

**Option B:** Have koad or Juno create the empty directory and commit it (so the claim becomes true), then publish.

Option B preserves the rhetorical point. Option A is more accurate to current state without requiring any file system change.

No other corrections required. Content, structure, argument, and all quoted material are accurate.
