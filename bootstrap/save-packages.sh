#!/usr/bin/env bash
# -----------------------------------------------------
# Snapshot the explicitly installed packages into bootstrap/packages/
# Run after installing/removing software, then commit.
# -----------------------------------------------------
set -euo pipefail
dir="$(cd "$(dirname "$0")" && pwd)/packages"

# Debug split packages are pulled in automatically, never install them directly
filter() { grep -vE -- '-debug$' || true; }

pacman -Qqen | filter >"$dir/repo.txt"
pacman -Qqem | filter >"$dir/aur.txt"

echo ":: $(wc -l <"$dir/repo.txt") repo packages, $(wc -l <"$dir/aur.txt") AUR packages saved to $dir"
git -C "$dir" --no-pager diff --stat -- . || true
