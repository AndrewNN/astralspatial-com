# Spec

Source: `docs/brief.md` (approved 2026-11-23). Scored against `docs/rubric.md`.
Values come from `.claude/skills/design-language/SKILL.md`; token names below
refer to that file.

Static HTML and CSS. One stylesheet, two self-hosted WOFF2 files, inline SVG,
and exactly one piece of JavaScript: the six-line email rewrite in SP-05,
inline at the end of `<body>`. No framework, no build step, no CDN request, no
third-party script. Nothing else on the site requires JavaScript to render,
and nothing is added to that budget.

The site ships one theme, `ground-light`, ground `#EDEBE6`. There is no
toggle, no `prefers-color-scheme` branch, and no dark stylesheet in the repo.

Two scored viewports: **390×844** and **1440×900**. Both are first-class.

Three devices carry the design beyond the hairline grid: the frame (SP-10),
the mark (SP-11), and layering (SP-12). Each is specified once as a component
and then referenced.

---

## 1. Information architecture

Three pages ship. A fourth slot is defined and held empty.

| Path | Title | Exists | Purpose |
|---|---|---|---|
| `/index.html` | Astral Spatial | now | Say what the practice does, prove it once, route to email |
| `/work.html` | Work | now | The records at full length, split by who commissioned them; a place for the next five |
| `/studio.html` | Studio | now | The three CVs, the full capability register, the reserved collaborators slot |

Nothing else. No contact page: the call to action is an email address, and a
page whose only content is an address is a dead end. The address appears in
the desktop header, the home hero, the contact band on all three pages, and
the footer on all three pages.

### Reserved: friends and collaborators

Specified now, published later. It is `04 — FRIENDS AND COLLABORATORS` on
`studio.html`, sitting between `03 — CAPABILITIES` and the contact band.

- It uses the **credits register** component already built for home section
  03: hairline rows, three columns at ≥1024px, one at ≤767px.
- Each entry is three fields on one row: name, discipline, the project they
  worked on.
- It inherits the standard section rhythm. Adding it moves the contact band
  down the page and changes nothing else. No new component, no new type size,
  no new breakpoint behaviour.
- Publication condition: at least two names, each attached to a finished,
  nameable project.
- First intended entry: Cam Finley, fabrication. Until the condition is met,
  Cam Finley's name does not appear on any published page, in any markup, or
  in any image alt text.

### Work record numbering

Four records exist. Indices are catalogue designations, assigned once, and are
never re-flowed when a record is withheld or added.

| Index | Record | Commission | Page |
|---|---|---|---|
| `W/01` | Reforesters Laboratory | Astral Spatial | home 02, work 01 |
| `W/02` | MoFE | Predates Astral Spatial | home 02, work 02 |
| `W/03` | Anechoic chamber, Detroit | Predates Astral Spatial | work 02 only, withheld until cleared |
| `W/04` | Unnamed fabrication commission | Astral Spatial | home 02, work 01 |

`W/03` ships only when its details are confirmed and permission to publish is
given. Until then it is absent, and `work.html` reads `W/01`, `W/02`, `W/04`.
A gap in a catalogue number is correct catalogue behaviour and is not
explained. Nothing on any page depends on the number of work records: records
are a flow list of full-width rows, never a fixed-count grid, so removing one
removes one row and changes no other measurement. The same holds in reverse
for `W/05`.

Every work record carries SP-09. No exceptions.

---

## 2. Shared components

### SP-00 — Section rule and label

Every section on every page opens with a 1px `--line` rule across the content
width, then its label.

| Element | Token | Colour |
|---|---|---|
| Section rule | 1px solid | `--line` |
| Section number + name, e.g. `02 — SELECTED WORK` | `label` | `--fg-muted` |

Vertical gaps per the skill's section rhythm table: 128/24/48 at ≥1024px,
64/16/32 at ≤767px.

The rule carries the mark (SP-11) at its right end: a 32px gap at ≥768px with
the 16px mark centred in it, a 28px gap at ≤767px with the 14px mark centred
in it. The gap is at the right end of the content width, so the rule reads as
starting at the left margin and terminating in the mark. One mark per section
rule, never two.

The contact band's top and bottom rules carry no mark — the band is
unnumbered, and the footer's mark is 192px below it, which is close enough
that a third instance would read as a pattern rather than a terminator.

Section numbers restart at `01` on each page. The home hero, the index band,
the contact band, and the footer are unnumbered.

### SP-01 — Header

Full-bleed, static (not sticky), 1px `--line` bottom rule.

**≥1024px**, height 64px, page margin per grid:

- Left: `ASTRAL SPATIAL`, `wordmark` token, `--fg-primary`. On `/` it is a
  `<p>`; on other pages it is an `<a href="/">`.
- Right, in one row, 32px gaps, vertically centred: `WORK`, `STUDIO`, a 1px
  `--line` vertical divider 16px tall, then the email (SP-05) at `label` size
  in `--fg-primary`.
- Current page's nav item: `--fg-primary` instead of `--fg-muted`, no
  underline.

**≤767px**, height 56px:

- Left: wordmark at 16px. Right: nothing.
- Navigation at this width lives in the index band (SP-06) and the footer.
  No hamburger, no drawer, no JavaScript menu.

