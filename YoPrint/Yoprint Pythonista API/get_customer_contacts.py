# get_customer_contacts.py
# YoPrint: View all contacts for a customer
# Works in Pythonista 3 on iPhone/iPad
#
# NOTE: Requires Customer UUID. Get it from:
# - Customer search results
# - Order details (customer_id field)
# - Global search

import requests
import console
import dialogs
import clipboard

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def get_contacts(customer_id):
    """Get all contacts for a customer"""
    url = f"{BASE_URL}/customer/{customer_id}/contact"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data", [])


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     CUSTOMER CONTACTS")
    print("=" * 44)
    console.set_color()
    print()
    
    console.set_color(0.5, 0.5, 0.5)
    print("  View all contacts for a customer")
    print("  Requires Customer UUID")
    print("  (Get from search or order details)")
    console.set_color()
    print()
    
    # Check clipboard for UUID
    clip = clipboard.get()
    default_value = ""
    if clip and len(clip) == 36 and clip.count("-") == 4:
        default_value = clip
        console.set_color(0.5, 0.5, 0.5)
        print(f"  Found UUID in clipboard: {clip[:8]}...")
        console.set_color()
        print()
    
    # Get customer ID
    customer_id = dialogs.input_alert(
        "Customer Contacts",
        "Enter Customer UUID:",
        default_value
    )
    
    if not customer_id:
        print("Cancelled.")
        return
    
    customer_id = customer_id.strip()
    
    # Basic UUID validation
    if len(customer_id) != 36 or customer_id.count("-") != 4:
        console.set_color(1.0, 0.6, 0.2)
        print("Warning: Input doesn't look like a UUID")
        print("Expected format: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
        console.set_color()
        print()
    
    print("Loading contacts...")
    
    try:
        contacts = get_contacts(customer_id)
        
        print()
        console.set_color(0.2, 0.8, 0.2)
        print(f"Found {len(contacts)} contact(s)")
        console.set_color()
        print("-" * 44)
        print()
        
        if not contacts:
            console.set_color(1.0, 0.6, 0.2)
            print("No contacts found for this customer.")
            console.set_color()
        else:
            for contact in contacts:
                first = contact.get("first_name", "")
                last = contact.get("last_name", "")
                name = f"{first} {last}".strip() or "(No name)"
                
                # Primary indicator
                is_primary = contact.get("is_primary", False)
                primary_tag = " [PRIMARY]" if is_primary else ""
                
                console.set_color(1.0, 1.0, 1.0)
                print(f"  {name}{primary_tag}")
                console.set_color()
                
                # Email
                email = contact.get("email")
                if email:
                    console.set_color(0.5, 0.5, 0.5)
                    print(f"     Email: {email}")
                    console.set_color()
                
                # Phone
                phone = contact.get("phone")
                if phone:
                    console.set_color(0.5, 0.5, 0.5)
                    print(f"     Phone: {phone}")
                    console.set_color()
                
                print()
        
        print("-" * 44)
        console.set_color(0.2, 0.8, 0.2)
        print("✓ Complete")
        console.set_color()
        
    except requests.exceptions.HTTPError as e:
        console.set_color(1.0, 0.3, 0.3)
        if "404" in str(e):
            print("\nCustomer not found. Check the UUID.")
        else:
            print(f"\nAPI Error: {e}")
        console.set_color()
    except Exception as e:
        console.set_color(1.0, 0.3, 0.3)
        print(f"\nError: {e}")
        console.set_color()


if __name__ == "__main__":
    main()
