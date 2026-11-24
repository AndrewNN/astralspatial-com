---
name: design-language
description: This site's design system — colors, type, spacing, breakpoints. Use when designing, building, or critiquing any page.
---

# Astral Spatial — design language

One ground, hairline rules, condensed grotesque in caps for structure, a
serif for everything a person actually reads. Catalogue numbering carries
hierarchy instead of boxes, cards, or shadows. Nothing is rounded, nothing is
shaded, nothing has a gradient.

Five devices carry the whole system and nothing else is added to them: the
**hairline**, the **frame** around the page, the **mark** — one small piece of
array geometry, repeated, never explained — the **action target**, which is the
one thing a visitor is meant to act on drawn in the same vocabulary, and the
**watermark**, the mark at page scale five times down the document, in outline,
below everything, lagging the scroll.

Two rules govern how they meet type. **A hairline passes over text; text is
never masked.** And **type sits on a flat palette colour, never on a
photograph.** Both are new as of 2026-11-24 and both reverse earlier
decisions. Where an older note in this file disagrees with either, they win.

The site ships `ground-light`, decided on 2026-11-23 after both grounds were
built and reviewed. `ground-dark` stays documented below because it is a
complete, matched set and a user-switchable dark mode is a possible later
addition. It is not what any page ships today. Where the two disagree on a
behaviour, `ground-light` is the live answer.

Every value below is a literal. If a rendered page shows a number that is not
on one of these scales, it is wrong.

## Palette

Two themes, `ground-dark` and `ground-light`. Both are complete sets of the
same ten tokens, with the same roles and the same assignments in the type
scale. A build ships exactly one of them: swap the `:root` block and no other
rule in the stylesheet changes. `ground-light` is the shipping theme.

There is no `prefers-color-scheme` branch, no theme class, no toggle, and no
JavaScript. A page is one theme from load to unload.

Common to both themes:

- There is no chromatic accent. Emphasis is contrast, never hue. A coloured
  button, a tinted panel, or a highlight colour is a defect.
- Opacity is not a colour. Do not express a lighter or darker grey as
  `color: var(--fg-primary); opacity: .5`. Use the token.
- `--line`, `--line-strong`, and `--line-detail` carry no information that is
  not also carried by position or text, so none of the three is held to a text
  contrast threshold. None of the three is ever set on type.
- A visible focus ring is 1px `--fg-primary` at 2px offset, in both themes.
  `--line-strong` is the hover state, not the focus ring.

### `ground-dark`

`color-scheme: dark` on `:root`.

| Token | Hex | Role |
|---|---|---|
| `--ground` | `#000000` | Page background. Every page, every section |
| `--band` | `#0C0C0C` | Alternating section band. Used only to separate two adjacent sections that would otherwise run together |
| `--fg-primary` | `#FFFFFF` | Headings, wordmark, links, the email address, numerals in index positions |
| `--fg-body` | `#D6D6D6` | Running serif body copy and lead paragraphs |
| `--fg-muted` | `#8A8A8A` | Labels, section numbers, captions, plate text, technical term lists, footer status bar |
| `--line` | `#B8B5B0` | Page rules at rest. The mirror of the light theme's `#3A3732` |
| `--line-strong` | `#FFFFFF` | The named heaviest rules, and the hairline hover state |
| `--line-detail` | `#8A8A8A` | Fine detail on and inside drawings. Strokes only, never type |
| `--watermark` | `#131313` | The watermark, and nothing else |
| `--glow` | `rgba(255,255,255,0.14)` | The only non-flat value in the theme. Used once per page at most, as a 40px blur behind a white hairline in the array plot |

Measured against `--ground` `#000000`:

| Token | Ratio | Smallest size used | AA threshold | Verdict |
|---|---|---|---|---|
| `--fg-primary` | 21.0:1 | 16px (`wordmark`, mobile) | 4.5:1 | pass, AAA |
| `--fg-body` | 14.1:1 | 16px (`body`, mobile) | 4.5:1 | pass, AAA |
| `--fg-muted` | 6.0:1 | 11px (`label`, `index`, mobile) | 4.5:1 | pass AA |
| `--band` | 1.07:1 | non-text | — | decoration |
| `--line` | 10.3:1 | non-text | — | structure |
| `--line-strong` | 21.0:1 | non-text | — | structure |
| `--line-detail` | 6.0:1 | non-text | — | detail |
| `--watermark` | 1.08:1 | non-text | — | watermark only |

The dark theme's three line values are the light theme's, mirrored. They have
never been built or reviewed; the light values are the settled ones.

### `ground-light`

`color-scheme: light` on `:root`.

| Token | Hex | Role |
|---|---|---|
| `--ground` | `#EDEBE6` | Page background. Every page, every section |
| `--band` | `#E5E2DC` | Alternating section band, and the mat inside an installation image plate |
| `--fg-primary` | `#141210` | Headings, wordmark, links, the email address, numerals in index positions |
| `--fg-body` | `#2B2825` | Running serif body copy and lead paragraphs |
| `--fg-muted` | `#5E5A53` | Labels, section numbers, captions, plate text, technical term lists, footer status bar |
| `--line` | `#3A3732` | Page rules at rest: section rules, record separators, row separators, band edges, the frame's four edge rules. The default colour of a rule that belongs to the layout |
| `--line-strong` | `#141210` | The heaviest rules: the header's bottom rule, the footer's top rule, the index band's and contact band's top and bottom rules, an image plate's frame, the credits register's axis. Also the record hover state |
| `--line-detail` | `#5E5A53` | Fine detail inside and on drawings: measurement ticks, dashed ticks, dimension lines, register connectors, the frame's corner ticks and measurement marks, the array plot's context spokes. **Strokes only, never type** |
| `--watermark` | `#E4E1DB` | The watermark, and nothing else |
| `--glow` | `transparent` | The theme carries no glow. The token exists so the two `:root` blocks are interchangeable. Nothing renders it |

Measured against `--ground` `#EDEBE6`:

| Token | Ratio | Smallest size used | AA threshold | Verdict |
|---|---|---|---|---|
| `--fg-primary` | 15.7:1 | 16px (`wordmark`, mobile) | 4.5:1 | pass, AAA |
| `--fg-body` | 12.3:1 | 11px (`label`, `index`, mobile) | 4.5:1 | pass, AAA |
| `--fg-muted` | 5.75:1 | 12px (`label`, desktop, subordinate ranks only) | 4.5:1 | pass AA |
| `--band` | 1.09:1 | non-text | — | decoration |
| `--line` | 9.9:1 | non-text | — | structure |
| `--line-strong` | 15.7:1 | non-text | — | structure |
| `--line-detail` | 5.75:1 | non-text | — | detail |
| `--watermark` | 1.08:1 | non-text | — | watermark only |

### The three line weights, settled

Decided 2026-11-24 after the phone review and built. **Structural rules are
near-black; detail is mid-grey.** The earlier pair, `--line` `#B0AAA0` at
1.94:1 and `--line-strong` `#8C857A` at 3.07:1, is withdrawn: on paper in
daylight a 1px rule at 1.94:1 is not a hairline, it is an absence, and the page
read as type floating with no structure under it.

| Token | Hex | Ratio | What it is |
|---|---|---|---|
| `--line` | `#3A3732` | 9.9:1 | Every page rule, unless the rule is one of the named heaviest ones |
| `--line-strong` | `#141210` | 15.7:1 | The named heaviest rules. Identical to `--fg-primary` by intent: the rule that bounds a region carries the same ink as a heading |
| `--line-detail` | `#5E5A53` | 5.75:1 | Everything that measures rather than bounds. Identical to `--fg-muted` by intent, and governed by the same floor logic — but as a stroke token it is exempt from W1, which is a rule about type |

These three values do not change. `--line-detail` is the new token, and it
exists for one reason: with `--line` at 9.9:1 there is no longer a light rule
in the system, and a drawing whose ticks and connectors are all at 9.9:1 is a
solid black diagram with no hierarchy in it. The detail rank was previously
carried by the old light `--line`; it now needs a token of its own.

`--line-detail` is never set on type. Type at that value is `--fg-muted`, and
W1 governs it. The two tokens share a hex and do not share a rule.

`--fg-muted` is darker than its dark-theme counterpart is light, on purpose.
A grey that reads as quiet on black is not the same grey that reads as quiet
on paper: `#8A8A8A` inverted to `#757575` would land at 3.9:1 here and fail
at 11px. `#5E5A53` holds the same subordinate rank at 5.75:1.

Hairlines are heavier here for the same reason, and heavier than the first
build shipped. A 1px rule on a light field needs far more tonal distance from
its ground than on a dark one. At 1px, 9.9:1 still reads as a hairline rather
than a border, because the weight is in the colour and the width never
changes.

