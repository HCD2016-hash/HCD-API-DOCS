# YoPrint API Debug Session Summary
**Last Updated:** 2026-01-18

---

## What Works Now (Verified)
- Get-AvailableIdentifier
- Get-Currencies
- Get-Services
- Get-Tags
- Get-Users
- Get-WebhookById
- Set-FeedAllArchived

---

## Recent Changes (2026-01-18)

### Fixed "List-First UX" Pattern in 6 Scripts
All these scripts now show available options before asking for IDs:

| Script | Fix |
|--------|-----|
| Add-JobCommentV2 | Searches by SO number, shows jobs, select by number |
| Calc-TaxByCustomer | Searches customers by name, lists addresses, select both |
| Compile-MessageTemplate | Lists all templates first, searches orders by number |
| Get-MessageTemplateById | Lists templates with ON/OFF status, select by number |
| Remove-AsyncUpload | Added explanation of what async uploads are (API has no list endpoint) |
| Remove-Vendor | Lists vendors with pagination, requires typing DELETE to confirm |

---

## Gotchas Discovered

| Issue | Solution |
|-------|----------|
| `scoped_id_search` needs `scoped_id` not `id` | Use `{type: "order", scoped_id: "SO1234"}` |
| v2 endpoints reject scoped_id (SO1234) | Search first to get UUID |
| `/services` returns 404 | Use `/service_location` instead |
| Empty arrays (`filters: []`) return 422 | Omit empty arrays entirely |
| `/v2/job/{id}/comment` returns 404 | Known YoPrint API bug - broken |
| No GET endpoint for async_uploads | Can only delete by known ID |

---

## Pending Review (Claude Modified)
Scripts with `[C]` badge awaiting user testing:

1. **Get-MessageTemplateById** - Lists templates first, pretty output
2. **Add-JobCommentV2** - Searches by SO#, shows job picker
3. **Calc-TaxByCustomer** - Customer/address search flow
4. **Compile-MessageTemplate** - Template picker, order search
5. **Remove-AsyncUpload** - Added docs, better error handling
6. **Remove-Vendor** - Vendor list with pagination, DELETE confirmation

---

## Next Up
- User tests the 6 `[C]` scripts and marks them verified/needs_improvement
- Continue fixing remaining scripts that ask for UUIDs upfront
- Run `.\Review-ActionItems.ps1` to see what else needs attention

---

## Stats
- **Total Scripts:** 186
- **Verified:** 7
- **Claude Modified (pending review):** 6
- **Fix History Entries:** 24 total
