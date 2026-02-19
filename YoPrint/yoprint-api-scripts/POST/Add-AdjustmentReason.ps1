# Add-AdjustmentReason.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "       CREATE ADJUSTMENT REASON" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Create a new inventory adjustment reason." -ForegroundColor Gray
Write-Host ""

$Reason = Read-Host "  Reason description"
Write-Host "  Enable this reason? (yes/no): " -NoNewline
$Enable = (Read-Host) -eq "yes"

Write-Host ""
Write-Host "  Creating adjustment reason..." -ForegroundColor Yellow

$body = @{
    reason = $Reason
    enable = $Enable
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/adjustment_reason" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Adjustment reason created!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Reason: $($response.data.reason)" -ForegroundColor White
    Write-Host "    Enabled: $($response.data.enable)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
