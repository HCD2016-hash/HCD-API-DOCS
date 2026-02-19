# Update-CustomDomain.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        UPDATE CUSTOM DOMAIN" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Configure a custom domain for customer portal." -ForegroundColor Gray
Write-Host ""

$Domain = Read-Host "  Enter custom domain (e.g., orders.yoursite.com)"

Write-Host ""
Write-Host "  Updating custom domain..." -ForegroundColor Yellow

$body = @{
    custom_domain = $Domain
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/custom_domain/update" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Custom domain configured!" -ForegroundColor Green
    Write-Host ""
    Write-Host "  NOTE: DNS records may take time to propagate." -ForegroundColor Yellow
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
