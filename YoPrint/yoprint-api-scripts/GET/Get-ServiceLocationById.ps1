# Get-ServiceLocationById.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "SERVICE LOCATION DETAILS" -Description "Get details for a specific location."

$LocationId = Read-Host "  Enter location ID (UUID)"
Write-Host ""
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/service_location/$LocationId" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  LOCATION DETAILS" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $loc = $response.data
    $enabled = if ($loc.enable) { "[ENABLED]" } else { "[DISABLED]" }
    $enabledColor = if ($loc.enable) { "Green" } else { "Red" }

    Write-Host "    Name: $($loc.name)" -ForegroundColor White
    Write-Host "    ID: $($loc.id)" -ForegroundColor Cyan
    Write-Host "    Status: " -ForegroundColor Gray -NoNewline
    Write-Host $enabled -ForegroundColor $enabledColor

    if ($loc.services -and $loc.services.Count -gt 0) {
        Write-Host ""
        Write-Host "    Used by services:" -ForegroundColor White
        foreach ($svc in $loc.services) {
            Write-Host "      - $($svc.name)" -ForegroundColor Gray
        }
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
