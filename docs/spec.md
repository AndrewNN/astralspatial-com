# Spec

Source: `docs/brief.md` (approved 2026-11-23). Scored against `docs/rubric.md`.
Values come from `.claude/skills/design-language/SKILL.md`; token names below
refer to that file.

Static HTML and CSS. One stylesheet, two self-hosted WOFF2 files, inline SVG,
and at most 20 lines of hand-written vanilla JavaScript inline at the end of
`<body>`. No framework, no build step, no CDN request, no third-party script.

Two scored viewports: **390×844** and **1440×900**. Both are first-class.

---

## 1. Information architecture

Three pages ship. A fourth slot is defined and held empty.

| Path | Title | Exists | Purpose |
|---|---|---|---|
| `/index.html` | Astral Spatial | now | Say what the practice does, prove it once, route to email |
| `/work.html` | Work | now | The finished project at full length; a place for the next five |
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

Future work projects append as `W/03`, `W/04` records under `work.html`
section `01 — COMPLETE`, using the same record component. No redesign.

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

### SP-04 — Right-edge section rail

≥1024px only. Taken from publicrecords.nyc's vertical edge labels; its
sliding panels and mouse parallax are not taken.

- Fixed. `right: 48px` at ≥1440px, `right: 40px` at 1024–1439px.
  `top: 25vh; bottom: 25vh`. A 1px `--line` vertical rule.
- 12px to the left of the rule, bottom-anchored: the current section's number
  and name, `label` token, `--fg-muted`, `writing-mode: vertical-rl`, reading
  bottom-to-top.
- `aria-hidden="true"`. It duplicates headings already in the document.
- Updated by an `IntersectionObserver` over `section[data-rail]` with
  `rootMargin: "-45% 0px -45% 0px"`, reading each section's `data-rail`
  attribute. Roughly 14 lines of inline JavaScript.
- Label change crossfades: opacity 0→1 over `--dur`. Under
  `prefers-reduced-motion: reduce` the swap is instant; the rail itself stays.
- Without JavaScript the rail shows the first section's label. Not broken.
- Hidden below 1024px.

Screenshot check: at 1440×900 scrolled into section 02, the right edge shows
a vertical hairline with `02 SELECTED WORK` running bottom-to-top.

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
| Signal line | One 1px `--fg-primary` line from the centre cross to point 01, `filter: drop-shadow(0 0 12px var(--glow))`. The only glow on the site |
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
| SP-08 array plot | 8–12 (546px), top-aligned to the statement | — | — |

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

Purpose: the proof. One finished project, told properly, plus the one in
progress that makes fabrication real rather than aspirational.

**Image band IMG-01.** Full-bleed, viewport edge to viewport edge. Height
560px at ≥1024px, 220px at ≤767px. `object-fit: cover`, `width="1600"
height="900"` attributes set to prevent layout shift, `fetchpriority="high"`,
not lazy.

The caption bar overlaps the band's bottom edge rather than sitting below it —
the one borrowing of publicrecords.nyc's text-over-image. 40px tall at
≥1024px, two stacked 36px rows at ≤767px. `background: rgba(0,0,0,0.72)`, 1px
`--line` top rule, `label` token, `--fg-muted`. Cells: `FIG. 02` ·
`REFORESTERS LABORATORY, WILLIAMSBURG` · `24.2 CHANNEL`.

Before the photograph exists this is SP-07 at the same dimensions.

**Record W/01**, SP-03:

- Title: `REFORESTERS LABORATORY`.
- Prose must say: a 24.2 channel listening room and adaptogen cafe in
  Williamsburg; the scope was software, not hardware; Astral Spatial built the
  control logic and tuned the room; the deliverable was a workflow, so a
  visiting artist arrives with their own work and plays it in ambisonics
  without an engineer rebuilding the room for them. That last clause is the
  point of the whole section and must survive editing.
- Metadata rows: `SCOPE — SOFTWARE`, `Q-SYS PROGRAMMING`,
  `AMBISONIC TEMPLATING`, `DANTE ROUTING`, `ALLEN & HEATH SQ-5`,
  `D&B AUDIOTECHNIK`, `STATUS — COMPLETE`.

**Record W/02**, SP-03 with an image slot replacing the metadata column:

- Index `W/02`. Title: a neutral designation, not a client name.
- Prose must say: a custom speaker installation in progress; the first project
  where the physical build is Astral Spatial's own; the client cannot be named
  yet. Two sentences. No implied scale, no adjectives about the client.
- Image slot IMG-05 in columns 9–12, 432×540 displayed, 4:5. SP-07 plate until
  the photograph exists, labelled `PLATE — FABRICATION IN PROGRESS`.
- Metadata moves below the prose as two rows: `STATUS — IN PROGRESS`,
  `CLIENT — UNNAMED`.
- At ≤767px the image slot sits below the prose at 350×438.

**Link row.** 1px `--line` rule, then a 56px row: `ALL PROJECTS →` at `label`,
`--fg-muted`, hover `--fg-primary`. Links to `/work.html`.

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

**Link row** below: `FULL BIOGRAPHIES →` at `label`, to `/studio.html`. 56px
tall, 1px rule above.

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

**Section order.** Page head → index band → 01 Complete → 02 In progress →
03 In development → contact band → footer.

### Page head

`<h1>` = `WORK`, `statement` token, columns 1–4. Beside it, columns 6–11, a
standfirst at `lead`: one sentence saying that the practice is new, the list is
short, and what is on it is finished. Padding 96px top at ≥1024px, 48px at
≤767px. At ≤767px the standfirst sits below the `<h1>`, 24px gap.

### 01 — Complete

One SP-03 record, W/01, at full length. Contents as home section 02 plus:

