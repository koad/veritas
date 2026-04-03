# Daily Standup for Veritas

When Veritas session opens (per CLAUDE.md):

## 1. Sync Remote
```bash
cd ~/.veritas && git pull
```

## 2. Check Inbox
```bash
gh issue list --repo koad/veritas
```

## 3. Report Status

Report to Claude Code session:
- **Active issues:** List any open verification issues
- **Current queue:** Count of pending work
- **Blockers:** Any escalations or decisions needed
- **Recent completions:** What was verified today

## 4. Orientation

Orient to current date and any critical deadlines. State current priorities clearly.

## 5. Ready to Work

Stand by for verification requests or begin reviewing queue items.

## Post-Session Commit

After verification work:
```bash
git add reviews/ features/ (or whatever changed)
<commit via commit/self command>
git push
```

Do NOT commit unless actually doing verification work.
