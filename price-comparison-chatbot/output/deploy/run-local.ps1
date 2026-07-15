# run-local.ps1 — Start the Price Comparison Chatbot locally (Windows PowerShell)
# Usage: .\run-local.ps1  (set OPENAI_API_KEY in your environment first)

$AppDir = Join-Path $PSScriptRoot "..\..\input-documents\price-chatbot-app"

if (-not $env:OPENAI_API_KEY) {
    Write-Error "OPENAI_API_KEY environment variable is not set."
    Write-Host "Run:  `$env:OPENAI_API_KEY = 'sk-...'"
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Price Comparison Chatbot - DEV Mode   " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Starting on http://localhost:8080" -ForegroundColor Green
Write-Host "Chat endpoint : POST http://localhost:8080/api/chat" -ForegroundColor Green
Write-Host "Health check  : GET  http://localhost:8080/q/health" -ForegroundColor Green
Write-Host ""

Set-Location $AppDir
& .\mvnw quarkus:dev
