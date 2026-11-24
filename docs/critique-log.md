# Critique log

Newest entry at the bottom. One entry per critic run. The deploy gate reads
the last PASS or FAIL line in this file.

Entry format:

```
## <date> — <page> — run <n>

Rendered: <url>
Screenshots: <paths>

| Criterion | Score | Evidence |
|---|---|---|
| ... | 0-10 | measured number, screenshot region, or quoted copy |

Lighthouse: performance <n>, accessibility <n>, best practices <n>, SEO <n>
Links: <n> checked, <n> broken
HTML: <valid / n errors>
Page weight: <n> KB total, largest asset <file> at <n> KB

Fixes:
1. <file>:<line or selector> — <what it should become>

PASS
```

The verdict is the last line of the entry, alone, and is PASS only when every
rubric item scores at or above its threshold.

---

## 2026-11-23 — baseline — live site, pre-rebuild

Rendered: https://astralspatial.com/
Screenshots: docs/screenshots/baseline-live-390.png, docs/screenshots/baseline-live-1440.png

Deterministic numbers only. No rubric scores: the rubric is not yet approved.

Lighthouse (mobile): performance 94, accessibility 100, best practices 96, SEO 100
LCP 3.0s, FCP 0.9s, CLS 0, TBT 0ms
Links: 4 checked, 0 broken
HTML: 0 errors, 1 warning
Page weight: 327KB total, largest asset img/chloe.jpg at 239KB
Favicon: absent
og: tags: absent
twitter: tags: absent
mailto link: absent
Images missing alt: 0 of 3
Spelling: "Morisette" present, should be "Morissette"

Against the rubric's deterministic floors, four fail: largest asset 239KB over
the 150KB ceiling, no favicon, no og: tags, no twitter: tags. Plus one
correctness error in the copy.

FAIL

---

## 2026-11-24 — home — run 1

Rendered: https://staging.astralspatial.com/
Screenshots: docs/screenshots/home-1440-2026-11-24.png,
docs/screenshots/home-390-2026-11-24.png,
docs/screenshots/home-1440-scroll2000-2026-11-24.png,
docs/screenshots/crop-sectionhead-1440.png, docs/screenshots/crop-w04-1440.png,
docs/screenshots/crop-w04-390.png, docs/screenshots/crop-contact-390.png,
docs/screenshots/crop-hero-390.png

