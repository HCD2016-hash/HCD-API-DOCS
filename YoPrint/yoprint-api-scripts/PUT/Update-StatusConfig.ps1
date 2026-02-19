# Update-StatusConfig.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        UPDATE STATUS CONFIGURATION" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update an existing status configuration." -ForegroundColor Gray
Write-Host ""

$StatusId = Read-Host "  Enter status ID"
$Label = Read-Host "  Status label"
$CustomerLabel = Read-Host "  Customer-facing label"
$Color = Read-Host "  Color hex (e.g., #f39c12)"

Write-Host ""
Write-Host "  Updating status..." -ForegroundColor Yellow

$body = @{
    id = $StatusId
    label = $Label
    customer_label = $CustomerLabel
    color = $Color
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/status/$StatusId" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Status updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Label: $($response.data.label)" -ForegroundColor White
    Write-Host "    Customer Label: $($response.data.customer_label)" -ForegroundColor White
    Write-Host "    Color: $($response.data.color)" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
