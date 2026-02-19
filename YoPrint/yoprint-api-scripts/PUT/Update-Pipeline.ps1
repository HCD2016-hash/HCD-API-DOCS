# Update-Pipeline.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "          UPDATE PIPELINE" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update an existing pipeline." -ForegroundColor Gray
Write-Host ""

$PipelineId = Read-Host "  Enter pipeline ID"
$Label = Read-Host "  Pipeline name"
$Color = Read-Host "  Color hex (e.g., #3498db)"
Write-Host "  Enable pipeline? (yes/no): " -NoNewline
$Enable = (Read-Host) -eq "yes"

Write-Host ""
Write-Host "  Updating pipeline..." -ForegroundColor Yellow

$body = @{
    id = $PipelineId
    label = $Label
    enable = $Enable
    color = $Color
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/pipeline/$PipelineId" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Pipeline updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.label)" -ForegroundColor White
    Write-Host "    Color: $($response.data.color)" -ForegroundColor White
    Write-Host "    Enabled: $($response.data.enable)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
