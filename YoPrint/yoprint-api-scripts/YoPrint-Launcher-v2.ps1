# YoPrint-Launcher-v2.ps1
# Enhanced API Console with search, categories, and test tracking

# Force UTF-8 encoding for box-drawing characters
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
chcp 65001 | Out-Null

$basePath = $PSScriptRoot
$jsonPath = Join-Path $basePath "yoprint-scripts.json"

# Import helper module
$modulePath = Join-Path $basePath "YoPrint-Helpers.psm1"
if (Test-Path $modulePath) {
    Import-Module $modulePath -Force
}

function Get-Metadata {
    if (-not (Test-Path $jsonPath)) {
        Write-Host "  ERROR: yoprint-scripts.json not found." -ForegroundColor Red
        Write-Host "  Run Initialize-ScriptMetadata.ps1 first." -ForegroundColor Yellow
        Read-Host "  Press Enter to exit"
        exit 1
    }
    return Get-Content $jsonPath -Raw | ConvertFrom-Json
}

function Save-Metadata {
    param($Metadata)
    $Metadata.lastUpdated = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ssZ")
    $Metadata | ConvertTo-Json -Depth 10 | Out-File $jsonPath -Encoding utf8
}

function Select-Option {
    param(
        [string]$Prompt,
        [string[]]$Options,
        [int]$Default = 0
    )

    $selected = $Default

    # Build the full line width for clearing
    $lineWidth = $Host.UI.RawUI.WindowSize.Width

    # Hide cursor during selection
    [Console]::CursorVisible = $false

    try {
        while ($true) {
            # Build the display string
            $display = "  $Prompt "
            for ($i = 0; $i -lt $Options.Count; $i++) {
                if ($i -eq $selected) {
                    $display += " [$($Options[$i])] "
                } else {
                    $display += "  $($Options[$i])  "
                }
            }

            # Clear line and write using carriage return
            Write-Host ("`r" + (" " * ($lineWidth - 1)) + "`r") -NoNewline
            Write-Host "  $Prompt " -NoNewline -ForegroundColor White

            # Display options with highlighting
            for ($i = 0; $i -lt $Options.Count; $i++) {
                if ($i -eq $selected) {
                    Write-Host " [$($Options[$i])] " -NoNewline -ForegroundColor Black -BackgroundColor White
                } else {
                    Write-Host "  $($Options[$i])  " -NoNewline -ForegroundColor Gray
                }
            }

            # Read key
            $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

            switch ($key.VirtualKeyCode) {
                37 { $selected = [Math]::Max(0, $selected - 1) }  # Left arrow
                39 { $selected = [Math]::Min($Options.Count - 1, $selected + 1) }  # Right arrow
                38 { $selected = [Math]::Max(0, $selected - 1) }  # Up arrow
                40 { $selected = [Math]::Min($Options.Count - 1, $selected + 1) }  # Down arrow
                13 {
                    Write-Host ""  # Move to next line after selection
                    return $Options[$selected]
                }
                27 {
                    Write-Host ""  # Move to next line on escape
                    return $null
                }
            }
        }
    }
    finally {
        [Console]::CursorVisible = $true
    }
}

function Get-StatusBadge {
    param([string]$Status)
    switch ($Status) {
        "verified" { return "[+]", "Green" }
        "tested" { return "[?]", "Yellow" }
        "broken" { return "[X]", "Red" }
        "manual_required" { return "[M]", "DarkYellow" }
        "needs_improvement" { return "[~]", "Cyan" }
        default { return "[ ]", "Gray" }
    }
}

function Get-MethodColor {
    param([string]$Method)
    switch ($Method) {
        "GET" { return "Green" }
        "POST" { return "Yellow" }
        "PUT" { return "DarkYellow" }
        "PATCH" { return "Magenta" }
        "DEL" { return "Red" }
        default { return "White" }
    }
}

