# get_purchase_order.py
# YoPrint: Purchase Order Lookup by PO Number
# Works in Pythonista 3 on iPhone/iPad

import requests
import console
import dialogs

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL_V1 = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def search_po(scoped_id):
    """Search for PO by number, return UUID"""
    # Auto-add PO prefix if just digits
    if scoped_id.isdigit():
        scoped_id = f"PO{scoped_id}"
    scoped_id = scoped_id.upper()
    
    url = f"{BASE_URL_V1}/global/scoped_id_search"
    payload = {"type": "purchase_order", "scoped_id": scoped_id}
    
    response = requests.post(url, headers=HEADERS, json=payload)
    response.raise_for_status()
    
    data = response.json().get("data", [])
    for item in data:
        if item.get("scoped_id") == scoped_id:
            return item
    return data[0] if data else None


def get_po_details(uuid):
    """Get full PO details"""
    url = f"{BASE_URL_V1}/purchase_order/{uuid}"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data")


def format_currency(value):
    try:
        return f"${float(value):,.2f}"
    except (ValueError, TypeError):
        return "$0.00"


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     YOPRINT PURCHASE ORDER LOOKUP")
    print("=" * 44)
    console.set_color()
    print()
    
    po_id = dialogs.input_alert(
        "PO Lookup",
        "Enter PO number (e.g., PO1234 or just 1234):",
        "",
        "Look Up"
    )
    
    if not po_id:
        print("Cancelled.")
        return
    
    print(f"Looking up {po_id}...")
    print()
    
    try:
        search_result = search_po(po_id)
        if not search_result:
            console.set_color(1.0, 0.3, 0.3)
            print(f"ERROR: Purchase Order {po_id} not found")
            console.set_color()
            return
        
        po = get_po_details(search_result["id"])
        
        console.set_color(1.0, 0.5, 0.2)  # Orange for POs
        print("=" * 44)
        print(f"  PO: {po.get('scoped_id', 'N/A')}")
        print("=" * 44)
        console.set_color()
        print()
        
        # Vendor info
        vendor = po.get("vendor", {})
        print(f"VENDOR:    {vendor.get('name', 'N/A')}")
        print(f"STATUS:    {po.get('status', {}).get('label', 'N/A')}")
        print()
        
        console.set_color(1.0, 0.8, 0.2)
        print("DATES:")
        console.set_color()
        print(f"  Created:  {po.get('created_at', 'N/A')[:10]}")
        print(f"  Due Date: {po.get('due_date', 'N/A')}")
        print()
        
        console.set_color(1.0, 0.8, 0.2)
        print("FINANCIALS:")
        console.set_color()
        subtotal = po.get("calc_subtotal", po.get("subtotal", 0))
        tax = po.get("calc_tax", po.get("tax", 0))
        total = po.get("calc_total", po.get("total", 0))
        
        print(f"  Subtotal: {format_currency(subtotal)}")
        print(f"  Tax:      {format_currency(tax)}")
        console.set_color(0.2, 0.8, 0.2)
        print(f"  TOTAL:    {format_currency(total)}")
        console.set_color()
        print()
        
        # Line items
        items = po.get("items", po.get("line_items", []))
        if items:
            console.set_color(1.0, 0.8, 0.2)
            print(f"LINE ITEMS ({len(items)}):")
            console.set_color()
            for item in items:
                name = item.get("name", item.get("description", "N/A"))
                qty = item.get("quantity", 0)
                price = item.get("price", item.get("unit_price", 0))
                print(f"  • {name[:30]}")
                print(f"    Qty: {qty} @ {format_currency(price)}")
        
        # Linked sales orders
        linked = po.get("sales_orders", po.get("linked_orders", []))
        if linked:
            print()
            console.set_color(1.0, 0.8, 0.2)
            print("LINKED ORDERS:")
            console.set_color()
            for order in linked[:5]:
                if isinstance(order, dict):
                    print(f"  • {order.get('scoped_id', order.get('id', 'N/A'))}")
                else:
                    print(f"  • {order}")
        
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
