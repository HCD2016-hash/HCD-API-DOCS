# Export-ServiceMatrix.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "        EXPORT SERVICE PRICING MATRIX" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Export a service's pricing matrix as CSV." -ForegroundColor Gray
Write-Host ""
Write-Host "  Loading services..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/service_location" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  AVAILABLE SERVICES:" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $services = $response.data

    if ($services.Count -eq 0) {
        Write-Host "  No services found." -ForegroundColor Yellow
        Write-Host ""
        return
    }

    $i = 1
    foreach ($svc in $services) {
        # Try multiple possible name properties
        $serviceName = $null
        if ($svc.service -and $svc.service.name) { $serviceName = $svc.service.name }
        elseif ($svc.name) { $serviceName = $svc.name }
        elseif ($svc.title) { $serviceName = $svc.title }
        else { $serviceName = "Service $($svc.id)" }

        $location = ""
        if ($svc.location -and $svc.location.name) { $location = " @ $($svc.location.name)" }

        Write-Host "    [$i] " -ForegroundColor Cyan -NoNewline
        Write-Host "$serviceName$location" -ForegroundColor White
        Write-Host "        ID: $($svc.id)" -ForegroundColor DarkGray
        $i++
    }

    Write-Host ""
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host "  Enter number to export, or press Enter to exit" -ForegroundColor Gray
    $selection = Read-Host "  Select"

    if ($selection -match '^\d+$') {
        $idx = [int]$selection
        if ($idx -ge 1 -and $idx -le $services.Count) {
            $service = $services[$idx - 1]
            $ServiceId = $service.id

            # Get service name for display
            $serviceName = $null
            if ($service.service -and $service.service.name) { $serviceName = $service.service.name }
            elseif ($service.name) { $serviceName = $service.name }
            elseif ($service.title) { $serviceName = $service.title }
            else { $serviceName = "Service_$ServiceId" }

            Write-Host ""
            Write-Host "  What would you like to do?" -ForegroundColor Gray
            Write-Host "    [1] Save to Downloads folder" -ForegroundColor White
            Write-Host "    [2] Display in terminal" -ForegroundColor White
            Write-Host "    [3] Both (save and display)" -ForegroundColor White
            $action = Read-Host "  Option"

            Write-Host ""
            Write-Host "  Exporting matrix for $serviceName..." -ForegroundColor Yellow

            $body = @{} | ConvertTo-Json

            $exportResponse = Invoke-WebRequest -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/service/$ServiceId/export_matrix" -Headers $headers -Method Patch -Body $body
            $csvContent = $exportResponse.Content

            if ($action -eq "1" -or $action -eq "3") {
                $safeName = $serviceName -replace '[^a-zA-Z0-9]', '_'
                $savePath = "$env:USERPROFILE\Downloads\${safeName}_matrix.csv"

                $csvContent | Out-File -FilePath $savePath -Encoding UTF8

                Write-Host ""
                Write-Host "  SUCCESS: Matrix saved!" -ForegroundColor Green
                Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
                Write-Host "    Service:  $serviceName" -ForegroundColor White
                Write-Host "    Saved to: $savePath" -ForegroundColor Cyan
                Write-Host ""
            }

            if ($action -eq "2" -or $action -eq "3") {
                Write-Host ""
                Write-Host "  PRICING MATRIX: $serviceName" -ForegroundColor Yellow
                Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
                Write-Host ""

                # Parse and display CSV nicely
                $lines = $csvContent -split "`n"
                $lineCount = 0
                foreach ($line in $lines) {
                    if ($lineCount -eq 0) {
                        # Header row
                        Write-Host "  $line" -ForegroundColor Cyan
                        Write-Host "  $('-' * 60)" -ForegroundColor DarkGray
                    } else {
                        Write-Host "  $line" -ForegroundColor White
                    }
                    $lineCount++

                    # Paginate every 20 rows
                    if ($lineCount -gt 0 -and $lineCount % 20 -eq 0 -and $lineCount -lt $lines.Count) {
                        Write-Host ""
                        Write-Host "  --- Press Enter for more, Q to quit ---" -ForegroundColor DarkGray
                        $continue = Read-Host
                        if ($continue -eq "q" -or $continue -eq "Q") { break }
                    }
                }
                Write-Host ""
                Write-Host "  Total rows: $($lines.Count - 1)" -ForegroundColor Gray
                Write-Host ""
            }

            if ($action -ne "1" -and $action -ne "2" -and $action -ne "3") {
                Write-Host "  Cancelled." -ForegroundColor Yellow
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
