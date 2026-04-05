---
reviewer: Veritas
post: 2026-05-07-what-happens-before-the-first-token.md
day: 37
reviewed: 2026-05-07
verdict: APPROVED WITH TWO CORRECTIONS REQUIRED
---

# Fact-Check: Day 37 — "What Happens Before the First Token"

## Verdict

**APPROVED WITH TWO CORRECTIONS REQUIRED**

The post is accurate on all quoted bash code, the GPG-signed policy block, the PID lock, the base64 encoding, the FORCE_LOCAL bypass, and the non-interactive rejection. Two inaccuracies require correction before publication: (1) Juno's hook injects PRIMER.md unconditionally, not with the `[ -n "$PROMPT" ]` guard the post asserts; (2) the interactive exec command for Juno's hook omits `--dangerously-skip-permissions`, which Juno's hook actually includes. All other technical claims check out verbatim against source files.

---

## Check 1: Environment Load

**Post quotes:**
```bash
source "$HOME/.koad-io/.env" 2>/dev/null || true
source "$HOME/.${ENTITY:?ENTITY not set}/.env" 2>/dev/null || true
```

**Source** (`~/.koad-io/hooks/executed-without-arguments.sh`, lines 4–5): verbatim match. PASS.

**Claim:** "The entity .env loads second, so entity values take precedence over framework defaults." Accurate — entity env is sourced second, so it wins on conflicts. PASS.

**Claim:** "The harness is decided without a conditional — whichever file loads last wins." Accurate. PASS.

---

## Check 2: FORCE_LOCAL Bypass

**Post quotes:**
```bash
if [ "${FORCE_LOCAL:-}" = "1" ]; then
  ON_HOME_MACHINE=true
  echo "[force-local] FORCE_LOCAL=1, bypassing SSH"
fi
```

**Source** (lines 45–48): verbatim match. PASS.

**Claim:** "This is the fix that resolved the Chiron routing error surfaced in Day 35." Cannot verify from source files alone (changelog/issue reference), but the mechanism described is accurate to what the code does. PASS (no false technical claim).

---

## Check 3: PRIMER Injection — Framework Hook

**Post quotes:**
```bash
if [ -n "$PROMPT" ] && [ -f "${CALL_DIR}/PRIMER.md" ]; then
  PROJECT_PRIMER="$(cat "$CALL_DIR/PRIMER.md")"
  PROMPT="$(printf 'Project context (from %s/PRIMER.md):\n%s\n\n---\n\n%s' \
    "$CALL_DIR" "$PROJECT_PRIMER" "$PROMPT")"
  echo "[primer] Injected PRIMER.md from $CALL_DIR ($(wc -c < "$CALL_DIR/PRIMER.md") bytes)"
fi
```

**Source** (lines 34–38): The bash is accurate. The post reformats line 36 across multiple lines with a backslash continuation for readability — the semantics are identical. PASS.

**Claim:** "The guard condition matters: injection only fires if a prompt is already present." TRUE for the framework hook (the `[ -n "$PROMPT" ]` guard is present on line 34). PASS for the framework hook.

---

## Check 4: PRIMER Injection — Juno's Hook (CORRECTION REQUIRED)

**Post states (paragraph following the PRIMER injection section):** "Every entity invocation from a directory with a PRIMER.md gets that context prepended automatically. No entity-specific configuration required." and "The guard condition matters: injection only fires if a prompt is already present. The hook will not convert an interactive session into a non-interactive one just because a PRIMER.md exists."

**Source** (`~/.juno/hooks/executed-without-arguments.sh`, lines 58–61):

```bash
# Inject PRIMER.md from calling directory if present
if [ -f "${CALL_DIR}/PRIMER.md" ]; then
  PROJECT_PRIMER="$(cat "$CALL_DIR/PRIMER.md")"
  PROMPT="$(printf 'Project context (from %s/PRIMER.md):\n%s\n\n---\n\n%s' "$CALL_DIR" "$PROJECT_PRIMER" "$PROMPT")"
fi
```

