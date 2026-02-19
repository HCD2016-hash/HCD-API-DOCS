# Get-PipelineById.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET PIPELINE DETAILS" -Description "Get details of a specific pipeline."

$PipelineId = Read-Host "  Enter pipeline ID"

Write-Host ""
Write-Host "  Loading pipeline details..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/pipeline/$PipelineId" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  PIPELINE DETAILS" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.label)" -ForegroundColor White
    Write-Host "    Color: $($response.data.color)" -ForegroundColor White
    Write-Host "    Enabled: $($response.data.enable)" -ForegroundColor Gray
    Write-Host "    Version: $($response.data.version)" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Statuses:" -ForegroundColor White
    foreach ($status in $response.data.statuses) {
        Write-Host "      [$($status.position)] $($status.label) ($($status.type))" -ForegroundColor Gray
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
