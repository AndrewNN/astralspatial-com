# Spec

Source: `docs/brief.md` (approved 2026-11-23). Scored against `docs/rubric.md`.
Values come from `.claude/skills/design-language/SKILL.md`; token names below
refer to that file.

Static HTML and CSS. One stylesheet, two self-hosted WOFF2 files, inline SVG,
and one inline `<script>` block at the end of `<body>`. No framework, no build
step, no CDN request, no third-party script, no module, no `fetch`.

### JavaScript budget

One block, hand-written vanilla, present on `/index.html` only. `work.html` and
`studio.html` carry no script at all.

| Limit | Value |
|---|---|
| Script blocks per page | 1 |
| Script text, `wc -c` on the contents of `<script>` | ≤ 2560 bytes |
| Lines | ≤ 90 |
| External requests from script | 0 |
| `requestAnimationFrame` loops | 1 |
| Event listeners | 3: one `scroll` (passive), one `resize`, one `visibilitychange` |

What the script is allowed to write, and nothing else:

- the `transform` attribute on the five sound-object groups (SP-13)
- the `transform` style on the five watermark elements (SP-19) — one
  assignment, `translateY(scrollY × 0.16)`
- the `r` and `font-size` of nothing — those are CSS (SP-13)
- the `href` attribute on three `<a>` elements (SP-05)

SP-18's action target is CSS and inline SVG. **No part of the call to action is
scripted**, and the script does not touch it.

It adds no element, removes none, sets no class, sets no inline style property,
never assigns `innerHTML`, and calls `getBoundingClientRect` zero times inside
the loop.

**Everything renders and reads with JavaScript off.** The hero's resting state
is the drawn plot with its five objects at their authored positions, written
into the markup as literal `transform` attributes. No element is hidden
awaiting a script. Every link resolves. The contact route works (SP-05).

Under `prefers-reduced-motion: reduce` the loop never starts: the script
short-circuits on one `matchMedia` check and the page is identical to its
JavaScript-off render.

The site ships one theme, `ground-light`, ground `#EDEBE6`. There is no
toggle, no `prefers-color-scheme` branch, and no dark stylesheet in the repo.

Two scored viewports: **390×844** and **1440×900**. Both are first-class.

Five devices carry the design beyond the hairline grid: the frame (SP-10), the
mark (SP-11), layering (SP-12), the action target (SP-18), and the watermark
(SP-19). Each is specified once as a component and then referenced. Three
further components carry the hero: the sound objects (SP-13), the scroll scalar
(SP-14), and the drawn elements (SP-15). SP-16 governs placeholder copy and
SP-17 governs weight.

### Revision of 2026-11-24, after the phone review

Four findings from Andrew looking at the built page on a phone beside
other-people.net. Each one resolves to components in this document.

| Finding | Resolution |
|---|---|
| Too thin — the page reads washed out beside Other People | SP-17. Three settled line values — `--line` `#3A3732`, `--line-strong` `#141210`, and a new `--line-detail` `#5E5A53` — plus the weight floors W1–W4 in the skill, applied here component by component. **Settled and built; not reopened by this revision** |
| Too text reliant | SP-15 G-05, tightened from eight prose blocks to five, from 420 words to 170, and now capped per section at one block and 55 words. Eight paragraphs are deleted outright, three become registers, one becomes a plot |
| The call to action should feel graphic | SP-18. `Start a project` becomes a crosshair on a point, inside a ring, on a 2px datum. The underlined text link is withdrawn, and so is G-04, which SP-18 absorbs |
| A watermark the text scrolls over | SP-19. Six instances of the mark at page scale, in outline, in `--watermark` `#E4E1DB`, at stacking level `-1`, lagging the scroll at 0.16. **Built; documented here as built** |

---

## 1. Information architecture

Three pages ship. A fourth slot is defined and held empty.

| Path | Title | Exists | Purpose |
|---|---|---|---|
| `/index.html` | Astral Spatial | now | Say what the practice does, prove it once, route to email |
| `/work.html` | Work | now | The records at full length, split by who commissioned them; a place for the next five |
| `/studio.html` | Studio | now | The three CVs, the full capability register, the reserved collaborators slot |

Nothing else. No contact page: the call to action is an email, and a page whose
only content is an address is a dead end. The contact link (SP-05) appears four
times per page — desktop header, hero or page head, contact band, footer — and
the address itself is never rendered as text anywhere.

### Reserved: friends and collaborators

Specified now, published later. It is `04 — FRIENDS AND COLLABORATORS` on
`studio.html`, sitting between `03 — CAPABILITIES` and the contact band.

- It uses the **register** component built for home section 03 (SP-15 G-02):
  one column of hairline rows, each row a name with a 1px rule running out to
  a point on a shared axis.
- Each entry is three fields on one row: name, discipline as its axis
  position, and the project they worked on set at `body-s` after the name.
- It inherits the standard section rhythm. Adding it moves the contact band
  down the page and changes nothing else. No new component, no new type size,
  no new breakpoint behaviour.
- Publication condition: at least two names, each attached to a finished,
  nameable project.
- First intended entry: Cam Finley, fabrication. Until the condition is met,
  Cam Finley's name does not appear on any published page, in any markup, or
  in any image alt text.

### Work record numbering

Three records ship. Indices are catalogue designations, assigned once, and are
never re-flowed when a record is withheld or added.

| Index | Record | Commission | Page |
|---|---|---|---|
| `W/01` | Reforesters Laboratory | Astral Spatial | home 02, work 01 |
| `W/02` | MoFE | Predates Astral Spatial | home 02, work 02 |
| `W/03` | Reserved | — | not published |
| `W/04` | Unnamed fabrication commission | Astral Spatial | home 02, work 01 |

`W/03` is a reserved index. It is not published, it has no record, no image
slot, no prose, no credit line, and no weight budget, and no page describes
what it would hold. So `work.html` reads `W/01`, `W/02`, `W/04`. A gap in a
catalogue number is correct catalogue behaviour and is not explained.

Nothing on any page depends on the number of work records: records are a flow
list of full-width rows, never a fixed-count grid, so adding or removing one
changes one row and no other measurement. The same holds in reverse for
`W/05`.

Every work record carries SP-09. No exceptions.

### Withheld work

Some of the principals' prior work is under NDA and cannot be published. The
spec states the constraint and names nothing: no title, no city, no room type,
no date, no client, and no indication of which principals were involved, in
any page, any markup, any comment, any alt text, any `FIG.` caption, or any
image filename. A withheld project is not described generically either — a
description specific enough to be useful is specific enough to identify.

This is why the record component is a flow list and why indices are never
re-flowed. A record that cannot be published is simply absent, and its absence
costs one row and changes no measurement.

---

## 2. Shared components

### SP-00 — Section rule and label

Every section on every page opens with a 1px `--line` rule across the content
width, then its label.

| Element | Token | Colour |
|---|---|---|
| Section rule | 1px solid | `--line` `#3A3732` — R2, per the skill's W3. At 9.9:1 a 1px section rule reads as structure without reading as a border; R1 is reserved for the rules that bound a region rather than separate two |
| Section number + name, e.g. `02 — SELECTED WORK` | `label` | `--fg-primary` |

A section label is an `<h2>`. It was set at `--fg-muted`, which made every
heading on the page the lightest type in its own section. It is the structural
heading and it carries the structural colour.

Vertical gaps per the skill's section rhythm table: 128/24/48 at ≥1024px,
64/16/32 at ≤767px.

The rule carries the mark (SP-11) at its right end, in `--fg-primary`: a 32px
gap at ≥768px with the 16px mark centred in it, a 28px gap at ≤767px with the
14px mark centred in it. The gap is at the right end of the content width, so the rule reads as
starting at the left margin and terminating in the mark. One mark per section
rule, never two.

The contact band's top and bottom rules carry no mark — the band is
unnumbered, and the footer's mark is 192px below it, which is close enough
that a third instance would read as a pattern rather than a terminator.

Section numbers restart at `01` on each page. The home hero, the index band,
the contact band, and the footer are unnumbered.

### SP-01 — Header

Full-bleed, static (not sticky), 1px `--line-strong` bottom rule (R1).

**≥1024px**, height 64px, page margin per grid:

- Left: `ASTRAL SPATIAL`, `wordmark` token, `--fg-primary`. On `/` it is a
  `<p>`; on other pages it is an `<a href="/">`.
- Right, in one row, 32px gaps, vertically centred: `WORK`, `STUDIO`, a 1px
  `--line` vertical divider 16px tall, then the contact link (SP-05) reading
  `CONTACT` at `label` size in `--fg-primary`.
- Nav items at rest are `--fg-body`, hover and `:focus-visible`
  `--fg-primary`. They were `--fg-muted`; a 12px nav at 5.75:1 is the first
  thing a reader looks for and the lightest thing on the page.
- Current page's nav item: `--fg-primary`, no underline.

**≤767px**, height 56px:

- Left: wordmark at 16px. Right: nothing.
- Navigation at this width lives in the index band (SP-06) and the footer.
  No hamburger, no drawer, no JavaScript menu.

### SP-02 — Footer

Appears on all three pages. 1px `--line-strong` top rule (R1). Preceded by
192px of space at ≥1024px, 96px at ≤767px.

The top rule carries the mark (SP-11) at its **left** end, in `--fg-primary` — the one mirrored
instance on the site. 40px gap at ≥768px with the 24px mark centred in it,
32px gap at ≤767px with the 16px mark centred in it. The gap starts at the
left page margin, so the mark sits where the rule would otherwise begin.

Row 1, navigation, `label` token, `--fg-body`, current page `--fg-primary`:
`HOME` `WORK` `STUDIO`.

Row 2, status bar, `label` token, `--fg-muted` at ≥768px and `--fg-body` at
≤767px per W1 — the status bar is the one W2 subordinate rank in the footer —
five cells:
`ASTRAL SPATIAL` · `NEW YORK` · `SPATIAL AUDIO, SYSTEMS, FABRICATION` ·
the contact link (SP-05, reading `CONTACT`, `--fg-primary`) · `© 2026`.

No cell renders an email address. `id="email-fallback"` is deleted from the
document; SP-05 no longer uses an in-page fallback anchor.

| | ≥1024px | ≤767px |
|---|---|---|
| Row 1 | one row, 48px tall, 32px gaps | three rows, 44px tall each, 1px `--line` between |
| Row 2 | one row, 48px tall, cells separated by 1px `--line` vertical rules | five rows, 44px tall each, 1px `--line` between |

### SP-03 — Record

The single repeating content unit: used for offerings, work entries, and
people. A record is a row, never a card. No border except its top rule, no
background, no radius, no shadow.

**≥1024px**, 12 columns:

| Columns | Content |
|---|---|
| 1–2 | Index, `index` token, `--fg-primary`, e.g. `001`, `W/01` |
| 3–7 (546px) | Title (`title`), then prose (`body`) where the record has any |
| 9–12 (432px) | The metadata register |

Top rule 1px `--line` across the full content width (R2). 64px between sibling
records.

**The metadata register.** The metadata column is a table, not a list. Each
field is a 32px row at ≥1024px and 32px at ≤767px, `label` token,
`--fg-body`, with a 1px `--line` rule between rows (R2) and no rule above the
first or below the last. The register reads as a specification sheet, which is
what it is, and the rules are what make it read as one rather than as a column
of loose words.

Line-height 2.0 and bare rows are withdrawn. They produced a column of 11px
grotesque at 5.75:1 floating in space, which was the single largest block of
washed-out ink on the page.

**≤767px**, stacked:

1. Top rule.
2. Index, `index` token, 16px below the rule.
3. Title, `title` at 24px, 16px below the index.
4. Prose, `body` at 16px, 16px below the title, where the record has any.
5. The metadata register, `label` at 11px in `--fg-body`, 32px below the
   preceding element, rows 32px tall with 1px `--line` between.

48px between sibling records.

**Hover**, ≥1024px and `(pointer: fine)` only: top rule `--line` →
`--line-strong` over `--dur-fast`; index numeral `translateX(8px)` over
`--dur-fast`, `--ease-out`. Nothing else changes. A record is not a link, so
this is an affordance for the drawn row, not for navigation.

**Metadata column composition.** For offerings (`001`–`003`) the column opens
with the record's G-01 diagram, 24px of clear, then the register. For people
(`P/01`–`P/03`) the column is the register alone. For work records
(`W/01`–`W/04`) the column opens with SP-09, then a 1px `--line` rule with
16px clear above and below, then the register. The record component
treats the credit line as the column's first child so it cannot be omitted by
accident.

### SP-04 — Right-edge section rail: withdrawn

The rail is removed from the design. It was a fixed 1px vertical hairline
`top: 25vh; bottom: 25vh` at `right: 40px`, carrying the current section's
label in `writing-mode: vertical-rl`.

It goes for four reasons:

1. The frame (SP-10) puts a fixed 1px vertical hairline 17px from the right
   edge. The rail would put a second fixed vertical hairline 23px further in.
   Two parallel fixed verticals that close to each other read as a mistake,
   not as a system.
2. The rail's job was to mark the page's right edge as a drawn object. The
   frame does that job on all four edges and at every breakpoint, where the
   rail only worked at ≥1024px.
3. It was the only JavaScript on the site beyond the email rewrite, and it was
   never wired. Removing it costs nothing built and keeps the JS budget at one
   function.
4. Section position is already carried twice, by the index band and by the
   section labels.

Builder actions: delete the `.rail` block and its `@media` variants from
`style.css`, delete the `<div class="rail">` element from `index.html`, and
delete every `data-rail` attribute. Nothing replaces it in that position; the
right margin stays empty between the content and the frame.

The vertical edge typography taken from publicrecords.nyc is not retained
anywhere. What is retained from that reference is the layering, SP-12.

### SP-05 — The contact link

The call to action is a verb, not an address. The published address stays
`info@astralspatial.com` and it is **never rendered as text anywhere on any
page**: not in a heading, not in a status cell, not in an `alt`, not in an
`aria-label`, not in JSON-LD, not in `sitemap.xml`, not in an SVG `<text>`.
It exists in exactly one place per page: one `href`.

#### What the reader sees

| Placement | Visible text | Token | Colour | Form |
|---|---|---|---|---|
| Desktop header | `CONTACT` | `label` | `--fg-primary` | Text link |
| Home hero | `Start a project` | `link-cta` | `--fg-primary` | SP-18 action target, hero scale |
| Contact band | `START A PROJECT` | `statement` | `--fg-primary` | SP-18 action target, band scale |
| Footer status cell | `CONTACT` | `label` | `--fg-primary` | Text link |

`START A PROJECT` at `statement` 56px measures about 400px, so it sits inside
columns 1–8 (774px) on one line. At 30px it measures about 215px inside a
350px content width. It must not wrap at either width, and at 390px it clears
the frame's inner rule by more than 100px — which is also the fix for the
clipped address the last critique measured at x=382.

#### Accessible name

The accessible name of every instance **is its visible text**. Nothing more.

- No `aria-label` on any contact link, on any page. The four
  `aria-label="Email Astral Spatial at info at astralspatial dot com"`
  attributes in the current build are deleted. They spelled the address out in
  the accessible tree, which defeated the obfuscation beside them and failed
  Lighthouse's `label-content-name-mismatch` on all four instances.
- No `title`, no visually hidden span, no `aria-describedby`.
- A screen reader announces `link, Start a project`. That is a complete and
  honest name for a link that opens a mail composer.

#### Where the address is defined

The contact band's link carries the real `href`, fully percent-encoded:

```html
<a class="cta-start statement" href="mailto:%69%6e%66%6f%40%61%73%74%72%61%6c%73%70%61%74%69%61%6c%2e%63%6f%6d">
  <svg class="tg" aria-hidden="true" focusable="false"><use href="#tg-32"></use></svg>
  <span class="tg-text">Start a project</span>
</a>
```

The two drawn rule spans that flank it are siblings of the `<a>`, not children
of it, so they stay out of the accessible name and out of the focus ring's
contents. Full markup in SP-18.

Every browser resolves a percent-encoded `mailto:` natively. No script is
needed for it to work.

The other three instances carry `href="#contact"`. Three lines of script copy
the real `href` onto them:

```js
var c = document.querySelector('.cta-start');
if (c) for (var a of document.querySelectorAll('.cta-jump')) a.href = c.href;
```

**With JavaScript off**, the header, hero, and footer links scroll to the
contact band, where the working mail link sits at 56px. Every route reaches a
live mail composer in at most one additional click. No dead end, no broken
link for the link checker — `#contact` is an element that exists on every
page, and a `mailto:` is not an HTTP target.

**Changing the address** is one edit per page: the single `mailto:` href in the
contact band. `grep -c 'mailto:' *.html` returns exactly `1` for each of the
three pages, and `grep -ric 'info@astralspatial' .` over the published files
returns `0`.

#### Honest limit

No client-side scheme defeats a scraper that renders the page. A headless
browser reads the resolved DOM, and `decodeURIComponent` is one call. Nor does
percent-encoding defeat a regex author who expects it. What this removes is the
surface a plain-text crawler finds: the literal address appears in no text
node, no visible string, no accessible name, and no unencoded attribute on any
page. The goal is reducing surface, not a guarantee.

What is deliberately given up in exchange: a reader can no longer read the
address off the page to type it elsewhere. The brief's call to action is a
clickable mail route, and the clickable route works with and without
JavaScript, so this is the right trade.

