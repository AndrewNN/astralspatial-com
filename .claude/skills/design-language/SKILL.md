---
name: design-language
description: This site's design system — colors, type, spacing, breakpoints. Use when designing, building, or critiquing any page.
---

# Astral Spatial — design language

One ground, hairline rules, condensed grotesque in caps for structure, a
serif for everything a person actually reads. Catalogue numbering carries
hierarchy instead of boxes, cards, or shadows. Nothing is rounded, nothing is
shaded, nothing has a gradient.

The ground comes in two themes, `ground-dark` and `ground-light`. They share
every token name, every type size, every spacing value, every grid column,
and every motion rule. Only the eight palette values and the photography
treatment differ.

Every value below is a literal. If a rendered page shows a number that is not
on one of these scales, it is wrong.

## Palette

Two themes, `ground-dark` and `ground-light`. Both are complete sets of the
same eight tokens, with the same roles and the same assignments in the type
scale. A build ships exactly one of them: swap the `:root` block and no other
rule in the stylesheet changes.

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
| `--line-strong` | `#4A4A4A` | Hairline hover state only |
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

### `ground-light`

`color-scheme: light` on `:root`.

| Token | Hex | Role |
|---|---|---|
| `--ground` | `#EDEBE6` | Page background. Every page, every section |
| `--band` | `#E5E2DC` | Alternating section band, and the mat inside an installation image plate |
| `--fg-primary` | `#141210` | Headings, wordmark, links, the email address, numerals in index positions |
| `--fg-body` | `#2B2825` | Running serif body copy and lead paragraphs |
| `--fg-muted` | `#5E5A53` | Labels, section numbers, captions, plate text, technical term lists, footer status bar |
| `--line` | `#B0AAA0` | All hairlines at rest: section rules, record separators, grid ticks |
| `--line-strong` | `#8C857A` | Hairline hover state, and the frame of an installation image plate |
| `--glow` | `transparent` | The theme carries no glow. The token exists so the two `:root` blocks are interchangeable. Nothing renders it |

Measured against `--ground` `#EDEBE6`:

| Token | Ratio | Smallest size used | AA threshold | Verdict |
|---|---|---|---|---|
| `--fg-primary` | 15.7:1 | 16px (`wordmark`, mobile) | 4.5:1 | pass, AAA |
| `--fg-body` | 12.3:1 | 16px (`body`, mobile) | 4.5:1 | pass, AAA |
| `--fg-muted` | 5.75:1 | 11px (`label`, `index`, mobile) | 4.5:1 | pass AA |
| `--band` | 1.09:1 | non-text | — | decoration |
| `--line` | 1.94:1 | non-text | — | decoration |
| `--line-strong` | 3.07:1 | non-text | — | decoration |

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

### Which theme the references support

| Reference | Supports |
|---|---|
| **other-people.net** | `ground-light`. The overall favourite. Warm light grey, not white, which is where `#EDEBE6` comes from |
| **blankforms.org** | `ground-light`. Light ground, serif, gallery register |
| **publicrecords.nyc** | `ground-dark`. Dark, full bleed, images passing under type |
| **ashley.systems** | `ground-dark`. Darkness, grain, and the only source of `--glow` in the system |

Two references each. The tie-breakers are that the favourite is light, and
that `--glow` is the single element the dark theme has and the light theme
cannot reproduce.

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
| `body-s` | 15px | 14px | 1.55 | 0 | sentence | serif | `--fg-muted` |
| `label` | 12px | 11px | 1.0 | 0.22em | upper | grotesque | `--fg-muted` |
| `index` | 12px | 11px | 1.0 | 0.10em | upper, tabular | grotesque | `--fg-muted` |
| `link-cta` | 24px | 20px | 1.2 | 0.12em | lower | grotesque | `--fg-primary` |

Nothing else. Eleven sizes is the whole system. A twelfth value in the
stylesheet is a defect.

