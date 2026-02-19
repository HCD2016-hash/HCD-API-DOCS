# Search-Vendors.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host "              SEARCH VENDORS" -ForegroundColor Yellow
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Search for vendors/suppliers by name." -ForegroundColor Gray
Write-Host ""
Write-Host "  Examples:  SanMar  |  Alpha  |  S&S" -ForegroundColor DarkGray
Write-Host ""

$SearchTerm = Read-Host "  Enter search term"
Write-Host ""
Write-Host "  Searching..." -ForegroundColor Yellow

$body = @{ name = $SearchTerm } | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/vendor/search" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) vendors" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No vendors found matching '$SearchTerm'" -ForegroundColor Yellow
    } else {
        foreach ($vendor in $response.data) {
            Write-Host "    $($vendor.name)" -ForegroundColor White
            Write-Host "      ID: $($vendor.id)" -ForegroundColor DarkGray
            if ($vendor.email) { Write-Host "      Email: $($vendor.email)" -ForegroundColor Gray }
            if ($vendor.phone) { Write-Host "      Phone: $($vendor.phone)" -ForegroundColor Gray }
            Write-Host ""
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
