# Update-Webhook.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        UPDATE WEBHOOK SUBSCRIPTION" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Update an existing webhook subscription." -ForegroundColor Gray
Write-Host ""
Write-Host "  Loading webhooks..." -ForegroundColor Yellow

try {
    # First, load existing webhooks
    $listResponse = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/webhook_subscription" -Headers $headers -Method Get
    $webhooks = $listResponse.data

    Write-Host ""
    Write-Host "  EXISTING WEBHOOKS:" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($webhooks.Count -eq 0) {
        Write-Host "  No webhooks found to update." -ForegroundColor Yellow
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
        Write-Host "        URL: $($wh.url)" -ForegroundColor DarkGray
        $i++
    }

    Write-Host ""
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    $selection = Read-Host "  Select webhook to update (or Enter to exit)"

    if (-not $selection -or $selection -notmatch '^\d+$') {
        return
    }

    $idx = [int]$selection
    if ($idx -lt 1 -or $idx -gt $webhooks.Count) {
        Write-Host "  Invalid selection." -ForegroundColor Yellow
        return
    }

    $selected = $webhooks[$idx - 1]
    $WebhookId = $selected.id

    Write-Host ""
    Write-Host "  EDITING: $($selected.name)" -ForegroundColor Cyan
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host "  Press Enter to keep current value" -ForegroundColor DarkGray
    Write-Host ""

    # Show current and prompt for new
    Write-Host "  Current URL: $($selected.url)" -ForegroundColor Gray
    $Url = Read-Host "  New URL"
    if (-not $Url) { $Url = $selected.url }

    Write-Host "  Current Name: $($selected.name)" -ForegroundColor Gray
    $Name = Read-Host "  New Name"
    if (-not $Name) { $Name = $selected.name }

    Write-Host "  Current Status: $($selected.status)" -ForegroundColor Gray
    $Status = Read-Host "  New Status (active/inactive)"
    if (-not $Status) { $Status = $selected.status }

    $currentEvents = if ($selected.enabled_events) { $selected.enabled_events -join ", " } else { "(none)" }
    Write-Host "  Current Events: $currentEvents" -ForegroundColor Gray
    $EventsInput = Read-Host "  New Events (comma-separated)"
    if ($EventsInput) {
        $events = $EventsInput -split "," | ForEach-Object { $_.Trim() }
    } else {
        $events = $selected.enabled_events
    }

    Write-Host ""
    Write-Host "  Updating webhook..." -ForegroundColor Yellow

    $body = @{
        url = $Url
        name = $Name
        status = $Status
        enabled_events = $events
    } | ConvertTo-Json

    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/webhook_subscription/$WebhookId" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Webhook updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    Status: $($response.data.status)" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
