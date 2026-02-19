# YoPrint-Helpers.psm1
# Shared functions for YoPrint API script management

$script:MetadataPath = Join-Path $PSScriptRoot "yoprint-scripts.json"

function Get-YoPrintMetadata {
    <#
    .SYNOPSIS
    Reads the central yoprint-scripts.json metadata file
    #>
    if (-not (Test-Path $script:MetadataPath)) {
        return @{ version = "1.0"; lastUpdated = $null; scripts = @() }
    }
    $content = Get-Content $script:MetadataPath -Raw
    return $content | ConvertFrom-Json
}

function Save-YoPrintMetadata {
    <#
    .SYNOPSIS
    Saves metadata to yoprint-scripts.json
    #>
    param([Parameter(Mandatory)]$Metadata)

    $Metadata.lastUpdated = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ssZ")
    $json = $Metadata | ConvertTo-Json -Depth 10
    $json | Out-File $script:MetadataPath -Encoding utf8
}

function Get-ScriptInfo {
    <#
    .SYNOPSIS
    Gets metadata for a specific script by name
    #>
    param([Parameter(Mandatory)][string]$Name)

    $metadata = Get-YoPrintMetadata
    return $metadata.scripts | Where-Object { $_.name -eq $Name }
}

function Update-ScriptTestStatus {
    <#
    .SYNOPSIS
    Updates test status for a script
    #>
    param(
        [Parameter(Mandatory)][string]$Name,
        [Parameter(Mandatory)][ValidateSet("tested", "broken", "not_tested", "manual_required", "needs_improvement", "verified")][string]$Status,
        [string]$Note = ""
    )

    $metadata = Get-YoPrintMetadata
    $script = $metadata.scripts | Where-Object { $_.name -eq $Name }

    if ($script) {
        $script.testStatus = $Status
        $script.testDate = (Get-Date).ToString("yyyy-MM-dd")
        if ($Note) { $script.testNote = $Note }
        Save-YoPrintMetadata $metadata
        return $true
    }
    return $false
}

function Set-ScriptFavorite {
    <#
    .SYNOPSIS
    Toggles favorite status for a script
    #>
    param(
        [Parameter(Mandatory)][string]$Name,
        [bool]$Favorite = $true
    )

    $metadata = Get-YoPrintMetadata
    $script = $metadata.scripts | Where-Object { $_.name -eq $Name }

    if ($script) {
        $script.favorite = $Favorite
        Save-YoPrintMetadata $metadata
        return $true
    }
    return $false
}

function Get-ScriptsByCategory {
    <#
    .SYNOPSIS
    Returns all scripts in a category
    #>
    param([Parameter(Mandatory)][string]$Category)

    $metadata = Get-YoPrintMetadata
    return $metadata.scripts | Where-Object { $_.category -eq $Category }
}

function Get-ScriptsByStatus {
    <#
    .SYNOPSIS
    Returns all scripts with a given test status
    #>
    param([Parameter(Mandatory)][ValidateSet("tested", "broken", "not_tested", "manual_required", "needs_improvement", "verified")][string]$Status)

    $metadata = Get-YoPrintMetadata
    return $metadata.scripts | Where-Object { $_.testStatus -eq $Status }
}

function Get-ScriptsByComplexity {
    <#
    .SYNOPSIS
    Returns all scripts with a given complexity level
    #>
    param([Parameter(Mandatory)][ValidateSet("simple", "medium", "destructive")][string]$Complexity)

    $metadata = Get-YoPrintMetadata
    return $metadata.scripts | Where-Object { $_.complexity -eq $Complexity }
}

function Get-AllCategories {
    <#
    .SYNOPSIS
    Returns list of all categories with script counts
    #>
    $metadata = Get-YoPrintMetadata
    return $metadata.scripts | Group-Object category | Select-Object Name, Count | Sort-Object Name
}

function Get-TestStats {
    <#
    .SYNOPSIS
    Returns testing statistics
    #>
    $metadata = Get-YoPrintMetadata
    $total = $metadata.scripts.Count
    $verified = ($metadata.scripts | Where-Object { $_.testStatus -eq "verified" }).Count
    $tested = ($metadata.scripts | Where-Object { $_.testStatus -eq "tested" }).Count
    $broken = ($metadata.scripts | Where-Object { $_.testStatus -eq "broken" }).Count
    $manual = ($metadata.scripts | Where-Object { $_.testStatus -eq "manual_required" }).Count
    $needsImprovement = ($metadata.scripts | Where-Object { $_.testStatus -eq "needs_improvement" }).Count
    $untested = $total - $verified - $tested - $broken - $manual - $needsImprovement

    return [PSCustomObject]@{
        Total = $total
        Verified = $verified
        Tested = $tested
        Broken = $broken
        ManualRequired = $manual
        NeedsImprovement = $needsImprovement
        Untested = $untested
        PercentComplete = [math]::Round(($verified / $total) * 100, 1)
    }
}

