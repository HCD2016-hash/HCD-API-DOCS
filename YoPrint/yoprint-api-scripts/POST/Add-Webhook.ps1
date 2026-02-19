# Add-Webhook.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        CREATE WEBHOOK SUBSCRIPTION" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Create a new webhook subscription." -ForegroundColor Gray
Write-Host ""
Write-Host "  Available events:" -ForegroundColor DarkGray
Write-Host "    order.created, order.status_changed," -ForegroundColor DarkGray
Write-Host "    job.status_changed, job_approval.approved," -ForegroundColor DarkGray
Write-Host "    job_approval.change_requested, quote.created" -ForegroundColor DarkGray
Write-Host ""

$Url = Read-Host "  Webhook URL"
$Name = Read-Host "  Webhook name"
Write-Host ""
$EventsInput = Read-Host "  Events (comma-separated)"

$events = $EventsInput -split "," | ForEach-Object { $_.Trim() }

Write-Host ""
Write-Host "  Creating webhook..." -ForegroundColor Yellow

$body = @{
    url = $Url
    name = $Name
    enabled_events = $events
    source = "yoprint"
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/webhook_subscription" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Webhook created!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    URL: $($response.data.url)" -ForegroundColor White
    Write-Host "    Status: $($response.data.status)" -ForegroundColor Gray
    Write-Host ""
    Write-Host "    SECRET: $($response.data.secret)" -ForegroundColor Yellow
    Write-Host "    (Save this secret - you'll need it to verify webhooks!)" -ForegroundColor Yellow
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