function Show-Header {
    param($Stats)
    Clear-Host

    # Display HCD logo from pre-generated ANSI art file
    $logoPath = Join-Path $PSScriptRoot "hcd-logo.ans"
    if (Test-Path $logoPath) {
        # Write logo without extra trailing newline
        $logo = Get-Content $logoPath -Raw
        Write-Host $logo.TrimEnd()
    }

    Write-Host "                      " -NoNewline
    Write-Host "---" -ForegroundColor DarkGray -NoNewline
    Write-Host " YOPRINT API v2 " -ForegroundColor White -NoNewline
    Write-Host "---" -ForegroundColor DarkGray
    Write-Host "                        " -NoNewline
    Write-Host "Lubbock, Texas" -ForegroundColor DarkGray

    $pct = [math]::Round(($Stats.Verified / $Stats.Total) * 100, 0)
    Write-Host "  Stats: " -NoNewline -ForegroundColor White
    Write-Host "$($Stats.Total) total" -NoNewline -ForegroundColor White
    Write-Host " | " -NoNewline -ForegroundColor DarkGray
    Write-Host "$($Stats.Verified) [+]" -NoNewline -ForegroundColor Green
    if ($Stats.Tested -gt 0) {
        Write-Host " | " -NoNewline -ForegroundColor DarkGray
        Write-Host "$($Stats.Tested) [?]" -NoNewline -ForegroundColor Yellow
    }
    Write-Host " | " -NoNewline -ForegroundColor DarkGray
    Write-Host "$($Stats.Broken) [X]" -NoNewline -ForegroundColor Red
    if ($Stats.NeedsImprovement -gt 0) {
        Write-Host " | " -NoNewline -ForegroundColor DarkGray
        Write-Host "$($Stats.NeedsImprovement) [~]" -NoNewline -ForegroundColor Cyan
    }
    Write-Host " | " -NoNewline -ForegroundColor DarkGray
    Write-Host "$($Stats.Untested) [ ]" -ForegroundColor Gray
    Write-Host ""
}

function Show-CategoryView {
    param($Scripts, [string]$Filter = "", [string]$StatusFilter = "all")

    # Apply filters
    $filtered = $Scripts
    if ($Filter) {
        $filtered = $filtered | Where-Object { $_.name -like "*$Filter*" }
    }
    if ($StatusFilter -ne "all") {
        $filtered = $filtered | Where-Object { $_.testStatus -eq $StatusFilter }
    }

    # Group by category
    $categories = $filtered | Group-Object category | Sort-Object Name

    if ($categories.Count -eq 0) {
        Write-Host "  No scripts match the filter." -ForegroundColor Yellow
        return
    }

    foreach ($cat in $categories) {
        $catName = $cat.Name.ToUpper()
        $catTested = ($cat.Group | Where-Object { $_.testStatus -eq "tested" }).Count
        $catTotal = $cat.Count

        Write-Host "  +-- $catName ($catTested/$catTotal) " -ForegroundColor Cyan -NoNewline
        Write-Host ("-" * (50 - $catName.Length)) -ForegroundColor DarkGray
        Write-Host "  |" -ForegroundColor DarkGray

        foreach ($script in $cat.Group | Sort-Object name) {
            $badge, $badgeColor = Get-StatusBadge $script.testStatus
            $methodColor = Get-MethodColor $script.method
            $favStar = if ($script.favorite) { "*" } else { " " }
            $claudeBadge = if ($script.claudeModified) { " [C]" } else { "" }
            $nameColor = if ($script.testStatus -eq "verified") { "Green" } else { "White" }

            $idx = "$($script.index)".PadLeft(3)
            $name = $script.name.PadRight(32)
            $method = $script.method.PadRight(5)

            Write-Host "  | " -ForegroundColor DarkGray -NoNewline
            Write-Host "[$idx]" -ForegroundColor DarkGray -NoNewline
            Write-Host "$favStar" -ForegroundColor Yellow -NoNewline
            Write-Host " $name " -ForegroundColor $nameColor -NoNewline
            Write-Host "$method " -ForegroundColor $methodColor -NoNewline
            Write-Host "$badge" -ForegroundColor $badgeColor -NoNewline
            Write-Host "$claudeBadge" -ForegroundColor Magenta
        }
        Write-Host "  |" -ForegroundColor DarkGray
    }
}