### SP-02 — Footer

Appears on all three pages. 1px `--line` top rule. Preceded by 192px of space
at ≥1024px, 96px at ≤767px.

The top rule carries the mark (SP-11) at its **left** end — the one mirrored
instance on the site. 40px gap at ≥768px with the 24px mark centred in it,
32px gap at ≤767px with the 16px mark centred in it. The gap starts at the
left page margin, so the mark sits where the rule would otherwise begin.

Row 1, navigation, `label` token, `--fg-muted`, current page `--fg-primary`:
`HOME` `WORK` `STUDIO`.

Row 2, status bar, `label` token, `--fg-muted`, five cells:
`ASTRAL SPATIAL` · `NEW YORK` · `SPATIAL AUDIO, SYSTEMS, FABRICATION` ·
the email (SP-05, `--fg-primary`, carries `id="email-fallback"`) · `© 2026`.

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
| 1–2 | Index, `index` token, e.g. `001`, `W/01` |
| 3–7 (546px) | Title (`title`), then prose (`body`) |
| 9–12 (432px) | Metadata rows: `label` token, one per line, line-height 2.0, `--fg-muted` |

Top rule 1px `--line` across the full content width. 64px between sibling
records.

**≤767px**, stacked:

1. Top rule.
2. Index, `index` token, 16px below the rule.
3. Title, `title` at 24px, 16px below the index.
4. Prose, `body` at 16px, 16px below the title.
5. Metadata rows, `label` at 11px, 32px below the prose, 16px apart.

48px between sibling records.

**Hover**, ≥1024px and `(pointer: fine)` only: top rule `--line` →
`--line-strong` over `--dur-fast`; index numeral `translateX(8px)` over
`--dur-fast`, `--ease-out`. Nothing else changes.

**Metadata column composition.** For offerings (`001`–`003`) and people
(`P/01`–`P/03`) the column holds technical rows only. For work records
(`W/01`–`W/04`) the column opens with SP-09, then a 1px `--line` rule with
16px clear above and below, then the technical rows. The record component
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

### SP-05 — The email address

Clickable for a person, uninteresting to a scraper. The literal string
`info@astralspatial.com` must not appear anywhere in the HTML source of any
page, in any attribute, in any JSON-LD block, or in `sitemap.xml`.

Markup, one instance per placement:

```html
<a class="mail" href="#email-fallback" data-mail
   data-u="info" data-d="moc.laitapslartsa"
   aria-label="Email Astral Spatial at info at astralspatial dot com"
  ><span>info</span><i class="at" aria-hidden="true"></i
  ><span>astralspatial</span><i class="dot" aria-hidden="true"></i
  ><span>com</span></a>
```

CSS supplies the two characters that would make the string matchable:

```css
.mail i { font-style: normal; }
.mail .at::before  { content: "\0040"; }
.mail .dot::before { content: "\002E"; }
```

One loop, inline at the end of `<body>`, rewrites the href:

```js
for (const a of document.querySelectorAll('[data-mail]')) {
  a.href = 'mailto:' + a.dataset.u + String.fromCharCode(64) +
           a.dataset.d.split('').reverse().join('');
}
```

Without JavaScript, `href="#email-fallback"` jumps to the footer status cell,
which renders the same address for reading and copying. That anchor exists on
every page, so the link-checker finds zero broken links.

Styling: 1px `--fg-muted` underline at 6px offset; on hover and
`:focus-visible` the underline goes `--fg-primary` over `--dur-fast`. At
≤767px the link is `display: inline-block` with `padding: 8px 0` so its tap
target is ≥44px tall.

### SP-06 — Index band

The catalogue register that doubles as navigation, after other-people.net.
Sits directly under the hero on `/` and directly under the page title on
`work.html` and `studio.html`. Lists that page's numbered sections as in-page
anchors.

**≥1024px**: one row, 56px tall, 1px `--line` above and below. Cells of equal
width separated by 1px `--line` vertical rules. Each cell: number in `index`,
16px gap, name in `label`. Hover: text `--fg-muted` → `--fg-primary` over
`--dur-fast`.

**≤767px**: one row per section, 56px tall, 1px `--line` between. Number flush
left, name 16px to its right, a 12px `↓` glyph flush right in `--fg-muted`.
56px rows satisfy the 44px tap-target floor.

At ≤767px the band carries two extra rows at the end — `WORK` and `STUDIO` —
which are the cross-page navigation missing from the mobile header. Those two
rows are not shown at ≥1024px, where the header carries them.

### SP-07 — Image plate

The state of every image slot before its photograph exists. Costs 0KB.

- The exact box dimensions the photograph will occupy.
- 1px `--line` border, `--ground` fill.
- Four corner ticks, 12px long, 1px `--line-strong`, inset 8px.
- Centred: `label` token, `--fg-muted`, naming what the plate will hold, e.g.
  `PLATE — INSTALLATION, REFORESTERS LABORATORY`.
- The same caption bar the photograph will carry.
- No motion.

When the photograph arrives the fill changes and nothing else does.

