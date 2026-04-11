# Vesta Spec Triage — 2026-04-10

**Reviewer:** Veritas (via Juno dispatch)
**Scope:** Numbered promoted specs (19) + legacy named specs (~32) in `~/.vesta/specs/`
**Method:** Triage scan — frontmatter, cross-refs, ID collisions, framework reality checks. Not deep editorial.
**Out of scope:** All `status: draft` and `status: draft-50k` specs; VESTA-SPEC-069 (party-line, landed within the hour).

---

## Severity 1 — load-bearing issues

These contradict reality, contradict each other, or would mislead any implementer reading the corpus.

### S1-1. VESTA-SPEC-020 ID collision — two specs, different subjects, both claim the same number

- `specs/VESTA-SPEC-020-hook-architecture.md` — `status: canonical`, title "Entity Hook Architecture"
- `specs/authenticator-key-wallet-protocol.md` — `id: VESTA-SPEC-020`, `status: draft`, title "koad:io Authenticator — Sovereign Signing Protocol"

Downstream consequence: `VESTA-SPEC-057-sigchain-json-format.md` (canonical) references `VESTA-SPEC-020 (authenticator-key-wallet-protocol — merkle tree model)` as the authority for its merkle tree model. Any reader following that reference to the VESTA-SPEC-020 numbered file lands on the hook architecture spec, which says nothing about merkle trees. SPEC-057's normative dependency is effectively unreachable via the number.