Every neutral is drawn from the ground's own hue family, warm and nearly
desaturated. That is not an accent. A neutral ramp mixed cold against a warm
ground reads as dirt.

#### Why not `#FFFFFF`

`#EDEBE6` is a warm grey at roughly 92% lightness. Pure white is wrong for
three reasons, in order of weight.

1. It is the screen maximum, so there is nothing above it. The ground becomes
   the brightest thing on the page and the type recedes from it. An off-white
   ground leaves headroom, which is where the brightest zone of a photograph
   goes.
2. It reads as a default. White ground, black text, no frame is what an
   unstyled document looks like. A paper value reads as a chosen stock, which
   is the register the brief asks for.
3. On a pure white ground a hairline has to run toward `#B8B8B8` or darker to
   be seen, and the whole ramp goes chalky and cold. Starting at 92% gives
   `--line` and `--line-strong` room to separate from each other and from the
   ground without either going grey-blue.

### Weight floors

Added 2026-11-24, after a phone review against other-people.net in daylight.
The page read washed out. The cause was not one value; it was that the
subordinate rank had spread until most of the ink on the page was 11px
grotesque at 5.75:1. These four floors fix it, and all four are checkable with
an eyedropper on a screenshot crop.

**W1 — colour floor by size.** This is a rule about **type**. `--fg-muted` is
not permitted on type below 12px, and is not permitted on type at all below
768px.

| Band | `--fg-muted` allowed on type in | Everything else |
|---|---|---|
| ≤767px | nothing | `--fg-body` or `--fg-primary` |
| ≥768px | the subordinate ranks in W2 only, at 12px | `--fg-body` or `--fg-primary` |

W1 does not apply to strokes. A tick, a dimension line, a connector, or a
corner tick may be `--fg-muted` at any width, and several are required to be —
see W3 and the ink floor under "The drawn primitives".

**W2 — the subordinate rank, complete.** The only type that renders
`--fg-muted` anywhere on the site, and only at ≥768px:

`FIG.` caption cells · image-plate labels · the image plate's mat caption bar ·
the footer status cells · the hero eyebrow · in-drawing dimension numerals

Nothing else. In particular: section labels, index-band cells, record metadata
rows, credit lines, link-row text, `body-s` prose, the array plot's channel
numerals, person credits, and the register rows are **not** subordinate rank
and do not render `--fg-muted` at any width.

**W3 — rule ranks.** Every 1px rule on the site is one of three ranks. The rank
is positional, so it is decidable from a screenshot without reading the
stylesheet.

| Rank | Token | Where |
|---|---|---|
| R1 structural | `--line-strong` `#141210` | The header's bottom rule · the footer's top rule · the index band's top and bottom rules · the contact band's top and bottom rules · an image plate's frame · the credits register's axis rule |
| R2 page | `--line` `#3A3732` | Section rules · the frame's four edge rules · record top rules · link-row rules · row separators inside the index band, the footer, a register, or a metadata table · figure-caption top rules · the shared datum under the portraits · **every rule that crosses text** |
| R3 detail | `--line-detail` `#5E5A53` | Measurement ticks, dashed ticks, dimension lines, register connectors, the frame's corner ticks and left-edge measurement marks, the array plot's outer frame and its unemphasised spokes, the G-01 context rays |

A record separator set in `--line-strong` is a defect. A tick set in `--line`
is a defect. R3 is the only rank that may be set in `--line-detail`, and
`--line-detail` appears nowhere else.

R2 owns every rule that crosses text, which is why the frame's edge rules sit
at R2 rather than R1: at ≤767px the frame rule passes over prose, and L1
constraint 4 requires the crossing rule to be measurably lighter than the type
it crosses. `--line` at 9.9:1 against `--fg-body` at 12.3:1 holds that;
`--line-strong`, which is `--fg-primary` exactly, would not.

W3 governs **page rules** — rules that belong to the layout. Strokes **inside a
drawing** are governed by the ink floor instead, and may be `--line-detail`,
`--line`, `--fg-body`, or `--fg-primary` according to whether they carry
context or subject. A connector in a register, a tick on an axis, and a
dimension line are drawing strokes; they sit at R3. The frame's corner ticks
and measurement marks are drawing strokes on the page, which is why they are
R3 and not R1.

**W4 — the emphasis stroke, 2px.** A drawing may carry **one** 2px stroke, and
only on the stroke that carries the drawing's subject. No more than one per
drawing. It is `--fg-primary`, and inside an SVG it carries
`vector-effect="non-scaling-stroke"` so it renders exactly 2px at every plot
scale — a 2px stroke scaled by 0.625 is 1.25px, which anti-aliases to a pale
grey and is worse than the 1px it replaced.

| Drawing | Its one 2px stroke |
|---|---|
| Array plot | The signal line, centre to point `01` |
| `FIG. 05` source fan | The centre ray of the three emphasised rays |
| `FIG. 06` signal path | The horizontal spine |
| `FIG. 07` enclosure | The enclosure outline |
| The action target | The datum, which is one object interrupted twice |
| Credits register | None. Its emphasis is the terminal points |

2px is forbidden on: the frame, any section rule, any record rule, any rule
that crosses text, the mark, the watermark, and any rule outside a drawing.
A 3px stroke does not exist.

### Which theme the references support

| Reference | Supports |
|---|---|
| **other-people.net** | `ground-light`. The overall favourite. Warm light grey, not white, which is where `#EDEBE6` comes from |
| **blankforms.org** | `ground-light`. Light ground, serif, gallery register |
| **publicrecords.nyc** | `ground-dark`. Dark, full bleed, images passing under type |
| **ashley.systems** | `ground-dark`. Darkness, grain, and the only source of `--glow` in the system |

Two references each, so the references did not settle it. Both grounds were
built and reviewed on staging on 2026-11-23 and `ground-light` was chosen: it
reads better, it holds more space, and the dark build felt cramped. `#EDEBE6`
is the shipping ground.

## Type

Two self-hosted WOFF2 files, no third. No Google Fonts request, no font CDN,
no `@import`. Both files are subset to Latin basic plus the punctuation the
site actually uses, preloaded with `crossorigin`, and declared
`font-display: swap`.

```
--font-grotesque: "Archivo Narrow", "Helvetica Neue Condensed", "Arial Narrow", system-ui, sans-serif;
--font-serif: "Source Serif 4", Georgia, "Times New Roman", serif;
```

| File | Weight | Budget |
|---|---|---|
| `font/archivo-narrow-400.woff2` | 400 | ≤ 24KB |
| `font/source-serif-4-400.woff2` | 400 | ≤ 24KB |

No italic file. Where the references use italic, this system uses the
grotesque in caps with tracking, or parentheses.

No weight above 400 is ever requested. If a heading needs more presence it
gets a larger size, more tracking, or more space around it. Synthetic bold
(`font-weight: 700` with no bold file) is a defect — set `font-weight: 400`
explicitly on `h1`–`h6` and `strong`.

### Scale

Root font-size 16px. Sizes below are literal px; express them in `rem` in the
stylesheet (`18px` = `1.125rem`). Two columns of sizes, one per breakpoint
band. `md` (768–1023) uses the `≥1024` column unless noted in the spec.

| Token | ≥1024px | ≤767px | Line-height | Tracking | Case | Face | Colour |
|---|---|---|---|---|---|---|---|
| `wordmark` | 20px | 16px | 1.0 | 0.30em | upper | grotesque | `--fg-primary` |
| `statement` | 56px | 30px | 1.05 | 0.02em | upper | grotesque | `--fg-primary` |
| `title` | 32px | 24px | 1.12 | 0.06em | upper | grotesque | `--fg-primary` |
| `title-s` | 22px | 18px | 1.18 | 0.08em | upper | grotesque | `--fg-primary` |
| `lead` | 28px | 20px | 1.40 | 0 | sentence | serif | `--fg-body` |
| `body` | 18px | 16px | 1.62 | 0 | sentence | serif | `--fg-body` |
| `body-s` | 15px | 14px | 1.55 | 0 | sentence | serif | `--fg-body` |
| `label` | 12px | 11px | 1.0 | 0.22em / 0.16em | upper | grotesque | per W1/W2 |
| `index` | 12px | 11px | 1.0 | 0.10em | upper, tabular | grotesque | per W1/W2 |
| `link-cta` | 24px | 20px | 1.2 | 0.12em | lower | grotesque | `--fg-primary` |

Nothing else. Eleven sizes is the whole system. A twelfth value in the
stylesheet is a defect.

Tracking is positive only, and only on upper-case. Lower-case and sentence-case
text is always `letter-spacing: 0`.

`label` is the one token with two tracking values, for the same reason the
sizes have two columns. At 11px, 0.22em puts 2.4px of space between glyphs
about 6px wide, and the word disperses into a row of marks rather than reading
as a word. 0.16em at ≤767px holds the catalogue register and keeps the ink
together. `index` keeps 0.10em at both widths; it was never loose enough to
disperse.

