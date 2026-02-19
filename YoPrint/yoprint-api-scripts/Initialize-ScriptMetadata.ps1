# Initialize-ScriptMetadata.ps1
# Scans all API script folders and creates yoprint-scripts.json metadata file

$basePath = $PSScriptRoot
$methods = @("GET", "POST", "PUT", "PATCH", "DEL")

# Known test status from CLAUDE-NOTES.md
$testedScripts = @(
    "Get-Services", "Get-Vendors", "Get-Tags", "Get-Statuses", "Get-OrderDetails",
    "Get-SalesOrderComments", "Get-CustomerContacts", "Get-VendorContacts",
    "Get-CSVJobs", "Get-CustomerAddresses",
    "Search-SalesOrders", "Search-Customers", "Search-Products", "Global-Search",
    "Lookup-OrderByNumber", "Add-CustomerContact", "Add-CustomerAddress", "Add-SalesOrderComment"
)
$brokenScripts = @("Get-JobComments", "Add-JobComment")

# Category mapping based on script noun
$categoryMap = @{
    "Order"      = "orders"
    "SalesOrder" = "orders"
    "Customer"   = "customers"
    "Vendor"     = "vendors"
    "Product"    = "products"
    "Job"        = "jobs"
    "Comment"    = "comments"
    "Service"    = "services"
    "Payment"    = "settings"
    "Tax"        = "settings"
    "Shipping"   = "settings"
    "Status"     = "settings"
    "Pipeline"   = "settings"
    "Location"   = "settings"
    "Currency"   = "settings"
    "Adjustment" = "settings"
    "Shipment"   = "settings"
    "Running"    = "settings"
    "Connected"  = "settings"
    "Message"    = "settings"
    "Tag"        = "settings"
    "User"       = "users"
    "Team"       = "team"
    "Feed"       = "activity"
    "Webhook"    = "webhooks"
    "Approval"   = "approvals"
    "Search"     = "search"
    "Global"     = "search"
    "Lookup"     = "search"
    "Decode"     = "utilities"
    "Calc"       = "utilities"
    "Import"     = "utilities"
    "Export"     = "utilities"
    "CSV"        = "utilities"
    "Validate"   = "utilities"
    "Async"      = "utilities"
    "Upload"     = "team"
    "Clone"      = "services"
    "Square"     = "team"
    "Feature"    = "team"
    "Available"  = "utilities"
    "Preview"    = "settings"
    "Compile"    = "settings"
    "Purchase"   = "purchase_orders"
}

function Get-ScriptCategory {
    param([string]$Name)

    foreach ($key in $categoryMap.Keys) {
        if ($Name -like "*$key*") {
            return $categoryMap[$key]
        }
    }
    return "other"
}

function Get-ApiVersionFromContent {
    param([string]$Content)

    if ($Content -match '/v2/') { return "v2" }
    if ($Content -match '/v1/') { return "v1" }
    if ($Content -match '/api/') { return "no-version" }
    return "unknown"
}

function Get-EndpointFromContent {
    param([string]$Content)

    if ($Content -match 'https://secure\.yoprint\.com(/[^"''`\s]+)') {
        return $matches[1] -replace '\$teamSlug', '{slug}' -replace '\$\([^)]+\)', '{param}'
    }
    return "unknown"
}

function Test-HasReadHost {
    param([string]$Content)
    return $Content -match 'Read-Host'
}

function Get-DescriptionFromContent {
    param([string]$Content, [string]$Name)

    $lines = $Content -split "`n"
    foreach ($line in $lines) {
        if ($line -match 'Write-Host\s+"?\s*(.+?)\s*"?\s+-ForegroundColor\s+Gray') {
            $desc = $matches[1] -replace '^\s+', '' -replace '\s+$', ''
            if ($desc.Length -gt 5 -and $desc -notmatch 'Examples?:' -and $desc -notmatch '^\s*$') {
                return $desc
            }
        }
    }

    # Fallback: generate from name
    $verb = ($Name -split '-')[0]
    $noun = ($Name -split '-')[1]
    return "$verb $noun"
}

function Get-Complexity {
    param([string]$Method, [string]$Name, [bool]$HasReadHost)

    # DEL is always destructive
    if ($Method -eq "DEL") { return "destructive" }

    # PUT/PATCH that modifies data
    if ($Method -in @("PUT", "PATCH")) {
        if ($Name -match "^(Update|Set|Complete|Enable|Disable|Setup)") {
            return "destructive"
        }
    }

    # POST that creates/modifies (not search)
    if ($Method -eq "POST") {
        if ($Name -match "^(Add|Import|Upload|Send)") {
            return "destructive"
        }
    }

    # Has Read-Host means it needs input
    if ($HasReadHost) { return "medium" }

    return "simple"
}

