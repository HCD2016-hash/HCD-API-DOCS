# get_services.py
# YoPrint: List All Services
# Works in Pythonista 3 on iPhone/iPad

import requests
import console

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def get_services():
    """Get all services (via service_location endpoint)"""
    url = f"{BASE_URL}/service_location"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data", [])


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     YOPRINT SERVICES")
    print("=" * 44)
    console.set_color()
    print()
    
    print("Loading services...")
    
    try:
        services = get_services()
        
        if not services:
            console.set_color(1.0, 0.6, 0.2)
            print("\nNo services found.")
            console.set_color()
            return
        
        console.set_color(0.2, 0.8, 0.2)
        print(f"\nFound {len(services)} service(s)")
        console.set_color()
        print("-" * 44)
        
        for service in services:
            name = service.get("name", "N/A")
            service_id = service.get("id", "")
            pricing = service.get("pricing_type", "N/A")
            custom_loc = service.get("allow_cust_loc", False)
            
            print()
            console.set_color(1.0, 0.8, 0.2)
            print(f"  {name}", end="")
            console.set_color()
            
            if custom_loc:
                console.set_color(0.5, 0.8, 1.0)
                print(" [Custom Locations]", end="")
                console.set_color()
            print()
            
            console.set_color(0.5, 0.5, 0.5)
            print(f"    ID: {service_id}")
            console.set_color()
            print(f"    Pricing: {pricing}")
            
            # Show enabled locations
            locations = service.get("locations", [])
            enabled = [loc.get("name") for loc in locations if loc.get("enable")]
            if enabled:
                print(f"    Locations: {', '.join(enabled)}")
        
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
