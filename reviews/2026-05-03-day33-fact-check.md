---
date: 2026-04-05
reviewer: veritas
subject: Day 33 fact-check
file: ~/.faber/posts/2026-05-03-the-operations-board.md
status: APPROVED-WITH-NOTES
---
# Day 33 Fact-Check

## Verdict: APPROVED-WITH-NOTES

One claim requires correction before publication. Five claims pass cleanly.

---

## Claim 1: "Seventeen entities" — FLAG: UNVERIFIED COUNT

**Post text:** Title and body both state "Seventeen entities. Three machines."

**Source check:** No canonical document in the repository states seventeen entities. The consistent figure across all current source files is **fifteen**:

- `CLAUDE.md` (current): "15 entities migrated to fourty4 HQ"
- `BUSINESS_MODEL.md`: "15 entities doing real work"
- `METRICS/2026-04-04-baseline.md`: "HQ for all 15 entities"
- `memories/project_juno_state.md`: "Team: 15 entities active + Alice in building"
- Multiple session logs (day-4, day-5, day-6): consistently reference 15 entities

The entity directories present on thinker as of 2026-04-05 include: aegis, alice, argus, chiron, copia, faber, iris, janus, juno, livy, lyra, mercury, muse, rufus, salus, sibyl, veritas, vesta, vulcan (19 total). However, several of these are pending gestation or very recently bootstrapped. The `TEAM_STRUCTURE.md` status table (last updated 2026-03-31) lists 13 entities. The Sibyl brief does not cite a source for "seventeen" — it uses the phrasing in the recommended post title without verification.

**The "seventeen" figure appears nowhere in any source document.** The Sibyl brief introduced it as framing without grounding it.

**Required correction:**

Change "Seventeen entities" to **"fifteen entities"** throughout the post (title + body), matching the figure consistently used across CLAUDE.md, BUSINESS_MODEL.md, and session logs.

- Title: "The Operations Board: How One Human Watches ~~Seventeen~~ Fifteen Entities Without Losing His Mind"
- Line 22: "~~Seventeen~~ Fifteen entities. Three machines."
- Line 114: "One human watching ~~seventeen~~ fifteen entities:"

---

## Claim 2: VESTA-SPEC-054 §7 description — PASS

**Post text (line 38):** Attributes to §7 the description of issues as mechanism for work that "spans sessions, involves Vulcan, requires a shared reference point for blocked koad actions, or needs to remain visible on the operations board."

**Source check:** VESTA-SPEC-054 §7.2 lists exactly these criteria for GitHub Issues. The description is an accurate paraphrase, not a direct quote, and is attributed correctly.

---

## Claim 3: VESTA-SPEC-054 §7.3 decision rule — PASS

**Post text (line 38):** Quotes §7.3 as: "If the work will be done in this session and Juno will see the result before moving on — use the Agent tool. If the work spans sessions, requires koad action, involves Vulcan, or needs to remain visible on the operations board — use a GitHub Issue."

**Source check:** This is verbatim from VESTA-SPEC-054 §7.3. Exact match confirmed.

---

## Claim 4: gh command examples — PASS

**Post text (lines 49–70):** Three `gh` command blocks presented as the actual protocol from `OPERATIONS.md`.

**Source check:** All three blocks (koad creates issue on koad/juno, Juno creates on koad/vulcan + references parent, Vulcan comments back) match `OPERATIONS.md` verbatim, including the issue number (42), commit reference (abc1234), and delegation issue number (koad/vulcan#7). The post correctly notes "These are not illustrative examples — they are the actual `gh` commands the system uses." This attribution is accurate.

---

## Claim 5: koad→Juno bond reporting protocol quote — PASS

**Post text (lines 126–131):** Quotes the reporting protocol as three numbered items ending with "Koad reviews at his discretion. Juno does not wait for approval on in-scope actions."

**Source check:** Verbatim match against `~/.juno/trust/bonds/koad-to-juno.md` Reporting Protocol section (lines 48–54). The numbering, wording, and closing sentence are exact.

**Note:** The post also paraphrases this bond at line 22 as: "Koad reviews at his discretion. Juno does not wait for approval on in-scope actions." — this is a direct quote, not a paraphrase, and is accurate.

**Secondary check — `needs-koad` label (line 110):** The post attributes `needs-koad` to the bond file: "the koad→Juno bond specifies that Juno surfaces 'decisions requiring koad approval as GitHub Issues tagged `needs-koad`.'" This is confirmed in the bond (line 52). The label `needs-koad` does not appear in the OPERATIONS.md taxonomy — the attribution to the bond (not the label list) is correct.

---

## Claim 6: Six labels taxonomy — PASS

**Post text (lines 83–89):** Lists six labels as the complete taxonomy from `OPERATIONS.md`.

**Source check:** The six labels match `OPERATIONS.md` exactly — same labels, same descriptions, same order. The post's characterization of this as six entries is accurate.

---

## Summary of Required Corrections

| # | Location | Issue | Correction |
|---|----------|-------|-----------|
| 1 | Title | "Seventeen" → "Fifteen" | Change to match CLAUDE.md canonical count |
| 2 | Line 22 | "Seventeen entities" → "Fifteen entities" | Same |
| 3 | Line 114 | "seventeen entities" → "fifteen entities" | Same |

All other claims are factually accurate and sourced correctly. The post is otherwise publication-ready.

---

*Reviewed by Veritas, 2026-04-05. Sources: ~/.juno/OPERATIONS.md, ~/.juno/GOVERNANCE.md, ~/.juno/trust/bonds/koad-to-juno.md, ~/.juno/CLAUDE.md, ~/.vesta/specs/VESTA-SPEC-054-multi-entity-orchestration.md, ~/.sibyl/research/2026-04-05-day33-brief.md.*
