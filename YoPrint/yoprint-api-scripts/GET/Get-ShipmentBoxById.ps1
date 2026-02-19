# Get-ShipmentBoxById.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET SHIPMENT BOX DETAILS" -Description "Get details of a specific shipment box."

$BoxId = Read-Host "  Enter box ID"

Write-Host ""
Write-Host "  Loading box details..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/shipment_box/$BoxId" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  SHIPMENT BOX DETAILS" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host ""
    Write-Host "    Dimensions:" -ForegroundColor White
    Write-Host "      Length: $($response.data.length) $($response.data.length_unit)" -ForegroundColor Gray
    Write-Host "      Width: $($response.data.width) $($response.data.length_unit)" -ForegroundColor Gray
    Write-Host "      Height: $($response.data.height) $($response.data.length_unit)" -ForegroundColor Gray
    Write-Host ""
    Write-Host "    Default: $($response.data.is_default)" -ForegroundColor Gray
    Write-Host "    Insured: $($response.data.is_insured)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
