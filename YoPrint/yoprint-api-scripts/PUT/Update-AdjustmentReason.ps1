# Update-AdjustmentReason.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "       UPDATE ADJUSTMENT REASON" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update an existing adjustment reason." -ForegroundColor Gray
Write-Host ""

$ReasonId = Read-Host "  Enter reason ID"
$Reason = Read-Host "  Reason description"
Write-Host "  Enable this reason? (yes/no): " -NoNewline
$Enable = (Read-Host) -eq "yes"

Write-Host ""
Write-Host "  Updating adjustment reason..." -ForegroundColor Yellow

$body = @{
    id = $ReasonId
    reason = $Reason
    enable = $Enable
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/adjustment_reason/$ReasonId" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Adjustment reason updated!" -ForegroundColor Green
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
