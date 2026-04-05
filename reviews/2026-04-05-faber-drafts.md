---
reviewer: Veritas (veritas@kingofalldata.com)
date: 2026-04-05
drafts:
  - ~/.faber/drafts/2026-04-05-entities-on-disk.md
  - ~/.faber/drafts/2026-04-05-pre-invocation-context-assembly.md
  - ~/.faber/drafts/2026-04-05-trust-bonds-arent-policy.md
references:
  - ~/.sibyl/research/2026-04-05-icm-synthesis.md
  - ~/.juno/trust/bonds/ (live bond files)
  - ~/.koad-io/hooks/executed-without-arguments.sh (live hook code)
  - ~/.faber/.env (live entity config)
---

# Veritas Review: Faber Drafts 2026-04-05

---

## Draft 1: `2026-04-05-entities-on-disk.md`

**Verdict: NEEDS_REVISION**

Most claims are accurate and well-supported by live files. Three issues require correction before publication.

### Issues

**Issue 1 — Machine count is outdated (line 78, 225)**

> `ENTITY_HOST=fourty4` means Faber runs on fourty4 — the Mac Mini in the three-machine infrastructure.
> The three-machine setup right now: thinker, flowbie, fourty4

Infrastructure memory (project_infrastructure.md) documents 5 machines: thinker, wonderland, fourty4, flowbie, dotsh (Vultr Toronto). The "three-machine" framing was accurate at 2026-03-31 but is out of date as of the time of writing. The article presents this as the current state ("right now").

**Correction:** Replace "three-machine infrastructure" with "primary infrastructure" or update the machine list to reflect current state. If the intent is to describe the founding setup, frame it explicitly as such.

**Issue 2 — .env displayed in directory tree twice (lines 28 and 45)**

The file tree shows `.env` at both the top (`├── .env`) and the bottom (`└── .env`) of the listing. This is likely a copy-paste artifact. Only one `.env` should appear.

**Correction:** Remove the duplicate `.env` entry. Keep the bottom entry (`└── .env # entity variables`) as it is more accurate, since `.env` is at the root and would be the last alphabetical item.

**Issue 3 — Faber's .env shown as verbatim is incomplete (lines 57–74)**

The article says "Here is Faber's, verbatim:" but the displayed `.env` omits several lines present in the actual file: `KOAD_IO_BIND_IP`, `METEOR_PACKAGE_DIRS`, and `REMOTE_NVM_INIT`. The omission of `REMOTE_NVM_INIT` in particular is significant — it is the mechanism that makes the SSH path work on fourty4 (a Mac Mini with NVM-managed Node). If readers inspect the actual `.env` they will see discrepancy.

**Correction:** Either include all lines, or change "verbatim" to "key fields" and note that environment-specific vars (NVM, binding) are omitted for clarity.

### Confirmed Accurate

- `.env` field values: ENTITY, ENTITY_DIR, ENTITY_HOME, CREATOR, MOTHER, ROLE, GIT_AUTHOR_NAME, GIT_AUTHOR_EMAIL, KOAD_IO_ENTITY_HARNESS, ENTITY_HOST, REMOTE_HARNESS_BIN — all match `~/.faber/.env`
- Interactive hook path: `exec claude . --model sonnet --add-dir "$CALL_DIR"` — matches line 126 of `~/.koad-io/hooks/executed-without-arguments.sh`
- Remote SSH invocation mechanism (base64 encoding, `claude --dangerously-skip-permissions --output-format=json -p`) — accurate, per lines 175–178 of hook
- Hook source order (`~/.koad-io/.env` then `~/.$ENTITY/.env`, entity wins) — matches lines 67–68 of hook
- Git commit hashes cited for Faber: all 9 hashes verified present in `~/.faber` git log
- Git commit hashes cited for Juno: all 5 hashes verified present in `~/.juno` git log
- Juno-to-Faber trust bond content: matches `~/.juno/trust/bonds/juno-to-faber.md` exactly
- Trust bond type (peer), from/to fields, date (2026-04-03), scope constraints — all match live file
- GPG signature on `juno-to-faber.md.asc`: `gpg --verify` returns "Good signature from Juno <juno@kingofalldata.com>" ✓
- Key fingerprint cited (`16EC 6C71 8A96 D344 48EC D39D 92EA 133C 44AA 74D8`): matches primary key fingerprint of Juno's GPG key ✓
- Trust chain (koad → Juno → Faber), bond dates, bond types — all match live bond files
- 15 entities on fourty4: consistent with project_juno_state.md ("15 entities on fourty4 HQ")
- `id/` directory contains Ed25519, ECDSA, RSA, DSA keys: confirmed present in `~/.faber/id/`
- `canon.koad.sh/juno.keys` reference: the domain resolves (Forgejo instance); `/juno.keys` path currently returns 404. This is a known intended URL that is not yet live. The article states it as if it's operational. This is a minor presentational issue — the key distribution infrastructure exists but the specific path is not yet serving content. Suggest softening to "will be available at" or noting it as forthcoming, OR treat as acceptable forward-reference if the URL will be live before publication.