#### Styling

**The two primary instances are SP-18 action targets and carry no underline,
no border-bottom, and no `text-decoration`.** The drawn object is the
affordance: a 2px datum stopped either side of the words, with a crosshair on a
point sitting on the line. The hero instance and the contact-band instance
differ only in text token, target symbol, four gap values, and anchoring;
everything else about them is one component.

The header and footer instances stay text links. Text `--fg-primary` at rest,
with a 1px **`--line`** `#3A3732` underline at 6px offset; on hover and
`:focus-visible` the underline goes `--fg-primary` `#141210` over `--dur-fast`.
The text never changes colour, so the cell is at 15.7:1 in every state and the
hover is carried by the rule, which is a `border-color` transition and on the
sanctioned list.

The underline is `--line`, not `--line-strong`: `--line-strong` is
`--fg-primary` exactly, so a `--line-strong` underline brightening to
`--fg-primary` on hover is a transition between two identical colours and the
affordance has no state. 9.9:1 → 15.7:1 is a visible change at 1px.

At ≤767px every instance is `display: inline-block` with `padding: 8px 0` so
its tap target is ≥44px tall.

The previous scheme — `--fg-muted` text with a `--fg-muted` underline,
brightening to `--fg-primary` on hover — is withdrawn. It put the primary
action's two smaller instances at 5.75:1 and gave them a 1.94:1 affordance,
which on a phone in daylight is neither visible nor hoverable.

#### Removed by this component

The `data-mail`, `data-u`, and `data-d` attributes; the five-child
`<span>`/`<i>` assembly; `.mail .at::before` and `.mail .dot::before`; the
reversed-domain string `moc.laitapslartsa`; `id="email-fallback"`; and the
loop that rewrote four hrefs from dataset values. All of it existed to render
an address as text while hiding it from a crawler. The address is no longer
rendered as text, so none of it is needed.

### SP-06 — Index band

The catalogue register that doubles as navigation, after other-people.net.
Sits directly under the hero on `/` and directly under the page title on
`work.html` and `studio.html`. Lists that page's numbered sections as in-page
anchors.

**≥1024px**: one row, 56px tall, 1px `--line-strong` above and below (R1).
Cells of equal width separated by 1px `--line` vertical rules (R2). Each cell:
number in `index`, 16px gap, name in `label`. Rest `--fg-body`, hover and
`:focus-visible` `--fg-primary` over `--dur-fast`.

**≤767px**: one row per section, 56px tall, 1px `--line` between. Number flush
left, name 16px to its right, a 12px `↓` glyph flush right in `--fg-body`.
56px rows satisfy the 44px tap-target floor.

The band is navigation and it is the second thing a phone reader meets. At
`--fg-muted` it was seven rows of near-invisible 11px caps; at `--fg-body` it
is a register.

At ≤767px the band carries two extra rows at the end — `WORK` and `STUDIO` —
which are the cross-page navigation missing from the mobile header. Those two
rows are not shown at ≥1024px, where the header carries them.

### SP-07 — Image plate

The state of every image slot before its photograph exists. Costs 0KB.

- The exact box dimensions the photograph will occupy.
- 1px `--line-strong` border (R1 — a plate frame is structural), `--ground`
  fill.
- Four corner ticks, 12px long, 1px `--line-detail`, inset 8px.
- Centred: `label` token, `--fg-muted` at ≥768px and `--fg-body` at ≤767px,
  naming what the plate will hold, e.g.
  `PLATE — INSTALLATION, REFORESTERS LABORATORY`.
- The same caption bar the photograph will carry.
- No motion.

When the photograph arrives the fill changes and nothing else does.

**The mat.** Where the spec calls for a matted plate (SP-12 L2), the mat is
`--band` and the plate's hairline sits on the mat's outer edge in
`--line-strong`, per the skill's photography section. Mat widths: `--s-3`
(24px) top, left, and right at ≥768px, `--s-2` (16px) at ≤767px. The bottom
mat is wider where it carries type — 96px at ≥1024px, 48px at ≤767px — which
is an asymmetric window mount, not a caption bar.

**When type sits in the bottom mat**, the plate's own centred label is centred
in the area above the bottom mat rather than in the plate box. At ≥1024px on
the home section 02 band the bottom mat is 96px of 560px, so the label centres
on the remaining 464px: 232px from the plate's top edge. At ≤767px it is 48px
of 220px, so the label centres at 86px. The plate label and the mat type never
collide and neither is clipped.

### SP-08 — Array plot

The hero visual before installation photography exists. Inline SVG, so no
request. ≤6KB of markup. `role="img"`, `aria-label="Diagram of a twenty-four
point speaker array around a listening position"`.

`viewBox="0 0 560 560"`, `preserveAspectRatio="xMidYMid meet"`. Rendered at
546×546 at ≥1024px, 350×350 at ≤767px.

Contents:

| Element | Spec |
|---|---|
| Frame | 1px `--line-detail` square, inset 0.5px. R3 context — the plot's boundary is not the subject, and the one rule that crosses `lead` at ≥1440px is this frame's left edge. L1 constraint 4 names R2 as the crossing rank for page rules; this is a drawing stroke rather than a page rule, and it crosses at 5.75:1 against `--fg-body` at 12.3:1, which is lighter still. A drawing stroke may cross only where the drawing itself is permitted to overlap text, per L1's 25% clause |
| Outer ring | 16 points at r=228 from centre |
| Upper ring | 6 points at r=150, rotated 11.25° from the outer ring |
| Height layer | 2 points at r=60, above centre |
| Point | `--pt` — 4.1 viewBox units at ≥768px, 6.4 at ≤767px, so the point renders **4.0 ±0.3 CSS px square at every viewport**. `--fg-primary`. Positioned by `transform="translate(cx cy)"` with `x` and `y` at `calc(var(--pt) * -0.5)`. The previous 3×3 unit point rendered 1.9px at 390px, which is the thinnest mark the build shipped |
| Numerals | `01`, `04`, `08`, `12`, `16`, `20`, `22`, `24` only, `index` token at 10px, **`--fg-body`** — W1 puts nothing muted below 12px — set 10px radially outward |
| Listening position | 16×16px 1px crosshair, `--fg-primary`, at centre, with a 4×4 `--fg-primary` point at its crossing, labelled `LP` 10px to its right in `--fg-body`. This is the figure SP-18's action target enlarges and encircles. The two are the same drawing at two scales, which is why the call to action looks like it belongs on this page |
| Spokes | 8 hairlines, centre to each numbered point, 1px `--line-detail` (R3) |
| Measurement ticks | Left and bottom edges, 1px, `stroke-dasharray: 2 4`, `--line-detail`. Their captions are type, not strokes, so they stay `--fg-body` per W1 |
| Signal line | The plot's one W4 emphasis stroke: **2px** `--fg-primary` with `vector-effect="non-scaling-stroke"`, from the centre cross to point 01. No glow: `--glow` is `transparent` on the light ground. Emphasis is carried by weight and contrast — 2px at 15.7:1 against neighbouring 1px rays at 5.75:1 — and by the ray's own tick column at 16px pitch against 32px on the rest of the plot. It is the same stroke, at the same weight and colour, as SP-18's datum: the signal arriving at a point |
| Sound objects | Five, per SP-13. Drawn in a `<g class="objs">` placed after the spokes and points and **before** the numerals, the `LP` cross, and the `LP` label in document order, so plot type always draws over an object and never under it |
| Caption bar | Flush under the frame, 32px tall, 1px `--line` top rule (R2), `label` token, `--fg-muted` at ≥768px and `--fg-body` at ≤767px. Left cell `FIG. 01`, right cell `24.2 — REFORESTERS LABORATORY` |

**Draw-on motion**, CSS `@keyframes` only, plays once on load, total ≤2000ms:

1. Frame draws clockwise from top-left, `stroke-dashoffset` → 0,
   `--dur-draw`, `--ease-io`.
2. Spokes draw outward from the centre, `--dur-slow`, `--ease-out`, starting
   at 400ms, stagger 60ms.
3. Points fade in `opacity` 0→1 in index order, `--dur`, stagger 60ms,
   starting at 700ms. Maximum 8 staggered groups: points are grouped in
   threes.
4. Numerals and caption bar fade in, `--dur-slow`, starting at 1400ms.
5. The five sound objects fade in last, `opacity` 0→1, `--dur-slow`, all five
   together, starting at 1700ms. They are at their authored rest positions
   throughout the draw; they do not begin travelling until 2040ms (SP-13).

Under `prefers-reduced-motion: reduce` every element renders at its final
state with `animation: none`, including the five objects at full opacity at
their rest positions. The plot is never blank.

**When photography arrives**: the plot moves to `work.html` beside the
Reforesters record, where it is literally true, and IMG-01 takes the hero
slot. The hero slot is a 546×546 square at ≥1024px and 350×350 at ≤767px
either way. The swap is a markup change inside one grid cell.

### SP-09 — Credit line

Mandatory on every work record. It is the component that makes the brief's
attribution convention impossible to omit.

**Position.** It is the **first** child of the record's metadata column, above
the technical metadata rows, separated from them by a 1px `--line` rule with
16px above and 16px below the rule. Technical rows are the component's second
child, never its first. A record whose metadata column opens with
`Q-SYS PROGRAMMING` instead of `CREDIT —` is built wrong.

**Content.** Three rows, fixed order, no row ever dropped:

| Row | Prefix | Carries |
|---|---|---|
| 1 | `CREDIT —` | Who did what. Either `ASTRAL SPATIAL`, or named individuals with their part, semicolon-separated |
| 2 | `YEAR —` | A year or a range |
| 3 | `COMMISSION —` | Exactly one of two strings: `ASTRAL SPATIAL` or `PREDATES ASTRAL SPATIAL` |

**Type.** `label` token, `--fg-body`, in the same 32px register rows as the
technical metadata beside it. Not smaller, not italic, not parenthetical, not a
different colour. The credit carries the same visual weight as the hardware
list because it carries the same kind of fact. When SP-17 moved the register to
`--fg-body`, the credit line moved with it, which is the point of specifying
them as one type.

Row 1 wraps freely; it is the one row allowed more than one line. It grows the
row rather than overflowing it, flush left with no hanging indent.

**Defect conditions**, all checkable in a screenshot:

- Any `W/` record showing fewer than three credit rows.
- Any `COMMISSION —` value other than the two sanctioned strings.
- A credit line set below the prose, or in the prose, rather than at the head
  of the metadata column.
- A credit line at a smaller size or a lighter colour than the technical rows.
- A credit line rendering `--fg-muted` at any width.

**At ≤767px** the metadata column stacks below the prose. The credit line
stays first within it, so reading order is prose → credit → technical rows.

### SP-10 — Site frame

Every page. Fixed to the viewport, drawn as four `--frame-fill` strips with
a 1px `--line` rule on each inner edge (R2). Geometry, colour, interruption,
corner ticks, and measurement marks are specified in the design-language
skill under "The frame". This component states the markup and the
interactions.

**Markup**, immediately after the skip link, before `<header>`:

```html
<div class="frame" aria-hidden="true">
  <span class="fr fr-t"></span><span class="fr fr-r"></span>
  <span class="fr fr-b"></span><span class="fr fr-l"></span>
</div>
```

Four elements. Corner ticks are `::before` and `::after` on `.fr-t` and
`.fr-b`; the measurement marks are `::after` on `.fr-l`. No extra markup, no
SVG, no image.

**The document is inset to match.** `body { padding: var(--frame); }`.
`--frame` is 8px at ≤767px and 16px at ≥768px. Consequences, all intended:

- Full-bleed means bleeding to the frame's inner edge. The header rule, the
  index band, the image band, the contact band, and the footer rule all span
  exactly the frame's inner width. None of them touches the viewport.
- The page margin is measured from the frame. At 390px: 8px frame inset, 1px
  rule, then 20px page margin — body copy starts 28px from the viewport edge
  and `.shell` content is 350px wide. At 1440px: 16px, 1px, 48px — content
  1344px, unchanged from the current build, because the 1680px cap and the
  48px margin both still apply inside the inset.
- `.shell` keeps `max-width: 1680px; margin-inline: auto`. The cap now applies
  to the inset width, so the grid is identical at every scored viewport.

**Scrolling.** The frame does not move. Content scrolls behind the strips and
is cut at the inner rule. Because the strips are opaque `--ground`, a 56px
heading scrolling past the top edge disappears cleanly instead of being
crossed by a hairline. This is the reason the strips are filled rather than
being four `border` edges on a transparent box, and it is checkable: screenshot
mid-scroll and no glyph is bisected by the frame rule.

**Z-order and events.** `z-index: 40`, `pointer-events: none`,
`aria-hidden="true"`. The skip link moves to `z-index: 50` so it still renders
above the frame when focused. No other element declares a `z-index` above 1.

**Breakpoint behaviour.**

| Band | Inset | Rule | Interruption | Corner tick arms | Left measurement marks |
|---|---|---|---|---|---|
| ≤767 | 8px | 1px `--line` (R2) | 16px each end | 8px, `--line-detail` | none |
| 768–1023 | 16px | 1px `--line` (R2) | 24px each end | 16px, `--line-detail` | none |
| 1024–1439 | 16px | 1px `--line` (R2) | 24px each end | 16px, `--line-detail` | 5 × 8px at 32px pitch, `--line-detail`, centred on `50vh` |
| ≥1440 | 16px | 1px `--line` (R2) | 24px each end | 16px, `--line-detail` | 5 × 8px at 32px pitch, `--line-detail`, centred on `50vh` |

The edge rule is R2, not R1, for one reason: at ≤767px the strips are
transparent and the rule passes over prose, and R2 is the only rank L1 permits
to cross text. `--line-strong` is `--fg-primary` exactly, so an R1 frame rule
crossing a paragraph would be the same ink as the paragraph.

The three colour changes in that table are the frame's whole contribution to
SP-17. The geometry, the inset, the interruptions, the arm lengths, and the 1px
width are all unchanged: at a 9px inset on a phone, 2px reads as browser
chrome, so the weight is bought with the token and not with the width.

**At 390px**, the whole frame costs 9px per side, 18px of 390, 4.6% of the
width. It stays 1px, not 2px: nowhere else on the site is a rule 2px, and at a
9px inset a 2px rule reads as a browser border. The gain in presence is not
worth the gain in weight at that size.

**No motion.** The frame renders complete on first paint under every motion
preference. It is not drawn on load, it does not fade, and it does not react
to scroll or hover.

**Screenshot checks.** At 1440×900: a hairline rectangle 17px in from each
viewport edge sampling `#3A3732`, interrupted 24px before each corner, with a
16px L-tick at each corner sampling `#5E5A53`, and five short ticks pointing
inward from the left edge around the vertical centre, also `#5E5A53`. At
390×844: the same without the measurement ticks, 9px in, with 8px corner arms.
At both widths the corner tick is visibly **lighter** than the edge rule it
terminates — reversed from the previous revision, because the edge rule is now
the near-black one and the tick is the measuring mark.

**Mobile fill.** `--frame-fill` is `transparent` below 768px and `--ground`
from 768px up. Each strip sets `background-color: var(--frame-fill)`. Below
768px the frame is the rule, the corner ticks and the measurement ticks only;
content passes visibly under the top and bottom rules as it scrolls. Verify by
scrolling until a heading crosses the top rule: the heading must remain
readable above the rule, not be clipped by an opaque band.

### SP-11 — The mark

One inline SVG shape. Geometry and the placement rule are in the skill under
"The mark". This component states the markup and the per-page census.

**Declaration**, once per page, first element inside `<body>` after the skip
link and frame:

```html
<svg class="mk-defs" aria-hidden="true" focusable="false"
     style="position:absolute;width:0;height:0;overflow:hidden">
  <symbol id="mk" viewBox="0 0 24 24">
    <g fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="butt">
      <line x1="9" y1="15" x2="9" y2="6.93"/>
      <line x1="9" y1="15" x2="18.07" y2="15"/>
      <line x1="9" y1="15" x2="5.9" y2="17.79"/>
    </g>
    <g fill="currentColor" stroke="none">
      <polygon points="9,3.5 10.05,7.4 7.95,7.4"/>
      <polygon points="21.5,15 17.6,16.05 17.6,13.95"/>
      <polygon points="3.35,20.09 5.55,16.7 6.95,18.26"/>
    </g>
  </symbol>
</svg>
```

**Placement**, `<svg class="mk" aria-hidden="true" focusable="false"><use
href="#mk"/></svg>`, absolutely positioned in the gap in its rule, vertically
centred on the rule.

Every instance is `aria-hidden="true"` and `focusable="false"`. It has no
`<title>`, no `alt`, no `aria-label`, no tooltip, and no caption. It is never
referred to in copy.

**Home page census**, seven instances:

| Instance | Rule | Size | Colour |
|---|---|---|---|
| 1 | Section 01 rule, right end | 16px / 14px | `--fg-primary` |
| 2 | Section 02 rule, right end | 16px / 14px | `--fg-primary` |
| 3 | Section 03 rule, right end | 16px / 14px | `--fg-primary` |
| 4 | Section 04 rule, right end | 16px / 14px | `--fg-primary` |
| 5 | `ALL PROJECTS` link row rule, right end | 14px | `currentColor` |
| 6 | `FULL BIOGRAPHIES` link row rule, right end | 14px | `currentColor` |
| 7 | Footer top rule, **left** end | 24px / 16px | `--fg-primary` |

