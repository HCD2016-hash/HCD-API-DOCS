# yoprint_launcher.py
# YoPrint Mobile Tools Launcher
# Main menu for all YoPrint scripts in Pythonista

import console
import dialogs
import importlib

SCRIPTS = [
    # --- SEARCH ---
    {
        "name": "🔍 Global Search",
        "description": "Search everything at once",
        "module": "global_search"
    },
    # --- ORDERS & QUOTES ---
    {
        "name": "📋 Today's Orders",
        "description": "View today's orders and recent activity",
        "module": "todays_orders"
    },
    {
        "name": "🔎 Order Lookup",
        "description": "Look up order details by SO number",
        "module": "get_order_details"
    },
    {
        "name": "🔎 Order Search",
        "description": "Search orders by customer or number",
        "module": "search_orders"
    },
    {
        "name": "💬 Order Comments",
        "description": "View comments on an order",
        "module": "get_order_comments"
    },
    {
        "name": "📜 Order History",
        "description": "View order audit trail",
        "module": "get_order_history"
    },
    {
        "name": "✅ Order Approvals",
        "description": "View all approvals for an order",
        "module": "get_order_approvals"
    },
    {
        "name": "📝 Quote Lookup",
        "description": "Look up quote by Q number",
        "module": "get_quote"
    },
    # --- PURCHASE ORDERS ---
    {
        "name": "📦 PO Lookup",
        "description": "Look up purchase order by PO number",
        "module": "get_purchase_order"
    },
    {
        "name": "💬 PO Comments",
        "description": "View comments on a PO",
        "module": "get_po_comments"
    },
    {
        "name": "📜 PO History",
        "description": "View PO audit trail",
        "module": "get_po_history"
    },
    # --- PRODUCTION ---
    {
        "name": "📊 Job Status",
        "description": "Check job status for an order",
        "module": "job_status"
    },
    {
        "name": "📊 Barcode Decoder",
        "description": "Decode YoPrint barcodes/QR codes",
        "module": "decode_barcode"
    },
    {
        "name": "✅ Pending Approvals",
        "description": "View all pending approvals",
        "module": "get_approvals"
    },
    # --- CUSTOMERS ---
    {
        "name": "👤 Customer Search",
        "description": "Search customers by name",
        "module": "search_customers"
    },
    {
        "name": "👤 Customer Contacts",
        "description": "View contacts for a customer",
        "module": "get_customer_contacts"
    },
    {
        "name": "📍 Customer Addresses",
        "description": "View addresses for a customer",
        "module": "get_customer_addresses"
    },
    # --- PRODUCTS ---
    {
        "name": "📦 Product Search",
        "description": "Search product catalog",
        "module": "search_products"
    },
    # --- VENDORS ---
    {
        "name": "🏭 Vendor Search",
        "description": "Search and view vendor details",
        "module": "search_vendors"
    },
    {
        "name": "🏭 Vendor Contacts",
        "description": "View contacts for a vendor",
        "module": "get_vendor_contacts"
    },
    # --- SETTINGS & CONFIG ---
    {
        "name": "🏷️ Tags",
        "description": "View all tags",
        "module": "get_tags"
    },
    {
        "name": "📧 Message Templates",
        "description": "View email/SMS templates",
        "module": "get_message_templates"
    },
    {
        "name": "🔄 Pipelines",
        "description": "View workflow pipelines",
        "module": "get_pipelines"
    },
    {
        "name": "⚙️ Job Presets",
        "description": "List all job presets",
        "module": "get_job_presets"
    },
    {
        "name": "🏷️ Statuses",
        "description": "View all status options",
        "module": "get_statuses"
    },
    {
        "name": "🛠️ Services",
        "description": "List all services with pricing",
        "module": "get_services"
    },
    {
        "name": "🚚 Shipping Types",
        "description": "View shipping options",
        "module": "get_shipping_types"
    },
    {
        "name": "💳 Payment Settings",
        "description": "Payment methods & terms",
        "module": "get_payment_settings"
    },
    {
        "name": "👥 Team Users",
        "description": "List all team members",
        "module": "get_users"
    },
    {
        "name": "🔗 Webhooks",
        "description": "View webhook subscriptions",
        "module": "get_webhooks"
    }
]


def show_menu():
    """Display main menu and handle selection"""
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print()
    print("  ╔══════════════════════════════════════╗")
    print("  ║     YOPRINT MOBILE TOOLS             ║")
    print("  ║     Hub City Design                  ║")
    print("  ╚══════════════════════════════════════╝")
    console.set_color()
    print()
    console.set_color(0.5, 0.5, 0.5)
    print(f"  {len(SCRIPTS)} tools available")
    console.set_color()
    print()
    
    # Build menu choices
    choices = [s["name"] for s in SCRIPTS]
    choices.append("⚙️ Settings")
    choices.append("❌ Exit")
    
    selection = dialogs.list_dialog("Select Tool", choices)
    
    if not selection or selection == "❌ Exit":
        console.clear()
        print("Goodbye!")
        return False
    
    if selection == "⚙️ Settings":
        show_settings()
        return True
    
    # Find and run selected script
    for script in SCRIPTS:
        if script["name"] == selection:
            try:
                module = importlib.import_module(script["module"])
                importlib.reload(module)  # Reload to get latest changes
                module.main()
            except Exception as e:
                console.set_color(1.0, 0.3, 0.3)
                print(f"\nError running {script['name']}:")
                print(str(e))
                console.set_color()
            
            # Pause before returning to menu
            input("\nPress Enter to return to menu...")
            return True
    
    return True


def show_settings():
    """Display settings/info screen"""
    console.clear()
    console.set_color(1.0, 0.8, 0.2)
    print("\n  SETTINGS")
    print("  " + "-" * 38)
    console.set_color()
    
    print("""
  To configure your API key:
  
  1. Open yoprint_config.py (or edit
     the API_KEY in each script)
     
  2. Get your API key from YoPrint:
     Settings > API > Developer API
     
  3. Replace the API key with your
     actual API key
     
  Team Slug: hub-city-design-inc
  
  Scripts: """ + str(len(SCRIPTS)) + """ total
  
  Categories:
    • Search: 1
    • Orders/Quotes: 7
    • Purchase Orders: 3
    • Production: 3
    • Customers: 3
    • Products: 1
    • Vendors: 2
    • Settings/Config: 10
  
  Need help? Contact support.
    """)
    
    input("\nPress Enter to return...")


def main():
    """Main loop"""
    while show_menu():
        pass


if __name__ == "__main__":
    main()
