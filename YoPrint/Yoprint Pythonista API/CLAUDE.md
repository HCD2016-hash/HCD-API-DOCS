# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Python scripts for YoPrint API access on iOS via **Pythonista 3**. Converted from PowerShell scripts in the `HCD2016-hash/yoprint-api-scripts` repo.

Target: iPhone/iPad mobile access to YoPrint order management data for Hub City Design.

## Running Scripts

- Open `yoprint_launcher.py` in Pythonista and tap Play for the menu
- Or run individual scripts directly (each has a `main()` function)
- Scripts cannot be tested outside Pythonista (uses `console`, `dialogs`, `clipboard` modules)

## API Configuration

```python
TEAM_SLUG = "hub-city-design-inc"
BASE_URL_V1 = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
BASE_URL_V2 = f"https://secure.yoprint.com/v2/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}
```

Central config exists in `yoprint_config.py` but scripts currently duplicate the config inline (known tech debt).

## Architecture

### Script Structure
Each script follows the same pattern:
1. Config block (TEAM_SLUG, API_KEY, URLs, HEADERS)
2. API function(s) that return data
3. `main()` function with UI flow
4. `if __name__ == "__main__": main()` entry point

### Launcher Integration
To add a new script to the launcher, add to the `SCRIPTS` list in `yoprint_launcher.py`:
```python
{
    "name": "🔍 Script Name",
    "description": "What it does",
    "module": "script_filename"  # without .py
}
```

## Key API Patterns

### Scoped ID Search (SO/Q/PO lookups)
```python
url = f"{BASE_URL_V1}/global/scoped_id_search"
payload = {"type": "order", "scoped_id": "SO1234"}  # also: "quote", "purchase_order"
```

### V2 API for Full Details
```python
url = f"{BASE_URL_V2}/v2/sales_order/{uuid}"  # Works for orders AND quotes
```

### Search Endpoints (POST with {"name": term})
- `/sales_order/search` - Orders
- `/product_list_search` - Products
- `/customer/search` - Customers
- `/vendor/search` - Vendors
- `/global/search` - Everything at once

### Settings Pattern
Most settings use `/setting/{type}`:
- `/setting/user`, `/setting/payment_method`, `/setting/shipping_type`
- `/setting/message_template` - **V2 API only** (v1 returns 404)

### API Gotchas
- **Approvals filter**: Don't send empty arrays in payload (causes 422)
- **Message templates**: Must use V2 API
- V1 returns `{"data": [...]}`, extract with `.get("data", [])`

## Console Color Conventions

```python
console.set_color(0.2, 0.6, 1.0)  # Blue - headers
console.set_color(0.2, 0.8, 0.2)  # Green - success
console.set_color(1.0, 0.6, 0.2)  # Orange - warnings
console.set_color(1.0, 0.3, 0.3)  # Red - errors
console.set_color(1.0, 0.8, 0.2)  # Yellow - section labels
console.set_color(0.5, 0.5, 0.5)  # Gray - muted/IDs
console.set_color()               # Reset to default
```

## Scripts Not Yet Converted

Medium priority (see AGENT_HANDOFF.md for full list):
- Invoice list, Shipment tracking, Customer addresses/contacts
- Order/PO audit trails, Job comments

Lower priority (write operations - mobile use discouraged):
- Add comments, status updates

Explicitly skipped: Tax and location scripts.

## Source Repository Reference

PowerShell source organized as:
- `GET/` - Read operations → most scripts here
- `POST/` - Searches and creates
- `PUT/` - Updates
- `DELETE/` - Deletions
- `YoPrint-Init.ps1` - Shared config
