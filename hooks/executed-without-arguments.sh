#!/usr/bin/env bash
set -euo pipefail
# Veritas — interactive or prompt-driven
# Usage: veritas                              → interactive Claude Code session
#        PROMPT="fact-check this" veritas     → non-interactive, identity + prompt
#        echo "fact-check this" | veritas     → non-interactive, stdin

IDENTITY="$HOME/.veritas/memories/001-identity.md"

PROMPT="${PROMPT:-}"
if [ -z "$PROMPT" ] && [ ! -t 0 ]; then
  PROMPT="$(cat)"
fi

cd "$HOME/.veritas"

if [ -n "$PROMPT" ]; then
  exec claude -p "$(cat "$IDENTITY")

$PROMPT"
else
  exec claude . --model sonnet
fi
