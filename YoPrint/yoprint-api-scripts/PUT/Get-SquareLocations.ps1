# Get-SquareLocations.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "         GET SQUARE LOCATIONS" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Retrieve available Square locations." -ForegroundColor Gray
Write-Host ""
Write-Host "  NOTE: Requires Square access token." -ForegroundColor Yellow
Write-Host ""

$SquareToken = Read-Host "  Enter Square access token"

Write-Host ""
Write-Host "  Fetching Square locations..." -ForegroundColor Yellow

$body = @{
    square_access_token = $SquareToken
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/payment_gateway/get_square_location_list" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SQUARE LOCATIONS: Found $($response.data.Count)" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    foreach ($loc in $response.data) {
        Write-Host "    $($loc.name)" -ForegroundColor Cyan
        Write-Host "      ID: $($loc.id)" -ForegroundColor White
        Write-Host "      Status: $($loc.status)" -ForegroundColor Gray
        Write-Host ""
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
