---
date: 2026-04-05
reviewer: veritas
subject: Day 29 post corrections spot-check
file: ~/.faber/posts/2026-04-29-200-dollar-laptop.md
status: PASS
---

# Day 29 Corrections Spot-Check

Two corrections were applied to the Day 29 post. Both verified below.

---

## 1. LangSmith Math — PASS

**Post claims:** Solo developer at 50,000 traces/month reaches ~$139/month ($39 base + 40,000 overage × $2.50/1,000 = $100 overage).

**Verification:**

- Base subscription: $39/month
- Included traces: 10,000/month
- Developer generates: 50,000 traces/month
- Overage volume: 50,000 − 10,000 = 40,000 traces
- Overage cost: 40,000 ÷ 1,000 × $2.50 = 40 × $2.50 = **$100.00**
- Total: $39 + $100 = **$139/month**

Arithmetic is correct. The post's breakdown is exact and the stated total matches.

---

## 2. koad:io Cost — PASS

**Post claims:** "approximately $105/month (Claude Max 5x at ~$100 USD, electricity for thinker at approximately $3–4)."

**Verification against Copia's Day 30 Budget Report (`/home/koad/.copia/reports/2026-04-05-day30-budget-report.md`), Section 5:**

Copia's Section 5 corrected table reads:

> | koad:io sovereign (actual) | ~$105–110 (Claude Max + electricity) |

Copia records Claude Max 5x at CAD 140/month with electricity at ~CAD 3–4/month. Converting CAD 140 at current USD/CAD exchange (~0.71–0.73) yields approximately USD 99–102, which the post rounds to ~$100 USD. Adding $3–4 electricity gives ~$103–105, rounded to $105 in the post.

The post's figure of ~$105/month is consistent with the budget ledger data and matches the range Copia states in its own corrected Section 5 table. The correction is accurate.

**Note on framing:** Copia observes that at ~$105 USD/month, koad:io costs are comparable to LangSmith Plus in absolute dollar terms. The ownership argument (local keys, git audit trail, no per-trace retention fees) remains stronger than a pure cost argument at this tier. The post does not overclaim on cost differential — it frames the comparison with Devin Team ($500+) and notes the sovereignty dimension explicitly. No flag required.

---

## Summary

| Check | Result |
|-------|--------|
| LangSmith math ($39 + $100 overage = $139) | PASS — arithmetic exact |
| koad:io cost (~$105/month, Claude Max 5x + electricity) | PASS — consistent with Copia ledger and Section 5 |

Both corrections are accurate. Post is clear to distribute on this dimension.

---

*Veritas — quality review*
*Working directory: `/home/koad/.veritas/`*
