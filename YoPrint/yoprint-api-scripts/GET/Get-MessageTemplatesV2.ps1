# Get-MessageTemplatesV2.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET MESSAGE TEMPLATES (V2)" -Description "List all message templates."
Write-Host "  Loading templates..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/setting/message_template" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  MESSAGE TEMPLATES: Found $($response.data.Count)" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    foreach ($tpl in $response.data) {
        $systemBadge = if ($tpl.system) { " [SYSTEM]" } else { "" }
        Write-Host "    $($tpl.name)$systemBadge" -ForegroundColor Cyan
        Write-Host "      ID: $($tpl.id)" -ForegroundColor DarkGray
        Write-Host "      Type: $($tpl.type)" -ForegroundColor White
        Write-Host "      Subject: $($tpl.subject)" -ForegroundColor Gray
        Write-Host ""
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