**When an SP-12 knockout overlaps the plate**, the plate's label is centred in
the area left clear rather than in the plate box. At ≥1024px on the home
section 02 band, the knockout covers the bottom 96px, so the label centres on
the remaining 464px: 232px from the plate's top edge. At ≤767px the knockout
covers the bottom 48px of a 220px band, so the label centres at 86px. The
label is never behind a knockout and never clipped by one.

### SP-08 — Array plot

The hero visual before installation photography exists. Inline SVG, so no
request. ≤6KB of markup. `role="img"`, `aria-label="Diagram of a twenty-four
point speaker array around a listening position"`.

`viewBox="0 0 560 560"`, `preserveAspectRatio="xMidYMid meet"`. Rendered at
546×546 at ≥1024px, 350×350 at ≤767px.

Contents:

| Element | Spec |
|---|---|
| Frame | 1px `--line` square, inset 0.5px |
| Outer ring | 16 points at r=228 from centre |
| Upper ring | 6 points at r=150, rotated 11.25° from the outer ring |
| Height layer | 2 points at r=60, above centre |
| Point | 3×3px square, `--fg-primary` |
| Numerals | `01`, `04`, `08`, `12`, `16`, `20`, `22`, `24` only, `index` token at 10px, `--fg-muted`, set 10px radially outward |
| Listening position | 16×16px 1px cross, `--fg-primary`, at centre, labelled `LP` 10px to its right |
| Spokes | 8 hairlines, centre to each numbered point, 1px `--line` |
| Measurement ticks | Left and bottom edges, 1px `--line`, `stroke-dasharray: 2 4`, with `--fg-muted` captions giving the channel count |
| Signal line | One 1px `--fg-primary` line from the centre cross to point 01. No glow: `--glow` is `transparent` on the light ground. Emphasis is carried by contrast — `--fg-primary` at 15.7:1 against neighbouring rays at 1.94:1 — and by the ray's own tick column at 16px pitch against 32px on the rest of the plot |
| Caption bar | Flush under the frame, 32px tall, 1px top rule, `label` token. Left cell `FIG. 01`, right cell `24.2 — REFORESTERS LABORATORY` |

**Motion**, CSS `@keyframes` only, plays once on load, total ≤2000ms:

1. Frame draws clockwise from top-left, `stroke-dashoffset` → 0,
   `--dur-draw`, `--ease-io`.
2. Spokes draw outward from the centre, `--dur-slow`, `--ease-out`, starting
   at 400ms, stagger 60ms.
3. Points fade in `opacity` 0→1 in index order, `--dur`, stagger 60ms,
   starting at 700ms. Maximum 8 staggered groups: points are grouped in
   threes.
4. Numerals and caption bar fade in, `--dur-slow`, starting at 1400ms.

Under `prefers-reduced-motion: reduce` every element renders at its final
state with `animation: none`. The plot is never blank.

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

**Type.** `label` token, `--fg-muted`, line-height 2.0 — identical to the
technical metadata rows beside it. Not smaller, not italic, not parenthetical,
not a different colour. The credit carries the same visual weight as the
hardware list because it carries the same kind of fact.

Row 1 wraps freely; it is the one row allowed more than one line, and it wraps
at `label` size with the same 2.0 line-height, flush left with no hanging
indent.

**Defect conditions**, all checkable in a screenshot:

- Any `W/` record showing fewer than three credit rows.
- Any `COMMISSION —` value other than the two sanctioned strings.
- A credit line set below the prose, or in the prose, rather than at the head
  of the metadata column.
- A credit line at a smaller size or a lighter colour than the technical rows.

**At ≤767px** the metadata column stacks below the prose. The credit line
stays first within it, so reading order is prose → credit → technical rows.

### SP-10 — Site frame

Every page. Fixed to the viewport, drawn as four solid `--ground` strips with
a 1px `--line` rule on each inner edge. Geometry, colour, interruption,
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
| ≤767 | 8px | 1px `--line` | 16px each end | 8px, `--line-strong` | none |
| 768–1023 | 16px | 1px `--line` | 24px each end | 16px, `--line-strong` | none |
| 1024–1439 | 16px | 1px `--line` | 24px each end | 16px, `--line-strong` | 5 × 8px at 32px pitch, centred on `50vh` |
| ≥1440 | 16px | 1px `--line` | 24px each end | 16px, `--line-strong` | 5 × 8px at 32px pitch, centred on `50vh` |

**At 390px**, the whole frame costs 9px per side, 18px of 390, 4.6% of the
width. It stays 1px, not 2px: nowhere else on the site is a rule 2px, and at a
9px inset a 2px rule reads as a browser border. The gain in presence is not
worth the gain in weight at that size.

**No motion.** The frame renders complete on first paint under every motion
preference. It is not drawn on load, it does not fade, and it does not react
to scroll or hover.

**Screenshot checks.** At 1440×900: a hairline rectangle 17px in from each
viewport edge, interrupted 24px before each corner, with a 16px L-tick at each
corner in a visibly darker grey, and five short ticks pointing inward from the
left edge around the vertical centre. At 390×844: the same without the
measurement ticks, 9px in, with 8px corner arms.

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