The `12px` mobile size in the previous revision was a typo against the skill,
which sets the mark's floor at 14px because below it the three triangles
collapse into the lines. 14px is the mobile size on every instance.

Nowhere else. Not on the hero, not in the index band, not on the plot's
caption bar, not on the image band caption, not on the contact band, not in
the header, not beside a record title.

**Rejected placements**, so they do not creep back: the index band's `↓`
affordance stays a `↓`, because swapping a directional glyph for a
non-directional mark costs a mobile reader real information; the array plot's
caption bar stays text-only, because the plot already *is* the geometry the
mark abbreviates and putting both in one frame explains the joke.

**Link row change.** The `→` in `ALL PROJECTS →` and `FULL BIOGRAPHIES →` is
deleted. The row's rule carries the mark at its right end instead, at 14px,
`stroke: currentColor`, so it brightens from `--fg-body` to `--fg-primary`
with the row's existing 120ms colour transition. Link-row text rests at
`--fg-body`, not `--fg-muted`. No `→` glyph remains anywhere
on the site.

**Favicon.** `favicon.svg` is the mark on a `#EDEBE6` ground, 24×24 viewBox
scaled to a 32×32 box with 2px of padding, strokes and triangles in
`#141210`. It replaces the nine-square grid previously specified. ≤700 bytes.
The mark is never rendered below 14px anywhere else.

### SP-12 — Layering

**Reversed from the previous revision.** Rules pass *over* text and text is
never masked. The opaque `--ground` knockout is withdrawn from the design, and
with it the only mechanic that made type-on-photograph safe. Mechanics L1 and
L2 are redefined in the skill under "Layering". This component states where
they are used and what each composition measures.

In one sentence: **a hairline crossing a line of type crosses it, and both stay
visible; type sits on the ground or on `--band`, never on a photograph.**

#### Why the knockout is gone

It punched the page colour out behind type. That is what produced the 200px
hole in the `ALL PROJECTS` rule, and it is the opposite of the layering the
brief takes from publicrecords.nyc, where things overlap and both remain
visible. Every instance of `.w01-knockout` and `.w04-knockout` comes out of
the markup and the stylesheet, and the word does not return.

#### L1 — hairline over text

A 1px rule, or a plot hairline, passes over a line of type. The rule is at
stacking level 2, the type at level 1. Neither changes colour, size, or
opacity. The rule is not interrupted, not faded, and not re-coloured at the
crossing.

Legibility is preserved by five constraints, all measurable in a screenshot:

1. **The rule is 1px.** At the smallest size L1 permits — `title-s` 18px, cap
   height about 12.6px — a 1px horizontal interruption removes 8% of the
   glyph's vertical extent at one y value. Latin letterforms survive a single
   1px horizontal cut: the cut is thinner than every stem it crosses, so no
   stem is severed, only crossed.
2. **Only display type is crossed.** `statement`, `title`, and `title-s`
   only. A rule never crosses `lead`, `body`, `body-s`, `label`, or `index`.
   Prose is never crossed anywhere on the site. This is the hard line: the
   effect is applied to four or five words on a page, never to a paragraph.
3. **The crossing height is bounded.** The rule's y must fall in the middle
   third of the crossed line's cap height, and no closer than 2px to the
   baseline or to the x-height line. A rule on the baseline reads as an
   underline; a rule at the x-height merges with the horizontal bars of `e`,
   `a`, and `t` and the word turns to mud. Checkable: measure the rule's y
   against the line's cap box in a crop.
4. **The crossing rule is R2 `--line` `#3A3732`, and only R2.** At 9.9:1
   against `--fg-primary` at 15.7:1 the rule is measurably lighter than the
   type it crosses, the crossed glyph keeps 94%+ of its ink, and the type's own
   contrast stays 15.7:1 everywhere, unchanged. An R1 crossing is forbidden:
   `--line-strong` is `--fg-primary` exactly, so the rule and the glyph would
   be one piece of ink and the word would be cut rather than crossed. An R3
   crossing is forbidden too: at 5.75:1 the rule vanishes into the word and
   reads as a printing fault rather than a decision.
5. **At most two crossings per page**, and never two on the same text block.
   The device reads as deliberate at two instances and as an accident at six.

**Hero use, ≥1440px only.** Unchanged in geometry, changed in z-order. The
array plot's box widens left so it overlaps the hero text column by 48px. The
only thing inside the plot's left 48px is the plot frame's left rule, at
x ≈ 0.5px of a 546px render; the dashed tick column at x ≈ 51px is outside the
overlap. That single 1px `--line` vertical now draws **over** the last
characters of the lead paragraph's measure rather than under them.

One exception to constraint 2, named here so it is not read as a defect: this
vertical crosses `lead`, not display type. It is permitted because it is a
single vertical at the end of a line's measure, where the crossed glyphs are
at most one character wide and the reader has already read them. It is the one
vertical crossing on the site. A horizontal rule across `lead` remains
forbidden.

Below 1440px the hero does not layer: at 1024–1439px there is not enough
column width to overlap without pulling the plot's tick column into the text,
and at ≤767px the plot is below the text.

#### When a rule crosses a photograph

`--line` `#3A3732` against an unknown photographic tone has no guaranteed
contrast, so the rule changes colour and nothing else:

- **Over the ground or over `--band`:** 1px `--line`. The default.
- **Over a photograph or a plate's interior:** 1px `--ground` `#EDEBE6`. The
  skill's photography treatment maps every installation photograph so its
  whitest pixel is `#EDEBE6` and its blackest is `#141210`, so a `--ground`
  hairline is at worst equal to the lightest pixel in the image and at best
  sits at 15.7:1 against its darkest.
- **The asset constraint that makes that true:** in the 24px band centred on
  the rule, the photograph must contain no pixel lighter than `#C9C4BB`. That
  is a shooting and retouching requirement recorded against the image slot in
  section 6, checkable with an eyedropper on the delivered asset, and it is
  easily met by the dim installation rooms this site photographs. A plate with
  no photograph yet is `--ground` fill, so the rule over it stays `--line`
  until the asset lands.
- The transition happens at the plate's outer hairline. One rule can therefore
  render in two colours along its length — `--line` across the page, `--ground`
  across the image. That is a drafting convention, not an inconsistency, and it
  is stated so the critic does not score it as one.

#### L2 — mat seating

**Type never sits on a photograph.** It sits on `--ground` (15.7:1) or on
`--band` `#E5E2DC` (14.6:1 for `--fg-primary`, 5.5:1 for `--fg-muted` — both
clear AA at every size on the scale). Both are flat palette colours with
measured ratios. A photograph has no ratio, and with the knockout withdrawn
there is no mechanic that gives it one.

So the layered composition is built the other way round: the type sits inside
the image plate, on the plate's own `--band` mat, which is part of the plate
and is drawn beneath both. The bottom mat is widened to hold it. A print in a
window mount with a deep bottom margin — the type is mounted with the
photograph, not laid on top of it.

| | ≥1024px | ≤767px |
|---|---|---|
| Mat, top / left / right | 24px | 16px |
| Mat, bottom | 96px | 48px |
| Plate hairline | 1px `--line-strong`, mat's outer edge | same |
| Type in the bottom mat | `W/01` at `index`, title at `title` | `W/01` at `index`, title at `title` 24px |

Legibility: `--fg-primary` on `--band` is 14.6:1 whatever the photograph turns
out to be, because the type is not over the photograph. Nothing depends on how
dark the image is.

Degradation: with SP-07 in the slot the mat, the hairline, and the type are
identical; only the plate's interior fill changes when the photograph arrives.

#### Census

Two mechanics, no third. Per page:

| Page | L1 crossings | L2 mats |
|---|---|---|
| home | 2 — the ≥1440px hero vertical, and the `W/01` record's top rule across the image band | 1 — the section 02 image band |
| work | 1 — the `W/01` record's top rule across the IMG-01 band | 1 — IMG-01 |
| studio | 0 | 0 |

No layering on `studio.html`: the bios are the longest prose on the site and
nothing crosses them.

**Forbidden everywhere.** Opaque knockouts behind type. Type over a
photograph. Mouse-tracked transforms. Parallax. Scroll-linked translation of
content. `opacity` scrims. Gradient fades over images. `backdrop-filter`. Text
set in a colour chosen to suit one photograph. Interrupting a rule so type can
pass through the gap.

#### The home section 02 composition, measured

The site's principal layered composition. It works at both scored viewports and
it uses both mechanics at once.

Order of elements: section rule and label, then the image band as a matted
plate, then the `W/01` record whose top rule crosses the band.

| | ≥1024px | ≤767px |
|---|---|---|
| Plate outer box | full-bleed to the frame's inner edge, 560px tall | full-bleed, 220px tall |
| Mat, top / left / right | 24px `--band` | 16px `--band` |
| Mat, bottom | 96px `--band` | 48px `--band` |
| Photograph box inside the mat | width − 48px × 440px | width − 32px × 156px |
| Plate hairline | 1px `--line-strong`, outer edge of the mat | same |
| `W/01` index in the bottom mat | `index`, `--fg-primary` — an index is not a W2 subordinate rank — 24px from the mat's left inner edge, baseline 32px below the photograph | `index`, `--fg-primary`, 16px from the left, baseline 16px below |
| Title in the bottom mat | `title` 32px, `--fg-primary`, left-aligned to the index | `title` 24px |
| Caption bar | `FIG. 02` · `REFORESTERS LABORATORY, WILLIAMSBURG` · `24.2 CHANNEL`, `label`, `--fg-muted`, sitting in the **top** mat, 24px tall | same, in the top mat, 16px tall, two cells on one line and `24.2 CHANNEL` dropped |
| Record top rule | 1px, runs full-bleed and **crosses the plate** at 40px above the plate's bottom edge | 1px, crosses at 20px above the bottom edge |

The record's top rule is the page's second L1 crossing. It runs the full width,
so along its length it is `--line` where it crosses the ground, `--ground`
where it crosses the photograph, and `--line` again across the mat. Where it
crosses the title's cap box it crosses the title — at 40px above the plate
bottom with a 32px-tall title set 48px up from that edge, it passes through
the title's lower third, inside the middle-third window L1 requires. That is
the one place on the home page where a visitor sees a hairline run through a
word, and it is the composition Andrew asked for.

The prose of `W/01` begins below the plate, on the ground.

Degradation: with SP-07 in the slot the mat, the hairline, the caption, the
index, the title, and the crossing rule are all identical. Only the interior
fill changes when the photograph arrives, and the crossing rule's colour over
that interior changes from `--line` to `--ground` at the same time.

#### Record W/04, revised

The vertical image slot sits in columns 9–12. Its SP-09 credit line is **not**
layered. It sits where SP-09 requires it: as the first child of the record's
metadata column, above the technical rows, separated by a 1px `--line` rule
with 16px clear above and below, flush left at `label` size.

The previous revision floated the credit on a 200px `--ground` knockout
outset 32px below the plate. That is withdrawn: the knockout is gone, the
outset pushed the credit 31px outside its own record and punched a hole in the
`ALL PROJECTS` rule below it, and a credit line is `label`-size type, which L1
forbids crossing. Nothing is layered on this record.

The vertical plate keeps its four corner ticks and its centred label. It gets
no mat — a mat is only specified where type sits in it.

### SP-13 — Sound objects

The hero moves. Five sound objects travel through the array field, in the
manner of a Dolby Atmos renderer display: a small ring carrying a number,
moving on the plane. They live inside the SP-08 array plot's SVG, so they cost
zero network bytes and inherit the plot's scaling.

**This is the only element on the site that moves on its own.** It carries the
whole motion budget. Nothing else animates except hover affordances and the
one-time draw-on.

#### Why the objects and not the greyed mark

Andrew sanctioned a greyed axis mark changing scale as a simpler alternative.
It is rejected. The mark's placement rule (SP-11) is that it only ever sits in
a gap in a 1px rule and never moves; animating copies of it floating free in a
plot breaks the rule that keeps the mark meaning one thing, and makes the
site's signature a moving decoration. The objects are a different and truthful
object: the plot is a field, the objects are what travels through it, and a
renderer display is the reference Andrew named.

#### Geometry

One `<g class="obj">` per object inside `<g class="objs">`, positioned by its
own `transform="translate(x y)"`. Each group holds two children, in order:

```html
<g class="obj" transform="translate(476 280)">
  <circle r="var(--obj-r)" vector-effect="non-scaling-stroke"/>
  <text y="0">03</text>
</g>
```

| Property | Value |
|---|---|
| Circle | `fill: var(--ground)`, `stroke: var(--fg-primary)`, `stroke-width: 1` with `vector-effect="non-scaling-stroke"` |
| Radius | `var(--obj-r)` — 11 viewBox units at ≥768px, 17 at ≤767px |
| Numeral | `var(--obj-fs)` — 10 viewBox units at ≥768px, 16 at ≤767px. `--fg-primary`, grotesque, `text-anchor: middle`, `dominant-baseline: central`, `font-variant-numeric: tabular-nums`, `letter-spacing: 0` |

`vector-effect="non-scaling-stroke"` is permitted here and nowhere else. The
skill forbids it on the mark, where the stroke must scale with the shape. On
an object the opposite is required: the ring must render at exactly 1px at
every plot size, because the plot scales 1.56× between breakpoints and a
scaled stroke would be 0.63px on mobile and render as a grey smudge.

#### The number is readable because the object is the same physical size at
#### every viewport

The two-value radius and font size are chosen so the rendered result is
constant, not proportional:

| | Plot render | Scale | Ring diameter | Numeral |
|---|---|---|---|---|
| ≥768px | 546px / 560 viewBox | 0.975 | 21.5 CSS px | 9.8 CSS px |
| ≤767px | 350px / 560 viewBox | 0.625 | 21.3 CSS px | 10.0 CSS px |

**The checkable rule: a sound object measures 21 ±1 CSS px across and its
numeral is 10 ±0.5 CSS px, at 390px and at 1440px alike.** An object that
scales with the plot ends up 13.7px across on mobile with a 6.3px numeral,
which is unreadable, which is why the variables take two values like the type
scale does.

A 10px grotesque numeral has a cap height of about 7.2px. Two digits measure
about 10px. The ring's inscribed square at r = 10.7px is 15.1px. So the numeral
sits with 2.5px of clear space on each side, on an opaque `--ground` fill, at
15.7:1. It is the same size as the plot's existing channel numerals, which are
already on the page and already legible.

Numerals are `03`, `11`, `29`, `38`, `57`. They are object identifiers, not
channel numbers: a renderer numbers objects independently of speakers, and
reusing the plot's channel numerals would say something false. No numeral
duplicates one already in the plot.

#### Paths

Each object travels a closed ellipse centred on the plot's listening position
`(280, 280)`, foreshortened vertically at the mark's own Z ratio so it reads as
a circle seen in perspective rather than as an oval.

x = 280 + a·cos θ  ·  y = 280 + b·k·sin θ  ·  θ = θ₀ + 2πt/T

`k` is the scroll scalar's output (SP-14); it is 1 at rest.

| Obj | Numeral | a | b | T | Direction | θ₀ | Rest `translate` | Peak speed |
|---|---|---|---|---|---|---|---|---|
| 1 | `03` | 196 | 82 | 36s | clockwise | 0° | `476 280` | 33.4 px/s |
| 2 | `11` | 150 | 63 | 34s | counter | 118° | `210 336` | 27.0 px/s |
| 3 | `29` | 120 | 54 | 22s | clockwise | 212° | `178 251` | 33.4 px/s |
| 4 | `38` | 172 | 72 | 41s | counter | 295° | `353 215` | 25.7 px/s |
| 5 | `57` | 128 | 56 | 31s | clockwise | 160° | `160 299` | 25.3 px/s |

`a` and `b` are viewBox units. Peak speed is instantaneous, at the ends of the
major axis, in CSS px/s at the 1440px render; mobile is 0.64× of it.

**Five objects.** Four reads as sparse and does not say "a field"; eight at
21px each inside a 546px plot starts to crowd the geometry the plot exists to
show, and eight numerals at 10px become noise. Five fills the field and leaves
every numeral legible.

Checkable constraints:

1. **No object leaves the plot.** Max radius is object 1 at a + r = 207
   viewBox units; the outer speaker ring is at 228 and the plot frame at 280.
   Every object stays inside the array at all times, at every value of `k`.
2. **No object sits at the centre.** Min distance from `(280, 280)` is
   object 3's b·0.70 = 37.8 units, which clears the 8-unit `LP` cross.
3. **Speed ceiling: 35 CSS px/s instantaneous, at any viewport, for any
   object.** Measurable from two frames of a screen recording.
4. **Periods are 36, 34, 22, 41, 31 seconds** — five distinct values with no
   small common multiple, so the configuration does not visibly repeat.
5. **Directions alternate**, three clockwise and two counter, so the field
   does not read as a single rotating wheel.

#### Z-order inside the plot

`<g class="objs">` sits after the rings, spokes, points, and signal line, and
**before** the channel numerals, the `LP` cross, and the `LP` label. So:

- An object's `--ground` fill occludes plot hairlines and points as it passes
  over them. That is correct — a renderer object is opaque, and this is artwork
  occluding artwork.
- Plot type always draws over an object, never under it. **Nothing in this
  design puts artwork on top of type.** That is the same principle as change 1
  above, applied inside the SVG, and it is why no clearance zone around the
  numerals is needed.

