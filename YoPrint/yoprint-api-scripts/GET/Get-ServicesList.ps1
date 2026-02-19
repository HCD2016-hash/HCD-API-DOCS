# Get-ServicesList.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "SERVICES LIST" -Description "View all services with pricing types."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    # /service endpoint returns 404, must use /service_location
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/service_location" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) services" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No services found." -ForegroundColor Yellow
    } else {
        foreach ($service in $response.data) {
            $custLoc = if ($service.allow_cust_loc) { "[Custom Locations]" } else { "" }

            Write-Host "    $($service.name) $custLoc" -ForegroundColor White
            Write-Host "      ID: $($service.id)" -ForegroundColor DarkGray
            Write-Host "      Pricing: $($service.pricing_type)" -ForegroundColor Gray
            Write-Host "      Position: $($service.position)" -ForegroundColor DarkGray

            if ($service.locations -and $service.locations.Count -gt 0) {
                $locNames = ($service.locations | Where-Object { $_.enable } | ForEach-Object { $_.name }) -join ", "
                Write-Host "      Locations: $locNames" -ForegroundColor Gray
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
