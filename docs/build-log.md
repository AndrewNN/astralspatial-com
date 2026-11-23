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
