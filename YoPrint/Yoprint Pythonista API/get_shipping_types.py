# get_shipping_types.py
# YoPrint: List All Shipping Types
# Works in Pythonista 3 on iPhone/iPad

import requests
import console

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def get_shipping_types():
    """Get all shipping types"""
    url = f"{BASE_URL}/setting/shipping_type"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data", [])


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     YOPRINT SHIPPING TYPES")
    print("=" * 44)
    console.set_color()
    print()
    
    print("Loading shipping types...")
    
    try:
        shipping_types = get_shipping_types()
        
        if not shipping_types:
            console.set_color(1.0, 0.6, 0.2)
            print("\nNo shipping types found.")
            console.set_color()
            return
        
        console.set_color(0.2, 0.8, 0.2)
        print(f"\nFound {len(shipping_types)} shipping type(s)")
        console.set_color()
        print("-" * 44)
        
        for ship in shipping_types:
            name = ship.get("name", "N/A")
            ship_id = ship.get("id", "")
            ship_type = ship.get("type", "N/A")
            is_default = ship.get("default", False)
            price_type = ship.get("price_type", "")
            price_pct = ship.get("price_percent", 0)
            min_price = ship.get("min_price")
            service_code = ship.get("service_code", "")
            
            print()
            console.set_color(1.0, 0.8, 0.2)
            print(f"  {name}", end="")
            console.set_color()
            
            if is_default:
                console.set_color(0.2, 0.8, 0.2)
                print(" [DEFAULT]", end="")
                console.set_color()
            print()
            
            console.set_color(0.5, 0.5, 0.5)
            print(f"    ID: {ship_id}")
            console.set_color()
            print(f"    Type: {ship_type}")
            
            if service_code:
                print(f"    Service Code: {service_code}")
            
            if price_type == "markup":
                print(f"    Pricing: {price_pct}% markup")
            elif price_type:
                print(f"    Pricing: {price_type}")
            
            if min_price:
                print(f"    Min Price: ${min_price}")
        
        print()
        print("-" * 44)
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