#### Entry and exit

Objects fade in with the plot's draw-on at 1700ms (SP-08) and begin travelling
at 2040ms. Once travelling they never stop, fade, or reset while the tab is
visible. On `visibilitychange` to hidden the loop is cancelled; on return it
resumes from the elapsed wall-clock time, so the objects are where they would
have been. `requestAnimationFrame` already throttles in a background tab; the
explicit cancel is so a long background period does not produce one large jump.

#### Degradation

| Condition | Result |
|---|---|
| JavaScript off | The five objects render at their authored rest `translate` values, written as literal attributes in the markup. The hero is a complete drawn plot with five numbered objects in it |
| `prefers-reduced-motion: reduce` | The script short-circuits before the loop starts. Identical to the JavaScript-off render. No object moves, and the scroll scalar is pinned to `k = 1` |
| Tab hidden | Loop cancelled, objects frozen |
| SVG unsupported | Not a supported condition; the plot already requires SVG |

The resting state is not a fallback that looks broken. It is the drawn plot the
site shipped before this revision, with five objects added to it.

### SP-14 — The scroll scalar

Scroll interactivity, at 390px and at 1440px alike. Not a desktop flourish.

**What scroll drives.** One scalar, which drives one property. Scroll position
sets the viewing elevation on the array field: as the reader descends the page
the camera descends toward the plane, and the objects' elliptical paths flatten
toward a line. It is the obvious candidate — the objects' position on the field
— expressed as the field's own geometry rather than as a translation of
anything on the page.

**The mapping.**

```
p = clamp( (H - t) / (H + h), 0, 1 )
k = 1.30 - 0.60 * p
```

- `H` — viewport height, from `innerHeight`, cached, recomputed on `resize`
- `h` — the plot's rendered height, 546 or 350, cached
- `t` — the plot's viewport-relative top, computed as `plotTop - scrollY` from
  a cached document-space `offsetTop`. No `getBoundingClientRect` in the loop
- `p` — 0 when the plot's top edge is at the bottom of the viewport, 1 when its
  bottom edge has passed the top of the viewport
- `k` — the semi-minor multiplier, applied as `b · k` in SP-13's path equation

**Bounds.** `k` is clamped to `[0.70, 1.30]` and nothing else in the document
responds to scroll. The mapping is centred so that **`p = 0.5` gives `k = 1.00`,
the authored geometry** — the same geometry the JavaScript-off and
reduced-motion renders show. At 1440×900 with the plot top at y ≈ 200, `p` at
scroll 0 is 0.484 and `k` is 1.01, so the first paint and the no-script paint
are visually the same page.

**Magnitude.** The largest `b` is 82 viewBox units, so the full `k` range moves
that object vertically by 82 × 0.60 = 49 viewBox units, which is 48 CSS px at
1440px and 31 CSS px at 390px — across the plot's entire traverse of the
viewport, about 1446px of scroll on desktop and 1194px on mobile. The coupling
is 3.3% of scroll distance. It is smooth because it is a continuous linear
function of `scrollY` with no easing, no spring, and no threshold, and it is
bounded because `p` is clamped.

**At the top and the bottom of the page.** `p` clamps at both ends. iOS
rubber-banding produces a negative `scrollY`, which clamps `p` to 0 and `k` to
1.30 — no overshoot, no NaN, no snap-back. Scrolled past the plot, `p` pins at
1 and `k` at 0.70, and the plot is off-screen anyway. At the document bottom
nothing is in motion that the reader can see, and returning to the top walks
`k` back up continuously.

**It cannot fight the scroll.** The listener is `{ passive: true }` and its
whole body is one assignment of `scrollY` to a variable. All work happens in
the rAF loop that SP-13 already runs, so scroll adds no second loop and no
layout read. There is no `scroll-behavior` override, no `position: sticky`, no
scroll hijack, no wheel or touch listener, no transform on any scrolling
container, and no element outside the plot's `<svg>` changes with scroll.

**Rejected.** Mouse-tracked parallax, which the brief rules out in those words
and which does not exist on a phone. Scroll-driven entrance animations on body
content, which make a page that looks empty until it is scrolled. Scroll-linked
translation of the image bands, which is parallax under another name.
Scroll-driven opacity on anything.

Under `prefers-reduced-motion: reduce` the scroll scalar is off and `k = 1`
permanently. A user-driven change is still motion, and the whole script
short-circuits on one check rather than branching in two places.

### SP-15 — Drawn elements

More line art and graphic, less brochure. The page is currently paragraphs in
columns; drawn elements take over part of the load. Everything below comes from
the vocabulary already on the page — 1px rules, dashed `2 4` ticks, 4×4 square
points, the filled triangle, hairline circles, crosshairs, `--band` fills,
catalogue numerals — and introduces no second visual language.

**The sanctioned primitives, complete.** 1px hairline, straight or elliptical ·
2px emphasis stroke, `--fg-primary`, one per drawing (W4) · dashed hairline at
`2 4` · 4×4 CSS px square point, `--fg-primary` · filled triangle, 3.9 long ×
2.1 across · hairline circle · crosshair · `--band` flat fill · `label`,
`index` numerals. Nothing else is drawn anywhere on the site. No arrowheads
other than the triangle, no curves other than ellipses, no fill other than
`--ground`, `--band`, and `--fg-primary` points, no hatching, no stipple, no
outline boxes around things.

**The ink floor.** Per the skill: no drawing is rendered entirely in
`--line-detail`. Every drawing on this site contains at least one
`--fg-primary` element and at least one element at `--line` or darker, and the
stroke that carries the drawing's subject is never the lightest thing in it.
The ink assignment is stated per drawing below, because "drawn in hairlines"
was what produced five grey smudges on a phone.

The triangle is a shared primitive, not the mark. The mark is the three-axis
assembly of three hairlines and three triangles from one origin. A triangle
used alone as a dimension-line terminator is not a mark instance and SP-11's
placement rule does not apply to it.

#### G-01 — Offering diagrams, home section 01

Each of the three offering records gets one inline SVG in its metadata column,
above the metadata rows, with 24px clear below it. `viewBox="0 0 288 180"`,
rendered at 288×180 at ≥1024px and at the full content width × 0.625 at
≤767px, where it sits between the title and the metadata register. Each
carries a 1px `--line` top rule (R2) with a `FIG.` number and a title at
`label`, `--fg-muted` at ≥768px and `--fg-body` at ≤767px, in the same two-cell
construction the plot's caption bar uses. ≤2.5KB of markup each.

| Record | Drawing | Caption |
|---|---|---|
| `001` Creative | A source fan. One 4×4 point at `(24, 90)`, nine hairlines fanning to nine 4×4 points on a vertical line at x = 264, spaced 18 units apart from y = 18 to y = 162. The centre ray is the drawing's one 2px emphasis stroke in `--fg-primary`; the two rays either side of it are 1px `--fg-primary`; the remaining six are 1px `--line-detail`. The three emphasised rays carry 8-unit dashed ticks at 16-unit pitch in `--line-detail` | `FIG. 05 — SOURCE TO ARRAY` |
| `002` Systems | A signal scale bar. One horizontal **2px** `--fg-primary` spine at y = 72 from x = 16 to x = 272 — the drawing's emphasis stroke, because the path is the subject — with five 10-unit vertical ticks dropping from it at x = 16, 80, 144, 208, 272 in 1px `--fg-primary`, and five labels below at `index` 9px in `--fg-body`: `LAPTOP`, `SQ-5`, `DANTE`, `Q-SYS`, `AMPS`. Above the spine, a dashed `2 4` rule at y = 48 spanning only x = 144 to x = 272 in `--line-detail`, labelled `AMBISONIC` at 9px `--fg-body` — the span the templating covers | `FIG. 06 — SIGNAL PATH` |
| `003` Fabrication | A measured elevation. A speaker enclosure outline, 96 wide × 132 tall at `(40, 24)`, drawn as the drawing's **2px** `--fg-primary` emphasis stroke, with one 1px `--fg-primary` hairline circle for the driver and one 4×4 point at the terminal position. Two dimension lines offset 16 units outside the body, each a 1px `--line-detail` rule terminated at both ends by the shared triangle primitive in `--fg-primary`, with dimensions set at `index` 9px in `--fg-body`: one horizontal, one vertical | `FIG. 07 — ENCLOSURE, ELEVATION` |

No boxes around the labels, no shading inside the enclosure, no arrowheads
other than the triangle. One 2px stroke per drawing and no more, so the three
drawings read as one set at the same weights as the array plot and the mark.

The dimensions in `FIG. 07` are the enclosure's real dimensions when the
fabrication commission can be described, and until then the drawing carries no
numerals at all — a measured drawing with invented measurements is a lie, and
SP-16's filler rule forbids plausible fake facts. The dimension lines and
triangles still render; only the numerals wait.

#### G-02 — Credits as a register with an axis, home section 03

The twelve names stop being a three-column list and become a plotted register.
The information gains one true field and the section gains its drawn element.

- A 1px `--line-strong` rule across the content width at the top of the
  register (R1 — it is the register's axis and the thing every row measures
  against), carrying three 8px dashed `2 4` ticks at 50%, 72%, and 94% of its
  length in `--line-detail`, with three `label` headers above them in
  `--fg-primary`: `INSTALLATION`, `SYSTEM`, `RECORD`.
- Twelve rows below it. Each row: the name at `body-s` in `--fg-body` flush
  left, then a 1px **`--fg-body`** connector running right from 8px after the
  name to the row's tick position, terminating in a 4×4 `--fg-primary` point on
  the axis. The connector is the row's one piece of information, so it carries
  the same ink as the name it starts from and is darker than the row separators
  it sits between.

Four weights, in order, all checkable with an eyedropper: axis
`--line-strong` 15.7:1 · connector `--fg-body` 12.3:1 · row separator `--line`
9.9:1 · tick `--line-detail` 5.75:1.
- Row height 48px at ≥1024px, 44px at ≤767px, 1px `--line` between rows (R2).
- No 2px stroke. This drawing's emphasis is its twelve terminal points.
- One point per row. A name belonging to two categories gets the category the
  three principals' credit on it actually was; the register is a statement of
  fact, not a matrix.

At ≤767px the axis rule and its three headers stay at the top of the register,
the three tick positions compress to 46%, 70%, 94% of a 350px width, and the
connecting rule shortens accordingly. The names stay flush left at `body-s`
14px. No wrapping: the longest name, `Reforesters Laboratory`, measures about
140px at 14px, leaving 20px of clear space before the 46% tick at x = 161.

#### G-03 — Shared datum under the portraits, home section 04

The three portraits sit on one shared 1px `--line` rule that runs the full
content width and passes behind all three, 24px below their bottom edges (R2).
An 8px tick in `--line-detail` drops from the rule at each portrait's left
edge, and a fourth tick at the rightmost portrait's right edge. The names sit
24px below the rule.

One rule instead of three separate blocks is what makes three people read as
one practice. 0 bytes.

At ≤767px the datum renders. It was desktop-only, which left the mobile
people section as three unrelated blocks and was one of the places the phone
page had no drawn element at all. On mobile the rule runs the content width
24px below each portrait's bottom edge — three rules, one per person, each with
a tick at the portrait's left and right edges — because the three portraits are
stacked and there is no single row to share.

#### G-04 — The contact aperture: absorbed into SP-18

Withdrawn as a separate element. Its two entering rules and its gap-in-a-rule
construction are now parts of the action target, which is specified once in
SP-18 and used at two scales. Nothing is lost; the component grew a ring, a
crosshair, a centre point, two end-stops, and a second instance in the hero,
and the two 1px `--line` rules became one 2px `--fg-primary` datum.

The aperture failed on its own terms: two rules with an empty gap between them
read as a spacing accident rather than as an object, because nothing occupied
the gap. SP-18 puts something in it that is aimed at.

#### G-05 — Prose budget

The brochure problem is a count, so the fix is a count. The previous budget
was eight blocks and 420 words, and the built page still read as paragraphs in
columns. **Revised 2026-11-24**, for `/index.html`:

| Limit | Previous | Value |
|---|---|---|
| Prose blocks (`lead`, `body`, `body-s` paragraphs) | ≤ 8 | **≤ 5** |
| Total words of prose | ≤ 420 | **≤ 170** |
| **Prose blocks per section** | — | **≤ 1** |
| **Words of prose per section** | — | **≤ 55** |
| Consecutive paragraphs anywhere | ≤ 2 | **≤ 1** |
| Sentences per prose block | ≤ 2 | ≤ 2 |
| Sections with no drawn element | 0 | 0 |
| Sections with no prose at all | — | **≥ 2** |

The per-section cap is the hard one and it is the one that makes the page stop
reading as a brochure. **One prose block per section. No second paragraph, no
standfirst above it, no `body-s` note below it, no `label` line doing a
sentence's job.** It is checkable in a full-page screenshot without counting
words: a section with two blocks of serif text in it is a defect.

`≤ 1` consecutive paragraph means the page contains no instance anywhere of one
paragraph followed by another.

#### The per-section budget, home

| Section | Prose blocks | Words | Drawn element | Registers and tables |
|---|---|---|---|---|
| Hero | 1 — the lead | ≤ 28 | SP-08 array plot, SP-18 target | — |
| 01 What we do | 1 — the positioning line | ≤ 30 | 3 × G-01 | 3 metadata registers, 4 + 8 + 4 rows |
| 02 Selected work | 1 — `W/01` prose | ≤ 55 | G-06 scale plot, IMG-01 plate, IMG-05 plate | 3 SP-09 credit lines, 3 technical registers |
| 03 Credits | 1 — the framing line | ≤ 20 | G-02 axis | 12-row register |
| 04 Who we are | **0** | 0 | G-03 datum, 3 portraits | 3 × 3-row person registers |
| 05 Contact | 1 — the next-step sentence | ≤ 30 | SP-18 target | — |
| **Total** | **5** | **≤ 163** | — | — |

Two sections carry no prose at all: 01's positioning line belongs to the
section, not to a record, so all three records in it are wordless, and 04 is
wordless outright. Every numbered section contains at least one of: the array
plot, a G-01 diagram, G-02's axis, G-03's datum, G-06, the SP-18 target, or an
image plate.

#### Every remaining text block on the page, and its verdict

This is the complete pass. A block not in this table does not exist on the
home page.

| Block | Verdict |
|---|---|
| Hero eyebrow `( NEW YORK )` | **Kept.** `label`, two words, and the only place the city is stated above the fold |
| Hero `<h1>` | Kept. Display type, not prose |
| Hero lead | **Kept, 1 of 5.** One sentence, ≤ 28 words |
| Hero next-step line, `body-s` | **Deleted outright, with no replacement.** Revised from the previous entry in this table, which replaced it with a `label` line reading `SCOPED IN WRITING BEFORE ANY CALL`. A caption under the target is still a text block, it spends budget rather than saving it, and it sits in the one place on the page that has to be purely graphic — directly under the thing a visitor is meant to act on. The fact survives, once, in the contact band's sentence |
| `001` Creative prose | **Deleted → drawing.** `FIG. 05`, the source fan, plus four register rows. A sentence saying "sound designed for a specific room" between a drawing of a source feeding an array and a row reading `SPATIALIZED SOUND DESIGN` was the third statement of one fact |
| `002` Systems prose | **Deleted → drawing.** `FIG. 06` draws the signal path the paragraph listed device by device, plus eight register rows |
| `003` Fabrication prose | **Deleted → drawing.** `FIG. 07`, a measured elevation of the object, plus four register rows |
| `001`–`003` metadata rows | **Kept as registers.** They are lists of facts, which is what a register is for |
| Section 01 positioning line | **Kept, 2 of 5.** The only place the audience and the unequal relation between the three offerings are stated |
| `W/01` prose | **Kept, 3 of 5.** The only finished project; the workflow clause is the point of the section |
| `W/02` prose | **Deleted → plot.** G-06 plots its channel count against the Reforesters room, and SP-09 carries the names. Full-length prose lives on `work.html` |
| `W/04` prose | **Deleted → register.** `STATUS — IN PROGRESS` and `CLIENT — UNNAMED` is everything publishable about an unnamed in-progress commission |
| `W/01`, `W/02`, `W/04` technical rows | **Kept as registers** |
| `ALL PROJECTS` link row | Kept. Navigation, not prose |
| Credits framing line | **Kept, 4 of 5.** Attribution honesty needs plain language |
| Twelve-name credit list | **Converted → register.** G-02: an axis, twelve connectors, twelve terminal points. Two fields of information where the three-column list carried one |
| Three person credits in 04, `body-s` | **Converted → three registers.** Each comma list becomes three `label` rows in the SP-03 register construction, three rows per person and no more. Every named credit is kept exactly; only the punctuation and the running-sentence form go |
| `FULL BIOGRAPHIES` link row | Kept. Navigation |
| Contact band next-step sentence | **Kept, 5 of 5.** The primary action has to say what happens next |
| Contact band location line `NEW YORK`, `label` | **Deleted outright.** The city is already on the page twice, in the hero eyebrow and in the footer status bar. A third instance is furniture, and the contact band's job is the target and one sentence |
| Footer status bar | **Kept as a table.** Five cells, ruled, which is a register |

Count: **five prose blocks kept, eight deleted outright, four converted to
drawings or registers, and nothing shortened.** Deleting beat illustrating in
eight places, which is the ratio the voice section asks for.