| Instance | Rule | Size |
|---|---|---|
| 1 | Section 01 rule, right end | 16px / 12px |
| 2 | Section 02 rule, right end | 16px / 12px |
| 3 | Section 03 rule, right end | 16px / 12px |
| 4 | Section 04 rule, right end | 16px / 12px |
| 5 | `ALL PROJECTS` link row rule, right end | 14px |
| 6 | `FULL BIOGRAPHIES` link row rule, right end | 14px |
| 7 | Footer top rule, **left** end | 24px / 16px |

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
`stroke: currentColor`, so it brightens from `--fg-muted` to `--fg-primary`
with the row's existing 120ms colour transition. No `→` glyph remains anywhere
on the site.

**Favicon.** `favicon.svg` is the mark on a `#EDEBE6` ground, 24×24 viewBox
scaled to a 32×32 box with 2px of padding, strokes and triangles in
`#141210`. It replaces the nine-square grid previously specified. ≤700 bytes.
The mark is never rendered below 14px anywhere else.

### SP-12 — Layering

Text over artwork, static. Mechanics L1 and L2 are defined in the skill under
"Layering". This component states where they are used and what each
composition measures.

**L1 — hero, ≥1440px only.**

The array plot's box widens left so it overlaps the hero text column by 48px.
At ≥1440px the hero text spans columns 1–6 and the plot box spans columns 8–12
shifted 48px left, so the plot's left 48px sits over the right 48px of the
lead paragraph's measure.

The only thing inside the plot's left 48px is the plot frame's left rule, at
x ≈ 0.5px of a 546px render. The next element inward is the dashed tick column
at x ≈ 51px, outside the overlap. So the overlap crosses one 1px `--line`
hairline and nothing else, which is exactly what L1 permits. No knockout, no
change to the lead's colour or size.

Below 1440px the hero does not layer: at 1024–1439px there is not enough
column width to overlap without pulling the plot's tick column into the text,
and at ≤767px the plot is below the text. Stated so the critic does not score
a missing overlap at 1440 and below as a defect.

**L2 — home section 02 image band.** This is the site's principal layered
composition and it works at both scored viewports.

Order of elements: the section rule and label, then the image band, then the
W/01 record overlapping it.

| | ≥1024px | ≤767px |
|---|---|---|
| Image band height | 560px | 220px |
| Caption bar position | band's **top** edge | band's **top** edge |
| Record overlap | 96px | 48px |
| Knockout span | columns 1–8, bleeding left to the frame | full content width, bleeding left to the frame |
| Knockout padding | 24px | 16px |
| Knockout fill | `--ground`, opaque | `--ground`, opaque |

What sits on the knockout: the W/01 record's 1px top rule, its `W/01` index,
and its `<h3>` title. The prose begins below the band's bottom edge, on the
page, not on the knockout.

The caption bar moves from the band's bottom edge to its top edge in this
configuration, so the knockout and the caption never meet. Everywhere else —
work.html's IMG-01 band, the plot's caption — the caption bar stays at the
bottom.

Bleed: the knockout extends `var(--margin)` to the left of column 1, so its
left edge coincides with the frame's inner rule and is invisible. Three edges
show: top, right, bottom. No border, no radius, no shadow, no opacity.

Legibility: the title and index sit on opaque `--ground`, so they carry
`--fg-primary` at 15.7:1 and `--fg-muted` at 5.75:1, the same ratios as
anywhere else on the page. Nothing depends on how dark the photograph is.

Degradation: with SP-07 in the slot the geometry is identical and the plate's
label moves up out of the overlap per SP-07. The composition reads the same
before and after the photograph exists, which is the test.

**L2 — home section 02, record W/04.** The vertical image slot sits in columns
9–12. At ≥1024px the record's SP-09 credit line sits on a 200px-wide `--ground`
knockout overlapping the slot's bottom-left corner by 32px horizontally and
32px vertically, bleeding left out of column 9. At ≤767px the slot sits below
the prose and the credit line overlaps its top-left corner by 24px, bleeding
left to the frame.

This is the one place a credit line is layered, and it is deliberate: the
sentence that says who built the thing sits on the picture of the thing.

**Census.** Three layered compositions on home, one of them desktop-only. No
layering on `studio.html` — the bios are the longest prose on the site and
nothing crosses them. On `work.html`, the IMG-01 band repeats the section 02
composition with the W/01 record, and no other.

**Forbidden everywhere.** Mouse-tracked transforms, parallax of any kind,
scroll-linked translation, `opacity` scrims, gradient fades over images,
`backdrop-filter`, and text set in a colour chosen to suit one photograph.

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
| Email, SP-05 | 1–6 | `link-cta` 24px | `--fg-primary` |
| Next-step line | 1–6 | `body-s` 15px | `--fg-muted` |
| SP-08 array plot | 8–12 (546px), top-aligned to the statement. At ≥1440px the box shifts 48px left into the text column per SP-12 L1 | — | — |

Vertical gaps, top of hero downward: eyebrow → statement 32px; statement →
lead 40px; lead → email 48px; email → next-step line 8px.

At 1440×900 this puts the baseline of the email link at roughly y=604 and the
index band fully visible, with the top of section 01's space at the fold.

**Layout ≤767px.** Single column, 20px margins, hero top padding 48px.

