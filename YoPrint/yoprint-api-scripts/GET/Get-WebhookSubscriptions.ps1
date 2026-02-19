# Get-WebhookSubscriptions.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "WEBHOOK SUBSCRIPTIONS" -Description "View all configured webhook subscriptions."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/webhook_subscription" -Headers $headers -Method Get
    $webhooks = $response.data

    Write-Host ""
    Write-Host "  RESULTS: Found $($webhooks.Count) webhooks" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($webhooks.Count -eq 0) {
        Write-Host "  No webhook subscriptions configured." -ForegroundColor Yellow
    } else {
        foreach ($webhook in $webhooks) {
            # Check multiple possible property names for enabled status
            $isEnabled = $false
            $checkValue = $null

            if ($null -ne $webhook.is_enabled) { $checkValue = $webhook.is_enabled }
            elseif ($null -ne $webhook.enabled) { $checkValue = $webhook.enabled }
            elseif ($null -ne $webhook.active) { $checkValue = $webhook.active }
            elseif ($null -ne $webhook.is_active) { $checkValue = $webhook.is_active }

            if ($null -ne $checkValue) {
                $isEnabled = $checkValue -eq $true -or $checkValue -eq "true" -or $checkValue -eq 1 -or $checkValue -eq "1"
            }
            elseif ($webhook.status) {
                $isEnabled = $webhook.status -eq "active" -or $webhook.status -eq "enabled" -or $webhook.status -eq "on"
            }

            $enabled = if ($isEnabled) { "[ON]" } else { "[OFF]" }
            $enabledColor = if ($isEnabled) { "Green" } else { "Red" }

            Write-Host "    $enabled " -ForegroundColor $enabledColor -NoNewline
            Write-Host "$($webhook.name)" -ForegroundColor White
            Write-Host "      ID: $($webhook.id)" -ForegroundColor DarkGray
            Write-Host "      URL: $($webhook.url)" -ForegroundColor Gray

            if ($webhook.events -and $webhook.events.Count -gt 0) {
                Write-Host "      Events: $($webhook.events -join ', ')" -ForegroundColor DarkCyan
            }

            Write-Host ""
        }
    }

    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host "  [H] Health check - test if endpoints are live" -ForegroundColor Gray
    Write-Host "  [D] Show raw data for debugging" -ForegroundColor Gray
    Write-Host "  [Enter] Exit" -ForegroundColor DarkGray
    $option = Read-Host "  Option"

    if ($option -eq "h" -or $option -eq "H") {
        Write-Host ""
        Write-Host "  ENDPOINT HEALTH CHECK" -ForegroundColor Yellow
        Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
        Write-Host "  Testing each webhook URL (HEAD request, 5s timeout)..." -ForegroundColor Gray
        Write-Host ""

        $liveCount = 0
        $deadCount = 0

        foreach ($webhook in $webhooks) {
            $url = $webhook.url
            $name = $webhook.name
            Write-Host "    Testing $name... " -ForegroundColor Gray -NoNewline

            try {
                $testRequest = [System.Net.HttpWebRequest]::Create($url)
                $testRequest.Method = "HEAD"
                $testRequest.Timeout = 5000
                $testRequest.AllowAutoRedirect = $true

                $testResponse = $testRequest.GetResponse()
                $statusCode = [int]$testResponse.StatusCode
                $testResponse.Close()

                Write-Host "[LIVE] " -ForegroundColor Green -NoNewline
                Write-Host "($statusCode)" -ForegroundColor DarkGray
                $liveCount++
            }
            catch [System.Net.WebException] {
                $statusCode = $null
                if ($_.Exception.Response) {
                    $statusCode = [int]$_.Exception.Response.StatusCode
                }

                if ($statusCode) {
                    # Got a response, endpoint exists but returned error
                    Write-Host "[RESPONDS] " -ForegroundColor Yellow -NoNewline
                    Write-Host "($statusCode)" -ForegroundColor DarkGray
                    $liveCount++
                } else {
                    Write-Host "[DEAD] " -ForegroundColor Red -NoNewline
                    Write-Host "Connection failed" -ForegroundColor DarkGray
                    $deadCount++
                }
            }
            catch {
                Write-Host "[ERROR] " -ForegroundColor Red -NoNewline
                Write-Host "$($_.Exception.Message)" -ForegroundColor DarkGray
                $deadCount++
            }
        }

        Write-Host ""
        Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
        Write-Host "  Summary: " -NoNewline
        Write-Host "$liveCount live" -ForegroundColor Green -NoNewline
        Write-Host ", " -NoNewline
        Write-Host "$deadCount dead" -ForegroundColor Red
        Write-Host ""
    }
    elseif ($option -eq "d" -or $option -eq "D") {
        Write-Host ""
        Write-Host "  RAW WEBHOOK DATA:" -ForegroundColor Yellow
        Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
        foreach ($webhook in $webhooks) {
            Write-Host ""
            Write-Host "  $($webhook.name):" -ForegroundColor Cyan
            $webhook | Get-Member -MemberType NoteProperty | ForEach-Object {
                $propName = $_.Name
                $propValue = $webhook.$propName
                Write-Host "    $propName = $propValue" -ForegroundColor Gray
            }
        }
        Write-Host ""
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
