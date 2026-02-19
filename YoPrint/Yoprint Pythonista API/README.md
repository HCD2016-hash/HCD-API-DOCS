# YoPrint Mobile Tools for Pythonista

Hub City Design - YoPrint API scripts converted for iPhone/iPad use in Pythonista 3.

## Setup Instructions

### 1. Install Pythonista 3
- Download from App Store: https://apps.apple.com/app/pythonista-3/id1085978097
- Cost: $9.99 (one-time purchase)

### 2. Transfer Files to Pythonista
**Option A - iCloud Drive:**
1. Copy all .py files to iCloud Drive
2. In Pythonista, tap + > Import from Files
3. Select files from iCloud

**Option B - Working Copy (Git):**
1. Install Working Copy app
2. Clone your yoprint-api-scripts repo
3. Open files in Pythonista via share sheet

**Option C - Copy/Paste:**
1. Open each .py file on your phone
2. Copy the entire contents
3. In Pythonista, create new file and paste

### 3. Configure API Key
Edit the API_KEY in each script (or in yoprint_config.py):

```python
API_KEY = "your-actual-api-key-here"
```

Get your API key from YoPrint:
- Settings > API > Developer API

### 4. Run Scripts
- Open `yoprint_launcher.py` and tap the Play button
- Or run individual scripts directly

## Available Scripts (30 total)

### Search
| Script | Description |
|--------|-------------|
| `global_search.py` | Search everything at once |

### Orders & Quotes
| Script | Description |
|--------|-------------|
| `todays_orders.py` | Today's orders + recent activity |
| `get_order_details.py` | Lookup by SO number |
| `search_orders.py` | Search orders by customer/number |
| `get_order_comments.py` | View comments on an order |
| `get_order_history.py` | View order audit trail |
| `get_order_approvals.py` | View all approvals for an order |
| `get_quote.py` | Lookup by Q number |

### Purchase Orders
| Script | Description |
|--------|-------------|
| `get_purchase_order.py` | Lookup by PO number |
| `get_po_comments.py` | View comments on a PO |
| `get_po_history.py` | View PO audit trail |

### Production Tools
| Script | Description |
|--------|-------------|
| `job_status.py` | Job status for an order |
| `decode_barcode.py` | Decode YoPrint barcodes/QR codes |
| `get_approvals.py` | View pending approvals |

### Customers
| Script | Description |
|--------|-------------|
| `search_customers.py` | Search customers |
| `get_customer_contacts.py` | View contacts for a customer |
| `get_customer_addresses.py` | View addresses for a customer |

### Products
| Script | Description |
|--------|-------------|
| `search_products.py` | Search product catalog |

### Vendors
| Script | Description |
|--------|-------------|
| `search_vendors.py` | Search vendors |
| `get_vendor_contacts.py` | View contacts for a vendor |

### Settings & Configuration
| Script | Description |
|--------|-------------|
| `get_tags.py` | View all tags |
| `get_pipelines.py` | View workflow pipelines |
| `get_message_templates.py` | Email/SMS templates |
| `get_job_presets.py` | All job presets |
| `get_statuses.py` | All status configurations |
| `get_services.py` | Services with pricing |
| `get_shipping_types.py` | Shipping options |
| `get_payment_settings.py` | Payment methods & terms |
| `get_users.py` | Team members |
| `get_webhooks.py` | Webhook subscriptions |

### Launcher
| Script | Description |
|--------|-------------|
| `yoprint_launcher.py` | Main menu launcher |
| `yoprint_config.py` | Shared API configuration |

## Notes

- Scripts use Pythonista's `console` and `dialogs` modules for iPhone-native UI
- `requests` library is built into Pythonista
- Internet connection required for API calls
- API key is stored locally in the script files

## Troubleshooting

**"API Error 401"** - Invalid API key. Check your key in YoPrint settings.

**"Connection Error"** - Check internet connection.

**"Module not found"** - Make sure all .py files are in the same Pythonista folder.

## Security Note

Your API key has access to your YoPrint account. Don't share these scripts with the key included.

## Version History

- v5 (Jan 2026): Added 7 new scripts - order history, PO history, PO comments, order approvals, customer contacts, customer addresses, vendor contacts
- v4: Bug fixes and improvements
- v3: Added 8 scripts - barcode decoder, product search, order search, order comments, tags, pipelines, message templates, approvals
- v2: Added vendors, webhooks, payment settings
- v1: Initial release with core functionality