- IMG-01 band at the top of the section, same dimensions and caption bar as on
  home. The same file; cached.
- Prose runs 4–6 paragraphs instead of one: the room, the scope boundary
  (software, not hardware), the signal path from a visiting artist's laptop
  through the Allen & Heath SQ-5, over Dante, into the d&b audiotechnik
  amplifiers, the Q-SYS control logic, the ambisonic templating, and what the
  workflow means for an artist who arrives with a finished piece.
- Second image slot IMG-03 below the prose: 1200×800 displayed at 900×600 in
  columns 3–11 at ≥1024px, 350×233 at ≤767px. Caption bar `FIG. 03` ·
  `CONTROL SURFACE AND SIGNAL PATH`. SP-07 plate until shot.
- SP-08 array plot moves here, columns 3–7, once IMG-01 occupies the home
  hero.

### 02 — In progress

Record W/02 as on home, with IMG-05 at 432×540. No additional claims.

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
| OG-01 | all | 1200×630 | not rendered | 60KB | Black ground, the array plot in hairlines, the wordmark. Flat black and white, so it compresses small |

The three portrait slots serve two pages. At `studio.html` the same 640×800
sources are displayed at 320×400 and 350×438, so no second variant is needed.

Separate `srcset` variants at 780w and 1200w exist for IMG-01 and IMG-06 so
the mobile viewport downloads the small one. Only one variant counts against
a page's weight.

### Per-page weight

Rubric floors: total under 500KB, largest single asset under 150KB.

| Asset | Home | Work | Studio |
|---|---|---|---|
| HTML, inline SVG, inline JS | 26KB | 24KB | 28KB |
| `style.css` | 14KB | 14KB | 14KB |
| `archivo-narrow-400.woff2` | 24KB | 24KB | 24KB |
| `source-serif-4-400.woff2` | 24KB | 24KB | 24KB |
| Favicon set | 7KB | 7KB | 7KB |
| Photography | 110 + 66 + 45 = 221KB | 110 + 80 + 45 = 235KB | 66KB |
| **Total, fully shot** | **316KB** | **328KB** | **163KB** |
| **Total, plates only** | **161KB** | **93KB** | **163KB** |

Largest single asset: 110KB. Floor is 150KB.

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
- `<meta name="theme-color" content="#000000">`.
- Favicon: `favicon.svg` (32×32 viewBox, `#000000` ground, nine 4×4 white
  squares on a 3×3 grid at pitch 8 starting at x,y = 6 — the array, readable
  at 16px, ≤600 bytes), plus `favicon.ico` at 32×32 and
  `apple-touch-icon.png` at 180×180 ≤6KB.
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
- `:focus-visible` is a 1px `#FFFFFF` outline at 4px offset, never removed,
  never animated.
- Landmarks: `<header>`, `<nav>`, `<main id="main">`, `<footer>`.
- `font-weight: 400` set explicitly on `h1`–`h6` so no synthetic bold renders.
- Tap targets ≥44×44px below 768px, including the email link.

---

## 8. Motion and interactivity inventory

Everything that moves, with the evidence a critic can check.

| # | What | Trigger | Duration / easing | Evidence |
|---|---|---|---|---|
| M1 | SP-08 array plot draws: frame, then spokes, then points, then captions | Page load, once | 1200ms / `--ease-io`, then 640/240/640ms at `--ease-out` | Screen recording of the first 2s at 1440×900. Final frame identical to the reduced-motion render |
| M2 | Right-edge rail label swaps to the current section | Scroll, `IntersectionObserver` at −45%/−45% | Crossfade 240ms | Screenshot at 1440×900 scrolled to section 02 shows `02 SELECTED WORK` vertically at the right edge |
| M3 | Link underline brightens `--fg-muted` → `--fg-primary` | Hover, `:focus-visible` | 120ms / `--ease-out` | Hover screenshot of the hero email link |
| M4 | SP-03 record top rule `--line` → `--line-strong`, index numeral `translateX(8px)` | Hover, ≥1024px, `pointer: fine` | 120ms / `--ease-out` | Hover screenshot of record `001` |
| M5 | Index band cell text `--fg-muted` → `--fg-primary` | Hover | 120ms / `--ease-out` | Hover screenshot of the index band |

Nothing else moves. No parallax, no mouse tracking, no scroll-driven scale or
rotation, no carousel, no autoplaying media, no scroll-triggered entrance
animations on body content.

Under `prefers-reduced-motion: reduce`: M1 renders complete, M2 swaps
instantly, M3–M5 change state with no transition. No content is hidden or
unreachable.

Without JavaScript: M1, M3, M4, M5 work. M2 shows the first section's label.
The email links jump to the footer address. Every page is fully readable and
every link resolves.

---

## 9. What is removed from the current site

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

Kept: the bio text in substance, the three headshots, the twelve credit names,
`info@astralspatial.com`, white on black.

---

## 10. Decisions taken

The brief leaves these open. Each is a choice, with what it rejects.

1. **Dark ground, `#000000`.** Rejected: the light ground of
   other-people.net, which is the client's favourite reference and three of
   the four references overall. Taken because the brief's own reference table
   lists "darkness" in the *take* column for ashley.systems, because the
   product is a dim room and installation photography of dim rooms sits badly
   as bright rectangles on a light field, and because the rubric's brand-fit
   criterion names black and white holding. What changes from the current
   site is the execution, not the ground: hairlines instead of 2px borders, a
   12-column grid instead of a centred column, catalogue numbering instead of
   bullets, and a serif carrying every word a person actually reads.
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
11. **A fixed right-edge section rail.** Rejected: publicrecords.nyc's panels
    sliding from the right edge, which the brief lists as too much
    interactivity. The rail takes the vertical edge typography and leaves the
    motion.
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
