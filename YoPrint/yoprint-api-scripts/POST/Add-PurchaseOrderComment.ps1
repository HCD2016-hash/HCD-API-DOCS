# Add-PurchaseOrderComment.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host "        ADD PURCHASE ORDER COMMENT" -ForegroundColor Yellow
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Add a comment to a purchase order." -ForegroundColor Gray
Write-Host ""
Write-Host "  Examples:  PO1234  |  po5678" -ForegroundColor DarkGray
Write-Host ""

$PONumber = Read-Host "  Enter PO number"
Write-Host ""

# Lookup PO UUID
$lookupBody = @{ id = $PONumber; type = "purchase_order" } | ConvertTo-Json
try {
    Write-Host "  Looking up PO..." -ForegroundColor Yellow
    $lookup = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/scoped_id_search" -Headers $headers -Method Post -Body $lookupBody
    $poId = $lookup.data.id

    if (-not $poId) {
        Write-Host "  ERROR: Could not find PO '$PONumber'" -ForegroundColor Red
        Write-Host ""
        return
    }

    Write-Host "  Found PO ID: $poId" -ForegroundColor DarkGray
    Write-Host ""

    $Comment = Read-Host "  Enter your comment"
    Write-Host ""
    Write-Host "  Adding comment..." -ForegroundColor Yellow

    $body = @{
        comment = $Comment
        purchase_order_id = $poId
    } | ConvertTo-Json

    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/purchase_order/$poId/comment" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Comment added to $PONumber!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    if ($response.data.id) {
        Write-Host "    Comment ID: $($response.data.id)" -ForegroundColor Cyan
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
