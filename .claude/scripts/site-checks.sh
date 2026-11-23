#!/bin/bash
# Deterministic site checks. Usage: site-checks.sh <url>
# Prints the raw numbers the critic folds into criteria 4, 5, and 8.
set -uo pipefail

URL="${1:-}"
if [ -z "$URL" ]; then
  echo "usage: site-checks.sh <url>" >&2
  exit 64
fi

WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT

echo "url: $URL"
echo "date: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
echo

CURL=(curl -sS --max-time 30)
if [ -n "${STAGING_AUTH:-}" ]; then
  CURL+=(--user "$STAGING_AUTH")
fi

"${CURL[@]}" -o "$WORK/page.html" -w 'status: %{http_code}\nhtml_bytes: %{size_download}\n' "$URL" || {
  echo "FETCH FAILED" >&2
  exit 1
}
echo

BASE=$(printf '%s' "$URL" | sed -E 's#(https?://[^/]+).*#\1#')
DIR=$(printf '%s' "$URL" | sed -E 's#/[^/]*$##')

python3 - "$WORK/page.html" "$BASE" "$DIR" > "$WORK/refs.txt" <<'PY'
import re, sys, urllib.parse
html = open(sys.argv[1], encoding='utf-8', errors='replace').read()
base, dirurl = sys.argv[2], sys.argv[3]
refs = set()
for attr in ('href', 'src', 'content'):
    for m in re.finditer(attr + r'\s*=\s*["\']([^"\']+)["\']', html, re.I):
        u = m.group(1).strip()
        if attr == 'content' and not re.match(r'^(https?:|/)', u):
            continue
        if u.startswith(('#', 'mailto:', 'tel:', 'data:', 'javascript:')):
            continue
        refs.add(urllib.parse.urljoin(dirurl + '/', u))
for r in sorted(refs):
    print(r)
PY

echo "== meta and content checks =="
python3 - "$WORK/page.html" <<'PY' 2>&1
import re, sys
html = open(sys.argv[1], encoding='utf-8', errors='replace').read()
checks = {
    'favicon': r'rel\s*=\s*["\'][^"\']*icon',
    'og_tags': r'property\s*=\s*["\']og:',
    'twitter_tags': r'name\s*=\s*["\']twitter:',
    'viewport_meta': r'name\s*=\s*["\']viewport',
    'title': r'<title[^>]*>\s*\S',
    'html_lang': r'<html[^>]+lang\s*=',
    'h1': r'<h1[\s>]',
    'mailto_link': r'href\s*=\s*["\']mailto:',
}
for k, pat in checks.items():
    print(f'{k}: {"yes" if re.search(pat, html, re.I) else "NO"}')
imgs = re.findall(r'<img[^>]*>', html, re.I)
print(f'img_count: {len(imgs)}')
print(f'img_missing_alt: {len([i for i in imgs if not re.search(chr(92)+"balt"+chr(92)+"s*=", i, re.I)])}')
h1s = re.findall(r'<h1[^>]*>(.*?)</h1>', html, re.I | re.S)
print(f'h1_count: {len(h1s)}')
for wrong in ('Morisette', 'Amasio', 'Mike Amacio'):
    if wrong in html:
        print(f'WRONG_SPELLING_PRESENT: {wrong}')
PY
echo

echo "== links and assets =="
TOTAL=$(stat -f%z "$WORK/page.html" 2>/dev/null || stat -c%s "$WORK/page.html")
BROKEN=0
COUNT=0
LARGEST_NAME=""
LARGEST=0
while read -r ref; do
  [ -z "$ref" ] && continue
  COUNT=$((COUNT + 1))
  read -r code size < <("${CURL[@]}" -o /dev/null -w '%{http_code} %{size_download}' -L "$ref" 2>/dev/null || echo "000 0")
  KB=$((size / 1024))
  if [ "$code" != "200" ]; then
    BROKEN=$((BROKEN + 1))
    echo "  BROKEN $code  $ref"
  else
    echo "  ok $code  ${KB}KB  $ref"
  fi
  case "$ref" in
    *.jpg|*.jpeg|*.png|*.gif|*.webp|*.svg|*.css|*.js|*.woff2|*.ico)
      TOTAL=$((TOTAL + size))
      if [ "$size" -gt "$LARGEST" ]; then LARGEST=$size; LARGEST_NAME="$ref"; fi
      ;;
  esac
done < "$WORK/refs.txt"

echo
echo "links_checked: $COUNT"
echo "links_broken: $BROKEN"
echo "page_weight_kb: $((TOTAL / 1024))"
echo "largest_asset: $LARGEST_NAME"
echo "largest_asset_kb: $((LARGEST / 1024))"
echo

echo "== html validation =="
if "${CURL[@]}" -H 'Content-Type: text/html; charset=utf-8' --data-binary "@$WORK/page.html" \
    'https://validator.w3.org/nu/?out=json' -o "$WORK/v.json" 2>/dev/null; then
  python3 - "$WORK/v.json" <<'PY'
import json, sys
try:
    msgs = json.load(open(sys.argv[1])).get('messages', [])
except Exception as e:
    print(f'validator_unavailable: {e}')
    raise SystemExit(0)
errs = [m for m in msgs if m.get('type') == 'error']
warns = [m for m in msgs if m.get('type') != 'error']
print(f'html_errors: {len(errs)}')
print(f'html_warnings: {len(warns)}')
for m in errs[:15]:
    print(f"  line {m.get('lastLine','?')}: {m.get('message','')[:140]}")
PY
else
  echo "validator_unavailable: request failed"
fi
echo

echo "== lighthouse (mobile) =="
LH_ARGS=(--quiet --chrome-flags=--headless=new --output=json --output-path="$WORK/lh.json"
         --only-categories=performance,accessibility,best-practices,seo)
if [ -n "${STAGING_AUTH:-}" ]; then
  LH_ARGS+=(--extra-headers "{\"Authorization\":\"Basic $(printf '%s' "$STAGING_AUTH" | base64)\"}")
fi
if npx -y lighthouse@12 "$URL" "${LH_ARGS[@]}" >/dev/null 2>&1; then
  python3 - "$WORK/lh.json" <<'PY'
import json, sys
d = json.load(open(sys.argv[1]))
for k in ('performance', 'accessibility', 'best-practices', 'seo'):
    c = d['categories'].get(k)
    print(f"lighthouse_{k.replace('-','_')}: {round(c['score']*100) if c and c.get('score') is not None else 'n/a'}")
a = d.get('audits', {})
for k, label in (('largest-contentful-paint','lcp'), ('cumulative-layout-shift','cls'),
                 ('total-blocking-time','tbt'), ('first-contentful-paint','fcp')):
    if k in a and a[k].get('displayValue'):
        print(f"{label}: {a[k]['displayValue']}")
PY
else
  echo "lighthouse_unavailable: run failed"
fi