Full-length prose lives on `work.html` and `studio.html`, where the job is
detail and the bios are the proof. The home page's job is to be a drawing with
enough words on it. The bios are explicitly exempt: they are the strongest
proof the business has and the brief keeps them in substance.

#### G-06 — Channel count, a scale plot

Section 02's drawn element, and the replacement for `W/02`'s two paragraphs. It
sits directly under the section label, above the IMG-01 band.

- A horizontal axis: 1px `--line-strong` across the content width, with dashed
  `2 4` ticks in `--line-detail` at 0, 8, 16, and 24 channels, labelled at
  `index` 9px in `--fg-body`.
- Two rows under it. Each row: the project name at `body-s` in `--fg-body`
  flush left, then a 1px `--fg-body` connector running right to the row's
  channel position, terminating in a 4×4 `--fg-primary` point, with the count
  set at `index` in `--fg-primary` 8px past the point. The same four weights as
  G-02.
- Row 1: `Reforesters Laboratory`, 24.2. Row 2: `MoFE`, 13.1.
- Row height 48px at ≥1024px, 44px at ≤767px, 1px `--line` between.
- Caption, two cells at `label`: `FIG. 03` · `CHANNEL COUNT, DELIVERED SYSTEMS`.
- No 2px stroke. The emphasis is the two points and the two numerals.

`W/04` is not on this plot. Its channel count is not published, and SP-16
forbids filling an unknown metadata value. Two rows is the whole drawing: it is
a comparison of two numbers, which is what a scale plot is for, and both
numbers are facts the team supplied.

The `FIG.` numbers renumber: the plot caption stays `FIG. 01`, IMG-01 becomes
`FIG. 02`, G-06 is `FIG. 03`, and the G-01 diagrams become `FIG. 04`, `FIG. 05`,
and `FIG. 06`. Figure numbers run in document order on each page.

### SP-16 — Placeholder copy

Placeholder copy reads as placeholder. The last build shipped plausible prose
in slots awaiting Andrew's copy, which is worse than no copy: a stand-in that
reads as a draft gets reviewed as a draft, and a wrong fact that reads well
survives into production.

**The rule.** Any block whose final wording has not been supplied renders as
obvious filler, in this exact form:

1. The block opens with a clause naming what the block is, then `goes here`,
   then Latin filler for the remainder of its intended length. For example:
   `Project description goes here lorem ipsum dolor sit amet consectetur
   adipiscing elit sed do eiusmod tempor incididunt ut labore.`
2. Filler never contains a proper noun, a number, a year, a format, a channel
   count, a hardware name, a date, or a place. Nothing in a filler block can be
   mistaken for a fact or quoted back.
3. Filler sets at its block's real token, size, colour, and measure, so the
   layout is still testable. It is filler in wording only.
4. The element carries `data-placeholder`. The count is one grep, and the
   production gate can refuse a deploy while any remain.
5. A metadata row whose value is unknown is **omitted**, never filled. There is
   no `label`-size filler anywhere: a technical row reading
   `Lorem ipsum routing` is the exact failure this rule exists to prevent.
6. Filler is never written in the voice section's register. If a critic scores
   a filler block for copy clarity, the filler is not obvious enough.

**Settled copy, which is not filler and does not change.** The `<h1>`; the
three offering names `Creative`, `Systems`, `Fabrication`; the twelve credit
names including `Alanis Morissette`; the three bio texts and their named
credits; the three one-line home credits in section 04; the wordmark; every
section label and index-band label; the hero lead; the next-step line; the
contact sentence; the audience line in section 01; `Start a project`; every
`FIG.` number and plate label; and every SP-09 `CREDIT`, `YEAR`, and
`COMMISSION` value, which are facts the team supplied.

**Blocks that render as filler now**, pending Andrew's copy pass:

| Block | Filler opens |
|---|---|
| `001` prose | `Creative scope goes here lorem ipsum` |
| `002` prose | `Systems scope goes here lorem ipsum` |
| `003` prose | `Fabrication scope goes here lorem ipsum` |
| `W/01` prose | `Project description goes here lorem ipsum` |
| `W/02` prose | `Project description goes here lorem ipsum` |
| `W/04` prose | `Project description goes here lorem ipsum` |
| `work.html` standfirsts and all record prose | `Standfirst goes here lorem ipsum` |
| `studio.html` 01 Practice paragraphs | `Practice description goes here lorem ipsum` |

Lengths match the copy intent already recorded for each block, so a filler
`W/01` paragraph is about 280 characters because the real one will be, and the
measure and the record height are tested at the right size.

**Line breaking, every block, both widths.** The last review found wrapping
failing in several places. Every block is checked at 390px and 1440px against
four conditions, all screenshot-checkable: no line shorter than three words
except the last; no single word alone on the last line of a `title` or
`statement`; no horizontal overflow at `document.scrollWidth` 390; and no
glyph within 4px of the frame's inner rule. `text-wrap: pretty` on prose and
`text-wrap: balance` on `statement` and `title` are required, not optional.

### SP-17 — Weight

**Settled and built. This component is a pointer, not a proposal.** The values
and the four floors live in the design-language skill under "The three line
weights, settled" and "Weight floors". Nothing in this spec reopens them.

| Token | Hex | Ratio on `#EDEBE6` | Carries |
|---|---|---|---|
| `--line` | `#3A3732` | 9.9:1 | R2 — every page rule, and every rule that crosses text |
| `--line-strong` | `#141210` | 15.7:1 | R1 — the named heaviest rules: header, footer, index band, contact band, plate frames, the credits axis |
| `--line-detail` | `#5E5A53` | 5.75:1 | R3 — ticks, dashes, dimension lines, register connectors, corner ticks, context spokes. Strokes only, never type |

Structural rules are near-black; detail is mid-grey. The three values do not
change. `--line-detail` is the one new token of the weight pass and it exists
because with `--line` at 9.9:1 there is no longer a light rule in the system,
so a drawing whose ticks and connectors all sit at 9.9:1 has no hierarchy in
it.

The component-by-component application is already written into SP-00 through
SP-16 above. Four checks stand in for the whole pass, all with an eyedropper on
a screenshot crop:

1. No type anywhere on the page samples `#5E5A53` at ≤767px, at any size.
2. No section rule, record rule, or frame edge rule samples lighter than
   `#3A3732`.
3. Every tick, dash, and register connector samples `#5E5A53`.
4. Every drawing contains at least one `#141210` element.

### SP-18 — The action target

The answer to "the call to action should feel more graphic". `Start a project`
stops being underlined text and becomes a drawn object: **a crosshair on a
point, inside a ring, sitting on a 2px datum that stops either side of the
words.** Geometry, the two symbols, the gap tables, and the four states are
specified once in the design-language skill under "The action target". This
component states the markup, the per-page census, and what is removed.

The object is the array plot's listening-position cross — the one place in the
plot where something is aimed at — inscribed in a ring and brought to page
scale, with the plot's signal line as its datum. It introduces no new drawn
vocabulary: ring, crosshair, 4×4 point, 2px emphasis stroke, 1px end-stop.

**Markup**, both instances:

```html
<p class="target target-band">
  <span class="tg-rule tg-rule-l" aria-hidden="true"></span>
  <a class="cta-start statement" href="mailto:%69%6e%66%6f%40%61%73%74%72%61%6c%73%70%61%74%69%61%6c%2e%63%6f%6d">
    <svg class="tg" aria-hidden="true" focusable="false"><use href="#tg-32"></use></svg>
    <span class="tg-text">Start a project</span>
  </a>
  <span class="tg-rule tg-rule-r" aria-hidden="true"></span>
</p>
```

The hero instance is the same three elements with `target-hero`, `link-cta`,
`#tg-24`, and `href="#contact"`.

The two `<symbol>` blocks are declared once per page inside the existing
`.mk-defs` zero-size `<svg>`, beside `#mk`. Two symbols, not one scaled symbol:
each is authored 1:1 with its rendered size, so every stroke is 1px and every
point is 4×4 CSS px without `vector-effect` and without a new layout variable.
≤480 bytes for both.

**Accessible name.** The `<a>`'s accessible name is `Start a project`, from the
`<span>`. The `<svg>` is `aria-hidden="true" focusable="false"` and contributes
nothing. No `aria-label`, no `title`, no hidden span, no SVG `<title>`. The
address is not in the accessible tree, not in the visible text, and not in any
SVG `<text>` — it exists once per page, in one percent-encoded `href`, per
SP-05.

**Keyboard and no-script.** It is a real `<a>` with a real `href`. It is in the
tab order at its position in reading order, `:focus-visible` renders the
standard 1px `--fg-primary` ring at 2px offset on the `<a>`, and nothing about
the object — not the datum, not the end-stops, not the target, not the gaps —
is produced or positioned by script. With JavaScript off both instances render
and both resolve.

**Home page census**, two instances, which is the per-page maximum:

| Instance | Where | Text | Token | Target |
|---|---|---|---|---|
| 1 | Hero, after the lead | `Start a project` | `link-cta` 24/20px, lower | `#tg-24` |
| 2 | Contact band, section 05 | `START A PROJECT` | `statement` 56/30px, upper | `#tg-32` |

The header and footer contact links stay `label`-size text links with a 1px
`--line-strong` underline at 6px offset (SP-05). They are not targets. A third
drawn instance on any page is a defect.

**One object, two sizes — not two treatments.** The reason is a reading
sequence: a visitor who meets the object in the hero and then scrolls to the
bottom has to recognise the same object, or the page reads as offering two
different primary actions. The hero instance is the quiet statement of the
grammar and the band instance is the loud one. What differs between them is the
text token, the symbol, four gap values, and what the entering rules anchor to.
What does not differ is the construction, the stroke weights, the four states,
or the words.

**Removed by this component:**

- `border-bottom: 1px solid var(--fg-muted)` on `.hero-mail` and on the
  contact-band link, and the `border-color` hover transition on both. The
  underline is gone from both primary instances; it survives only on the
  header and footer text links.
- `.cta-start { display: inline-block }` as the whole of the band link's
  styling.
- G-04's two 1px `--line` aperture rules, which are replaced by the datum's
  2px `--fg-primary` segments.
- The `link → next-step line` 8px gap in the hero, because the next-step line
  is deleted (SP-15 G-05).

**Defect conditions**, all checkable in a screenshot:

- Either primary instance rendering with an underline or a `text-decoration`.
- A fill, a border, or a radius on the `<a>`.
- A ring that is not 18px (band) or 14px (hero) in diameter.
- A centre point that is not 4×4px.
- A datum that is not 2px, or that passes unbroken behind the words.
- The band instance rendering inline at ≤767px rather than stacked.
- A third drawn instance anywhere on a page.
- A colour change on hover. Every part of the object is `--fg-primary` in
  every state.

### SP-19 — The watermark

**Built. This component documents what is on the page.** Geometry, the five
positions, the stroke, the lag factor, and the defect conditions are in the
design-language skill under "The watermark".

In one sentence: the mark at page scale, five times down the document, in
outline, in `--watermark` `#E4E1DB` at 1.08:1, at stacking level `-1`, lagging
the scroll at 0.16.

| Property | Value |
|---|---|
| Instances | 5, `.wm-1` to `.wm-5`, direct children of `<body>` |
| Figure | The `#mk` geometry, outlined, triangles unfilled, axis lines extended to the tips |
| Stroke | 1px `--watermark`, `vector-effect="non-scaling-stroke"` |
| Width | 88vw capped at 880px at ≤767px, 50vw at ≥768px |
| Vertical | `top` 6 / 26 / 46 / 66 / 86 % of the document |
| Horizontal | Alternating, odd from the right and even from the left, each bleeding off its own edge |
| Stacking | `z-index: -1`. Text paints over it at full strength |
| Motion | `transform: translateY(scrollY × 0.16)`, one assignment in the existing rAF loop |
| Cost | ≤1.3KB of markup, 0 requests, 1 line of script |

**It is at level `-1` and nothing else is.** That is what makes it subordinate
by construction rather than by opacity, and it is why it does not reduce any
contrast ratio anywhere: a glyph crossed by a watermark stroke still samples
`#141210` or `#2B2825`.

**It is the one sanctioned parallax on the site**, and the skill's motion rules
6 and 7 are rewritten to say so rather than being quietly contradicted. It is
not autonomous motion: it moves only while the reader scrolls, by a fixed
fraction of the distance they scrolled, and it stops when they stop. Under
`prefers-reduced-motion: reduce` and with JavaScript off the `transform` is
never set and the figures scroll with the document.

**Count and anchors.** Six instances, `.wm-1` through `.wm-6`, each positioned.
Anchors are 5.0, 18.5, 31.9, 45.4, 58.8 and 72.2 percent of document height —
not evenly spread, because the parallax lag of `scrollY × 0.16` carries each
figure down the page as the reader scrolls. An anchor is therefore `0.84 ×` the
scroll position at which its figure should be centred. Measured coverage at
every tenth of the page is exactly one figure in view, with no gaps; evenly
spaced anchors leave holes at roughly 40 and 85 percent.

---

## 3. `/index.html` — home

**Purpose.** A curator or commissioner, arriving cold, understands within one
screen that this practice designs spatial audio as creative work and builds
the systems and objects that carry it, and sees an address to write to.

**The one thing a visitor should do.** Email `info@astralspatial.com`.

**Section order.** Hero → index band → 01 What we do → 02 Selected work →
03 Credits → 04 Who we are → 05 Contact → footer.

`<h1>` is the hero statement, once. Section names are `<h2>`. Record titles
are `<h3>`.

### Hero

Purpose: the proposition and the address, both above the fold at 1440×900,
both inside the first screen at 390×844.

**Layout ≥1024px.** Hero top padding 96px, bottom padding 96px.

| Element | Columns | Token | Colour |
|---|---|---|---|
| Eyebrow `( NEW YORK )` | 1–7 | `label` | `--fg-muted` |
| `<h1>` statement, 3 lines | 1–7 (774px) | `statement` 56px | `--fg-primary` |
| Lead, 2 lines | 1–6 (660px) | `lead` 28px | `--fg-body` |
| SP-18 action target, hero scale, reading `Start a project` | 1–6 (660px) | `link-cta` 24px | `--fg-primary` |
| SP-08 array plot | 8–12 (546px), top-aligned to the statement. At ≥1440px the box shifts 48px left into the text column per SP-12 L1 | — | — |

Vertical gaps, top of hero downward: eyebrow → statement 32px; statement →
lead 40px; lead → target 48px. Nothing follows the target: the `body-s`
next-step line is deleted (SP-15 G-05), so the target is the last thing in the
hero text column and has 96px of hero bottom padding under it.

The target's datum: left entering rule 90px (one column) from the text
column's left edge, 24px to the target, 16px to the first glyph, 24px from the
last glyph to the right end-stop, and the right entering rule takes the
remainder out to the text column's right edge at column 6. `Start a project` at
`link-cta` 24px lower case measures about 150px, so the right entering rule
computes at about 356px — well clear of its 24px floor.

At 1440×900 this puts the target's datum at roughly y=600 and the index band
fully visible, with the top of section 01's space at the fold. The plot's box
top-aligns to the statement at y ≈ 200, which is the value SP-14's scroll
mapping assumes.

**Layout ≤767px.** Single column, 20px margins, hero top padding 48px.

Order: eyebrow → `<h1>` at 30px over 4 lines → lead at 20px → SP-18 target at
`link-cta` 20px → array plot at 350×350.

Gaps: 24, 24, 32, 48. The target's datum lands near y=480, inside the first
screen. Its construction at 350px: left entering rule 32px fixed, 16px to the
target, 12px to the first glyph, 16px from the last glyph to the right
end-stop, and the right entering rule takes the remaining ≈100px. The object
band is 44px tall, which is also the tap-target floor. The plot sits at y ≈ 600,
so its top edge is just below the fold: the first thing scrolling reveals is a
field of moving objects, and that is the first and most important place SP-14's
scroll scalar is felt.

**Copy intent.**

| Block | Must say | Job |
|---|---|---|
| Eyebrow | City | Locates the practice in one word |
| `<h1>` statement | That this is spatial audio made as a work, not specified from a catalogue. Three lines, upper case, ≤30 characters per line | The single claim the whole site rests on. A curator reads only this and knows whether to continue |
| Lead | The two halves, unequal: sound designed for a room, and the control logic and workflow that let an artist use that room without an engineer. One sentence, maybe two | Converts the claim into something a commissioner can scope |
| Action target | `Start a project`. Three words, lower case, no punctuation. The address is not rendered | The primary action, instance 2 of 4, drawn per SP-18 |

The hero's next-step line is deleted. The fact it carried — that the work is
described and scoped in writing before anyone gets on a call — is stated once
on the page, in the contact band's sentence, and not twice.

### Index band

SP-06. At ≥1024px five cells: `01 WHAT WE DO`, `02 SELECTED WORK`,
`03 CREDITS`, `04 WHO WE ARE`, `05 CONTACT`. At ≤767px the same five rows plus
`WORK` and `STUDIO`.

### 01 — What we do

Purpose: the three offerings, in the brief's order of emphasis. Creative
leads. Systems supports. Fabrication is third and is not a catalogue install.

Three SP-03 records, 64px apart at ≥1024px, 48px at ≤767px.

