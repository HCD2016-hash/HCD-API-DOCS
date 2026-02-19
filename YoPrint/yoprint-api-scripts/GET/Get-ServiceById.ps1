# Get-ServiceById.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")

# Note: Uses /service_location endpoint (not /service which returns 404)

Show-Header -Title "SERVICE LOCATION DETAILS" -Description "Get full details for a specific service."
Write-Host "  Tip: Run Get-Services.ps1 first to see available IDs" -ForegroundColor DarkGray
Write-Host ""

$ServiceId = Read-Host "  Enter service location ID (UUID)"
Write-Host ""
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/service_location/$ServiceId" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  SERVICE DETAILS" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $service = $response.data
    Write-Host "    Name: $($service.name)" -ForegroundColor White
    Write-Host "    ID: $($service.id)" -ForegroundColor Cyan
    if ($service.description) {
        Write-Host "    Description: $($service.description)" -ForegroundColor Gray
    }
    if ($service.pricing_type) {
        Write-Host "    Pricing Type: $($service.pricing_type)" -ForegroundColor Gray
    }
    if ($null -ne $service.allow_cust_loc) {
        Write-Host "    Custom Locations: $($service.allow_cust_loc)" -ForegroundColor Gray
    }
    if ($service.default_color) {
        Write-Host "    Default Color: $($service.default_color)" -ForegroundColor Gray
    }

    if ($service.options -and $service.options.Count -gt 0) {
        Write-Host ""
        Write-Host "    Options:" -ForegroundColor White
        foreach ($opt in $service.options) {
            Write-Host "      - $($opt.name)" -ForegroundColor Gray
        }
    }

    if ($service.locations -and $service.locations.Count -gt 0) {
        Write-Host ""
        Write-Host "    Locations:" -ForegroundColor White
        foreach ($loc in $service.locations) {
            $enabled = if ($loc.enable) { "[ON]" } else { "[OFF]" }
            $color = if ($loc.enable) { "Green" } else { "Red" }
            Write-Host "      $enabled " -ForegroundColor $color -NoNewline
            Write-Host "$($loc.name)" -ForegroundColor Gray
        }
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
