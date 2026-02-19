# Upload-TeamLogo.ps1
$teamSlug = "hub-city-design-inc"

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "          UPLOAD TEAM LOGO" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Upload a new team logo image." -ForegroundColor Gray
Write-Host ""

$FilePath = Read-Host "  Enter full path to image file"

if (-not (Test-Path $FilePath)) {
    Write-Host ""
    Write-Host "  ERROR: File not found!" -ForegroundColor Red
    Write-Host ""
    exit
}

Write-Host ""
Write-Host "  Uploading logo..." -ForegroundColor Yellow

try {
    $uri = "https://secure.yoprint.com/v1/api/store/$teamSlug/setting/photo"

    $boundary = [System.Guid]::NewGuid().ToString()
    $fileName = [System.IO.Path]::GetFileName($FilePath)
    $fileBytes = [System.IO.File]::ReadAllBytes($FilePath)
    $fileEnc = [System.Text.Encoding]::GetEncoding("iso-8859-1").GetString($fileBytes)

    $LF = "`r`n"
    $bodyLines = (
        "--$boundary",
        "Content-Disposition: form-data; name=`"file`"; filename=`"$fileName`"",
        "Content-Type: application/octet-stream$LF",
        $fileEnc,
        "--$boundary--$LF"
    ) -join $LF

    $headers = @{
        "Authorization" = $env:YOPRINT_API_KEY
    }

    $response = Invoke-RestMethod -Uri $uri -Headers $headers -Method Post -ContentType "multipart/form-data; boundary=$boundary" -Body $bodyLines

    Write-Host ""
    Write-Host "  SUCCESS: Team logo uploaded!" -ForegroundColor Green
    Write-Host ""
}
catch {
    Write-Host ""
    Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
}
