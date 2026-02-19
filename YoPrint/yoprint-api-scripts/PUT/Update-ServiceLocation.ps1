# Update-ServiceLocation.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        UPDATE SERVICE LOCATION" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update an existing service location." -ForegroundColor Gray
Write-Host ""

$LocationId = Read-Host "  Enter location ID (UUID)"
Write-Host ""
Write-Host "  Leave blank to keep current value:" -ForegroundColor DarkGray
Write-Host ""
$name = Read-Host "  New name"
Write-Host "  Enable location? (y/n/blank=keep): " -NoNewline
$enableChoice = Read-Host

$body = @{ id = $LocationId }
if ($name) { $body.name = $name }
if ($enableChoice -eq "y") { $body.enable = $true }
if ($enableChoice -eq "n") { $body.enable = $false }

Write-Host ""
Write-Host "  Updating location..." -ForegroundColor Yellow

$jsonBody = $body | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/service_location/$LocationId" -Headers $headers -Method Put -Body $jsonBody

    Write-Host ""
    Write-Host "  SUCCESS: Location updated!" -ForegroundColor Green
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