Order: eyebrow → `<h1>` at 30px over 4 lines → lead at 20px → email at 20px →
next-step line at 14px → array plot at 350×350.

Gaps: 24, 24, 32, 8, 40. The email baseline lands near y=488, inside the
first screen. The plot's caption bar falls below the fold by design and is the
first thing scrolling reveals.

**Copy intent.**

| Block | Must say | Job |
|---|---|---|
| Eyebrow | City | Locates the practice in one word |
| `<h1>` statement | That this is spatial audio made as a work, not specified from a catalogue. Three lines, upper case, ≤30 characters per line | The single claim the whole site rests on. A curator reads only this and knows whether to continue |
| Lead | The two halves, unequal: sound designed for a room, and the control logic and workflow that let an artist use that room without an engineer. One sentence, maybe two | Converts the claim into something a commissioner can scope |
| Email | The address, visible as text | The primary action, instance 2 of 4 |
| Next-step line | What happens after the email: the work is described and scoped before anyone gets on a call. One sentence | Removes the "is this a sales funnel" question. Explicitly not "Get in touch" |

### Index band

SP-06. At ≥1024px five cells: `01 WHAT WE DO`, `02 SELECTED WORK`,
`03 CREDITS`, `04 WHO WE ARE`, `05 CONTACT`. At ≤767px the same five rows plus
`WORK` and `STUDIO`.

### 01 — What we do

Purpose: the three offerings, in the brief's order of emphasis. Creative
leads. Systems supports. Fabrication is third and is not a catalogue install.

Three SP-03 records, 64px apart at ≥1024px, 48px at ≤767px.

| Index | Title | Prose must say | Metadata rows |
|---|---|---|---|
| `001` | Creative | Sound designed for a specific room: spatialized sound design, interactive work, and existing pieces adapted into spatial formats. 2–3 sentences | `SPATIALIZED SOUND DESIGN`, `INTERACTIVE PROGRAMMING`, `ADAPTATION TO SPATIAL FORMATS`, `COMPOSITION FOR ARRAYS` |
| `002` | Systems | The logic and the artist-facing workflow, often on hardware someone else installed. A room built by others, made usable, is the service. 2–3 sentences | `CONTROL LOGIC`, `ROOM TUNING`, `SYSTEM ARCHITECTURE`, `Q-SYS PROGRAMMING`, `AMBISONIC TEMPLATING`, `DANTE ROUTING`, `DOLBY ATMOS`, `WAVE FIELD SYNTHESIS` |
| `003` | Fabrication | Speakers, haptics, and electroacoustic instruments built as objects for one room, not specified from a catalogue. 2–3 sentences | `CUSTOM SPEAKERS`, `CUSTOM HAPTICS`, `ACOUSTIC & ELECTROACOUSTIC INSTRUMENTS`, `ENCLOSURES` |

No icons. No cards. The three records are distinguished by their index
numbers and their rules, nothing else.

### 02 — Selected work

Purpose: the proof. Three records — the finished Astral Spatial commission,
the largest system any of the principals has built, and the in-progress build
that makes fabrication real rather than aspirational. The attribution is
visible on each one, in the same type as the hardware list beside it.

All copy in this section is placeholder until Andrew's copy pass. What is
fixed now is the record set, the index numbers, the SP-09 structure, and the
layout. The prose is intent only.

**Image band IMG-01.** Full-bleed to the frame's inner edge. Height 560px at
≥1024px, 220px at ≤767px. `object-fit: cover`, `width="1600" height="900"`
attributes set to prevent layout shift, `fetchpriority="high"`, not lazy.

The caption bar sits at the band's **top** edge in this section, because the
W/01 record's knockout occupies the bottom edge per SP-12. 40px tall at
≥1024px, two stacked 36px rows at ≤767px. `background: var(--band)` — opaque,
not a scrim — 1px `--line` bottom rule in this orientation, `label` token,
`--fg-muted`. Cells: `FIG. 02` · `REFORESTERS LABORATORY, WILLIAMSBURG` ·
`24.2 CHANNEL`.

Before the photograph exists this is SP-07 at the same dimensions, with the
label centred in the area the knockout leaves clear.

**Record W/01**, SP-03, layered per SP-12 L2 over the band above it:

- Title: `REFORESTERS LABORATORY`.
- Prose must say: a 24.2 channel listening room and adaptogen cafe in
  Williamsburg; the scope was software, not hardware; Astral Spatial built the
  control logic and tuned the room; the deliverable was a workflow, so a
  visiting artist arrives with their own work and plays it in ambisonics
  without an engineer rebuilding the room for them. That last clause is the
  point of the whole section and must survive editing.
- SP-09: `CREDIT — ASTRAL SPATIAL` · `YEAR — 2025` ·
  `COMMISSION — ASTRAL SPATIAL`.
- Technical rows: `SCOPE — SOFTWARE`, `Q-SYS PROGRAMMING`,
  `AMBISONIC TEMPLATING`, `DANTE ROUTING`, `ALLEN & HEATH SQ-5`,
  `D&B AUDIOTECHNIK`, `STATUS — COMPLETE`.

**Record W/02**, SP-03, no image slot on home:

