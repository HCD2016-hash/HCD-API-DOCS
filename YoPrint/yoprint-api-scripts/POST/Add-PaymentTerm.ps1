# Add-PaymentTerm.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "         CREATE PAYMENT TERM" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Create a new payment term." -ForegroundColor Gray
Write-Host ""

$Name = Read-Host "  Payment term name"
Write-Host "  Enable deposit requirement? (yes/no): " -NoNewline
$EnableDeposit = (Read-Host) -eq "yes"

$DepositPercent = 0
$DepositDue = 0
if ($EnableDeposit) {
    $DepositPercent = [int](Read-Host "  Deposit percentage")
    $DepositDue = [int](Read-Host "  Deposit due in (days)")
}

$FullAmountDue = [int](Read-Host "  Full amount due in (days)")
Write-Host "  Set as default? (yes/no): " -NoNewline
$Default = (Read-Host) -eq "yes"

Write-Host ""
Write-Host "  Creating payment term..." -ForegroundColor Yellow

$body = @{
    name = $Name
    enable_deposit = $EnableDeposit
    deposit_percent = $DepositPercent
    deposit_due = $DepositDue
    deposit_due_from = "issue_date"
    full_amount_due = $FullAmountDue
    full_amount_due_from = "issue_date"
    default = $Default
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/payment_term" -Headers $headers -Method Post -Body $body

    Write-Host ""
    Write-Host "  SUCCESS: Payment term created!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    ID: $($response.data.id)" -ForegroundColor Cyan
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    Default: $($response.data.default)" -ForegroundColor Gray
    if ($response.data.enable_deposit) {
        Write-Host "    Deposit: $($response.data.deposit_percent)% due in $($response.data.deposit_due) days" -ForegroundColor Gray
    }
    Write-Host "    Full Due: $($response.data.full_amount_due) days" -ForegroundColor Gray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
