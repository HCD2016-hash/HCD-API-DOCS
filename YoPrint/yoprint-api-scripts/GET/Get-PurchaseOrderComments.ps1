# Get-PurchaseOrderComments.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "PURCHASE ORDER COMMENTS" -Description "View all comments on a purchase order."
Write-Host "  Examples:  PO1234  |  po5678" -ForegroundColor DarkGray
Write-Host ""

$PONumber = Read-Host "  Enter PO number"
Write-Host ""
Write-Host "  Looking up PO..." -ForegroundColor Yellow

# First lookup the PO UUID using scoped_id_search
$lookupBody = @{ id = $PONumber; type = "purchase_order" } | ConvertTo-Json
try {
    $lookup = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/scoped_id_search" -Headers $headers -Method Post -Body $lookupBody
    $poId = $lookup.data.id

    if (-not $poId) {
        Write-Host "  ERROR: Could not find PO '$PONumber'" -ForegroundColor Red
        Write-Host ""
        return
    }

    Write-Host "  Found PO ID: $poId" -ForegroundColor DarkGray
    Write-Host "  Loading comments..." -ForegroundColor Yellow

    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/purchase_order/$poId/comment" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) comments" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No comments found for this purchase order." -ForegroundColor Yellow
    } else {
        foreach ($comment in $response.data) {
            $date = if ($comment.created_at) { $comment.created_at.Substring(0,10) } else { "Unknown" }
            $edited = if ($comment.is_edited) { " [edited]" } else { "" }

            Write-Host "    [$date]$edited" -ForegroundColor DarkGray
            Write-Host "    $($comment.comment)" -ForegroundColor White

            if ($comment.job_name) {
                Write-Host "    Job: $($comment.job_scoped_id) - $($comment.job_name)" -ForegroundColor Gray
            }
            Write-Host ""
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
