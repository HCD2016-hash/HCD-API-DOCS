# Get-UserActivityFeed.ps1
. (Join-Path $PSScriptRoot ".." "YoPrint-Init.ps1")


Show-Header -Title "USER ACTIVITY FEED" -Description "View your recent activity notifications."
Write-Host "  Filter options:" -ForegroundColor DarkGray
Write-Host "    1 = All activity" -ForegroundColor DarkGray
Write-Host "    2 = Unseen only" -ForegroundColor DarkGray
Write-Host "    3 = Include archived" -ForegroundColor DarkGray
Write-Host ""

$filter = Read-Host "  Choose filter (1-3)"
Write-Host ""
Write-Host "  Loading activity feed..." -ForegroundColor Yellow

$url = "https://secure.yoprint.com/v1/api/store/$teamSlug/current_user_feed?page=1"

switch ($filter) {
    "2" { $url += "&not_seen_yet=1" }
    "3" { $url += "&show_archive=1" }
}

try {
    $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  RESULTS: Found $($response.data.Count) activities" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($response.data.Count -eq 0) {
        Write-Host "  No activity found." -ForegroundColor Yellow
    } else {
        $i = 1
        foreach ($activity in $response.data) {
            $date = if ($activity.created_at) { ([string]$activity.created_at).Substring(0,10) } else { "N/A" }
            $time = if ($activity.created_at -and $activity.created_at.Length -gt 11) { ([string]$activity.created_at).Substring(11,5) } else { "" }
            $action = if ($activity.action) { $activity.action -replace '_', ' ' } else { "activity" }
            $type = if ($activity.type) { $activity.type } else { "unknown" }

            # Build description from available fields
            $desc = ""
            if ($activity.subject_name) { $desc = $activity.subject_name }
            elseif ($activity.subject_scoped_id) { $desc = $activity.subject_scoped_id }
            elseif ($activity.message) { $desc = $activity.message }
            elseif ($activity.description) { $desc = $activity.description }
            elseif ($activity.title) { $desc = $activity.title }

            # Get user who performed action
            $user = ""
            if ($activity.user_name) { $user = $activity.user_name }
            elseif ($activity.created_by_name) { $user = $activity.created_by_name }
            elseif ($activity.actor_name) { $user = $activity.actor_name }

            Write-Host "    $i. " -ForegroundColor DarkGray -NoNewline
            Write-Host "[$date $time] " -ForegroundColor DarkGray -NoNewline
            Write-Host "$type " -ForegroundColor Cyan -NoNewline
            Write-Host "$action" -ForegroundColor White

            if ($desc) {
                Write-Host "       Subject: $desc" -ForegroundColor Yellow
            }
            if ($user) {
                Write-Host "       By: $user" -ForegroundColor Gray
            }
            if ($activity.message_key -and -not $desc) {
                Write-Host "       Key: $($activity.message_key)" -ForegroundColor DarkGray
            }

            # Show seen/archived status
            $status = @()
            if ($activity.seen -eq $false) { $status += "UNSEEN" }
            if ($activity.archived -eq $true) { $status += "archived" }
            if ($status.Count -gt 0) {
                Write-Host "       Status: $($status -join ', ')" -ForegroundColor Magenta
            }

            Write-Host ""
            $i++
        }

        # Show pagination info
        if ($response.meta) {
            Write-Host "  Page $($response.meta.current_page) of $($response.meta.last_page) ($($response.meta.total) total)" -ForegroundColor DarkGray
        }
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
