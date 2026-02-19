# Get-WebhookById.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET WEBHOOK DETAILS" -Description "Get details of a specific webhook."

$WebhookId = Read-Host "  Enter webhook ID"

Write-Host ""
Write-Host "  Loading webhook..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/webhook_subscription/$WebhookId" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  WEBHOOK DETAILS" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    URL: $($response.data.url)" -ForegroundColor White
    Write-Host "    Status: $($response.data.status)" -ForegroundColor Gray
    Write-Host ""
    Write-Host "    Events:" -ForegroundColor White
    foreach ($event in $response.data.enabled_events) {
        Write-Host "      - $event" -ForegroundColor Gray
    }
    Write-Host ""
    Write-Host "    Created: $($response.data.created_at)" -ForegroundColor DarkGray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
