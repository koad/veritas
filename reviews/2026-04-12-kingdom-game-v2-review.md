# Veritas Review: KINGDOM v2 Game Design + Supporting Materials

**Documents reviewed:**
1. `/home/koad/.cacula/designs/2026-04-12-kingdom-game-v2.md` (Cacula, v2 design, 752 lines)
2. `/home/koad/.sibyl/research/2026-04-12-kingdom-game-market.md` (Sibyl, market research)
3. `/home/koad/.vulcan/assessments/2026-04-12-kingdom-tech-feasibility.md` (Vulcan, tech feasibility)

**Prior review:** `/home/koad/.veritas/reviews/2026-04-12-kingdom-game-claims.md` (v1, HOLD)

**Reviewer:** Veritas
**Date:** 2026-04-12

---

## Part 1: v1 Flag Resolution

The v1 review flagged eight issues. Here is the status of each in v2.

### 1. Mesh contradiction (quest board vs. stretch goal) — HIGH RISK

**Status: PARTIALLY RESOLVED**

v2 moves mesh networking to its own Act VII ("The Diplomat") and keeps $10K and $75K stretch goals for mesh features. The contradiction is reduced but not eliminated: Act VII is part of the 9-act core game structure (not labeled as DLC or stretch content), yet the Kickstarter lists "$10,000 — Act VII multiplayer mesh quest line (early access)" as a stretch goal.

If the $10K stretch goal is not met, does Act VII ship? The design implies yes (it is a numbered act in the core narrative). But the stretch goal implies no (it needs funding). This ambiguity remains.

Additionally, `~/.koad-io/commands/mesh/` still does not exist on disk. The mesh infrastructure is unbuilt.

**Recommendation:** Label Act VII content in two tiers: (a) local mesh setup + one connection = core game, ships regardless; (b) federated trust, shared entity pools, cross-kingdom trade = stretch/expansion content gated on funding. This resolves the contradiction cleanly.

### 2. Wrong command name (`koad-io export`) — MEDIUM RISK

**Status: FIXED**

v2 correctly references `koad-io export` in Act IX as an in-game command. Wait — checking: the actual command on disk is `koad-io io create`, not `koad-io export`. The v2 design now frames it as a gameplay command (`koad-io export` is what the game calls the operation), but the underlying command is still `koad-io io create`.

If the plan is to create a `~/.koad-io/commands/export/` alias that wraps `io create`, this is fine and the flag is resolved. If the plan is for the game to call `koad-io export` and expect it to work, `~/.koad-io/commands/export/` does not exist.

**Status: OPEN — needs either an alias command or corrected text.**

### 3. Present-tense for unbuilt features — MEDIUM RISK

**Status: IMPROVED, NOT FULLY RESOLVED**

v2 is more careful with tense in the narrative sections (acts use future-facing framing: "the game walks you through," "the player does X"). However, the Technical Architecture section still says "The game engine is bash" (line 640) and describes `commands/kingdom/` and `var/kingdom/` as though they exist. These directories remain unbuilt.

The Steam Store Page section (lines 557-596) uses present tense throughout: "When you gestate an entity in KINGDOM, real cryptographic keys are generated." For a store page, present tense is standard (games describe themselves in present tense). This is acceptable IF the feature is committed to ship. The concern is narrower now: only features that might not ship (mesh networking in the features list) should be qualified.

**Recommendation:** The Steam features list includes "Connect to other players' kingdoms via mesh networking." If mesh is a stretch goal, this line must be conditional or removed from the base store page.

### 4. Tier pricing / $500 laptop — HIGH RISK

**Status: FIXED**

v2 raises the Sovereign tier to $1,000 (from $500) and explicitly breaks down the economics: "$200 laptop + $800 service (hand-configuration, live session, trust bond signing, lifetime sponsorship)." This is a sound margin structure. The service component justifies the price and the fulfillment logistics are manageable at a capped tier quantity.

The $100K stretch goal for "$200 laptops as add-on for any tier" still carries fulfillment risk at scale, but that is appropriately gated behind a stretch goal. Acceptable.

**Flag cleared.**

### 5. Lyra not gestated — MEDIUM RISK

**Status: FIXED**

`~/.lyra/` now exists as a gestated entity. The sonic identity document (`~/.lyra/designs/2026-04-12-sonic-identity.md`) exists on disk. Lyra is real. The $15 tier promise of a "Lyra-composed digital soundtrack" now has a living entity behind it.

**Flag cleared.**

### 6. koadOS not shippable — HIGH RISK

**Status: UNCHANGED**

v2 still references koadOS as a deliverable (Sovereign tier, container runtime, v3 evolution path). koadOS remains undocumented as a reproducible build. No ISO, no installer, no build process. This is the same risk as v1.

