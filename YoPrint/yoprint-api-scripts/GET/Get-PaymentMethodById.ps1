# Get-PaymentMethodById.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET PAYMENT METHOD DETAILS" -Description "Get details of a specific payment method."

$MethodId = Read-Host "  Enter payment method ID"

Write-Host ""
Write-Host "  Loading payment method..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/payment_method/$MethodId" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  PAYMENT METHOD DETAILS" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    Default: $($response.data.default)" -ForegroundColor Gray
    Write-Host "    Trashed: $($response.data.trashed)" -ForegroundColor DarkGray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
