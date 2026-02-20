#!/usr/bin/env python3
"""Update TODO status for a package inside todo_*_packages.org files.

Usage:
  scripts/mark-todo-status.py <package> <TODO|IN_PROGRESS|DONE|FAILED> [status-note]
"""
import re
import sys
from pathlib import Path

if len(sys.argv) < 3:
    raise SystemExit("Usage: mark-todo-status.py <package> <TODO|IN_PROGRESS|DONE|FAILED> [status-note]")

pkg = sys.argv[1].strip()
new_status = sys.argv[2].strip().upper()
status_note = sys.argv[3].strip() if len(sys.argv) > 3 else None

if new_status not in {"TODO", "IN_PROGRESS", "DONE", "FAILED"}:
    raise SystemExit("status must be one of TODO|IN_PROGRESS|DONE|FAILED")

root = Path(__file__).resolve().parent.parent
updated = False

for org in root.glob("todo_*_packages.org"):
    text = org.read_text(encoding="utf-8")
    blocks = re.split(r"(?=^\*\* )", text, flags=re.M)
    out_blocks = []

    for b in blocks:
        m = re.search(r"^(\*\*\s+)(TODO|DONE|FAILED)(\s+\d+\.\s+([^\n]+))", b, flags=re.M)
        if not m:
            out_blocks.append(b)
            continue

        name = m.group(4).strip()
        if name != pkg:
            out_blocks.append(b)
            continue

        heading_state = "TODO" if new_status in {"TODO", "IN_PROGRESS"} else new_status
        b = re.sub(r"^(\*\*\s+)(TODO|DONE|FAILED)", rf"\1{heading_state}", b, count=1, flags=re.M)

        if re.search(r"TODO Status:\s*[A-Z_]+", b):
            b = re.sub(r"(TODO Status:\s*)([A-Z_]+)", rf"\1{new_status}", b)
        else:
            b = b.rstrip() + f"\n   - TODO Status: {new_status}\n"

        if status_note:
            if re.search(r"^\s*- Status: .*", b, flags=re.M):
                b = re.sub(r"^\s*- Status: .*", f"   - Status: {status_note}", b, count=1, flags=re.M)
            else:
                b = b.rstrip() + f"\n   - Status: {status_note}\n"

        updated = True
        out_blocks.append(b)

    new_text = "".join(out_blocks)
    if new_text != text:
        org.write_text(new_text, encoding="utf-8")

if not updated:
    raise SystemExit(f"Package not found in todo org files: {pkg}")

print(f"updated {pkg} -> {new_status}")
