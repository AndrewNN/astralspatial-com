#!/bin/bash
# PreToolUse on Bash and Skill. Gates deploys only.
#
#   staging    -> ungated
#   production -> requires the critic's latest verdict to be PASS, no site
#                 edits since that critique, and docs/.production-approved
#                 naming the exact commit Andrew approved
#
# A command that merely mentions a deploy in text is not a deploy. The match
# below requires a transfer command at a command position, or the deploy skill
# named in the Skill tool's own field.
set -uo pipefail

INPUT=$(cat)

PARSED=$(printf '%s' "$INPUT" | python3 -c "
import json, sys
d = json.load(sys.stdin).get('tool_input', {})
cmd = (d.get('command', '') or '').replace(chr(10), ' ')
skill = (d.get('skill', '') or '').strip()
args = (d.get('args', '') or '').replace(chr(10), ' ')
print(cmd)
print(skill)
print(args)
" 2>/dev/null || printf '\n\n\n')

COMMAND=$(printf '%s' "$PARSED" | sed -n '1p')
SKILL=$(printf '%s' "$PARSED" | sed -n '2p')
SKILL_ARGS=$(printf '%s' "$PARSED" | sed -n '3p')

IS_DEPLOY=0

# A transfer command actually being run, not quoted or mentioned.
if printf '%s' "$COMMAND" | grep -qE '(^|[;&|(]|&&|\|\||[[:space:]]then[[:space:]]|[[:space:]]do[[:space:]])[[:space:]]*(sudo[[:space:]]+)?(rsync|scp)[[:space:]]'; then
  IS_DEPLOY=1
fi

# The deploy skill, invoked as a skill.
if [ "$SKILL" = "deploy-static-site" ]; then
  IS_DEPLOY=1
fi

[ "$IS_DEPLOY" = "1" ] || exit 0

# Staging is ungated.
if printf '%s %s' "$COMMAND" "$SKILL_ARGS" | grep -qE 'staging\.astralspatial\.com'; then
  exit 0
fi

LOG="docs/critique-log.md"
if [ ! -f "$LOG" ]; then
  echo "Production deploy blocked: no docs/critique-log.md. Run the critic." >&2
  exit 2
fi

LAST_VERDICT=$(grep -oE '^(PASS|FAIL)[[:space:]]*$' "$LOG" | tail -1 | tr -d '[:space:]')
if [ "$LAST_VERDICT" != "PASS" ]; then
  echo "Production deploy blocked: latest critic verdict is '${LAST_VERDICT:-none}', not PASS." >&2
  exit 2
fi

if [ -f docs/.needs-critique ]; then
  echo "Production deploy blocked: site files changed since the last critique." >&2
  echo "Re-run the critic, then deploy." >&2
  exit 2
fi

APPROVAL="docs/.production-approved"
if [ ! -f "$APPROVAL" ]; then
  echo "Production deploy blocked: Andrew has not approved a production deploy." >&2
  echo "Ask him, then record the approved commit in $APPROVAL." >&2
  exit 2
fi

APPROVED_SHA=$(grep -oE '[0-9a-f]{7,40}' "$APPROVAL" | head -1)
HEAD_SHA=$(git rev-parse HEAD 2>/dev/null || echo "")
case "$HEAD_SHA" in
  "$APPROVED_SHA"*) ;;
  *)
    echo "Production deploy blocked: approval names commit ${APPROVED_SHA:-none}," >&2
    echo "HEAD is ${HEAD_SHA:0:12}. Get a fresh yes for this commit." >&2
    exit 2
    ;;
esac

exit 0