**Juno's hook does NOT have the `[ -n "$PROMPT" ]` guard.** It injects PRIMER.md unconditionally — even when PROMPT is empty (interactive mode). The framework hook has the guard; Juno's override does not. The post's claim that the guard prevents converting an interactive session into a non-interactive one is ONLY true for the framework hook. For Juno, if called interactively from a directory with a PRIMER.md, the PRIMER is injected before the interactive check runs — making PROMPT non-empty, which would then trigger the non-interactive rejection at line 73 and exit 1 instead of launching interactive Claude.

**FAIL. Correction required.** The post should note that Juno's hook injects PRIMER.md unconditionally (no PROMPT guard), diverging from the framework default. The post currently presents the guard as a universal system property.

---

## Check 5: Interactive Dispatch Command

**Post quotes (under "Mode Dispatch and PID Lock"):**
```bash
exec claude . --model sonnet --add-dir "$CALL_DIR"
```

This matches the **framework hook** (line 69): `exec claude . --model sonnet --add-dir "$CALL_DIR"`. PASS for the framework hook.

**However**, Juno's hook interactive dispatch (line 67) is:
```bash
exec claude . --model sonnet --dangerously-skip-permissions --add-dir "$CALL_DIR"
```

Juno's interactive path includes `--dangerously-skip-permissions`. The post does not quote Juno's interactive command directly — it only quotes the framework hook's interactive dispatch, which is fine in context. But the post later states (under "The Non-Interactive Rejection") that Juno's hook "rejects non-interactive invocations entirely" — the signed policy block confirms this. The omission of `--dangerously-skip-permissions` from the quoted interactive command is not technically wrong (the post is quoting framework behavior, not Juno's), but this is worth clarifying to avoid reader confusion about what Juno's interactive launch actually does.

**STATUS: Minor — not a factual error in context, but worth noting for completeness.**

---

## Check 6: PID Lock

**Post quotes:**
```bash
LOCKFILE="/tmp/entity-${ENTITY}.lock"

if [ -f "$LOCKFILE" ]; then
  LOCKED_PID=$(cat "$LOCKFILE" 2>/dev/null || echo "")
  if [ -n "$LOCKED_PID" ] && kill -0 "$LOCKED_PID" 2>/dev/null; then
    echo "[error] $ENTITY is busy (pid $LOCKED_PID). Try again shortly." >&2
    exit 1
  fi
fi
echo $$ > "$LOCKFILE"
trap 'rm -f "$LOCKFILE"' EXIT
```

**Source** (lines 97–107): The quoted block is accurate but omits an intermediate echo statement at line 103 (`echo "[lock] Cleared stale lockfile"`) and at line 105 (`echo "[lock] Acquired lock: $LOCKFILE (pid: $$)"`). These are debug/status echoes that do not affect the logic. The post omits them for clarity — acceptable editorial simplification. PASS.

**Claim:** "Fail-fast is the design — the caller knows the entity is busy and can decide what to do." Accurate to the code behavior. PASS.

**Claim:** "The lock is cleaned up on EXIT by the trap, whether the session succeeds or fails." Accurate. PASS.

---

## Check 7: Non-Interactive Dispatch

**Post quotes:**
```bash
claude --model sonnet --dangerously-skip-permissions --output-format=json \
  -p "$PROMPT" 2>/dev/null \
  | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('result',''))"
```

**Source** (lines 115–117): verbatim match (reformatted across lines). PASS.

---

## Check 8: Base64 Encoding

**Post quotes:**
```bash
ENCODED=$(printf '%s' "$PROMPT" | base64 -w0 2>/dev/null || printf '%s' "$PROMPT" | base64)
```

**Source** (line 126): verbatim match. PASS.

**Claim:** "The `-w0` flag disables line wrapping on Linux; macOS base64 doesn't accept that flag, so the fallback drops it." Accurate description of what the portable fallback pattern does. PASS.

**Claim:** "The receiving side decodes with `base64 -d`." Source line 128 confirms `base64 -d` is used on the remote side. PASS.

---

## Check 9: GPG-Signed Policy Block

**Post quotes** (lines 129–155 of the post) the signed policy block header with full YAML-style policy fields, rationale, and signature delimiters, abbreviating the base64 signature body as `# ...`.

**Source** (`~/.juno/hooks/executed-without-arguments.sh`, lines 8–46): The quoted policy metadata is verbatim accurate:
- `entity: juno` — PASS
- `file: hooks/executed-without-arguments.sh` — PASS
- `date: 2026-04-04` — PASS
- All four `policy:` lines — verbatim match. PASS
- Full `rationale:` block — verbatim match. PASS

Abbreviating the base64 signature body as `# ...` is editorially appropriate — readers cannot verify the signature from the post anyway and full base64 bodies add noise. PASS.

**Claim:** "Juno's GPG key (`juno@kingofalldata.com`, fingerprint `16EC 6C71 8A96 D344 48EC D39D 92EA 133C 44AA 74D8`)." Cannot verify the fingerprint against a keyring from this review, but the email matches the signing key's UID in the signature header. No contradicting evidence found in source files. PASS (unverified fingerprint, not a red flag).

**Claim:** "The verification command strips the `# ` prefix and pipes to `gpg --verify`." Source lines 9–11 confirm this exactly. PASS.

---

## Check 10: Non-Interactive Rejection in Juno's Hook

**Post quotes:**
```bash
# ── Non-interactive path — rejected ──────────────────────────────────────────
# Juno is not a worker entity. She cannot be remote-triggered via PROMPT.
# Notify via GitHub Issues — she will act when she is ready, just like koad.
echo "juno: remote prompt rejected. File a GitHub issue to notify Juno." >&2
exit 1
```

**Source** (lines 70–74): verbatim match. PASS.

**Claim:** "even if Mercury or Sibyl constructs a PROMPT and pipes it to `juno`, the hook exits 1 before any execution happens." Accurate — the exit 1 is unconditional once PROMPT is non-empty. PASS.

---

## Required Corrections

### Correction 1 (FAIL): Juno's PRIMER injection guard

**Current text:**
> "The guard condition matters: injection only fires if a prompt is already present. The hook will not convert an interactive session into a non-interactive one just because a `PRIMER.md` exists."

**Issue:** This is true of the framework hook but NOT of Juno's hook. Juno's override (`~/.juno/hooks/executed-without-arguments.sh`, line 58) checks only for the file's existence, not for a non-empty PROMPT:

```bash
if [ -f "${CALL_DIR}/PRIMER.md" ]; then
```

The `[ -n "$PROMPT" ]` guard is absent. If `juno` is invoked interactively from a directory containing a `PRIMER.md`, the primer is injected and PROMPT becomes non-empty before the interactive check at line 66, causing the non-interactive rejection at line 73 to fire. The interactive session would fail with "remote prompt rejected" rather than launching Claude.

**Required fix:** Either (a) note that the guard applies only to the framework hook and Juno's override diverges, or (b) qualify the guard-condition paragraph to apply only to the framework hook. A simple addition after "The hook will not convert an interactive session into a non-interactive one just because a PRIMER.md exists" would be: "This guard applies to the framework default. Juno's override injects unconditionally — the guard is omitted."

### Correction 2 (MINOR): Juno's interactive dispatch

Not a factual error in the post as written, but the post quotes the framework's interactive dispatch (`exec claude . --model sonnet --add-dir "$CALL_DIR"`) in a section that applies to "the hook" generically. Juno's interactive dispatch adds `--dangerously-skip-permissions`. If the post intends the quoted command to represent Juno's behavior, it is incomplete. If it represents only the framework hook (as stated in context), it is accurate.

**Recommendation:** Clarify that the quoted interactive dispatch is the framework default. Juno's interactive launch adds `--dangerously-skip-permissions` — consistent with her signed policy block (`interactive: --dangerously-skip-permissions enabled`).

---

## Summary Table

| Check | Claim | Result |
|-------|-------|--------|
| Environment load (lines 4–5) | Verbatim bash, precedence logic | PASS |
| FORCE_LOCAL bypass (lines 45–48) | Verbatim bash | PASS |
| PRIMER injection — framework hook | Verbatim bash, guard condition | PASS |
| PRIMER injection — Juno's hook | Guard condition universalized | FAIL |
| Interactive dispatch command | Framework hook accurate | PASS (with note) |
| PID lock block | Verbatim bash (debug echoes omitted) | PASS |
| Non-interactive dispatch | Verbatim bash | PASS |
| Base64 encoding | Verbatim bash, explanation | PASS |
| GPG-signed policy block | Verbatim policy fields, rationale | PASS |
| Non-interactive rejection | Verbatim bash | PASS |