| Index | Title | Prose intent | Diagram | Metadata rows |
|---|---|---|---|---|
| `001` | Creative | Sound designed for a specific room: spatialized sound design, interactive work, and existing pieces adapted into spatial formats. **1 sentence, filler per SP-16 until the copy pass** | G-01 `FIG. 05` | `SPATIALIZED SOUND DESIGN`, `INTERACTIVE PROGRAMMING`, `ADAPTATION TO SPATIAL FORMATS`, `COMPOSITION FOR ARRAYS` |
| `002` | Systems | The logic and the artist-facing workflow, often on hardware someone else installed. A room built by others, made usable, is the service. **1 sentence, filler per SP-16** | G-01 `FIG. 06` | `CONTROL LOGIC`, `ROOM TUNING`, `SYSTEM ARCHITECTURE`, `Q-SYS PROGRAMMING`, `AMBISONIC TEMPLATING`, `DANTE ROUTING`, `DOLBY ATMOS`, `WAVE FIELD SYNTHESIS` |
| `003` | Fabrication | Speakers, haptics, and electroacoustic instruments built as objects for one room. **1 sentence, filler per SP-16**. The clause "not specified from a catalogue" does not appear here: it is the `<h1>`, and spending the strongest line on the page twice weakens both | G-01 `FIG. 07` | `CUSTOM SPEAKERS`, `CUSTOM HAPTICS`, `ACOUSTIC & ELECTROACOUSTIC INSTRUMENTS`, `ENCLOSURES` |

The three titles are settled copy and do not change.

Each record's metadata column opens with its G-01 diagram, then 24px of clear,
then the metadata rows. At ≤767px the diagram sits between the prose and the
metadata rows at the full content width, 350×219.

No icons. No cards. The three records are distinguished by their index
numbers, their rules, and their drawings, nothing else.

### 02 — Selected work

Purpose: the proof. Three records — the finished Astral Spatial commission,
the largest system any of the principals has built, and the in-progress build
that makes fabrication real rather than aspirational. The attribution is
visible on each one, in the same type as the hardware list beside it.

All copy in this section is placeholder until Andrew's copy pass. What is
fixed now is the record set, the index numbers, the SP-09 structure, and the
layout. The prose is intent only.

**Image band IMG-01.** A matted plate, full-bleed to the frame's inner edge,
per SP-12 L2. Outer box 560px tall at ≥1024px, 220px at ≤767px. Mat `--band`:
24px top, left, and right and 96px at the bottom at ≥1024px; 16px and 48px at
≤767px. 1px `--line-strong` hairline on the mat's outer edge. The photograph
sits flush inside the mat with `object-fit: cover`, `width="1600"
height="900"` attributes set to prevent layout shift, `fetchpriority="high"`,
not lazy.

The caption bar sits in the **top mat**, which is where the mat already is —
it is not an overlay and it has no fill of its own. `FIG. 02` ·
`REFORESTERS LABORATORY, WILLIAMSBURG` · `24.2 CHANNEL` at `label` in
`--fg-muted`, 24px tall at ≥1024px. At ≤767px the top mat is 16px and carries
two cells, `FIG. 02` and `REFORESTERS LABORATORY`; `24.2 CHANNEL` is dropped
rather than wrapped.

The bottom mat carries the `W/01` index and the record title, per SP-12.

Before the photograph exists this is SP-07 inside the same mat, with the
plate's own label centred in the area above the bottom mat.

**Record W/01**, SP-03, its top rule crossing the plate per SP-12 L1:

- Title: `REFORESTERS LABORATORY`, set in the plate's bottom mat.
- Prose intent: a 24.2 channel listening room and adaptogen cafe in
  Williamsburg; the scope was software, not hardware; the deliverable was a
  workflow, so a visiting artist arrives with their own work and plays it in
  ambisonics without an engineer rebuilding the room for them. That last clause
  is the point of the whole section and must survive editing. **Two sentences
  maximum, filler per SP-16 until the copy pass.**
- SP-09: `CREDIT — ASTRAL SPATIAL` · `YEAR — 2025` ·
  `COMMISSION — ASTRAL SPATIAL`.
- Technical rows: `SCOPE — SOFTWARE`, `Q-SYS PROGRAMMING`,
  `AMBISONIC TEMPLATING`, `DANTE ROUTING`, `ALLEN & HEATH SQ-5`,
  `D&B AUDIOTECHNIK`, `STATUS — COMPLETE`.

**Record W/02**, SP-03, no image slot on home:

- Title: `MOFE`.
- Prose intent: a spatial system at scale, and the clearest single example of
  one on the site; it predates the agency and is two of the three principals
  doing together exactly what the practice now sells. **Two sentences maximum,
  filler per SP-16 until the copy pass.** The prose does not restate the
  attribution: the SP-09 block beside it carries the names, and the last build
  printed the same credit twice, word for word, as half of this record's prose.
- SP-09: `CREDIT — SYSTEM DESIGN, ANDREW FOX; EXECUTION, JUPITER SOUND;
  TUNING AND SOUND DESIGN, CHLOE ALEXANDRA THOMPSON` ·
  `YEAR — 2020–2022` · `COMMISSION — PREDATES ASTRAL SPATIAL`.
- Technical rows: `SCOPE — SYSTEM DESIGN, TUNING, SOUND DESIGN`,
  `13.1 SYSTEM`, `STATUS — COMPLETE`.
- No image on home. Its photograph, IMG-07, appears on `work.html`.

**Record W/04**, SP-03 with an image slot in place of the technical column's
lower half:

- Index `W/04`. Title: a neutral designation, not a client name.
- Prose intent: a custom speaker installation in progress; the first project
  where the physical build is Astral Spatial's own; the client cannot be named
  yet. **Two sentences maximum, filler per SP-16 until the copy pass.** No
  implied scale, no adjectives about the client.
- SP-09: `CREDIT — ASTRAL SPATIAL` · `YEAR — 2026` ·
  `COMMISSION — ASTRAL SPATIAL`. **Not layered.** First child of the metadata
  column, flush left, 1px `--line` rule with 16px clear below it, then the
  technical rows. The floated knockout is withdrawn per SP-12.
- Technical rows: `STATUS — IN PROGRESS`, `CLIENT — UNNAMED`.
- Image slot IMG-05 in columns 9–12, 432×540 displayed, 4:5. SP-07 plate until
  the photograph exists, labelled `PLATE — FABRICATION IN PROGRESS`. At ≤767px
  it sits below the prose at 350×438.

Records are 64px apart at ≥1024px, 48px at ≤767px, per SP-03.

**Link row.** 1px `--line` rule carrying the mark at its right end per SP-11,
then a 56px row: `ALL PROJECTS` at `label`, `--fg-body` at rest per W2, hover
and `:focus-visible` `--fg-primary`. No `→`. Links to `/work.html`.

### 03 — Credits

Purpose: the twelve recognisable names, framed honestly. These are credits the
three principals carry from prior work, not Astral Spatial engagements. The
brief is explicit that they belong to the people rather than the agency.

**Framing line**, `body`, columns 1–6 at ≥1024px, one sentence. It must make
the attribution unambiguous without apologising.

**Credits register.** 48px below the framing line. Built as G-02: an axis rule
with three dashed `--line-detail` ticks headed `INSTALLATION`, `SYSTEM`,
`RECORD`, then twelve single-column rows, each running a 1px `--fg-body`
connector from its name out to a 4×4 `--fg-primary` point on the axis. 48px
rows at ≥1024px, 44px at ≤767px, 1px `--line` between.

The three-column list of the previous revision is withdrawn. Twelve names in
three columns is the most brochure-like block on the page and it carried one
field of information; the register carries two and is drawn.

Names, exact and in this order, with their axis position: MoFE (system), Meow
Wolf (installation), Reforesters Laboratory (system), Life is Beautiful
(installation), Ben Frost (record), Richard Mosse (installation), Sony Music
(record), Domino Records (record), Mexican Summer (record), Polyvinyl Records
(record), Kaki King (record), **Alanis Morissette** (record).

Axis positions are the team's to confirm in the copy pass. Where a name is
wrong, one point moves and nothing else changes.

The current site spells Morissette wrong. It is checked by the rubric.

### 04 — Who we are

Purpose: point at the strongest proof the business has, without reprinting it.
Full bios live on `studio.html`.

Three entries, alphabetical by surname: Michael Amacio, Andrew Fox, Chloe
Alexandra Thompson.

**≥1024px**: three across, each spanning 4 columns. Portrait 240×300 flush
left in its column, then the G-03 shared datum rule 24px below the portraits'
bottom edges, then name at `title-s` 24px below the rule, then a one-line
credit at `body-s` 8px below the name.

One-line credits, each naming a specific verifiable thing:

- Michael Amacio — Philip Glass Ensemble, *32 Sounds*, Richard Mosse.
- Andrew Fox — Dolby Atmos mixes for Sony, Domino, Mexican Summer; audio
  director at MoFE.
- Chloe Alexandra Thompson — 32–148 speaker arrays, Max Certified Trainer,
  AES on wave field synthesis.

**≤767px**: three stacked rows 48px apart. Portrait 120×150 flush left, text
block 16px to its right in the remaining 214px. Name `title-s` at 18px, credit
`body-s` at 14px over two lines.

**Link row** below: `FULL BIOGRAPHIES` at `label`, to `/studio.html`. 56px
tall, 1px rule above carrying the mark at its right end per SP-11. No `→`.

### 05 — Contact

Purpose: the primary action, given a full band of its own.

Full-bleed `--band` background. Padding 128px top and bottom at ≥1024px, 64px
at ≤767px. 1px `--line-strong` rule top and bottom (R1).

| Element | Token | Size | Colour |
|---|---|---|---|
| Label `05 — CONTACT` | `label` | 12/11px | `--fg-muted` ≥768px, `--fg-body` ≤767px |
| SP-18 action target, band scale, reading `START A PROJECT` | `statement` | 56/30px | `--fg-primary` |
| Next-step sentence | `body` | 18/16px | `--fg-body` |

Three elements. The location line `NEW YORK` is deleted (SP-15 G-05): the city
is already in the hero eyebrow and in the footer status bar, and the band's job
is the target and one sentence.

Gaps: label → target 48px (≥1024) / 32px (≤767); target → sentence 24px / 16px.
The sentence spans columns 1–8 at ≥1024px.

**The target at ≥1024px.** Inline. The datum runs full bleed from the frame's
inner left edge to its inner right edge, 2px `--fg-primary`, interrupted by two
24px-tall end-stops. Left end-stop → target 24px, target → first glyph 16px,
last glyph → right end-stop 24px. `START A PROJECT` at `statement` 56px
measures about 400px, so the whole object — 400px of text, a 32px target, three
gaps of 64px total — occupies about 496px of the 1344px content width, leaving
roughly 424px of entering rule on each side. Object band 56px tall. A 2px rule
crossing the entire page and stopped twice is the graphic event the section is
built around.

**The target at ≤767px.** Stacked, per SP-18. 350px cannot hold the text, the
target, and four gaps on one line. So the target sits flush to the content's
left edge on a datum that runs 24px to its right and then full bleed to the
frame's inner right edge, ending in one end-stop; and `START A PROJECT` at 30px
sits 24px below the datum, flush left to the target's left edge. Object height
88px. At 30px the text measures about 215px of a 350px content width, so it
does not wrap and clears the frame's inner rule by more than 100px.

The previous build's `INFO@ASTRALSPATIAL.COM` at 30px measured 354px against a
350px content width and ran under the frame strip. That defect is removed by the
change of string, not by a size override.

Copy intent: the sentence names what to send — the room, the work, the dates —
and what happens next, which is that the work is described and scoped in
writing before anyone gets on a call. It does not say "Get in touch", "Let's
talk", "Reach out", or "We'd love to hear from you". Two sentences maximum,
≤30 words, and it is the only prose in the section.

### Call-to-action census

Four instances, all reaching the same address: desktop header `CONTACT`, hero
`Start a project`, contact band `START A PROJECT`, footer `CONTACT`.

| Instance | Form | Type size | Drawn |
|---|---|---|---|
| Header | Text link, 1px underline at 6px offset | `label` 12px | no |
| Hero | SP-18 action target, `#tg-24` | `link-cta` 24/20px | yes |
| Contact band | SP-18 action target, `#tg-32` | `statement` 56/30px | yes |
| Footer | Text link, 1px underline at 6px offset | `label` 12px | no |

The contact band is the visually dominant one by a factor of 2.3 in type size
over the hero and 4.7 over the two text links, it is the only one on a `--band`
field, it is the only one whose datum crosses the whole page, and it is the only
one that carries the `mailto:` href directly (SP-05). That satisfies rubric item
8's "one primary action, visually dominant, repeated at least twice, specific
about what happens next" — the next step is named in the sentence under the
target, the words are a verb, and the two primary instances are the only drawn
objects on the page a visitor can click.

Two drawn instances, maximum, per SP-18. The header and footer stay text.

---

## 4. `/work.html`

**Purpose.** Let a commissioner read the finished project in enough detail to
believe it, and see that more is coming without being told anything untrue.

**The one thing a visitor should do.** Email, after reading W/01.

**Section order.** Page head → index band → 01 Commissions → 02 Prior work,
by the principals → 03 In development → contact band → footer.

The page is split by *who commissioned the work*, not by status. That is the
structural answer to the attribution problem: a curator sees which projects
the company delivered and which its people delivered elsewhere before reading
a single credit line, and the credit lines then say it again at record level.
Status is carried inside each record by its `STATUS —` row.

All copy on this page is placeholder until Andrew's copy pass.

### Page head

`<h1>` = `WORK`, `statement` token, columns 1–4. Beside it, columns 6–11, a
standfirst at `lead`: one sentence saying that the practice is new, the list is
short, and what is on it is finished. Padding 96px top at ≥1024px, 48px at
≤767px. At ≤767px the standfirst sits below the `<h1>`, 24px gap.

### 01 — Commissions

Work Astral Spatial was commissioned for. Two records, `W/01` and `W/04`,
64px apart at ≥1024px and 48px at ≤767px.

**Record W/01**, at full length:

- IMG-01 band at the top of the section, same matted plate and same dimensions
  as on home. The same file; cached. Here the bottom mat is 24px, not 96px,
  because no type sits in it, and the caption bar stays in the top mat. The
  record's top rule still crosses the plate per SP-12 L1 — one crossing on this
  page — but the title and index sit on the ground below it, not in the mat.
- Prose runs 4–6 paragraphs instead of one: the room, the scope boundary
  (software, not hardware), the signal path from a visiting artist's laptop
  through the Allen & Heath SQ-5, over Dante, into the d&b audiotechnik
  amplifiers, the Q-SYS control logic, the ambisonic templating, and what the
  workflow means for an artist who arrives with a finished piece.
- SP-09 and technical rows as on home.
- Second image slot IMG-06 below the prose: 1200×800 displayed at 900×600 in
  columns 3–11 at ≥1024px, 350×233 at ≤767px. Caption bar `FIG. 03` ·
  `CONTROL SURFACE AND SIGNAL PATH`. SP-07 plate until shot.
- SP-08 array plot moves here, columns 3–7, once IMG-01 occupies the home
  hero.

**Record W/04**, as on home, with IMG-05 at 432×540 and its SP-09 credit line
unlayered at the head of the metadata column. No additional claims.

### 02 — Prior work, by the principals

Work the principals did before Astral Spatial existed. The section label does
the attribution once; SP-09 does it per record. One record ships.

**Standfirst**, `body`, columns 1–6, one or two sentences: this work predates
the agency, it was done by these people individually or with other firms
executing, and it is on the site because it is the same work at the same
scale. It does not use the words "although", "unfortunately", or "only".

**Record W/02 — MoFE**, at full length:

- Prose runs 2–3 paragraphs: the system and its scale, Andrew Fox's design and
  the commissioning of Jupiter Sound to execute, Chloe Alexandra Thompson's
  tuning and sound design within it, and what it demonstrates about the three
  working together.
- SP-09 exactly as on home.
- Image slot IMG-07 above the prose: 1200×675 displayed at 900×506 in columns
  3–11 at ≥1024px, 350×197 at ≤767px. Caption bar `FIG. 04` · `MOFE` ·
  `13.1 SYSTEM`. SP-07 plate until shot.

`W/02` is the only record in this section. `W/03` is a reserved index with no
record behind it, per section 1.

**How a withheld record behaves**, stated once so the mechanism exists without
anything to attach it to:

- The record is one full-width row in a flow list. Its absence costs one row
  and one 64px gap and changes no other measurement on the page.
- Its index is never reassigned, so the page reads `W/01`, `W/02`, `W/04` and
  the gap is left unexplained.
- This section still has `W/02` in it, so it never renders empty. If a future
  state leaves it with no records at all, the section and its standfirst are
  removed together rather than shown empty.
- **A withheld record does not exist in the file.** Not as markup, not as a
  commented-out block — an HTML comment is readable by anyone who views source
  — not as a plate, not as an image filename, not in `sitemap.xml`, and not as
  a sentence anywhere on the site describing what is missing. The spec names
  the constraint and nothing else, per section 1.

### 03 — In development

One `body` sentence saying further projects exist and will be shown when they
can be named. Below it, three SP-07 plates in a row at ≥1024px (each spanning
4 columns, 288×216), stacked at ≤767px (350×197), each labelled
`UNANNOUNCED`. They are placeholders stated as placeholders, not implied work.

### Contact band

Identical to home section 05, renumbered `04 — CONTACT`.

---

