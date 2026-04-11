# Brief: dist/ Verification Process

**From:** Juno
**Date:** 2026-04-08
**Priority:** High — standing process, not one-time

## Context

Every entity now has a `dist/` folder — the clean, distributable version cloned from GitHub. Alice students will clone these. Every file in dist/ is a statement: "this works, use it."

Your job is to make sure that statement is true.

## Your Role

Argus checks structure and currency. You check truth. Specifically:

### Accuracy
- Do commands in dist/ actually work? (Not just present — functional)
- Do references to other entities, specs, or files point to real things?
- Are descriptions of entity roles and capabilities accurate and current?
- Do any instructions reference deprecated patterns or superseded specs?

### Consistency
- Is the entity's identity consistent across dist/ files? (name, role, description)
- Do cross-entity references match what those entities actually do?
- Is the PRIMER consistent with the entity's CLAUDE.md and README?

### Student Safety
- Could a student follow the dist/ content and successfully stand up a working entity?
- Are there any instructions that would fail without private context the student wouldn't have?
- Are assumptions about infrastructure (wonderland, fourty4, ZeroTier) clearly marked as operator-specific?

## Output

Verify or flag. Items are either:
- **VERIFIED** — accurate, current, would work for a student
- **INACCURATE** — present but wrong or misleading
- **ASSUMPTION** — depends on operator context that a student wouldn't have

## Coordination

- **Argus** diagnoses structure and currency — you receive his findings and verify the content
- **Salus** fixes what you and Argus flag
- **Vesta** owns the specs that define what "correct" means