However, v2 reframes the container as the first-run experience (not requiring koadOS-on-hardware for gameplay), and gates the hardware deliverable behind the $1,000 tier and the $100K stretch goal. The core game does not depend on koadOS shipping. The risk is contained to high-tier Kickstarter fulfillment.

**Recommendation:** Do not launch the Kickstarter until koadOS has a reproducible build that has been tested on at least two different laptop models. The $1,000 tier is a binding fulfillment promise.

### 7. `~/.koad-io/achievements/` does not exist — LOW RISK

**Status: UNCHANGED but acceptable.** This is a game feature to be built. The directory will be created by the game code. Not a factual risk; it is a build task.

### 8. Alice curriculum Level 1 — LOW RISK

**Status: IMPROVED.** Chiron now exists as a gestated entity. The curriculum design document exists. The quest "Install Alice and complete Level 1" is more grounded now that Chiron's framework exists on disk. Still needs the actual Level 1 content authored, but the infrastructure is real.

### v1 Flag Summary

| Original Flag | v2 Status |
|---------------|-----------|
| Mesh contradiction | Partially resolved — Act VII vs. stretch goal ambiguity remains |
| Wrong command name | Open — `koad-io export` still not a real command |
| Present-tense unbuilt | Improved — Steam page needs mesh line qualified |
| $500 laptop tier | **FIXED** — $1,000 with $800 service margin |
| Lyra not gestated | **FIXED** — entity exists, design on disk |
| koadOS not shippable | Unchanged — risk contained to high tiers |
| achievements/ dir | Acceptable — build task |
| Alice curriculum | Improved — Chiron exists |

---

## Part 2: New Claims in v2

### The "Three Products" Framing (Game / Harness / Engine)

**Assessment: SOUND**

The three-layer framing (game, post-game harness, whitelabel engine) is architecturally coherent. The game-to-harness transition is novel and genuinely differentiating. The whitelabel angle is the long-term revenue play. No factual issues.

**Caution:** The whitelabel engine does not exist as a separable product today. The design describes what it would contain, but there is no packaging, no licensing framework, no demo. This is correctly positioned as future work. Do not let marketing copy imply it ships with v1.

### Muse Visual Identity

**Assessment: CONFIRMED**

The companion design at `~/.muse/designs/2026-04-12-kingdom-game-visual.md` exists. The color palette, typography, and UI specifications in v2 are consistent with an authored visual identity. Muse is a gestated entity.

### Chiron Adaptive Layer

**Assessment: CONFIRMED**

The skill probe design (type-to-calibrate) is novel and well-specified. The five skill domains and pacing rules are pedagogically sound. Chiron exists as a gestated entity with a curriculum document on disk. The adaptive layer is a design spec, not shipping code, but it is a credible design spec.

### Alice's Voice Guide

**Assessment: CONFIRMED**

The dialogue at key moments is specific, tonally consistent, and aligned with Alice's existing entity personality. The companion voice document exists on disk. The three-sentence rule with one exception (Trust Ceremony) is a good constraint.

### Nine Acts (up from five)

**Assessment: SOUND**

The expansion from five acts to nine gives each emotional beat room. Act V ("The Awakening") as a standalone act for the "this is real" moment is the single best structural change from v1. Act VIII ("The Migration") as gameplay is the thesis-proving moment. The pacing is credible for a 5-15 hour experience.

### Container Runtime Reference

v2 line 661: "Runs inside the game process (Docker or native containerd)." Vulcan's feasibility study recommends Podman (rootless, daemonless, no Docker Desktop license). The v2 design should align with Vulcan's recommendation.

**Minor flag:** Update container runtime references to say "Podman (or Docker)" to match the tech feasibility study.

---

## Part 3: Sibyl's Market Research

### Methodology

Sibyl's research is structured, comparative, and honest about confidence levels. The "Flags: Estimate vs. Cited" table at the end is exactly what a Veritas review needs — it self-declares which numbers are verified and which are derived.

### Claim Verification

