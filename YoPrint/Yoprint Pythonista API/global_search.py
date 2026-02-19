# global_search.py
# YoPrint: Global Search (Orders, Customers, Products, Quotes, Jobs)
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


def global_search(term):
    """Search everything in YoPrint"""
    url = f"{BASE_URL_V1}/global/search"
    payload = {"name": term}
    response = requests.post(url, headers=HEADERS, json=payload)
    response.raise_for_status()
    return response.json().get("data", [])


def get_customer_details(customer_id):
    """Get customer details"""
    url = f"{BASE_URL_V1}/customer/{customer_id}"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data")


def get_order_details(order_id):
    """Get order details via V2 API"""
    url = f"{BASE_URL_V2}/v2/sales_order/{order_id}"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data")


def show_item_details(item):
    """Show details for selected item"""
    item_type = item.get("global_search_type", "unknown").lower()
    item_id = item.get("id", "")
    name = item.get("name", "N/A")
    scoped_id = item.get("scoped_id", "")
    
    console.clear()
    console.set_color(0.2, 0.8, 0.2)
    print("=" * 44)
    print(f"  {item_type.upper()} DETAILS")
    print("=" * 44)
    console.set_color()
    print()
    
    if item_type == "customer":
        try:
            details = get_customer_details(item_id)
            print(f"Name:  {details.get('name', 'N/A')}")
            print(f"Email: {details.get('email', 'N/A')}")
            print(f"Phone: {details.get('phone', 'N/A')}")
            console.set_color(0.5, 0.5, 0.5)
            print(f"ID:    {item_id}")
            console.set_color()
        except:
            print(f"Name: {name}")
            print(f"ID:   {item_id}")
    
    elif item_type == "order":
        try:
            details = get_order_details(item_id)
            print(f"Order:    {details.get('scoped_id', scoped_id)}")
            print(f"Customer: {details.get('customer', {}).get('name', 'N/A')}")
            print(f"Status:   {details.get('status', {}).get('label', 'N/A')}")
            total = details.get('calc_total', 0)
            print(f"Total:    ${float(total):,.2f}")
            console.set_color(0.5, 0.5, 0.5)
            print(f"ID:       {item_id}")
            console.set_color()
        except:
            print(f"Order: {scoped_id or name}")
            print(f"ID:    {item_id}")
    
    elif item_type == "quote":
        print(f"Quote: {scoped_id or name}")
        print(f"Name:  {name}")
        console.set_color(0.5, 0.5, 0.5)
        print(f"ID:    {item_id}")
        console.set_color()
    
    elif item_type == "job":
        print(f"Job:  {scoped_id or name}")
        print(f"Name: {name}")
        console.set_color(0.5, 0.5, 0.5)
        print(f"ID:   {item_id}")
        console.set_color()
    
    elif item_type == "product":
        print(f"Product: {name}")
        console.set_color(0.5, 0.5, 0.5)
        print(f"ID:      {item_id}")
        console.set_color()
    
    else:
        print(f"Type: {item_type}")
        print(f"Name: {name}")
        if scoped_id:
            print(f"Scoped ID: {scoped_id}")
        console.set_color(0.5, 0.5, 0.5)
        print(f"ID: {item_id}")
        console.set_color()
    
    print()
    
    # Actions
    action = dialogs.list_dialog("Actions", [
        "📋 Copy ID to Clipboard",
        "🔙 Back to Results"
    ])
    
    if action and "Copy" in action:
        clipboard.set(item_id)
        console.set_color(0.2, 0.8, 0.2)
        print(f"✓ Copied: {item_id}")
        console.set_color()


def main():
    while True:
        console.clear()
        console.set_color(0.2, 0.6, 1.0)
        print("=" * 44)
        print("     YOPRINT GLOBAL SEARCH")
        print("=" * 44)
        console.set_color()
        print()
        print("  Search everything at once:")
        console.set_color(0.5, 0.5, 0.5)
        print("  • Orders, Quotes, Jobs")
        print("  • Customers")
        print("  • Products")
        console.set_color()
        print()
        print("  Examples: Xcel | SO1234 | shirt")
        print()
        
        term = dialogs.input_alert(
            "Global Search",
            "Enter search term:",
            "",
            "Search"
        )
        
        if not term:
            return
        
        print(f"Searching '{term}'...")
        
        try:
            results = global_search(term)
            
            if not results:
                console.set_color(1.0, 0.6, 0.2)
                print("\nNo results found.")
                console.set_color()
                
                again = dialogs.alert("No Results", "Search again?", "Yes", "Exit")
                if again != 1:
                    return
                continue
            
            # Build selection list
            choices = []
            for item in results:
                item_type = item.get("global_search_type", "?").upper()
                scoped_id = item.get("scoped_id", "")
                name = item.get("name", "N/A")
                
                if scoped_id:
                    display = f"[{item_type}] {scoped_id} - {name[:25]}"
                else:
                    display = f"[{item_type}] {name[:35]}"
                choices.append(display)
            
            choices.append("🔍 New Search")
            choices.append("❌ Exit")
            
            console.set_color(0.2, 0.8, 0.2)
            print(f"\nFound {len(results)} result(s)")
            console.set_color()
            
            selection = dialogs.list_dialog(f"Results for '{term}'", choices)
            
            if not selection or "Exit" in selection:
                return
            
            if "New Search" in selection:
                continue
            
            # Find selected item
            idx = choices.index(selection)
            if idx < len(results):
                show_item_details(results[idx])
            
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


if __name__ == "__main__":
    main()
