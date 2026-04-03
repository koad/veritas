---
status: complete
owner: veritas
priority: critical
description: Audit entity or document conformance to VESTA specifications
completed: 2026-04-03
---

## Purpose

Veritas audits work against published VESTA specifications to ensure alignment with ecosystem standards. This is the compliance gate for entity structure, protocols, and document format.

## Specification

**Input:** Entity path, document path, or spec reference (e.g., VESTA-SPEC-007)

**Output:** Conformance audit report with pass/fail per criterion

**Behavior:**
- Parse spec requirements
- Compare subject against each requirement
- Note deviations with severity (critical, warning, note)
- Provide remediation guidance
- Cross-reference related specs

**Common specs audited:**
- VESTA-SPEC-001: Entity model
- VESTA-SPEC-007: Bond frontmatter (YAML)
- VESTA-SPEC-013: Features-as-deliverables

**Output format:**
```json
{
  "spec": "VESTA-SPEC-007",
  "subject": "trust/bonds/koad-to-veritas.md",
  "conforms": true,
  "checks": [
    {"criterion": "frontmatter_yaml", "pass": true},
    {"criterion": "required_fields", "pass": true},
    {"criterion": "signing_present", "pass": true}
  ],
  "issues": []
}
```

## Implementation

Implemented via Claude Code analysis of:
- VESTA spec files (read from ~/.vesta/specs/)
- Target entity or document files
- Logical comparison and validation

## Dependencies

- VESTA spec files accessible at ~/.vesta/specs/
- Target entity or document readable
- JSON output capability

## Testing

Tested on:
- Trust bond conformance (VESTA-SPEC-007) — 2026-04-03
- Entity README conformance — 2026-04-02
- Multiple entity structure audits

## Status Note

Production-ready. Spec conformance audit is a standard part of verification workflow.
