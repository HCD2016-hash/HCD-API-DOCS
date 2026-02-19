# Add-Tag.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host "                CREATE TAG" -ForegroundColor Yellow
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Create a new tag for orders/jobs." -ForegroundColor Gray
Write-Host ""

$Name = Read-Host "  Enter tag name"
Write-Host ""
$Color = Read-Host "  Enter color (hex, e.g., #FF5733 or press Enter for default)"

$body = @{
    name = $Name
}

if ($Color) {
    $body.color = $Color
}

$jsonBody = $body | ConvertTo-Json

Write-Host ""
Write-Host "  Creating tag..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/tag" -Headers $headers -Method Post -Body $jsonBody

    Write-Host ""
    Write-Host "  SUCCESS: Tag created!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Name:  $($response.data.name)" -ForegroundColor White
    Write-Host "    ID:    $($response.data.id)" -ForegroundColor Cyan
    if ($response.data.color) {
        Write-Host "    Color: $($response.data.color)" -ForegroundColor Gray
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
