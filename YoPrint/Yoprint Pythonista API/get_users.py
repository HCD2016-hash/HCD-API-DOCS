# get_users.py
# YoPrint: List Team Users
# Works in Pythonista 3 on iPhone/iPad

import requests
import console

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def get_users():
    """Get all team users"""
    url = f"{BASE_URL}/setting/user"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data", [])


def get_role_color(role):
    """Return color based on user role"""
    colors = {
        "owner": (0.8, 0.2, 0.8),
        "admin": (1.0, 0.3, 0.3),
        "manager": (1.0, 0.8, 0.2),
        "user": (0.7, 0.7, 0.7),
    }
    return colors.get(role, (0.7, 0.7, 0.7))


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     YOPRINT TEAM USERS")
    print("=" * 44)
    console.set_color()
    print()
    
    print("Loading users...")
    
    try:
        users = get_users()
        
        if not users:
            console.set_color(1.0, 0.6, 0.2)
            print("\nNo users found.")
            console.set_color()
            return
        
        console.set_color(0.2, 0.8, 0.2)
        print(f"\nFound {len(users)} user(s)")
        console.set_color()
        print("-" * 44)
        
        for user in users:
            first = user.get("first_name", "")
            last = user.get("last_name", "")
            name = f"{first} {last}".strip()
            email = user.get("email", "N/A")
            role = user.get("role", "user")
            
            if not name:
                name = email
            
            print()
            console.set_color(1.0, 1.0, 1.0)
            print(f"  {name}")
            console.set_color()
            
            print(f"    Email: {email}")
            print("    Role:  ", end="")
            color = get_role_color(role)
            console.set_color(*color)
            print(role.upper())
            console.set_color()
        
        print()
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
