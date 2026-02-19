# get_po_history.py
# YoPrint: View activity history (audit trail) for a purchase order
# Works in Pythonista 3 on iPhone/iPad

import requests
import console
import dialogs

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def lookup_po(po_number):
    """Lookup PO UUID by PO number"""
    url = f"{BASE_URL}/scoped_id_search"
    payload = {"scoped_id": po_number, "type": "purchase_order"}
    response = requests.post(url, headers=HEADERS, json=payload)
    response.raise_for_status()
    
    data = response.json().get("data", [])
    if not data:
        return None
    
    # Handle both single result and array
    if isinstance(data, list):
        # Find exact match (API returns fuzzy matches)
        for item in data:
            if item.get("scoped_id") == po_number:
                return item.get("id")
        return data[0].get("id") if data else None
    else:
        return data.get("id")


def get_history(po_id):
    """Get PO history/audit trail"""
    url = f"{BASE_URL}/purchase_order/{po_id}/history?page=1"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data", [])


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     PURCHASE ORDER HISTORY")
    print("=" * 44)
    console.set_color()
    print()
    
    console.set_color(0.5, 0.5, 0.5)
    print("  View audit trail for a purchase order")
    print("  Examples: PO1234 | po5678")
    console.set_color()
    print()
    
    # Get PO number
    po_input = dialogs.input_alert("PO History", "Enter PO number:")
    if not po_input:
        print("Cancelled.")
        return
    
    # Format PO number
    po_number = po_input.strip().upper()
    if po_number.isdigit():
        po_number = f"PO{po_number}"
    
    print(f"Looking up {po_number}...")
    
    try:
        po_id = lookup_po(po_number)
        
        if not po_id:
            console.set_color(1.0, 0.3, 0.3)
            print(f"\nPO '{po_number}' not found.")
            console.set_color()
            return
        
        console.set_color(0.5, 0.5, 0.5)
        print(f"Found PO ID: {po_id[:8]}...")
        console.set_color()
        print("Loading history...")
        
        history = get_history(po_id)
        
        print()
        console.set_color(0.2, 0.8, 0.2)
        print(f"Found {len(history)} history entries")
        console.set_color()
        print("-" * 44)
        print()
        
        if not history:
            console.set_color(1.0, 0.6, 0.2)
            print("No history found for this PO.")
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
