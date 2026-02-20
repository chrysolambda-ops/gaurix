#!/usr/bin/env bash
set -euo pipefail

# Fetch authoritative PKGBUILD from AUR git (non-scraping).
# Usage: scripts/fetch-aur-pkgbuild.sh <aur-package-name>

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <aur-package-name>" >&2
  exit 1
fi

PKG="$1"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="$ROOT/data/aur-cache/pkgbuilds/$PKG"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

mkdir -p "$OUT_DIR"

git clone --depth 1 "https://aur.archlinux.org/${PKG}.git" "$TMP_DIR/$PKG" >/dev/null
cp "$TMP_DIR/$PKG/PKGBUILD" "$OUT_DIR/PKGBUILD"
if [[ -f "$TMP_DIR/$PKG/.SRCINFO" ]]; then
  cp "$TMP_DIR/$PKG/.SRCINFO" "$OUT_DIR/.SRCINFO"
fi

(
  cd "$TMP_DIR/$PKG"
  git rev-parse HEAD > "$OUT_DIR/aur-commit.txt"
)

date -u +%Y-%m-%dT%H:%M:%SZ > "$OUT_DIR/fetched-at-utc.txt"

echo "Fetched AUR PKGBUILD for $PKG -> $OUT_DIR"