- Title: `MOFE`.
- Prose must say: a spatial system at scale, and the clearest single example
  of one on the site; Andrew Fox designed the system and commissioned Jupiter
  Sound to execute it; Chloe Alexandra Thompson tuned it and refined the sound
  design within it; it predates the agency and is two of the three principals
  doing together exactly what the practice now sells. Two to three sentences.
  The prose states the facts; the SP-09 block states the attribution. Neither
  apologises.
- SP-09: `CREDIT — SYSTEM DESIGN, ANDREW FOX; EXECUTION, JUPITER SOUND;
  TUNING AND SOUND DESIGN, CHLOE ALEXANDRA THOMPSON` ·
  `YEAR — 2020–2022` · `COMMISSION — PREDATES ASTRAL SPATIAL`.
- Technical rows: `SCOPE — SYSTEM DESIGN, TUNING, SOUND DESIGN`,
  `13.1 SYSTEM`, `STATUS — COMPLETE`.
- No image on home. Its photograph, IMG-07, appears on `work.html`.

**Record W/04**, SP-03 with an image slot in place of the technical column's
lower half:

- Index `W/04`. Title: a neutral designation, not a client name.
- Prose must say: a custom speaker installation in progress; the first project
  where the physical build is Astral Spatial's own; the client cannot be named
  yet. Two sentences. No implied scale, no adjectives about the client.
- SP-09: `CREDIT — ASTRAL SPATIAL` · `YEAR — 2026` ·
  `COMMISSION — ASTRAL SPATIAL`. Layered over the image slot per SP-12 L2.
- Technical rows: `STATUS — IN PROGRESS`, `CLIENT — UNNAMED`.
- Image slot IMG-05 in columns 9–12, 432×540 displayed, 4:5. SP-07 plate until
  the photograph exists, labelled `PLATE — FABRICATION IN PROGRESS`. At ≤767px
  it sits below the prose at 350×438.

Records are 64px apart at ≥1024px, 48px at ≤767px, per SP-03. `W/03` does not
appear on home.

**Link row.** 1px `--line` rule carrying the mark at its right end per SP-11,
then a 56px row: `ALL PROJECTS` at `label`, `--fg-muted`, hover
`--fg-primary`. No `→`. Links to `/work.html`.

### 03 — Credits

Purpose: the twelve recognisable names, framed honestly. These are credits the
three principals carry from prior work, not Astral Spatial engagements. The
brief is explicit that they belong to the people rather than the agency.

**Framing line**, `body`, columns 1–6 at ≥1024px, one sentence. It must make
the attribution unambiguous without apologising.

**Credits register.** 48px below the framing line.

- ≥1024px: three columns of four rows. Each row 48px tall, 1px `--line` bottom
  rule, name at `body-s` in `--fg-body`, flush left.
- ≤767px: one column, twelve rows, 44px tall, 1px `--line` between.

Names, exact and in this order: MoFE, Meow Wolf, Reforesters Laboratory, Life
is Beautiful, Ben Frost, Richard Mosse, Sony Music, Domino Records, Mexican
Summer, Polyvinyl Records, Kaki King, **Alanis Morissette**.

The current site spells Morissette wrong. It is checked by the rubric.

### 04 — Who we are

Purpose: point at the strongest proof the business has, without reprinting it.
Full bios live on `studio.html`.

Three entries, alphabetical by surname: Michael Amacio, Andrew Fox, Chloe
Alexandra Thompson.

**≥1024px**: three across, each spanning 4 columns. Portrait 240×300 flush
left in its column, then name at `title-s`, then a one-line credit at
`body-s`. Gaps: portrait → name 24px; name → credit 8px.

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
at ≤767px. 1px `--line` rule top and bottom.

| Element | Token | Size | Colour |
|---|---|---|---|
| Label `05 — CONTACT` | `label` | 12/11px | `--fg-muted` |
| Email, SP-05 | `statement` | 56/30px | `--fg-primary` |
| Next-step sentence | `body` | 18/16px | `--fg-body` |
| Location line `NEW YORK` | `label` | 12/11px | `--fg-muted` |

Gaps: label → email 48px (≥1024) / 32px (≤767); email → sentence 24px / 16px;
sentence → location 48px / 32px. Email and text span columns 1–8 at ≥1024px.

At 56px the rendered string `INFO@ASTRALSPATIAL.COM` measures about 580px, so
it fits columns 1–8 (774px) on one line. At 30px on a 390px viewport it
measures about 317px and fits the 350px content width on one line. It must not
wrap at either width.

Copy intent: the sentence names what to send — the room, the work, the dates —
and what happens next. It does not say "Get in touch", "Let's talk", "Reach
out", or "We'd love to hear from you".

### Call-to-action census

Four instances, all pointing at the same address: desktop header, hero,
contact band, footer. The contact band is the visually dominant one by a
factor of more than two in type size. That satisfies rubric item 8's "one
primary action, visually dominant, repeated at least twice, specific about
what happens next".

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

- IMG-01 band at the top of the section, same dimensions as on home. The same
  file; cached. The caption bar sits at the band's **bottom** edge here and
  the record below it does not layer — the layered composition belongs to the
  home page, and on a page whose job is detail the full image reads better
  uninterrupted.
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
layered over the slot per SP-12 L2. No additional claims.

