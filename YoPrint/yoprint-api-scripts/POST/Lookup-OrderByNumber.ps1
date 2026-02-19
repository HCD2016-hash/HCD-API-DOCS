# Lookup-OrderByNumber.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "         LOOKUP ORDER BY ORDER NUMBER" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Find an order using its order number." -ForegroundColor Gray
Write-Host "  Examples: SO1234 | SHIP-1234 | JOB-1234" -ForegroundColor DarkGray
Write-Host ""
$ScopedId = Read-Host "  Enter the number"

if ([string]::IsNullOrWhiteSpace($ScopedId)) {
    Write-Host ""
    Write-Host "  ERROR: You must enter a number!" -ForegroundColor Red
    Write-Host ""
    return
}

# Auto-prefix SO if user enters just digits
if ($ScopedId -match '^\d+$') {
    $ScopedId = "SO$ScopedId"
}

Write-Host ""
Write-Host "  Looking up $ScopedId..." -ForegroundColor Yellow

$body = @{ type = "order"; scoped_id = $ScopedId } | ConvertTo-Json
$response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/global/scoped_id_search" -Headers $headers -Method Post -Body $body

# Filter to exact match only
$exactMatch = $response.data | Where-Object { $_.scoped_id -eq $ScopedId }

Write-Host ""
if ($exactMatch) {
    Write-Host "  FOUND:" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Number:   $($exactMatch.scoped_id)" -ForegroundColor White
    Write-Host "    Name:     $($exactMatch.name)" -ForegroundColor White
    Write-Host "    Customer: $($exactMatch.customer.name)" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host "  No exact match for $ScopedId" -ForegroundColor Yellow
    Write-Host ""
}
