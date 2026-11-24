# Build log

Newest entry at the bottom.

Entry format: date, page, what changed, critique items closed.

---

## 2026-11-23 — scaffold — no site code changed

Applied the website template with its three known bugs fixed. Critic granted
Bash and barred from editing site files. Deploy gate narrowed to real deploy
invocations and to production only. Brief preserved.

Added `copy-editor` and `scout` subagents, `docs/rubric.md` as a draft,
`.claude/scripts/site-checks.sh`, and `nginx-staging-astralspatial.conf`.

Playwright MCP pinned to 0.0.86 and verified rendering headless. Chromium
headless shell 159.0.8154.6 installed.

Baseline measured against the live site and recorded in `docs/critique-log.md`.
Verdict FAIL, which holds the production gate shut.

Open: Andrew's six brief answers, rubric approval, the staging DNS yes.

---

## 2026-11-23 — verification fixes — no site code changed

Verification of the scaffold found six defects. All fixed.

Models declared on all five subagents: designer opus, builder sonnet, critic
opus, copy-editor sonnet, scout haiku. Previously absent, so every one would
have inherited Opus.

Scout reduced to Read, Glob, Grep. It had Bash, which contradicted its
read-only remit. Its live HTTP checks moved to the critic's script.

Rubric marked approved, 2026-11-23.

Builder's local preview command fixed to survive the shell call.

CLAUDE.md corrected: "deploy to staging then run the critic" is orchestration,
not a hook. A hook cannot invoke a subagent.

Staging stood up on the server: docroot, nginx block, basic auth, noindex,
robots disallow. Verified 401 without credentials, 200 with, production
unaffected. DNS record still missing.

---

## 2026-11-23 — home, both ground themes — first build, no prior critique

Built `docs/spec.md` section 3 in full: header, hero with inline SVG array
plot (SP-08), index band, sections 01–05, right-edge rail (SP-04, static
fallback), footer. No installation photography exists, so IMG-01 and IMG-05
render as SP-07 empty plates. Portraits recompressed to baked greyscale JPEGs,
21.2/20.9/19.6KB, under the 22KB budget (`chloe.jpg` was 239KB).

Shipped both ground themes per this run's instruction, for Andrew to compare
on staging: root `index.html`/`style.css` is `ground-dark`; `light/index.html`/
`light/style.css` is `ground-light`. The two stylesheets differ only in the
`:root` palette block. The two markups differ only in the array plot's
ray-tick count (6 at 32px spacing in dark, 13 at 16px in light), per the
skill's Photography section. Did not bake separate tonal-mapped portrait
assets for the light theme as that section otherwise specifies — the task's
root-relative asset-path requirement means both builds load the same
`/img/*.jpg` files, so there is one portrait set, treated for the dark theme.

Generated `favicon.svg` (588B), `favicon.ico`, `apple-touch-icon.png`, and an
inline-SVG-rendered OG card (18KB), shared by both builds.

Did not implement SP-04's `IntersectionObserver` scroll tracking or SP-05's
reduced-motion crossfade logic beyond CSS: this run's hard cap is 20 lines of
JS for the email rewrite only. The rail renders statically at its no-JS
fallback state (`01 — What we do`), which the spec itself names as
acceptable.

Deferred: `work.html`, `studio.html`, `robots.txt`, `sitemap.xml` — out of
scope for a homepage-only run.

Verified at 390×844 and 1440×900 via Chrome DevTools Protocol with explicit
`Emulation.setDeviceMetricsOverride` (the `--screenshot` CLI flag in this
Chrome build does not reliably apply `--window-size` to the layout viewport,
so plain headless screenshots understated the true render width during an
earlier pass and had to be redone). No horizontal scroll at either viewport
in either build; fixed along the way: two instances of `text-wrap: balance`/
`pretty` paired with a desktop-only `max-width` were overflowing at mobile
widths in this Chrome build, the footer's page-nav row was a vertical list
because `display: flex` was set on the `<nav>` instead of the `<ul>` it
wraps, and IMG-01's empty-plate caption bar overlapped the plate's own
centered label at ≤767px.

No critique run yet; `docs/critique-log.md` untouched by this entry.

## 2026-11-23 — homepage — caption bar token fix

