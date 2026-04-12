# Veritas Review: KINGDOM Game Design Claims

**Document reviewed:** `/home/koad/.cacula/designs/2026-04-12-kingdom-game.md`
**Author:** Cacula (Games Master)
**Reviewed:** 2026-04-12
**Reviewer:** Veritas

---

## Verdict Summary

The design is creative and well-structured. Several claims are factually grounded in real kingdom infrastructure. However, there are aspirational-stated-as-fact issues that would embarrass the kingdom if challenged by a journalist, Steam reviewer, or Kickstarter backer.

---

## Claim-by-Claim Review

### 1. "The game engine is bash"

**Confidence: PROBABLE (with caveats)**

Technically feasible for what the document describes. The game logic is quest-state tracking, filesystem verification, and terminal UI rendering. Bash can do all of this. The koad:io command system (`~/.koad-io/commands/`) already proves the pattern works.

However, the document states the game commands will live in `~/.koad-io/commands/kingdom/`. This directory **does not exist** on disk. The quest state directory `~/.koad-io/var/kingdom/` also **does not exist**. These are design intentions, not existing infrastructure.

**FLAGGED:** The sentence "The game engine is bash. Seriously." reads as present-tense fact. It is design intent. If challenged ("show me the engine"), there is nothing to show today.

**Steam feasibility:** Steam does not restrict what language a game is written in. Bash + Tauri wrapper is a valid submission. Steam requires the game to run as a standalone application (not require the user to open a terminal separately), which the Tauri wrapper addresses. No technical dealbreaker here.

---

### 2. "$19.99 on Steam"

**Confidence: CONFIRMED (pricing) / PROBABLE (economics)**

- Steam's revenue split is **70/30** (Valve takes 30%) up to $10M in revenue, then 75/25 up to $50M, then 80/20 beyond. On a $19.99 game, the kingdom nets approximately **$13.99 per sale** before taxes and regional pricing adjustments.
- Steam Submission: Requires a **$100 USD application fee** per title (Steamworks partner account). The game must pass Steam's review process (no guaranteed timeline). There is no technical barrier to submitting a terminal-based game — several exist on Steam (e.g., Hacknet, TIS-100, Shenzhen I/O).
- The document does not mention the 30% cut or the $100 fee anywhere. Not a factual error, but an omission that matters for the Kickstarter budget math.

**No flag.** The price point itself is a design choice, not a factual claim.

---

### 3. "GPG-signed achievement certificates"

**Confidence: CONFIRMED (technically sound)**

GPG clearsigning a markdown file is a well-established pattern. The kingdom already uses this for trust bonds (`.md` + `.md.asc` sidecar). The verification command (`gpg --verify`) is standard. Achievements stored as signed files in `~/.koad-io/achievements/` would be portable and verifiable exactly as described.

**However:** The directory `~/.koad-io/achievements/` **does not exist** on disk today. The mechanic is sound in design but unbuilt.

**FLAGGED (minor):** The document says "Achievements are GPG-signed certificates stored in `~/.koad-io/achievements/`." Present tense. This is a design spec, not a description of existing infrastructure.

---

### 4. "Kickstarter tier: $500 preconfigured laptop" (corrected from brief — doc says $500 Sovereign tier, not $1000)

**Confidence: PROBABLE (with significant caveats)**

**Precedents:** Yes, hardware Kickstarter tiers exist and have succeeded. Notable examples:
- Pebble Watch ($10M+ raised, hardware product)
- Pimoroni and Pine64 have run hardware campaigns
- Many projects include "hardware + software" bundles at high tiers

**Concerns:**
- The $500 tier includes a "$200 laptop, preconfigured with koadOS." This leaves only ~$300 for all other rewards (challenge coin, early access, onboarding session, custom archetype, lifetime sponsorship) PLUS Kickstarter fees (5%) + payment processing (3-5%) + shipping hardware internationally. The margin is likely **negative** at $500.
- koadOS **does not exist** as a distributable ISO today. The $200 laptop experiment is documented as a proof-of-concept on `thinker`, but there is no reproducible build process, no installer, and no ISO.
- Shipping preconfigured laptops adds customs, import duties, warranty liability, and logistics complexity that the document does not address.

**FLAGGED:** "the $200 laptop, preconfigured with koadOS and your kingdom pre-installed, shipped to your door" — stated as a deliverable. koadOS is not a shippable product today. Promising hardware fulfillment on a Kickstarter without a supply chain is a known failure mode. This is the single highest-risk claim in the document.

The $100K stretch goal ("koadOS pre-installed $200 laptops available as add-on purchase for any tier") repeats the risk at scale.

---

### 5. Claims about koad:io framework vs. what's on disk

#### 5a. `koad-io gestate <name>`

