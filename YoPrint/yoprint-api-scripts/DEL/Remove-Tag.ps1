# Remove-Tag.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Red
Write-Host "               DELETE TAG" -ForegroundColor Red
Write-Host "  ============================================" -ForegroundColor Red
Write-Host ""
Write-Host "  Remove a tag from YoPrint." -ForegroundColor Gray
Write-Host "  Run Get-Tags first to get the tag ID." -ForegroundColor DarkGray
Write-Host ""
Write-Host "  WARNING: This action cannot be undone!" -ForegroundColor Yellow
Write-Host ""

$TagId = Read-Host "  Enter tag ID (UUID)"
Write-Host ""
$Confirm = Read-Host "  Type 'DELETE' to confirm"

if ($Confirm -ne 'DELETE') {
    Write-Host ""
    Write-Host "  Cancelled. Tag was NOT deleted." -ForegroundColor Yellow
    Write-Host ""
    return
}

Write-Host ""
Write-Host "  Deleting tag..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/tag/$TagId" -Headers $headers -Method Delete

    Write-Host ""
    Write-Host "  SUCCESS: Tag deleted!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
