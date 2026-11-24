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
**watermark**, one very large quiet figure the page scrolls over.

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
same nine tokens, with the same roles and the same assignments in the type
scale. A build ships exactly one of them: swap the `:root` block and no other
rule in the stylesheet changes. `ground-light` is the shipping theme.

There is no `prefers-color-scheme` branch, no theme class, no toggle, and no
JavaScript. A page is one theme from load to unload.

Common to both themes:

- There is no chromatic accent. Emphasis is contrast, never hue. A coloured
  button, a tinted panel, or a highlight colour is a defect.
- Opacity is not a colour. Do not express a lighter or darker grey as
  `color: var(--fg-primary); opacity: .5`. Use the token.
- `--line` and `--line-strong` carry no information that is not also carried
  by position or text, so neither is held to a text contrast threshold.
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
| `--line` | `#2E2E2E` | All hairlines at rest: section rules, record separators, image plate borders, grid ticks |
| `--line-strong` | `#4A4A4A` | Structural hairlines, and the hairline hover state |
| `--wash` | `#131313` | The watermark, and nothing else |
| `--glow` | `rgba(255,255,255,0.14)` | The only non-flat value in the theme. Used once per page at most, as a 40px blur behind a white hairline in the array plot |

Measured against `--ground` `#000000`:

| Token | Ratio | Smallest size used | AA threshold | Verdict |
|---|---|---|---|---|
| `--fg-primary` | 21.0:1 | 16px (`wordmark`, mobile) | 4.5:1 | pass, AAA |
| `--fg-body` | 14.1:1 | 16px (`body`, mobile) | 4.5:1 | pass, AAA |
| `--fg-muted` | 6.0:1 | 11px (`label`, `index`, mobile) | 4.5:1 | pass AA |
| `--band` | 1.07:1 | non-text | — | decoration |
| `--line` | 1.55:1 | non-text | — | decoration |
| `--line-strong` | 2.37:1 | non-text | — | decoration |
| `--wash` | 1.08:1 | non-text | — | watermark only |

### `ground-light`

`color-scheme: light` on `:root`.

| Token | Hex | Role |
|---|---|---|
| `--ground` | `#EDEBE6` | Page background. Every page, every section |
| `--band` | `#E5E2DC` | Alternating section band, and the mat inside an installation image plate |
| `--fg-primary` | `#141210` | Headings, wordmark, links, the email address, numerals in index positions |
| `--fg-body` | `#2B2825` | Running serif body copy and lead paragraphs |
| `--fg-muted` | `#5E5A53` | Labels, section numbers, captions, plate text, technical term lists, footer status bar |
| `--line` | `#B0AAA0` | Context hairlines: record separators, row separators, grid ticks, dimension lines, the array plot's outer frame and context spokes |
| `--line-strong` | `#8C857A` | Structural hairlines: section rules, band edges, the frame's four edge rules, image-plate frames. Also the record hover state |
| `--wash` | `#E3E0DA` | The watermark, and nothing else. One rank quieter than `--line`, because the watermark is a field and `--line` is a rule |
| `--glow` | `transparent` | The theme carries no glow. The token exists so the two `:root` blocks are interchangeable. Nothing renders it |

Measured against `--ground` `#EDEBE6`:

| Token | Ratio | Smallest size used | AA threshold | Verdict |
|---|---|---|---|---|
| `--fg-primary` | 15.7:1 | 16px (`wordmark`, mobile) | 4.5:1 | pass, AAA |
| `--fg-body` | 12.3:1 | 11px (`label`, `index`, mobile) | 4.5:1 | pass, AAA |
| `--fg-muted` | 5.75:1 | 12px (`label`, desktop, subordinate ranks only) | 4.5:1 | pass AA |
| `--band` | 1.09:1 | non-text | — | decoration |
| `--line` | 1.94:1 | non-text | — | decoration |
| `--line-strong` | 3.07:1 | non-text | — | decoration |
| `--wash` | 1.08:1 | non-text | — | watermark only |

`--fg-muted` is darker than its dark-theme counterpart is light, on purpose.
A grey that reads as quiet on black is not the same grey that reads as quiet
on paper: `#8A8A8A` inverted to `#757575` would land at 3.9:1 here and fail
at 11px. `#5E5A53` holds the same subordinate rank at 5.75:1.

