<#
.SYNOPSIS
    YoPrint API Launcher - Hub City Design
#>

$Host.UI.RawUI.WindowTitle = "YoPrint API Console - Hub City Design"

# Scripts that are known broken (YoPrint API bugs)
$BrokenScripts = @("Get-JobComments", "Add-JobComment")

function Show-Banner {
    Clear-Host
    Write-Host ""
    Write-Host "  ╔════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "  ║                                                                    ║" -ForegroundColor Cyan
    Write-Host "  ║" -ForegroundColor Cyan -NoNewline
    Write-Host "  ██╗  ██╗██╗   ██╗██████╗      ██████╗██╗████████╗██╗   ██╗" -ForegroundColor White -NoNewline
    Write-Host "  ║" -ForegroundColor Cyan
    Write-Host "  ║" -ForegroundColor Cyan -NoNewline
    Write-Host "  ██║  ██║██║   ██║██╔══██╗    ██╔════╝██║╚══██╔══╝╚██╗ ██╔╝" -ForegroundColor White -NoNewline
    Write-Host "  ║" -ForegroundColor Cyan
    Write-Host "  ║" -ForegroundColor Cyan -NoNewline
    Write-Host "  ███████║██║   ██║██████╔╝    ██║     ██║   ██║    ╚████╔╝ " -ForegroundColor Cyan -NoNewline
    Write-Host "  ║" -ForegroundColor Cyan
    Write-Host "  ║" -ForegroundColor Cyan -NoNewline
    Write-Host "  ██╔══██║██║   ██║██╔══██╗    ██║     ██║   ██║     ╚██╔╝  " -ForegroundColor Cyan -NoNewline
    Write-Host "  ║" -ForegroundColor Cyan
    Write-Host "  ║" -ForegroundColor Cyan -NoNewline
    Write-Host "  ██║  ██║╚██████╔╝██████╔╝    ╚██████╗██║   ██║      ██║   " -ForegroundColor White -NoNewline
    Write-Host "  ║" -ForegroundColor Cyan
    Write-Host "  ║" -ForegroundColor Cyan -NoNewline
    Write-Host "  ╚═╝  ╚═╝ ╚═════╝ ╚═════╝      ╚═════╝╚═╝   ╚═╝      ╚═╝   " -ForegroundColor DarkCyan -NoNewline
    Write-Host "  ║" -ForegroundColor Cyan
    Write-Host "  ║                                                                    ║" -ForegroundColor Cyan
    Write-Host "  ║" -ForegroundColor Cyan -NoNewline
    Write-Host "      ██████╗ ███████╗███████╗██╗ ██████╗ ███╗   ██╗        " -ForegroundColor White -NoNewline
    Write-Host "  ║" -ForegroundColor Cyan
    Write-Host "  ║" -ForegroundColor Cyan -NoNewline
    Write-Host "      ██╔══██╗██╔════╝██╔════╝██║██╔════╝ ████╗  ██║        " -ForegroundColor White -NoNewline
    Write-Host "  ║" -ForegroundColor Cyan
    Write-Host "  ║" -ForegroundColor Cyan -NoNewline
    Write-Host "      ██║  ██║█████╗  ███████╗██║██║  ███╗██╔██╗ ██║        " -ForegroundColor Yellow -NoNewline
    Write-Host "  ║" -ForegroundColor Cyan
    Write-Host "  ║" -ForegroundColor Cyan -NoNewline
    Write-Host "      ██║  ██║██╔══╝  ╚════██║██║██║   ██║██║╚██╗██║        " -ForegroundColor Yellow -NoNewline
    Write-Host "  ║" -ForegroundColor Cyan
    Write-Host "  ║" -ForegroundColor Cyan -NoNewline
    Write-Host "      ██████╔╝███████╗███████║██║╚██████╔╝██║ ╚████║        " -ForegroundColor White -NoNewline
    Write-Host "  ║" -ForegroundColor Cyan
    Write-Host "  ║" -ForegroundColor Cyan -NoNewline
    Write-Host "      ╚═════╝ ╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝        " -ForegroundColor DarkCyan -NoNewline
    Write-Host "  ║" -ForegroundColor Cyan
    Write-Host "  ║                                                                    ║" -ForegroundColor Cyan
    Write-Host "  ║" -ForegroundColor Cyan -NoNewline
    Write-Host "            YoPrint API Console" -ForegroundColor Green -NoNewline
    Write-Host "  │  " -ForegroundColor DarkGray -NoNewline
    Write-Host "Lubbock, Texas" -ForegroundColor DarkYellow -NoNewline
    Write-Host "              ║" -ForegroundColor Cyan
    Write-Host "  ║                                                                    ║" -ForegroundColor Cyan
    Write-Host "  ╚════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

function Get-MethodColor {
    param([string]$Method)
    switch ($Method) {
        "GET"   { return "Green" }
        "POST"  { return "Yellow" }
        "PATCH" { return "Magenta" }
        "PUT"   { return "DarkYellow" }
        "DEL"   { return "Red" }
        default { return "White" }
    }
}

function Show-Menu {
    $basePath = $PSScriptRoot
    if ([string]::IsNullOrEmpty($basePath)) {
        $basePath = $PWD.Path
    }

    $methods = @("GET", "POST", "PATCH", "PUT", "DEL")
    $scripts = @()
    $index = 1

    Write-Host "  ┌────────────────────────────────────────────────────────────────┐" -ForegroundColor DarkGray
    Write-Host "  │              " -ForegroundColor DarkGray -NoNewline
    Write-Host "AVAILABLE API CALLS" -ForegroundColor White -NoNewline
    Write-Host "                            │" -ForegroundColor DarkGray
    Write-Host "  └────────────────────────────────────────────────────────────────┘" -ForegroundColor DarkGray
    Write-Host ""

    foreach ($method in $methods) {
        $methodPath = Join-Path $basePath $method
        if (Test-Path $methodPath) {
            $files = Get-ChildItem -Path $methodPath -Filter "*.ps1" -ErrorAction SilentlyContinue
            if ($files) {
                $color = Get-MethodColor $method
                Write-Host "  ▶ " -ForegroundColor $color -NoNewline
                Write-Host "$method" -ForegroundColor $color -NoNewline
                Write-Host " ─────────────────────────────────────────────────────────" -ForegroundColor DarkGray
                Write-Host ""

                foreach ($file in $files) {
                    $displayName = $file.BaseName -replace '-', ' ' -replace '_', ' '
                    $isBroken = $BrokenScripts -contains $file.BaseName

                    $scripts += @{
                        Index = $index
                        Method = $method
                        Name = $displayName
                        Path = $file.FullName
                        Broken = $isBroken
                    }

                    $num = $index.ToString().PadLeft(2, ' ')
                    if ($isBroken) {
                        Write-Host "      [$num] $displayName " -ForegroundColor DarkGray -NoNewline
                        Write-Host "[BROKEN]" -ForegroundColor Red
                    } else {
                        Write-Host "      [$num] $displayName" -ForegroundColor White
                    }
                    $index++
                }
                Write-Host ""
            }
        }
    }

    if ($scripts.Count -eq 0) {
        Write-Host "  No scripts found." -ForegroundColor Yellow
        Write-Host ""
    }

    Write-Host "  ╔════════════════════════════════════════════════════════════════╗" -ForegroundColor DarkGray
    Write-Host "  ║      " -ForegroundColor DarkGray -NoNewline
    Write-Host "[R]" -ForegroundColor Cyan -NoNewline
    Write-Host " Refresh              " -ForegroundColor Gray -NoNewline
    Write-Host "[Q]" -ForegroundColor Red -NoNewline
    Write-Host " Quit                     ║" -ForegroundColor Gray
    Write-Host "  ╚════════════════════════════════════════════════════════════════╝" -ForegroundColor DarkGray
    Write-Host ""

    return $scripts
}

function Run-Script {
    param([string]$ScriptPath, [string]$ScriptName, [bool]$IsBroken)

    Write-Host ""
    if ($IsBroken) {
        Write-Host "  ╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Red
        Write-Host "  ║  ⚠ WARNING: This endpoint is broken (YoPrint API bug)          ║" -ForegroundColor Red
        Write-Host "  ╚════════════════════════════════════════════════════════════════╝" -ForegroundColor Red
        Write-Host ""
    }
    Write-Host "  ┌────────────────────────────────────────────────────────────────┐" -ForegroundColor Cyan
    Write-Host "  │  ▶ RUNNING: " -ForegroundColor Cyan -NoNewline
    Write-Host "$ScriptName" -ForegroundColor White
    Write-Host "  └────────────────────────────────────────────────────────────────┘" -ForegroundColor Cyan
    Write-Host ""

    try {
        & $ScriptPath
    }
    catch {
        Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    }

    Write-Host ""
    Write-Host "  ─────────────────────────────────────────────────────────────────" -ForegroundColor DarkGray
    Write-Host "  Press any key to return to menu..." -ForegroundColor DarkGray
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

$running = $true

while ($running) {
    Show-Banner
    $scripts = Show-Menu

    Write-Host "  Enter selection: " -ForegroundColor Yellow -NoNewline
    $selection = Read-Host

    if ($selection -eq 'Q' -or $selection -eq 'q') {
        $running = $false
        Clear-Host
        Write-Host ""
        Write-Host "  ╔════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
        Write-Host "  ║                                                                    ║" -ForegroundColor Cyan
        Write-Host "  ║          " -ForegroundColor Cyan -NoNewline
        Write-Host "Thanks for using YoPrint API Console!" -ForegroundColor White -NoNewline
        Write-Host "               ║" -ForegroundColor Cyan
        Write-Host "  ║                                                                    ║" -ForegroundColor Cyan
        Write-Host "  ║                  " -ForegroundColor Cyan -NoNewline
        Write-Host "Hub City Design Inc." -ForegroundColor Yellow -NoNewline
        Write-Host "                         ║" -ForegroundColor Cyan
        Write-Host "  ║                    " -ForegroundColor Cyan -NoNewline
        Write-Host "Lubbock, Texas" -ForegroundColor DarkGray -NoNewline
        Write-Host "                             ║" -ForegroundColor Cyan
        Write-Host "  ║                                                                    ║" -ForegroundColor Cyan
        Write-Host "  ╚════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
        Write-Host ""
    }
    elseif ($selection -eq 'R' -or $selection -eq 'r') {
        continue
    }
    elseif ($selection -match '^\d+$') {
        $num = [int]$selection
        $selected = $scripts | Where-Object { $_.Index -eq $num }
        if ($selected) {
            Run-Script -ScriptPath $selected.Path -ScriptName $selected.Name -IsBroken $selected.Broken
        }
        else {
            Write-Host "  Invalid selection. Press any key..." -ForegroundColor Yellow
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        }
    }
    else {
        Write-Host "  Invalid input. Press any key..." -ForegroundColor Yellow
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
}
