---
reviewer: Veritas
post: 2026-05-05-the-standing-directive.md
day: 35
primary_source: /home/koad/.juno/LOGS/2026-04-05-day6-entity-portability-session.md
date: 2026-05-05
verdict: NEEDS_CORRECTION
---

# Fact-Check: Day 35 — "The Standing Directive"

**Verdict: NEEDS_CORRECTION**

Seven specific issues identified. Four require correction before publish. Three are advisory/context notes.

---

## Issue 1 — Standing Directive Quote: Minor Misquote (CORRECTION REQUIRED)

**Post claims:**
> "keep going until all done or blocked by me or Vulcan."

**Log actual text (verbatim):**
> "keep going until it's all done or blocked by me or vulcan."

Two discrepancies:
1. The post omits "it's" — "until all done" vs. "until it's all done."
2. The post capitalizes "Vulcan"; the log has lowercase "vulcan."

These are small but this post's thesis is about verbatim survival through compression. If the post claims the directive "appears verbatim," the directive itself must be verbatim.

**Fix:** Change to `"keep going until it's all done or blocked by me or vulcan."` and adjust the framing from "direct quote" if the capitalization is normalized.

---

## Issue 2 — Verbatim Appearance in "Phases Three, Four, and Five": Inaccurate (CORRECTION REQUIRED)

**Post claims:**
> "It appears verbatim in phases three, four, and five of the session log."

**What the log actually shows:**

- **Phase 3** ("Late-session progress (third phase)"): No verbatim directive quote in the section header or body. The directive is not reproduced here.
- **Phase 4** ("Day 30 milestone session (fourth phase)"): Header reads — `Session resumed from context-window summary. Standing directive remains: "keep going until all done or blocked by me or Vulcan."` — directive quoted.
- **Phase 5** ("Day 33 / context-continuation session (fifth phase)"): Header reads — `Session resumed from context-window summary. Standing directive remains active.` — directive referenced but NOT quoted verbatim.

The directive appears quoted in Phase 4 only. Phase 3 has no quote. Phase 5 references the directive without quoting it.

**Fix:** Change "appears verbatim in phases three, four, and five" to "appears quoted in phase four, and is referenced (without full quotation) in phase five. Phase three resumes without reproducing the directive text."

---

## Issue 3 — Nine Agents vs. Ten Entities: Internal Contradiction (CORRECTION REQUIRED)

**Post — section heading:**
> "Phase One: Nine Agents, One Instruction"

**Post — body of that same section:**
> "Phase one launched Chiron on curriculum atoms, Vesta on specs, Faber on content posts, Muse on design briefs, Livy on reference documentation, Rufus on video production packages, Sibyl on research briefs, Veritas on post reviews, and Argus on a team health check. Ten entities total, with Salus acting on Argus's report as it came in."

The heading says nine. The body says ten. The log says: "Ran 9 agents in parallel." Salus was not launched in the initial parallel deployment — Salus acted on Argus's report after it came in, which is a sequential follow-on, not part of the nine simultaneous launches.

**Fix:** Either change "Ten entities total, with Salus acting on Argus's report as it came in" to correctly reflect that nine entities ran in parallel (Chiron, Vesta, Faber, Muse, Livy, Rufus, Sibyl, Veritas, Argus) and Salus was a subsequent single-entity action — or, if the intent is to count all entities active during the session, acknowledge that the parallel launch was nine and Salus was triggered reactively.

---

## Issue 4 — VESTA-SPEC-054 §3.1 Quote: Added Word "Ephemeral" (CORRECTION REQUIRED)

**Post claims §3.1 says:**
> "Agent output is conversational and ephemeral. The entity's commits are the ground truth. If the entity committed work, git log shows it. If the entity did not commit, no amount of output parsing will produce a reliable result."

**Actual §3.1 text:**
> "Agent output is conversational. An entity may explain what it did, describe what it found, or produce intermediate text that does not represent the actual committed result. Parsing this output for structured data is fragile and unnecessary.
>
> The entity's commits are the ground truth. If the entity committed work, git log shows it. If the entity did not commit, no amount of output parsing will produce a reliable result."

The word "ephemeral" is not in §3.1. The phrase "Agent output is conversational and ephemeral" is not in the spec. The rest of the quoted excerpt is accurate, but the opening sentence is a paraphrase presented as a direct quote.

**Fix:** Either remove the quotation marks and present it as a paraphrase, or quote accurately: "Agent output is conversational."

---

## Issue 5 — Phase Boundary Markers: Inaccurate Rendering (ADVISORY)

The post's table of phase boundary markers:

| Phase | Boundary marker |
|-------|----------------|
| 1 → 2 | "Session resumed from compressed summary. All background agents from prior session completed." |
| 2 → 3 | "Session resumed from context-window summary. Standing directive remains active." |
| 3 → 4 | "Session resumed from context-window summary. Standing directive remains active." |
| 4 → 5 | "Session resumed from context-window summary. Standing directive remains active." |

