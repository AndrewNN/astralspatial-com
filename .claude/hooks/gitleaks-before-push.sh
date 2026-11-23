#!/bin/bash
# PreToolUse on Bash. Runs gitleaks before any git push. Blocks on findings.
set -uo pipefail

INPUT=$(cat)
COMMAND=$(printf '%s' "$INPUT" | python3 -c "import json,sys; print(json.load(sys.stdin).get('tool_input',{}).get('command',''))" 2>/dev/null || echo "")

echo "$COMMAND" | grep -qE '(^|[;&|[:space:]])git[[:space:]]+(-[^[:space:]]+[[:space:]]+)*push' || exit 0

if ! command -v gitleaks >/dev/null 2>&1; then
  echo "gitleaks is not installed. Install it before pushing." >&2
  exit 2
fi

if ! OUT=$(gitleaks git --no-banner --redact -v . 2>&1); then
  echo "gitleaks found something. Push blocked." >&2
  echo "$OUT" | tail -40 >&2
  exit 2
fi

exit 0
