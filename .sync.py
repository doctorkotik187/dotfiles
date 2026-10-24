#!/usr/bin/env python3
"""Compare personal and work dotfiles."""

import subprocess
import sys
from pathlib import Path

PERSONAL = Path.home() / "dotfiles/dotfiles.personal"
WORK = Path.home() / "dotfiles/dotfiles.work"
JUNK = {".git", ".jj", ".sync.py", "__pycache__", ".ruff_cache"}

# ANSI colors
BOLD = "\033[1m"
GREEN = "\033[32m"
RED = "\033[31m"
YELLOW = "\033[33m"
RESET = "\033[0m"


def get_files(root: Path) -> set[Path]:
    if not root.exists():
        return set()
    return {
        p.relative_to(root)
        for p in root.rglob("*")
        if p.is_file() and not any(part in JUNK for part in p.parts)
    }


def main():
    p_files = get_files(PERSONAL)
    w_files = get_files(WORK)

    only_work = sorted(w_files - p_files)
    only_personal = sorted(p_files - w_files)
    shared = sorted(p_files & w_files)
    modified = [
        f for f in shared if (PERSONAL / f).read_bytes() != (WORK / f).read_bytes()
    ]

    if only_work:
        print(f"{GREEN}[+] Only in WORK ({len(only_work)}){RESET}")
        for f in only_work:
            print(f"{GREEN}  + {f}{RESET}")
        print()

    if only_personal:
        print(f"{RED}[-] Only in PERSONAL ({len(only_personal)}){RESET}")
        for f in only_personal:
            print(f"{RED}  - {f}{RESET}")
        print()

    if modified:
        print(f"{YELLOW}[~] Modified ({len(modified)}){RESET}")
        for f in modified:
            print(f"{YELLOW}  ~ {f}{RESET}")
        print()

    if not (only_work or only_personal or modified):
        print(f"{GREEN}[=] In sync{RESET}\n")

    if "diff" in sys.argv:
        to_diff = [f for f in modified if "local" not in f.name]
        if not to_diff:
            print(f"{BOLD}No non-local differences to review.{RESET}\n")
            return
        print(f"{BOLD}Diffs ({len(to_diff)}):{RESET}\n")
        for f in to_diff:
            subprocess.run(
                ["git", "diff", "--no-index", str(PERSONAL / f), str(WORK / f)],
                check=False,
            )


if __name__ == "__main__":
    main()
