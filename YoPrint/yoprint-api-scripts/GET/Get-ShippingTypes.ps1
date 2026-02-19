# Get-ShippingTypes.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "SHIPPING TYPES" -Description "View all configured shipping types."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/shipping_type" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) shipping types" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No shipping types found." -ForegroundColor Yellow
    } else {
        foreach ($ship in $response.data) {
            $default = if ($ship.default) { " [DEFAULT]" } else { "" }
            $priceInfo = if ($ship.price_type -eq "markup") { "$($ship.price_percent)% markup" } else { $ship.price_type }

            Write-Host "    $($ship.name)" -ForegroundColor White -NoNewline
            if ($default) { Write-Host $default -ForegroundColor Green } else { Write-Host "" }
            Write-Host "      ID: $($ship.id)" -ForegroundColor DarkGray
            Write-Host "      Type: $($ship.type)" -ForegroundColor Gray
            if ($ship.service_code) {
                Write-Host "      Service Code: $($ship.service_code)" -ForegroundColor Gray
            }
            Write-Host "      Pricing: $priceInfo" -ForegroundColor Gray
            if ($ship.min_price) {
                Write-Host "      Min Price: `$$($ship.min_price)" -ForegroundColor Gray
            }
            Write-Host ""
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