Recommendation: Either renumber authenticator-key-wallet-protocol to an unused slot (and update SPEC-057's reference), or renumber the hook architecture spec. One of the two must move.

### S1-2. VESTA-SPEC-008 three-way collision — three canonical specs share the same number

- `specs/cross-harness-identity.md` — `spec-id: VESTA-SPEC-008`, canonical, "Cross-Harness Identity Unification"
- `specs/inter-entity-comms-protocol.md` — `id: VESTA-SPEC-008`, canonical, "Inter-Entity Communications Protocol"
- `specs/spawn-protocol.md` — `id: VESTA-SPEC-008`, canonical, "Spawn Protocol — Entity Process Launch, Isolation, and Lifecycle"

Three distinct, authoritative specs, same number. Any "see VESTA-SPEC-008" reference is ambiguous. REGISTRY.md does not disambiguate.

### S1-3. VESTA-SPEC-009 collision

- `specs/daemon-specification.md` — `id: VESTA-SPEC-009-DAEMON` (hyphenated suffix), canonical
- `specs/hooks-catalog.md` — `spec-id: VESTA-SPEC-009` (no suffix), canonical
- `specs/VESTA-SPEC-020-hook-architecture.md` §1 says: *"Relationship to VESTA-SPEC-009 (Hooks Catalog)"*
- `specs/VESTA-SPEC-045-daemon-dashboard-data-contract.md` repeatedly references `VESTA-SPEC-009-DAEMON`

The `-DAEMON` suffix pattern is a one-off workaround that neither other specs nor the registry honor consistently. Readers interpreting "SPEC-009" could land on either file.

### S1-4. VESTA-SPEC-011 three-way collision

- `specs/cross-harness-entity-diagnostic-protocol.md` — `id: VESTA-SPEC-011`, canonical, `owner: argus`, extends SPEC-010
- `specs/external-entity-onboarding.md` — `spec-id: VESTA-SPEC-011`, canonical
- `specs/signing-identity-saltpack.md` — `spec-id: VESTA-SPEC-011`, canonical

Three canonicals at one number. The argus-owned spec here is also the only Vesta-domain file with a non-vesta owner — separate flag below.

### S1-5. VESTA-SPEC-012 collision — canonical vs draft

- `specs/entity-startup.md` — `spec-id: VESTA-SPEC-012`, canonical (the one CLAUDE.md and session-start protocols actually reference)
- `specs/entity-harness-portability-protocol.md` — `id: VESTA-SPEC-012`, draft

The draft shouldn't be reviewed here, but the ID collision means even draft specs in `~/.vesta/specs/` are stepping on canonical numbers. Needs unique number assignment before promotion.

### S1-6. VESTA-SPEC-015 collision

- `specs/alice-graduation-certificate-protocol.md` — `spec-id: VESTA-SPEC-015`, canonical
- `specs/keybase-saltpack-identity-protocol.md` — `spec-id: VESTA-SPEC-015`, canonical

Two canonicals, wildly different subjects, same number.

### S1-7. SPEC-005 v1.1 reality mismatch — env var rename never propagated to the framework

`specs/cascade-environment.md` v1.1 changelog (2026-04-07) states:

> Renamed `PRIMARY_ENTITY` → `KOAD_IO_PRIMARY_ENTITY`, `METEOR_PACKAGE_DIRS` → `KOAD_IO_PACKAGE_DIRS`. Resolves koad/vesta#87.

Framework reality (verified 2026-04-10):

```
/home/koad/.koad-io/.env:
  PRIMARY_ENTITY=alice
  METEOR_PACKAGE_DIRS=$HOME/.ecoincore/packages:...
```

Zero references to `KOAD_IO_PRIMARY_ENTITY` or `KOAD_IO_PACKAGE_DIRS` exist anywhere under `~/.koad-io/`. The spec says the rename happened. The framework disagrees. Either the rename needs to actually land, or the spec needs to be walked back. This is the kind of drift that breaks entity startup when someone reads the spec and codes against it.

### S1-8. Canonical specs normatively depending on draft specs

Canonical Alice specs declare normative dependencies on specs that are still `status: draft`:

- `VESTA-SPEC-044-alice-conversation-protocol.md` (canonical) → VESTA-SPEC-025 (draft), VESTA-SPEC-026 (draft)
- `VESTA-SPEC-048-alice-entity-architecture.md` (canonical) → VESTA-SPEC-025 (draft), VESTA-SPEC-026 (draft). §1 explicitly says: *"Status: Canonical. Depends on VESTA-SPEC-044 for session state file formats. Depends on VESTA-SPEC-025 for curriculum bubble content structure."*
- `VESTA-SPEC-049-alice-cli-interface.md` (canonical) → VESTA-SPEC-025 (draft)

A canonical spec cannot have a normative dependency on a draft; the dependency inherits the weaker status. Either promote 025/026 or walk 044/048/049 back to `adopted`/`review` until the dependencies land.

### S1-9. Six legacy canonical specs are not in REGISTRY.md

These files exist on disk with `status: canonical` frontmatter but are missing from REGISTRY.md's "Named Specs (legacy)" table:

- `specs/gestation-protocol.md` — VESTA-SPEC-002
- `specs/hooks-catalog.md` — VESTA-SPEC-009
- `specs/keybase-saltpack-protocol.md` — (no ID field; distinct file from `keybase-saltpack-identity-protocol.md`)
- `specs/kingdom-peer-connectivity-protocol.md` — VESTA-SPEC-014
- `specs/sovereign-device-onboarding-protocol.md` — VESTA-SPEC-019
- `specs/spawn-protocol.md` — VESTA-SPEC-008

REGISTRY.md is used as the authoritative index. Authoritative specs that are not in the index are invisible to process. Also note `keybase-saltpack-protocol.md` vs `keybase-saltpack-identity-protocol.md` — different files, overlapping subject, one registered and one not.

---

## Severity 2 — drift and inconsistency

### S2-1. Frontmatter key inconsistency: `id:` vs `spec-id:`

Across the corpus the spec number is stored under inconsistent keys:

- `id: VESTA-SPEC-NNN` — most newer specs
- `spec-id: VESTA-SPEC-NNN` — several older legacy specs (entity-startup, cross-harness-identity, hooks-catalog, keybase-saltpack-identity-protocol, signing-identity-saltpack, external-entity-onboarding, entity-public-accounts, alice-graduation-certificate-protocol)

Any tooling that greps `^id:` will miss half the corpus; any that greps `^spec-id:` will miss the other half. Pick one canonical key and fix the others.

### S2-2. SPEC-020 `superseded-by: TBD` shipped as canonical

`specs/VESTA-SPEC-020-hook-architecture.md` line 11:

```
superseded-by: TBD (daemon worker system — see Section 8)
```

A `TBD` field in frontmatter of a `status: canonical` spec. Either remove the field until the successor exists, or point at the successor if one was chosen.

### S2-3. `related-issues: [koad/vesta#XX]` placeholder shipped

`specs/alice-graduation-certificate-protocol.md` line 9:

```
related-issues: [koad/juno#8, koad/vesta#XX]
```

Literal `XX` placeholder in a canonical spec's frontmatter. Either fill in or remove.

### S2-4. Owner field drift in Vesta's own corpus

`specs/cross-harness-entity-diagnostic-protocol.md` (canonical, one of the SPEC-011 triplet) has `owner: argus`. Every other spec in the corpus has `owner: vesta`. If this spec is genuinely Argus-owned it should probably live in Argus's repo, or the owner field needs a convention (originator vs steward).

### S2-5. Gaps in numbering per REGISTRY.md's own notes

REGISTRY.md notes:

> Gaps in VESTA-SPEC numbering (021–026, 039–043) indicate specs written before this registry existed or assigned via external issue references. They will be catalogued on next audit.

Those gaps partially filled since (039–043 now exist as numbered files), but 021–024 still unassigned and several collide with legacy IDs (008, 009, 011, 012, 015, 020). The "next audit" is overdue.

### S2-6. Legacy-spec `id:` fields don't match the REGISTRY label

REGISTRY.md labels legacy specs with their filename but sometimes adds the number parenthetically (e.g., `Curriculum Bubble Spec (VESTA-SPEC-025)`, `Entity Startup Specification (VESTA-SPEC-012)`), sometimes doesn't. The parenthetical convention is inconsistent and readers can't tell whether a legacy spec has been numbered or not without opening it.

### S2-7. Terminology: `context bubble` vs `curriculum bubble` vs `workspace`

- `specs/context-bubble-protocol.md` defines the base "context bubble" format
- `specs/curriculum-bubble-spec.md` claims to be an extension (subtype) of context bubble
- `specs/VESTA-SPEC-044-alice-conversation-protocol.md` and `VESTA-SPEC-048` use the term `session` for related state but don't cleanly delimit it from bubble vocabulary
- `specs/VESTA-SPEC-058-koad-io-breadcrumbs.md` introduces "workspace" as a third concept (shared filesystem context directory)
- `specs/VESTA-SPEC-068-koad-io-workspace-folder.md` (draft, out of scope) overlaps again

Not wrong — but the boundary between "context bubble" (portable session record), "curriculum bubble" (learning content), and "workspace" (shared folder context) is fuzzy enough that a reader new to the corpus would conflate them. A one-paragraph glossary in REGISTRY.md or a dedicated terminology spec would help.

---

## Severity 3 — nits and observations

### S3-1. SPEC-044 references `koad/vesta#XX`-style nothing-burger

No actual `XX` in SPEC-044 but it references `~/.muse/briefs/alice-ui-design-brief.md` without a commit pin. Brief path references can rot silently. Low priority but worth noting.

### S3-2. `specs/features-as-deliverables.md` line 157

```
- Entity backup protocol (TBD)
```

Minor TBD marker in canonical spec body. Low impact.

### S3-3. `VESTA-SPEC-039-trust-public-chain-json.md` §3.2 says command spec is TBD

> command spec TBD, follows VESTA-SPEC-006 commands pattern

Promoted spec with a TBD command spec. Low impact if the command interface is stable elsewhere.

### S3-4. `VESTA-SPEC-042-entity-intro-video-format.md` has TBD rows in episode table

Not load-bearing; it's legitimately placeholder content in a deliverables list.

### S3-5. SPEC-020 Section 1 architectural-note vs reality

> **Architectural note:** The daemon runs in the user's shell context, so hooks can interact with the full environment

The daemon is currently not running in many deployments (dotsh ready, others pending per memory). SPEC-020 assumes hooks run under daemon context, but the actual executed-without-arguments.sh in live entities (checked `~/.juno/hooks/executed-without-arguments.sh`) delegates to `~/.koad-io/harness/startup.sh` per VESTA-SPEC-067 (currently draft) — not the daemon worker system. SPEC-020 is drifting from the lived pattern. Not urgent but the lived pattern is SPEC-067's territory and SPEC-067 is still draft; that's a gap someone should close after 067 promotes.

---

## Specs that need deep review

- **`specs/authenticator-key-wallet-protocol.md`** — ID collision with canonical SPEC-020 (hook architecture). Also authored by "Juno (from direct description by koad)" while all other specs are Vesta-authored. Status is draft but SPEC-057 already depends on it normatively. Needs Vesta's pass.
- **The SPEC-008/009/011 collision cluster** — three specs deep per number. Someone needs to renumber deliberately and update all cross-references. Not triage work.
- **`specs/VESTA-SPEC-020-hook-architecture.md` vs lived hook reality** — the hook code in `~/.juno/` follows VESTA-SPEC-067 (draft), not SPEC-020's pattern. Canonical spec describing non-current practice is worst-case drift.

## Specs that look clean

Scanned and no concerns:

- `specs/VESTA-SPEC-027-cid-privacy-primitive.md` — stable, self-contained, cross-refs light
- `specs/VESTA-SPEC-034-package-layer.md` — canonical, recently changelog-updated, structure solid, framework paths verified (`~/.koad-io/packages/` exists)
- `specs/VESTA-SPEC-038-entity-host-permission-table.md` — canonical, narrow scope, clean refs
- `specs/VESTA-SPEC-045-daemon-dashboard-data-contract.md` — canonical, explicitly scoped as extension of SPEC-009-DAEMON (consistent with itself, minus the SPEC-009 collision issue above)
- `specs/VESTA-SPEC-046-mvp-zone-ops-digest-format.md` — canonical, narrow deliverable format spec
- `specs/VESTA-SPEC-047-alice-session-sync-model.md` — constraint-documented, explicitly documents a boundary rather than prescribing, clean
- `specs/VESTA-SPEC-051-primer-convention.md` — canonical, cleanly written, matches observed entity PRIMER.md files
- `specs/VESTA-SPEC-053-entity-portability-contract.md` — canonical, matches observed practice
- `specs/VESTA-SPEC-054-multi-entity-orchestration.md` — canonical, matches Juno's orchestration memory
- `specs/VESTA-SPEC-055-trust-bond-file-format.md` — canonical, narrow format spec, clean
- `specs/VESTA-SPEC-058-koad-io-breadcrumbs.md` — recently promoted to adopted (2026-04-10), self-consistent
- `specs/VESTA-SPEC-059-walled-garden.md` — recently promoted to adopted (2026-04-10), explicitly resolved the PEER_LISTEN conflict with SPEC-014 v1.2, exemplary drift resolution
- `specs/VESTA-SPEC-065-operator-entity-shorthand.md` — canonical, narrow scope
- `specs/VESTA-SPEC-066-skeleton-spawn-convention.md` — canonical, narrow scope, matches Rooty-era lineage

---

## Method notes

- Enumerated promoted specs via `grep -l "^status: \(canonical\|adopted\|stable\|constraint-documented\)" specs/VESTA-SPEC-*.md` — 19 hits.
- Dumped frontmatter of all 19 in one pass; scanned for ID, status, cross-ref, version, and superseded-by fields.
- Dumped `id:` / `spec-id:` for all 32 legacy named specs in one pass to detect number collisions. This surfaced the entire S1-1 through S1-6 cluster.
- Cross-checked SPEC-005 v1.1 env var rename against actual `~/.koad-io/.env` and `grep -rn KOAD_IO_PRIMARY_ENTITY ~/.koad-io/` (zero hits).
- Cross-checked SPEC-058 workspace path convention against live entity hook (`~/.juno/hooks/executed-without-arguments.sh`).
- Verified SPEC-014 v1.2 did resolve the PEER_LISTEN / 0.0.0.0 conflict with SPEC-059 — that one is closed. No outstanding PEER_* drift.
- Verified framework paths claimed by specs (`~/.koad-io/packages`, `commands`, `daemon`, `hooks`) all exist.
- Did NOT read spec bodies line-by-line. Frontmatter + section headings + spot-checks of normative references only. Any spec in "looks clean" was scanned at that depth — not audited exhaustively.
- Did NOT touch any file in `~/.vesta/`. Read-only pass.
- Draft specs (028–033, 035–037, 050, 052, 056, 060–064, 067–069) were NOT reviewed, per task scope. Where a canonical spec normatively depends on a draft, that is reported as S1-8 without reviewing the draft itself.

---

**Confidence summary:**
- S1 findings: CONFIRMED. All 9 are verifiable by re-running the greps in the method notes.
- S2 findings: CONFIRMED for frontmatter issues; S2-7 (terminology) is SPECULATIVE — a reader-experience observation, not an error.
- S3 findings: CONFIRMED text-level observations; impact assessment is the reviewer's judgment.

*End of triage report. No specs modified. Report this to Juno for routing to Vesta via koad/vesta GitHub issue.*