Hairlines are heavier here for the same reason. A 1px rule on a light field
needs more tonal distance from its ground than on a dark one, so `--line`
sits at 1.94:1 rather than 1.55:1 and still reads as a hairline, not a
border. `--line-strong` at 3.07:1 is the only token that changes role
between themes: on light it also frames installation image plates, because a
`--line` frame abutting a dark photograph disappears into it.

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
| R1 structural | `--line-strong` | Section rules · the header's bottom rule · the index band's top and bottom rules · the contact band's top and bottom rules · the footer's top rule · the frame's four edge rules · an image plate's frame · the credits register's axis rule |
| R2 record | `--line` | Record top rules · link-row rules · row separators inside the index band, the footer, a register, or a metadata table · figure-caption top rules · the shared datum under the portraits |
| R3 drawn context | `--line` | Measurement ticks, dashed ticks, dimension lines, the array plot's outer frame and its unemphasised spokes, the G-01 context rays |

A section rule set in `--line` is a defect. A record separator set in
`--line-strong` is a defect.

W3 governs **page rules** — rules that belong to the layout. Strokes **inside a
drawing** are governed by the ink floor instead, and may be `--line`,
`--fg-muted`, `--fg-body`, or `--fg-primary` according to whether they carry
context or subject. A connector in a register, a tick on an axis, and a
dimension line are drawing strokes, not page rules. The frame's corner ticks
and measurement marks are drawing strokes on the page, which is why they are
`--fg-muted` and not an R-rank.

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
| The action target | The two rules entering from the edges, which are one object |
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

Three variables carry layout values that change per breakpoint. They are
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
| `--wm-r` | 115vw | 95vw | 62vw | 62vw |

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

`--wm-r` is the watermark's outer radius (see "The watermark"). It is a
viewport-relative length rather than a spacing-scale value because the
watermark is sized to the viewport, not to the grid.

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

The watermark does not move and is not part of this budget. It is
`position: fixed` with no transform and no scroll input, so the page moves past
it. A watermark that translates, scales, rotates, or fades on scroll is a
defect, and so is one that moves with the pointer.

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
5. Nothing on the page moves more than 16px, with one exception: a sound
   object travels its whole path. Its speed ceiling is **35 CSS px/s
   instantaneous, at every viewport**.
6. **No parallax. No mouse-tracked transforms. No pointer-position input of
   any kind.** Layered compositions are static: the overlap is in the layout,
   never in a transform.
7. **Scroll drives exactly one scalar on the whole site**, and that scalar
   changes exactly one property: the vertical foreshortening of the sound
   objects' paths. It is a linear function of `scrollY`, clamped at both ends,
   centred so that its mid-value is the authored geometry. No `position:
   sticky`, no `scroll-behavior` override, no wheel or touch listener, no
   scroll-triggered entrance animation, no scroll-driven opacity, and nothing
   outside the plot's `<svg>` responds to scroll. Scroll interaction is on at
   every width, including 390px — it is not a desktop flourish.
8. A `scroll` listener is `{ passive: true }` and its entire body is one
   assignment. All work happens in the single `requestAnimationFrame` loop.
   `getBoundingClientRect` is never called inside that loop.
9. The frame, the mark, and the watermark never animate. They are at their
   final state on first paint. The only exception is the mark on a link row inheriting that
   row's 120ms `color` transition.
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
authored rest positions and never move; the script short-circuits on one
`matchMedia` check before its loop starts, and the scroll scalar is pinned to
its mid-value. The result is identical to the JavaScript-off render. No content
depends on an animation to become visible.

## Lines and surfaces

- Hairlines are exactly 1px, square ends. Three exceptions, all named: the
  array plot's measurement ticks are dashed `2 4`; the frame's four edge rules
  are interrupted at their ends by `--frame-gap`; and one stroke per drawing
  may be the 2px emphasis stroke of W4. Nothing is ever 3px.
- Corner ticks are `--fg-muted`, never `--line` and no longer `--line-strong`.
  A corner tick is a registration mark and it is the one thing on the page
  whose whole job is to be noticed at the edge of vision; at 1.94:1 it was
  invisible on a phone and at 3.07:1 it was indistinguishable from the frame
  rule now beside it. This holds for the frame's corners and for an image
  plate's corners, which are the only two places a corner tick appears.
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
| Circle | 1px hairline, `--ground` fill |
| Flat fill | `--ground` or `--band` only |
| Numeral and label | `index` and `label` tokens, down to 9px inside a drawing, never `--fg-muted` below 12px |

