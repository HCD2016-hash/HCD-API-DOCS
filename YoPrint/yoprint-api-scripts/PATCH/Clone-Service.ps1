# Clone-Service.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "              CLONE SERVICE" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Create a copy of an existing service." -ForegroundColor Gray
Write-Host ""

$ServiceId = Read-Host "  Enter service ID to clone (UUID)"
Write-Host ""
Write-Host "  Cloning service..." -ForegroundColor Yellow

$body = @{} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/service/$ServiceId/clone" -Headers $headers -Method Patch -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Service cloned!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $service = $response.data
    Write-Host "    New ID: $($service.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($service.name)" -ForegroundColor White
    Write-Host "    Pricing: $($service.pricing_type)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
