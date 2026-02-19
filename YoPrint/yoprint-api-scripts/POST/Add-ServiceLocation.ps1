# Add-ServiceLocation.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "          ADD SERVICE LOCATION" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Create a new service location." -ForegroundColor Gray
Write-Host "  (e.g., Front, Back, Left Chest, Right Sleeve)" -ForegroundColor DarkGray
Write-Host ""

$name = Read-Host "  Location name"
Write-Host ""
Write-Host "  Enable this location? (y/n, default=y): " -NoNewline
$enableChoice = Read-Host
$enable = $enableChoice -ne "n"

Write-Host ""
Write-Host "  Creating location..." -ForegroundColor Yellow

$body = @{
    name = $name
    enable = $enable
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/service_location" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Location created!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $loc = $response.data
    Write-Host "    ID: $($loc.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($loc.name)" -ForegroundColor White
    Write-Host "    Enabled: $($loc.enable)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
