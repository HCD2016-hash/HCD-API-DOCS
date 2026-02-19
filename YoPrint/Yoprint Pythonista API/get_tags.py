# get_tags.py
# YoPrint: View All Tags
# Works in Pythonista 3 on iPhone/iPad

import requests
import console

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def get_tags():
    """Get all tags"""
    url = f"{BASE_URL}/tag"
    params = {"page": 1}
    response = requests.get(url, headers=HEADERS, params=params)
    response.raise_for_status()
    return response.json().get("data", [])


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     YOPRINT TAGS")
    print("=" * 44)
    console.set_color()
    print()
    print("  Tags help organize orders & quotes")
    print()
    print("Loading...")
    
    try:
        tags = get_tags()
        
        if not tags:
            console.set_color(1.0, 0.6, 0.2)
            print("\nNo tags found.")
            console.set_color()
            return
        
        console.set_color(0.2, 0.8, 0.2)
        print(f"\nFound {len(tags)} tag(s)")
        console.set_color()
        print("-" * 44)
        print()
        
        for tag in tags:
            name = tag.get("name", "N/A")
            color = tag.get("color", "")
            
            console.set_color(1.0, 0.8, 0.2)
            print(f"  • {name}")
            console.set_color()
            if color:
                console.set_color(0.5, 0.5, 0.5)
                print(f"    Color: {color}")
                console.set_color()
        
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
