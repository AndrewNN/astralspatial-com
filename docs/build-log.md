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

---

## 2026-11-23 — verification fixes — no site code changed

Verification of the scaffold found six defects. All fixed.

Models declared on all five subagents: designer opus, builder sonnet, critic
opus, copy-editor sonnet, scout haiku. Previously absent, so every one would
have inherited Opus.

Scout reduced to Read, Glob, Grep. It had Bash, which contradicted its
read-only remit. Its live HTTP checks moved to the critic's script.

Rubric marked approved, 2026-11-23.

Builder's local preview command fixed to survive the shell call.

CLAUDE.md corrected: "deploy to staging then run the critic" is orchestration,
not a hook. A hook cannot invoke a subagent.

Staging stood up on the server: docroot, nginx block, basic auth, noindex,
robots disallow. Verified 401 without credentials, 200 with, production
unaffected. DNS record still missing.
