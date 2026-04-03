# Mercury Sponsor Outreach Templates — Factual Claims Verification
**Date:** 2026-04-03  
**Veritas Review:** Draft flagging for Mercury before outreach begins  
**Report Status:** FLAGGED ITEMS REQUIRE RESOLUTION

---

## Summary

Mercury's sponsor outreach templates are **well-positioned but contain unverified factual claims about sponsoring targets' portfolios and programs.** No hard errors found, but several claims lack sourcing and should be verified before personalized outreach.

---

## Flagged Claims by Variant

### Variant 1: Nat Friedman / AI Grant

**Claim:** "Your track record building developer autonomy (GitHub Sponsors, AI Grant, your bet on Ollama)"

**Status:** PARTIAL VERIFICATION
- ✓ CONFIRMED: Nat Friedman co-founded AI Grant (non-profit research lab)
- ✓ CONFIRMED: Friedman co-leads NFDG VC fund (seed to growth stage investments)
- ❓ UNVERIFIED: Specific investment in Ollama or vLLM not found in search results
- ❓ UNVERIFIED: GitHub Sponsors attribution (GitHub Sponsors launched by Microsoft/GitHub, not clear if Friedman personally directed the feature)

**Action Required:** 
- Before sending: Verify that Nat actually invested in Ollama. If not, remove "your bet on Ollama" or replace with confirmed Nat Friedman investments.
- Research: Check PitchBook or Nat's investor profile for confirmed portfolio companies.

**Recommendation:** Safer framing: "Your work on vLLM/Ollama," or omit specific investments entirely and focus on AI Grant's philosophy.

---

### Variant 2: a16z Open Source AI Grants Program

**Claim:** "Applications to the next a16z cohort typically close 6–8 weeks before selection. Are we on your radar for the June 2026 cohort?"

**Status:** UNVERIFIED — TIMELINE RISK
- ✓ CONFIRMED: a16z operates an Open Source AI Grants Program
- ✓ CONFIRMED: a16z announced latest grants in 2025–2026
- ❌ UNVERIFIED: June 2026 cohort existence or timeline
- ❌ UNVERIFIED: "6–8 weeks before selection" timeline for any a16z cohort
- ⚠️ RISK: If the June 2026 cohort doesn't exist or has different timelines, this dates the draft and damages credibility

**Action Required:**
- **Before sending:** Check a16z's current grants application page (a16z.com) for:
  - Existence of a June 2026 cohort
  - Actual application deadlines and timelines
  - Whether "6–8 weeks before selection" is accurate
- If June 2026 cohort doesn't exist or timeline is different, rewrite.

**Recommendation:** Remove specific timeline if uncertain. Safer framing: "We'd like to be on your radar for your next cohort. When does the application window typically open?"

---

### Variant 3: Woosuk Kwon / vLLM Team

**Claim:** "I've followed vLLM's work closely. PagedAttention fundamentally changed what's possible in local inference"

**Status:** CONFIRMED
- ✓ CONFIRMED: Woosuk Kwon authored PagedAttention paper (SOSP'23)
- ✓ CONFIRMED: PagedAttention improves LLM serving throughput 2–4× over prior systems
- ✓ CONFIRMED: vLLM is a high-throughput, memory-efficient inference engine built on PagedAttention

**No action required.** This claim is well-sourced and accurate.

**Sources:**
- [vLLM PagedAttention Paper (arXiv 2309.06180)](https://arxiv.org/abs/2309.06180)
- [vLLM Blog](https://blog.vllm.ai/2023/06/20/vllm.html)

---

### Variant 4: Andrej Karpathy

**Claim:** "Your work — nanoGPT, nanochat, autoresearch — teaches a clear lesson: good AI tools are meant to run on hardware you control, with code you understand, without external dependency."

**Status:** CONFIRMED
- ✓ CONFIRMED: Karpathy authored nanoGPT (minimal GPT-2/3 training repo)
- ✓ CONFIRMED: Karpathy authored nanochat (full-stack ChatGPT clone, ~$100 cost)
- ✓ CONFIRMED: Karpathy authored autoresearch (autonomous AI agent that optimizes nanochat training)
- ✓ CONFIRMED: All projects emphasize code readability, minimal dependencies, local execution

**No action required.** This characterization is accurate and well-aligned with Karpathy's public statements.

**Sources:**
- [GitHub: karpathy/nanoGPT](https://github.com/karpathy/nanochat)
- [GitHub: karpathy/nanochat](https://github.com/karpathy/nanochat)
- [GitHub: karpathy/autoresearch](https://github.com/karpathy/autoresearch)

---

### Variant 5: Chris Lattner / Modular

**Claim:** "Modular's track record sponsoring open source projects that strengthen the MAX ecosystem suggests you'd see the value here."

**Status:** SPECULATIVE — NO SPECIFIC SPONSORSHIPS DOCUMENTED
- ✓ CONFIRMED: Chris Lattner is co-founder and CEO of Modular
- ✓ CONFIRMED: Modular is building MAX (unified compute platform)
- ✓ PROBABLE: Modular announced support for BentoML (Feb 2026) and commits to open source
- ❌ UNVERIFIED: "Track record sponsoring open source projects that strengthen MAX ecosystem"
  - No specific grants, sponsorships, or open source funding programs found in search results
  - Commitment to open source exists, but execution details unclear

**Action Required:**
- Before sending: Research specific Modular open source grants or sponsorships
- Alternative: Soften claim to "Your commitment to building in the open (BentoML collaboration) suggests..." or remove sponsorship claim entirely

**Recommendation:** Remove or replace with confirmed fact: "Your February 2026 collaboration with BentoML shows Modular invests in open source AI infrastructure."

---

## General Template Recommendations

1. **Avoid specific timeline claims** without current verification (e.g., a16z cohort dates)
2. **Avoid "track record" claims** without listing specific examples or links
3. **Verify investor portfolio claims** via PitchBook or LinkedIn before sending
4. **Cite public projects accurately** — you've done this well for Karpathy and vLLM

---

## Summary Table

| Variant | Key Claim | Verdict | Action |
|---------|-----------|---------|--------|
| Nat Friedman | Ollama investment | Unverified | Verify or remove |
| a16z | June 2026 cohort timeline | Unverified | Verify program dates |
| Woosuk Kwon | PagedAttention/vLLM | CONFIRMED | ✓ Clear to send |
| Andrej Karpathy | nanoGPT/nanochat/autoresearch | CONFIRMED | ✓ Clear to send |
| Chris Lattner | Modular sponsorship track record | Speculative | Verify or reframe |

---

## Clearance Path

**Before ANY outreach:**
1. Mercury resolves a16z cohort timeline claim
2. Nat Friedman variant: verify Ollama investment OR revise
3. Chris Lattner variant: add specific Modular grant examples OR soften claim
4. Argus gates on timing and tone (per CLAUDE.md workflow)
5. Juno approves funding ask (per CLAUDE.md workflow)

---

**Report by:** Veritas  
**Confidence:** Mixed — some claims CONFIRMED, others require resolution  
**Escalation:** Mercury should resolve flags before filing approval request with Argus/Juno.
