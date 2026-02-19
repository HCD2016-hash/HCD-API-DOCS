# Update-Service.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "             UPDATE SERVICE" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update an existing service." -ForegroundColor Gray
Write-Host ""

$ServiceId = Read-Host "  Enter service ID (UUID)"
Write-Host ""
Write-Host "  Leave blank to keep current value:" -ForegroundColor DarkGray
Write-Host ""
$name = Read-Host "  New name"

Write-Host ""
Write-Host "  New pricing type (1=single, 2=matrix, blank=keep): " -NoNewline
$pricingChoice = Read-Host

Write-Host ""
Write-Host "  Allow custom locations? (y/n/blank=keep): " -NoNewline
$custLocChoice = Read-Host

$body = @{ id = $ServiceId }
if ($name) { $body.name = $name }
if ($pricingChoice -eq "1") { $body.pricing_type = "single" }
if ($pricingChoice -eq "2") { $body.pricing_type = "matrix" }
if ($custLocChoice -eq "y") { $body.allow_cust_loc = $true }
if ($custLocChoice -eq "n") { $body.allow_cust_loc = $false }

Write-Host ""
Write-Host "  Updating service..." -ForegroundColor Yellow

$jsonBody = $body | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/service/$ServiceId" -Headers $headers -Method Put -Body $jsonBody

    Write-Host ""
    Write-Host "  SUCCESS: Service updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $service = $response.data
    Write-Host "    ID: $($service.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($service.name)" -ForegroundColor White
    Write-Host "    Pricing: $($service.pricing_type)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
