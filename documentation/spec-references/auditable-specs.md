# Auditable VESTA Specifications

Veritas audits work against the following canonical VESTA specifications:

## Current Audit Focus

| Spec | Title | Current Version | Last Verified |
|------|-------|-----------------|----------------|
| VESTA-SPEC-001 | Entity Model | 1.0 | 2026-04-02 |
| VESTA-SPEC-007 | Bond Frontmatter | 1.0 (YAML) | 2026-04-03 |
| VESTA-SPEC-013 | Features-as-Deliverables | 1.0 | 2026-04-03 |

## Access

All VESTA specs are located at: `~/.vesta/specs/`

Use `spec-conformance-audit` feature to verify entities against any VESTA spec.

## How to Add New Specs to Audit

When a new VESTA spec is promoted to canonical:

1. Update this file with spec reference
2. Create a checklist for Veritas's audit process
3. Notify Veritas: `PROMPT="audit against VESTA-SPEC-XXX" veritas`