Colour for `label` and `index` is set by the weight floors, not by the token:
`--fg-muted` only at ≥768px and only on the W2 subordinate ranks, `--fg-body`
or `--fg-primary` everywhere else. `body-s` is prose and is never the
subordinate rank, which is why it moved off `--fg-muted` entirely.

### Running text rules

- `body` and `lead` are the only tokens permitted for more than two
  consecutive lines of prose. All-caps running text is forbidden.
- Measure: `body` targets 60–80 characters at ≥1024px. Below 768px the measure
  is viewport-bound; the floor is 38 characters and 16px is the minimum size.
- No paragraph is justified. `text-wrap: pretty` on prose, `text-wrap: balance`
  on `statement` and `title`.
- No heading may end a section as the last visible element, and no heading may
  be left alone at the foot of the viewport with its content below. Keep
  heading and first paragraph together with `break-inside` and sufficient
  following margin from the spacing scale.
- Numerals in `index` and in any tabular position use
  `font-variant-numeric: tabular-nums`.

## Spacing

Base unit **8px**. Half-step 4px exists for optical corrections on hairlines
and underline offsets only.

| Token | px |
|---|---|
| `--s-h` | 4 |
| `--s-1` | 8 |
| `--s-2` | 16 |
| `--s-3` | 24 |
| `--s-4` | 32 |
| `--s-5` | 48 |
| `--s-6` | 64 |
| `--s-7` | 96 |
| `--s-8` | 128 |
| `--s-9` | 192 |

Every margin, padding, and gap in the stylesheet is one of these ten values.
A measured gap of 80px, 70px, or 20px anywhere except the mobile page margin
is a defect.

### Section rhythm

Each section opens with a full-bleed 1px `--line` rule across the content
width. The rule is the section boundary; it is not decoration and is never
omitted.

| Gap | ≥1024px | ≤767px |
|---|---|---|
| Previous section content → section rule | 128 (`--s-8`) | 64 (`--s-6`) |
| Section rule → section label | 24 (`--s-3`) | 16 (`--s-2`) |
| Section label → first content | 48 (`--s-5`) | 32 (`--s-4`) |
| Between sibling records inside a section | 64 (`--s-6`) | 48 (`--s-5`) |
| Heading → its own paragraph | 24 (`--s-3`) | 16 (`--s-2`) |
| Paragraph → paragraph | 16 (`--s-2`) | 16 (`--s-2`) |
| Last content → page footer rule | 192 (`--s-9`) | 96 (`--s-7`) |

### Grid

| Band | Page margin | Columns | Gutter |
|---|---|---|---|
| ≤767 | 20px | 1 | — |
| 768–1023 | 32px | 6 | 24px |
| 1024–1439 | 40px | 12 | 24px |
| ≥1440 | 48px | 12 | 24px |

Content width is capped at 1680px; above that the margins grow and the grid
stays fixed. At 1440px exactly: content 1344px, column 90px, gutter 24px.

20px is the mobile page margin and the single sanctioned exception to the
spacing scale.

**Page margins are measured from the frame, not from the viewport.** The frame
insets the whole document (see "The frame"), so at 390px the distance from the
viewport edge to the first character of body copy is 8px of frame inset plus
20px of page margin, 28px total. Full-bleed means bleeding to the frame's
inner edge. Nothing in the document touches the viewport edge.

### Layout variables

Six variables carry layout values that change per breakpoint. They are
indirections onto the scales above, not new scale values. Every value they
take already appears in the spacing scale.

| Variable | ≤767 | 768–1023 | 1024–1439 | ≥1440 |
|---|---|---|---|---|
| `--margin` | 20px | 32px | 40px | 48px |
| `--frame` | 8px | 16px | 16px | 16px |
| `--frame-gap` | 16px | 24px | 24px | 24px |
| `--obj-r` | 17 | 11 | 11 | 11 |
| `--obj-fs` | 16 | 10 | 10 | 10 |
| `--pt` | 6.4 | 4.1 | 4.1 | 4.1 |

The watermark has no layout variable. Its width and offsets are viewport
percentages stated literally in its own section below, because it is sized to
the viewport rather than to the grid and nothing else shares its values.

`--frame-gap` is the length of the interruption at each end of a frame edge's
hairline. A fourth value anywhere in the first three variables is a defect.

`--obj-r` and `--obj-fs` are the sound object's ring radius and numeral size
(see "Sound objects"). They are the only two variables in the system whose
values are **not** px and are not on the spacing scale: they are SVG user
units inside the array plot's `viewBox="0 0 560 560"`. They exist precisely so
the rendered result lands on one stated px value at every breakpoint — the
plot scales 1.56× between 350px and 546px, and an object that scaled with it
would be 13.7px across with a 6.3px numeral on a phone. Two values, like the
type scale. A third is a defect.

| | Plot render | Scale | Ring diameter | Numeral | Point |
|---|---|---|---|---|---|
| ≥768px | 546px | 0.975 | 21.5 CSS px | 9.8 CSS px | 4.0 CSS px |
| ≤767px | 350px | 0.625 | 21.3 CSS px | 10.0 CSS px | 4.0 CSS px |

**A sound object measures 21 ±1 CSS px across and its numeral is 10 ±0.5 CSS
px, at every viewport.** That is the checkable rule; the two variables are how
it is reached.

`--pt` does the same job for the point primitive inside the array plot, and
for the same reason: a 3-unit point in a `0 0 560 560` viewBox renders 2.9px at
desktop and **1.9px** on a phone, which is the single thinnest mark on the
site and is most of why the plot read washed out. **A point renders 4.0 ±0.3
CSS px square at every viewport.** Inside the plot the rects are positioned by
`transform="translate(cx cy)"` with `x` and `y` at `calc(var(--pt) * -0.5)`,
so changing the variable cannot shift a point off its coordinate. Outside the
plot — the G-01 diagrams, the credits register's terminal points, the action
target's centre point — a point is 4×4 CSS px stated directly.

### Icon sizes

Inline SVG marks render at 14px, 16px, or 24px square. Nothing else. Marks
are sized to sit on a rule without outweighing the type beside it. 14px is
the floor because below it the mark's three triangles collapse into its
lines.

### Stacking order

Six levels. Nothing else declares a `z-index`.

| Level | What |
|---|---|
| `-1` | The watermark, and nothing else. It is the only thing on the site below the artwork level, which is what makes it subordinate by construction rather than by opacity |
| `0` | Photographs, image plates, the array plot, every drawn diagram — the artwork a rule or a text block may cross |
| `1` | Text. Every heading, every paragraph, every label, in or out of a layered composition |
| `2` | Hairlines that cross text. Only rules reach this level, and only 1px ones |
| `40` | The site frame |
| `50` | The skip link |

Level 2 exists because of one decision: a hairline crossing a line of type
passes over it. Nothing but a 1px rule is ever at level 2 — no fill, no panel,
no image, no numeral.

A `z-index` of `3`, `99`, or `9999` in the stylesheet is a defect. No element
creates a stacking context by means of `opacity`, `filter`, or `transform` in
a way that lifts artwork above level 0. Inside an SVG, z-order is document
order and the same hierarchy applies: artwork, then type, then any rule that
crosses it.

## Breakpoints

```
sm   0–767      single column, 20px margin
md   768–1023   6-column grid, 32px margin
lg   1024–1439  12-column grid, 40px margin
xl   1440+      12-column grid, 48px margin, 1680px cap
```

Authoring is mobile-first: base rules are `sm`, then `@media (min-width: 768px)`,
`(min-width: 1024px)`, `(min-width: 1440px)`. No `max-width` media queries.

390×844 and 1440×900 are the two scored viewports. Both are first-class.
Tap targets are ≥44×44px below 768px, including inline email links, which get
`padding: 8px 0` and `display: inline-block` to reach it.

## Motion

```
--dur-fast:  120ms
--dur:       240ms
--dur-slow:  640ms
--dur-draw:  1200ms
--ease-out:  cubic-bezier(0.2, 0, 0, 1)
--ease-io:   cubic-bezier(0.65, 0, 0.35, 1)
```

### The motion budget

**One element on the site moves on its own: the sound objects in the hero
array plot.** It carries the entire autonomous motion budget. Everything else
that moves is a 120ms hover affordance or the plot's one-time draw-on.

That is the whole inventory. A second autonomously moving element anywhere is
a defect, whatever its duration.

**The watermark lags the scroll, and that is the one sanctioned parallax on the
site.** It is not autonomous motion: it moves only while the reader is
scrolling, by a fixed fraction of the distance they scrolled, and it stops the
instant they stop. Nothing about it is timed. Geometry and the lag factor are
in "The watermark" below. A watermark that scales, rotates, fades, or moves
with the pointer is still a defect.

