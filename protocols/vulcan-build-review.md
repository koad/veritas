# Vulcan Build Review Protocol
**Effective:** 2026-04-03  
**Veritas Standing Checklist for Pre-Release Review**  
**Version:** 1.0

---

## Overview

Vulcan ships product (kingofalldata.com MVP, daemon, inter-entity comms). Veritas reviews every build before it goes live using this standing checklist. Vulcan files an issue on `koad/veritas` when a build is ready for review; Veritas checks against this protocol and comments with verdict (CONFIRMED / FLAGGED / BLOCKED).

---

## Pre-Review Intake

When Vulcan files a build review issue on `koad/veritas`:

- [ ] Issue title follows format: `vulcan-build-review: [product-name] [version] [date]`
- [ ] Issue includes: build artifact(s), changelog, deployment target, any claims made to users
- [ ] All materials are findable and linked in the issue (or attached)

---

## Review Checklist

### 1. Security

**Objective:** No hardcoded credentials, no exposed keys, no boundary validation failures.

- [ ] **No hardcoded secrets**: Grep for AWS keys, API tokens, private keys, SSH secrets, database credentials
  - Pattern check: `(AKIA|sk-|password|token|secret|key).*[a-zA-Z0-9]{20,}`
  - Tool: `grep -r` or automated secret scanning
  - **Verdict:** PASS / FLAG
  
- [ ] **No exposed cryptographic keys**: Check for unencrypted private keys in build artifacts
  - Look for: `*.pem`, `*.key`, `*.p8`, `*.jks`, Ed25519 or ECDSA private key patterns
  - Acceptable: public keys only (`.pub`, `.crt`)
  - **Verdict:** PASS / FLAG
  
- [ ] **Input validation at boundaries**:
  - Does the build accept user input (CLI args, API params, file uploads, network data)?
  - Is input validated before use? (type checking, length limits, format validation)
  - Are dangerous operations (exec, eval, shell escapes, SQL queries) protected?
  - **Verdict:** PASS / FLAG / REQUIRES DETAIL
  
- [ ] **No hardcoded URLs to untrusted sources**:
  - Look for: download URLs, webhook endpoints, external API calls
  - Are they production URLs or staging URLs?
  - Are they verifiable and intentional?
  - **Verdict:** PASS / FLAG

**Exit:** If any FLAG, build is BLOCKED until resolved. Do not proceed to remaining checks.

---

### 2. Claims Verification

**Objective:** User-facing text and marketing copy contain only verifiable, sourced claims.

- [ ] **Identify all factual claims**: README, help text, splash screens, documentation, marketing materials
  - What does the build claim to do?
  - What problem does it solve?
  - Any comparisons to competitors?
  - Any performance/accuracy claims (speed, uptime, scale)?
  
- [ ] **Verify claims are accurate**:
  - Does the build actually do what's claimed?
  - Are benchmark claims independently verifiable?
  - Do competitive claims align with current market state? (Run web search if necessary)
  - **Verdict:** PASS / SPECULATIVE / FLAGGED
  
- [ ] **Check for unfounded promises**:
  - Any revenue claims? (HARD STOP per CLAUDE.md)
  - Any deadline claims? (HARD STOP per CLAUDE.md)
  - Any guarantees without caveats? (e.g., "always," "guaranteed," "never fails")
  - **Verdict:** PASS / BLOCKED

**Exit:** If FLAGGED claims or HARD STOP violations, build is BLOCKED until claims are removed or sourced. SPECULATIVE claims are flagged for Juno review but do not block.

---

### 3. Protocol Compliance

**Objective:** The build adheres to koad:io's operational protocols (Vesta comms, spawn protocol, trust chain, entity identity).

- [ ] **Vesta Protocol Compliance** (inter-entity communication):
  - Does the build communicate with other entities?
  - If yes: Does it use Vesta's message format, signing, and routing?
  - Check: message envelopes, signatures, entity identity headers
  - **Verdict:** PASS / NON-APPLICABLE / FLAG
  - [Reference: Vesta spec at ~/.koad-io/specs/vesta.md or similar]

- [ ] **Spawn Protocol** (entity creation and initialization):
  - Does the build spawn new agents or entities?
  - If yes: Does it use the spawn protocol (identity creation, key generation, trust chain bonding)?
  - **Verdict:** PASS / NON-APPLICABLE / FLAG
  - [Reference: Spawn protocol spec]

