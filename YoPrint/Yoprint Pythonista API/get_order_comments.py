# get_order_comments.py
# YoPrint: View Sales Order Comments
# Works in Pythonista 3 on iPhone/iPad

import requests
import console
import dialogs

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL_V1 = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
BASE_URL_V2 = f"https://secure.yoprint.com/v2/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def search_order(scoped_id):
    """Search for order by SO number, return UUID"""
    if scoped_id.isdigit():
        scoped_id = f"SO{scoped_id}"
    scoped_id = scoped_id.upper()
    
    url = f"{BASE_URL_V1}/global/scoped_id_search"
    payload = {"type": "order", "scoped_id": scoped_id}
    
    response = requests.post(url, headers=HEADERS, json=payload)
    response.raise_for_status()
    
    data = response.json().get("data", [])
    for item in data:
        if item.get("scoped_id") == scoped_id:
            return item
    return data[0] if data else None


def get_order_comments(uuid):
    """Get all comments for an order"""
    url = f"{BASE_URL_V2}/v2/sales_order/{uuid}/comment/index"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data", [])


def main():
    while True:
        console.clear()
        console.set_color(0.2, 0.6, 1.0)
        print("=" * 44)
        print("     YOPRINT ORDER COMMENTS")
        print("=" * 44)
        console.set_color()
        print()
        print("  View all comments on a sales order")
        print()
        console.set_color(0.5, 0.5, 0.5)
        print("  Example: SO1234 or just 1234")
        console.set_color()
        print()
        
        order_input = dialogs.input_alert(
            "Order Comments",
            "Enter order number:",
            "",
            "View Comments"
        )
        
        if not order_input:
            return
        
        # Normalize input
        if order_input.isdigit():
            scoped_id = f"SO{order_input}"
        else:
            scoped_id = order_input.upper()
        
        print(f"Looking up {scoped_id}...")
        
        try:
            # Find order
            order = search_order(order_input)
            
            if not order:
                console.set_color(1.0, 0.3, 0.3)
                print(f"\nOrder {scoped_id} not found")
                console.set_color()
                
                again = dialogs.alert("Not Found", "Try another order?", "Yes", "Exit")
                if again != 1:
                    return
                continue
            
            uuid = order.get("id")
            actual_scoped_id = order.get("scoped_id", scoped_id)
            
            print("Loading comments...")
            
            comments = get_order_comments(uuid)
            
            console.clear()
            console.set_color(0.2, 0.8, 0.2)
            print("=" * 44)
            print(f"  COMMENTS: {actual_scoped_id}")
            print("=" * 44)
            console.set_color()
            print()
            
            if not comments:
                console.set_color(1.0, 0.6, 0.2)
                print("  No comments on this order.")
                console.set_color()
            else:
                console.set_color(0.2, 0.8, 0.2)
                print(f"  Found {len(comments)} comment(s)")
                console.set_color()
                print()
                
                for i, comment in enumerate(comments, 1):
                    text = comment.get("comment", "")
                    created = comment.get("created_at", "")
                    user = comment.get("user", {})
                    user_name = user.get("name", "") if user else ""
                    
                    # Date formatting
                    date_display = created[:10] if created else ""
                    time_display = created[11:16] if len(created) > 11 else ""
                    
                    print("-" * 42)
                    
                    # Header with date/user
                    console.set_color(0.5, 0.5, 0.5)
                    header = f"  #{i}"
                    if date_display:
                        header += f" | {date_display}"
                    if time_display:
                        header += f" {time_display}"
                    if user_name:
                        header += f" | {user_name}"
                    print(header)
                    console.set_color()
                    
                    # Comment text
                    print()
                    # Word wrap long comments
                    words = text.split()
                    line = "  "
                    for word in words:
                        if len(line) + len(word) + 1 > 42:
                            print(line)
                            line = "  " + word
                        else:
                            line += " " + word if line != "  " else word
                    if line.strip():
                        print(line)
                    print()
            
            print("-" * 42)
            console.set_color(0.2, 0.8, 0.2)
            print("✓ Complete")
            console.set_color()
            
            # Options
            action = dialogs.list_dialog("Actions", [
                "🔍 View Another Order",
                "❌ Exit"
            ])
            
            if not action or "Exit" in action:
                return
            
        except requests.exceptions.HTTPError as e:
            console.set_color(1.0, 0.3, 0.3)
            print(f"API Error: {e}")
            console.set_color()
            
            again = dialogs.alert("Error", "Try another order?", "Yes", "Exit")
            if again != 1:
                return
        except Exception as e:
            console.set_color(1.0, 0.3, 0.3)
            print(f"Error: {e}")
            console.set_color()
            
            again = dialogs.alert("Error", "Try another order?", "Yes", "Exit")
            if again != 1:
                return


if __name__ == "__main__":
    main()
