# get_order_approvals.py
# YoPrint: View all approvals (order + job level) for a sales order
# Works in Pythonista 3 on iPhone/iPad

import requests
import console
import dialogs

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL_V1 = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
BASE_URL_V2 = f"https://secure.yoprint.com/v2/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def lookup_order(order_number):
    """Lookup order UUID by SO number"""
    url = f"{BASE_URL_V1}/global/scoped_id_search"
    payload = {"type": "order", "scoped_id": order_number}
    response = requests.post(url, headers=HEADERS, json=payload)
    response.raise_for_status()
    
    data = response.json().get("data", [])
    if not data:
        return None, None
    
    for item in data:
        if item.get("scoped_id") == order_number:
            return item.get("id"), item.get("name")
    
    return data[0].get("id"), data[0].get("name")


def get_all_approvals(order_id):
    """Get all approvals for an order (order + job level)"""
    url = f"{BASE_URL_V2}/v2/sales_order/{order_id}/all_approvals"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data", [])


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     ORDER APPROVALS")
    print("=" * 44)
    console.set_color()
    print()
    
    console.set_color(0.5, 0.5, 0.5)
    print("  View all approvals for a sales order")
    print("  (order + job level)")
    print("  Examples: 1234 | SO1234 | so5678")
    console.set_color()
    print()
    
    # Get order number
    order_input = dialogs.input_alert("Order Approvals", "Enter SO number:")
    if not order_input:
        print("Cancelled.")
        return
    
    # Format order number
    order_number = order_input.strip().upper()
    if order_number.isdigit():
        order_number = f"SO{order_number}"
    
    print(f"Looking up {order_number}...")
    
    try:
        order_id, order_name = lookup_order(order_number)
        
        if not order_id:
            console.set_color(1.0, 0.3, 0.3)
            print(f"\nOrder '{order_number}' not found.")
            console.set_color()
            return
        
        console.set_color(0.5, 0.5, 0.5)
        print(f"Found: {order_name}")
        console.set_color()
        print("Loading approvals...")
        
        approvals = get_all_approvals(order_id)
        
        print()
        console.set_color(0.2, 0.8, 0.2)
        print(f"Found {len(approvals)} approval(s)")
        console.set_color()
        print("-" * 44)
        print()
        
        if not approvals:
            console.set_color(1.0, 0.6, 0.2)
            print("No approvals found for this order.")
            console.set_color()
        else:
            for approval in approvals:
                # Determine type (order or job level)
                approval_type = "Job" if approval.get("job_id") else "Order"
                
                # Get status with color
                status = approval.get("status", "unknown")
                
                # Type indicator
                console.set_color(0.2, 0.8, 0.9)  # Cyan
                print(f"  [{approval_type}]", end=" ")
                console.set_color()
                
                # Approval ID (truncated)
                approval_id = approval.get("id", "")[:8]
                print(f"{approval_id}...")
                
                # Status with color coding
                print("         Status: ", end="")
                if status == "pending":
                    console.set_color(1.0, 0.8, 0.2)  # Yellow
                elif status == "completed":
                    console.set_color(0.2, 0.8, 0.2)  # Green
                elif status == "need-changes":
                    console.set_color(1.0, 0.3, 0.3)  # Red
                else:
                    console.set_color()
                print(status)
                console.set_color()
                
                # Notes to customer
                notes = approval.get("notes_to_customer")
                if notes:
                    console.set_color(0.5, 0.5, 0.5)
                    print(f"         Notes: {notes[:50]}...")
                    console.set_color()
                
                print()
        
        print("-" * 44)
        console.set_color(0.2, 0.8, 0.2)
        print("✓ Complete")
        console.set_color()
        
    except requests.exceptions.HTTPError as e:
        console.set_color(1.0, 0.3, 0.3)
        print(f"\nAPI Error: {e}")
        console.set_color()
    except Exception as e:
        console.set_color(1.0, 0.3, 0.3)
        print(f"\nError: {e}")
        console.set_color()


if __name__ == "__main__":
    main()