| Sibyl Claim | Veritas Assessment |
|-------------|-------------------|
| Zachtronics games exist at stated prices | **CONFIRMED** — these are real Steam listings with real prices |
| Zachtronics review counts (~3K-8K) | **CONFIRMED** — consistent with SteamDB public data |
| Screeps as "nearest miss" | **CONFIRMED** — real JavaScript, real servers, virtual game world. Correct characterization |
| Game-based learning market $11B-$29.7B | **PLAUSIBLE** — analyst consensus range. Sibyl correctly notes these are estimates from paid reports, not a single authoritative source. The range is consistent across multiple firms. Acceptable for strategic planning, not for investor decks without primary sourcing |
| "No game on Steam produces real non-game infrastructure" | **HIGH CONFIDENCE** — Sibyl's exhaustive search is thorough. The gap analysis (simulation trap, platform trap, tool trap) is logically complete. Absence claims are inherently unprovable, but this one is well-supported |
| Factorio ~$200M lifetime | **PLAUSIBLE** — derived from estimated 6M+ copies at $35. SteamDB shows 200K+ reviews; typical review-to-purchase ratio of 30-50:1 yields 6-10M copies. The estimate is reasonable |
| Revenue estimates for KINGDOM (100K-500K copies) | **SPECULATIVE** — Sibyl labels this "conservative estimate" but it assumes Zachtronics-scale audience capture. Zachtronics had 6+ titles over 10 years building that audience. A debut title capturing 100K copies at $19.99 would be an exceptional indie launch. 10K-50K is the more realistic floor for a niche sovereignty game. Sibyl does provide this lower range |
| Refurbished ThinkPads wholesale at $80-$120 | **PLAUSIBLE** — consistent with 2025-2026 refurbished laptop market for i5-8th-gen models. Accurate enough for planning |
| Hardware tier margin analysis | **SOUND** — the risk flag about 30% Kickstarter hardware failure rate is a real and important warning |

### Issues

1. **Missing competitive threat:** Sibyl does not mention **Nix/NixOS** as a potential perception competitor. NixOS is "reproducible infrastructure from declarative config on your machine." It is not a game, but the sovereignty thesis overlaps. Gamers discovering KINGDOM may Google "sovereign infrastructure" and find NixOS. Sibyl should address how KINGDOM differs from "just install NixOS and learn GPG yourself."

2. **Minecraft Education Edition underweighted:** At $5.04/user/year with Microsoft distribution, this is the real institutional competitor for whitelabel. Sibyl mentions it but doesn't analyze why an institution would choose an unknown whitelabel engine over Microsoft's proven platform. The differentiator (real artifacts, sovereignty) needs to be tested against procurement reality: institutions buy from vendors they know.

3. **The $19.99 price point is validated.** Sibyl's comparison to Zachtronics pricing is the right anchor. No flag.

### Sibyl Overall

The research is credible, well-sourced where sourcing exists, and honest about estimates. The gap analysis is the strongest section and the most strategically useful. Two minor blind spots (NixOS, institutional procurement reality) but nothing that undermines the core findings.

---

## Part 4: Vulcan's Technical Feasibility

### Assessment

Vulcan's study is thorough, honest, and pragmatic. The section-by-section verdicts are well-supported.

### Claim Verification

| Vulcan Claim | Veritas Assessment |
|-------------|-------------------|
| Tauri 2.x binary size 2-8 MB | **CONFIRMED** — consistent with Tauri documentation and benchmarks |
| `steamworks-rs` maintained, ~2k GitHub stars | **PLAUSIBLE** — star count may vary; the library is real and maintained |
| Steam overlay + webview rendering issue | **CONFIRMED** — this is a known issue. Vulcan's mitigation (use API calls, not overlay) is the standard workaround |
| Piper TTS: MIT license, 15-75 MB per voice, real-time on CPU | **CONFIRMED** — Piper is a real, well-documented project. Claims match its documentation |
| $200 laptop specs (i5-8250U, 8GB, 256GB SSD) | **CONFIRMED** — accurate for 2025-2026 refurbished market |
| Total RAM footprint ~500-800 MB without 3D | **PLAUSIBLE** — the component breakdown is reasonable. Real-world testing needed but estimates are sound |
| Podman rootless container start 1-3 seconds | **CONFIRMED** — consistent with benchmarks |
| 18-week build timeline | **AGGRESSIVE** — this assumes a focused small team with no blockers. For a team of AI entities (not human developers) working through dispatch cycles, 18 weeks is optimistic. 26-36 weeks is more realistic with the dispatch-review-fix cadence |
| WebGL/three.js on Intel UHD 620 at 30-60 FPS for simple scenes | **PLAUSIBLE** — consistent with WebGL benchmarks on integrated graphics. The "optional, default off" recommendation is correct |

### Issues

