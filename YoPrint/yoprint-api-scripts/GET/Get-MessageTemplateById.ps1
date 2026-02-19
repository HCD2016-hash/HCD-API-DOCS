# Get-MessageTemplateById.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET MESSAGE TEMPLATE DETAILS" -Description "Get details of a specific message template."

$TemplateId = Read-Host "  Enter template ID"

Write-Host ""
Write-Host "  Loading template..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/setting/message_template/$TemplateId" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  MESSAGE TEMPLATE DETAILS" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    Type: $($response.data.type)" -ForegroundColor White
    Write-Host "    System: $($response.data.system)" -ForegroundColor Gray
    Write-Host ""
    Write-Host "    Subject:" -ForegroundColor White
    Write-Host "    $($response.data.subject)" -ForegroundColor Gray
    Write-Host ""
    Write-Host "    Body:" -ForegroundColor White
    Write-Host "    $($response.data.body)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
