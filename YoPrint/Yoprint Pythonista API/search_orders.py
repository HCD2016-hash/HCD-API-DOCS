# search_orders.py
# YoPrint: Search Sales Orders
# Works in Pythonista 3 on iPhone/iPad

import requests
import console
import dialogs
import clipboard

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL_V1 = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
BASE_URL_V2 = f"https://secure.yoprint.com/v2/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def search_orders(term):
    """Search sales orders by customer name or order number"""
    url = f"{BASE_URL_V1}/sales_order/search"
    payload = {"name": term}
    response = requests.post(url, headers=HEADERS, json=payload)
    response.raise_for_status()
    return response.json().get("data", [])


def get_order_details(uuid):
    """Get full order details by UUID"""
    url = f"{BASE_URL_V2}/v2/sales_order/{uuid}"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data")


def format_currency(value):
    try:
        return f"${float(value):,.2f}"
    except (ValueError, TypeError):
        return "$0.00"


def main():
    while True:
        console.clear()
        console.set_color(0.2, 0.6, 1.0)
        print("=" * 44)
        print("     YOPRINT ORDER SEARCH")
        print("=" * 44)
        console.set_color()
        print()
        print("  Search by customer name or order number")
        print()
        console.set_color(0.5, 0.5, 0.5)
        print("  Examples: Xcel | Tree Tech | SO1234")
        print("  Leave blank to see recent orders")
        console.set_color()
        print()
        
        term = dialogs.input_alert(
            "Order Search",
            "Enter search:",
            "",
            "Search"
        )
        
        if term is None:
            return
        
        print(f"Searching '{term}'..." if term else "Loading recent orders...")
        
        try:
            orders = search_orders(term)
            
            if not orders:
                console.set_color(1.0, 0.6, 0.2)
                print("\nNo orders found.")
                console.set_color()
                
                again = dialogs.alert("No Results", "Search again?", "Yes", "Exit")
                if again != 1:
                    return
                continue
            
            console.set_color(0.2, 0.8, 0.2)
            print(f"\nFound {len(orders)} order(s)")
            console.set_color()
            print("-" * 44)
            print()
            
            # Header
            console.set_color(1.0, 0.8, 0.2)
            print("  ORDER      CUSTOMER                 STATUS")
            console.set_color()
            print()
            
            # Build choices and display
            choices = []
            for order in orders:
                scoped_id = order.get("scoped_id", "N/A")
                customer = order.get("customer", {})
                cust_name = customer.get("name", "(No Customer)") if customer else "(No Customer)"
                status = order.get("status", {})
                stat_label = status.get("label", "N/A") if status else "N/A"
                
                # Truncate customer name
                if len(cust_name) > 22:
                    cust_name = cust_name[:19] + "..."
                
                # Display
                print(f"  {scoped_id:10} {cust_name:22} {stat_label}")
                
                # For selection list
                choices.append(f"{scoped_id} - {cust_name[:18]}")
            
            choices.append("🔍 New Search")
            choices.append("❌ Exit")
            
            print()
            print("-" * 44)
            
            selection = dialogs.list_dialog(f"Select Order ({len(orders)})", choices)
            
            if not selection or "Exit" in selection:
                return
            
            if "New Search" in selection:
                continue
            
            # Show selected order details
            idx = choices.index(selection)
            if idx < len(orders):
                show_order_details(orders[idx])
            
        except requests.exceptions.HTTPError as e:
            console.set_color(1.0, 0.3, 0.3)
            print(f"API Error: {e}")
            console.set_color()
            input("\nPress Enter to continue...")
        except Exception as e:
            console.set_color(1.0, 0.3, 0.3)
            print(f"Error: {e}")
            console.set_color()
            input("\nPress Enter to continue...")


def show_order_details(order_summary):
    """Show detailed order info"""
    console.clear()
    
    scoped_id = order_summary.get("scoped_id", "N/A")
    uuid = order_summary.get("id", "")
    
    console.set_color(0.2, 0.8, 0.2)
    print("=" * 44)
    print(f"  ORDER: {scoped_id}")
    print("=" * 44)
    console.set_color()
    print()
    print("Loading details...")
    
    try:
        order = get_order_details(uuid)
        
        console.clear()
        console.set_color(0.2, 0.8, 0.2)
        print("=" * 44)
        print(f"  ORDER: {order.get('scoped_id', scoped_id)}")
        print("=" * 44)
        console.set_color()
        print()
        
        # Customer
        customer = order.get("customer", {})
        cust_name = customer.get("name", "N/A") if customer else "N/A"
        print(f"  Customer: {cust_name}")
        
        # Status
        status = order.get("status", {})
        stat_label = status.get("label", "N/A") if status else "N/A"
        print(f"  Status:   {stat_label}")
        print()
        
        # Dates
        console.set_color(1.0, 0.8, 0.2)
        print("  DATES")
        console.set_color()
        print(f"    Issue: {order.get('issue_date', 'N/A')}")
        print(f"    Due:   {order.get('due_date', 'N/A')}")
        print()
        
        # Financials
        console.set_color(1.0, 0.8, 0.2)
        print("  FINANCIALS")
        console.set_color()
        print(f"    Subtotal: {format_currency(order.get('calc_subtotal'))}")
        print(f"    Tax:      {format_currency(order.get('calc_tax'))}")
        console.set_color(0.2, 0.8, 0.2)
        print(f"    TOTAL:    {format_currency(order.get('calc_total'))}")
        console.set_color()
        print(f"    Paid:     {format_currency(order.get('paid_amount'))}")
        print(f"    Due:      {format_currency(order.get('full_amount_due'))}")
        print()
        
        # Jobs
        jobs = order.get("jobs", [])
        if jobs:
            console.set_color(1.0, 0.8, 0.2)
            print(f"  JOBS ({len(jobs)})")
            console.set_color()
            for job in jobs:
                job_name = job.get("name", "N/A")
                qty = job.get("quantity", 0)
                print(f"    • {job_name} - Qty: {qty}")
        
        print()
        console.set_color(0.5, 0.5, 0.5)
        print(f"  ID: {uuid}")
        console.set_color()
        
    except Exception as e:
        console.set_color(1.0, 0.3, 0.3)
        print(f"Error loading details: {e}")
        console.set_color()
    
    print()
    
    action = dialogs.list_dialog("Actions", [
        "📋 Copy Order ID",
        f"📋 Copy {scoped_id}",
        "🔙 Back to Search"
    ])
    
    if action and "Order ID" in action:
        clipboard.set(uuid)
        console.set_color(0.2, 0.8, 0.2)
        print(f"✓ Copied: {uuid}")
        console.set_color()
    elif action and scoped_id in action:
        clipboard.set(scoped_id)
        console.set_color(0.2, 0.8, 0.2)
        print(f"✓ Copied: {scoped_id}")
        console.set_color()


if __name__ == "__main__":
    main()