The action target's hover and active offsets are 120ms affordances, in the same
class as a record index's 8px shift, and are not autonomous motion.

### Rules

1. Only `opacity`, `transform`, `stroke-dashoffset`, `border-color` / `color`,
   and the `transform` attribute of a sound-object group animate. Animating
   `width`, `height`, `top`, `left`, `margin`, or `padding` is a defect.
2. Hover and focus affordances: `--dur-fast`, `--ease-out`.
3. Entrances: `--dur-slow`, `--ease-out`, stagger 60ms, maximum 8 staggered
   children. An entrance plays once; nothing re-animates on scroll-back.
4. The array-plot draw is `--dur-draw`, `--ease-io`, once, on load.
5. Nothing on the page moves more than 16px, with two exceptions: a sound
   object travels its whole path, at a ceiling of **35 CSS px/s
   instantaneous, at every viewport**; and the watermark lags the scroll,
   which has no distance ceiling because the distance is the reader's own.
6. **No mouse-tracked transforms. No pointer-position input of any kind.**
   Layered compositions are static: the overlap is in the layout, never in a
   transform. Parallax exists exactly once, on the watermark, which is below
   every other element on the page and carries no information.
7. **Scroll drives exactly two scalars on the whole site**, and each changes
   exactly one property:
   - the vertical foreshortening of the sound objects' paths — a linear
     function of `scrollY`, clamped at both ends, centred so that its
     mid-value is the authored geometry
   - the watermark's `translateY` — `scrollY × 0.16`, unclamped, one
     assignment
   Nothing else responds to scroll. No `position: sticky`, no
   `scroll-behavior` override, no wheel or touch listener, no scroll-triggered
   entrance animation, no scroll-driven opacity, and no scroll-linked
   translation of anything a reader can read. Scroll interaction is on at every
   width, including 390px — it is not a desktop flourish.
8. A `scroll` listener is `{ passive: true }` and its entire body is one
   assignment. All work happens in the single `requestAnimationFrame` loop.
   `getBoundingClientRect` is never called inside that loop.
9. The frame and the mark never animate. They are at their final state on
   first paint. The only exception is the mark on a link row inheriting that
   row's 120ms `color` transition. The watermark never animates either: it has
   no `transition` and no `animation`, only the scroll assignment in rule 7.
10. No element is invisible without JavaScript. Entrance animations start at
    `opacity: 0` only inside a `@media (scripting: enabled)` guard or as a CSS
    `animation` that ends at the resting state — never as a class a script must
    add. Anything a script positions is authored in the markup at its resting
    position as a literal attribute.

### Sound objects

The one moving element. A small hairline ring carrying a number, travelling the
array field, after a Dolby Atmos renderer display. Five of them.

| Property | Value |
|---|---|
| Shape | `<circle>`, `fill: var(--ground)`, `stroke: var(--fg-primary)`, `stroke-width: 1` with `vector-effect="non-scaling-stroke"` |
| Size | `--obj-r`, `--obj-fs`; rendered 21 ±1 CSS px across with a 10 ±0.5 CSS px numeral at every viewport |
| Numeral | grotesque, `--fg-primary`, `tabular-nums`, `text-anchor: middle`, `dominant-baseline: central`, `letter-spacing: 0` |
| Path | a closed ellipse centred on the plot's listening position, `x = cx + a·cos θ`, `y = cy + b·k·sin θ`, θ linear in time |
| Count | 5 |
| Periods | 22–41s, five distinct values with no small common multiple |
| Speed | ≤ 35 CSS px/s instantaneous |
| Containment | `a + r` is always inside the plot's outer speaker ring. An object never leaves the plot and never sits on the listening position |

`vector-effect="non-scaling-stroke"` is permitted wherever a stroke's rendered
width is stated in CSS pixels and must hold at every scale: a sound object's
ring, a W4 emphasis stroke inside a scaling drawing, and the watermark. It is
**forbidden on the mark**, where the stroke must scale with the shape so the
proportion of line to triangle is constant. Those are the only cases; it is not
a general licence.

**Z-order inside the plot.** Objects draw after the rings, spokes, points, and
signal line, and before the channel numerals, the listening-position cross,
and its label. So an object's opaque `--ground` fill occludes hairlines it
passes over — artwork occluding artwork, which is correct for a renderer
object — and plot type always draws over an object. Nothing in this system
puts artwork on top of type, inside an SVG or outside one.

A filled `--fg-primary` disc is a defect: the system has no shaded shapes and
a solid blob is not a drawing.

### Reduced motion

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 1ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 1ms !important;
    scroll-behavior: auto !important;
  }
}
```

Under reduced motion every element renders in its final state. The array plot
is drawn complete. The five sound objects render at full opacity at their
authored rest positions and never move. **The watermark's lag is off and its
`transform` is never set**, so it scrolls with the document like any other
absolutely positioned element. Both scroll scalars are dead: the script
short-circuits on one `matchMedia` check before its loop starts. The result is
identical to the JavaScript-off render. No content depends on an animation to
become visible.

## Lines and surfaces

- Hairlines are exactly 1px, square ends. Three exceptions, all named: the
  array plot's measurement ticks are dashed `2 4`; the frame's four edge rules
  are interrupted at their ends by `--frame-gap`; and one stroke per drawing
  may be the 2px emphasis stroke of W4. Nothing is ever 3px.
- Corner ticks are `--line-detail`. A corner tick is a registration mark, so it
  measures rather than bounds, and it must read as a different kind of mark from
  the edge rule it terminates. At `--line` it would be the same ink as that
  rule and the interruption would read as a drafting error. This holds for the
  frame's corners and for an image plate's corners, which are the only two
  places a corner tick appears.
- `border-radius` is `0` everywhere. There are no pills, no rounded cards, no
  circular portraits. A hairline `<circle>` inside a drawing is not a rounded
  box: it is drawn geometry, and it is permitted.
- `box-shadow` is not used, in either theme. `ground-dark` has one blur,
  `--glow`. `ground-light` has none.
- **No overlay on any image.** The only things that may sit over a photograph
  are a 1px rule crossing it, and nothing else. No caption bar laid on the
  image, no knockout, no scrim, no gradient, no `backdrop-filter`. Captions and
  type that belong to a photograph sit in the plate's mat, which is beside the
  image rather than on it.

### The drawn primitives, complete

Every drawing on the site — the array plot, the mark, the frame's ticks, the
offering diagrams, the credits register, the sound objects — is assembled from
this list and nothing else:

| Primitive | Spec |
|---|---|
| Hairline | 1px, square ends, straight or elliptical |
| Emphasis stroke | 2px, square ends, `--fg-primary`, one per drawing, per W4 |
| Dashed hairline | 1px, `stroke-dasharray: 2 4` |
| Point | 4×4 CSS px square, `--fg-primary`. Inside the array plot via `--pt` |
| Triangle | filled, 3.9 long × 2.1 across its base, `currentColor` |
| Circle | 1px hairline. `--ground` fill where it must occlude what is behind it, `fill: none` where nothing is |
| Crosshair | Two 1px lines, one horizontal and one vertical, crossing at a point and extending past whatever encloses them. The array plot's `LP` mark, and the action target's |
| Flat fill | `--ground` or `--band` only |
| Numeral and label | `index` and `label` tokens, down to 9px inside a drawing, never `--fg-muted` below 12px |

**The ink floor inside a drawing.** A drawing may not be entirely
`--line-detail`. Every drawing on the site contains at least one element at
`--fg-primary` and at least one at `--fg-body` or `--line` or darker, and the
element that carries the drawing's subject is never the lightest thing in it.
`--line-detail` is for context: the rays that are not the ray, the box the
dimension measures, the ticks along an axis. A measured drawing rendered end to
end at 5.75:1 reads as a smudge on a phone, which is what the first build
shipped at 1.94:1 and would still do here.

No arrowheads other than the triangle. No curves other than straight lines and
ellipses. No hatching, no stipple, no shading, no gradient, no outline box
drawn around a label, no icon, no pictogram, no waveform, no spectrogram.

The triangle is a shared primitive, not the mark. The mark is the three-axis
assembly of three hairlines and three triangles from one origin. A triangle
used alone — as a dimension-line terminator in a measured drawing, for
instance — is not an instance of the mark, and the mark's placement rule does
not apply to it. One triangle is a terminator; three from one origin is the
signature.

### Where a rule changes colour

A rule's rest colour is its W3 rank — `--line-strong` for R1, `--line` for R2,
`--line-detail` for R3 — with exactly two colour exceptions, both about being
seen:

| Over | Colour | Why |
|---|---|---|
| `--ground` or `--band` | Its W3 rank | The default. At 1px, 9.9:1 reads as a hairline and 15.7:1 reads as a structural rule without reading as a border |
| A photograph or an image plate's interior | `--ground` `#EDEBE6` | `--line` has no guaranteed contrast against an unknown photographic tone. The photography treatment caps every image's white point at `#EDEBE6`, so a `--ground` hairline is at worst equal to the lightest pixel in the image and at best at 15.7:1 against its darkest |

