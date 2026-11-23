# Rubric

Status: draft for approval.

Every page is scored on all eight criteria, 0-10 each. A page passes when
every criterion scores 8 or higher and the Lighthouse floor is met. One score
of 7 is a FAIL, however good the rest are.

Lighthouse floor: 90 or higher on performance, accessibility, best practices,
and SEO, measured on staging at mobile emulation.

## 1. Visual hierarchy

Does the eye land in the right order? On arrival, what the business does
should be readable before anything else, and the primary call to action should
be findable without scrolling on desktop and within one screen on mobile.

| Score | Means |
|---|---|
| 9-10 | Order of attention matches the spec's order of importance, at both widths |
| 8 | Correct order, one element competing with its neighbour |
| 5-7 | Two elements of equal weight where one should dominate |
| 0-4 | No discernible entry point, or the call to action is buried |

## 2. Typography

Type stack, scale, line length, line height, and case match the
design-language skill exactly.

| Score | Means |
|---|---|
| 9-10 | Every size on the scale, body measure 60-80 characters, no orphaned headings |
| 8 | One value off the scale, or one line length outside the range |
| 5-7 | Ad-hoc sizes, or all-caps running text that is hard to read |
| 0-4 | Default browser type, or unreadable at mobile width |

## 3. Spacing and rhythm

Measured, not felt. Section padding, the gap above and below headings, and
grid gutters come from the spacing scale.

| Score | Means |
|---|---|
| 9-10 | Every measured gap is on the scale, vertical rhythm consistent down the page |
| 8 | One gap off the scale by less than half a step |
| 5-7 | Inconsistent section spacing, or elements touching their container edge |
| 0-4 | No system, or content hitting the viewport edge with no gutter |

## 4. Mobile layout

Scored at 390x844 as a first-class layout, not a fallback.

| Score | Means |
|---|---|
| 9-10 | No horizontal scroll, tap targets 44px or larger, images scaled, nothing clipped, email address tappable |
| 8 | All of the above with one tap target under 44px |
| 5-7 | Horizontal scroll anywhere, or text under 16px in body copy |
| 0-4 | Content clipped or overlapping, or the call to action unreachable |

## 5. Performance

Numbers from Lighthouse and the asset audit, not impressions.

| Score | Means |
|---|---|
| 9-10 | Lighthouse performance 95+, total page weight under 500KB, no image over 150KB |
| 8 | Performance 90-94, weight under 800KB |
| 5-7 | Performance 75-89, or a single asset over 250KB |
| 0-4 | Performance under 75 |

## 6. Copy clarity

Can a first-time visitor say what this business does, for whom, and what to
do next, after one read?

| Score | Means |
|---|---|
| 9-10 | What, for whom, and next step are all unmissable. No filler, no superlatives, every claim specific |
| 8 | All three present, one sentence doing less work than it should |
| 5-7 | The reader has to infer the audience or the offer |
| 0-4 | Paragraphs that arrive before they say anything, or unsupported claims |

## 7. Brand fit

Does it look like Astral Spatial and not like a generic agency template?

| Score | Means |
|---|---|
| 9-10 | Austere and institutional. Black and white holds. Reads closer to an architecture practice than a vendor. Proof carried by client names, credits, and installation photographs |
| 8 | Right register, one element decorative without reason |
| 5-7 | Softened into a standard startup landing page: rounded cards, stock gradients, friendly illustration |
| 0-4 | Nothing distinguishes it from any other audio services site |

## 8. Conversion clarity

The primary call to action, judged on its own.

| Score | Means |
|---|---|
| 9-10 | One primary action, visually dominant, repeated at least twice, clickable, specific about what happens next |
| 8 | Clear and clickable, stated once |
| 5-7 | Present but generic wording, or buried in a paragraph |
| 0-4 | Plain unlinked text, or absent |

## Deterministic checks

Run every time and recorded as raw numbers in the critique log. They feed
criteria 4, 5, and 8, and a failure in any of them caps that criterion at 7.

| Check | Floor |
|---|---|
| Lighthouse, four categories, mobile | 90 each |
| Broken links and assets | zero |
| HTML validity | zero errors |
| Largest single asset | 150KB |
| Total page weight | 500KB |
| Favicon present | yes |
| `og:` and `twitter:` tags present | yes |
| Spell check on proper nouns | Michael Amacio, Chloe Alexandra Thompson, Cam Finley, Alanis Morissette |