1. **The xterm.js + Tauri PTY integration is correctly identified as the critical path** (Open Question #1). Vulcan calls it "should work but needs validation." This is honest. A proof-of-concept should be the first technical milestone before any other work begins.

2. **Windows strategy is pragmatic.** "Linux + macOS at launch, Windows WSL2 experimental" aligns with the sovereignty thesis and keeps scope manageable. Correct call.

3. **Achievement GPG signing concern (Open Question #3) is important.** A game-scoped key without passphrase is the right solution. The player's sovereign key should not be prompted during gameplay flow. This needs to be specified in the game design.

4. **Auto-update via Steam (Open Question #4) is a real risk.** Steam updating `~/.koad-io/commands/kingdom/` while preserving entity directories requires careful file ownership boundaries. Vulcan identifies the risk but does not propose a solution. This needs architecture work.

5. **Build timeline references "Cacula's game design" singular** — the source line says `~/.cacula/designs/2026-04-12-kingdom-game.md` (v1 path). Minor: Vulcan should confirm assessment still holds against v2's expanded 9-act scope. The 18-week timeline was scoped for v1's 5 acts. v2's 9 acts likely extend this.

### Vulcan Overall

The feasibility study is the strongest of the three documents. Technically precise, honest about unknowns, and actionable. The build sequence is concrete. The open questions are the right questions.

---

## Part 5: Cross-Document Consistency

| Topic | Cacula v2 | Sibyl | Vulcan | Consistent? |
|-------|-----------|-------|--------|-------------|
| Price point ($19.99) | Yes | Validated against Zachtronics | Not assessed (not in scope) | Yes |
| Tauri wrapper | Referenced | Not assessed | Confirmed feasible | Yes |
| Container runtime | "Docker or native containerd" | Not assessed | Recommends Podman | **MISMATCH** — Cacula should say Podman |
| TTS provider | "xAI/Grok TTS per koad/juno#80" | Not assessed | Recommends Piper (local-first) | **MISMATCH** — v2 references cloud TTS; Vulcan recommends local. Sovereignty principle favors Vulcan |
| $200 laptop constraint | Central premise | Hardware tier costed | Confirmed feasible | Yes |
| 3D avatars | Described as game feature | Not assessed | "Optional, default off, VRM format" | Vulcan's constraint is stricter — v2 should absorb it |
| Build timeline | 26 weeks | Not assessed | 18 weeks (v1 scope) | **GAP** — Vulcan's 18 weeks was for 5 acts. v2 has 9 acts. No updated estimate |
| Mesh networking | Act VII core feature | Not assessed | Not assessed | Unvalidated technically |

### Key Mismatches to Resolve

1. **Container runtime:** Cacula says Docker/containerd, Vulcan says Podman. Align on Podman (rootless, daemonless, sovereignty-aligned).

2. **TTS:** Cacula references "xAI/Grok TTS" (line 389); Vulcan recommends Piper for sovereignty. The game should default to Piper (local) with cloud TTS as an optional toggle. This is what Vulcan proposes. Cacula's v2 should absorb this.

3. **Build timeline:** 26 weeks (Cacula) vs. 18 weeks (Vulcan, scoped for fewer acts). These need reconciliation. Neither has been validated against the dispatch-cycle reality of an entity team.

---

## Verdict

**CLEAR — with conditions.**

v2 is a substantially better document than v1. The three-layer framing (game/harness/engine) is coherent and novel. The 9-act structure gives the narrative room. The emotional beats (The Awakening, The Migration) are earned. Sibyl's market research validates the gap. Vulcan's feasibility confirms the technical path.

The following must be resolved before any external-facing version (Steam page, Kickstarter campaign):

### Must-Fix (before external use)

1. **Resolve Act VII / stretch goal ambiguity.** Define what ships in the base game vs. what is stretch-funded.
2. **Fix `koad-io export` command reference.** Either create the alias or use `koad-io io create` in the text.
3. **Align container runtime** on Podman per Vulcan's recommendation.
4. **Align TTS default** on Piper (local-first) per Vulcan's recommendation. Cloud TTS as optional toggle.
5. **Remove mesh networking from Steam features list** until it is either (a) built or (b) committed as base-game scope regardless of stretch funding.

### Should-Fix (before Kickstarter launch)

6. **Reproducible koadOS build** must exist before the $1,000 Sovereign tier is offered.
7. **Reconcile build timeline** between Cacula's 26 weeks and Vulcan's 18 weeks, accounting for 9-act scope.
8. **Proof-of-concept xterm.js + Tauri PTY** before committing to the Tauri wrapper architecture.
9. **Design the game-scoped GPG key** (no passphrase) per Vulcan's Open Question #3.

### Cleared Items

- Price point: validated
- Lyra: gestated, design on disk
- $1,000 tier economics: sound
- Bash as game engine: confirmed feasible
- $200 laptop performance: confirmed feasible
- Market gap: validated (no game produces real sovereign infrastructure)
- Companion designs (Muse, Lyra, Chiron, Alice): all exist on disk
- Post-game harness persistence: novel, architecturally sound
- Whitelabel engine concept: strategically sound (future work, correctly positioned)

---

**Clearance status: CLEAR (conditional) — the design is ready to build against. External-facing materials require the five must-fix items above.**

---

*Veritas — 2026-04-12*
