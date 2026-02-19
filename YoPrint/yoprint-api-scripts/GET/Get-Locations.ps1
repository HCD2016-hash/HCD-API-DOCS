# Get-Locations.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "COMPANY LOCATIONS" -Description "View all company/warehouse locations."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/location" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) locations" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No locations found." -ForegroundColor Yellow
    } else {
        foreach ($loc in $response.data) {
            $primary = if ($loc.primary) { " [PRIMARY]" } else { "" }
            $warehouse = if ($loc.default_warehouse) { " [WAREHOUSE]" } else { "" }

            Write-Host "    $($loc.name)$primary$warehouse" -ForegroundColor White
            Write-Host "      ID: $($loc.id)" -ForegroundColor DarkGray
            if ($loc.address) { Write-Host "      Address: $($loc.address)" -ForegroundColor Gray }
            if ($loc.city) { Write-Host "      City: $($loc.city), $($loc.state) $($loc.zip)" -ForegroundColor Gray }
            if ($loc.phone) { Write-Host "      Phone: $($loc.phone)" -ForegroundColor Gray }
            Write-Host ""
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