function Get-ModifiesData {
    param([string]$Method, [string]$Name)

    if ($Method -eq "GET") { return $false }
    if ($Method -eq "DEL") { return $true }
    if ($Method -in @("PUT", "PATCH")) { return $true }

    # POST: search doesn't modify, Add/Import/Upload does
    if ($Method -eq "POST") {
        if ($Name -match "^(Search|Lookup|Global|Get|Calc|Decode|Validate|Preview|Compile)") {
            return $false
        }
        return $true
    }

    return $false
}

# Scan all scripts
$allScripts = @()
$index = 1

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "       INITIALIZING SCRIPT METADATA" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""

foreach ($method in $methods) {
    $methodPath = Join-Path $basePath $method

    if (Test-Path $methodPath) {
        $scripts = Get-ChildItem -Path $methodPath -Filter "*.ps1" | Sort-Object Name
        Write-Host "  Scanning $method folder... ($($scripts.Count) scripts)" -ForegroundColor Yellow

        foreach ($script in $scripts) {
            $name = $script.BaseName
            $content = Get-Content $script.FullName -Raw
            $hasReadHost = Test-HasReadHost $content

            # Determine test status
            $testStatus = "not_tested"
            $testDate = $null
            if ($testedScripts -contains $name) {
                $testStatus = "tested"
                $testDate = "2026-01-03"
            }
            elseif ($brokenScripts -contains $name) {
                $testStatus = "broken"
                $testDate = "2026-01-03"
            }

            $complexity = Get-Complexity $method $name $hasReadHost

            # Auto-mark destructive scripts as manual_required if not already tested
            if ($complexity -eq "destructive" -and $testStatus -eq "not_tested") {
                $testStatus = "manual_required"
            }

            $scriptInfo = [PSCustomObject]@{
                index = $index
                name = $name
                path = "$method/$($script.Name)"
                method = $method
                category = Get-ScriptCategory $name
                apiVersion = Get-ApiVersionFromContent $content
                endpoint = Get-EndpointFromContent $content
                description = Get-DescriptionFromContent $content $name
                complexity = $complexity
                requiresInput = $hasReadHost
                testStatus = $testStatus
                testDate = $testDate
                testNote = ""
                modifiesData = Get-ModifiesData $method $name
                favorite = $false
                sampleInputs = @{}
            }

            $allScripts += $scriptInfo
            $index++
        }
    }
}

# Create metadata object
$metadata = [PSCustomObject]@{
    version = "1.0"
    lastUpdated = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ssZ")
    scripts = $allScripts
}

# Save to JSON
$jsonPath = Join-Path $basePath "yoprint-scripts.json"
$metadata | ConvertTo-Json -Depth 10 | Out-File $jsonPath -Encoding utf8

# Summary
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Green
Write-Host "       INITIALIZATION COMPLETE" -ForegroundColor Green
Write-Host "  ============================================" -ForegroundColor Green
Write-Host ""
Write-Host "  Total Scripts:    $($allScripts.Count)" -ForegroundColor White

$stats = @{
    simple = ($allScripts | Where-Object { $_.complexity -eq "simple" }).Count
    medium = ($allScripts | Where-Object { $_.complexity -eq "medium" }).Count
    destructive = ($allScripts | Where-Object { $_.complexity -eq "destructive" }).Count
    tested = ($allScripts | Where-Object { $_.testStatus -eq "tested" }).Count
    broken = ($allScripts | Where-Object { $_.testStatus -eq "broken" }).Count
    manual = ($allScripts | Where-Object { $_.testStatus -eq "manual_required" }).Count
    untested = ($allScripts | Where-Object { $_.testStatus -eq "not_tested" }).Count
}

Write-Host ""
Write-Host "  BY COMPLEXITY:" -ForegroundColor Yellow
Write-Host "    Simple:      $($stats.simple) (auto-testable)" -ForegroundColor Green
Write-Host "    Medium:      $($stats.medium) (needs sample data)" -ForegroundColor Yellow
Write-Host "    Destructive: $($stats.destructive) (manual only)" -ForegroundColor Red
Write-Host ""
Write-Host "  BY STATUS:" -ForegroundColor Yellow
Write-Host "    Tested:          $($stats.tested)" -ForegroundColor Green
Write-Host "    Broken:          $($stats.broken)" -ForegroundColor Red
Write-Host "    Manual Required: $($stats.manual)" -ForegroundColor DarkYellow
Write-Host "    Not Tested:      $($stats.untested)" -ForegroundColor Gray
Write-Host ""
Write-Host "  Categories:" -ForegroundColor Yellow
$allScripts | Group-Object category | Sort-Object Count -Descending | ForEach-Object {
    Write-Host "    $($_.Name.PadRight(18)) $($_.Count)" -ForegroundColor White
}
Write-Host ""
Write-Host "  Output: yoprint-scripts.json" -ForegroundColor Cyan
Write-Host ""
