# Get-MessageTemplates.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "MESSAGE TEMPLATES" -Description "View all email/message templates."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    # v1 endpoint returns 404, must use v2
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/setting/message_template" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) templates" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No message templates found." -ForegroundColor Yellow
    } else {
        foreach ($template in $response.data) {
            $enabled = if ($template.enabled) { "[ON]" } else { "[OFF]" }
            $enabledColor = if ($template.enabled) { "Green" } else { "Red" }

            Write-Host "    " -NoNewline
            Write-Host $enabled -ForegroundColor $enabledColor -NoNewline
            Write-Host " $($template.name)" -ForegroundColor White
            Write-Host "      ID: $($template.id)" -ForegroundColor DarkGray
            if ($template.type) { Write-Host "      Type: $($template.type)" -ForegroundColor Gray }
            if ($template.subject) { Write-Host "      Subject: $($template.subject)" -ForegroundColor Gray }
            Write-Host ""
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
