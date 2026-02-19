# Get-ShipmentBoxes.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "SHIPMENT BOX CONFIGS" -Description "View all configured shipment box sizes."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/shipment_box" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) box configurations" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No shipment boxes configured." -ForegroundColor Yellow
    } else {
        foreach ($box in $response.data) {
            $default = if ($box.is_default) { " [DEFAULT]" } else { "" }
            $insured = if ($box.is_insured) { " [INSURED]" } else { "" }

            Write-Host "    $($box.name)$default$insured" -ForegroundColor White
            Write-Host "      ID: $($box.id)" -ForegroundColor DarkGray
            Write-Host "      Dimensions: $($box.length) x $($box.width) x $($box.height) $($box.length_unit)" -ForegroundColor Gray
            Write-Host ""
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