A single rule may therefore render in two colours along its length — `--line`
across the page, `--ground` across the image. That is a drafting convention,
not an inconsistency. The change happens at the plate's outer hairline.

`--watermark` is not in this system. It is the watermark's colour and no rule,
tick, border, or stroke anywhere on the site uses it.

The asset constraint that makes the second row true is in "Photography" below.
A rule is never interrupted, faded, dashed, or thickened to make it visible
over something. It changes colour or it stays `--line`.

### The frame

Every page is framed. The frame is the first thing that says the page is a
drawn object rather than a document, and it is the only element fixed to the
viewport.

**Construction.** Four fixed strips, each filled solid `--ground`, inset `0`
from the viewport edges and `--frame` + 1px thick. Each strip carries a 1px
**`--line`** rule on its inner edge — R2, because at ≤767px that rule passes
over prose and R2 is the rank that is allowed to cross text. It was the single
worst offender when the page read washed out: a 1.94:1 hairline 9px from the
edge of a phone screen in daylight is not there. At 9.9:1 it is. It stays 1px;
the weight comes from the colour, not from the width. The strips are solid at
≥768px, so content scrolls behind them and
is cut cleanly at the rule rather than crossed by it. The frame is
`pointer-events: none` and `aria-hidden="true"`.

**The rule is interrupted.** Each edge's hairline stops `--frame-gap` short of
each corner — 24px at ≥768px, 16px at ≤767px. The corner itself carries a
tick: an L of two arms, 16px at ≥768px and 8px at ≤767px, 1px
`--line-detail`, drawn at the exact inner corner and running inward along both
edges. Arm plus gap equals the interruption, so the measurements close:
16 + 8 = 24 at ≥768px, 8 + 8 = 16 at ≤767px. The effect is a registration
mark, not a border, and the tick reads as a different kind of mark from the
rule it terminates, which is the point of the interruption.

**Measurement marks.** At ≥1024px only, the left edge carries five 8px ticks
pointing inward from its hairline, 1px `--line-detail`, at 32px pitch, the
middle tick centred on `50vh`. They are the array plot's tick column, moved to
the page. No numerals, no caption. The right, top, and bottom edges carry none.
Below 1024px there are no measurement marks.

**At 390px.** The frame is 1px of rule on 8px of inset, 9px per side, 18px of
390 — 4.6% of the width. It is never 2px: a 2px rule at that inset reads as a
border on a phone, and the system has no 2px hairline anywhere else. Body
copy begins 28px from the viewport edge.

**It does not animate.** The frame is at its final state on first paint, in
every motion preference. It is not drawn, it does not fade in, and it does not
change on scroll or hover.

**Known behaviour.** On iOS Safari the bottom strip tracks the visual viewport
and shifts as the toolbar collapses. Nothing is positioned relative to it and
no content depends on it.

**The strips are transparent below 768px.** `--frame-fill` is `transparent`
at mobile and `--ground` from 768px up. On a phone the frame is the rule, the
corner ticks and nothing else, so content scrolls visibly beneath the top and
bottom rules rather than disappearing behind an opaque band. A heading bisected
by the hairline mid-scroll is the intended effect, not a defect.

The mobile frame rule therefore crosses prose, which L1 forbids for every other
rule on the site. It is the one sanctioned exception, and it is safe for three
reasons: the rule is 1px; it is R2 `--line` at 9.9:1 against `--fg-body` at
12.3:1, so it is lighter than the type it crosses; and it is at a fixed
viewport position rather than a fixed position in the text, so no word is
permanently crossed. Nothing else is allowed to borrow this exception.

This reverses the earlier judgement that a border-only frame was a bad idea.
Andrew asked for it directly after reviewing on a phone, and it is the same
principle as rules passing over text rather than masking it.

### The mark

Three axes from one origin, each ending in a filled triangle: Y up, X right,
Z forward and down toward the viewer. The site's signature. It is never
captioned, labelled, named in alt text, or explained.

The Z axis is shorter than the other two. That foreshortening is what makes
the mark read as three dimensions rather than as a flat asterisk, and it is
not optional.

**Geometry.** `viewBox="0 0 24 24"`, origin at `(9, 15)`, `stroke-width: 1`,
`stroke: currentColor`, triangles `fill: currentColor`. No
`vector-effect`, no `shape-rendering` override — the stroke scales with the
mark so the proportion of line to triangle is constant at every size. The mark
is the one place `vector-effect` is forbidden outright; the cases where it is
required are listed under "Sound objects".

| Axis | Bearing | Length | Triangle tip |
|---|---|---|---|
| Y | 90° | 11.5 | `(9, 3.5)` |
| X | 0° | 12.5 | `(21.5, 15)` |
| Z | 222° | 7.6 | `(3.35, 20.09)` |

Each triangle is 3.9 long and 2.1 across its base. Each line stops 3.43 short
of its tip so the stroke does not print through the triangle.

```
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
```

Declared once per page as a `<symbol>` inside a zero-size inline `<svg>` at
the top of `<body>`, then placed with `<use href="#mk">`. No image request,
no second file, no icon font.

**Minimum size is 14px.** Below that the three triangles collapse into the
lines and the mark reads as a smudge. 12px is not a sanctioned size.

**Where it is allowed.** The mark only ever sits in a gap in a 1px rule, at
that rule's right end, vertically centred on the rule, with the gap 8px wider
than the mark on each side. Three placements, and no others:

| Placement | Size ≥768 | Size ≤767 | Colour |
|---|---|---|---|
| Section rule, right end | 16px | 14px | `--fg-primary` |
| Link row rule, right end | 14px | 14px | `currentColor`, so it brightens from `--fg-body` to `--fg-primary` with the row |
| Footer top rule, **left** end | 24px | 16px | `--fg-primary` |

The mark is the site's signature and it was set in the subordinate rank. At
14px, 5.75:1, three triangles and three hairlines, it was a grey speck on a
phone. At `--fg-primary` it is a drawn object, which is what it is.

The footer instance is the single mirrored one and marks the end of the
document.

**The rule that stops it spreading.** A mark that is not centred in a gap in a
1px rule is a defect. It never appears inside prose, inside an image plate,
inside a photograph, as a list bullet, as a heading ornament, in a row of more
than one, or anywhere a rule does not already exist. One per rule, maximum.

The watermark is not an instance of the mark and this rule does not reach it.
It is the same geometry at 50vw, in outline, at 1.08:1, at stacking level
`-1`. Nothing a reader can resolve as a mark is outside the placement rule;
nothing at that scale and that value is resolved as a mark.

**Off-page.** The favicon is the mark, and that is the only instance not
sitting on a rule.

### The action target

The primary call to action is a drawn object, not a line of underlined text.
An underline is a text decoration; this is a plotted target on a datum, and it
is assembled from the primitives above and from nothing else. No fill, no
radius, no shadow, no box, no background. It is not a button, and anything that
reads as a button is a defect.

**The object chosen, and what it is.** A **crosshair on a point, inside a
ring, sitting on a heavy datum that stops either side of the words.** It is the
array plot's listening-position mark — a 16px cross at the centre of the field,
which is the one place in the plot where something is *aimed at* — inscribed in
a ring and brought out to page scale. The datum is the plot's signal line at
page scale. So the thing a visitor acts on is drawn in the same two strokes as
the thing the practice sells: a point in a field, and a signal arriving at it.

Rejected, each for a reason: a **bracket** (reads as a UI chrome affordance and
has no point in it, so nothing is aimed at); a **framed field** alone (an
outline box, which the primitives forbid); an **aperture** of two rules with
nothing in the gap (what the previous revision had — the gap read as an
accident of spacing, not as an object); and the mark itself at CTA scale (the
mark may only sit in a gap in a 1px rule, and using the signature as a button
makes it mean two things).

**Construction**, left to right along one horizontal datum:

```
──────────────┤          ⊕   START A PROJECT          ├──────────────
```

| Part | Spec |
|---|---|
| Datum | One horizontal line through the whole object, interrupted twice. The object's single W4 emphasis stroke: **2px** `--fg-primary`, square ends |
| Entering rules | The datum's two surviving segments, one from each side |
| End-stops | A 1px `--fg-primary` vertical at the inner end of each entering rule, centred on the datum |
| Target | Inline SVG, `aria-hidden="true"`, `focusable="false"`. A 1px `--fg-primary` ring, `fill: none`; a 1px `--fg-primary` crosshair through its centre, both arms extending past the ring; a 4×4 `--fg-primary` point at the crossing. The datum passes behind it and is interrupted on both sides, so the target sits **on** the line, not beside it |
| Text | The link's visible words, `--fg-primary`, **no underline, no border-bottom**. The datum is the affordance |

