# Update-StatusOrder.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host "           UPDATE STATUS ORDER" -ForegroundColor Yellow
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Reorder statuses in a pipeline." -ForegroundColor Gray
Write-Host "  Run Get-StatusConfigs first to get status IDs." -ForegroundColor DarkGray
Write-Host ""

$PipelineId = Read-Host "  Enter pipeline ID"
Write-Host ""
Write-Host "  Enter status IDs in desired order, comma-separated:" -ForegroundColor Gray
Write-Host "  Example: id1,id2,id3,id4" -ForegroundColor DarkGray
Write-Host ""
$StatusIds = Read-Host "  Enter status IDs"

$statusArray = $StatusIds -split ',' | ForEach-Object { $_.Trim() }

$body = @{
    pipeline_id = $PipelineId
    status_ids = $statusArray
} | ConvertTo-Json

Write-Host ""
Write-Host "  Updating status order..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/status/order" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Status order updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
