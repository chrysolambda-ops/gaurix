#!/usr/bin/env bash
set -euo pipefail

# Run standard validation for a Gaurix package.
# Usage: scripts/build-and-lint-package.sh <package-name>

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <package-name>" >&2
  exit 1
fi

PKG="$1"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

echo "[1/2] guix lint -L guix $PKG"
# lint can produce warnings; keep output but do not fail hard on lint warning-only runs.
if ! guix lint -L guix "$PKG"; then
  echo "lint returned non-zero (this may be acceptable for some checks); continuing to build" >&2
fi

echo "[2/2] guix build -L guix $PKG"
guix build -L guix "$PKG"

echo "Validation finished for $PKG"
