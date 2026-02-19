# YoPrint-ErrorHandler.psm1
# Shared error handling helpers for YoPrint API scripts.

function Write-YoPrintError {
    <#
    .SYNOPSIS
    Writes a consistent, user-friendly error message.
    .PARAMETER Context
    Description of the operation that failed.
    .PARAMETER ErrorRecord
    The error record to display.
    #>
    param(
        [Parameter(Mandatory)]
        [string]$Context,

        [Parameter(Mandatory)]
        [System.Management.Automation.ErrorRecord]$ErrorRecord
    )

    Write-Host "" 
    Write-Host "  ERROR: $Context" -ForegroundColor Red
    Write-Host "  $($ErrorRecord.Exception.Message)" -ForegroundColor DarkRed
    Write-Host "" 
}

Export-ModuleMember -Function @(
    'Write-YoPrintError'
)