| Criterion | Score | Evidence |
|---|---|---|
| 1. Visual hierarchy | 6 | Entry order is right at both widths: `<h1>` 56px, hero email 24px with baseline at y=691 against a 900px fold, contact email 56px. But the page has three left edges — hero, image band, link rows and contact band at x=64; section rules and record indices at x=112; all record prose at x=319. Worse, inside section 02 the `W/01` title sits at x=64 while the `W/02` and `W/04` titles sit at x=319, a 255px jump between sibling records. `.record-w01-body` also renders `border-top-width: 0px` where every other record renders `1px rgb(176,170,160)`, so the proof record is the one record with no top rule |
| 2. Typography | 6 | Scale is clean: the eleven rendered DOM sizes are 12/15/16/18/20/22/24/28/32/56, all on the skill's scale, `h1` `font-weight: 400`, Archivo Narrow and Source Serif 4 both loading. Measure is not. At 1440 `.record-body` is 493px wide and runs 50, 51, 60, 58, 57 and 41 characters per line against the skill's 60–80 floor — five of six short. At 390 the same six run 33, 38, 36, 36, 33 and 31 against the 38-character floor — four of six short. Section names are `<span class="label">`, not `<h2>`: the document goes `h1` → `h3`, which is the validator's one error and Lighthouse's `heading-order` failure. One stray 9px `text` node in the array plot |
| 3. Spacing and rhythm | 5 | Record gaps are exact — 1314→1378, 1595→1659, 2870→2934 and 3184→3248 are all 64px. Label → first content 48px, last content → footer rule 193px. Two systematic errors against the skill's section-rhythm table, each four times over: rule bottom and label top are both at y=1061, a 0px gap where 24px is specified (see crop-sectionhead-1440.png — the rule touches the cap-tops of "01 — WHAT WE DO"), and previous content → section rule measures 152px where 128px is specified (128px section gap plus `.section-head { padding-top: var(--s-3) }`). 152 is on no scale. `.w04-knockout` pads 16px at 1440 where `--s-3` 24px is required, and overflows the bottom of `.record-w04` by 31px (knockout bottom 3838.4, record bottom 3807.4). `.w01-knockout` overlaps the band by 104px where 96px is specified |
| 4. Mobile layout | 5 | `document.scrollWidth` 390 = `clientWidth` 390, no horizontal scroll. Hero email tap target 221×57. Index band rows 56px each, seven of them, carrying the cross-page nav. Body copy 16px minimum. Against that: the contact email, the dominant call to action, has its text right edge at x=382 with the frame's inner rule at x=381 — the final M of INFO@ASTRALSPATIAL.COM runs under the opaque frame strip, where a 20px right margin is specified. The `W/04` credit line overflows its record by 23px, crosses the `ALL PROJECTS` rule, and its 200px opaque knockout punches a visible 200px hole in that rule (crop-w04-390.png). Prose measure 31–38 characters against the 38 floor. Deterministic failure: 3 broken links, two of which are `work.html` and `studio.html`, the targets of the index band's own `WORK` and `STUDIO` rows. Criterion capped at 7 by that failure; scored 5 on the clip and the overflow |
| 5. Performance | 7 | Lighthouse performance 100. LCP 1.4s, FCP 0.9s, SI 0.9s, CLS 0, TBT 0ms. Page weight 143KB against a 500KB floor; largest asset `style.css` at 22KB against a 150KB floor; `img/chloe.jpg` now 19KB, down from 239KB at baseline. Every performance number clears 9–10. Capped at 7 by the deterministic list: 3 broken links and 1 HTML error. Lighthouse best-practices could not be measured — two runs both aborted with "Waiting for DevTools protocol response has exceeded the allotted time. (Method: CSS.enable)" — so one of the four floors is unverified |
| 6. Copy clarity | 6 | What and next step are unmissable. `<h1>`: "Spatial audio designed for a room, not specified from a catalogue." Next step: "Send the room, the work, and the dates. Astral Spatial scopes it in writing before any call." — specific, and clear of every banned phrase. For whom is nowhere on the page. The three `01 — WHAT WE DO` paragraphs are the weak block: 001 opens "Sound designed for a specific room." and closes "Each piece is built for where it will be heard.", 003 closes "Each piece is sized and finished for the space it ships to." — two closing sentences that restate their own openings and carry no new fact. 003 also reuses "rather than specified from a catalogue" verbatim from the `<h1>`, spending the strongest line on the page twice. 002 is the only one of the three with nothing wasted. The work-record placeholder copy mostly holds the right volume as factual fragments — `W/01` 288 characters keeping the clause that matters ("A visiting artist arrives with their own work and plays it in ambisonics, no engineer rebuilding the room"), `W/04` 124 characters — but `W/02`'s prose duplicates its own credit block word for word: prose "System design — Andrew Fox; execution — Jupiter Sound; tuning and sound design — Chloe Alexandra Thompson" against the metadata column's "Credit — System design, Andrew Fox; execution, Jupiter Sound; tuning and sound design, Chloe Alexandra Thompson". Half of that record's prose is a repeat of the thing beside it. `og:image:alt` reads "on black"; the site ships `#EDEBE6` |
| 7. Brand fit | 8 | Austere and institutional, closer to an architecture practice than a vendor. No radius, no shadow, no gradient, no chromatic accent, no cards. The mark census is exactly right: 7 instances at 16/16/14/16/16/14/24px, each centred in a `.mk-slot` whose width is the mark plus 16px (32, 30, 40), each at the end of a 1px rule, the footer one mirrored left. The frame holds on scroll — at scrollY 2000 `.frame` is `position: fixed`, `z-index: 40`, `.fr-t` top 0 — and survives at 390px at 8px inset plus a 1px rule, 9px per side. Both layering knockouts are `rgb(237,235,230)` at `opacity: 1`; no scrim anywhere. Costs: the `W/04` credit knockout is centred grotesque in a 200px box floating below a plate and cutting the next rule, which reads as a mistake, not a system. `.fr-l::after` renders 4 measurement ticks, not 5 — `height: 128px` at 32px pitch gives ticks at 386/418/450/482, and the set is not centred on 50vh |
| 8. Conversion clarity | 7 | Four instances of one address — header 12px, hero 24px, contact band 56px, footer status cell — all resolving to `mailto:info@astralspatial.com` after the inline rewrite, with `#email-fallback` without JS, and the literal string absent from source (grep count 0). The contact band dominates at 2.3× the hero. The next-step sentence names what to send. Against that: at 390 the dominant instance is clipped by the frame (text right 382, frame inner rule 381); Lighthouse `label-content-name-mismatch` fails on all four, visible "info@astralspatial.com" against accessible name "Email Astral Spatial at info at astralspatial dot com"; and every non-email route on the page 404s. Capped at 7 by the deterministic link failure |

