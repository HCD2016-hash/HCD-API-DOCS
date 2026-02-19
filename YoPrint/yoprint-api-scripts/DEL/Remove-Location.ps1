# Remove-Location.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        REMOVE COMPANY LOCATION" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Delete a company location." -ForegroundColor Gray
Write-Host ""
Write-Host "  WARNING: This action cannot be undone!" -ForegroundColor Red
Write-Host ""

$LocationId = Read-Host "  Enter location ID"
Write-Host ""
Write-Host "  Are you sure? (yes/no): " -NoNewline
$confirm = Read-Host

if ($confirm -ne "yes") {
    Write-Host ""
    Write-Host "  Cancelled." -ForegroundColor Yellow
    Write-Host ""
    exit
}

Write-Host ""
Write-Host "  Removing location..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/location/$LocationId" -Headers $headers -Method Delete

    Write-Host ""
    Write-Host "  SUCCESS: Location deleted!" -ForegroundColor Green
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