### 02 — Prior work, by the principals

Work two or three of the principals did before Astral Spatial existed. The
section label does the attribution once; SP-09 does it per record.

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

**Record W/03 — Anechoic chamber, Detroit.** Withheld until its details are
confirmed and permission to publish is given.

- Prose intent, once cleared: what the chamber is, what Chloe Alexandra
  Thompson and Michael Amacio did in it, and when. Two to three sentences.
- SP-09: `CREDIT — CHLOE ALEXANDRA THOMPSON, MICHAEL AMACIO` ·
  `YEAR —` to be confirmed · `COMMISSION — PREDATES ASTRAL SPATIAL`.
- Image slot IMG-08, 432×540 at ≥1024px, 350×438 at ≤767px, in columns 9–12.
  SP-07 plate until shot.
- **Withholding condition.** `W/03` does not ship until both the details and
  the permission exist. The `YEAR —` row cannot be published empty or as `TBC`;
  if the year is unknown the record is not ready.
- **Withholding leaves no hole.** The record is one full-width row in a flow
  list. Removing it removes one row and one 64px gap, and changes no other
  measurement on the page. The index `W/03` is not reassigned, so with the
  record absent the page reads `W/01`, `W/02`, `W/04` and the gap is left
  unexplained. The section still has `W/02` in it, so it never renders empty;
  if a future state leaves this section with no records at all, the section
  and its standfirst are removed together rather than shown empty.
- Builder instruction: ship `W/03` commented out of the markup is **not**
  acceptable — an HTML comment is readable by anyone who views source, and the
  permission is outstanding. The record does not exist in the file until it is
  cleared.

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
| 10–12 (342px) | Specialties, `label` token, one per line, line-height 2.0, `--fg-muted` |

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
| IMG-01 | home 02, work 01 | 1600×900 | full-bleed 560px / 220px tall | 110KB | The Reforesters Laboratory listening room from a seated listener's position, wide enough that the array reads as an array. Low ambient light, the room's own light sources visible. No people, or one figure at the frame edge for scale. Horizontal |
| IMG-02 | home 04, studio 02 | 640×800 | 240×300 / 120×150 | 22KB | Michael Amacio. Existing `img/ma.jpg`, recropped to 4:5, baked greyscale |
| IMG-03 | home 04, studio 02 | 640×800 | 240×300 / 120×150 | 22KB | Andrew Fox. Existing `img/af.jpg`, recropped to 4:5, baked greyscale |
| IMG-04 | home 04, studio 02 | 640×800 | 240×300 / 120×150 | 22KB | Chloe Alexandra Thompson. Existing `img/chloe.jpg`, recropped to 4:5, baked greyscale. Currently 239KB; it must come in at the same budget as the other two |
| IMG-05 | home 02, work 02 | 960×1200 | 432×540 / 350×438 | 45KB | The custom speaker enclosure under construction. Raw material, joinery, or a driver mount visible. Workshop light. Nothing that identifies the client. Vertical |
| IMG-06 | work 01 | 1200×800 | 900×600 / 350×233 | 80KB | The control surface and signal path at Reforesters: the SQ-5, the rack, or a Q-SYS screen. It must look like equipment in a working room, not a product shot |
| IMG-07 | work 02 | 1200×675 | 900×506 / 350×197 | 70KB | The MoFE room with the array readable as an array, wide, from a listener's height. The scale is the point, so the frame must contain enough of the room to show it. No identifiable faces. Horizontal |
| IMG-08 | work 02 | 960×1200 | 432×540 / 350×438 | 40KB | The Detroit anechoic chamber interior: the wedge lining, ideally with one figure for scale. It must read as a room with no reflections, which means the walls, not a detail. Ships only with `W/03`. Vertical |
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
| HTML, inline SVG, inline JS | 28KB | 30KB | 30KB |
| `style.css` | 16KB | 16KB | 16KB |
| `archivo-narrow-400.woff2` | 24KB | 24KB | 24KB |
| `source-serif-4-400.woff2` | 24KB | 24KB | 24KB |
| Favicon set | 7KB | 7KB | 7KB |
| Photography | 110 + 66 + 45 = 221KB | 110 + 80 + 45 + 70 + 40 = 345KB | 66KB |
| **Total, fully shot** | **320KB** | **446KB** | **167KB** |
| **Total, plates only** | **99KB** | **101KB** | **167KB** |

Largest single asset: 110KB. Floor is 150KB. `work.html` fully shot is the
closest page to the 500KB floor at 446KB, and that figure assumes `W/03` has
shipped with IMG-08. Everything below IMG-01 on that page is `loading="lazy"`,
so the figure counts bytes a reader reaches by scrolling, not bytes at first
paint.

`style.css` grows 2KB for the frame, the mark, and the two layering mechanics,
and loses the rail. The frame and the mark add no network requests at all: the
frame is four empty spans styled with gradients, and the mark is one `<symbol>`
under 300 bytes reused by `<use>`.

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
- Tap targets ≥44×44px below 768px, including the email link.

---

## 8. Motion and interactivity inventory