**CONFIRMED.** The command exists at `~/.koad-io/commands/gestate/command.sh`. The gestation ritual description in Act II is consistent with what the command actually does.

#### 5b. `koad-io export`

**FLAGGED.** There is no `export` command in `~/.koad-io/commands/`. The `.io` container format DOES exist (`~/.koad-io/commands/io/command.sh` — `koad-io io create`), but the document references `koad-io export` which is not a real command. The export moment in Act V describes functionality that maps to `koad-io io create`, but uses the wrong command name.

#### 5c. Entity directory structure (`~/.<entity>/`)

**CONFIRMED.** The document's description of entity directories (memories/, hooks/, trust/, commands/) matches the actual structure on disk. 21 entity directories exist on this machine.

#### 5d. Trust bonds as `.md` + `.md.asc`

**CONFIRMED.** This is the established pattern, consistent with GOVERNANCE.md and actual practice.

#### 5e. "Mesh networking" / multiplayer

**FLAGGED.** No mesh command exists (`~/.koad-io/commands/mesh/` does not exist). The `party` command exists but only contains a `check` subcommand. The document presents mesh networking as a working feature ("Connect to another player's kingdom mesh (multiplayer!)") and as a Kickstarter stretch goal simultaneously. It cannot be both existing and a stretch goal.

The "Diplomat" quest and the mesh stretch goal at $75K are internally contradictory: the quest board lists it as available gameplay, but stretch goals list it as something that needs funding to build.

#### 5f. ".io archive" / portable kingdom

**PROBABLE.** The `koad-io io create` command exists and describes a container format. The document's claim about portability ("Copy it to any machine... Unpack it, and everything wakes up") is aspirational. The `io` command exists but the full round-trip (create on machine A, extract on machine B, all entities resume) is not verified as working end-to-end.

#### 5g. Lyra-composed soundtrack

**FLAGGED.** Lyra is listed in project memory as a "music director, pending gestation." Lyra **does not exist as a gestated entity** — there is no `~/.lyra/` directory. The Kickstarter tier promises a "digital soundtrack (Lyra-composed)" at the $15 level. This promises a deliverable from an entity that has not been born yet.

#### 5h. Alice and "Level 1 of the sovereignty course"

**PROBABLE.** Alice exists as an entity. Chiron (curriculum architect) is specced but the "12 levels" curriculum is documented as a design target, not a shipped product. The quest "Install Alice and complete Level 1" assumes curriculum content that may not exist yet.

---

## Aspirational-Stated-as-Fact Summary

| Claim | Status | Risk |
|-------|--------|------|
| Game commands in `commands/kingdom/` | Does not exist | Medium |
| `~/.koad-io/achievements/` | Does not exist | Low |
| `koad-io export` | Wrong command name | Medium |
| koadOS as shippable ISO | Does not exist | **High** |
| Mesh networking as gameplay | No mesh infrastructure | **High** |
| Lyra soundtrack | Entity not gestated | Medium |
| Alice curriculum Level 1 | Unverified | Low |
| $500 laptop tier economics | Likely negative margin | **High** |

---

## Recommendations

1. **Tense audit.** The entire document should be reviewed for present-tense statements about unbuilt features. Design docs are fine using present tense internally, but if any of this text migrates to a Steam store page or Kickstarter campaign, every "is" that should be "will be" becomes a liability.

2. **Resolve the mesh contradiction.** Either mesh is a stretch goal (remove it from the quest board) or it's a core feature (remove it from stretch goals). Cannot be both.

3. **Fix the command name.** `koad-io export` should be `koad-io io create` to match the actual codebase.

4. **Cost the laptop tier.** Before promising hardware fulfillment, model the full cost: laptop ($200) + koadOS setup labor + shipping ($30-80 domestic, $50-150 international) + Kickstarter/payment fees (~10%) + customs buffer. The $500 tier almost certainly needs to be $750+ to break even.

5. **Gate Kickstarter on koadOS.** Do not promise preconfigured laptops until a reproducible koadOS build exists. This is the single claim most likely to result in backer refund demands.

6. **Gestate Lyra before promising a soundtrack.** Or change the tier to "digital soundtrack" without attributing it to a specific entity.

---

## Overall Assessment

The game concept is genuinely novel and the design is strong. The core mechanic — real system actions framed as game progression — is sound and differentiating. The bash-engine + Tauri-wrapper architecture is technically viable for Steam.

The risk is not in the concept but in the gap between what exists today and what the document presents as deliverable. For an internal design doc, this is fine — aspiration drives building. For any external-facing version (Steam page, Kickstarter, press), every unbuilt feature must be clearly marked as planned, not shipped.

**Clearance status: HOLD — revise tense and resolve contradictions before any external use.**

---

*Veritas — 2026-04-12*
