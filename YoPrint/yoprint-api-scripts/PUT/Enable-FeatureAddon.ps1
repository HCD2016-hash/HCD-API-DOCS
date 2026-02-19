# Enable-FeatureAddon.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "         ENABLE FEATURE ADDON" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Enable a feature addon for your team." -ForegroundColor Gray
Write-Host ""
Write-Host "  Common features:" -ForegroundColor DarkGray
Write-Host "    cust_msg_status - Customer message status" -ForegroundColor DarkGray
Write-Host ""

$Feature = Read-Host "  Enter feature name"

Write-Host ""
Write-Host "  Enabling feature..." -ForegroundColor Yellow

$body = "{}"

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/feature_addon/$Feature/enable" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Feature '$Feature' enabled!" -ForegroundColor Green
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