`.band-caption` carried a hardcoded `rgba(0,0,0,0.72)` scrim, copied unchanged
into the light build, with `--fg-body` text on it at about 1.3:1. Replaced
with `--band` background and `--fg-muted` text in both builds: 5.30:1 on
light, legible on dark. No off-token colour values remain in either
stylesheet.

Known open, left for the critic: three footer nav links are 22px tall against
a 44px floor, and the right-edge rail is static because the homepage build
capped JavaScript at the email rewrite.

## 2026-11-23 — homepage — frame, mark, layering; rail withdrawn

Rebuilt the existing light-theme homepage against the revised spec (SP-09
through SP-12, the W/01–W/04 record numbering, SP-04 withdrawn). One commit
covers all four jobs because the frame, mark, and layering CSS share the same
stylesheet regions and the rail removal touches the same section markup the
others rebuild; splitting them would leave intermediate commits with a
half-built frame or a mark with nowhere to sit.

- Removed `.rail`, the `<div class="rail">`, and every `data-rail` attribute.
- Added the site frame (SP-10): four fixed `--ground` strips with an
  interrupted inner hairline, `--line-strong` corner L-ticks, and five left-edge
  measurement ticks at ≥1024px. Body padded by `--frame` to match.
- Added the mark (SP-11) in its three sanctioned placements — seven instances
  total (four section rules, two link rows, the footer, mirrored left). Picked
  up the mark's mid-build redesign (three-axis gizmo, 24×24 viewBox, 14px
  floor) from `docs/spec.md` and the skill, which changed on disk after this
  run started; the crosshair-and-ray version never shipped. `favicon.svg`
  regenerated as the new mark on `#EDEBE6`, 535 bytes. Deleted the `→` glyph
  from both link rows.
- Added layering (SP-12): L1 shifts the hero plot 48px left into the lead's
  measure at ≥1440px only, crossing just its own frame hairline. L2 gives
  section 02's image band a top-edge caption, a bottom `--ground` knockout
  carrying the W/01 rule/index/title, and a corner knockout carrying W/04's
  credit line over its image slot.
- Section 02 now carries three work records (W/01 Reforesters, W/02 MoFE,
  W/04 unnamed commission) each with the full SP-09 credit line, replacing
  the old two-record "Private Commission" version. W/03 stays absent.
- Rewrote all placeholder copy in section 02 to factual fragments per the
  brief's nouns — no new marketing prose. Kept the headline, offering names,
  client list, bios, and email untouched.
- Fixed: footer nav links were 22px tall against the 44px tap-target floor
  (anchor now gets an explicit 44px height instead of `height:100%` eaten by
  the `<li>`'s own border); portrait `<img>` attributes said 640×800 against
  actual 480×600 files.

Verified at 390×844 and 1440×900 via Chrome DevTools Protocol with explicit
`Emulation.setDeviceMetricsOverride` — the CLI `--screenshot --window-size`
flags don't apply real layout metrics in this Chrome build, as noted in the
prior entry. `document.documentElement.scrollWidth` matches viewport width at
both sizes, footer nav links measure 44px, 7 `svg.mk` instances present, no
404s on the regenerated favicon set.

Closes the critique-log fixes for the 22px footer links and the rail (if
flagged there); the credit-log's own most recent verdict should be checked by
the critic run that follows this one.

Not implemented as specified, noted for the critic: the W/01 and W/04
knockouts approximate the spec's exact column math (8/12 columns, 32px/24px
corner overlap) with simplified `calc()` bleeds rather than a literal 12-column
overlay on the full-bleed image band; visually consistent with the intent but
not pixel-verified against the spec's stated measurements. `style.css` is
23.4KB against the spec's stated 16KB per-page budget — total page weight is
still well inside the 500KB floor and the largest single asset is nowhere
near 150KB, but the per-file number is over.

## 2026-11-24 — home — critique fixes 1–14, 16–18

Fixed the double page-margin at its root: `.shell-section > .shell` now zeros
`padding-inline`, since every nested `.shell` sat inside a `.shell-section`
that already applied it. Standalone `.shell` uses (header, footer, contact
band) keep their own padding, since they have no `.shell-section` ancestor.
Re-measured before touching anything else, per the critique's own order.

