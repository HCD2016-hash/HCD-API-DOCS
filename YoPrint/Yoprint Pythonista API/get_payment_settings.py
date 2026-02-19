# get_payment_settings.py
# YoPrint: Payment Methods & Terms
# Works in Pythonista 3 on iPhone/iPad

import requests
import console
import dialogs

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def get_payment_methods():
    """Get all payment methods"""
    url = f"{BASE_URL}/setting/payment_method"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data", [])


def get_payment_terms():
    """Get all payment terms"""
    url = f"{BASE_URL}/setting/payment_term"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data", [])


def show_methods():
    """Display payment methods"""
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     PAYMENT METHODS")
    print("=" * 44)
    console.set_color()
    print()
    
    methods = get_payment_methods()
    
    if not methods:
        print("No payment methods found.")
        return
    
    console.set_color(0.2, 0.8, 0.2)
    print(f"Found {len(methods)} method(s)")
    console.set_color()
    print("-" * 44)
    
    for method in methods:
        name = method.get("name", "N/A")
        is_default = method.get("default", False)
        
        print()
        console.set_color(1.0, 0.8, 0.2)
        print(f"  {name}", end="")
        console.set_color()
        
        if is_default:
            console.set_color(0.2, 0.8, 0.2)
            print(" [DEFAULT]", end="")
            console.set_color()
        print()
    print()


def show_terms():
    """Display payment terms"""
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     PAYMENT TERMS")
    print("=" * 44)
    console.set_color()
    print()
    
    terms = get_payment_terms()
    
    if not terms:
        print("No payment terms found.")
        return
    
    console.set_color(0.2, 0.8, 0.2)
    print(f"Found {len(terms)} term(s)")
    console.set_color()
    print("-" * 44)
    
    for term in terms:
        name = term.get("name", "N/A")
        is_default = term.get("default", False)
        has_deposit = term.get("enable_deposit", False)
        deposit_pct = term.get("deposit_percent", 0)
        
        print()
        console.set_color(1.0, 0.8, 0.2)
        print(f"  {name}", end="")
        console.set_color()
        
        if is_default:
            console.set_color(0.2, 0.8, 0.2)
            print(" [DEFAULT]", end="")
            console.set_color()
        print()
        
        if has_deposit:
            print(f"    Deposit: {deposit_pct}%")
        else:
            print("    Deposit: Not required")
    print()


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     YOPRINT PAYMENT SETTINGS")
    print("=" * 44)
    console.set_color()
    print()
    
    choice = dialogs.list_dialog("Payment Settings", [
        "💳 Payment Methods",
        "📅 Payment Terms",
        "📋 Show Both"
    ])
    
    if not choice:
        return
    
    try:
        if "Methods" in choice:
            show_methods()
        elif "Terms" in choice:
            show_terms()
        else:
            show_methods()
            input("\nPress Enter for Payment Terms...")
            show_terms()
        
        print("-" * 44)
        console.set_color(0.2, 0.8, 0.2)
        print("✓ Complete")
        console.set_color()
        
    except Exception as e:
        console.set_color(1.0, 0.3, 0.3)
        print(f"Error: {e}")
        console.set_color()


if __name__ == "__main__":
    main()
