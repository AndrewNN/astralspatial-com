#!/bin/bash
# PostToolUse on Edit|Write. If a site file changed, the last critique no
# longer describes the site. Mark it stale so the deploy gate catches it.
set -uo pipefail

INPUT=$(cat)
FILE=$(printf '%s' "$INPUT" | python3 -c "import json,sys; print(json.load(sys.stdin).get('tool_input',{}).get('file_path',''))" 2>/dev/null || echo "")

case "$FILE" in
  *.html|*.css|*.js|*.svg|*/img/*|*.jpg|*.jpeg|*.png|*.webp|*.ico|*.woff2)
    echo "site files changed $(date -u '+%Y-%m-%dT%H:%M:%SZ')" > docs/.needs-critique
    ;;
esac

exit 0
