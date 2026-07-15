# run-docker.ps1 — Build image and start full stack with Docker Compose (Windows)
# Usage: .\run-docker.ps1

$AppDir = Join-Path $PSScriptRoot "..\..\input-documents\price-chatbot-app"

if (-not $env:OPENAI_API_KEY) {
    Write-Error "OPENAI_API_KEY environment variable is not set."
    Write-Host "Run:  `$env:OPENAI_API_KEY = 'sk-...'"
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Price Comparison Chatbot - Docker     " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Building application JAR..." -ForegroundColor Yellow

Set-Location $AppDir
& .\mvnw package -DskipTests -q

Write-Host "Starting containers (app + PostgreSQL)..." -ForegroundColor Yellow
docker compose up --build -d

Write-Host ""
Write-Host "Services running:" -ForegroundColor Green
Write-Host "  Chat endpoint : POST http://localhost:8080/api/chat" -ForegroundColor Green
Write-Host "  Health check  : GET  http://localhost:8080/q/health" -ForegroundColor Green
Write-Host "  Products API  : GET  http://localhost:8080/api/products" -ForegroundColor Green
Write-Host ""
Write-Host "To view logs:       docker compose logs -f price-chatbot"
Write-Host "To stop:            docker compose down"
Write-Host "To stop + wipe DB:  docker compose down -v"