Lighthouse (mobile): performance 100, accessibility 98, best practices n/a (runtime error, two attempts), SEO 69
LCP 1.4s, FCP 0.9s, Speed Index 0.9s, CLS 0, TBT 0ms
SEO 69 has one failing audit, `is-crawlable`, caused by the staging `x-robots-tag: noindex, nofollow, noarchive, nosnippet` header the spec requires on staging. Not a site defect.
Accessibility 98 has two failing audits: `heading-order` and `label-content-name-mismatch`.
Links: 14 checked, 3 broken — `https://staging.astralspatial.com/work.html` 404, `https://staging.astralspatial.com/studio.html` 404, `https://astralspatial.com/img/og-01.jpg` 404
HTML: 1 error, 2 warnings. The error, line 213: "The heading h3 (with computed level 3) follows the heading h1 (with computed level 1), skipping 1 heading level."
Page weight: 143 KB total, largest asset style.css at 22 KB
Favicon: present. og: and twitter: tags: present, og:image target 404s. Spelling: Michael Amacio, Chloe Alexandra Thompson, Alanis Morissette all correct; "Morisette", "Amasio" and "Cam Finley" all absent. `sitemap.xml` returns 404.

Fixes:

1. `style.css:151` and `style.css:860` — `.shell` and `.shell-section` both declare `padding-inline: var(--margin)`, and the sections nest a `.shell` inside a `.shell-section`, so the page margin is applied twice: 96px at 1440 and 40px at 390. This is the root cause of the 1216px content width, the 493px prose column, and the sub-floor measures at both widths. Remove `padding-inline: var(--margin)` from the `.shell` rule at line 151 and leave it on `.shell-section`, or add `.shell-section > .shell { padding-inline: 0 }`. Re-measure: records must land at x=64 with width 1312 at 1440, and `.record-body` must reach 60 characters per line.
2. `style.css:354` — inside `@media (min-width: 1024px)`, `.section-head .label { margin-top: 0 }` overrides the base `margin-top: var(--s-3)` and leaves 0px between the rule bottom and the label top (both at y=1061). Delete the `margin-top: 0;` declaration so the label inherits `var(--s-3)` (24px), per the skill's section-rhythm table.
3. `style.css:350` — `.section-head { padding-top: var(--s-3) }` in the ≥1024 block adds 24px above the section rule, making previous-content → rule 152px where the table says 128px. Set `padding-top: 0`.
4. `index.html` — move the `<div class="w04-knockout">` block out of `<div class="plate plate-vert">` and make it the first child of `<div class="record-img-col">`, above `<ul class="label record-meta record-meta-w04">`, with a 1px `--line` rule and 16px clear above and below it between the credit and the technical rows. SP-09 requires the credit to be the metadata column's first child; `.record-img-col` currently opens with `Status — in progress`, which SP-09 names as a defect condition, and `W/01` and `W/02` both put their credit first, so `W/04` is the only inconsistent one.
5. `style.css:576-592` — with the markup moved, delete the `.w04-knockout` `position: absolute; left: -24px/-32px; bottom: -24px/-32px` block. `bottom: -32px` is what pushes the credit 31px below `.record-w04` at 1440 and 23px at 390, crossing the `ALL PROJECTS` rule and punching a 200px opaque hole in it. If the layered treatment in SP-12 is kept instead, it must be anchored to the plate's bottom-left corner with a 32px overlap, not a 32px outset, and the record must grow to contain it.
6. `style.css:576` — add `text-align: left;` to `.w04-knockout`. It currently inherits `text-align: center` from `.plate`, so the credit renders centred while every other `label` row on the page renders `start`. SP-09 requires flush left with no hanging indent.
7. `style.css:586-590` — `.w04-knockout` padding is `var(--s-2)` at every width. At ≥768px it must be `var(--s-3)` (24px) per the skill's L2 knockout spec; 16px is correct only at ≤767px.
8. `index.html` — change the five section names from `<span class="label">01 — What we do</span>` to `<h2 class="label">01 — What we do</h2>` inside `.section-head`. This clears the validator's single error and Lighthouse's `heading-order` failure, and matches the spec's "Section names are `<h2>`".
9. `index.html` — add `<hr class="rule">` as the first child of `<div class="w01-knockout">`, or set `border-top: 1px solid var(--line)` on `.record-w01-body`. SP-12 lists the W/01 record's 1px top rule as one of the three things sitting on the knockout; it is currently absent, and `.record-w01-body` computes `border-top-width: 0px` while every sibling record computes 1px.
10. `style.css:649-663` — `.w01-knockout` `padding-left` is `var(--margin)` (48px at 1440, 20px at 390), which places the `W/01` index at x=64 and the title at x=64. They should align with the other records: index at the content column's left edge and title in columns 3–7. Set `padding-left: calc(var(--margin) + 24px)` after fix 1, or position the two children on the grid, and verify the `W/01` title lands at the same x as the `W/02` and `W/04` titles.
11. `style.css:624` — `.img-band` sits inside `.shell-section`, which insets it by the page margin, so it renders at x=64 w=1312 at 1440 and x=28 w=334 at 390. The spec requires full-bleed to the frame's inner edge. Add `margin-inline: calc(var(--margin) * -1)` to `.img-band`, so it reaches x=17 w=1406 at 1440 and x=9 w=372 at 390.
12. `index.html` / contact band — at 390 the contact email text measures 354px against a 350px content width and its right edge lands at x=382, one pixel past the frame's inner rule at x=381. Either reduce the contact-band `statement` size at ≤767px to the next value that fits inside 350px, or set `.contact-band .mail { letter-spacing: 0 }` at that width. The spec states this string must not wrap and must fit; it currently fits only by running under the frame.
13. `style.css:127-131` — `.fr-l::after` has `top: calc(50vh - 64px)` and `height: 128px`, which renders 4 ticks at 386/418/450/482 rather than 5 centred on 50vh. Set `height: 129px`.
14. `index.html` head — `og:image` points at `https://astralspatial.com/img/og-01.jpg`, which returns 404. Ship OG-01 or point the tag at an asset that exists. Its `og:image:alt` also reads "A twenty-four point speaker array diagram on black"; the shipping ground is `#EDEBE6`, so the alt describes the withdrawn dark theme.
15. `index.html` — `work.html` and `studio.html` both 404 on staging. Every header, footer, index band and link-row route except the email is dead. Ship both pages, or the home page cannot be scored above 7 on criteria 4, 5 and 8.
16. `index.html`, record `001` and record `003` prose — delete the closing sentence of each. "Each piece is built for where it will be heard." restates "Sound designed for a specific room."; "Each piece is sized and finished for the space it ships to." restates "built as objects for one room rather than specified from a catalogue." Also replace that clause in 003, which repeats the `<h1>` verbatim.
17. `index.html`, record `W/02` prose — delete "System design — Andrew Fox; execution — Jupiter Sound; tuning and sound design — Chloe Alexandra Thompson." The SP-09 block in the same record's metadata column already carries it word for word. The prose states the facts; the credit block states the attribution.
18. `index.html` — the home page never names who the work is for. Add the audience to the hero lead or to the `01 — WHAT WE DO` section in one sentence, per the spec's "galleries, museums, and public art first".

FAIL
