#!/usr/bin/env bash
# Publish the site.
#
#   ./update.sh                    commit everything and push
#   ./update.sh "Add a new talk"   the same, with your own commit message
#
# There is no build step: the site is a single-file SPA in index.html, and
# GitHub Pages serves it as-is (index.html has no YAML front matter, so Jekyll
# copies it verbatim). Pushing to main is the deploy.
set -euo pipefail
cd "$(dirname "$0")"

if ! git remote get-url origin >/dev/null 2>&1; then
  echo "No 'origin' remote — add one before publishing." >&2
  exit 1
fi

message="${1:-Update site}"

# The one failure this site actually has: index.html points at an image, PDF or
# video that was never committed, and the live page shows a broken box. Check
# every local reference before pushing rather than after.
echo "==> Checking local assets referenced by index.html"
missing=0
while IFS= read -r ref; do
  # Undo the %20 and friends that URL-encoded filenames carry.
  path=$(printf '%b' "${ref//%/\\x}")
  if [ ! -e "$path" ]; then
    echo "  missing: $path" >&2
    missing=1
  fi
done < <({
           # src="..." and href="..." attributes
           grep -oE '(src|href)="[^"#:]+\.(png|jpe?g|gif|mp4|webm|pdf|svg|webp)"' index.html |
             sed -E 's/^(src|href)="//; s/"$//'
           # url(...) inside the stylesheet — the watermark lives here, and a
           # CSS reference fails silently rather than showing a broken image.
           grep -oE "url\(['\"]?[^)'\"]+['\"]?\)" index.html |
             sed -E "s/^url\(['\"]?//; s/['\"]?\)$//" |
             grep -v '^\(data:\|https\?:\|//\)'
         } | sort -u)

if [ "$missing" -ne 0 ]; then
  echo "Refusing to publish with missing assets. Add them, or fix the paths." >&2
  exit 1
fi
echo "  all present."

if [ -z "$(git status --porcelain)" ]; then
  echo "==> Nothing has changed."
  exit 0
fi

echo "==> Committing"
git add -A
git status --short
git commit -m "$message"

echo "==> Pushing"
git push -u origin "$(git branch --show-current)"
echo
echo "Pushed. GitHub Pages rebuilds in a minute or so:"
echo "  https://peeterlaas.github.io/"
