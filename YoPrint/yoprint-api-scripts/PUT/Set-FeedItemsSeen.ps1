# Set-FeedItemsSeen.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "       MARK FEED ITEMS AS SEEN" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Mark specific activity feed items as seen." -ForegroundColor Gray
Write-Host ""
Write-Host "  Enter feed item IDs (comma-separated):" -ForegroundColor White
$idsInput = Read-Host "  IDs"

$ids = $idsInput -split "," | ForEach-Object { @{ id = $_.Trim() } }

Write-Host ""
Write-Host "  Marking $($ids.Count) items as seen..." -ForegroundColor Yellow

$body = $ids | ConvertTo-Json

# Handle single item case (ConvertTo-Json doesn't wrap in array)
if ($ids.Count -eq 1) {
    $body = "[$body]"
}

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/current_user_feed/seen" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Items marked as seen!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    foreach ($item in $response.data) {
        Write-Host "    ID: $($item.id)" -ForegroundColor Cyan
        Write-Host "    Seen: $($item.seen) | Archived: $($item.archive)" -ForegroundColor Gray
        Write-Host ""
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
