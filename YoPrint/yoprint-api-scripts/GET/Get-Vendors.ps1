# Get-Vendors.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


function Show-VendorDetails {
    param($vendor)

    Write-Host ""
    Write-Host "  Loading vendor details..." -ForegroundColor Yellow

    try {
        $details = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/vendor/$($vendor.id)" -Headers $headers -Method Get
        $v = $details.data

        Write-Host ""
        Write-Host "  ============================================" -ForegroundColor Green
        Write-Host "            VENDOR DETAILS" -ForegroundColor Green
        Write-Host "  ============================================" -ForegroundColor Green
        Write-Host ""
        Write-Host "    Name:    $($v.name)" -ForegroundColor White
        Write-Host "    ID:      $($v.id)" -ForegroundColor DarkGray
        if ($v.email) { Write-Host "    Email:   $($v.email)" -ForegroundColor Gray }
        if ($v.phone) { Write-Host "    Phone:   $($v.phone)" -ForegroundColor Gray }
        if ($v.website) { Write-Host "    Website: $($v.website)" -ForegroundColor Gray }
        if ($v.address) {
            Write-Host "    Address: $($v.address.line1)" -ForegroundColor Gray
            if ($v.address.line2) { Write-Host "             $($v.address.line2)" -ForegroundColor Gray }
            Write-Host "             $($v.address.city), $($v.address.state) $($v.address.postal_code)" -ForegroundColor Gray
        }

        if ($v.notes) {
            Write-Host ""
            Write-Host "    NOTES:" -ForegroundColor Yellow
            Write-Host "    --------------------------------------------" -ForegroundColor DarkGray
            $noteLines = $v.notes -split "`n"
            foreach ($line in $noteLines) {
                Write-Host "    $($line.Trim())" -ForegroundColor Gray
            }
            Write-Host "    --------------------------------------------" -ForegroundColor DarkGray
        }
        Write-Host ""

        # Show contacts if available
        try {
            $contacts = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/vendor/$($vendor.id)/contact" -Headers $headers -Method Get
            if ($contacts.data.Count -gt 0) {
                Write-Host "    CONTACTS:" -ForegroundColor Yellow
                foreach ($c in $contacts.data) {
                    $primary = if ($c.is_primary) { " [PRIMARY]" } else { "" }
                    Write-Host "      - $($c.first_name) $($c.last_name)$primary" -ForegroundColor White
                    if ($c.email) { Write-Host "        Email: $($c.email)" -ForegroundColor Gray }
                    if ($c.phone) { Write-Host "        Phone: $($c.phone)" -ForegroundColor Gray }
                }
                Write-Host ""
            }
        } catch {}
    }
    catch {
        Write-Host ""
        Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
        Write-Host ""
    }
}

Show-Header -Title "ALL VENDORS IN YOPRINT" -Description "These are your suppliers/vendors."
Write-Host "  Loading..." -ForegroundColor Yellow

try {
    $page = 1
    $continueLoop = $true

    while ($continueLoop) {
        $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/vendor?page=$page" -Headers $headers -Method Get

        Write-Host ""
        $totalVendors = if ($response.meta.total) { $response.meta.total } else { $response.data.Count }
        Write-Host "  RESULTS: $totalVendors vendors (Page $page)" -ForegroundColor Green
        Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
        Write-Host ""

        $vendors = $response.data
        if ($vendors.Count -eq 0) {
            Write-Host "  No vendors found." -ForegroundColor Yellow
            break
        }

        $i = 1
        foreach ($v in $vendors) {
            Write-Host "    [$i] $($v.name)" -ForegroundColor White
            $i++
        }

        Write-Host ""
        Write-Host "  --------------------------------------------" -ForegroundColor DarkGray

        # Show navigation options
        $hasNext = $response.meta.current_page -lt $response.meta.last_page
        $hasPrev = $page -gt 1
        $navOptions = @()
        if ($hasPrev) { $navOptions += "P=Prev" }
        if ($hasNext) { $navOptions += "N=Next" }

        Write-Host "  Enter number to view details" -ForegroundColor Gray
        if ($navOptions.Count -gt 0) {
            Write-Host "  $($navOptions -join ' | ') | Enter=Exit" -ForegroundColor DarkGray
        }

        $selection = Read-Host "  Select"

        if ($selection -match '^[Nn]$' -and $hasNext) {
            $page++
            Clear-Host
            Write-Host ""
            Write-Host "  ============================================" -ForegroundColor Cyan
            Write-Host "            ALL VENDORS IN YOPRINT" -ForegroundColor Cyan
            Write-Host "  ============================================" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "  Loading page $page..." -ForegroundColor Yellow
        }
        elseif ($selection -match '^[Pp]$' -and $hasPrev) {
            $page--
            Clear-Host
            Write-Host ""
            Write-Host "  ============================================" -ForegroundColor Cyan
            Write-Host "            ALL VENDORS IN YOPRINT" -ForegroundColor Cyan
            Write-Host "  ============================================" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "  Loading page $page..." -ForegroundColor Yellow
        }
        elseif ($selection -match '^\d+$') {
            $idx = [int]$selection
            if ($idx -ge 1 -and $idx -le $vendors.Count) {
                $vendor = $vendors[$idx - 1]
                Show-VendorDetails $vendor

                Write-Host "  Press Enter to return to list..." -ForegroundColor DarkGray
                Read-Host | Out-Null

                Clear-Host
                Write-Host ""
                Write-Host "  ============================================" -ForegroundColor Cyan
                Write-Host "            ALL VENDORS IN YOPRINT" -ForegroundColor Cyan
                Write-Host "  ============================================" -ForegroundColor Cyan
                Write-Host ""
                Write-Host "  Loading page $page..." -ForegroundColor Yellow
            } else {
                Write-Host "  Invalid selection." -ForegroundColor Yellow
                Start-Sleep -Seconds 1
            }
        }
        elseif ([string]::IsNullOrWhiteSpace($selection)) {
            $continueLoop = $false
        }
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
