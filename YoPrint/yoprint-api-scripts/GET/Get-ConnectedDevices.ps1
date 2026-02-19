# Get-ConnectedDevices.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "CONNECTED DEVICES" -Description "View all connected devices (Square terminals, etc.)."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/connected_device" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) connected devices" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No connected devices found." -ForegroundColor Yellow
    } else {
        foreach ($device in $response.data) {
            $statusColor = if ($device.device_status -eq "ready") { "Green" } else { "Yellow" }
            $enabled = if ($device.is_enabled) { "[ON]" } else { "[OFF]" }
            $enabledColor = if ($device.is_enabled) { "Green" } else { "Red" }

            Write-Host "    $enabled " -ForegroundColor $enabledColor -NoNewline
            Write-Host "$($device.device_name)" -ForegroundColor White
            Write-Host "      ID: $($device.id)" -ForegroundColor DarkGray
            Write-Host "      Type: $($device.device_type)" -ForegroundColor Gray
            Write-Host "      Status: " -ForegroundColor Gray -NoNewline
            Write-Host "$($device.device_status)" -ForegroundColor $statusColor
            Write-Host ""
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
