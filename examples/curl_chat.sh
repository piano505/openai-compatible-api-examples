#!/usr/bin/env bash
set -euo pipefail
# Default example model: gpt6.1sol. Copy the exact model ID from the console model list.
# Another currently live model ID is: gpt astra6
: "${NICEAI_API_KEY:?Set NICEAI_API_KEY}"
BASE_URL="${NICEAI_BASE_URL:-https://api.niceai.dev/v1}"
MODEL="${NICEAI_MODEL:-gpt6.1sol}"

curl -sS "${BASE_URL}/chat/completions" \
  -H "Authorization: Bearer ${NICEAI_API_KEY}" \
  -H "Content-Type: application/json" \
  -d "{\"model\": \"${MODEL}\", \"temperature\": 0, \"messages\": [{\"role\": \"user\", \"content\": \"Reply with the word pong.\"}]}"
echo
