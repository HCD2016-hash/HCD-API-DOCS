# Get-StatusConfigs.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "STATUS CONFIGURATIONS" -Description "View all status configurations with details."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/status" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) status configs" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No status configurations found." -ForegroundColor Yellow
    } else {
        # Group by role if available
        $grouped = $response.data | Group-Object -Property role -ErrorAction SilentlyContinue

        if ($grouped) {
            foreach ($group in $grouped) {
                Write-Host "  [$($group.Name.ToUpper())]" -ForegroundColor Cyan
                foreach ($status in $group.Group | Sort-Object position) {
                    $typeTag = if ($status.type) { " [$($status.type)]" } else { "" }
                    Write-Host "    $($status.label)$typeTag" -ForegroundColor White
                    Write-Host "      ID: $($status.id)" -ForegroundColor DarkGray
                    if ($status.color) {
                        Write-Host "      Color: $($status.color)" -ForegroundColor Gray
                    }
                    if ($status.customer_label) {
                        Write-Host "      Customer Label: $($status.customer_label)" -ForegroundColor Gray
                    }
                }
                Write-Host ""
            }
        } else {
            foreach ($status in $response.data) {
                Write-Host "    $($status.label)" -ForegroundColor White
                Write-Host "      ID: $($status.id)" -ForegroundColor DarkGray
            }
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
