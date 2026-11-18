#!/usr/bin/env bash
set -euo pipefail
# Default example model: gpt-6.1-sol. Copy the exact model ID from the console model list.
# Another currently live model ID is: gpt-6-astro
: "${NICEAI_API_KEY:?Set NICEAI_API_KEY}"
BASE_URL="${NICEAI_BASE_URL:-https://api.niceai.dev/v1}"
MODEL="${NICEAI_MODEL:-gpt-6.1-sol}"

curl -sS "${BASE_URL}/chat/completions" \
  -H "Authorization: Bearer ${NICEAI_API_KEY}" \
  -H "Content-Type: application/json" \
  -d "{\"model\": \"${MODEL}\", \"temperature\": 0, \"messages\": [{\"role\": \"user\", \"content\": \"Reply with the word pong.\"}]}"
echo
