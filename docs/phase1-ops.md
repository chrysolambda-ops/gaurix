# Phase 1 Operations (Implemented)

This repo now has concrete Phase-1 workflow tooling for the AUR→Guix loop.

## Commands

- Fetch authoritative AUR package recipe (non-scraping):
  - `scripts/fetch-aur-pkgbuild.sh <aur-package>`
- Validate package locally:
  - `scripts/build-and-lint-package.sh <guix-package>`
- Update TODO org state:
  - `scripts/mark-todo-status.py <pkg> <TODO|IN_PROGRESS|DONE|FAILED> [status-note]`
- Pick next package from cached metadata:
  - `scripts/select-next-package-from-todos.py`

## Git workflow guardrail

- Commit-msg hook enabled via `.githooks/commit-msg`
- Local repo config set:
  - `core.hooksPath=.githooks`

## Expected per-iteration flow

1. `scripts/select-next-package-from-todos.py`
2. `scripts/mark-todo-status.py <pkg> IN_PROGRESS`
3. `scripts/fetch-aur-pkgbuild.sh <pkg>`
4. Implement package in `guix/gaurix/packages/`
5. Export in `guix/gaurix/packages.scm`
6. `scripts/build-and-lint-package.sh <pkg>`
7. If pass: mark DONE + commit + push
8. If repeated no-progress: mark FAILED and skip until explicit reset
