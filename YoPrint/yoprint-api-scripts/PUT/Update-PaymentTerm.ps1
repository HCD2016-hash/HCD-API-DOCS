# Update-PaymentTerm.ps1
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Magenta
Write-Host "           UPDATE PAYMENT TERM" -ForegroundColor Magenta
Write-Host "  ============================================" -ForegroundColor Magenta
Write-Host ""
Write-Host "  Update an existing payment term." -ForegroundColor Gray
Write-Host "  Run Get-PaymentTerms first to get the ID." -ForegroundColor DarkGray
Write-Host ""

$TermId = Read-Host "  Enter payment term ID (UUID)"
Write-Host ""
$Name = Read-Host "  Enter new name"
Write-Host ""
$DefaultInput = Read-Host "  Set as default? (y/n)"
$IsDefault = $DefaultInput -eq 'y' -or $DefaultInput -eq 'Y'
Write-Host ""
$DepositInput = Read-Host "  Enable deposit? (y/n)"
$EnableDeposit = $DepositInput -eq 'y' -or $DepositInput -eq 'Y'

$body = @{
    name = $Name
    default = $IsDefault
    enable_deposit = $EnableDeposit
}

if ($EnableDeposit) {
    Write-Host ""
    $DepositPercent = Read-Host "  Deposit percentage (e.g., 50)"
    $DepositDue = Read-Host "  Deposit due in days (e.g., 7)"
    $DepositDueFrom = Read-Host "  Deposit due from (issue_date or approval_date)"

    $body.deposit_percent = [int]$DepositPercent
    $body.deposit_due = [int]$DepositDue
    $body.deposit_due_from = $DepositDueFrom
}

Write-Host ""
$FullAmountDue = Read-Host "  Full amount due in days (e.g., 30)"
$FullAmountDueFrom = Read-Host "  Full amount due from (issue_date or approval_date)"

$body.full_amount_due = [int]$FullAmountDue
$body.full_amount_due_from = $FullAmountDueFrom

Write-Host ""
Write-Host "  Updating payment term..." -ForegroundColor Yellow

$jsonBody = $body | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/payment_term/$TermId" -Headers $headers -Method Put -Body $jsonBody

    Write-Host ""
    Write-Host "  SUCCESS: Payment term updated!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Name: $($response.data.name)" -ForegroundColor White
    Write-Host "    ID:   $($response.data.id)" -ForegroundColor Cyan
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