---

## Draft 2: `2026-04-05-pre-invocation-context-assembly.md`

**Verdict: NEEDS_REVISION**

ICM citations are accurate against Sibyl's synthesis. The architectural description of koad:io's pattern contains one significant factual error in the core mechanism description, and one framing issue that overstates the current state of PRIMER.md deployment.

### Issues

**Issue 1 — Critical: Invocation path conflation (lines 17–28, 80–85, 94–104)**

The article uses `cd ~/.sibyl && claude` and `cd ~/.juno && claude` as the example invocations throughout, claiming the shell hook intercepts these and injects PRIMER.md. This is incorrect.

The hook (`~/.koad-io/hooks/executed-without-arguments.sh`) runs when an entity command is invoked via the entity binary wrapper (e.g., typing `sibyl` or `juno`). It does NOT run when you type `cd ~/.sibyl && claude` directly. Direct invocation of the `claude` binary bypasses the hook entirely — no PRIMER.md injection occurs.

The correct invocation that triggers the hook and PRIMER.md injection is:
```bash
sibyl   # invokes ~/.koad-io/bin/sibyl → sets ENTITY=sibyl → calls koad-io → runs hook
juno    # invokes ~/.koad-io/bin/juno → sets ENTITY=juno → calls koad-io → runs hook
```

`cd ~/.sibyl && claude` is a valid way to open a Claude Code session in Sibyl's directory, but it has no identity injection — Claude reads whatever it finds in CLAUDE.md during execution, which is the ICM pattern the article is contrasting against.

This error is architecturally central: the article's thesis is that identity is injected pre-invocation by the shell. That is true — but only when the entity command (not the raw binary) is used. The examples throughout need to be corrected to `sibyl` and `juno`.

**Correction:** Replace all instances of `cd ~/.sibyl && claude` with `sibyl` (invoked from any directory), and `cd ~/.juno && claude` with `juno`. Add a note clarifying that `juno` (the entity command) is the correct invocation; `cd ~/.juno && claude` bypasses the hook.

**Issue 2 — PRIMER.md deployment coverage overstated (lines 14–27, 158–159)**

> "Fifteen entities on one machine, all reachable this way."
> "koad:io has been running pre-invocation context assembly in production across fifteen entities."

At the time of writing, only three entities have PRIMER.md at their root level: `~/.juno/PRIMER.md`, `~/.copia/PRIMER.md`, and `~/.lyra/PRIMER.md`. `~/.sibyl/PRIMER.md` does not exist. The other entities do not have entity-level PRIMER.md files.

The PRIMER.md pattern is adopted but not uniformly deployed. Claiming it runs "across fifteen entities" is not defensible in its current state.

**Correction:** Revise to: "The pattern is in production. Juno, Copia, and Lyra have PRIMER.md files at their entity root. The pattern is being rolled out across the team." Alternatively, scope the claim to the entities where it is confirmed active.

**Issue 3 — PRIMER.md injection and interactive sessions (minor, lines 80–85)**

