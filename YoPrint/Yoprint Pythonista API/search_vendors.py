# search_vendors.py
# YoPrint: Search and View Vendors
# Works in Pythonista 3 on iPhone/iPad

import requests
import console
import dialogs

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def get_vendors(page=1):
    """Get paginated list of vendors"""
    url = f"{BASE_URL}/vendor?page={page}"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json()


def get_vendor_details(vendor_id):
    """Get full vendor details"""
    url = f"{BASE_URL}/vendor/{vendor_id}"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data")


def get_vendor_contacts(vendor_id):
    """Get vendor contacts"""
    url = f"{BASE_URL}/vendor/{vendor_id}/contact"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data", [])


def search_vendors(term):
    """Search vendors by name"""
    url = f"{BASE_URL}/vendor/search"
    payload = {"name": term}
    response = requests.post(url, headers=HEADERS, json=payload)
    response.raise_for_status()
    return response.json().get("data", [])


def show_vendor_details(vendor):
    """Display full vendor info"""
    console.clear()
    
    details = get_vendor_details(vendor["id"])
    
    console.set_color(0.2, 0.8, 0.2)
    print("=" * 44)
    print(f"  {details.get('name', 'N/A')}")
    print("=" * 44)
    console.set_color()
    print()
    
    if details.get("email"):
        print(f"Email:   {details['email']}")
    if details.get("phone"):
        print(f"Phone:   {details['phone']}")
    if details.get("website"):
        print(f"Website: {details['website']}")
    
    # Address
    addr = details.get("address", {})
    if addr:
        print()
        console.set_color(1.0, 0.8, 0.2)
        print("ADDRESS:")
        console.set_color()
        if addr.get("line1"):
            print(f"  {addr['line1']}")
        if addr.get("line2"):
            print(f"  {addr['line2']}")
        city = addr.get("city", "")
        state = addr.get("state", "")
        zip_code = addr.get("postal_code", "")
        if city or state:
            print(f"  {city}, {state} {zip_code}")
    
    # Notes
    if details.get("notes"):
        print()
        console.set_color(1.0, 0.8, 0.2)
        print("NOTES:")
        console.set_color()
        print(f"  {details['notes'][:200]}")
    
    # Contacts
    try:
        contacts = get_vendor_contacts(vendor["id"])
        if contacts:
            print()
            console.set_color(1.0, 0.8, 0.2)
            print(f"CONTACTS ({len(contacts)}):")
            console.set_color()
            for c in contacts:
                name = f"{c.get('first_name', '')} {c.get('last_name', '')}".strip()
                primary = " ★" if c.get("is_primary") else ""
                print(f"  {name}{primary}")
                if c.get("email"):
                    print(f"    Email: {c['email']}")
                if c.get("phone"):
                    print(f"    Phone: {c['phone']}")
    except:
        pass
    
    print()


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     YOPRINT VENDORS")
    print("=" * 44)
    console.set_color()
    print()
    
    # Ask search or browse
    action = dialogs.list_dialog("Vendors", [
        "🔍 Search by Name",
        "📋 Browse All Vendors"
    ])
    
    if not action:
        return
    
    vendors = []
    
    if "Search" in action:
        term = dialogs.input_alert("Search Vendors", "Enter vendor name:", "", "Search")
        if not term:
            return
        print(f"Searching '{term}'...")
        vendors = search_vendors(term)
    else:
        print("Loading vendors...")
        result = get_vendors(page=1)
        vendors = result.get("data", [])
    
    if not vendors:
        console.set_color(1.0, 0.6, 0.2)
        print("\nNo vendors found.")
        console.set_color()
        return
    
    # Build selection list
    choices = [v.get("name", "N/A") for v in vendors]
    
    console.set_color(0.2, 0.8, 0.2)
    print(f"\nFound {len(vendors)} vendor(s)")
    console.set_color()
    
    selection = dialogs.list_dialog("Select Vendor", choices)
    
    if selection:
        idx = choices.index(selection)
        vendor = vendors[idx]
        show_vendor_details(vendor)
        input("Press Enter to exit...")


if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        console.set_color(1.0, 0.3, 0.3)
        print(f"Error: {e}")
        console.set_color()