**The ink floor inside a drawing.** A drawing may not be entirely `--line`.
Every drawing on the site contains at least one element at `--fg-primary` and
at least one at `--fg-body` or darker, and the element that carries the
drawing's subject is never the lightest thing in it. `--line` is for context:
the rays that are not the ray, the box the dimension measures, the ticks along
an axis. A measured drawing rendered end to end at 1.94:1 reads as a smudge on
a phone, which is what the first build shipped.

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

A rule's rest colour is its W3 rank — `--line-strong` for R1, `--line` for R2
and R3 — with exactly two colour exceptions, both about being seen:

| Over | Colour | Why |
|---|---|---|
| `--ground` or `--band` | Its W3 rank | The default. `--line` at 1.94:1 reads as a hairline; `--line-strong` at 3.07:1 reads as a structural rule without reading as a border |
| A photograph or an image plate's interior | `--ground` `#EDEBE6` | `--line` has no guaranteed contrast against an unknown photographic tone. The photography treatment caps every image's white point at `#EDEBE6`, so a `--ground` hairline is at worst equal to the lightest pixel in the image and at best at 15.7:1 against its darkest |

A single rule may therefore render in two colours along its length — `--line`
across the page, `--ground` across the image. That is a drafting convention,
not an inconsistency. The change happens at the plate's outer hairline.

`--wash` is not in this system. It is the watermark's colour and no rule, tick,
border, or stroke anywhere on the site uses it.

The asset constraint that makes the second row true is in "Photography" below.
A rule is never interrupted, faded, dashed, or thickened to make it visible
over something. It changes colour or it stays `--line`.

### The frame

Every page is framed. The frame is the first thing that says the page is a
drawn object rather than a document, and it is the only element fixed to the
viewport.

**Construction.** Four fixed strips, each filled solid `--ground`, inset `0`
from the viewport edges and `--frame` + 1px thick. Each strip carries a 1px
**`--line-strong`** rule on its inner edge — the frame is R1, the outermost
structural rule on the page, and it was the single worst offender when the
page read washed out: a 1.94:1 hairline 9px from the edge of a phone screen in
daylight is not there. It stays 1px; the weight comes from the rank, not from
the width. The strips are solid at ≥768px, so content scrolls behind them and
is cut cleanly at the rule rather than crossed by it. The frame is
`pointer-events: none` and `aria-hidden="true"`.

**The rule is interrupted.** Each edge's hairline stops `--frame-gap` short of
each corner — 24px at ≥768px, 16px at ≤767px. The corner itself carries a
tick: an L of two arms, 16px at ≥768px and 8px at ≤767px, 1px
`--fg-muted`, drawn at the exact inner corner and running inward along both
edges. Arm plus gap equals the interruption, so the measurements close:
16 + 8 = 24 at ≥768px, 8 + 8 = 16 at ≤767px. The effect is a registration
mark, not a border, and at 5.75:1 the corner now reads before the edge does,
which is the right order.

**Measurement marks.** At ≥1024px only, the left edge carries five 8px ticks
pointing inward from its hairline, 1px `--fg-muted`, at 32px pitch, the middle
tick centred on `50vh`. They were `--line`: five 8px marks at 1.94:1 is five
marks nobody sees, and a measurement mark that cannot be read is decoration,
which this system does not permit. They are the array plot's tick column, moved to the
page. No numerals, no caption. The right, top, and bottom edges carry none.
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
rule on the site. It is the one sanctioned exception, and it is safe for the
same reason L1's constraint 4 is: at 3.07:1 the rule is five times lighter than
`--fg-body` at 12.3:1, it is 1px, and it is at a fixed viewport position rather
than a fixed position in the text, so no word is permanently crossed. Nothing
else is allowed to borrow this exception.

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

**Off-page.** The favicon is the mark, and that is the only instance not
sitting on a rule.

### The action target

The primary call to action is a drawn object, not a line of underlined text.
It is assembled from the primitives above and from nothing else: two rules, two
end-stops, one hairline circle, one point, and the link's own words. No fill,
no radius, no shadow, no box. It is not a button, and anything that reads as a
button is a defect.