## 5. `/studio.html`

**Purpose.** Carry the real proof — three long CVs — and the complete
technical register that does not belong on the home page.

**The one thing a visitor should do.** Email, after reading a bio.

**Section order.** Page head → index band → 01 Practice → 02 People →
03 Capabilities → *(04 Friends and collaborators, reserved)* → contact band →
footer.

### Page head

`<h1>` = `STUDIO`, `statement`. Standfirst at `lead`, columns 6–11: the
practice is three people in New York; the work divides into sound designed for
a room, the systems that carry it, and the objects built to make it.

### 01 — Practice

Three paragraphs at `body`, columns 1–6 at ≥1024px (660px, about 77
characters). Copy intent:

1. What the practice makes, in the brief's framing: the creative work leads,
   the systems work supports it, the fabrication work is bespoke.
2. The systems half stated plainly: it is logic and artist-facing workflow,
   frequently on hardware installed by someone else, and a room built by
   others and made usable is a real service.
3. Who it is for: galleries, museums, and public art first; immersive venues,
   artists, labels, and commercial spaces arriving from that position. Stated
   once, without listing the audience as bullet points.

### 02 — People

Three SP-03 records, alphabetical by surname. Bio text is kept in substance
from the current site; the copy-editor may tighten but may not remove a named
credit.

**≥1024px** layout per record:

| Columns | Content |
|---|---|
| 1–3 (342px) | Portrait, 320×400, flush left, top-aligned with the name |
| 4–8 (546px) | Name at `title`, then two bio paragraphs at `body` |
| 10–12 (342px) | Specialties, as an SP-03 register: `label` token, `--fg-body` per W2, 32px rows, 1px `--line` between. Not a bare list at line-height 2.0 |

64px between records, each with its 1px top rule.

**≤767px** per record: top rule → index → portrait 350×438 → name at 24px →
bio paragraphs at 16px → specialties as `label` rows. Gaps 16/24/16/16/32.

Records, in order:

1. `P/01` **Michael Amacio** — live sound engineer, production manager,
   composer. Keep: Jimmy Destri, Output, MoMA PS1, The Magnetic Fields,
   Sevdaliza, Quo Vadis Productions, Alessandro Cortini, Hiro Kone, Robert
   Aiki Aubrey Lowe, Richard Mosse, *32 Sounds*, Philip Glass Ensemble,
   Fridman Gallery, Yucatán. Specialties: `ROOM TUNING`,
   `PRODUCT INTEGRATION`, `ENGINEERING`, `DESIGN`, `INSTALLATION`.
2. `P/02` **Andrew Fox** — spatial audio creator, mix engineer, systems
   designer. Keep: MoFE 2020–2022, the 13.1 system, Dolby Atmos mixes for
   Sony/Universal, Netflix, Domino Records, Polyvinyl, Mexican Summer, and the
   BRIC Brooklyn, Green-Wood Cemetery, and Public Art Fund installations.
   Specialties: `DOLBY ATMOS`, `PROJECT MANAGEMENT`, `ENGINEERING`, `DESIGN`,
   `INSTALLATION`.
3. `P/03` **Chloe Alexandra Thompson** — engineer, spatial audio specialist,
   creative technologist. Keep: Meow Wolf audio designer, 32–148 speaker high
   density arrays, wave field synthesis sound holograms, Q-SYS and MaxMSP,
   Cycling '74 first cohort of Max Certified Trainers in 2020, the 2021 AES
   presentation on wave field synthesis. Specialties:
   `WAVE FIELD SYNTHESIS`, `SYSTEMS ARCHITECTURE`, `ENGINEERING`, `DESIGN`,
   `PRODUCT INTEGRATION`, `CREATIVE TECHNOLOGY`.

The bios are the longest prose on the site. They are the proof, so they are
allowed the length. Nothing else on the site runs past three paragraphs.

### 03 — Capabilities

The full technical register, as a register rather than a sales list. Three
groups matching the three offerings, each a column at ≥1024px (4 columns
each), stacked at ≤767px.

Each group: a `label` heading in `--fg-primary`, then hairline rows at
`body-s` in `--fg-body`, 40px tall at ≥1024px and 44px at ≤767px, 1px `--line`
between.

Group contents are the metadata lists from home section 01, expanded. The
current site's "Speaker Installation" wording does not return; the brief is
explicit that it reads as the commodity version of something that is not a
commodity.

### 04 — Friends and collaborators (reserved)

Not rendered. Specified in section 1 of this document. When published it uses
the credits register component, sits here, and changes nothing above or below
it.

---

## 6. Image slots and weight budgets

Every photograph ships as AVIF with a WebP fallback in a `<picture>`, explicit
`width` and `height` attributes, `loading="lazy"` except IMG-01 on home, and
`decoding="async"`. Budgets below are the AVIF weight of the variant actually
downloaded at the scored viewport.

| ID | Page | Intrinsic | Displayed ≥1024 / ≤767 | Budget | Must show |
|---|---|---|---|---|---|
| IMG-01 | home 02, work 01 | 1600×900 | matted plate, 560px / 220px tall | 110KB | The Reforesters Laboratory listening room from a seated listener's position, wide enough that the array reads as an array. Low ambient light, the room's own light sources visible. No people, or one figure at the frame edge for scale. Horizontal. **Crossing constraint:** a 1px `--ground` rule crosses this image 40px above the plate's bottom edge, so in the 24px band centred on that line the image must contain no pixel lighter than `#C9C4BB`. Checkable with an eyedropper on the delivered asset |
| IMG-02 | home 04, studio 02 | 640×800 | 240×300 / 120×150 | 22KB | Michael Amacio. Existing `img/ma.jpg`, recropped to 4:5, baked greyscale |
| IMG-03 | home 04, studio 02 | 640×800 | 240×300 / 120×150 | 22KB | Andrew Fox. Existing `img/af.jpg`, recropped to 4:5, baked greyscale |
| IMG-04 | home 04, studio 02 | 640×800 | 240×300 / 120×150 | 22KB | Chloe Alexandra Thompson. Existing `img/chloe.jpg`, recropped to 4:5, baked greyscale. Currently 239KB; it must come in at the same budget as the other two |
| IMG-05 | home 02, work 02 | 960×1200 | 432×540 / 350×438 | 45KB | The custom speaker enclosure under construction. Raw material, joinery, or a driver mount visible. Workshop light. Nothing that identifies the client. Vertical |
| IMG-06 | work 01 | 1200×800 | 900×600 / 350×233 | 80KB | The control surface and signal path at Reforesters: the SQ-5, the rack, or a Q-SYS screen. It must look like equipment in a working room, not a product shot |
| IMG-07 | work 02 | 1200×675 | 900×506 / 350×197 | 70KB | The MoFE room with the array readable as an array, wide, from a listener's height. The scale is the point, so the frame must contain enough of the room to show it. No identifiable faces. Horizontal |
| OG-01 | all | 1200×630 | not rendered | 60KB | `#EDEBE6` ground, the array plot in `#B0AAA0` hairlines, the mark, and the wordmark in `#141210`. Flat, two-tone, so it compresses small |

The three portrait slots serve two pages. At `studio.html` the same 640×800
sources are displayed at 320×400 and 350×438, so no second variant is needed.

Separate `srcset` variants at 780w and 1200w exist for IMG-01 and IMG-06 so
the mobile viewport downloads the small one. Only one variant counts against
a page's weight.

### Per-page weight

Rubric floors: total under 500KB, largest single asset under 150KB.

| Asset | Home | Work | Studio |
|---|---|---|---|
| HTML, inline SVG, inline JS | 38KB | 30KB | 30KB |
| `style.css` | 18KB | 18KB | 18KB |
| `archivo-narrow-400.woff2` | 24KB | 24KB | 24KB |
| `source-serif-4-400.woff2` | 24KB | 24KB | 24KB |
| Favicon set | 7KB | 7KB | 7KB |
| Photography | 110 + 66 + 45 = 221KB | 110 + 80 + 45 + 70 = 305KB | 66KB |
| **Total, fully shot** | **332KB** | **408KB** | **169KB** |
| **Total, plates only** | **111KB** | **103KB** | **169KB** |

Largest single asset: 110KB. Floor is 150KB. `work.html` fully shot is the
closest page to the 500KB floor at 408KB. Everything below IMG-01 on that page
is `loading="lazy"`, so the figure counts bytes a reader reaches by scrolling,
not bytes at first paint.

The home page's HTML grows 10KB over the previous revision and stays the
smallest text asset on any page:

| Addition | Cost |
|---|---|
| Five sound objects, SP-13 | ≤ 0.8KB of markup |
| Three G-01 diagrams | ≤ 2.5KB each, ≤ 7.5KB |
| G-02 axis and twelve connector rules | ≤ 1.2KB |
| Five watermark figures, SP-19 | ≤ 1.3KB of markup |
| Two action-target symbols plus two instances, SP-18 | ≤ 0.7KB of markup |
| Inline script, SP-13 + SP-14 + SP-19 + SP-05 | ≤ 2.5KB |
| Removed: four `<span>`/`<i>` email assemblies and their attributes | −1.6KB |
| Removed: the hero next-step line and the contact band location line | −0.2KB |

`style.css` grows 2.5KB for the objects, the action target, the watermark, the
mat, and the drawn elements, and loses the two knockout blocks, the rail, the
`.mail .at` / `.mail .dot` rules, and the two primary links' underline rules.
Nothing added in this revision makes a network request: every drawing is inline
SVG and the script is inline.

---

## 7. Head and metadata, all pages

Required on every page, checked by the rubric's deterministic list:

- `<html lang="en">`, `<meta charset="utf-8">`, viewport with
  `width=device-width, initial-scale=1`.
- Title pattern: `Astral Spatial — spatial audio designed as a work` on home,
  `Work — Astral Spatial`, `Studio — Astral Spatial`.
- `<meta name="description">`, ≤155 characters, different per page, specific.
- `<link rel="canonical">`, absolute `https://astralspatial.com/…`.
- `og:type`, `og:site_name`, `og:title`, `og:description`, `og:url`,
  `og:image` (absolute URL to OG-01), `og:image:width` 1200,
  `og:image:height` 630, `og:image:alt`.
- `twitter:card` = `summary_large_image`, `twitter:title`,
  `twitter:description`, `twitter:image`.
- `<meta name="theme-color" content="#EDEBE6">`.
- Favicon: `favicon.svg` is the SP-11 mark — `#EDEBE6` ground, the 16×16 mark
  geometry scaled into a 32×32 box with 2px of padding, strokes and point in
  `#141210`, ≤600 bytes — plus `favicon.ico` at 32×32 and
  `apple-touch-icon.png` at 180×180 ≤6KB. The nine-square grid previously
  specified here is withdrawn; the site has one mark and the tab carries it.
- Two `<link rel="preload" as="font" type="font/woff2" crossorigin>`.
- One `<link rel="stylesheet" href="/style.css">`. Nothing else blocks render.
- A skip link as the first focusable element, visually hidden until
  `:focus-visible`, targeting `#main`.
- JSON-LD `Organization`: name, url, logo, address locality New York, region
  NY, country US. **No email property** — it would undo SP-05.
- `robots.txt` and a three-URL `sitemap.xml`. Staging serves
  `<meta name="robots" content="noindex">`; production does not.

Accessibility requirements that carry the Lighthouse floor of 90:

- One `<h1>` per page, headings in sequence, no level skipped.
- `alt` on every `<img>`. Decorative SVG elements `aria-hidden="true"`.
- `:focus-visible` is a 1px `--fg-primary` outline at 2px offset, never
  removed, never animated. It renders above the frame: the skip link sits at
  `z-index: 50`, and no other focusable element is positioned under a frame
  strip.
- Landmarks: `<header>`, `<nav>`, `<main id="main">`, `<footer>`.
- `font-weight: 400` set explicitly on `h1`–`h6` so no synthetic bold renders.
- Tap targets ≥44×44px below 768px, including every contact link.
- **No `aria-label` on any contact link.** Each one's accessible name is its
  visible text, which clears Lighthouse's `label-content-name-mismatch` on all
  four instances.
- The five sound objects are inside the plot's single `role="img"` SVG, which
  carries one `aria-label` for the whole diagram. The objects add no accessible
  nodes, no `<title>`, and no live region. Their numerals are SVG `<text>` and
  are not announced separately.
- No element's visibility, position in reading order, or accessible name
  depends on the script.

---

## 8. Motion and interactivity inventory

Everything that moves, with the evidence a critic can check.

| # | What | Trigger | Duration / easing | Evidence |
|---|---|---|---|---|
| M1 | SP-08 array plot draws: frame, then spokes, then points, then captions | Page load, once | 1200ms / `--ease-io`, then 640/240/640ms at `--ease-out` | Screen recording of the first 2s at 1440×900. Final frame identical to the reduced-motion render |
| M3 | Header and footer contact-link underline brightens `--line` `#3A3732` → `--fg-primary` `#141210` | Hover, `:focus-visible` | 120ms / `--ease-out` | Hover screenshot of the footer `CONTACT` cell. The two primary instances carry no underline and are not in this row — see M9 |
| M4 | SP-03 record top rule `--line` → `--line-strong`, index numeral `translateX(8px)` | Hover, ≥1024px, `pointer: fine` | 120ms / `--ease-out` | Hover screenshot of record `001` |
| M5 | Index band cell text `--fg-body` → `--fg-primary` | Hover | 120ms / `--ease-out` | Hover screenshot of the index band |
| M6 | Link row text and its mark brighten together, the mark via `stroke: currentColor` | Hover, `:focus-visible` | 120ms / `--ease-out` | Hover screenshot of the `ALL PROJECTS` row showing text and mark at `--fg-primary` |
| M7 | Five sound objects travel elliptical paths through the array field, SP-13 | Page load, from 2040ms, continuous while the tab is visible | 22–41s per object, linear in θ, no easing | Screen recording at 1440×900 and 390×844. Two frames 1s apart: every object has moved, none exceeds 35 CSS px/s, none leaves the plot frame, every numeral is readable at 10px |
| M8 | The field's elevation changes with scroll: every object's semi-minor axis is multiplied by `k`, SP-14 | Scroll, continuous | None — a linear function of `scrollY`, no transition, no easing | Screenshots at scroll 0 and at the plot's exit. `k` ranges 1.30 → 0.70; the largest object moves 48 CSS px vertically across 1446px of scroll at 1440px, 31px across 1194px at 390px |
| M9 | SP-18 action target: the target and the words `translateX(8px)` together, the left gap closing 24 → 16px and the right opening 24 → 32px. Active gives back half | Hover (`pointer: fine`), active | 120ms / `--ease-out` | Hover and active screenshots of both instances. Nothing changes colour in either state; `:focus-visible` shows the 1px ring and no offset |
| M10 | SP-19 watermark: five figures lag the scroll, `translateY(scrollY × 0.16)` | Scroll, continuous | None — a linear function of `scrollY`, no transition, no easing | Screenshots at scroll 0 and scroll 844 at 390px. A watermark stroke has moved 135px less than the paragraph in front of it. No glyph samples anything but `#141210` or `#2B2825` in either frame |

M2, the right-edge rail label swap, is withdrawn with SP-04.

**M7 and M8 are the whole autonomous motion budget**, and they are both inside
one `<svg>` on one page. M3–M6 and M9 are 120ms hover affordances. M10 is the
one sanctioned parallax on the site: it moves only while the reader scrolls,
it carries no information, and it is at stacking level `-1` below every other
element.

Nothing else moves. The frame does not move, draw, or fade. The mark does not
move; only M6's colour change touches it. No mouse tracking, no scroll-linked
translation of anything a reader can read, no scroll-triggered entrance
animations on body content, no carousel, no autoplaying media, no
`position: sticky`, no scroll hijack, and no transform anywhere that reads
pointer position.

Under `prefers-reduced-motion: reduce`: M1 renders complete, M3–M6 and M9
change state with no transition, **M7 never starts, M8 is pinned to `k = 1`,
and M10's `transform` is never set**, so the watermarks scroll with the
document. The frame, the mark, and every layered composition are identical to
their normal render. No content is hidden or unreachable.

Without JavaScript: M1, M3–M6, and M9 all work, because the action target is
CSS and inline SVG with no scripted part; M7, M8, and M10 do not exist, and the
five objects render at their authored rest positions, which is a complete
drawing.
The frame, the mark, every drawn element, and every layered composition render.
The three jump links scroll to the contact band, where the mail link works
natively. Every page is fully readable and every link resolves.

---

## 9. What is removed

### From the original site

- The centred 900px column and the centred header.
- 2px borders. All rules become 1px `--line`.
- Circular portraits with white borders.
- The `→` and `•` list bullets.
- Italic grey specialties.
- The services list in its current order and wording, led by "Speaker
  Installation".
- `info [at] astralspatial.com` as unlinked plain text.
- The system font stack.
- "Alanis Morisette".

### From the current build, by the previous revision

- `.rail` and its `@media` blocks in `style.css`, the `<div class="rail">`
  element, and every `data-rail` attribute. SP-04 is withdrawn.
- The `→` glyph in `ALL PROJECTS →` and `FULL BIOGRAPHIES →`. The mark on the
  row's rule replaces it.
- The nine-square favicon. The mark replaces it.
- The dark stylesheet and any `ground-dark` `:root` block. The repo ships one
  theme.

### From the current build, by this revision

