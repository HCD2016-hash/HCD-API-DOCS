# YoPrint API PowerShell Reference

**Last Updated:** January 13, 2026
**Scripts:** 186 total (GET: 60, POST: 49, PUT: 41, PATCH: 10, DEL: 26)
**Status:** 62 tested (33.3%), 2 broken, 122 not tested
**API Coverage:** ~100% of documented endpoints

---

## Quick Start

### 1. Launch the Console (NEW v2!)
```powershell
.\YoPrint-Launcher-v2.ps1
```
Or double-click `YoPrint API.bat` on Desktop

### 2. New Launcher Features
- **Search**: Type `/keyword` to filter scripts
- **Categories**: Scripts grouped by function (orders, customers, settings, etc.)
- **Status badges**: `[+]` verified, `[?]` tested, `[X]` broken, `[~]` needs improvement, `[ ]` untested, `[C]` Claude modified
- **Green names**: Verified scripts show name in green for easy visibility
- **Favorites**: Press `F<number>` to star frequently used scripts
- **Test integration**: Press `T<number>` to test a script and update status
- **Status marking**: After running, use arrow keys to select status (no typing needed)
- **Re-run last**: Press `L` to re-run the last executed script
- **Claude debug**: Press `D` to copy action items to clipboard for Claude

### 3. Testing Scripts
```powershell
# View test report
.\Test-YoPrintAPI.ps1 -Mode report

# Auto-test simple scripts (no input required)
.\Test-YoPrintAPI.ps1 -Mode simple

# Test a single script
.\Test-YoPrintAPI.ps1 -Mode single -ScriptName "Get-Vendors"
```

### 4. Reinitialize Metadata
If you add new scripts, run:
```powershell
.\Initialize-ScriptMetadata.ps1
```

---

## Legacy Launch
Double-click `YoPrint API.bat` on Desktop (opens Windows Terminal + PowerShell 7)

### 2. API Key (already in PowerShell profile)
```powershell
$env:YOPRINT_API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"
```

### 3. Standard Header for All Requests
```powershell
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }
```

---

## Authentication

**Format:** `Authorization: {api_key}`
**NO prefix** - not "Bearer", not "Basic" - just the raw API key.

---

## API Base URLs

| Version | Base URL |
|---------|----------|
| v1 | `https://secure.yoprint.com/v1/api/store/{team_slug}/...` |
| v2 | `https://secure.yoprint.com/v2/api/store/{team_slug}/v2/...` |

**Team Slug:** `hub-city-design-inc`

---

## KNOWN API GOTCHAS

| Issue | Solution |
|-------|----------|
| `/services` returns 404 | Use `/service_location` instead |
| v2 endpoints reject scoped_id (SO1234) | Use UUID - search first via scoped_id_search |
| `scoped_id_search` returns fuzzy matches | Filter results client-side for exact match |
| `scoped_id_search` returns 422 | Use `scoped_id` NOT `id`: `{type: "order", scoped_id: "SO1234"}` |
| `/available_identifier/` returns 404 | Use `/setting/running_number` instead |
| `/v2/job/{id}/comment` returns 404 | **BROKEN** - YoPrint API bug |
| `/v1/.../setting/message_template` returns 404 | Use v2: `/v2/api/store/{slug}/setting/message_template` |
| `/v1/.../service` returns 404 | Use `/v1/.../service_location` instead |
| `/v1/.../setting/user_invitation` returns 404 | Use `/v1/.../setting/invite` instead |
| `/v1/.../user` returns 404 | Use `/v1/.../setting/user` instead |
| Search with `filters: []` returns 422 | Omit empty arrays entirely |
| Search with `sort: []` returns 422 | Omit empty arrays entirely |
| `/setting/tax_type` endpoint | v1 IS required: `/v1/api/store/{slug}/setting/tax_type` (old docs were wrong) |

---

## Completed Endpoints

### GET (37 scripts, 1 broken)

**Tested:** Get-Services, Get-Vendors, Get-Tags, Get-Statuses, Get-OrderDetails, Get-SalesOrderComments, Get-CustomerContacts, Get-VendorContacts, Get-CSVJobs, Get-CustomerAddresses

**Not Tested:** Get-PurchaseOrderHistory, Get-OrderApprovals, Get-UserActivityFeed, Get-SalesOrderHistory, Get-JobPresets, Get-PaymentMethods, Get-PaymentTerms, Get-Pipelines, Get-TaxTypes, Get-PurchaseOrderComments, Get-ShippingTypes, Get-Currencies, Get-StatusConfigs, Get-Users, Get-TeamSettings, Get-AdjustmentReasons, Get-Locations, Get-MessageTemplates, Get-ApprovalDetails, Get-ConnectedDevices, Get-ShipmentBoxes, Get-RunningNumbers, Get-UserGroups, Get-UserInvitations, Get-WebhookSubscriptions, Get-AvailableIdentifier