function Show-FavoritesView {
    param($Scripts)

    $favorites = $Scripts | Where-Object { $_.favorite -eq $true }

    if ($favorites.Count -eq 0) {
        Write-Host "  No favorites yet. Use F<number> to add favorites." -ForegroundColor Yellow
        return
    }

    Write-Host "  +-- FAVORITES ($($favorites.Count)) " -ForegroundColor Yellow -NoNewline
    Write-Host ("-" * 45) -ForegroundColor DarkGray

    foreach ($script in $favorites | Sort-Object name) {
        $badge, $badgeColor = Get-StatusBadge $script.testStatus
        $methodColor = Get-MethodColor $script.method
        $claudeBadge = if ($script.claudeModified) { " [C]" } else { "" }
        $nameColor = if ($script.testStatus -eq "verified") { "Green" } else { "White" }

        $idx = "$($script.index)".PadLeft(3)
        $name = $script.name.PadRight(32)
        $method = $script.method.PadRight(5)

        Write-Host "  | " -ForegroundColor DarkGray -NoNewline
        Write-Host "[$idx]" -ForegroundColor DarkGray -NoNewline
        Write-Host "* " -ForegroundColor Yellow -NoNewline
        Write-Host "$name " -ForegroundColor $nameColor -NoNewline
        Write-Host "$method " -ForegroundColor $methodColor -NoNewline
        Write-Host "$badge" -ForegroundColor $badgeColor -NoNewline
        Write-Host "$claudeBadge" -ForegroundColor Magenta
    }
    Write-Host "  |" -ForegroundColor DarkGray
}

function Show-Menu {
    param($LastScript = $null)

    Write-Host ""
    Write-Host "  ================================================================" -ForegroundColor DarkGray
    Write-Host "  Commands:" -ForegroundColor White
    Write-Host "    [1-186]  Run script        " -NoNewline -ForegroundColor Gray
    Write-Host "/search  Filter by name" -ForegroundColor Gray
    Write-Host "    F<num>   Toggle favorite   " -NoNewline -ForegroundColor Gray
    Write-Host "T<num>   Test script" -ForegroundColor Gray
    Write-Host "    V        Change view       " -NoNewline -ForegroundColor Gray
    Write-Host "S        Filter by status" -ForegroundColor Gray
    Write-Host "    R        Report            " -NoNewline -ForegroundColor Gray
    Write-Host "C        Clear filter" -ForegroundColor Gray
    Write-Host "    L        Re-run last       " -NoNewline -ForegroundColor Gray
    Write-Host "D        Claude debug" -ForegroundColor Gray
    Write-Host "    H        Fix history       " -NoNewline -ForegroundColor Gray
    Write-Host "Q        Quit" -ForegroundColor Gray
    Write-Host "  ----------------------------------------------------------------" -ForegroundColor DarkGray
    Write-Host "  Legend: " -NoNewline -ForegroundColor DarkGray
    Write-Host "[+]" -NoNewline -ForegroundColor Green
    Write-Host " Verified  " -NoNewline -ForegroundColor DarkGray
    Write-Host "[?]" -NoNewline -ForegroundColor Yellow
    Write-Host " Tested  " -NoNewline -ForegroundColor DarkGray
    Write-Host "[X]" -NoNewline -ForegroundColor Red
    Write-Host " Broken  " -NoNewline -ForegroundColor DarkGray
    Write-Host "[~]" -NoNewline -ForegroundColor Cyan
    Write-Host " Needs Work  " -NoNewline -ForegroundColor DarkGray
    Write-Host "[C]" -NoNewline -ForegroundColor Magenta
    Write-Host " Claude Modified" -ForegroundColor DarkGray
    Write-Host "  ================================================================" -ForegroundColor DarkGray

    if ($LastScript) {
        Write-Host "  Last: " -NoNewline -ForegroundColor DarkGray
        Write-Host "[$($LastScript.index)] $($LastScript.name)" -ForegroundColor Cyan
    }
    Write-Host ""
}

