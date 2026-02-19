# Remove-Webhook.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "       REMOVE WEBHOOK SUBSCRIPTION" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Delete a webhook subscription." -ForegroundColor Gray
Write-Host ""
Write-Host "  WARNING: This action cannot be undone!" -ForegroundColor Red
Write-Host ""

$WebhookId = Read-Host "  Enter webhook ID"
Write-Host ""
Write-Host "  Are you sure? (yes/no): " -NoNewline
$confirm = Read-Host

if ($confirm -ne "yes") {
    Write-Host ""
    Write-Host "  Cancelled." -ForegroundColor Yellow
    Write-Host ""
    exit
}

Write-Host ""
Write-Host "  Removing webhook..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/webhook_subscription/$WebhookId" -Headers $headers -Method Delete

    Write-Host ""
    Write-Host "  SUCCESS: Webhook deleted!" -ForegroundColor Green
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
