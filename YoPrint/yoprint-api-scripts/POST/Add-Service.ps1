# Add-Service.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "             ADD NEW SERVICE" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Create a new service in YoPrint." -ForegroundColor Gray
Write-Host ""

$name = Read-Host "  Service name"
Write-Host ""
Write-Host "  Pricing type:" -ForegroundColor White
Write-Host "    1. single (default)" -ForegroundColor Gray
Write-Host "    2. matrix" -ForegroundColor Gray
$pricingChoice = Read-Host "  Choice (1-2)"
$pricingType = if ($pricingChoice -eq "2") { "matrix" } else { "single" }

Write-Host ""
Write-Host "  Allow custom locations? (y/n): " -NoNewline
$allowCustLoc = (Read-Host) -eq "y"

Write-Host ""
$locName = Read-Host "  Initial location name (e.g., Front, Left Chest)"

$body = @{
    name = $name
    id = $null
    allow_cust_loc = $allowCustLoc
    pricing_type = $pricingType
    locations = @(@{
        id = $null
        name = $locName
        enable = $true
    })
}

Write-Host ""
Write-Host "  Creating service..." -ForegroundColor Yellow

$jsonBody = $body | ConvertTo-Json -Depth 4

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/service" -Headers $headers -Method Post -Body $jsonBody

    Write-Host ""
    Write-Host "  SUCCESS: Service created!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $service = $response.data
    Write-Host "    ID: $($service.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($service.name)" -ForegroundColor White
    Write-Host "    Pricing: $($service.pricing_type)" -ForegroundColor Gray
    Write-Host "    Position: $($service.position)" -ForegroundColor DarkGray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