function Run-Script {
    param($Script, $Metadata)

    $scriptPath = Join-Path $basePath $Script.path

    Clear-Host
    Write-Host ""
    Write-Host "  Running: $($Script.name)" -ForegroundColor Cyan
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    # Capture output to detect errors
    $errorDetected = $false
    $errorMessage = ""

    try {
        # Run script and capture output
        $output = & $scriptPath 2>&1 | Tee-Object -Variable scriptOutput

        # Check if ERROR was in the output
        $outputText = $scriptOutput -join "`n"
        if ($outputText -match "ERROR:\s*(.+)") {
            $errorDetected = $true
            $errorMessage = $matches[1].Trim()
        }
    }
    catch {
        $errorDetected = $true
        $errorMessage = $_.Exception.Message
        Write-Host ""
        Write-Host "  ERROR: $errorMessage" -ForegroundColor Red
    }

    Write-Host ""
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray

    # If error detected, offer to mark as broken
    if ($errorDetected -and $errorMessage) {
        Write-Host ""
        Write-Host "  Error detected: $errorMessage" -ForegroundColor Red
        Write-Host ""
        $mark = Select-Option -Prompt "Mark as BROKEN?" -Options @("Yes", "No") -Default 0

        if ($mark -eq "Yes") {
            $scriptObj = $Metadata.scripts | Where-Object { $_.name -eq $Script.name }
            $scriptObj.testStatus = "broken"
            $scriptObj.testDate = (Get-Date).ToString("yyyy-MM-dd")
            $scriptObj.testNote = $errorMessage
            $scriptObj.PSObject.Properties.Remove('claudeModified')
            Save-Metadata $Metadata
            Write-Host "  Marked as broken. Error logged." -ForegroundColor Yellow
        }
    }
    else {
        # Always offer status options after script runs
        Write-Host ""
        Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
        $mark = Select-Option -Prompt "Status:" -Options @("Skip", "Verified", "Tested", "Broken", "Improve") -Default 0

        $scriptObj = $Metadata.scripts | Where-Object { $_.name -eq $Script.name }

        switch ($mark) {
            "Verified" {
                $scriptObj.testStatus = "verified"
                $scriptObj.testDate = (Get-Date).ToString("yyyy-MM-dd")
                $scriptObj.testNote = ""
                $scriptObj.PSObject.Properties.Remove('claudeModified')
                Save-Metadata $Metadata
                Write-Host "`n  Marked as VERIFIED." -ForegroundColor Green

                # Prompt to capture pattern in cookbook
                Write-Host ""
                $capture = Select-Option -Prompt "Capture to cookbook?" -Options @("Yes", "Skip") -Default 1
                if ($capture -eq "Yes") {
                    $scriptPath = Join-Path $basePath $Script.path
                    Add-CookbookEntry -Script $scriptObj -ScriptPath $scriptPath
                }
            }
            "Tested" {
                $scriptObj.testStatus = "tested"
                $scriptObj.testDate = (Get-Date).ToString("yyyy-MM-dd")
                $scriptObj.testNote = ""
                $scriptObj.PSObject.Properties.Remove('claudeModified')
                Save-Metadata $Metadata
                Write-Host "`n  Marked as TESTED." -ForegroundColor Yellow
            }
            "Broken" {
                Write-Host ""
                $errorNote = Read-Host "  Error description (optional)"
                $scriptObj.testStatus = "broken"
                $scriptObj.testDate = (Get-Date).ToString("yyyy-MM-dd")
                $scriptObj.testNote = if ($errorNote) { $errorNote } else { "Marked broken by user" }
                $scriptObj.PSObject.Properties.Remove('claudeModified')
                Save-Metadata $Metadata
                Write-Host "  Marked as BROKEN." -ForegroundColor Red
            }
            "Improve" {
                Write-Host ""
                $improvementNote = Read-Host "  What needs improvement?"
                $scriptObj.testStatus = "needs_improvement"
                $scriptObj.testDate = (Get-Date).ToString("yyyy-MM-dd")
                $scriptObj.testNote = if ($improvementNote) { $improvementNote } else { "Needs improvement" }
                $scriptObj.PSObject.Properties.Remove('claudeModified')
                Save-Metadata $Metadata
                Write-Host "  Marked as NEEDS IMPROVEMENT." -ForegroundColor Cyan
            }
        }
    }
}

