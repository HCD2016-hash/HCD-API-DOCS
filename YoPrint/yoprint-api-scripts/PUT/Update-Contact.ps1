# Update-Contact.ps1
# Update a contact with smart search workflow

# Import helper module
$modulePath = Join-Path $PSScriptRoot "..\YoPrint-Helpers.psm1"
Import-Module $modulePath -Force

$teamSlug = "hub-city-design-inc"

# Show header
Show-Header -Title "UPDATE CONTACT" -Description "Search for a customer or vendor, then select a contact to update."

# Step 1: Choose entity type
Write-Host "  What type of contact?" -ForegroundColor Yellow
Write-Host ""
Write-Host "  [1] Customer contact" -ForegroundColor White
Write-Host "  [2] Vendor contact" -ForegroundColor White
Write-Host ""

$typeChoice = Read-Host "  Select (1 or 2)"
if ($typeChoice -ne "1" -and $typeChoice -ne "2") {
    Write-Host ""
    Write-Host "  Cancelled." -ForegroundColor Yellow
    Write-Host ""
    exit
}

$entityType = if ($typeChoice -eq "1") { "customer" } else { "vendor" }
$entityLabel = if ($typeChoice -eq "1") { "Customer" } else { "Vendor" }

# Step 2: Search for the parent entity
Write-Host ""
$searchTerm = Read-Host "  Search $entityLabel by name"

if ([string]::IsNullOrWhiteSpace($searchTerm)) {
    Write-Host ""
    Write-Host "  Cancelled." -ForegroundColor Yellow
    Write-Host ""
    exit
}

Write-Host ""
Write-Host "  Searching..." -ForegroundColor Yellow

$results = Search-YoPrintEntity -Type $entityType -Term $searchTerm

if ($results.Count -eq 0) {
    Write-Host ""
    Write-Host "  No ${entityLabel}s found matching '$searchTerm'" -ForegroundColor DarkYellow
    Write-Host ""
    exit
}

# Step 3: Display and select parent
Show-NumberedList -Items $results -Properties @{ name = "Name"; email = "Email" } -Title "SEARCH RESULTS"

$parent = Get-UserSelection -Items $results -Prompt "Select $entityLabel"

if (-not $parent) {
    Write-Host ""
    Write-Host "  Cancelled." -ForegroundColor Yellow
    Write-Host ""
    exit
}

# Step 4: Fetch contacts for selected parent
Write-Host ""
Write-Host "  Loading contacts for $($parent.name)..." -ForegroundColor Yellow

$contacts = Get-EntityContacts -EntityType $entityType -EntityId $parent.id

if ($contacts.Count -eq 0) {
    Write-Host ""
    Write-Host "  No contacts found for this $entityLabel." -ForegroundColor DarkYellow
    Write-Host ""
    exit
}

# Step 5: Display and select contact
$contactList = $contacts | ForEach-Object {
    $name = "$($_.first_name) $($_.last_name)".Trim()
    $primary = if ($_.is_primary) { " (PRIMARY)" } else { "" }
    [PSCustomObject]@{
        id = $_.id
        display_name = "$name$primary"
        email = $_.email
        phone = $_.phone
        first_name = $_.first_name
        last_name = $_.last_name
        is_primary = $_.is_primary
        send_invoice = $_.send_invoice
        default_receive_sms = $_.default_receive_sms
    }
}

Show-NumberedList -Items $contactList -Properties @{ display_name = "Name"; email = "Email"; phone = "Phone" } -Title "CONTACTS FOR $($parent.name.ToUpper())"

$contact = Get-UserSelection -Items $contactList -Prompt "Select contact to UPDATE"

if (-not $contact) {
    Write-Host ""
    Write-Host "  Cancelled." -ForegroundColor Yellow
    Write-Host ""
    exit
}

# Step 6: Show current values and prompt for updates
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host "       CURRENT CONTACT DETAILS" -ForegroundColor Yellow
Write-Host "  ============================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "    First Name: $($contact.first_name)" -ForegroundColor White
Write-Host "    Last Name:  $($contact.last_name)" -ForegroundColor White
Write-Host "    Email:      $($contact.email)" -ForegroundColor White
Write-Host "    Phone:      $($contact.phone)" -ForegroundColor White
Write-Host "    Invoices:   $(if ($contact.send_invoice) { 'Yes' } else { 'No' })" -ForegroundColor White
Write-Host "    SMS:        $(if ($contact.default_receive_sms) { 'Yes' } else { 'No' })" -ForegroundColor White
Write-Host ""
Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
Write-Host "  Leave blank to keep current value" -ForegroundColor Gray
Write-Host ""

$firstName = Read-Host "  New First Name"
$lastName = Read-Host "  New Last Name"
$email = Read-Host "  New Email"
$phone = Read-Host "  New Phone"

Write-Host ""
Write-Host "  Send invoices to this contact? (y/n/blank=keep): " -NoNewline
$invoiceChoice = Read-Host
Write-Host "  Receive SMS notifications? (y/n/blank=keep): " -NoNewline
$smsChoice = Read-Host

# Build update body
$body = @{ id = $contact.id }
if ($firstName) { $body.first_name = $firstName }
if ($lastName) { $body.last_name = $lastName }
if ($email) { $body.email = $email }
if ($phone) { $body.phone = $phone }
if ($invoiceChoice -eq "y") { $body.send_invoice = $true }
if ($invoiceChoice -eq "n") { $body.send_invoice = $false }
if ($smsChoice -eq "y") { $body.default_receive_sms = $true }
if ($smsChoice -eq "n") { $body.default_receive_sms = $false }

# Check if any changes
if ($body.Keys.Count -eq 1) {
    Write-Host ""
    Write-Host "  No changes made." -ForegroundColor Yellow
    Write-Host ""
    exit
}

# Step 7: Execute update
Write-Host ""
Write-Host "  Updating contact..." -ForegroundColor Yellow

$headers = Get-YoPrintHeaders
$jsonBody = $body | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/contact/$($contact.id)" -Headers $headers -Method Put -Body $jsonBody

    Write-Host ""
    Write-Host "  ============================================" -ForegroundColor Green
    Write-Host "       CONTACT UPDATED" -ForegroundColor Green
    Write-Host "  ============================================" -ForegroundColor Green
    Write-Host ""

    $updated = $response.data
    Write-Host "    Name:  $($updated.first_name) $($updated.last_name)" -ForegroundColor White
    if ($updated.email) { Write-Host "    Email: $($updated.email)" -ForegroundColor White }
    if ($updated.phone) { Write-Host "    Phone: $($updated.phone)" -ForegroundColor White }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
