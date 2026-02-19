# Disable-FeatureAddon.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "         DISABLE FEATURE ADDON" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Disable a feature addon for your team." -ForegroundColor Gray
Write-Host ""
Write-Host "  Common features:" -ForegroundColor DarkGray
Write-Host "    cust_msg_status - Customer message status" -ForegroundColor DarkGray
Write-Host ""

$Feature = Read-Host "  Enter feature name"

Write-Host ""
Write-Host "  Disabling feature..." -ForegroundColor Yellow

$body = "{}"

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/feature_addon/$Feature/disable" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Feature '$Feature' disabled!" -ForegroundColor Green
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