The ring is `fill: none` because nothing passes behind it that needs occluding:
the datum stops short on both sides, and the watermark at 1.08:1 is not visible
through a 14px aperture. A `--ground`-filled ring in the contact band, which is
`--band`, would print as a pale disc.

**Two symbols, authored 1:1, no scaling.** The target renders at exactly two
sizes and each has its own `<symbol>`, declared once per page beside `#mk`.
Neither is ever scaled, so every stroke is 1px and every point is 4×4 CSS px
without `vector-effect` and without a new layout variable.

```
<symbol id="tg-32" viewBox="0 0 32 32">
  <g fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="butt">
    <circle cx="16" cy="16" r="9"/>
    <line x1="16" y1="2" x2="16" y2="30"/>
    <line x1="2" y1="16" x2="30" y2="16"/>
  </g>
  <rect x="14" y="14" width="4" height="4" fill="currentColor"/>
</symbol>

<symbol id="tg-24" viewBox="0 0 24 24">
  <g fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="butt">
    <circle cx="12" cy="12" r="7"/>
    <line x1="12" y1="2" x2="12" y2="22"/>
    <line x1="2" y1="12" x2="22" y2="12"/>
  </g>
  <rect x="10" y="10" width="4" height="4" fill="currentColor"/>
</symbol>
```

| | `#tg-32` | `#tg-24` |
|---|---|---|
| Rendered box | 32×32 CSS px | 24×24 CSS px |
| Ring diameter | 18px | 14px |
| Crosshair arm past the ring | 5px each side | 3px each side |
| Centre point | 4×4px | 4×4px |

**Checkable:** the band target measures 32px square overall with an 18px ring;
the hero target measures 24px square overall with a 14px ring; both carry a
4px point. A ring of any other diameter, or a point that is not 4px, is a
defect.

**Two instances, one object, two sizes.** The hero instance and the contact
band instance are the same component. Only the text token, the target symbol,
four gap values, and what the entering rules anchor to change. They are not two
treatments, for one reason: a reader who meets the object in the hero and skips
to the bottom of the page has to recognise the same object, or the page reads
as having two different primary actions. One grammar, stated twice, at two
volumes.

| | Hero | Contact band |
|---|---|---|
| Text token | `link-cta`, 24px / 20px, lower case | `statement`, 56px / 30px, upper case |
| Target | `#tg-24` | `#tg-32` |
| Entering rules anchored to | Left: a fixed 1-column stub. Right: the text column's right edge at column 6 of 12 | The frame's inner edges, left and right — full bleed |
| End-stop height, ≥768 / ≤767 | 16px / 12px | 24px / 16px |
| Left end-stop → target | 24px / 16px | 24px / — |
| Target → first glyph | 16px / 12px | 16px / — |
| Last glyph → right end-stop | 24px / 16px | 24px / — |
| Object height, ≥768 / ≤767 | 40px / 44px, which is also the tap-target floor | 56px / 88px stacked |

The datum is centred on the text's cap box in both instances, at both widths.

**The contact band instance at ≤767px stacks, and does not degrade.** 350px of
content cannot hold `START A PROJECT` at 30px plus a target plus four gaps plus
two rules. So at ≤767px the band instance is drawn in two parts:

1. The datum runs full bleed from the target's right edge to the frame's inner
   right edge, 2px, with a 24px gap between the target and the start of the
   rule. The target sits flush to the content's left edge. There is no left-hand
   entering rule and no left end-stop: the target *is* the left terminal.
2. `START A PROJECT` at `statement` 30px sits 24px below the datum, flush left
   to the target's left edge.

Object height 88px: 32px target, 24px gap, 32px cap height. One end-stop, at
the right. This is more graphic on a phone than the inline version, not less:
a heavy rule crosses the whole screen and is stopped by a target.

**Geometry at the two scored viewports.**

| | Hero, 1440px | Hero, 390px | Band, 1440px | Band, 390px |
|---|---|---|---|---|
| Content width | 660px (cols 1–6) | 350px | 1344px (full bleed) | 350px |
| Text measure | ≈150px | ≈124px | ≈400px | ≈215px |
| Target | 24px | 24px | 32px | 32px |
| Gaps | 24 + 16 + 24 | 16 + 12 + 16 | 24 + 16 + 24 | 24 |
| Left entering rule | 90px, fixed | 32px, fixed | remainder | none |
| Right entering rule | remainder, ≥ 24px | remainder, ≥ 24px | remainder | remainder |

If the right entering rule computes shorter than 24px at any width, the text
column is too narrow for the instance and the stacked construction is used
instead. That is the only degradation path, and it is a different layout rather
than a stripped one.

**States.** The accessible name is the visible text. Nothing is added to the
accessible tree — no `aria-label`, no `title`, no hidden span — and every drawn
part is `aria-hidden="true"`. The `<a>` is a real anchor with a real `href`, it
is in the tab order, and nothing about it needs script.

| State | What changes | Timing |
|---|---|---|
| Rest | As above | — |
| Hover, `pointer: fine` | The target and the text translate together, `transform: translateX(8px)`. The left gap closes from 24px to 16px and the right gap opens from 24px to 32px, so the object slides along its own datum. Nothing changes colour, because everything is already `--fg-primary` | `--dur-fast`, `--ease-out` |
| `:focus-visible` | 1px `--fg-primary` outline at 2px offset on the `<a>` itself, enclosing the target and the text. The hover offset is **not** applied, so focus and hover are never confused with each other | no transition |
| Active | `transform: translateX(4px)` — the object gives back half the hover offset, which reads as a press | `--dur-fast`, `--ease-out` |

Hover and active are `transform` only, on an element that is not in flow terms
moved: the gaps are padding on the `<a>`'s two drawn siblings and do not
reflow. Under `prefers-reduced-motion: reduce` every offset still applies, with
no transition, so all four states stay distinguishable without motion.

**It is two instances per page, maximum.** The header and footer contact links
stay `label`-size text links. A third drawn instance makes the object
wallpaper, and an object that appears three times is a pattern rather than the
thing to do.

**Forbidden on this object.** A background fill of any kind. A border on the
`<a>`. `border-radius`. An underline or `text-decoration`. A colour change on
hover. An arrow, a chevron, or a `→`. The word `button` in a class name. The
mark `#mk` anywhere inside it. The email address as rendered text, in the
visible words, in the accessible name, in a `title`, or in an SVG `<text>`.

### The watermark

**Built 2026-11-24, to Andrew's direct request: very thin, underneath the text,
parallax.** What follows describes what is on the page, not an alternative.

The mark, at page scale, five times down the length of the document, in outline
only, in the palette's quietest value, below everything. It is at stacking level
`-1`, below every photograph, plate, diagram, rule, and word on the site, which
is what makes it subordinate by construction rather than by opacity.

An earlier revision of this file specified a concentric-ring field fixed to the
viewport and argued that the mark at size would break the mark's placement
rule. That is withdrawn. The placement rule governs the mark **as a mark** — a
14–24px figure terminating a 1px rule. At 50vw, in outline, at 1.08:1, behind
the text, it is not read as a mark terminating anything; it is read as the
stock the page is printed on. The two do not compete, because no reader sees
both as the same object.

| Part | Spec |
|---|---|
| Figure | The mark's own geometry, `viewBox="0 0 24 24"`, `preserveAspectRatio="xMidYMid meet"` |
| Stroke | 1px `--watermark` `#E4E1DB`, `vector-effect="non-scaling-stroke"`, `stroke-linecap: butt`, `stroke-linejoin: miter` |
| Fill | None, on every element including the three triangles. The triangles are **outlined, not filled** — a filled triangle at 60px across would be the only solid shape on the site |
| Axis lines | Extended to the triangle tips rather than stopping 3.43 short of them, because an outlined triangle has no ink to print through: `(9,15)→(9,4.4)`, `(9,15)→(20.6,15)`, `(9,15)→(4.6,18.95)` |
| Instances | **Five.** `.wm-1` to `.wm-5` |
| Numerals, labels, ticks, dashes | None |

**Position and size.** Each instance is `position: absolute` in the document,
`aspect-ratio: 1 / 1`, `pointer-events: none`, `aria-hidden="true"`, and a
direct child of `<body>` so no ancestor creates a stacking context above it.

| | Width | Vertical position | Horizontal |
|---|---|---|---|
| ≤767 | 88vw, capped at 880px | `top` 6 / 26 / 46 / 66 / 86 % of the document | `right: -26vw`, `left: -30vw`, `right: -20vw`, `left: -28vw`, `right: -24vw` |
| ≥768 | 50vw | the same six percentages | `right: -12vw` on 1, 3, 5 · `left: -14vw` on 2, 4, 6 |

