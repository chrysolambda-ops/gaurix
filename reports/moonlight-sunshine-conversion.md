# Moonlight & Sunshine AUR→Gaurix Conversion Notes

## Goal
Convert AUR packages for Moonlight and Sunshine into practical Guix-compatible outcomes.

## Moonlight
- AUR target inspected: `moonlight-qt`
- Result: **already in Guix** as `moonlight-qt`.
- Validation run:
  - `guix build moonlight-qt` ✅
- Decision: no duplicate Gaurix package needed; use upstream Guix package directly.

## Sunshine
Two approaches were explored.

### 1) Source package (`sunshine`)
- AUR target inspected: `sunshine`
- Attempted Guix package module: `guix/gaurix/packages/sunshine.scm`
- Main blockers encountered:
  - Upstream CMake fetches dependencies during build (`FetchContent`), violating pure/offline build expectations.
  - Version pin assumptions for Boost and other deps differ from Guix package set.
  - Missing/partial vendored submodule layout in release tarball path expected by upstream CMake.
- Current status: **not build-green yet** in this environment.

### 2) Binary package (`sunshine-bin`)
- AUR target inspected: `sunshine-bin`
- Implemented module: `guix/gaurix/packages/sunshine-bin.scm`
- Strategy:
  - Repackage official upstream `sunshine.pkg.tar.zst` release artifact.
  - Install binary and bundled assets into Guix output paths.
- Validation run:
  - `guix build -L guix sunshine-bin` ✅
- Decision: **usable practical conversion** for Sunshine now.

## Recommended usage
- Moonlight client: use `moonlight-qt` from Guix.
- Sunshine host: use `sunshine-bin` from Gaurix now; keep source `sunshine` as a future hardening target.

## Next steps for source-grade Sunshine
1. Patch CMake to disable all network `FetchContent`.
2. Vendor or map all required dependencies explicitly to Guix inputs.
3. Resolve Boost version/build-variant assumptions robustly.
4. Add reproducible test pipeline and optional service integration package.
