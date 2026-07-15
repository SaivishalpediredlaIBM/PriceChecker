#!/usr/bin/env bash
# run-docker.sh — Build image and start full stack with Docker Compose
# Usage: ./run-docker.sh

set -euo pipefail

APP_DIR="$(cd "$(dirname "$0")/../../input-documents/price-chatbot-app" && pwd)"

if [[ -z "${OPENAI_API_KEY:-}" ]]; then
  echo "ERROR: OPENAI_API_KEY is not set."
  echo "Run:  export OPENAI_API_KEY=sk-..."
  exit 1
fi

echo ""
echo "========================================"
echo "  Price Comparison Chatbot – Docker     "
echo "========================================"
echo ""
echo "Building application JAR..."
cd "$APP_DIR"
./mvnw package -DskipTests -q

echo "Starting containers (app + PostgreSQL)..."
docker compose up --build -d

echo ""
echo "Waiting for services to be healthy..."
sleep 5

echo ""
echo "Services running:"
echo "  Chat endpoint : POST http://localhost:8080/api/chat"
echo "  Health check  : GET  http://localhost:8080/q/health"
echo "  Products API  : GET  http://localhost:8080/api/products"
echo ""
echo "To view logs:      docker compose logs -f price-chatbot"
echo "To stop:           docker compose down"
echo "To stop + wipe DB: docker compose down -v"
