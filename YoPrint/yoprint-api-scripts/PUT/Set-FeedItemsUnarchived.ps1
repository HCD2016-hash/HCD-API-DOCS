# Set-FeedItemsUnarchived.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "         UNARCHIVE FEED ITEMS" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Unarchive specific activity feed items." -ForegroundColor Gray
Write-Host ""
Write-Host "  Loading archived feed items..." -ForegroundColor Yellow

try {
    # First, load archived feed items
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/current_user_feed?show_archive=1&page=1" -Headers $headers -Method Get

    # Filter to only archived items
    $archivedItems = $response.data | Where-Object { $_.archive -eq $true -or $_.archived -eq $true }

    Write-Host ""
    Write-Host "  ARCHIVED ITEMS: $($archivedItems.Count) found" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($archivedItems.Count -eq 0) {
        Write-Host "  No archived feed items found." -ForegroundColor Yellow
        Write-Host ""
        return
    }

    $i = 1
    foreach ($item in $archivedItems) {
        $date = if ($item.created_at) { ([string]$item.created_at).Substring(0,10) } else { "N/A" }
        $type = if ($item.type) { $item.type } else { "activity" }
        $action = if ($item.action) { $item.action -replace '_', ' ' } else { "" }
        $desc = ""
        if ($item.subject_name) { $desc = $item.subject_name }
        elseif ($item.subject_scoped_id) { $desc = $item.subject_scoped_id }
        elseif ($item.message) { $desc = $item.message }

        Write-Host "    [$i] " -ForegroundColor Cyan -NoNewline
        Write-Host "[$date] " -ForegroundColor DarkGray -NoNewline
        Write-Host "$type $action" -ForegroundColor White
        if ($desc) { Write-Host "        $desc" -ForegroundColor Gray }
        Write-Host "        ID: $($item.id)" -ForegroundColor DarkGray
        $i++
    }

    Write-Host ""
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host "  Enter numbers to unarchive (comma-separated)" -ForegroundColor Gray
    Write-Host "  Example: 1,3,5 or 'all' for all items" -ForegroundColor DarkGray
    $selection = Read-Host "  Select"

    if ([string]::IsNullOrWhiteSpace($selection)) {
        Write-Host "  Cancelled." -ForegroundColor Yellow
        return
    }

    $selectedIds = @()
    if ($selection -eq "all") {
        $selectedIds = $archivedItems | ForEach-Object { @{ id = $_.id } }
    } else {
        $indices = $selection -split "," | ForEach-Object { $_.Trim() }
        foreach ($idx in $indices) {
            if ($idx -match '^\d+$') {
                $num = [int]$idx
                if ($num -ge 1 -and $num -le $archivedItems.Count) {
                    $selectedIds += @{ id = $archivedItems[$num - 1].id }
                }
            }
        }
    }

    if ($selectedIds.Count -eq 0) {
        Write-Host "  No valid items selected." -ForegroundColor Yellow
        return
    }

    Write-Host ""
    Write-Host "  Unarchiving $($selectedIds.Count) items..." -ForegroundColor Yellow

    $body = $selectedIds | ConvertTo-Json
    if ($selectedIds.Count -eq 1) {
        $body = "[$body]"
    }

    $unarchiveResponse = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/current_user_feed/unarchive" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Items unarchived!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    if ($unarchiveResponse.data) {
        foreach ($item in $unarchiveResponse.data) {
            Write-Host "    ID: $($item.id)" -ForegroundColor Cyan
            Write-Host "    Seen: $($item.seen) | Archived: $($item.archive)" -ForegroundColor Gray
            Write-Host ""
        }
    } else {
        Write-Host "  $($selectedIds.Count) items processed." -ForegroundColor Gray
        Write-Host ""
    }
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