function Update-ScriptSampleInput {
    <#
    .SYNOPSIS
    Stores sample input data for a script (for automated testing)
    #>
    param(
        [Parameter(Mandatory)][string]$Name,
        [Parameter(Mandatory)][hashtable]$Inputs
    )

    $metadata = Get-YoPrintMetadata
    $script = $metadata.scripts | Where-Object { $_.name -eq $Name }

    if ($script) {
        $script.sampleInputs = $Inputs
        Save-YoPrintMetadata $metadata
        return $true
    }
    return $false
}

function Search-Scripts {
    <#
    .SYNOPSIS
    Searches scripts by name (supports wildcards)
    #>
    param([Parameter(Mandatory)][string]$Pattern)

    $metadata = Get-YoPrintMetadata
    return $metadata.scripts | Where-Object { $_.name -like "*$Pattern*" }
}

function Get-FavoriteScripts {
    <#
    .SYNOPSIS
    Returns all favorited scripts
    #>
    $metadata = Get-YoPrintMetadata
    return $metadata.scripts | Where-Object { $_.favorite -eq $true }
}

# ============================================
# SMART WORKFLOW FUNCTIONS
# Search, select, and confirm patterns
# ============================================

$script:TeamSlug = if ($env:YOPRINT_TEAM_SLUG) { $env:YOPRINT_TEAM_SLUG } else { "hub-city-design-inc" }

function Set-YoPrintTeamSlug {
    <#
    .SYNOPSIS
    Sets the team slug used for API requests
    #>
    param(
        [Parameter(Mandatory)]
        [string]$TeamSlug
    )

    $script:TeamSlug = $TeamSlug
}

function Get-YoPrintTeamSlug {
    <#
    .SYNOPSIS
    Returns the current team slug used for API requests
    #>
    return $script:TeamSlug
}

function Get-YoPrintHeaders {
    <#
    .SYNOPSIS
    Returns standard API headers with auth
    #>
    return @{
        "Authorization" = $env:YOPRINT_API_KEY
        "Content-Type" = "application/json"
    }
}

function Search-YoPrintEntity {
    <#
    .SYNOPSIS
    Search for customers, vendors, or orders by name
    .PARAMETER Type
    Entity type: customer, vendor, order
    .PARAMETER Term
    Search term (partial match supported)
    #>
    param(
        [Parameter(Mandatory)]
        [ValidateSet("customer", "vendor", "order")]
        [string]$Type,

        [Parameter(Mandatory)]
        [string]$Term
    )

    $headers = Get-YoPrintHeaders

    try {
        switch ($Type) {
            "customer" {
                $body = @{ name = $Term } | ConvertTo-Json
                $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$script:TeamSlug/customer/search" `
                    -Headers $headers -Method Post -Body $body
                return $response.data
            }
            "vendor" {
                $body = @{ name = $Term } | ConvertTo-Json
                $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$script:TeamSlug/vendor/search" `
                    -Headers $headers -Method Post -Body $body
                return $response.data
            }
            "order" {
                $body = @{ id = $Term; type = "order" } | ConvertTo-Json
                $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$script:TeamSlug/scoped_id_search" `
                    -Headers $headers -Method Post -Body $body
                return $response.data
            }
        }
    }
    catch {
        Write-Host "  ERROR: Search failed - $($_.Exception.Message)" -ForegroundColor Red
        return @()
    }
}