**Broken:** Get-JobComments (YoPrint API 404)

### POST (22 scripts, 1 broken)

**Tested:** Search-SalesOrders, Search-Customers, Search-Products, Global-Search, Lookup-OrderByNumber, Add-CustomerContact, Add-CustomerAddress, Add-SalesOrderComment

**Not Tested:** Get-Approvals, Add-JobApproval, Decode-Barcode, Add-PaymentMethod, Add-ShippingType, Add-StatusConfig, Update-StatusOrder, Add-UserInvitation, Add-PurchaseOrderComment, Add-Tag, Search-Vendors, Calc-Tax, Add-VendorContact

**Broken:** Add-JobComment (YoPrint API 404)

### PUT (5 scripts)

Update-OrderApproval, Complete-OrderApproval, Update-PaymentTerm, Update-Currency, Update-Comment

### PATCH (1 script)

Set-PrimaryContact

### DEL (4 scripts)

Remove-PaymentTerm, Remove-PaymentMethod, Remove-UserInvitation, Remove-Tag

---

## Common Patterns

### GET Request
```powershell
$response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/endpoint" -Headers $headers -Method Get
```

### POST Search (correct way)
```powershell
$body = @{ name = "search term" } | ConvertTo-Json
# DO NOT send empty arrays like filters: [] or sort: []
```

### Scoped ID Search (requires type AND scoped_id!)
```powershell
# CORRECT: Use scoped_id, not id
$body = @{ type = "order"; scoped_id = "SO1234" } | ConvertTo-Json
# type options: "order", "purchase_order", "job", "quote"

# Auto-prefix: if user enters just numbers, add SO prefix
$input = "1234"
if ($input -match '^\d+$') { $input = "SO$input" }
```

---

## Script UI Template
```powershell
$teamSlug = "hub-city-design-inc"
$headers = @{ "Authorization" = $env:YOPRINT_API_KEY; "Content-Type" = "application/json" }

Clear-Host
Write-Host ""
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host "              SCRIPT TITLE" -ForegroundColor Cyan
Write-Host "  ============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Description." -ForegroundColor Gray
Write-Host ""
Write-Host "  Examples:  SO1234  |  so5678" -ForegroundColor DarkGray
Write-Host ""

$SearchTerm = Read-Host "  Enter search"
Write-Host ""
Write-Host "  Loading..." -ForegroundColor Yellow

$response = Invoke-RestMethod -Uri "https://secure.yoprint.com/v1/api/store/$teamSlug/endpoint" -Headers $headers -Method Get

Write-Host ""
Write-Host "  RESULTS: Found $($response.data.Count) items" -ForegroundColor Green
Write-Host "  --------------------------------------------" -ForegroundColor DarkGray
foreach ($item in $response.data) {
    Write-Host "    $($item.name)" -ForegroundColor White
}
Write-Host ""
```

---

## Folder Structure

```
Powershell API Calls/
  ├── GET/                         # 60 scripts
  ├── POST/                        # 49 scripts
  ├── PUT/                         # 41 scripts
  ├── PATCH/                       # 10 scripts
  ├── DEL/                         # 26 scripts
  ├── YoPrint-Launcher-v2.ps1      # Enhanced launcher with search/categories
  ├── YoPrint-Launcher.ps1         # Legacy launcher
  ├── Test-YoPrintAPI.ps1          # Automated testing
  ├── Initialize-ScriptMetadata.ps1 # Metadata scanner
  ├── Review-ActionItems.ps1       # Show broken/needs_improvement scripts
  ├── Sync-YoPrintSkill.ps1        # Sync CLAUDE.md + cookbook to global skill
  ├── YoPrint-Helpers.psm1         # Shared functions
  ├── yoprint-scripts.json         # Central metadata (test status, categories)
  ├── fix-history.json             # Archive of Claude-fixed issues
  ├── api-cookbook.md              # Verified API patterns for AI agents
  ├── hcd-logo.ans                 # ASCII art logo for terminal header
  ├── SESSION-SUMMARY.md           # Session progress tracking for Claude
  ├── CLAUDE.md                    # Quick reference (SOURCE OF TRUTH)
  └── CLAUDE-NOTES.md              # Archived - replaced by JSON
```

---

## Terminal Setup

- **Windows Terminal** as default
- **PowerShell 7** (pwsh)
- **Oh My Posh** with paradox theme
- **CaskaydiaCove Nerd Font**

Desktop shortcut: `YoPrint API.bat`

---

## Claude Workflow: Reviewing Action Items

**IMPORTANT:** Only review scripts when the user asks you to. Do NOT proactively fix scripts.

