# =====================================
# YoPrint: Display Full Quote/Sales Order by ID (with Assigned Contact)
# =====================================

$TeamId       = "hub-city-design-inc"
$SalesOrderId = "OaoDvObGyEr8wA"
$ApiKey       = "1b3e5c0715f2a1140fecdbfba3f57186"

$Headers = @{ Authorization = $ApiKey }
$Endpoint = "https://secure.yoprint.com/v2/api/store/$TeamId/v2/sales_order/$SalesOrderId"

Write-Host "`nFetching full sales order/quote details for ID $SalesOrderId ..." -ForegroundColor Cyan

try {
    $Response = Invoke-RestMethod -Method GET -Uri $Endpoint -Headers $Headers -ErrorAction Stop
    $Data = $Response.data

    Write-Host "`n--- General Info ---" -ForegroundColor Yellow
    $Data | Select-Object id, name, @{n='Customer';e={$_.customer.name}},
        @{n='IsQuote';e={$_.is_quote}}, @{n='Status';e={$_.status.label}},
        created_at, updated_at | Format-Table -AutoSize

    # Assigned contact
    $AssignedContactId = $Data.customer_contact_id
    $AssignedContact = $Data.customer.contacts | Where-Object { $_.id -eq $AssignedContactId }

    Write-Host "`n--- Assigned Contact ---" -ForegroundColor Yellow
    if ($AssignedContact) {
        $AssignedContact | Select-Object id,
            @{n='Name';e={"$($_.first_name) $($_.last_name)".Trim()}},
            email, phone, is_primary, updated_at | Format-Table -AutoSize
    } else {
        Write-Host "No assigned contact found for ID $AssignedContactId" -ForegroundColor DarkYellow
    }

    Write-Host "`n--- Financials ---" -ForegroundColor Yellow
    $Data | Select-Object calc_subtotal, calc_tax, calc_discount,
        calc_total, deposit_total, paid_amount, full_amount_due | Format-Table -AutoSize

    Write-Host "`n--- Shipping / Addresses ---" -ForegroundColor Yellow
    $Data.shipping_address | Select-Object label, address1, city, state, country, postcode | Format-Table -AutoSize

    Write-Host "`n--- Jobs ---" -ForegroundColor Yellow
    $Data.jobs | Select-Object id, name, status, quantity, price | Format-Table -AutoSize

    Write-Host "`n--- Grouped PDFs ---" -ForegroundColor Yellow
    foreach ($group in $Data.grouped_pdf) {
        Write-Host "`n$($group.label):" -ForegroundColor Green
        $group.documents | Select-Object label, description, url | Format-Table -AutoSize
    }

    Write-Host "`n✅ Display complete." -ForegroundColor Green
}
catch {
    Write-Host "`n❌ Failed to retrieve or display data." -ForegroundColor Red
    Write-Host "Error Message: $($_.Exception.Message)" -ForegroundColor DarkRed
}