Three rules hold at both widths and are the whole layout logic:

1. **Six instances, anchored for the lag.** 5.0, 18.5, 31.9, 45.4, 58.8 and
   72.2 percent of document height. They are not evenly spread: the parallax
   lag carries each figure down as the reader scrolls, so an anchor is
   `0.84 ×` the scroll position where its figure should be centred. Verify by
   measuring coverage at every tenth of the page — one figure in view
   throughout, no gaps.
2. **Alternating sides.** Odd instances enter from the right, even from the
   left. No two consecutive instances are on the same side.
3. **Every instance bleeds off the edge it entered from.** The negative offset
   is always larger than nothing and always smaller than the width, so between
   a quarter and a third of each figure is off-screen. The reader never sees a
   complete one, which is what keeps it a watermark rather than an illustration.

**The lag.** `transform: translateY(scrollY × 0.16)`, applied to all five by one
assignment inside the array plot's existing `requestAnimationFrame` loop. The
elements are in the document, so they already travel with the page at −1.0 ×
`scrollY`; adding +0.16 leaves them travelling at −0.84, which is the lag.

| Property | Value |
|---|---|
| Factor | 0.16 |
| Clamped | No. The function is linear over the whole document |
| Script cost | One assignment in a loop that already exists. No second listener, no second loop, no `getBoundingClientRect` |
| Will-change | `transform`, on `.watermark` only |
| Reduced motion | The `transform` is never set. The figures scroll with the document |
| JavaScript off | The `transform` is never set. Identical to the reduced-motion render |

0.16 is low on purpose. At 844px of viewport the reader scrolls a screen and the
figure behind the text has drifted 135px against it — enough that the page has
depth, little enough that nobody can point at what moved. Above about 0.25 the
figures start to read as a moving background, and a moving background behind
prose is what this site is the opposite of.

**Why a flat colour and not opacity.** The design language forbids opacity
scrims and forbids anything that reduces text contrast. A watermark at
`opacity: 0.08` would composite against whatever is behind it, and the
composited value would depend on stacking. A flat colour at level `-1` cannot
touch type at all: the glyph paints over it at full strength.

**The contrast guarantee, checkable.** Three measurements on any screenshot:

1. A glyph crossed by a watermark stroke samples `#141210` or `#2B2825`
   unchanged. Type contrast is 15.7:1 and 12.3:1 as specified, everywhere.
2. A watermark stroke over the bare ground samples `#E4E1DB` ±1 per channel,
   1.08:1 — present as a figure 600px across, absent as an interruption in a
   16px letterform.
3. The watermark is invisible inside the contact band, inside an image plate's
   mat, and over any photograph, because all three are opaque fills at level 0
   or above. It appears over the bare ground and nowhere else.

**Cost.** Five inline `<svg>` blocks, ≤260 bytes each, ≤1.3KB total, zero
requests, one line of script.

**Defect conditions.** A sixth instance. Two consecutive instances on the same
side. An instance wholly inside the viewport. A filled triangle. A stroke in
any value but `--watermark`. A `z-index` other than `-1`. A `transition` or
`animation` on `.watermark`. A lag factor that is not 0.16.

### Layering

**Reversed 2026-11-24.** The opaque `--ground` knockout is withdrawn from the
system. It punched the page colour out behind any type that crossed artwork,
which is the opposite of the layering this site takes from publicrecords.nyc,
where things overlap and both remain visible. It is also what produced a 200px
hole in a page rule. The word does not return, and neither does the mechanic.

Two principles replace it.

**Rules pass over text. Text is never masked.** A hairline crossing a line of
type crosses it, and both stay visible.

**Type sits on a flat palette colour, never on a photograph.** `--ground` at
15.7:1 or `--band` at 14.6:1. A photograph has no guaranteed ratio, and with
the knockout gone there is no mechanic that gives it one.

Two mechanics, and no third.

#### L1 — hairline over text

A 1px rule passes over a line of type. The rule is at stacking level 2, the
type at level 1. Neither changes colour, size, or opacity. The rule is not
interrupted, not faded, and not re-coloured at the crossing.

Legibility is preserved by construction, not by judgement. Five constraints,
all measurable in a screenshot crop:

1. **The rule is 1px.** At the smallest size L1 permits — `title-s` 18px, cap
   height about 12.6px — it removes 8% of the glyph's vertical extent at one y
   value. The cut is thinner than every stem it crosses, so no stem is
   severed, only crossed.
2. **Only display type is crossed.** `statement`, `title`, and `title-s`.
   Never `lead`, `body`, `body-s`, `label`, or `index`. **Prose is never
   crossed anywhere on the site.** The effect lands on four or five words per
   page, never on a paragraph.
3. **The crossing height is bounded.** The rule's y falls in the middle third
   of the crossed line's cap height, no closer than 2px to the baseline or to
   the x-height line. On the baseline it reads as an underline; at the x-height
   it merges with the bars of `e`, `a`, and `t` and the word turns to mud.
4. **The crossing rule is R2, and R2 only.** `--line` `#3A3732` at 9.9:1 over
   `--fg-primary` `#141210` at 15.7:1. The rule is measurably lighter than the
   type it crosses, the crossed glyph keeps 94%+ of its ink, and the type's own
   contrast stays 15.7:1 everywhere. An R1 crossing is forbidden: at `#141210`
   the rule and the glyph are the same ink and the word is cut rather than
   crossed. An R3 crossing is forbidden too, for the opposite reason — at
   5.75:1 the rule disappears into the word and reads as a printing fault.
5. **At most two crossings per page**, never two on one text block. The device
   reads as deliberate at two and as an accident at six.

The same mechanic covers text overlapping a drawing whose content in the
overlap is hairlines only — the overlap may not exceed 25% of the text block's
area, and no numeral, caption, filled point, or `--fg-primary` stroke may fall
inside it.

One named exception to constraint 2: a single 1px **vertical** may cross `lead`
at the end of a line's measure, where the crossed glyphs are one character
wide and already read. A horizontal rule across `lead` stays forbidden.

#### L2 — mat seating

Type that belongs to a photograph sits inside the image plate, on the plate's
own `--band` mat, which is drawn beneath both. The bottom mat is widened to
hold it: 96px at ≥1024px, 48px at ≤767px, against 24px / 16px on the other
three sides. An asymmetric window mount, which is how a print is mounted.

`--fg-primary` on `--band` is 14.6:1, `--fg-body` is 11.4:1, and `--fg-muted`
is 5.5:1 — all three clear AA at every size on the scale — whatever the
photograph turns out to be, because the type is not over the photograph. W1
still applies inside a mat: the caption bar is `--fg-muted` at ≥768px and
`--fg-body` at ≤767px.

A caption bar laid on an image is a defect. A caption sits in the mat.

Both mechanics put artwork at level 0, text at level 1, and crossing rules at
level 2. Nothing below the text is clipped, masked, or blurred, and nothing
above it is anything but a 1px rule.

**Degradation.** A layered composition over an image slot with no photograph
yet keeps its exact geometry: the mat, the hairline, the caption, and the
crossing rule are identical, and only the plate's interior fill changes when
the photograph arrives. The plate's own centred label is centred in the area
above the bottom mat so it never collides with the mat's type. A layout that
only reads once photography arrives is wrong.

**Forbidden.** Opaque knockouts behind type. Type over a photograph. Mouse
tracking. Scroll-linked translation of anything at stacking level 0 or above.
Opacity scrims. Gradient fades over images. `backdrop-filter`. Text set in a
colour chosen to suit one photograph. Interrupting a rule so type can pass
through the gap — with one exception, the action target, where the gap holds
the link and nothing is crossed.

The watermark is the one scroll-linked translation on the site and it is not an
exception to the rest of this. It sits **under** the artwork level in a flat
colour, so it is not a scrim, not an overlay, and not over type. Nothing is
composited and no text contrast is reduced.

### The array plot

`ground-dark` draws the emphasised ray in `--fg-primary` with a 40px `--glow`
blur behind it, once per page.

`ground-light` draws no glow. A dark blur behind a hairline on paper is a
smudge, and a light blur is invisible. The emphasis is carried two other ways
instead, both measurable in a screenshot:

1. The emphasised ray is the plot's one W4 emphasis stroke: **2px**
   `--fg-primary` with `vector-effect="non-scaling-stroke"`, at 15.7:1, while
   every neighbouring ray is 1px `--line-detail` at 5.75:1. That is a wider
   separation than the dark theme's glow produces between its own ray and its
   neighbours.
2. The measurement ticks along the emphasised ray double in density: 16px
   spacing against 32px on the rest of the plot. Tick length, 8px, is
   unchanged.

