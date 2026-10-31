#!/usr/bin/env python3


import subprocess
import sys
from pathlib import Path

P = Path.home() / ".dotfiles-p"
W = Path.home() / ".dotfiles-w"
JUNK = {".git"}

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
    p_files = get_files(P)
    w_files = get_files(W)

    only_w = sorted(w_files - p_files)
    only_p = sorted(p_files - w_files)
    shared = sorted(p_files & w_files)
    modified = [f for f in shared if (P / f).read_bytes() != (W / f).read_bytes()]

    if only_w:
        print(f"{GREEN}[+] Only in W ({len(only_w)}){RESET}")
        for f in only_w:
            print(f"{GREEN}  + {f}{RESET}")
        print()

    if only_p:
        print(f"{RED}[-] Only in P ({len(only_p)}){RESET}")
        for f in only_p:
            print(f"{RED}  - {f}{RESET}")
        print()

    if modified:
        print(f"{YELLOW}[~] Modified ({len(modified)}){RESET}")
        for f in modified:
            print(f"{YELLOW}  ~ {f}{RESET}")
        print()

    if not (only_w or only_p or modified):
        print(f"{GREEN}[=] In sync{RESET}\n")

    if "diff" in sys.argv:
        to_diff = [f for f in modified if "local" not in f.name]
        if not to_diff:
            print(f"{BOLD}No non-local differences to review.{RESET}\n")
            return
        print(f"{BOLD}Diffs ({len(to_diff)}):{RESET}\n")
        for f in to_diff:
            _ = subprocess.run(
                ["git", "diff", "--no-index", str(P / f), str(W / f)],
                check=False,
            )


if __name__ == "__main__":
    main()
