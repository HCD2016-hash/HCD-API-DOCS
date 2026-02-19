# Get-JobPresetById.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "GET JOB PRESET DETAILS" -Description "Select a job preset to view full details."
Write-Host "  Loading presets..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/job_preset" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  AVAILABLE PRESETS: $($response.data.Count) found" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No job presets found." -ForegroundColor Yellow
        Write-Host ""
        return
    }

    $presets = $response.data
    $i = 1
    foreach ($preset in $presets) {
        Write-Host "    [$i] $($preset.name)" -ForegroundColor White
        $i++
    }

    Write-Host ""
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host "  Enter number to view details, or press Enter to exit" -ForegroundColor Gray
    $selection = Read-Host "  Select"

    if ($selection -match '^\d+$') {
        $idx = [int]$selection
        if ($idx -ge 1 -and $idx -le $presets.Count) {
            $preset = $presets[$idx - 1]

            Write-Host ""
            Write-Host "  Loading preset details..." -ForegroundColor Yellow

            $details = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/job_preset/$($preset.id)" -Headers $headers -Method Get
            $p = $details.data

            Write-Host ""
            Write-Host "  ============================================" -ForegroundColor Green
            Write-Host "            JOB PRESET DETAILS" -ForegroundColor Green
            Write-Host "  ============================================" -ForegroundColor Green
            Write-Host ""
            Write-Host "    Name:  $($p.name)" -ForegroundColor White
            Write-Host "    ID:    $($p.id)" -ForegroundColor DarkGray
            Write-Host "    Valid: $($p.is_valid)" -ForegroundColor Gray
            Write-Host ""

            if ($p.note) {
                Write-Host "    NOTE:" -ForegroundColor Yellow
                Write-Host "    --------------------------------------------" -ForegroundColor DarkGray
                $noteLines = $p.note -split "`n"
                foreach ($line in $noteLines) {
                    Write-Host "    $($line.Trim())" -ForegroundColor Gray
                }
                Write-Host "    --------------------------------------------" -ForegroundColor DarkGray
                Write-Host ""
            }

            if ($p.service -and $p.service.Count -gt 0) {
                Write-Host "    SERVICES:" -ForegroundColor Yellow
                foreach ($svc in $p.service) {
                    Write-Host "      - $($svc.service_name)" -ForegroundColor White -NoNewline
                    if ($svc.location.name) { Write-Host " @ $($svc.location.name)" -ForegroundColor Gray -NoNewline }
                    if ($svc.option) { Write-Host ": $($svc.option)" -ForegroundColor DarkGray } else { Write-Host "" }
                }
                Write-Host ""
            }

            if ($p.pipeline -and $p.pipeline.Count -gt 0) {
                Write-Host "    PIPELINES:" -ForegroundColor Yellow
                foreach ($pipe in $p.pipeline) {
                    Write-Host "      - $($pipe.name)" -ForegroundColor White
                }
                Write-Host ""
            }
        } else {
            Write-Host "  Invalid selection." -ForegroundColor Yellow
        }
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