function Test-Script {
    param($Script, $Metadata)

    $scriptPath = Join-Path $basePath $Script.path

    Write-Host ""
    Write-Host "  Testing: $($Script.name)..." -ForegroundColor Yellow

    try {
        $pinfo = New-Object System.Diagnostics.ProcessStartInfo
        $pinfo.FileName = "pwsh"
        $pinfo.RedirectStandardError = $true
        $pinfo.RedirectStandardOutput = $true
        $pinfo.UseShellExecute = $false
        $pinfo.CreateNoWindow = $true
        $pinfo.Arguments = "-NoProfile -NonInteractive -File `"$scriptPath`""
        $pinfo.EnvironmentVariables["YOPRINT_API_KEY"] = $env:YOPRINT_API_KEY

        $p = New-Object System.Diagnostics.Process
        $p.StartInfo = $pinfo
        $p.Start() | Out-Null

        $completed = $p.WaitForExit(30000)

        if (-not $completed) {
            $p.Kill()
            Write-Host "  Result: TIMEOUT" -ForegroundColor Red
            return
        }

        $stdout = $p.StandardOutput.ReadToEnd()
        $hasResults = $stdout -match "RESULTS:|Found \d|SUCCESS"
        $hasError = $stdout -match "ERROR:"

        $scriptObj = $Metadata.scripts | Where-Object { $_.name -eq $Script.name }
        $scriptObj.testDate = (Get-Date).ToString("yyyy-MM-dd")

        if ($hasResults -and -not $hasError) {
            Write-Host "  Result: PASSED" -ForegroundColor Green
            $scriptObj.testStatus = "tested"
        }
        elseif ($hasError) {
            Write-Host "  Result: FAILED" -ForegroundColor Red
            $scriptObj.testStatus = "broken"
        }
        else {
            Write-Host "  Result: UNKNOWN" -ForegroundColor Yellow
        }

        Save-Metadata $Metadata
        Write-Host "  Status updated." -ForegroundColor Gray
    }
    catch {
        Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    }

    Start-Sleep -Seconds 1
}

function Toggle-Favorite {
    param($Script, $Metadata)

    $scriptObj = $Metadata.scripts | Where-Object { $_.name -eq $Script.name }
    $scriptObj.favorite = -not $scriptObj.favorite

    $status = if ($scriptObj.favorite) { "added to" } else { "removed from" }
    Write-Host "  $($Script.name) $status favorites" -ForegroundColor Yellow

    Save-Metadata $Metadata
    Start-Sleep -Milliseconds 500
}

function Show-StatusFilterMenu {
    Write-Host ""
    Write-Host "  Filter by status:" -ForegroundColor Yellow
    Write-Host "    [1] All" -ForegroundColor White
    Write-Host "    [2] Verified [+]" -ForegroundColor Green
    Write-Host "    [3] Tested [?]" -ForegroundColor Yellow
    Write-Host "    [4] Broken [X]" -ForegroundColor Red
    Write-Host "    [5] Not Tested [ ]" -ForegroundColor Gray
    Write-Host "    [6] Manual Required [M]" -ForegroundColor DarkYellow
    Write-Host "    [7] Needs Improvement [~]" -ForegroundColor Cyan
    Write-Host ""
    $choice = Read-Host "  Select"

    switch ($choice) {
        "1" { return "all" }
        "2" { return "verified" }
        "3" { return "tested" }
        "4" { return "broken" }
        "5" { return "not_tested" }
        "6" { return "manual_required" }
        "7" { return "needs_improvement" }
        default { return "all" }
    }
}

function Show-ViewMenu {
    Write-Host ""
    Write-Host "  View mode:" -ForegroundColor Yellow
    Write-Host "    [1] Categories (default)" -ForegroundColor White
    Write-Host "    [2] Favorites only" -ForegroundColor Yellow
    Write-Host "    [3] By HTTP Method" -ForegroundColor Cyan
    Write-Host ""
    $choice = Read-Host "  Select"

    switch ($choice) {
        "1" { return "categories" }
        "2" { return "favorites" }
        "3" { return "methods" }
        default { return "categories" }
    }
}

function Show-MethodView {
    param($Scripts, [string]$Filter = "", [string]$StatusFilter = "all")

    $filtered = $Scripts
    if ($Filter) {
        $filtered = $filtered | Where-Object { $_.name -like "*$Filter*" }
    }
    if ($StatusFilter -ne "all") {
        $filtered = $filtered | Where-Object { $_.testStatus -eq $StatusFilter }
    }

    $methods = @("GET", "POST", "PUT", "PATCH", "DEL")

    foreach ($method in $methods) {
        $methodScripts = $filtered | Where-Object { $_.method -eq $method }
        if ($methodScripts.Count -eq 0) { continue }

        $methodColor = Get-MethodColor $method
        $tested = ($methodScripts | Where-Object { $_.testStatus -eq "tested" }).Count

        Write-Host "  +-- $method ($tested/$($methodScripts.Count)) " -ForegroundColor $methodColor -NoNewline
        Write-Host ("-" * (50 - $method.Length)) -ForegroundColor DarkGray

        foreach ($script in $methodScripts | Sort-Object name) {
            $badge, $badgeColor = Get-StatusBadge $script.testStatus
            $favStar = if ($script.favorite) { "*" } else { " " }
            $claudeBadge = if ($script.claudeModified) { " [C]" } else { "" }
            $nameColor = if ($script.testStatus -eq "verified") { "Green" } else { "White" }

            $idx = "$($script.index)".PadLeft(3)
            $name = $script.name.PadRight(35)

            Write-Host "  | " -ForegroundColor DarkGray -NoNewline
            Write-Host "[$idx]" -ForegroundColor DarkGray -NoNewline
            Write-Host "$favStar" -ForegroundColor Yellow -NoNewline
            Write-Host " $name " -ForegroundColor $nameColor -NoNewline
            Write-Host "$badge" -ForegroundColor $badgeColor -NoNewline
            Write-Host "$claudeBadge" -ForegroundColor Magenta
        }
        Write-Host "  |" -ForegroundColor DarkGray
    }
}

function Add-CookbookEntry {
    param($Script, $ScriptPath)

    $cookbookPath = Join-Path $basePath "api-cookbook.md"

    # Read script content to extract URL and body
    $scriptContent = Get-Content $ScriptPath -Raw

    # Extract endpoint URL from script
    $urlMatch = [regex]::Match($scriptContent, 'Invoke-RestMethod\s+-Uri\s+"([^"]+)"')
    $extractedUrl = if ($urlMatch.Success) { $urlMatch.Groups[1].Value } else { "Unknown" }

    # Extract body if present
    $bodyMatch = [regex]::Match($scriptContent, '\$body\s*=\s*(@\{[^}]+\})')
    $bodyExample = if ($bodyMatch.Success) { $bodyMatch.Groups[1].Value } else { $null }

    Write-Host ""
    Write-Host "  ================================================" -ForegroundColor Cyan
    Write-Host "           CAPTURE API PATTERN" -ForegroundColor Cyan
    Write-Host "  ================================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  Script:   $($Script.name)" -ForegroundColor White
    Write-Host "  Endpoint: $($Script.method) $($Script.endpoint)" -ForegroundColor Gray
    Write-Host ""

    # Prompt for response example
    Write-Host "  Paste sample response JSON (or Enter to skip):" -ForegroundColor Yellow
    $responseExample = Read-Host "  "

    # Prompt for notes
    Write-Host ""
    Write-Host "  Any gotchas or notes? (or Enter to skip):" -ForegroundColor Yellow
    $notes = Read-Host "  "

    # Build entry
    $timestamp = Get-Date -Format "yyyy-MM-dd"

    $entry = @"

---

### $($Script.name)
**Endpoint:** ``$($Script.method) $($Script.endpoint)``
**Verified:** $timestamp

**Request:**
``````powershell
`$response = Invoke-RestMethod -Uri "$extractedUrl" -Headers `$headers -Method $($Script.method)
"@

    if ($bodyExample) {
        $entry += @"

`$body = $bodyExample | ConvertTo-Json
"@
    }

    $entry += @"

``````
"@

    if ($responseExample) {
        $entry += @"


**Response Structure:**
``````json
$responseExample
``````
"@
    }

    if ($notes) {
        $entry += "`n`n**Notes:** $notes"
    } else {
        $entry += "`n`n**Notes:** None"
    }

    $entry += "`n`n**Script:** [$($Script.path)]($($Script.path))"

    # Create cookbook if doesn't exist
    if (-not (Test-Path $cookbookPath)) {
        $header = @"
# YoPrint API Cookbook

Working API patterns verified by testing. Use this as a reference for API calls.

**Auto-generated by YoPrint-Launcher-v2.ps1**

Last updated: $timestamp
"@
        $header | Out-File $cookbookPath -Encoding utf8
    }

    # Append entry
    $entry | Add-Content $cookbookPath -Encoding utf8

    Write-Host ""
    Write-Host "  Pattern added to api-cookbook.md" -ForegroundColor Green
    Write-Host ""
    Start-Sleep -Seconds 1
}

