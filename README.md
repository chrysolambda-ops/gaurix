# Gaurix

Gaurix is a Guix channel for AUR→Guix conversion experiments and packaging.

## Layout

- `.guix-channel` — channel metadata and dependencies
- `guix/gaurix/` — channel modules
  - `packages/` — package definitions
  - `services/` — service definitions (future)
- `channels.scm` — sample file for adding this channel to Guix
- `tests/` — test scaffolding

## Quick test

```bash
guix time-machine -C channels.scm -- build hello-gaurix
```

## Add channel

Copy/edit `channels.scm`, then:

```bash
guix pull -C channels.scm
```
