# Add-SalesOrderCommentV2.ps1
# Uses v2 API endpoint
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "      ADD SALES ORDER COMMENT (v2)" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Add a comment to a sales order." -ForegroundColor Gray
Write-Host ""

$OrderId = Read-Host "  Enter sales order ID (UUID)"
Write-Host ""
$comment = Read-Host "  Enter comment"

Write-Host ""
Write-Host "  Adding comment..." -ForegroundColor Yellow

$body = @{ comment = $comment } | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/v2/sales_order/$OrderId/comment" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Comment added!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $data = $response.data
    Write-Host "    ID: $($data.id)" -ForegroundColor Cyan
    Write-Host "    Comment: $($data.comment)" -ForegroundColor White
    Write-Host "    Created: $($data.created_at)" -ForegroundColor DarkGray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