# Main loop
$currentFilter = ""
$statusFilter = "all"
$viewMode = "categories"
$lastRunScript = $null

while ($true) {
    $metadata = Get-Metadata
    $scripts = $metadata.scripts

    # Calculate stats
    $stats = @{
        Total = $scripts.Count
        Verified = ($scripts | Where-Object { $_.testStatus -eq "verified" }).Count
        Tested = ($scripts | Where-Object { $_.testStatus -eq "tested" }).Count
        Broken = ($scripts | Where-Object { $_.testStatus -eq "broken" }).Count
        NeedsImprovement = ($scripts | Where-Object { $_.testStatus -eq "needs_improvement" }).Count
        Untested = ($scripts | Where-Object { $_.testStatus -in @("not_tested", "manual_required") }).Count
    }

    Show-Header $stats

    # Show current filter if active
    if ($currentFilter) {
        Write-Host "  Filter: " -NoNewline -ForegroundColor White
        Write-Host "'$currentFilter'" -ForegroundColor Yellow
    }
    if ($statusFilter -ne "all") {
        Write-Host "  Status: " -NoNewline -ForegroundColor White
        Write-Host "$statusFilter" -ForegroundColor Yellow
    }
    Write-Host ""

    # Show scripts based on view mode
    switch ($viewMode) {
        "categories" { Show-CategoryView $scripts $currentFilter $statusFilter }
        "favorites" { Show-FavoritesView $scripts }
        "methods" { Show-MethodView $scripts $currentFilter $statusFilter }
    }

    Show-Menu $lastRunScript

    $input = Read-Host "  >"

    # Handle commands
    if ($input -eq "Q" -or $input -eq "q") {
        Clear-Host
        break
    }
    elseif ($input -eq "C" -or $input -eq "c") {
        $currentFilter = ""
        $statusFilter = "all"
    }
    elseif ($input -eq "V" -or $input -eq "v") {
        $viewMode = Show-ViewMenu
    }
    elseif ($input -eq "S" -or $input -eq "s") {
        $statusFilter = Show-StatusFilterMenu
    }
    elseif ($input -eq "R" -or $input -eq "r") {
        & (Join-Path $basePath "Test-YoPrintAPI.ps1") -Mode report
        Read-Host "  Press Enter to continue"
    }
    elseif ($input -match "^/(.+)$") {
        $currentFilter = $matches[1]
    }
    elseif ($input -match "^[Ff](\d+)$") {
        $idx = [int]$matches[1]
        $script = $scripts | Where-Object { $_.index -eq $idx }
        if ($script) {
            Toggle-Favorite $script $metadata
        }
    }
    elseif ($input -match "^[Tt](\d+)$") {
        $idx = [int]$matches[1]
        $script = $scripts | Where-Object { $_.index -eq $idx }
        if ($script) {
            Test-Script $script $metadata
        }
    }
    elseif ($input -eq "L" -or $input -eq "l") {
        if ($lastRunScript) {
            Run-Script $lastRunScript $metadata
        }
        else {
            Write-Host "  No script run yet this session" -ForegroundColor Yellow
            Start-Sleep -Seconds 1
        }
    }
    elseif ($input -eq "D" -or $input -eq "d") {
        Clear-Host
        Write-Host ""
        Write-Host "  ================================================" -ForegroundColor Cyan
        Write-Host "             CLAUDE DEBUG - Action Items" -ForegroundColor Cyan
        Write-Host "  ================================================" -ForegroundColor Cyan
        Write-Host ""

        # Capture output and copy to clipboard
        $actionItems = & (Join-Path $basePath "Review-ActionItems.ps1") -Brief | Out-String
        $actionItems | Set-Clipboard

        # Display it
        Write-Host $actionItems
        Write-Host ""
        Write-Host "  ================================================" -ForegroundColor Green
        Write-Host "  COPIED TO CLIPBOARD - Paste into Claude Code" -ForegroundColor Green
        Write-Host "  ================================================" -ForegroundColor Green
        Read-Host "  Press Enter to continue"
    }
    elseif ($input -eq "H" -or $input -eq "h") {
        Clear-Host
        Write-Host ""
        Write-Host "  ================================================" -ForegroundColor Cyan
        Write-Host "              FIX HISTORY - Claude Archive" -ForegroundColor Cyan
        Write-Host "  ================================================" -ForegroundColor Cyan
        Write-Host ""

        $historyPath = Join-Path $basePath "fix-history.json"
        if (Test-Path $historyPath) {
            $history = Get-Content $historyPath -Raw | ConvertFrom-Json
            $fixes = $history.fixes | Sort-Object date -Descending

            Write-Host "  Total fixes archived: $($fixes.Count)" -ForegroundColor Green
            Write-Host ""

            foreach ($fix in $fixes) {
                Write-Host "  [$($fix.date)] " -NoNewline -ForegroundColor DarkGray
                Write-Host "$($fix.script)" -ForegroundColor Yellow
                Write-Host "    Issue: $($fix.issue)" -ForegroundColor Gray
                Write-Host "    Fixed: $($fix.resolution)" -ForegroundColor DarkCyan
                Write-Host ""
            }
        }
        else {
            Write-Host "  No fix history found." -ForegroundColor Yellow
        }

        Write-Host "  ================================================" -ForegroundColor DarkGray
        Read-Host "  Press Enter to continue"
    }
    elseif ($input -match "^\d+$") {
        $idx = [int]$input
        $script = $scripts | Where-Object { $_.index -eq $idx }
        if ($script) {
            $lastRunScript = $script
            Run-Script $script $metadata
        }
        else {
            Write-Host "  Script #$idx not found" -ForegroundColor Red
            Start-Sleep -Seconds 1
        }
    }
}
