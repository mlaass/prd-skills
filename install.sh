#!/usr/bin/env bash
set -euo pipefail

DEST="${HOME}/.claude/skills"
FORCE="${1:-}"
REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$DEST"

for skill in "$REPO_ROOT"/skills/*/; do
  name=$(basename "$skill")
  target="$DEST/$name"

  if [[ -e "$target" && ! -L "$target" && "$FORCE" != "--force" ]]; then
    echo "skip: $target exists and is not a symlink (rerun with --force to replace)" >&2
    continue
  fi

  ln -sfn "$skill" "$target"
  echo "linked $name -> $target"
done
