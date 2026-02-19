# Remove-Contact.ps1
# Delete a contact with smart search workflow

# Import helper module
$modulePath = Join-Path $PSScriptRoot "..\YoPrint-Helpers.psm1"
Import-Module $modulePath -Force

$teamSlug = "hub-city-design-inc"

# Show header
Show-Header -Title "DELETE CONTACT" -Description "Search for a customer or vendor, then select a contact to delete." -Color "Red"

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
    }
}

Show-NumberedList -Items $contactList -Properties @{ display_name = "Name"; email = "Email"; phone = "Phone" } -Title "CONTACTS FOR $($parent.name.ToUpper())"

$contact = Get-UserSelection -Items $contactList -Prompt "Select contact to DELETE"

if (-not $contact) {
    Write-Host ""
    Write-Host "  Cancelled." -ForegroundColor Yellow
    Write-Host ""
    exit
}

# Step 6: Confirm deletion with full details
$confirmed = Confirm-Deletion -Entity $contact -EntityType "Contact" -DisplayProperties @{
    display_name = "Name"
    email = "Email"
    phone = "Phone"
    id = "ID"
}

if (-not $confirmed) {
    Write-Host ""
    exit
}

# Step 7: Execute deletion
Write-Host ""
Write-Host "  Deleting contact..." -ForegroundColor Yellow

$headers = Get-YoPrintHeaders

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/contact/$($contact.id)" -Headers $headers -Method Delete

    Write-Host ""
    Write-Host "  ============================================" -ForegroundColor Green
    Write-Host "       CONTACT DELETED" -ForegroundColor Green
    Write-Host "  ============================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "    $($contact.display_name) has been removed." -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