### 1. Check for Action Items
```powershell
.\Review-ActionItems.ps1
```

This shows all scripts marked as `broken` [X] or `needs_improvement` [~] with their notes.

### 2. Status Meanings

| Status | Badge | Meaning | Claude Action |
|--------|-------|---------|---------------|
| `verified` | `[+]` | Fully working, complete | None - do not touch |
| `tested` | `[?]` | Has been tested, may need work | None until user flags it |
| `broken` | `[X]` | Does not work | Fix when user requests |
| `needs_improvement` | `[~]` | Works but needs refinement | Improve when user requests |
| `manual_required` | `[M]` | Destructive, needs manual test | Skip unless user requests |
| `not_tested` | `[ ]` | Never tested | Skip unless user requests |
| `claudeModified` | `[C]` | Claude fixed, pending user review | User tests & clears field |

### 3. When User Asks to Review Action Items

1. User presses `D` in launcher and pastes action items here
2. Read the script file at the path shown
3. Read the `testNote` for context - **this is what the user said is wrong**
4. Fix the issue based on the note
5. **ARCHIVE THE FIX** - Add entry to `fix-history.json`
6. **UPDATE SCRIPT STATUS** in `yoprint-scripts.json`:
   - Set `claudeModified` to today's date (e.g., `"2026-01-13"`) on that script
   - Set `lastClaudeUpdate` at the root level to current timestamp

### 4. Archiving Fixes (REQUIRED)

After fixing ANY issue, add an entry to `fix-history.json`:
```json
{
  "date": "2026-01-07",
  "script": "ScriptName.ps1",
  "issue": "Brief description of what was broken",
  "resolution": "What you changed to fix it"
}
```

This creates a permanent record of all fixes for future reference.

### 5. What NOT to Do

- Do NOT proactively scan for broken scripts
- Do NOT test endpoints that have already been debugged
- Do NOT mark scripts as `verified` or `tested` - only the user does this (Claude only sets the `claudeModified` field)
- Do NOT touch scripts marked as `verified` [+]
- Do NOT forget to archive fixes to `fix-history.json`
- Do NOT forget to set `claudeModified` field to today's date after fixing a script

### 6. Clearing Claude Modified Badge

When you test a script Claude fixed and it works:
1. Update testStatus to `verified` or `tested` in the launcher
2. The `[C]` badge auto-clears when you mark any status

### 7. Command Reference
```powershell
# See all action items
.\Review-ActionItems.ps1

# See only broken scripts
.\Review-ActionItems.ps1 -Filter broken

# See only needs_improvement scripts
.\Review-ActionItems.ps1 -Filter needs_improvement

# Get JSON output (for programmatic use)
.\Review-ActionItems.ps1 -Json
```

---

## Session Summary Workflow

The `SESSION-SUMMARY.md` file tracks debug session progress across conversations.

### At Session Start

If `SESSION-SUMMARY.md` exists, read it to understand:
- What scripts are verified and working
- What was changed in the last session
- What scripts have `[C]` badge pending user review
- What the suggested next steps are

### At Session End

When debug work is done for the session, **overwrite** `SESSION-SUMMARY.md` with current state:

1. Pull verified scripts from `yoprint-scripts.json` (`testStatus: "verified"`)
2. Pull recent fixes from `fix-history.json` (last session's date)
3. Pull scripts with `claudeModified` dates (pending user review)
4. List any new API gotchas discovered
5. Suggest next steps based on remaining action items

### Template
```markdown
# YoPrint API Debug Session Summary
**Last Updated:** [date]

## What Works Now (Verified)
- [scripts with testStatus: verified]

## Recent Changes
- [scripts modified in this session with brief description]

## Gotchas Discovered
- [any API quirks or issues found]

## Pending Review (Claude Modified)
- [scripts with claudeModified field awaiting user test]

## Next Up
- [suggested focus for next session]
```

---

## API Cookbook

The `api-cookbook.md` file stores verified API patterns in a format that AI agents can reference.

### How It Works

1. User marks a script as **Verified** [+] in the launcher
2. Launcher prompts: "Capture to cookbook? [Yes/Skip]"
3. If Yes:
   - Auto-extracts endpoint URL and request body from script
   - Prompts for optional response JSON example
   - Prompts for optional notes/gotchas
   - Appends entry to `api-cookbook.md`

### Syncing to Claude Skill

Run `Sync-YoPrintSkill.ps1` to push the cookbook (along with CLAUDE.md and test statuses) to the global skill at `~/.claude/skills/yoprint-api-knowledge/SKILL.md`.

Other Claude Code agents will then have access to verified patterns.

### Entry Format

Each cookbook entry contains:
- Endpoint and HTTP method
- Verification date
- Working request example (auto-extracted)
- Response structure (user-provided)
- Notes/gotchas
- Link to source script