The article says "the shell hook reads $CWD/PRIMER.md → injects as orientation context → model invoked with identity already loaded." This is accurate for the non-interactive (PROMPT= set) path. For the interactive path, the hook behavior is:

- If PRIMER.md exists at CALL_DIR and PROMPT is empty → PRIMER.md content is set as PROMPT → PROMPT is now non-empty → non-interactive path is taken (`claude -p "$PROMPT"`)
- If no PRIMER.md and PROMPT is empty → interactive path: `exec claude . --model sonnet`

So for the interactive case, PRIMER.md injection routes the session to non-interactive mode, not a seeded interactive session. This is a nuance that could confuse readers who try `juno` from `~/.juno/` and get a non-interactive single-shot session rather than an interactive one.

This is a design detail rather than a factual error in the article's main claim. Mark as "acceptable simplification" unless the audience is developers inspecting the hook code.

### Confirmed Accurate (ICM Claims)

All ICM-related claims checked against `~/.sibyl/research/2026-04-05-icm-synthesis.md`:

- Authors: Jake Van Clief and David McDermott — ✓
- Institution affiliations (Eduba, University of Edinburgh) — consistent with Sibyl's synthesis
- Date: March 2026 (arxiv:2603.xxxxx format) — ✓
- 33 practitioners, three institutions — ✓ (Sibyl: "33 practitioners, deployed at University of Edinburgh, ICR Research, Academy of International Affairs (Bonn)")
- Unix composability (McIlroy, 1978) — ✓ (Sibyl cites this explicitly)
- Five-layer hierarchy description — ✓ (matches Sibyl's table)
- ICM's "agent reads files during execution" vs koad:io's "shell assembles before model loads" — ✓ (Sibyl: "ICM describes an agent reading files during task execution... koad:io assembles context before the model loads, from shell state ($CWD)")
- ICM Layer 0 question ("what is this workspace?") vs koad:io PRIMER.md question ("who am I?") — ✓ (Sibyl: "ICM's Layer 0 answers: 'What is this workspace?' / koad:io's PRIMER.md answers: 'Who am I?'")
- Juno PRIMER.md quoted opening text — exact match to `~/.juno/PRIMER.md` ✓
- "Prevention over compression" token efficiency claim — consistent with Sibyl's synthesis
- "Inputs table as explicit contract" — consistent with Sibyl's synthesis
- Sibyl's confidence assessment on these ICM claims: High

---

## Draft 3: `2026-04-05-trust-bonds-arent-policy.md`

**Verdict: NEEDS_REVISION**

The bond content, authorization scope, and philosophical framing are accurate. One factual error in the simulated GPG output, and a persistent infrastructure issue with canon.koad.sh.

### Issues

**Issue 1 — GPG output shows wrong key fingerprint (in the Signature File section)**

The article's simulated `gpg --verify` output shows:

```
gpg:                using RSA key 16EC6C718A96D34448ECD39D92EA133C44AA74D8
```

The actual `gpg --verify ~/.juno/trust/bonds/juno-to-vulcan.md.asc` output is:

```
gpg: Signature made Thu 02 Apr 2026 01:28:45 PM EDT
gpg:                using RSA key 20A74C1EC0B6A6B919E52D9B102038F7D06775AC
gpg:                issuer "juno@kingofalldata.com"
gpg: Good signature from "Juno <juno@kingofalldata.com>" [ultimate]
gpg: WARNING: not a detached signature; file '...' was NOT verified!
```

The key `16EC6C718A96D34448ECD39D92EA133C44AA74D8` is Juno's primary key fingerprint. The key actually used for signing — and displayed by gpg — is `20A74C1EC0B6A6B919E52D9B102038F7D06775AC`, the signing subkey. The primary fingerprint appears in the `Primary key fingerprint:` field only when there is a trust warning (as with the koad-to-juno.md.asc signed by an uncertified external key).

The article shows output that no reader can reproduce. Anyone who runs `gpg --verify` on the actual file will see a different key ID. This breaks the "verify it yourself" claim in the very section making that claim.

Additionally, the actual output includes `[ultimate]` after the uid and the `WARNING: not a detached signature` line, both absent from the draft.

**Correction:** Replace the simulated output block with the actual output. Show the subkey fingerprint `20A74C1EC0B6A6B919E52D9B102038F7D06775AC` in the "using RSA key" line. The explanatory note can clarify that `20A74C1...` is Juno's signing subkey, and the primary key fingerprint is `16EC6C71...` (published at canon.koad.sh). The WARNING line about clearsign format is real output and worth including — it explains itself and is not alarming to GPG users.

**Issue 2 — `canon.koad.sh/juno.keys` is not currently live**

The article states: "You need Juno's public key — available at canon.koad.sh/juno.keys — and the file. That's it."

`canon.koad.sh` resolves (Forgejo instance, live), but `canon.koad.sh/juno.keys` returns HTTP 404. The key is not currently served at this URL. The article presents this as an operational retrieval step a reader can perform now.

This same issue applies to `canon.koad.sh/koad.keys` referenced in the verification chain.

**Correction:** Add a qualifier: "Juno's public key will be available at canon.koad.sh/juno.keys (currently being set up) — or request it directly via keybase.io/koad." Alternatively, if the key will be live before publication, this can remain as-is and should be verified at publication time.

### Confirmed Accurate

- `juno-to-vulcan.md` bond content: matches `~/.juno/trust/bonds/juno-to-vulcan.md` exactly ✓
- Bond type (authorized-builder), from/to/dates, NOT authorized list — all match live file ✓
- Reporting chain in bond (koad → Juno → Vulcan) — matches live file ✓
- Key fingerprint cited for Juno (`16EC 6C71 8A96 D344...`) — is the correct primary key fingerprint ✓
- GPG signature on `juno-to-vulcan.md.asc` verifies as Good signature from Juno ✓
- `koad-to-juno.md.asc` GPG signature verifies successfully — "Good signature from Jason Zvaniga <keybase@kingofalldata.com>" ✓
- koad fingerprint (`A07F 8CFE CBF6 B982...`) — matches actual primary key fingerprint ✓
- Trust chain: koad-to-juno signed 2026-04-02, juno-to-vulcan signed 2026-04-02 — confirmed from gpg timestamps ✓
- Git audit trail commands (`git log --follow`, `git show <commit>:`) — syntactically correct, will work as described ✓
- Clearsign format description (message + signature in one file, `gpg --verify` single-arg) — correct for this use case ✓
- Revocation process (delete .asc, commit, push) — mechanically accurate ✓
- GPG is a standard, no proprietary protocol — accurate ✓

**Note on koad-to-juno bond status:** The `.asc` file for `koad-to-juno` contains the text "Status: DRAFT — awaiting GPG signing by koad" in the signed content, while the `.md` file says "ACTIVE — signed by koad via Keybase 2026-04-02." This means the `.md` was updated to ACTIVE after the `.asc` was signed, creating a discrepancy between the signed artifact and the plaintext companion. The bond IS signed (gpg --verify confirms "Good signature"), so the claim "koad signed this bond" is true. But a reader who diffs `.md` against the signed content in `.asc` will notice the mismatch. This is an internal consistency issue in the bond files, not in the article — the article doesn't surface it. No correction required for the article, but the bond files themselves should be reconciled (noted for Juno's attention).

---

## Summary

| Draft | Verdict | Blocking Issues |
|-------|---------|-----------------|
| entities-on-disk.md | NEEDS_REVISION | Machine count outdated; .env "verbatim" disclaimer; .env listed twice in tree |
| pre-invocation-context-assembly.md | NEEDS_REVISION | Invocation path conflation (critical — `cd ~/.sibyl && claude` bypasses hook); PRIMER.md coverage overstated |
| trust-bonds-arent-policy.md | NEEDS_REVISION | GPG output shows wrong key fingerprint; canon.koad.sh URL not yet live |

No draft is cleared for publication as-is. The trust-bonds piece is closest — two targeted corrections and it passes. The pre-invocation piece requires the most substantive revision (the invocation path error is architecturally central to its argument).
