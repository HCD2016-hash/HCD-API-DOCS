# Pull-LiveSamples.ps1
# Pulls live samples of every YoPrint reference/config entity not yet in the schema extraction.
# Output: \\192.168.1.142\Shared\yoprint-extracted-schemas\live-samples\*.json

$teamSlug = if ($env:YOPRINT_TEAM_SLUG) { $env:YOPRINT_TEAM_SLUG } else { 'hub-city-design-inc' }
if (-not $env:YOPRINT_API_KEY) { throw 'YOPRINT_API_KEY env var not set' }
$headers = @{ 'Authorization' = $env:YOPRINT_API_KEY; 'Content-Type' = 'application/json' }

$out = '\\192.168.1.142\Shared\yoprint-extracted-schemas\live-samples'
if (-not (Test-Path $out)) { New-Item -ItemType Directory -Path $out -Force | Out-Null }

$base   = "https://secure.yoprint.com/v1/api/store/$teamSlug"
$baseV2 = "https://secure.yoprint.com/v2/api/store/$teamSlug"

# Endpoint catalog — covers Tier 1/2/3 gaps from the schema extraction
$endpoints = @(
    # Tier 1 — business-critical entities not in extraction
    @{ name = 'service';                  url = "$base/service";                          method = 'GET' }
    @{ name = 'service_location';         url = "$base/service_location";                 method = 'GET' }
    @{ name = 'vendor';                   url = "$base/vendor";                           method = 'GET' }
    @{ name = 'tag';                      url = "$base/tag";                              method = 'GET' }
    @{ name = 'setting_user';             url = "$base/setting/user";                     method = 'GET' }
    @{ name = 'setting_group';            url = "$base/setting/group";                    method = 'GET' }
    @{ name = 'setting_invite';           url = "$base/setting/invite";                   method = 'GET' }

    # Tier 2 — reference / config tables
    @{ name = 'setting_status';           url = "$base/setting/status";                   method = 'GET' }
    @{ name = 'setting_pipeline';         url = "$base/setting/pipeline";                 method = 'GET' }
    @{ name = 'setting_payment_method';   url = "$base/setting/payment_method";           method = 'GET' }
    @{ name = 'setting_payment_gateway';  url = "$base/setting/payment_gateway";          method = 'GET' }
    @{ name = 'setting_payment_term';     url = "$base/setting/payment_term";             method = 'GET' }
    @{ name = 'setting_shipping_type';    url = "$base/setting/shipping_type";            method = 'GET' }
    @{ name = 'setting_shipment_box';     url = "$base/setting/shipment_box";             method = 'GET' }
    @{ name = 'setting_location';         url = "$base/setting/location";                 method = 'GET' }
    @{ name = 'setting_currency';         url = "$base/setting/currency";                 method = 'GET' }
    @{ name = 'setting_adjustment_reason';url = "$base/setting/adjustment_reason";        method = 'GET' }
    @{ name = 'setting_job_preset';       url = "$base/setting/job_preset";               method = 'GET' }
    @{ name = 'setting_running_number';   url = "$base/setting/running_number";           method = 'GET' }
    @{ name = 'setting_webhook_sub';      url = "$base/setting/webhook_subscription";     method = 'GET' }
    @{ name = 'setting_tax_type';         url = "$base/setting/tax_type";                 method = 'GET' }
    @{ name = 'setting_connected_device'; url = "$base/setting/connected_device";         method = 'GET' }
    @{ name = 'setting_general';          url = "$base/setting/general";                  method = 'GET' }
    @{ name = 'setting_detail';           url = "$base/setting/detail";                   method = 'GET' }
    @{ name = 'message_template_v2';      url = "$baseV2/setting/message_template";       method = 'GET' }

    # Tier 3 — cross-cutting / activity
    @{ name = 'current_user_feed';        url = "$base/current_user_feed";                method = 'GET' }
    @{ name = 'current_user_preference';  url = "$base/current_user_preference";          method = 'GET' }
)

$summary = @()
foreach ($e in $endpoints) {
    Write-Host ("  [{0,-28}] " -f $e.name) -NoNewline -ForegroundColor Cyan
    try {
        $resp = Invoke-RestMethod -Uri $e.url -Headers $headers -Method $e.method -ErrorAction Stop
        $file = Join-Path $out ("{0}.json" -f $e.name)
        $resp | ConvertTo-Json -Depth 30 | Set-Content -Path $file -Encoding UTF8
        $count = if ($resp.data -is [array]) { $resp.data.Count } elseif ($resp.data) { 1 } else { '?' }
        Write-Host ("OK  count={0,-5} -> {1}" -f $count, ($file -replace [regex]::Escape($out), '<out>')) -ForegroundColor Green
        $summary += [pscustomobject]@{ entity=$e.name; status='ok'; count=$count; url=$e.url }
    } catch {
        $code = $_.Exception.Response.StatusCode.value__
        Write-Host ("FAIL {0}" -f $code) -ForegroundColor Red
        $summary += [pscustomobject]@{ entity=$e.name; status="fail_$code"; count=0; url=$e.url }
    }
}

$summary | ConvertTo-Json -Depth 5 | Set-Content -Path (Join-Path $out '_index.json') -Encoding UTF8
Write-Host ""
Write-Host "  Done. Index: $out\_index.json" -ForegroundColor Yellow
