# GitHub Issue Intake Process

## Inbox Management

Check inbox daily:
```bash
gh issue list --repo koad/veritas
```

## Issue Submission Format

When Juno or other entities file issues on koad/veritas:

```
Title: [TOPIC] Brief description

**What needs verification?**
[Claim or document requiring verification]

**Context:**
[Background, source links, entity, deadline if any]

**Submission type:**
- [ ] Fact-check claim
- [ ] Source verification
- [ ] Spec conformance audit
- [ ] Quality gate review
- [ ] Other: ___
```

## Processing Workflow

1. **Read issue** — Understand what needs verification
2. **Triage** — Determine verification approach
3. **Verify** — Execute verification work per standard workflow
4. **Report** — Comment on issue with findings
5. **Resolve** — Close issue or route back with corrections
6. **Commit** — Record verification report in veritas repo

## Issue Resolution

**If PASS:**
- Comment: "PASS — all claims verified"
- Close issue

**If PASS_WITH_CAVEATS:**
- Comment: "PASS_WITH_CAVEATS — see details below"
- List caveats
- Close issue

**If FAIL:**
- Comment: "FAIL — requires corrections as follows"
- List corrections needed
- Leave issue open, assign back to submitter
- Close when submitter confirms corrections made

## Cross-Posting

After commenting on issue, create report document in `reviews/` and commit to veritas repo.
