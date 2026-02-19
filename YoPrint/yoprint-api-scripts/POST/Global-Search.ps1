# Global-Search.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

function Show-SearchResults {
    param($SearchTerm)

    Write-Host ""
    Write-Host "  Searching..." -ForegroundColor Yellow

    $body = @{ name = $SearchTerm } | ConvertTo-Json
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/global/search" -Headers $headers -Method Post -Body $body

    return $response.data
}

function Show-ItemDetails {
    param($Item, $Type)

    switch ($Type) {
        "order" {
            $searchBody = @{ type = "order"; scoped_id = $Item.scoped_id } | ConvertTo-Json
            $searchResult = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/scoped_id_search" -Headers $headers -Method Post -Body $searchBody
            $order = $searchResult.data | Where-Object { $_.scoped_id -eq $Item.scoped_id } | Select-Object -First 1

            if ($order) {
                $details = Invoke-RestMethod -Uri "https://secure.yoprint.com/v2/api/store/$teamSlug/v2/order/$($order.id)" -Headers $headers -Method Get
                $o = $details.data

                Write-Host ""
                Write-Host "  ============================================" -ForegroundColor Green
                Write-Host "            ORDER DETAILS" -ForegroundColor Green
                Write-Host "  ============================================" -ForegroundColor Green
                Write-Host ""
                Write-Host "  Order:    $($o.scoped_id)" -ForegroundColor White
                Write-Host "  Customer: $($o.customer.name)" -ForegroundColor Gray
                Write-Host "  Status:   $($o.status.name)" -ForegroundColor Cyan
                Write-Host "  Total:    $($o.currency_symbol)$($o.total)" -ForegroundColor Yellow
                Write-Host "  Created:  $($o.created_at)" -ForegroundColor DarkGray
                Write-Host "  ID:       $($order.id)" -ForegroundColor DarkGray
                Write-Host ""
                return @{ id = $order.id; scoped_id = $o.scoped_id; url = "https://app.yoprint.com/$teamSlug/orders/$($order.id)" }
            }
        }
        "customer" {
            $details = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/customer/$($Item.id)" -Headers $headers -Method Get
            $c = $details.data

            Write-Host ""
            Write-Host "  ============================================" -ForegroundColor Green
            Write-Host "            CUSTOMER DETAILS" -ForegroundColor Green
            Write-Host "  ============================================" -ForegroundColor Green
            Write-Host ""
            Write-Host "  Name:    $($c.name)" -ForegroundColor White
            Write-Host "  ID:      $($c.id)" -ForegroundColor DarkGray
            if ($c.email) { Write-Host "  Email:   $($c.email)" -ForegroundColor Gray }
            if ($c.phone) { Write-Host "  Phone:   $($c.phone)" -ForegroundColor Gray }
            Write-Host ""
            return @{ id = $c.id; name = $c.name; url = "https://app.yoprint.com/$teamSlug/customers/$($c.id)" }
        }
        "product" {
            $details = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/product/$($Item.id)" -Headers $headers -Method Get
            $p = $details.data

            Write-Host ""
            Write-Host "  ============================================" -ForegroundColor Green
            Write-Host "            PRODUCT DETAILS" -ForegroundColor Green
            Write-Host "  ============================================" -ForegroundColor Green
            Write-Host ""
            Write-Host "  Name:    $($p.name)" -ForegroundColor White
            Write-Host "  ID:      $($p.id)" -ForegroundColor DarkGray
            if ($p.sku) { Write-Host "  SKU:     $($p.sku)" -ForegroundColor Gray }
            if ($p.price) { Write-Host "  Price:   $($p.price)" -ForegroundColor Yellow }
            Write-Host ""
            return @{ id = $p.id; name = $p.name; url = "https://app.yoprint.com/$teamSlug/products/$($p.id)" }
        }
        "quote" {
            Write-Host ""
            Write-Host "  ============================================" -ForegroundColor Green
            Write-Host "            QUOTE DETAILS" -ForegroundColor Green
            Write-Host "  ============================================" -ForegroundColor Green
            Write-Host ""
            Write-Host "  Quote:   $($Item.scoped_id)" -ForegroundColor White
            Write-Host "  Name:    $($Item.name)" -ForegroundColor Gray
            Write-Host "  ID:      $($Item.id)" -ForegroundColor DarkGray
            Write-Host ""
            return @{ id = $Item.id; scoped_id = $Item.scoped_id; url = "https://app.yoprint.com/$teamSlug/quotes/$($Item.id)" }
        }
        "job" {
            Write-Host ""
            Write-Host "  ============================================" -ForegroundColor Green
            Write-Host "            JOB DETAILS" -ForegroundColor Green
            Write-Host "  ============================================" -ForegroundColor Green
            Write-Host ""
            Write-Host "  Job:     $($Item.scoped_id)" -ForegroundColor White
            Write-Host "  Name:    $($Item.name)" -ForegroundColor Gray
            Write-Host "  ID:      $($Item.id)" -ForegroundColor DarkGray
            Write-Host ""
            return @{ id = $Item.id; scoped_id = $Item.scoped_id; url = "https://app.yoprint.com/$teamSlug/jobs/$($Item.id)" }
        }
        default {
            Write-Host ""
            Write-Host "  $($Type.ToUpper()): $($Item.name)" -ForegroundColor White
            Write-Host "  ID: $($Item.id)" -ForegroundColor DarkGray
            if ($Item.scoped_id) { Write-Host "  Scoped ID: $($Item.scoped_id)" -ForegroundColor Gray }
            Write-Host ""
            return @{ id = $Item.id; name = $Item.name }
        }
    }
    return $null
}

