# Add-CustomerContact.ps1
# Add a new contact to a customer with smart search workflow

# Import helper module
$modulePath = Join-Path $PSScriptRoot "..\YoPrint-Helpers.psm1"
Import-Module $modulePath -Force

$teamSlug = "hub-city-design-inc"

# Show header
Show-Header -Title "ADD CUSTOMER CONTACT" -Description "Search for a customer, then add a new contact."

# Step 1: Search for customer
$searchTerm = Read-Host "  Search customer by name"

if ([string]::IsNullOrWhiteSpace($searchTerm)) {
    Write-Host ""
    Write-Host "  Cancelled." -ForegroundColor Yellow
    Write-Host ""
    exit
}

Write-Host ""
Write-Host "  Searching..." -ForegroundColor Yellow

$results = Search-YoPrintEntity -Type "customer" -Term $searchTerm

if ($results.Count -eq 0) {
    Write-Host ""
    Write-Host "  No customers found matching '$searchTerm'" -ForegroundColor DarkYellow
    Write-Host ""
    exit
}

# Step 2: Display and select customer
Show-NumberedList -Items $results -Properties @{ name = "Name"; email = "Email" } -Title "SEARCH RESULTS"

$customer = Get-UserSelection -Items $results -Prompt "Select customer"

if (-not $customer) {
    Write-Host ""
    Write-Host "  Cancelled." -ForegroundColor Yellow
    Write-Host ""
    exit
}

# Step 3: Show existing contacts (for context)
Write-Host ""
Write-Host "  Loading existing contacts for $($customer.name)..." -ForegroundColor Yellow

$existingContacts = Get-EntityContacts -EntityType "customer" -EntityId $customer.id

if ($existingContacts.Count -gt 0) {
    Write-Host ""
    Write-Host "  EXISTING CONTACTS:" -ForegroundColor DarkGray
    foreach ($c in $existingContacts) {
        $name = "$($c.first_name) $($c.last_name)".Trim()
        $primary = if ($c.is_primary) { " (PRIMARY)" } else { "" }
        Write-Host "    - $name$primary" -ForegroundColor Gray
    }
}

# Step 4: Enter new contact details
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host "       NEW CONTACT FOR: $($customer.name.ToUpper())" -ForegroundColor Yellow
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host ""

$firstName = Read-Host "  First Name"
$lastName = Read-Host "  Last Name"
$email = Read-Host "  Email"
$phone = Read-Host "  Phone"

Write-Host ""
Write-Host "  Make this the primary contact? (y/n): " -NoNewline
$primaryChoice = Read-Host
Write-Host "  Send invoices to this contact? (y/n): " -NoNewline
$invoiceChoice = Read-Host
Write-Host "  Receive SMS notifications? (y/n): " -NoNewline
$smsChoice = Read-Host

# Validate required fields
if ([string]::IsNullOrWhiteSpace($firstName) -and [string]::IsNullOrWhiteSpace($lastName)) {
    Write-Host ""
    Write-Host "  ERROR: First name or last name is required." -ForegroundColor Red
    Write-Host ""
    exit
}

# Step 5: Create contact
Write-Host ""
Write-Host "  Creating contact..." -ForegroundColor Yellow

$headers = Get-YoPrintHeaders

$body = @{
    customer_id = $customer.id
    first_name = $firstName
    last_name = $lastName
    email = $email
    phone = $phone
    is_primary = ($primaryChoice -eq "y" -or $primaryChoice -eq "Y")
    send_invoice = ($invoiceChoice -eq "y" -or $invoiceChoice -eq "Y")
    default_receive_sms = ($smsChoice -eq "y" -or $smsChoice -eq "Y")
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/customer/$($customer.id)/contact" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  ============================================" -ForegroundColor Green
    Write-Host "       CONTACT ADDED" -ForegroundColor Green
    Write-Host "  ============================================" -ForegroundColor Green
    Write-Host ""

    $newContact = $response.data
    $displayName = "$($newContact.first_name) $($newContact.last_name)".Trim()
    Write-Host "    Customer: $($customer.name)" -ForegroundColor White
    Write-Host "    Contact:  $displayName" -ForegroundColor White
    if ($newContact.email) { Write-Host "    Email:    $($newContact.email)" -ForegroundColor White }
    if ($newContact.phone) { Write-Host "    Phone:    $($newContact.phone)" -ForegroundColor White }
    if ($newContact.is_primary) { Write-Host "    Primary:  Yes" -ForegroundColor Green }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
