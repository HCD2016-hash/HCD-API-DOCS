# Import-CustomerCSV.ps1
$teamSlug = "hub-city-design-inc"

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "          IMPORT CUSTOMERS CSV" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Upload a CSV file to import customers." -ForegroundColor Gray
Write-Host ""

$FilePath = Read-Host "  Enter full path to CSV file"

if (-not (Test-Path $FilePath)) {
    Write-Host ""
    Write-Host "  ERROR: File not found at '$FilePath'" -ForegroundColor Red
    Write-Host ""
    exit
}

Write-Host ""
Write-Host "  Uploading CSV..." -ForegroundColor Yellow

try {
    $fileBytes = [System.IO.File]::ReadAllBytes($FilePath)
    $fileName = [System.IO.Path]::GetFileName($FilePath)

    $boundary = [System.Guid]::NewGuid().ToString()
    $LF = "`r`n"

    $bodyLines = @(
        "--$boundary",
        "Content-Disposition: form-data; name=`"file`"; filename=`"$fileName`"",
        "Content-Type: text/csv",
        "",
        [System.Text.Encoding]::UTF8.GetString($fileBytes),
        "--$boundary--"
    ) -join $LF

    $headers = @{
        "Authorization" = $env:YOPRINT_API_KEY
    }

    $response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/csv/import/customer" -Headers $headers -Method Post -Body $bodyLines -ContentType "multipart/form-data; boundary=$boundary"

    Write-Host ""
    Write-Host "  SUCCESS: CSV uploaded!" -ForegroundColor Green
    Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    $job = $response.data
    Write-Host "    Job ID: $($job.id)" -ForegroundColor Cyan
    Write-Host "    Status: $($job.status)" -ForegroundColor Yellow
    Write-Host "    Total Rows: $($job.total_row)" -ForegroundColor Gray
    Write-Host "    Validated: $($job.validated)" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  Use Get-CSVJobs.ps1 to check import progress." -ForegroundColor DarkGray
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
