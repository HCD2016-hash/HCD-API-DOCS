# get_order_details.py
# YoPrint: Get Order Details by SO Number
# Works in Pythonista 3 on iPhone/iPad

import requests
import json
import console  # Pythonista module for UI
import dialogs  # Pythonista module for input dialogs

# Config - edit these or import from yoprint_config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL_V1 = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
BASE_URL_V2 = f"https://secure.yoprint.com/v2/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def search_order(scoped_id):
    """Search for order by SO number, return UUID"""
    # Auto-add SO prefix if just digits
    if scoped_id.isdigit():
        scoped_id = f"SO{scoped_id}"
    scoped_id = scoped_id.upper()
    
    url = f"{BASE_URL_V1}/global/scoped_id_search"
    payload = {"type": "order", "scoped_id": scoped_id}
    
    response = requests.post(url, headers=HEADERS, json=payload)
    response.raise_for_status()
    
    data = response.json().get("data", [])
    # Find exact match
    for item in data:
        if item.get("scoped_id") == scoped_id:
            return item
    return data[0] if data else None


def get_order_details(uuid):
    """Get full order details by UUID"""
    url = f"{BASE_URL_V2}/v2/sales_order/{uuid}"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data")


def format_currency(value):
    """Format number as currency"""
    try:
        return f"${float(value):,.2f}"
    except (ValueError, TypeError):
        return "$0.00"


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     YOPRINT ORDER LOOKUP")
    print("=" * 44)
    console.set_color()
    print()
    
    # Get order number from user
    order_id = dialogs.input_alert(
        "Order Lookup",
        "Enter order number (e.g., SO1234 or just 1234):",
        "",
        "Look Up"
    )
    
    if not order_id:
        print("Cancelled.")
        return
    
    print(f"Looking up {order_id}...")
    print()
    
    try:
        # Search for order
        search_result = search_order(order_id)
        if not search_result:
            console.set_color(1.0, 0.3, 0.3)
            print(f"ERROR: Order {order_id} not found")
            console.set_color()
            return
        
        # Get full details
        order = get_order_details(search_result["id"])
        
        # Display results
        console.set_color(0.2, 0.8, 0.2)
        print("=" * 44)
        print(f"  ORDER: {order.get('scoped_id', 'N/A')}")
        print("=" * 44)
        console.set_color()
        print()
        
        print(f"CUSTOMER:  {order.get('customer', {}).get('name', 'N/A')}")
        print(f"STATUS:    {order.get('status', {}).get('label', 'N/A')}")
        print()
        
        console.set_color(1.0, 0.8, 0.2)
        print("DATES:")
        console.set_color()
        print(f"  Issue:   {order.get('issue_date', 'N/A')}")
        print(f"  Due:     {order.get('due_date', 'N/A')}")
        print()
        
        console.set_color(1.0, 0.8, 0.2)
        print("FINANCIALS:")
        console.set_color()
        print(f"  Subtotal: {format_currency(order.get('calc_subtotal'))}")
        print(f"  Tax:      {format_currency(order.get('calc_tax'))}")
        console.set_color(0.2, 0.8, 0.2)
        print(f"  TOTAL:    {format_currency(order.get('calc_total'))}")
        console.set_color()
        print(f"  Paid:     {format_currency(order.get('paid_amount'))}")
        print(f"  Due:      {format_currency(order.get('full_amount_due'))}")
        print()
        
        # Jobs summary
        jobs = order.get("jobs", [])
        if jobs:
            console.set_color(1.0, 0.8, 0.2)
            print(f"JOBS ({len(jobs)}):")
            console.set_color()
            for job in jobs:
                print(f"  • {job.get('name', 'N/A')} - Qty: {job.get('quantity', 0)}")
        
        print()
        console.set_color(0.2, 0.8, 0.2)
        print("✓ Lookup complete")
        console.set_color()
        
    except requests.exceptions.HTTPError as e:
        console.set_color(1.0, 0.3, 0.3)
        print(f"API Error: {e}")
        console.set_color()
    except Exception as e:
        console.set_color(1.0, 0.3, 0.3)
        print(f"Error: {e}")
        console.set_color()


if __name__ == "__main__":
    main()
