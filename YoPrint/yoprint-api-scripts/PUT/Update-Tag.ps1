# Update-Tag.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "              UPDATE TAG" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update an existing tag." -ForegroundColor Gray
Write-Host ""

$TagId = Read-Host "  Enter tag ID"
$Name = Read-Host "  Tag name"
$Color = Read-Host "  Color hex (e.g., #e74c3c)"

Write-Host ""
Write-Host "  Updating tag..." -ForegroundColor Yellow

$body = @{
    id = $TagId
    name = $Name
    color_hex = $Color
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/tag/$TagId" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Tag updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    Color: $($response.data.color_hex)" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
