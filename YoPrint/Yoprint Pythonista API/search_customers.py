# search_customers.py
# YoPrint: Search Customers
# Works in Pythonista 3 on iPhone/iPad

import requests
import json
import console
import dialogs

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def search_customers(term):
    """Search customers by name"""
    url = f"{BASE_URL}/customer/search"
    payload = {"name": term}
    
    response = requests.post(url, headers=HEADERS, json=payload)
    response.raise_for_status()
    return response.json().get("data", [])


def get_customer_details(customer_id):
    """Get full customer details including contacts"""
    url = f"{BASE_URL}/customer/{customer_id}"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data")


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     YOPRINT CUSTOMER SEARCH")
    print("=" * 44)
    console.set_color()
    print()
    
    # Get search term
    search_term = dialogs.input_alert(
        "Customer Search",
        "Enter customer name to search:",
        "",
        "Search"
    )
    
    if not search_term:
        print("Cancelled.")
        return
    
    print(f"Searching for '{search_term}'...")
    print()
    
    try:
        results = search_customers(search_term)
        
        if not results:
            console.set_color(1.0, 0.6, 0.2)
            print("No customers found.")
            console.set_color()
            return
        
        console.set_color(0.2, 0.8, 0.2)
        print(f"Found {len(results)} customer(s):")
        console.set_color()
        print("-" * 44)
        
        # Build list for selection
        choices = []
        for i, cust in enumerate(results, 1):
            name = cust.get("name", "N/A")
            email = cust.get("email", "")
            phone = cust.get("phone", "")
            
            display = f"{name}"
            if email:
                display += f" | {email}"
            
            choices.append(display)
            print(f"[{i}] {display}")
        
        print()
        
        # Ask if they want details
        selection = dialogs.list_dialog(
            "Select Customer",
            choices
        )
        
        if selection:
            idx = choices.index(selection)
            customer = results[idx]
            
            # Get full details
            details = get_customer_details(customer["id"])
            
            console.clear()
            console.set_color(0.2, 0.8, 0.2)
            print("=" * 44)
            print(f"  {details.get('name', 'N/A')}")
            print("=" * 44)
            console.set_color()
            print()
            
            print(f"ID:      {details.get('scoped_id', 'N/A')}")
            print(f"Email:   {details.get('email', 'N/A')}")
            print(f"Phone:   {details.get('phone', 'N/A')}")
            print(f"Tax ID:  {details.get('vat_number', 'N/A')}")
            print(f"Resale#: {details.get('resale_number', 'N/A')}")
            print()
            
            # Contacts
            contacts = details.get("contacts", [])
            if contacts:
                console.set_color(1.0, 0.8, 0.2)
                print(f"CONTACTS ({len(contacts)}):")
                console.set_color()
                for c in contacts:
                    name = f"{c.get('first_name', '')} {c.get('last_name', '')}".strip()
                    email = c.get("email", "")
                    phone = c.get("phone", "")
                    primary = "★" if c.get("is_primary") else ""
                    print(f"  {primary} {name}")
                    if email:
                        print(f"      Email: {email}")
                    if phone:
                        print(f"      Phone: {phone}")
            
            print()
            console.set_color(0.2, 0.8, 0.2)
            print("✓ Complete")
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