**Construction**, left to right along one horizontal datum:

```
──────────────────────┤  ⊕  START A PROJECT  ├──────────────────────
```

| Part | Spec |
|---|---|
| Entering rules | Two, one from each side, on the datum. The object's single W4 emphasis stroke: 2px `--fg-primary` |
| End-stops | A 1px `--fg-primary` vertical at the inner end of each entering rule, centred on the datum. 16px tall at ≥768px, 12px at ≤767px |
| Gap | The distance from each end-stop to the text. 24px at ≥768px, 16px at ≤767px. This is the mark's construction — a gap in a rule — at the scale of the page |
| Target | A 1px `--fg-primary` hairline circle with `--ground` fill, 24px across at ≥768px and 20px at ≤767px, carrying a 4×4 `--fg-primary` point at its centre, with the datum passing through it so the circle sits on the line. Inline SVG, `aria-hidden="true"`, 8px of clear space between it and the first glyph |
| Text | The link's visible words, `--fg-primary`, **no underline**. The datum is the affordance |

**Two instances, two scales.** The object is one component; only the text token
and what the rules are anchored to change.

| | Contact band | Hero |
|---|---|---|
| Text token | `statement`, 56px / 30px, upper | `link-cta`, 24px / 20px, lower |
| Rules anchored to | The frame's inner edges, left and right | The left edge of the text column, and its right edge at column 6 of 12. At ≤767px, the content width on both sides |
| Datum height above the text's baseline | Centred on the cap box | Centred on the cap box |
| Object height, ≥768px | 56px band | 40px band |
| Object height, ≤767px | 48px band | 44px band, which is also the tap-target floor |

At ≤767px, if the text plus two gaps leaves either entering rule shorter than
24px, both rules and both end-stops are dropped and the target and the text
remain. The object degrades to a target on a line, never to a crowded one.

**States.** The accessible name is the visible text. Nothing is added to the
accessible tree — no `aria-label`, no `title`, no hidden span — and the drawn
parts are all `aria-hidden="true"`.

| State | What changes | Timing |
|---|---|---|
| Rest | As above | — |
| Hover, `pointer: fine` | The target and the text together, `transform: translateX(8px)`. The gap on the left closes to 16px / 8px and the gap on the right opens by the same amount. Nothing changes colour, because everything is already `--fg-primary` | `--dur-fast`, `--ease-out` |
| `:focus-visible` | The standard focus ring: 1px `--fg-primary` outline at 2px offset, on the `<a>` itself, enclosing the target and the text. The hover offset is not applied | no transition |
| Active | `transform: translateX(4px)` — the object gives back half the hover offset, which reads as a press | `--dur-fast`, `--ease-out` |

The hover is the same affordance a record index already uses, which is why it
is a `transform` of ≤16px and not a new mechanic. Under
`prefers-reduced-motion: reduce` the offsets apply with no transition; every
state stays distinguishable without motion.

**It is two instances per page, maximum.** The header and footer contact links
stay `label`-size text links. The target is the thing a visitor acts on, and a
fourth drawn instance would make it wallpaper.

### The watermark

One very large quiet figure, fixed to the viewport, that the page's text passes
over as it scrolls. It is at stacking level `-1`, below every photograph,
plate, diagram, rule, and word on the site, which is what makes it subordinate.

**It is a measured field, not the mark at size.** The mark may only sit in a
gap in a 1px rule; a 900px mark behind the page breaks the one rule that keeps
the mark meaning one thing. The array plot's full geometry at page scale
competes with the array plot 500px away. What is left is the drafting register
itself: concentric rings and radial spokes, large enough that the reader sees
arcs rather than a circle, and never sees the whole figure at once.

| Part | Spec |
|---|---|
| Rings | Three concentric circles at 0.42, 0.72, and 1.00 × `--wm-r` |
| Spokes | Twelve, at 30° intervals, each from the innermost ring outward past the viewport edge |
| Datum | One horizontal line through the centre, full viewport width |
| Stroke | 1px `--wash` `#E3E0DA`, `vector-effect="non-scaling-stroke"`, square ends |
| Fill | None. Not `--ground`, not `--band`, not transparent-over-something — the shapes have no fill at all |
| Numerals, labels, ticks, dashes | None |

