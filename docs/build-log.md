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