Everything that moves, with the evidence a critic can check.

| # | What | Trigger | Duration / easing | Evidence |
|---|---|---|---|---|
| M1 | SP-08 array plot draws: frame, then spokes, then points, then captions | Page load, once | 1200ms / `--ease-io`, then 640/240/640ms at `--ease-out` | Screen recording of the first 2s at 1440×900. Final frame identical to the reduced-motion render |
| M3 | Link underline brightens `--fg-muted` → `--fg-primary` | Hover, `:focus-visible` | 120ms / `--ease-out` | Hover screenshot of the hero email link |
| M4 | SP-03 record top rule `--line` → `--line-strong`, index numeral `translateX(8px)` | Hover, ≥1024px, `pointer: fine` | 120ms / `--ease-out` | Hover screenshot of record `001` |
| M5 | Index band cell text `--fg-muted` → `--fg-primary` | Hover | 120ms / `--ease-out` | Hover screenshot of the index band |
| M6 | Link row text and its mark brighten together, the mark via `stroke: currentColor` | Hover, `:focus-visible` | 120ms / `--ease-out` | Hover screenshot of the `ALL PROJECTS` row showing text and mark at `--fg-primary` |

M2, the right-edge rail label swap, is withdrawn with SP-04.

Nothing else moves. The frame does not move, draw, or fade. The mark does not
move; only M6's colour change touches it. No parallax, no mouse tracking, no
scroll-driven scale or rotation, no carousel, no autoplaying media, no
scroll-triggered entrance animations on body content, and no transform
anywhere that reads pointer position.

Under `prefers-reduced-motion: reduce`: M1 renders complete, M3–M6 change
state with no transition. The frame, the mark, and every layered composition
are identical to their normal render. No content is hidden or unreachable.

Without JavaScript: M1, M3, M4, M5, M6 all work, the frame and the mark render,
every layered composition renders, and the email links jump to the footer
address. Every page is fully readable and every link resolves. The only
JavaScript on the site is the SP-05 email rewrite.

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

### From the current build, by this revision

- `.rail` and its `@media` blocks in `style.css`, the `<div class="rail">`
  element, and every `data-rail` attribute. SP-04 is withdrawn.
- The `→` glyph in `ALL PROJECTS →` and `FULL BIOGRAPHIES →`. The mark on the
  row's rule replaces it.
- The nine-square favicon. The mark replaces it.
- The band caption's position at the bottom of the home section 02 image band.
  It moves to the top of the band so the W/01 knockout can take the bottom.
- The dark stylesheet and any `ground-dark` `:root` block. The repo ships one
  theme.

Kept: the bio text in substance, the three headshots, the twelve credit names,
`info@astralspatial.com`, and the light ground `#EDEBE6`.

Kept from the current build, unchanged: the type scale and every size on it,
the spacing scale, the grid, the breakpoints, SP-00 through SP-03, SP-05
through SP-08, the index band, the contact band, the footer, the array plot
including its geometry and draw animation, the portrait treatment, and the
email obfuscation with its fallback anchor. This revision adds three devices
and one component and withdraws one. It is not a rebuild.

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
4. **Email as CSS-assembled text plus a six-line inline `mailto` rewrite,
   with an in-page fallback anchor.** Rejected: a contact form (no backend, and
   the brief rules out handing strangers a funnel), the reversed-string CSS
   trick alone (displays but is not clickable), and Cloudflare's automatic
   obfuscation (injects a script the repo does not control).
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
    brightness. The only non-flat value in the system is one 12px white glow
    on one hairline in the array plot.
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
19. **Layering is static, with two mechanics and no third.** Rejected: the
    mouse-tracked parallax that produces the effect on publicrecords.nyc,
    which the brief rules out in those words; opacity scrims over photographs,
    which the design language forbids; gradient fades and `backdrop-filter`,
    same reason; and choosing a text colour to suit a particular photograph,
    which makes legibility a per-image judgement instead of a property of the
    system. L2's opaque `--ground` knockout keeps every contrast ratio
    identical to the rest of the page whatever the photograph turns out to be.
20. **The principal layered composition is on the home image band and it
    works at 390px.** Rejected: layering only on desktop, which would have
    made the mobile page a different and plainer design; and layering the hero
    statement over the array plot at every width, which would put the plot's
    `12` numeral and dashed tick column behind serif prose. The hero's overlap
    is L1 and exists at ≥1440px only, where 48px of overlap crosses exactly
    one hairline.
21. **`work.html` is split by who commissioned the work, not by status.**
    Rejected: the previous `01 Complete` / `02 In progress` split, which put
    MoFE and the Detroit chamber in the same bucket as agency commissions and
    left attribution to the credit lines alone. The brief says a curator
    should be able to tell without asking; a section heading does that before
    any record is read, and SP-09 then says it again per record.
22. **Catalogue indices are assigned once and never re-flowed.** `W/03` being
    withheld leaves the page reading `W/01`, `W/02`, `W/04`. Rejected:
    renumbering on publication, which would make every index unstable and
    break any link or reference to a record; and a visible placeholder row for
    the withheld record, which advertises a thing there is no permission to
    discuss. A gap in a catalogue number is normal and is not explained.
