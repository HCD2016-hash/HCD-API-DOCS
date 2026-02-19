# Test-YoPrintAPI.ps1
# Automated testing for YoPrint API scripts

param(
    [ValidateSet("simple", "medium", "all-safe", "report", "single")]
    [string]$Mode = "report",

    [string]$ScriptName = "",

    [int]$DelayMs = 500
)

$basePath = $PSScriptRoot
$jsonPath = Join-Path $basePath "yoprint-scripts.json"

function Get-Metadata {
    if (-not (Test-Path $jsonPath)) {
        Write-Host "  ERROR: yoprint-scripts.json not found. Run Initialize-ScriptMetadata.ps1 first." -ForegroundColor Red
        exit 1
    }
    return Get-Content $jsonPath -Raw | ConvertFrom-Json
}

function Save-Metadata {
    param($Metadata)
    $Metadata.lastUpdated = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ssZ")
    $Metadata | ConvertTo-Json -Depth 10 | Out-File $jsonPath -Encoding utf8
}

function Test-SingleScript {
    param(
        [Parameter(Mandatory)]$Script,
        [bool]$UpdateJson = $true
    )

    $scriptPath = Join-Path $basePath $Script.path
    $name = $Script.name

    Write-Host "  Testing: $name" -ForegroundColor Yellow -NoNewline

    if (-not (Test-Path $scriptPath)) {
        Write-Host " [NOT FOUND]" -ForegroundColor Red
        return @{ status = "error"; message = "Script file not found" }
    }

    # Get API key from current environment
    $apiKey = $env:YOPRINT_API_KEY
    if (-not $apiKey) {
        Write-Host " [NO API KEY]" -ForegroundColor Red
        return @{ status = "error"; message = "YOPRINT_API_KEY not set" }
    }

    try {
        # Create a new PowerShell process to run the script
        # Capture output and errors
        $pinfo = New-Object System.Diagnostics.ProcessStartInfo
        $pinfo.FileName = "pwsh"
        $pinfo.RedirectStandardError = $true
        $pinfo.RedirectStandardOutput = $true
        $pinfo.UseShellExecute = $false
        $pinfo.CreateNoWindow = $true
        $pinfo.Arguments = "-NoProfile -NonInteractive -File `"$scriptPath`""

        # Pass API key to the child process
        $pinfo.EnvironmentVariables["YOPRINT_API_KEY"] = $apiKey

        $p = New-Object System.Diagnostics.Process
        $p.StartInfo = $pinfo
        $p.Start() | Out-Null

        # Wait with timeout (60 seconds - some scripts have large output)
        $completed = $p.WaitForExit(60000)

        if (-not $completed) {
            $p.Kill()
            Write-Host " [TIMEOUT]" -ForegroundColor Red
            return @{ status = "timeout"; message = "Script timed out after 60 seconds" }
        }

        $stdout = $p.StandardOutput.ReadToEnd()
        $stderr = $p.StandardError.ReadToEnd()
        $exitCode = $p.ExitCode

        # Check for success indicators in stdout (various output patterns)
        $hasResults = $stdout -match "RESULTS:|Found \d|SUCCESS|CURRENT|DETAILS|SETTINGS|INVITATIONS|APPROVALS"

        # Check for actual API/script errors (not terminal/profile errors)
        $hasScriptError = $stdout -match "ERROR:" -or
                          ($stderr -match "Invoke-RestMethod|API|401|403|404|500" -and $stderr -notmatch "CursorPosition|YOPRINT_API_KEY.*term")

        # Check if script needs input
        $needsInput = $stderr -match "Read-Host"

        if ($needsInput) {
            Write-Host " [NEEDS INPUT]" -ForegroundColor DarkYellow
            return @{ status = "needs_input"; message = "Script requires user input"; output = $stdout }
        }
        elseif ($hasResults -and -not $hasScriptError) {
            Write-Host " [PASSED]" -ForegroundColor Green
            return @{ status = "passed"; message = "API responded successfully"; output = $stdout }
        }
        elseif ($hasScriptError) {
            Write-Host " [FAILED]" -ForegroundColor Red
            # Extract the actual error from stdout
            $errorMatch = [regex]::Match($stdout, "ERROR:\s*(.+)")
            $errorMsg = if ($errorMatch.Success) { $errorMatch.Groups[1].Value.Trim() } else { "API error" }
            return @{ status = "failed"; message = $errorMsg; output = $stdout }
        }
        elseif ($exitCode -ne 0) {
            Write-Host " [EXIT $exitCode]" -ForegroundColor Red
            return @{ status = "failed"; message = "Exit code: $exitCode"; output = $stdout }
        }
        else {
            Write-Host " [UNKNOWN]" -ForegroundColor DarkYellow
            return @{ status = "unknown"; message = "Could not determine result"; output = $stdout }
        }
    }
    catch {
        Write-Host " [ERROR]" -ForegroundColor Red
        return @{ status = "error"; message = $_.Exception.Message }
    }
}

function Show-Report {
    $metadata = Get-Metadata

    Clear-Host
    Write-Host ""
    Write-Host "  ============================================" -ForegroundColor Cyan
    Write-Host "         YOPRINT API TEST REPORT" -ForegroundColor Cyan
    Write-Host "  ============================================" -ForegroundColor Cyan
    Write-Host ""

    $total = $metadata.scripts.Count
    $verified = ($metadata.scripts | Where-Object { $_.testStatus -eq "verified" }).Count
    $tested = ($metadata.scripts | Where-Object { $_.testStatus -eq "tested" }).Count
    $broken = ($metadata.scripts | Where-Object { $_.testStatus -eq "broken" }).Count
    $needsImprovement = ($metadata.scripts | Where-Object { $_.testStatus -eq "needs_improvement" }).Count
    $manual = ($metadata.scripts | Where-Object { $_.testStatus -eq "manual_required" }).Count
    $notTested = ($metadata.scripts | Where-Object { $_.testStatus -eq "not_tested" }).Count

    $pct = [math]::Round(($verified / $total) * 100, 1)

    Write-Host "  OVERALL STATUS" -ForegroundColor Yellow
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host "    Total Scripts:     $total" -ForegroundColor White
    Write-Host "    Verified [+]:      $verified ($pct%)" -ForegroundColor Green
    Write-Host "    Tested [?]:        $tested" -ForegroundColor Yellow
    Write-Host "    Broken [X]:        $broken" -ForegroundColor Red
    Write-Host "    Needs Improvement: $needsImprovement" -ForegroundColor Cyan
    Write-Host "    Manual Required:   $manual" -ForegroundColor DarkYellow
    Write-Host "    Not Tested:        $notTested" -ForegroundColor Gray
    Write-Host ""

    Write-Host "  BY COMPLEXITY" -ForegroundColor Yellow
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    $simple = $metadata.scripts | Where-Object { $_.complexity -eq "simple" }
    $medium = $metadata.scripts | Where-Object { $_.complexity -eq "medium" }
    $destructive = $metadata.scripts | Where-Object { $_.complexity -eq "destructive" }

    $simpleTested = ($simple | Where-Object { $_.testStatus -eq "tested" }).Count
    $mediumTested = ($medium | Where-Object { $_.testStatus -eq "tested" }).Count
    $destructiveTested = ($destructive | Where-Object { $_.testStatus -eq "tested" }).Count

    Write-Host "    Simple:      $simpleTested / $($simple.Count) tested" -ForegroundColor Green
    Write-Host "    Medium:      $mediumTested / $($medium.Count) tested" -ForegroundColor Yellow
    Write-Host "    Destructive: $destructiveTested / $($destructive.Count) tested" -ForegroundColor Red
    Write-Host ""

    Write-Host "  BY CATEGORY" -ForegroundColor Yellow
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    $categories = $metadata.scripts | Group-Object category | Sort-Object Name
    foreach ($cat in $categories) {
        $catTested = ($cat.Group | Where-Object { $_.testStatus -eq "tested" }).Count
        $catBroken = ($cat.Group | Where-Object { $_.testStatus -eq "broken" }).Count
        $statusColor = if ($catBroken -gt 0) { "Red" } elseif ($catTested -eq $cat.Count) { "Green" } else { "White" }
        Write-Host "    $($cat.Name.PadRight(18)) $catTested / $($cat.Count)" -ForegroundColor $statusColor
    }
    Write-Host ""

    # Show broken scripts
    $brokenScripts = $metadata.scripts | Where-Object { $_.testStatus -eq "broken" }
    if ($brokenScripts.Count -gt 0) {
        Write-Host "  BROKEN SCRIPTS" -ForegroundColor Red
        Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
        foreach ($s in $brokenScripts) {
            Write-Host "    $($s.name) - $($s.testNote)" -ForegroundColor Red
        }
        Write-Host ""
    }

    # Show needs improvement scripts
    $needsImprovementScripts = $metadata.scripts | Where-Object { $_.testStatus -eq "needs_improvement" }
    if ($needsImprovementScripts.Count -gt 0) {
        Write-Host "  NEEDS IMPROVEMENT" -ForegroundColor Cyan
        Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
        foreach ($s in $needsImprovementScripts) {
            Write-Host "    $($s.name) - $($s.testNote)" -ForegroundColor Cyan
        }
        Write-Host ""
    }

    # Show simple scripts ready to test
    $simpleUntested = $simple | Where-Object { $_.testStatus -eq "not_tested" }
    if ($simpleUntested.Count -gt 0) {
        Write-Host "  READY FOR AUTO-TEST (simple, untested)" -ForegroundColor Green
        Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
        foreach ($s in $simpleUntested | Select-Object -First 10) {
            Write-Host "    $($s.name)" -ForegroundColor White
        }
        if ($simpleUntested.Count -gt 10) {
            Write-Host "    ... and $($simpleUntested.Count - 10) more" -ForegroundColor Gray
        }
        Write-Host ""
        Write-Host "  Run: .\Test-YoPrintAPI.ps1 -Mode simple" -ForegroundColor Cyan
    }
    Write-Host ""
}

function Run-SimpleTests {
    $metadata = Get-Metadata

    Clear-Host
    Write-Host ""
    Write-Host "  ============================================" -ForegroundColor Green
    Write-Host "       TESTING SIMPLE SCRIPTS" -ForegroundColor Green
    Write-Host "  ============================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "  These scripts require no user input." -ForegroundColor Gray
    Write-Host "  Delay between tests: ${DelayMs}ms" -ForegroundColor Gray
    Write-Host ""

    $simpleScripts = $metadata.scripts | Where-Object {
        $_.complexity -eq "simple" -and
        $_.testStatus -eq "not_tested"
    }

    if ($simpleScripts.Count -eq 0) {
        Write-Host "  No untested simple scripts found." -ForegroundColor Yellow
        Write-Host ""
        return
    }

    Write-Host "  Found $($simpleScripts.Count) scripts to test" -ForegroundColor White
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $passed = 0
    $failed = 0
    $other = 0

    foreach ($script in $simpleScripts) {
        $result = Test-SingleScript -Script $script

        # Update metadata
        $scriptObj = $metadata.scripts | Where-Object { $_.name -eq $script.name }
        $scriptObj.testDate = (Get-Date).ToString("yyyy-MM-dd")

        switch ($result.status) {
            "passed" {
                $scriptObj.testStatus = "tested"
                $scriptObj.testNote = ""
                $passed++
            }
            "failed" {
                $scriptObj.testStatus = "broken"
                $scriptObj.testNote = $result.message
                $failed++
            }
            "needs_input" {
                $scriptObj.complexity = "medium"
                $scriptObj.requiresInput = $true
                $other++
            }
            default {
                $other++
            }
        }

        Start-Sleep -Milliseconds $DelayMs
    }

    Save-Metadata $metadata

    Write-Host ""
    Write-Host "  ============================================" -ForegroundColor Cyan
    Write-Host "       TEST RESULTS" -ForegroundColor Cyan
    Write-Host "  ============================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "    Passed:  $passed" -ForegroundColor Green
    Write-Host "    Failed:  $failed" -ForegroundColor Red
    Write-Host "    Other:   $other" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  Results saved to yoprint-scripts.json" -ForegroundColor Gray
    Write-Host ""
}

function Run-SingleTest {
    param([string]$Name)

    $metadata = Get-Metadata
    $script = $metadata.scripts | Where-Object { $_.name -eq $Name }

    if (-not $script) {
        Write-Host "  ERROR: Script '$Name' not found" -ForegroundColor Red
        return
    }

    Clear-Host
    Write-Host ""
    Write-Host "  ============================================" -ForegroundColor Yellow
    Write-Host "       TESTING: $Name" -ForegroundColor Yellow
    Write-Host "  ============================================" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  Path:       $($script.path)" -ForegroundColor Gray
    Write-Host "  Complexity: $($script.complexity)" -ForegroundColor Gray
    Write-Host "  Category:   $($script.category)" -ForegroundColor Gray
    Write-Host ""

    $result = Test-SingleScript -Script $script

    # Update metadata
    $scriptObj = $metadata.scripts | Where-Object { $_.name -eq $Name }
    $scriptObj.testDate = (Get-Date).ToString("yyyy-MM-dd")

    if ($result.status -eq "passed") {
        $scriptObj.testStatus = "tested"
        $scriptObj.testNote = ""
    }
    elseif ($result.status -eq "failed") {
        $scriptObj.testStatus = "broken"
        $scriptObj.testNote = $result.message
    }

    Save-Metadata $metadata

    Write-Host ""
    Write-Host "  Result saved to yoprint-scripts.json" -ForegroundColor Gray
    Write-Host ""
}

# Main
switch ($Mode) {
    "report" { Show-Report }
    "simple" { Run-SimpleTests }
    "single" {
        if (-not $ScriptName) {
            Write-Host "  ERROR: -ScriptName required for single mode" -ForegroundColor Red
        } else {
            Run-SingleTest -Name $ScriptName
        }
    }
    default {
        Write-Host "  Mode '$Mode' not yet implemented" -ForegroundColor Yellow
    }
}