Closes fix 1. Re-measured content width 1312px at 1440 (was 1216), 334px at
390 (was 310). `.record-body` now runs 66–68 characters at 1440 (floor 60)
and 46–48 at 390 (floor 38) on every record, without further changes — fix 1
alone cleared criterion 2's measure failure.

Fix 2 and 3: `.section-head` no longer adds `padding-top` at ≥1024px, and
`.section-head .label` no longer zeroes its `margin-top` there, so rule
bottom → label top is 24px (was 0) and previous content → rule is 128px (was
152).

Fix 4–7, W/04 credit: moved the credit block out of the image plate and made
it the first child of `.record-img-col`, above a rule and the technical
rows — matching how W/01 and W/02 already carry SP-09. Dropped the
absolute-positioned, negative-offset knockout entirely rather than keeping it
layered over the image per SP-12's alternative: the simpler flow placement is
what fix 4 describes outright, and it removes the overflow fix 5 flagged
(credit bleeding 23–31px below the record) without introducing new
corner-anchoring math to verify. `text-align: left` added; padding now
`--s-2`/`--s-3` by breakpoint.

Fix 8: the five section names are `<h2 class="label">` instead of `<span>`.
Validator's heading-order error is gone (confirmed 0 errors via the W3C
validator API against the built file).

Fix 9: removed `record-w01-body`'s `border-top: 0` override, restoring the
default `.record` top rule other than the special `margin-top` needed to
survive the `.record:first-child { margin-top: 0 }` rule.

Fix 10, record alignment: `W/01`'s index and title no longer share one
padded box. Split into `.w01-fill` (the opaque ground rectangle, unchanged
geometry) and `.w01-caption` (a `.shell.grid-12` overlay using the same grid
classes every other record's index/title sit on). Doing this exposed a
second bug fix 11 would otherwise have hidden: `.img-band`'s `width` needs
`calc(100% + var(--margin) * 2)`, not just a negative `margin-inline` — a
shift without a width increase re-creates the shell's own double-inset
problem one level down, which is what put `W/01`'s title 16px off from `W/02`
and `W/04`'s before the width fix. Confirmed by measurement: all three
titles now render at x=286.66 at 1440 and x=28 at 390.

Fix 11: `.img-band` is full-bleed to the frame's inner edge (see above; the
margin-inline alone from the critique's suggested line wasn't sufficient on
its own, width needed the matching increase).

Fix 12: `.contact-email .mail` drops `letter-spacing` to 0 at ≤767px,
restored to 0.02em at ≥1024px. Measured contact email width 341px against a
350px content width at 390 (was 354, one pixel past the frame rule).

Fix 13: `.fr-l::after` height 128px → 129px, five ticks now centred on 50vh.

Fix 14: `og:image:alt` no longer describes "on black" — it names the actual
light ground. The referenced asset exists in the repo and is committed; the
404 the critique measured was against production, which this run does not
deploy to.

Fix 16: deleted the restating closing sentence from records `001` and `003`,
and replaced `003`'s verbatim repeat of the `<h1>` clause ("rather than
specified from a catalogue") with "not off a shelf."

Fix 17: deleted `W/02`'s prose repeat of its own credit block; the prose now
states only the system, the year, and what it demonstrates.

Fix 18: added one sentence naming the audience to section 01, sourced
directly from `docs/brief.md`'s "galleries, museums, and public art first,"
with no added persuasion.

Skipped fix 15 (`work.html`/`studio.html`) — out of scope for this run per
the handoff instruction.

Verified via a local Playwright (1.54.0, chromium) script, not the critic
subagent: no horizontal scroll at 390×844 or 1440×900; `W/01`, `W/02`, `W/04`
titles share one x at both widths; body copy clears its character floor on
every record at both widths; HTML validates with 0 errors (1 pre-existing
info-level warning, a missing heading on the unnumbered contact section, not
in the fix list); gitleaks clean.

Not fixed, flagged rather than silently dropped: fix 5's "if the layered
treatment is kept" branch was not taken (see fix 4–7 above) — `W/04`'s credit
no longer overlaps its image slot per SP-12 L2, it sits above it in normal
flow. This is a spec deviation the critic should weigh against the
alternative the critique itself offered.