The rest of the plot's ink, under the weight floors: the outer frame and the
unemphasised spokes are 1px `--line-detail` (R3 context); the measurement ticks
are `--line-detail`; the 24 points render 4.0 CSS
px via `--pt` in `--fg-primary`; the channel numerals and the `LP` label are
`--fg-body`, not `--fg-muted`, because they are 10px and W1 puts nothing
muted below 12px; and the `LP` cross is `--fg-primary`.

The draw animation, `--dur-draw` with `--ease-io`, once on load, is identical
in both themes.

The plot is also the field the five sound objects travel through — see "Sound
objects" under Motion. They are the only moving thing on the site and they
exist nowhere but inside this plot. An object floating free on the page,
outside the plot, is a defect: the plot is the field, and an object without a
field is decoration.

## Photography

Portraits, both themes: 4:5 rectangles, baked greyscale, flush left to their
column, no frame, no mat.

### `ground-dark`

Portraits are baked greyscale across the full range, black point to white
point. Installation photography is full-bleed or plate-framed per the spec,
with a 1px `--line` frame on plates. Dim-room photography sits naturally: the
dark end of the image meets a dark ground and the frame reads against the
image.

### `ground-light`

Two changes, because a dim-room photograph on paper is a dark rectangle and
untreated it reads as a hole.

**Treatment.** Greyscale, but the tonal range is mapped into the palette
rather than to the device: the image's blackest pixel is `#141210`
(`--fg-primary`) and its whitest is `#EDEBE6` (`--ground`). Nothing in a
photograph is darker than the type or lighter than the page. This is baked
into the asset, not a CSS filter, and it is checkable with an eyedropper on
any screenshot: sample the four corners and the darkest visible area, and
nothing should fall outside that pair.

**The portrait contrast floor.** The mapping is baked into the asset. A CSS
`filter: grayscale(1)` on a colour JPEG is not the treatment: it desaturates
and leaves the tonal range wherever the camera put it, which on three
differently lit headshots produces three mid-grey rectangles with no black in
them, and that is most of why the people section read washed out. The
requirement, checkable with an eyedropper on the delivered file: **the
portrait's darkest 2% of pixels sample `#141210` to `#2B2825`, and its
lightest 2% sample `#E5E2DC` to `#EDEBE6`.** No `filter` property appears on a
portrait in the stylesheet.

**Matting.** Installation photographs sit inside an image plate: a mat of
`--band` at `--s-3` (24px) on all four sides at ≥768px, `--s-2` (16px) at
≤767px, with the photograph flush inside it. The mat separates the dark image
from the page the way a window mount separates a print from a wall. Portraits
get no mat; their mapped white point already dissolves the top edge of the
rectangle into the ground.

Where type belongs to the photograph, the **bottom mat widens** to hold it —
96px at ≥1024px, 48px at ≤767px — and the other three sides stay at 24px /
16px. That is the only sanctioned way type and a photograph occupy the same
plate, per L2 under "Layering". A caption bar laid on the image is a defect.

**The crossing constraint.** A 1px rule may cross a photograph, rendering
`--ground` across it (see "Where a rule changes colour"). For the rule to be
visible, the photograph must earn it: **in the 24px band centred on the rule,
the image contains no pixel lighter than `#C9C4BB`.** That is a shooting and
retouching requirement recorded against the image slot in the spec, checkable
with an eyedropper on the delivered asset, and easily met by the dim
installation rooms this site photographs. Where it cannot be met, the rule
does not cross that image.

**The plate hairline.** It moves outward and darkens. On dark the 1px frame is
`--line` directly against the photograph. On light it is 1px `--line-strong`
on the outer edge of the mat, against `--ground`, never against the
photograph. A plate frame is R1 `--line-strong` at 15.7:1, which against the
ground reads as a frame and is the one rule on the page allowed to be as black
as a heading, because it bounds a region rather than separating two.

**Full-bleed image bands** carry no frame and no mat in either theme. The
viewport edge does the framing. The light theme's tonal mapping still applies.

## Voice

Written for a curator who has read a hundred vendor sites and believed none of
them.

- Say the specific thing. "24.2 channel listening room in Williamsburg" beats
  "immersive audio experience". Named rooms, named formats, named hardware,
  named people.
- Lead with the work, not the company. No sentence opens with "Astral Spatial
  is a New York City based team specializing in".
- No superlatives, no "cutting-edge", "seamless", "world-class", "passionate",
  "solutions", "we pride ourselves". No exclamation marks. No em dashes in
  body copy.
- Short declaratives. Where a sentence runs past 28 words, split it.
- The credit line is typographic furniture, not a disclaimer. It sits in the
  same register as the technical metadata beside it, at the same size and
  colour, never smaller, never after the prose as a footnote. Its wording is
  the team's.
- The technical register is allowed to be opaque. Q-SYS, ambisonic templating,
  wave field synthesis, Dante are kept, unexplained, as evidence rather than
  education. Mystery is permitted. Vagueness is not.
- Labels are nouns in caps: `SELECTED WORK`, `CREDITS`, `CONTACT`. Not verbs,
  not questions, not "Our Services".
- **The call to action is a verb and the address is never rendered as text.**
  The display element is `Start a project`, set as the action target. It does
  not say "Get in touch", "Let's talk", "Reach out", or "We'd love to hear from
  you". The accessible name of a contact link is its visible text and nothing
  more — no `aria-label` spelling an address out. What happens next is named
  once on the page, in one serif sentence in the contact band, not twice.
- **A paragraph is the last resort, not the default.** Before writing one, ask
  whether the content is a list of facts (a register), a comparison of
  quantities (a plot), a sequence (a signal path), a set of dimensions (a
  measured elevation), or a relation between names and categories (an axis). If
  it is any of those, draw it. A paragraph that restates a drawing beside it is
  deleted, not shortened. Deleting is preferred to illustrating.
- Prose is budgeted per page **and per section**, and the budget is a count,
  not a feeling. The hard caps: **one prose block per section, maximum, and no
  section carries more than 55 words of prose.** At least two numbered sections
  on a page carry none at all. The per-page totals and the per-section
  allowances live in the spec.
- Three questions kill a paragraph, in this order. Is the fact already in the
  drawing beside it? Delete the paragraph. Is the fact a list, a sequence, a
  quantity, or a relation? Draw it and delete the paragraph. Is the fact true,
  publishable, and carried nowhere else on the page? Then it is one of the
  page's five, and it gets one sentence.
- **Deleting beats illustrating, and illustrating beats shortening.** A
  paragraph trimmed from four sentences to two is still a paragraph; the
  brochure problem is the count of text blocks, not their length.
- A `label`-size line is a text block. Converting a paragraph into a caption
  spends the budget rather than saving it.
- British or American spelling: American.

### Placeholder copy

Copy that is not final reads as placeholder. A plausible stand-in gets
reviewed as a draft, and a wrong fact that reads well survives into
production.

1. The block opens with a clause naming what the block is, then `goes here`,
   then Latin filler for the remainder of its intended length:
   `Project description goes here lorem ipsum dolor sit amet consectetur
   adipiscing elit sed do eiusmod tempor.`
2. Filler contains no proper noun, number, year, format, channel count,
   hardware name, date, or place. Nothing in it can be mistaken for a fact or
   quoted back.
3. Filler sets at its block's real token, size, colour, and measure, so the
   layout stays testable. It is filler in wording only.
4. The element carries `data-placeholder`. The count is one grep.
5. A metadata row whose value is unknown is **omitted**, never filled. There is
   no `label`-size filler anywhere: a technical row reading `Lorem ipsum
   routing` is the exact failure this rule exists to prevent.
6. Filler is never written in this voice. If filler can be scored for copy
   clarity, it is not obvious enough.

### What cannot be written

Some of the principals' prior work is under NDA. It is absent from the site,
and it is not described generically either: a description specific enough to be
useful is specific enough to identify. No title, no city, no room type, no
date, no client, no indication of who worked on it. Nothing on the site says
that anything is missing.

### Line breaking

Every block is checked at 390px and 1440px against four conditions:

- no line shorter than three words except the last
- no single word alone on the last line of a `title` or `statement`
- no horizontal overflow — `document.scrollWidth` equals `clientWidth`
- no glyph within 4px of the frame's inner rule

`text-wrap: pretty` on prose and `text-wrap: balance` on `statement` and
`title` are required, not optional.

### Proper nouns, exact

Michael Amacio · Chloe Alexandra Thompson · Andrew Fox · Cam Finley ·
Alanis Morissette · Reforesters Laboratory · Jupiter Sound · Q-SYS · MaxMSP · Dante ·
Allen & Heath SQ-5 · d&b audiotechnik · Dolby Atmos · Meow Wolf · MoFE ·
Richard Mosse · Philip Glass Ensemble · *32 Sounds* · Mexican Summer ·
Polyvinyl · Domino Records · Sony Music · Life is Beautiful · Ben Frost ·
Kaki King
