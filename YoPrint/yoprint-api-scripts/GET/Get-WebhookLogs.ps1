# Get-WebhookLogs.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET WEBHOOK LOGS" -Description "View delivery logs for a webhook."
Write-Host "  Loading webhooks..." -ForegroundColor Yellow

try {
    # First, load existing webhooks
    $listResponse = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/webhook_subscription" -Headers $headers -Method Get
    $webhooks = $listResponse.data

    Write-Host ""
    Write-Host "  WEBHOOKS: $($webhooks.Count) found" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($webhooks.Count -eq 0) {
        Write-Host "  No webhooks found." -ForegroundColor Yellow
        Write-Host ""
        return
    }

    $i = 1
    foreach ($wh in $webhooks) {
        $status = if ($wh.status -eq "active") { "[ON]" } else { "[OFF]" }
        $statusColor = if ($wh.status -eq "active") { "Green" } else { "Red" }
        Write-Host "    [$i] " -ForegroundColor Cyan -NoNewline
        Write-Host "$status " -ForegroundColor $statusColor -NoNewline
        Write-Host "$($wh.name)" -ForegroundColor White
        $i++
    }

    Write-Host ""
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    $selection = Read-Host "  Select webhook # to view logs (or Enter to exit)"

    if ($selection -match '^\d+$') {
        $idx = [int]$selection
        if ($idx -ge 1 -and $idx -le $webhooks.Count) {
            $selected = $webhooks[$idx - 1]
            $WebhookId = $selected.id

            Write-Host ""
            $Page = Read-Host "  Page number (default: 1)"
            if ([string]::IsNullOrEmpty($Page)) { $Page = 1 }

            Write-Host ""
            Write-Host "  Loading logs for $($selected.name)..." -ForegroundColor Yellow

            try {
                $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/webhook_subscription/$WebhookId/log?page=$Page" -Headers $headers -Method Get

                Write-Host ""
                Write-Host "  WEBHOOK LOGS: $($selected.name)" -ForegroundColor Green
                Write-Host "  Found $($response.data.Count) log entries" -ForegroundColor Green
                Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
                Write-Host ""

                if ($response.data.Count -eq 0) {
                    Write-Host "  No logs found for this webhook." -ForegroundColor Yellow
                } else {
                    foreach ($log in $response.data) {
                        $logStatusColor = if ($log.status -eq "delivered") { "Green" } else { "Red" }

                        Write-Host "    [$($log.status.ToUpper())]" -ForegroundColor $logStatusColor -NoNewline
                        Write-Host " $($log.message.type)" -ForegroundColor White
                        Write-Host "      Sent: $($log.sent_at)" -ForegroundColor Gray
                        Write-Host "      Status Code: $($log.status_code)" -ForegroundColor Gray
                        Write-Host "      Attempt: $($log.attempt)" -ForegroundColor DarkGray
                        if ($log.error) {
                            Write-Host "      Error: $($log.error)" -ForegroundColor Red
                        }
                        Write-Host ""
                    }

                    if ($response.pagination) {
                        Write-Host "  Page $($response.pagination.currentPage) of $($response.pagination.totalPages)" -ForegroundColor DarkGray
                    }
                }
                Write-Host ""
            }
            catch {
                Write-Host ""
                Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
                Write-Host ""
                Write-Host "  Note: The webhook log endpoint may not be available." -ForegroundColor DarkGray
                Write-Host "  This could be a YoPrint API limitation." -ForegroundColor DarkGray
                Write-Host ""
            }
        } else {
            Write-Host "  Invalid selection." -ForegroundColor Yellow
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