# Main loop
$keepSearching = $true

while ($keepSearching) {
    Clear-Host
    Write-Host ""
    Write-Host "  ============================================" -ForegroundColor Cyan
    Write-Host "         SEARCH EVERYTHING IN YOPRINT" -ForegroundColor Cyan
    Write-Host "  ============================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  This searches ALL of YoPrint at once:" -ForegroundColor Gray
    Write-Host "    - Orders, Quotes, Jobs" -ForegroundColor DarkGray
    Write-Host "    - Customers" -ForegroundColor DarkGray
    Write-Host "    - Products" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "  Examples: Xcel | SO1234 | shirt" -ForegroundColor DarkGray
    Write-Host ""
    $SearchTerm = Read-Host "  Enter search (or Q to quit)"

    if ($SearchTerm -eq "Q" -or $SearchTerm -eq "q") {
        $keepSearching = $false
        continue
    }

    if ([string]::IsNullOrWhiteSpace($SearchTerm)) {
        Write-Host ""
        Write-Host "  ERROR: You must type something to search for!" -ForegroundColor Red
        Start-Sleep -Seconds 1
        continue
    }

    try {
        $results = Show-SearchResults $SearchTerm

        $browsingResults = $true
        while ($browsingResults) {
            Write-Host ""
            Write-Host "  RESULTS: Found $($results.Count) items" -ForegroundColor Green
            Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
            Write-Host ""
            Write-Host "  #    TYPE          ID            NAME" -ForegroundColor Yellow

            $i = 1
            foreach ($item in $results) {
                $num = "[$i]".PadRight(5)
                $type = $item.global_search_type.ToUpper().PadRight(12)
                $id = if ($item.scoped_id) { $item.scoped_id.PadRight(12) } else { "".PadRight(12) }
                Write-Host "  $num$type  $id  $($item.name)" -ForegroundColor White
                $i++
            }

            Write-Host ""
            Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
            Write-Host "  [#] View details  [N] New search  [Q] Quit" -ForegroundColor Gray
            $selection = Read-Host "  Select"

            if ($selection -eq "N" -or $selection -eq "n") {
                $browsingResults = $false
                continue
            }
            if ($selection -eq "Q" -or $selection -eq "q") {
                $browsingResults = $false
                $keepSearching = $false
                continue
            }

            if ($selection -match '^\d+$') {
                $idx = [int]$selection
                if ($idx -ge 1 -and $idx -le $results.Count) {
                    $item = $results[$idx - 1]
                    $type = $item.global_search_type.ToLower()

                    Write-Host ""
                    Write-Host "  Loading $type details..." -ForegroundColor Yellow

                    try {
                        $details = Show-ItemDetails -Item $item -Type $type
                    }
                    catch {
                        Write-Host "  Could not load full details: $($_.Exception.Message)" -ForegroundColor Yellow
                        $details = @{ id = $item.id; name = $item.name; url = $null }
                    }

                    # Ensure we have at least basic info
                    if (-not $details) {
                        $details = @{ id = $item.id; name = $item.name; url = $null }
                    }

                    # Action menu after viewing details
                    $viewingDetails = $true
                    while ($viewingDetails) {
                        Write-Host ""
                        Write-Host "  ============================================" -ForegroundColor DarkGray
                        Write-Host "  ACTIONS:" -ForegroundColor White
                        Write-Host "  ============================================" -ForegroundColor DarkGray
                        if ($details.url) {
                            Write-Host "    [O] Open in YoPrint (browser)" -ForegroundColor Cyan
                        }
                        Write-Host "    [C] Copy ID to clipboard" -ForegroundColor Cyan
                        Write-Host "    [B] Back to results" -ForegroundColor Gray
                        Write-Host "    [N] New search" -ForegroundColor Gray
                        Write-Host "    [Q] Quit" -ForegroundColor Gray
                        Write-Host ""
                        $action = Read-Host "  Select action"

                        switch ($action.ToUpper()) {
                            "O" {
                                if ($details.url) {
                                    Write-Host "  Opening in browser..." -ForegroundColor Yellow
                                    Start-Process $details.url
                                    Write-Host "  Opened!" -ForegroundColor Green
                                } else {
                                    Write-Host "  No URL available for this item." -ForegroundColor Yellow
                                }
                            }
                            "C" {
                                $copyId = if ($details.id) { $details.id } else { $item.id }
                                $copyId | Set-Clipboard
                                Write-Host "  ID copied to clipboard: $copyId" -ForegroundColor Green
                            }
                            "B" {
                                $viewingDetails = $false
                            }
                            "N" {
                                $viewingDetails = $false
                                $browsingResults = $false
                            }
                            "Q" {
                                $viewingDetails = $false
                                $browsingResults = $false
                                $keepSearching = $false
                            }
                            default {
                                Write-Host "  Invalid option. Use O, C, B, N, or Q." -ForegroundColor Yellow
                            }
                        }
                    }
                } else {
                    Write-Host "  Invalid selection. Enter a number 1-$($results.Count)" -ForegroundColor Yellow
                    Start-Sleep -Milliseconds 500
                }
            }
        }
    }
    catch {
        Write-Host ""
        Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
        Write-Host ""
        Read-Host "  Press Enter to continue"
    }
}

Write-Host ""