function Show-NumberedList {
    <#
    .SYNOPSIS
    Display items as a numbered list with formatted columns
    .PARAMETER Items
    Array of objects to display
    .PARAMETER Properties
    Hashtable of property name to display label: @{name="Name"; email="Email"}
    .PARAMETER Title
    Optional header title
    #>
    param(
        [Parameter(Mandatory)]
        [array]$Items,

        [Parameter(Mandatory)]
        [hashtable]$Properties,

        [string]$Title = ""
    )

    if ($Title) {
        Write-Host ""
        Write-Host "  $Title" -ForegroundColor Yellow
        Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    }

    if ($Items.Count -eq 0) {
        Write-Host "  No results found." -ForegroundColor DarkYellow
        return
    }

    Write-Host ""
    $i = 1
    foreach ($item in $Items) {
        Write-Host "  [" -NoNewline -ForegroundColor DarkGray
        Write-Host "$i" -NoNewline -ForegroundColor Cyan
        Write-Host "] " -NoNewline -ForegroundColor DarkGray

        $first = $true
        foreach ($prop in $Properties.Keys) {
            $value = $item.$prop
            if ($value) {
                if (-not $first) { Write-Host " | " -NoNewline -ForegroundColor DarkGray }
                Write-Host "$value" -NoNewline -ForegroundColor White
                $first = $false
            }
        }
        Write-Host ""
        $i++
    }
    Write-Host ""
}

function Get-UserSelection {
    <#
    .SYNOPSIS
    Prompt user to pick from a numbered list
    .PARAMETER Items
    Array of items to select from
    .PARAMETER Prompt
    The prompt text to display
    .PARAMETER AllowCancel
    If true, allows 0 or 'q' to cancel
    #>
    param(
        [Parameter(Mandatory)]
        [array]$Items,

        [string]$Prompt = "Pick one",

        [bool]$AllowCancel = $true
    )

    if ($Items.Count -eq 0) {
        return $null
    }

    $max = $Items.Count
    $cancelText = if ($AllowCancel) { ", 0=cancel" } else { "" }

    while ($true) {
        $input = Read-Host "  $Prompt (1-$max$cancelText)"

        if ($AllowCancel -and ($input -eq "0" -or $input -eq "q" -or $input -eq "")) {
            return $null
        }

        $num = 0
        if ([int]::TryParse($input, [ref]$num)) {
            if ($num -ge 1 -and $num -le $max) {
                return $Items[$num - 1]
            }
        }

        Write-Host "  Invalid selection. Enter 1-$max." -ForegroundColor Red
    }
}

function Confirm-Deletion {
    <#
    .SYNOPSIS
    Show entity details and require typing DELETE to confirm
    .PARAMETER Entity
    The entity object to be deleted
    .PARAMETER EntityType
    Human-readable type name (Contact, Vendor, etc.)
    .PARAMETER DisplayProperties
    Hashtable of properties to display
    #>
    param(
        [Parameter(Mandatory)]
        $Entity,

        [Parameter(Mandatory)]
        [string]$EntityType,

        [hashtable]$DisplayProperties = @{}
    )

    Write-Host ""
    Write-Host "  ============================================" -ForegroundColor Red
    Write-Host "       CONFIRM DELETION" -ForegroundColor Red
    Write-Host "  ============================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "  You are about to delete this $EntityType:" -ForegroundColor Yellow
    Write-Host ""

    foreach ($prop in $DisplayProperties.Keys) {
        $label = $DisplayProperties[$prop]
        $value = $Entity.$prop
        if ($value) {
            Write-Host "    $($label): " -NoNewline -ForegroundColor Gray
            Write-Host "$value" -ForegroundColor White
        }
    }

    Write-Host ""
    Write-Host "  WARNING: This action cannot be undone!" -ForegroundColor Red
    Write-Host ""

    $confirm = Read-Host "  Type DELETE to confirm"

    if ($confirm -eq "DELETE") {
        return $true
    }

    Write-Host ""
    Write-Host "  Cancelled." -ForegroundColor Yellow
    return $false
}

function Get-EntityContacts {
    <#
    .SYNOPSIS
    Fetch all contacts for a customer or vendor
    .PARAMETER EntityType
    customer or vendor
    .PARAMETER EntityId
    UUID of the customer or vendor
    #>
    param(
        [Parameter(Mandatory)]
        [ValidateSet("customer", "vendor")]
        [string]$EntityType,

        [Parameter(Mandatory)]
        [string]$EntityId
    )

    $headers = Get-YoPrintHeaders

    try {
        $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$script:TeamSlug/$EntityType/$EntityId/contact" `
            -Headers $headers -Method Get
        return $response.data
    }
    catch {
        Write-Host "  ERROR: Failed to fetch contacts - $($_.Exception.Message)" -ForegroundColor Red
        return @()
    }
}

