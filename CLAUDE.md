# astralspatial.com

Static site, one page today. Deploys to Linode `66.228.35.159` at
`/var/www/astralspatial.com` via the `deploy-static-site` skill. Branch is
`master`. Production deploys need Andrew's yes.

No build step. Local preview: `python3 -m http.server 8080` from the repo root.

TLS terminates at Cloudflare. The origin has no 443 block, which is correct —
`nginx-astralspatial.conf` listening on port 80 only is not a bug.

Positioning brief: `docs/brief.md`. Build state: `docs/build-log.md`.

## Design loop

| File | What |
|---|---|
| `docs/brief.md` | Positioning. Approved by Andrew. Authoritative |
| `docs/spec.md` | Written by `designer` from the brief |
| `docs/rubric.md` | Scored criteria and thresholds. Approved by Andrew |
| `docs/critique-log.md` | Appended by `critic`, one entry per run, verdict last |
| `docs/build-log.md` | Appended by `builder` after each change |

Subagents in `.claude/agents/`: `designer` and `copy-editor` write words and
specs, `builder` writes site code, `critic` judges the rendered result,
`scout` answers read-only questions. The critic is the only agent with
Playwright, and the only one that writes `docs/critique-log.md`.

## Gates

Hooks in `.claude/hooks/`, wired in `.claude/settings.json`:

- `gitleaks-before-push.sh` runs gitleaks on any `git push` and blocks on
  findings.
- `check-deploy-gate.sh` lets staging deploys through and blocks production
  until three things hold: the last critic verdict is `PASS`, no site file has
  changed since that critique, and `docs/.production-approved` names the
  current `HEAD`. That file records Andrew's yes for one specific commit; a new
  commit needs a new yes.
- `mark-stale.sh` writes `docs/.needs-critique` when a site file changes.

Both marker files are git-ignored.

Standing role and operating instructions for every session started here:

@~/Developer/ops/astral-ops/plan/designer.md