- [ ] **Trust Chain and Entity Identity**:
  - Does the build create, sign, or validate trust bonds?
  - If yes: Are keys stored on the owner's hardware (not centralized)?
  - Are signatures using koad:io canonical algorithms (Ed25519, ECDSA, RSA, DSA)?
  - **Verdict:** PASS / NON-APPLICABLE / FLAG
  
- [ ] **Configuration and State**:
  - Does the build follow koad:io file-based configuration?
  - Is state stored locally (files on disk)?
  - No cloud APIs for core state? (Acceptable: optional cloud integrations, clearly marked)
  - **Verdict:** PASS / NON-APPLICABLE / FLAG

**Exit:** If any FLAG on applicable protocols, build is BLOCKED until compliant.

---

### 4. Functional Correctness

**Objective:** Documentation accurately describes what was built; no known bugs or incomplete features.

- [ ] **README accuracy**:
  - Does the README describe what the build does?
  - Are examples accurate? (Try running them if possible)
  - Are installation/deployment instructions complete and tested?
  - **Verdict:** PASS / PARTIAL / BLOCKED
  
- [ ] **Feature completeness**:
  - Are all claimed features shipped, or are some behind flags?
  - If features are incomplete: are they clearly marked as experimental or flagged?
  - No shipping half-baked features as finished?
  - **Verdict:** PASS / PARTIAL / BLOCKED
  
- [ ] **Known issues and caveats**:
  - Does the README list known limitations?
  - Are there open bugs that should block release?
  - **Verdict:** PASS / CAUTION / BLOCKED
  
- [ ] **Test coverage (if applicable)**:
  - Are unit tests present and passing?
  - Are integration tests passing?
  - **Verdict:** PASS / PARTIAL / BLOCKED

**Exit:** If BLOCKED, build stays in staging until resolved.

---

## Verdict Framework

After checking all applicable sections, Veritas reports:

| Verdict | Meaning | Action |
|---------|---------|--------|
| **APPROVED** | All checks PASS, no flags. Build is ready for production deployment. | Vulcan ships. |
| **APPROVED WITH CAVEATS** | Checks PASS; SPECULATIVE claims noted but acceptable. Build ready to ship with caveat comments in issue. | Vulcan ships + Veritas comment detailing caveats. |
| **FLAGGED** | Checks found issues (unverified claims, protocol gaps, documentation errors). Build ready to ship if Vulcan explicitly acknowledges and accepts flags. | Vulcan decides: fix or ship-as-flagged. Veritas comments with full list of flags. |
| **BLOCKED** | Security issues, hard stops (revenue claims, deadline claims), or unresolved protocol violations. Build cannot ship without fixes. | Vulcan must resolve before resubmit. Veritas blocks and lists required fixes. |

---

## Reporting

**Comment format on GitHub issue:**

```
## Veritas Build Review: [Product] [Version]

**Verdict:** [APPROVED / APPROVED WITH CAVEATS / FLAGGED / BLOCKED]

### Security
- [Status]: [Finding]

### Claims Verification
- [Status]: [Finding]

### Protocol Compliance
- [Status]: [Finding]

### Functional Correctness
- [Status]: [Finding]

**Summary:** [1-2 sentences on overall assessment]

**Next steps:** [If blocked: list required fixes. If approved: deployment ready.]

---
*Reviewed by Veritas on [DATE]  
Report: ~/.veritas/reviews/[DATE]-vulcan-[product].md*
```

---

## Roles and Escalation

- **Vulcan** files issue with build details
- **Veritas** reviews and comments with verdict
- **Juno** makes final ship/no-ship decision if Veritas reports FLAGGED (not BLOCKED)
- **Argus** gates on public messaging if Veritas flags claims

---

## Standing Protocol Updates

This protocol is review-ready on demand. To update:

1. Vulcan or Juno files issue on `koad/veritas` with proposed changes
2. Veritas reviews and comments with recommendation
3. Juno approves changes
4. Veritas updates this file and pushes commit

---

**Protocol Owner:** Veritas  
**Last Updated:** 2026-04-03  
**Status:** ACTIVE
