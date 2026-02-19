# get_webhooks.py
# YoPrint: List Webhook Subscriptions
# Works in Pythonista 3 on iPhone/iPad

import requests
import console

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def get_webhooks():
    """Get all webhook subscriptions"""
    url = f"{BASE_URL}/setting/webhook_subscription"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data", [])


def check_enabled(webhook):
    """Check if webhook is enabled"""
    for field in ["is_enabled", "enabled", "active", "is_active"]:
        val = webhook.get(field)
        if val is not None:
            return val in [True, "true", 1, "1"]
    status = webhook.get("status", "")
    return status in ["active", "enabled", "on"]


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     YOPRINT WEBHOOKS")
    print("=" * 44)
    console.set_color()
    print()
    
    print("Loading webhooks...")
    
    try:
        webhooks = get_webhooks()
        
        if not webhooks:
            console.set_color(1.0, 0.6, 0.2)
            print("\nNo webhooks configured.")
            console.set_color()
            return
        
        console.set_color(0.2, 0.8, 0.2)
        print(f"\nFound {len(webhooks)} webhook(s)")
        console.set_color()
        print("-" * 44)
        
        for webhook in webhooks:
            name = webhook.get("name", "N/A")
            url = webhook.get("url", "N/A")
            events = webhook.get("events", [])
            is_enabled = check_enabled(webhook)
            
            print()
            if is_enabled:
                console.set_color(0.2, 0.8, 0.2)
                print("  [ON] ", end="")
            else:
                console.set_color(1.0, 0.3, 0.3)
                print("  [OFF] ", end="")
            
            console.set_color(1.0, 1.0, 1.0)
            print(name)
            console.set_color()
            
            if len(url) > 38:
                url = url[:35] + "..."
            print(f"    URL: {url}")
            
            if events:
                events_str = ", ".join(events[:3])
                if len(events) > 3:
                    events_str += f" (+{len(events)-3})"
                console.set_color(0.2, 0.6, 0.8)
                print(f"    Events: {events_str}")
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
