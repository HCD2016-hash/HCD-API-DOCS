# Add-StatusConfig.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host "         CREATE STATUS CONFIGURATION" -ForegroundColor Yellow
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Add a new status to YoPrint." -ForegroundColor Gray
Write-Host ""

$Label = Read-Host "  Enter status label (internal)"
$CustomerLabel = Read-Host "  Enter customer-facing label"
Write-Host ""
Write-Host "  Role options: order, job" -ForegroundColor DarkGray
$Role = Read-Host "  Enter role"
Write-Host ""
Write-Host "  Type options: start, middle, end" -ForegroundColor DarkGray
$Type = Read-Host "  Enter type"
Write-Host ""
$Color = Read-Host "  Enter color (hex, e.g., #FF5733)"
Write-Host ""
$PipelineId = Read-Host "  Enter pipeline ID (run Get-Pipelines for list)"

$body = @{
    label = $Label
    customer_label = $CustomerLabel
    role = $Role
    type = $Type
    color = $Color
    pipeline_id = $PipelineId
} | ConvertTo-Json

Write-Host ""
Write-Host "  Creating status configuration..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/status" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Status configuration created!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Label: $($response.data.label)" -ForegroundColor White
    Write-Host "    ID:    $($response.data.id)" -ForegroundColor Cyan
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