**Position and size.**

| | Centre | `--wm-r` | Outer ring diameter |
|---|---|---|---|
| ≤767 | 50vw, 38vh | 115vw | 2.30 × viewport width |
| 768–1023 | 50vw, 42vh | 95vw | 1.90 × viewport width |
| ≥1024 | 62vw, 42vh | 62vw | 1.24 × viewport width |

At ≥1024px the centre sits at 62vw, under the plot column and the metadata
columns, so the prose measure in columns 1–7 is the part of the page the
watermark touches least. At 390px it is centred, because there is one column
and nowhere to put it that prose does not reach.

**It is fixed, and it does not move.** `position: fixed`, full viewport,
`pointer-events: none`, `aria-hidden="true"`, a direct child of `<body>` so no
ancestor creates a stacking context above it. Content scrolls over a stationary
figure. There is no transform, no scroll listener, no scroll-linked property,
and no animation of any kind on it, at any motion preference. That is what
keeps it outside the motion budget: the only thing in motion is the page, and
the page was already moving. It is not parallax, which would require it to
translate at a rate; it translates at no rate at all.

**Why `--wash` and not opacity.** The design language forbids opacity scrims
and forbids anything that reduces text contrast. A watermark at
`opacity: 0.08` over `--line` would composite against whatever is behind it,
including type, and the composited value would depend on stacking. A flat
colour at level `-1` cannot touch type at all: the glyph paints over it at full
strength.

**The contrast guarantee, checkable.** Three measurements on any screenshot:

1. A glyph crossed by a watermark stroke samples `#141210` or `#2B2825`
   unchanged. Type contrast is 15.7:1 and 12.3:1 as specified, everywhere.
2. A watermark stroke over the bare ground samples `#E3E0DA` ±1 per channel,
   1.08:1 — present as a figure at 1200px of arc, absent as an interruption in
   a 16px letterform.
3. The watermark is invisible inside the contact band, inside an image plate's
   mat, and over any photograph, because all three are opaque fills at level 0
   or above. It appears over the bare ground and nowhere else.

**Cost.** One inline `<svg>`, ≤700 bytes of markup, zero requests, no script.

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
4. **The rule is lighter than the type.** `--line` `#B0AAA0` over
   `--fg-primary` `#141210` leaves the crossed glyph at 94%+ of its ink, and
   the type's own contrast stays 15.7:1 everywhere.
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
tracking. Parallax. Scroll-linked translation of content. Opacity scrims.
Gradient fades over images. `backdrop-filter`. Text set in a colour chosen to
suit one photograph. Interrupting a rule so type can pass through the gap —
with one exception, the action target, where the gap holds the link and
nothing is crossed.

The watermark is not an exception to any of this. It sits **under** the artwork
level in a flat colour, so it is not a scrim, not an overlay, and not over
type. Nothing is composited and no text contrast is reduced.

### The array plot

`ground-dark` draws the emphasised ray in `--fg-primary` with a 40px `--glow`
blur behind it, once per page.

`ground-light` draws no glow. A dark blur behind a hairline on paper is a
smudge, and a light blur is invisible. The emphasis is carried two other ways
instead, both measurable in a screenshot:

1. The emphasised ray is the plot's one W4 emphasis stroke: **2px**
   `--fg-primary` with `vector-effect="non-scaling-stroke"`, at 15.7:1, while
   every neighbouring ray is 1px `--line` at 1.94:1. That is a wider separation
   than the dark theme's glow produces between its own ray and its neighbours.
2. The measurement ticks along the emphasised ray double in density: 16px
   spacing against 32px on the rest of the plot. Tick length, 8px, is
   unchanged.

The rest of the plot's ink, under the weight floors: the outer frame and the
unemphasised spokes stay 1px `--line` (R3 context); the measurement ticks are
`--fg-muted` at ≥768px and `--fg-body` at ≤767px; the 24 points render 4.0 CSS
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
photograph. A `--line` frame at 1.94:1 laid against a dark image edge is
swallowed by the image; `--line-strong` at 3.07:1 against the ground reads as
a frame. Everywhere else on the page, hairlines stay `--line`.

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
- Prose is budgeted per page and the budget is a count, not a feeling. The
  counts live in the spec.
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
