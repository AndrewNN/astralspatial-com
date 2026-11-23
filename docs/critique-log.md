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