**Actual log headers:**
- Phase 2 opens with: "Session resumed from compressed summary. All background agents from prior session completed." ✓ Accurate.
- Phase 3 ("Late-session progress (third phase)"): No boundary marker of this form in the log — this section opens directly with content. There is no "Session resumed" line.
- Phase 4 opens with: "Session resumed from context-window summary. Standing directive remains: 'keep going until all done or blocked by me or Vulcan.'" — Not "Standing directive remains active."
- Phase 5 opens with: "Session resumed from context-window summary. Standing directive remains active." ✓ Accurate.

The 2→3 and 3→4 markers in the post's table are either fabricated or conflated. Phase 3 has no such boundary marker; Phase 4's marker includes the actual quoted directive, not the generic "remains active" form.

This is an advisory because the table is clearly illustrative — but presenting invented boundary markers as if they are direct quotes from the log is a factual error, particularly in a post whose argument rests on the fidelity of the log record.

---

## Issue 6 — Commit Hash 99638f1: Attribution Imprecise (ADVISORY)

**Post claims:**
> `99638f1` (Salus/Chiron trust bond remediation)

**Actual git record (from chiron repo):**
- `99638f1` — "trust: file juno-to-chiron bond — dual-filed per protocol" (authored as Chiron)
- `064ed8b` — "governance: document bond attribution irregularity — commit 99638f1 authored as Chiron not Juno"

This commit is the juno-to-chiron trust bond, dual-filed per protocol. It is not "Salus/Chiron trust bond remediation." Salus's work in the session log was remediating Argus Day 30 WARN findings (Iris PRIMER.md, Lyra README.md, Copia README.md). The `99638f1` commit predates that work and is a trust bond filing, not a remediation.

The attribution is wrong in two ways: wrong actor (Juno filed this, not Salus) and wrong description (trust bond filing, not remediation).

**Fix:** Either remove `99638f1` from the list of cited hashes, or correctly describe it as "juno-to-chiron trust bond, dual-filed per protocol."

---

## Issue 7 — Commit Hash d8eb1ee: Repo Attribution (ADVISORY)

**Post claims:**
> `d8eb1ee` (Day 32 Veritas APPROVED-WITH-NOTES)

The commit `d8eb1ee` exists in the **juno** repo (`/home/koad/.juno`), not the Faber repo. The post groups it alongside Faber commit hashes (`015050f`, `35249fd`) in a way that could imply they are all in the same repo. The log is clear that `d8eb1ee` is a Veritas review commit. This is technically correct but contextually ambiguous. No correction required if the grouping is not repo-specific, but worth noting.

---

## Verified Accurate

- Standing directive appears in the session log. ✓
- Chiron hook failure attributed to fourty4 expired API auth (koad/juno#44). ✓ — Log: "Chiron's hook was routing to fourty4 (which had expired API auth)."
- Commits `015050f` and `35249fd` exist in the Faber repo and match described content. ✓
- Commit `2cb26a4` exists in Chiron repo and matches "CURRICULUM-ROADMAP updated." ✓
- Commit `d8eb1ee` exists in juno repo, matches "Day 32 Veritas APPROVED-WITH-NOTES." ✓
- VESTA-SPEC-054 §2.3 code block is quoted accurately. ✓
- VESTA-SPEC-054 exists at `/home/koad/.vesta/specs/VESTA-SPEC-054-multi-entity-orchestration.md`. ✓
- Chiron atom count "146+ atoms" — matches log: "146+ atoms total." ✓
- Vesta spec range "SPEC-038 through SPEC-054" — accurate across the full session. ✓
- Faber Day 33 commit message confirmed. ✓
- Four compressions / five phases — structural count is accurate. ✓

---

## Summary of Required Corrections

| # | Location | Issue | Severity |
|---|----------|-------|----------|
| 1 | Para 1 | Standing directive quote misses "it's", wrong capitalization on "Vulcan" | CORRECTION |
| 2 | Para 1 | "verbatim in phases three, four, and five" — only phase 4 quotes it verbatim | CORRECTION |
| 3 | Phase One section | Heading says nine agents, body says ten entities — contradicts log's "9 agents in parallel" | CORRECTION |
| 4 | Four Compressions section | §3.1 quote adds "and ephemeral" — not in the spec | CORRECTION |
| 5 | Phase boundary table | 2→3 and 3→4 markers inaccurate to log | ADVISORY |
| 6 | Commit hash table | 99638f1 described as "Salus/Chiron trust bond remediation" — actually Juno-to-Chiron bond filing | ADVISORY |
| 7 | Commit hash table | d8eb1ee repo context ambiguous | ADVISORY |
