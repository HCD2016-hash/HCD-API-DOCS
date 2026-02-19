# get_statuses.py
# YoPrint: List All Status Options
# Works in Pythonista 3 on iPhone/iPad

import requests
import console
from collections import defaultdict

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def get_statuses():
    """Get all status options"""
    url = f"{BASE_URL}/setting/status"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data", [])


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     YOPRINT STATUS OPTIONS")
    print("=" * 44)
    console.set_color()
    print()
    
    print("Loading statuses...")
    
    try:
        statuses = get_statuses()
        
        if not statuses:
            console.set_color(1.0, 0.6, 0.2)
            print("\nNo statuses found.")
            console.set_color()
            return
        
        # Group by role
        by_role = defaultdict(list)
        for s in statuses:
            role = s.get("role", "unknown")
            by_role[role].append(s)
        
        # Sort each group by position
        for role in by_role:
            by_role[role].sort(key=lambda x: x.get("position", 0))
        
        console.set_color(0.2, 0.8, 0.2)
        print(f"\nFound {len(statuses)} statuses in {len(by_role)} categories")
        console.set_color()
        
        # Display by role
        role_colors = {
            "order": (0.2, 0.6, 1.0),      # Blue
            "quote": (0.8, 0.4, 1.0),       # Purple
            "job": (1.0, 0.8, 0.2),         # Yellow
            "shipment": (0.2, 0.8, 0.6),    # Teal
            "invoice": (0.2, 0.8, 0.2),     # Green
            "purchase_order": (1.0, 0.5, 0.2),  # Orange
        }
        
        for role, items in sorted(by_role.items()):
            print()
            color = role_colors.get(role, (0.7, 0.7, 0.7))
            console.set_color(*color)
            print(f"═══ {role.upper().replace('_', ' ')} ═══")
            console.set_color()
            
            for s in items:
                label = s.get("label", "N/A")
                status_id = s.get("id", "")
                print(f"  • {label}")
                # Uncomment to show IDs:
                # print(f"    ID: {status_id}")
        
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
