# Set-ServiceOrder.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "          ARRANGE SERVICE ORDER" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Reorder services by specifying positions." -ForegroundColor Gray
Write-Host ""

# First, get current services
Write-Host "  Loading current services..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/service" -Headers $headers -Method Get

    Write-Host ""
    Write-Host "  Current Order:" -ForegroundColor White
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray

    $services = $response.data | Sort-Object position
    $i = 0
    foreach ($svc in $services) {
        Write-Host "    [$i] $($svc.name) (ID: $($svc.id))" -ForegroundColor Gray
        $i++
    }

    Write-Host ""
    Write-Host "  Enter new order as comma-separated positions" -ForegroundColor White
    Write-Host "  Example: 2,0,1 moves item 2 to first, 0 to second, 1 to third" -ForegroundColor DarkGray
    Write-Host ""
    $newOrder = Read-Host "  New order"

    $positions = $newOrder -split "," | ForEach-Object { [int]$_.Trim() }
    $items = @()
    $pos = 0
    foreach ($idx in $positions) {
        if ($idx -lt $services.Count) {
            $items += @{
                id = $services[$idx].id
                position = $pos
            }
            $pos++
        }
    }

    Write-Host ""
    Write-Host "  Rearranging services..." -ForegroundColor Yellow

    $body = @{ items = $items } | ConvertTo-Json -Depth 3

    $result = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/service/arrange" -Headers $headers -Method Put -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Services reordered!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    foreach ($svc in $result.data | Sort-Object position) {
        Write-Host "    [$($svc.position)] $($svc.name)" -ForegroundColor White
    }
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