Tracking is positive only, and only on upper-case. Lower-case and sentence-case
text is always `letter-spacing: 0`.

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
spacing scale. Nothing touches the viewport edge except deliberate full-bleed
image bands and the header and footer rules.

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

Rules:

1. Only `opacity`, `transform`, `stroke-dashoffset`, and `border-color` /
   `color` animate. Animating `width`, `height`, `top`, `left`, `margin`, or
   `padding` is a defect.
2. Hover and focus affordances: `--dur-fast`, `--ease-out`.
3. Entrances: `--dur-slow`, `--ease-out`, stagger 60ms, maximum 8 staggered
   children. An entrance plays once; nothing re-animates on scroll-back.
4. The array-plot draw is `--dur-draw`, `--ease-io`, once, on load.
5. Nothing moves more than 16px. No parallax. No mouse-tracked transforms. No
   scroll-driven scaling or rotation.
6. No element is invisible without JavaScript. Entrance animations start at
   `opacity: 0` only inside a `@media (scripting: enabled)` guard or as a CSS
   `animation` that ends at the resting state — never as a class a script must
   add.

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
is drawn complete. No content depends on an animation to become visible.

## Lines and surfaces

- Hairlines are exactly 1px, square ends, never 2px, never dashed except in
  the array plot's measurement ticks.
- `border-radius` is `0` everywhere. There are no pills, no rounded cards, no
  circular portraits.
- `box-shadow` is not used, in either theme. `ground-dark` has one blur,
  `--glow`. `ground-light` has none.
- No overlay on any image except the caption bar described in the spec.

### The array plot

`ground-dark` draws the emphasised ray in `--fg-primary` with a 40px `--glow`
blur behind it, once per page.

`ground-light` draws no glow. A dark blur behind a hairline on paper is a
smudge, and a light blur is invisible. The emphasis is carried two other ways
instead, both measurable in a screenshot:

1. The emphasised ray is `--fg-primary` at 15.7:1 while every neighbouring
   ray is `--line` at 1.94:1. That is a wider separation than the dark
   theme's glow produces between its own ray and its neighbours.
2. The measurement ticks along the emphasised ray double in density: 16px
   spacing against 32px on the rest of the plot. Tick length, 8px, is
   unchanged.

The draw animation, `--dur-draw` with `--ease-io`, once on load, is identical
in both themes.

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

**Matting.** Installation photographs sit inside an image plate: a mat of
`--band` at `--s-3` (24px) on all four sides at ≥768px, `--s-2` (16px) at
≤767px, with the photograph flush inside it. The mat separates the dark image
from the page the way a window mount separates a print from a wall. Portraits
get no mat; their mapped white point already dissolves the top edge of the
rectangle into the ground.

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
- Claim only what is finished. The agency is new; the CVs are long. Attribute
  credits to the people who earned them rather than to the company.
- The technical register is allowed to be opaque. Q-SYS, ambisonic templating,
  wave field synthesis, Dante are kept, unexplained, as evidence rather than
  education. Mystery is permitted. Vagueness is not.
- Labels are nouns in caps: `SELECTED WORK`, `CREDITS`, `CONTACT`. Not verbs,
  not questions, not "Our Services".
- The call to action names what happens next, in one sentence, in serif
  underneath the address. It does not say "Get in touch" or "Let's talk".
- British or American spelling: American.

### Proper nouns, exact

Michael Amacio · Chloe Alexandra Thompson · Andrew Fox · Cam Finley ·
Alanis Morissette · Reforesters Laboratory · Q-SYS · MaxMSP · Dante ·
Allen & Heath SQ-5 · d&b audiotechnik · Dolby Atmos · Meow Wolf · MoFE ·
Richard Mosse · Philip Glass Ensemble · *32 Sounds* · Mexican Summer ·
Polyvinyl · Domino Records · Sony Music · Life is Beautiful · Ben Frost ·
Kaki King
