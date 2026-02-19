# get_order_history.py
# YoPrint: View activity history (audit trail) for a sales order
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
    
    # Find exact match (API returns fuzzy matches)
    for item in data:
        if item.get("scoped_id") == order_number:
            return item.get("id"), item.get("name")
    
    # Fall back to first result
    return data[0].get("id"), data[0].get("name")


def get_history(order_id):
    """Get order history/audit trail"""
    url = f"{BASE_URL_V2}/v2/sales_order/{order_id}/history?page=1"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data", [])


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     ORDER ACTIVITY HISTORY")
    print("=" * 44)
    console.set_color()
    print()
    
    console.set_color(0.5, 0.5, 0.5)
    print("  View audit trail for a sales order")
    print("  Examples: 1234 | SO1234 | so5678")
    console.set_color()
    print()
    
    # Get order number
    order_input = dialogs.input_alert("Order History", "Enter SO number:")
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
        print("Loading history...")
        
        history = get_history(order_id)
        
        print()
        console.set_color(0.2, 0.8, 0.2)
        print(f"Found {len(history)} history entries")
        console.set_color()
        print("-" * 44)
        print()
        
        if not history:
            console.set_color(1.0, 0.6, 0.2)
            print("No history found for this order.")
            console.set_color()
        else:
            for entry in history:
                # Get date
                created = entry.get("created_at", "")
                date = created[:10] if created else "Unknown"
                
                # Format action
                action = entry.get("action", "unknown")
                action = action.replace("_", " ").title()
                
                console.set_color(0.5, 0.5, 0.5)
                print(f"  [{date}]", end=" ")
                console.set_color()
                print(action)
                
                # Get who made the change
                obj = entry.get("object", {})
                contact = obj.get("contact", {})
                if contact:
                    first = contact.get("first_name", "")
                    last = contact.get("last_name", "")
                    name = f"{first} {last}".strip()
                    if name:
                        console.set_color(0.5, 0.5, 0.5)
                        print(f"           By: {name}")
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