- **Both `--ground` knockouts.** `.w01-knockout` and `.w04-knockout`, their
  markup, their absolute positioning, their padding, and the 200px opaque box
  that punched a hole in the `ALL PROJECTS` rule. The word does not return.
- **Type on photographs.** No type sits on an image anywhere. The mat carries
  it instead.
- **The email address as rendered text.** Four instances. With them: the
  `<span>`/`<i>` assembly, `data-u`, `data-d`, `moc.laitapslartsa`,
  `.mail .at::before`, `.mail .dot::before`, `id="email-fallback"`, and the
  four-href rewrite loop.
- **Four `aria-label` attributes** spelling the address out in the accessible
  tree.
- **`INFO@ASTRALSPATIAL.COM` at `statement` size** in the contact band.
  `START A PROJECT` replaces it, which also removes the 390px clip.
- **The twelve-name three-column credit list.** G-02's register replaces it.
- **The closing sentences of records `001` and `003`**, which restated their own
  openings, and `003`'s verbatim reuse of the `<h1>`'s strongest clause.
- **`W/02`'s prose credit**, which duplicated its own SP-09 block word for word.
- Every piece of plausible placeholder prose. SP-16 governs what replaces it.
- **The hero's `body-s` next-step line**, deleted outright with no replacement,
  not even a `label` line. Its fact is stated once, in the contact band.
- **The contact band's `NEW YORK` location line.** The city is on the page
  twice already.
- **The underline on both primary call-to-action instances**, and the
  `border-color` hover transition that went with it. SP-18's drawn object is
  the affordance. The underline survives only on the header and footer text
  links, where it is `--line` at rest rather than `--line-strong`, so the
  hover has somewhere to go.
- **The two 1px `--line` G-04 aperture rules**, replaced by one 2px
  `--fg-primary` datum.
- **The light line values `#B0AAA0` and `#8C857A`.** Replaced by `--line`
  `#3A3732`, `--line-strong` `#141210`, and the new `--line-detail` `#5E5A53`.
- **The `--wash` token.** Replaced by `--watermark` `#E4E1DB`.
- **Evenly spaced watermark anchors.** The parallax lag carries each figure
  down the page, so even spacing leaves gaps at roughly 40 and 85 percent.
  Anchors are compensated instead: `0.84 ×` the scroll position where each
  figure should be centred.

Kept: the bio text in substance, the three headshots, the twelve credit names,
`info@astralspatial.com` as the contact route, and the light ground `#EDEBE6`.

Kept from the current build, unchanged: the type scale and every size on it,
the spacing scale, the grid, the breakpoints, the palette, SP-00 through SP-04,
SP-06 through SP-11, the index band, the footer, the array plot's geometry and
draw animation, and the portrait treatment. This revision changes one mechanic
(layering), replaces one component (SP-05), and adds four (SP-13 to SP-16). It
is not a rebuild.

---

## 10. Decisions taken

The brief leaves these open. Each is a choice, with what it rejects.

1. **Light ground, `#EDEBE6`.** Settled, not chosen here: both grounds were
   built and reviewed on staging on 2026-11-23 and Andrew chose light. The
   dark build is shelved and `ground-dark` survives only as a documented,
   matched token set in the skill against a possible later user-switchable
   dark mode. No page ships it, no stylesheet contains it, and nothing in
   this spec branches on it. The consequence that still has to be honoured is
   photographic: a dim-room photograph on paper is a dark rectangle, so the
   tonal mapping and the plate mat in the skill's photography section are
   requirements, not preferences.
2. **Two self-hosted faces: Archivo Narrow 400 and Source Serif 4 400.**
   Rejected: a single grotesque (no editorial register, loses blankforms.org),
   a licensed condensed grotesque (cost), and a variable font (weight).
   48KB total, no italic file, no weight above 400.
3. **Three pages.** Rejected: one long scrolling page (the bios and the
   Reforesters detail both need room, and burying them costs the strongest
   proof the business has) and a five-page site with separate Services and
   Contact pages (not enough content, and a contact page is a dead end when
   the action is an email).
4. **The call to action is a verb, and the address lives in one
   percent-encoded `href` per page.** Reversed from the previous revision,
   which rendered the address at `statement` size as CSS-assembled text and
   rebuilt four hrefs with script. Andrew's decision: the display element is
   `Start a project`, the address is never rendered as text, and the
   `aria-label` stops spelling it out. Percent-encoding needs no script, so
   the contact route now works with JavaScript off, which the previous scheme
   did not. Rejected: a contact form (no backend, and the brief rules out
   handing strangers a funnel); a fourth `/contact.html` page as the no-JS
   fallback (a page whose only content is an address is the dead end the IA
   already rejected); rendering the address in the footer for copying (Andrew
   ruled it out, and it was the single richest target on the page);
   Cloudflare's automatic obfuscation (injects a script the repo does not
   control). The honest limit is recorded in SP-05: a rendering scraper reads
   the resolved DOM and `decodeURIComponent` is one call. This reduces surface;
   it does not guarantee anything.
5. **An inline SVG array plot as the hero visual.** Rejected: a stock image, a
   video, an empty hero, and a large wordmark. It is 0 network bytes, it is
   the hairline-diagram device the brief takes from other-people.net and
   ashley.systems, and it has a defined retirement path when photography
   exists.
6. **Index band as navigation at ≤767px.** Rejected: a hamburger menu and a
   drawer. Both need JavaScript and both read as a product site.
7. **Cam Finley appears nowhere on the published pages.** Rejected: a
   fabrication credit line on home. The brief is explicit that he gets no bio,
   no section, and no billing. The IA holds his slot as the first intended
   entry of `04 — FRIENDS AND COLLABORATORS`, which publishes when the
   fabrication commission can be named.
8. **Bios ordered alphabetically by surname** — Amacio, Fox, Thompson.
   Rejected: the current site's order and any seniority ordering. Alphabetical
   implies no hierarchy between three equal principals.
9. **"Credits" rather than "Past Clients".** Rejected: keeping the current
   heading. The names belong to the three people's prior work, and the brief
   says to frame them accordingly.
10. **No chromatic accent.** Rejected: a single signal colour. Emphasis is
    contrast. On the light ground there is no glow and no non-flat value
    anywhere in the system.
11. **No right-edge section rail.** Reversed from the previous revision, which
    specified one. The frame now draws a fixed hairline 17px from the right
    edge; a second fixed vertical 23px further in reads as an error, and the
    frame does the rail's job at every breakpoint rather than only at
    ≥1024px. Also rejected, as before: publicrecords.nyc's panels sliding from
    the right edge. Full reasoning in SP-04.
12. **Static header, not sticky.** Rejected: a sticky header carrying the
    email. The address appears four times already, and a persistent bar is a
    product-site habit.
13. **Portraits are 4:5 rectangles in baked greyscale.** Rejected: the current
    circular crops with 2px white borders, and colour. Greyscale makes three
    differently lit photographs cohere and compresses smaller.
14. **Body text is 60–80 characters at ≥1024px and viewport-bound below
    768px**, with a 38-character floor at 390px. Rejected: shrinking mobile
    type below 16px to reach 60 characters, which the rubric's mobile
    criterion forbids outright.
15. **The frame is fixed to the viewport, with solid `--ground` strips, and
    the document is inset to match.** Rejected: a frame drawn on the document,
    which on a 6000px page is a border nobody sees after the first screen; a
    transparent frame of four `border` edges, which lets a 56px heading be
    bisected by a hairline mid-scroll; and a 2px rule, which at a 9px inset on
    a 390px screen reads as a browser chrome border and breaks the system's
    one-pixel rule. The solid strips are what make the cut clean, and they let
    full-bleed mean bleeding to the frame rather than to the viewport.
16. **The frame carries array geometry, not a plain rectangle.** Interrupted
    edge rules, `--line-strong` corner L-ticks, and five measurement ticks on
    the left edge at ≥1024px. Rejected: a plain inset rule, which is the safe
    version and says nothing; and putting ticks on all four edges, which turns
    the page into a drafting sheet and competes with the array plot 500px
    away. One edge carries them, the one the eye reaches first.
17. **One mark, placed only in a gap in a 1px rule.** Rejected: a numeric cap
    on instances, which is arbitrary and invites argument about whether the
    seventh is allowed; and allowing the mark as a link affordance beside body
    text, as an index-band glyph, or as a bullet. The positional rule is
    stricter and self-enforcing: a mark not centred in a gap in a rule is a
    defect, so the mark means "a rule terminates here" and nothing else. It is
    never explained, named, or captioned.
18. **The mark is a three-axis gizmo: Y up, X right, Z foreshortened toward
    the viewer, each axis ending in a filled triangle.** Chosen by Andrew from
    five candidates rendered at size. Rejected: a symmetric 120° triad, which
    reads as a flat asterisk rather than three dimensions; an earlier
    crosshair-and-ray mark, which read as a resize handle at small sizes; and
    heavier triangles, which muddy below 16px. The Z axis is foreshortened,
    which is what carries the dimensionality. Minimum size is 14px.
19. **Rules pass over text. Nothing masks text.** Reversed from the previous
    revision, which punched an opaque `--ground` panel out behind any type
    crossing artwork. Andrew's words: text should pass under the border lines,
    not be masked by it. The knockout was also what produced the 200px hole in
    the `ALL PROJECTS` rule, so the mechanic failed on its own terms as well
    as on the brief's. What goes with it: the knockout was the only thing
    making type-on-photograph safe, so **type on photographs goes too**. There
    is no mechanic that gives an unknown photographic tone a guaranteed
    contrast ratio, and inventing one — a scrim, a gradient, a per-image text
    colour — is forbidden by the design language. The replacement is the mat:
    type sits on `--band`, which is a flat palette colour at a measured
    14.6:1, and the mat is part of the plate rather than laid over it.
    Rejected: re-colouring or interrupting the rule where it crosses a word,
    which is the knockout again in miniature; running the rule *under* the
    type with the type knocked out of it, same thing; and keeping the knockout
    only for the one composition that needed it, which keeps a mechanic alive
    for one instance and invites its return.
20. **Two L1 crossings per page, on display type only.** Rejected: crossing
    prose, which costs a reader real legibility for a graphic effect; crossing
    `label` and `index` rows, where a 1px cut through an 11px letterform is a
    quarter of its cap height; and leaving the number of crossings to
    judgement, which is how a device becomes a texture. The one sanctioned
    exception is the ≥1440px hero vertical crossing the `lead`, which is named
    in SP-12 with its reason.
21. **The hero moves: five numbered sound objects travelling the array
    field.** Andrew's note, and the one element on the site with autonomous
    motion. Rejected: the greyed axis mark changing scale, which he offered as
    a simpler form — it breaks SP-11's placement rule, which is the thing
    keeping the mark meaning one thing, and it makes the site's signature a
    moving decoration. Also rejected: objects on straight tracks (reads as a
    conveyor, not a field); objects outside the plot, floating on the page
    (the field is the plot); more than five (the numerals become noise and the
    geometry the plot exists to show is crowded); filled `--fg-primary` discs
    (shaded blobs, and the system has no filled circles); and scaling the
    objects with the plot, which makes them 13.7px across with a 6.3px numeral
    at 390px.
22. **Scroll drives one scalar, which drives the field's elevation, at every
    width.** Rejected: mouse-tracked parallax, which the brief rules out in
    those words and which does not exist on a phone; scroll-driven entrance
    animations, which make a page that looks empty until it is scrolled;
    scroll-linked translation of the image bands, which is parallax renamed;
    `position: sticky` on the plot so the effect lasts longer, which turns the
    hero into a scroll-jacked panel; and scroll-driven opacity on anything.
    The mapping is linear, clamped at both ends, centred so that `k = 1` is the
    authored geometry, and couples 48px of object movement to 1446px of scroll.
    It is on by default at 390px, which is the point of the note.
23. **Placeholder copy is obvious filler, governed by a rule rather than by
    taste.** Rejected: writing good stand-in prose and marking it in a comment,
    which puts a note inside a deliverable and still reads as a draft in a
    screenshot; leaving the blocks empty, which breaks every layout
    measurement; and `lorem ipsum` with no leading clause, which does not say
    which block is unfinished. The `data-placeholder` attribute makes the count
    a grep and lets the production gate refuse a deploy while any remain.
24. **Five drawn additions and a prose budget, all from the existing
    vocabulary.** Rejected: photography as the answer to the brochure problem,
    because the photographs do not exist yet and the design must work before
    they arrive; a second graphic language — isometric drawings, icons,
    waveforms, spectrograms, a logo lockup — which would make the array plot
    and the mark one register among several; and decorative line art with no
    information in it, which is the brochure problem with thinner lines. Every
    addition carries a fact: a signal path, a dimension, a discipline, a
    shared datum, or the primary action.
25. **`work.html` is split by who commissioned the work, not by status.**
    Rejected: the previous `01 Complete` / `02 In progress` split, which put
    the principals' prior work in the same bucket as agency commissions and
    left attribution to the credit lines alone. The brief says a curator
    should be able to tell without asking; a section heading does that before
    any record is read, and SP-09 then says it again per record.
26. **Catalogue indices are assigned once and never re-flowed.** `W/03` is a
    reserved index with no record behind it, so the page reads `W/01`, `W/02`,
    `W/04`. Rejected: renumbering, which would make every index unstable and
    break any link or reference to a record; and a visible placeholder row for
    an unpublished record, which advertises a thing there is no permission to
    discuss. A gap in a catalogue number is normal and is not explained.
27. **Three line weights, structural near-black and detail mid-grey.**
    Andrew's decision after the phone review, built before this revision was
    written. `--line` `#3A3732` at 9.9:1 carries every page rule, including
    every rule that crosses text; `--line-strong` `#141210` at 15.7:1 carries
    the named heaviest rules and is deliberately identical to `--fg-primary`;
    `--line-detail` `#5E5A53` at 5.75:1 carries ticks, dashes, dimension
    lines, register connectors, and corner ticks. Rejected: keeping the old
    pair and adding weight with pixels, which would put 2px rules across a
    page whose whole system is one pixel; and raising `--line` without adding
    a detail token, which leaves every tick and connector at 9.9:1 and turns
    each measured drawing into a solid black diagram with no hierarchy. The
    new token is the cost of the decision and it is the only one added.
28. **The call to action is a crosshair on a point, inside a ring, on a 2px
    datum that stops either side of the words.** Andrew's note was that it
    should feel more graphic; underlined text is a text decoration, not an
    object. The figure is the array plot's listening-position mark enlarged
    and encircled, and the datum is the plot's signal line at page scale, so
    the thing a visitor acts on is drawn in the same two strokes as the thing
    the practice sells. Rejected: a **bracket**, which reads as UI chrome and
    has no point in it, so nothing is aimed at; a **framed field**, which is
    an outline box and the primitives forbid those; the **bare aperture** of
    the previous revision, two rules with an empty gap, which read as a
    spacing accident because nothing occupied the gap; and **the mark itself
    at CTA scale**, which would make the signature mean two things and break
    its placement rule. Also rejected: a button, a fill, a radius, and any
    colour change on hover. It is two instances per page, one object at two
    sizes rather than two treatments, because a visitor who meets it in the
    hero and scrolls to the bottom has to recognise the same object or the
    page reads as offering two different primary actions.
29. **The watermark is the mark at page scale, five times down the document,
    in outline, lagging the scroll at 0.16.** Andrew asked for exactly this:
    very thin, underneath the text, parallax. Built before this revision was
    written and documented here as built. The earlier specification — a fixed
    concentric-ring field in `--wash`, with an argument that the mark at size
    would break the mark's placement rule — is withdrawn. The placement rule
    governs the mark as a mark, a 14–24px figure terminating a 1px rule; at
    50vw, in outline, at 1.08:1, at stacking level `-1`, nothing resolves it
    as a mark and the two do not compete. Rejected: `position: fixed`, which
    is not parallax and was what the previous revision specified; opacity
    rather than a flat colour, which composites against whatever is behind it
    and is forbidden; filled triangles at 60px, which would be the only solid
    shapes on the site; a lag factor above 0.25, which reads as a moving
    background; and clamping the lag, which would make the figures stop
    mid-document for no visible reason. The cost is that the site's single
    "no parallax" rule becomes "parallax exactly once, below everything,
    carrying no information", and the skill's motion rules now say so rather
    than being quietly contradicted.
30. **A hard per-section prose cap, not just a per-page one.** One prose block
    per section, 55 words per section, at least two numbered sections with
    none. The per-page budget alone let five blocks pile into three sections
    and the page still read as paragraphs in columns. Rejected: shortening the
    paragraphs, which leaves the same number of text blocks and the brochure
    problem is a count; illustrating each one, which doubles the page's
    content; and converting deleted paragraphs into `label` captions, which
    spends the budget rather than saving it — a caption is a text block. Eight
    paragraphs are deleted outright against four converted to drawings or
    registers, which is the ratio the voice section asks for.
31. **Work that cannot be published is absent, not described.** No title, no
    city, no room type, no date, no client, no indication of who worked on it,
    and no generic description — a description specific enough to be useful is
    specific enough to identify. Rejected: a plate labelled with the category
    of the withheld work; an `UNANNOUNCED` row standing in for it specifically,
    as distinct from the `03 — IN DEVELOPMENT` plates, which refer to nothing;
    and a commented-out record in the markup, which anyone can read from view
    source. The spec names the constraint in section 1 and nothing else.