function Get-EntityAddresses {
    <#
    .SYNOPSIS
    Fetch all addresses for a customer
    .PARAMETER CustomerId
    UUID of the customer
    #>
    param(
        [Parameter(Mandatory)]
        [string]$CustomerId
    )

    $headers = Get-YoPrintHeaders

    try {
        $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$script:TeamSlug/customer/$CustomerId/address" `
            -Headers $headers -Method Get
        return $response.data
    }
    catch {
        Write-Host "  ERROR: Failed to fetch addresses - $($_.Exception.Message)" -ForegroundColor Red
        return @()
    }
}

function Show-Header {
    <#
    .SYNOPSIS
    Display standard script header
    #>
    param(
        [Parameter(Mandatory)]
        [string]$Title,

        [string]$Description = "",

        [string]$Color = "Cyan"
    )

    Clear-Host
    Write-Host ""
    Write-Host "  ============================================" -ForegroundColor $Color
    Write-Host "       $Title" -ForegroundColor $Color
    Write-Host "  ============================================" -ForegroundColor $Color
    Write-Host ""
    if ($Description) {
        Write-Host "  $Description" -ForegroundColor Gray
        Write-Host ""
    }
}

function Format-ScopedId {
    <#
    .SYNOPSIS
    Auto-add prefix to scoped IDs if missing (SO, PO, Q, INV, SH)
    .PARAMETER Input
    The user input (e.g., "1234" or "SO1234")
    .PARAMETER Type
    The type: order, purchase_order, quote, invoice, shipment
    #>
    param(
        [Parameter(Mandatory)]
        [string]$Input,

        [Parameter(Mandatory)]
        [ValidateSet("order", "purchase_order", "quote", "invoice", "shipment")]
        [string]$Type
    )

    $input = $Input.Trim().ToUpper()

    $prefixes = @{
        "order" = "SO"
        "purchase_order" = "PO"
        "quote" = "Q"
        "invoice" = "INV"
        "shipment" = "SH"
    }

    $prefix = $prefixes[$Type]

    # If input is just digits, add the prefix
    if ($input -match '^\d+$') {
        return "$prefix$input"
    }

    # If input already has the right prefix, return as-is
    if ($input -match "^$prefix\d+$") {
        return $input
    }

    # Otherwise return as-is (might be wrong prefix or UUID)
    return $input
}

function Resolve-OrderId {
    <#
    .SYNOPSIS
    Convert scoped ID (SO1234) to UUID via API lookup
    .PARAMETER ScopedId
    The scoped ID (e.g., "SO1234" or just "1234")
    .PARAMETER Type
    The type: order, purchase_order, quote
    #>
    param(
        [Parameter(Mandatory)]
        [string]$ScopedId,

        [ValidateSet("order", "purchase_order", "quote")]
        [string]$Type = "order"
    )

    $headers = Get-YoPrintHeaders
    $formatted = Format-ScopedId -Input $ScopedId -Type $Type
    $body = @{ type = $Type; scoped_id = $formatted } | ConvertTo-Json

    try {
        $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$script:TeamSlug/global/scoped_id_search" `
            -Headers $headers -Method Post -Body $body

        # Filter for exact match (API returns fuzzy results)
        $exact = $response.data | Where-Object { $_.scoped_id -eq $formatted }
        if ($exact) {
            return $exact
        }
        return $response.data | Select-Object -First 1
    }
    catch {
        Write-Host "  ERROR: Could not find $Type '$formatted'" -ForegroundColor Red
        return $null
    }
}

# Export functions
Export-ModuleMember -Function @(
    # Metadata functions
    'Get-YoPrintMetadata',
    'Save-YoPrintMetadata',
    'Get-ScriptInfo',
    'Update-ScriptTestStatus',
    'Set-ScriptFavorite',
    'Get-ScriptsByCategory',
    'Get-ScriptsByStatus',
    'Get-ScriptsByComplexity',
    'Get-AllCategories',
    'Get-TestStats',
    'Update-ScriptSampleInput',
    'Search-Scripts',
    'Get-FavoriteScripts',
    # Smart workflow functions
    'Set-YoPrintTeamSlug',
    'Get-YoPrintTeamSlug',
    'Get-YoPrintHeaders',
    'Search-YoPrintEntity',
    'Show-NumberedList',
    'Get-UserSelection',
    'Confirm-Deletion',
    'Get-EntityContacts',
    'Get-EntityAddresses',
    'Show-Header',
    'Format-ScopedId',
    'Resolve-OrderId'
)
