#!/usr/bin/env bash
# run-local.sh — Start the Price Comparison Chatbot locally (Linux / macOS)
# Usage: ./run-local.sh  (set OPENAI_API_KEY in your environment first)

set -euo pipefail

APP_DIR="$(cd "$(dirname "$0")/../../input-documents/price-chatbot-app" && pwd)"

if [[ -z "${OPENAI_API_KEY:-}" ]]; then
  echo "ERROR: OPENAI_API_KEY is not set."
  echo "Run:  export OPENAI_API_KEY=sk-..."
  exit 1
fi

echo ""
echo "========================================"
echo "  Price Comparison Chatbot – DEV Mode   "
echo "========================================"
echo ""
echo "Starting on http://localhost:8080"
echo "Chat endpoint : POST http://localhost:8080/api/chat"
echo "Health check  : GET  http://localhost:8080/q/health"
echo ""

cd "$APP_DIR"
./mvnw quarkus:dev
