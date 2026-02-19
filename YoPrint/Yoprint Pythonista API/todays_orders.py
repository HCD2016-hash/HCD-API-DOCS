# todays_orders.py
# YoPrint: Today's Orders Dashboard
# Works in Pythonista 3 on iPhone/iPad

import requests
import json
import console
from datetime import datetime, timedelta

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def get_recent_orders(days=1):
    """Get orders from the last N days"""
    # Calculate date range
    end_date = datetime.now()
    start_date = end_date - timedelta(days=days)
    
    url = f"{BASE_URL}/sales_order"
    params = {
        "page": 1,
        "limit": 50,
        "sort": "-created_at"  # Newest first
    }
    
    response = requests.get(url, headers=HEADERS, params=params)
    response.raise_for_status()
    
    orders = response.json().get("data", [])
    
    # Filter to today's orders
    today = datetime.now().strftime("%Y-%m-%d")
    todays = [o for o in orders if o.get("created_at", "").startswith(today)]
    
    return todays, orders[:20]  # Today's + recent 20


def format_currency(value):
    try:
        return f"${float(value):,.2f}"
    except (ValueError, TypeError):
        return "$0.00"


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     YOPRINT TODAY'S ORDERS")
    print("=" * 44)
    console.set_color()
    print()
    
    today = datetime.now().strftime("%A, %B %d, %Y")
    print(f"  {today}")
    print()
    
    print("Loading orders...")
    
    try:
        todays_orders, recent_orders = get_recent_orders()
        
        # Today's summary
        console.set_color(0.2, 0.8, 0.2)
        print(f"\n📋 TODAY: {len(todays_orders)} new order(s)")
        console.set_color()
        print("-" * 44)
        
        if todays_orders:
            total_value = 0
            for order in todays_orders:
                scoped_id = order.get("scoped_id", "N/A")
                customer = order.get("customer", {}).get("name", "N/A")
                status = order.get("status", {}).get("label", "N/A")
                total = float(order.get("calc_total", 0))
                total_value += total
                
                console.set_color(1.0, 0.8, 0.2)
                print(f"\n  {scoped_id}")
                console.set_color()
                print(f"  Customer: {customer}")
                print(f"  Status:   {status}")
                print(f"  Total:    {format_currency(total)}")
            
            print()
            console.set_color(0.2, 0.8, 0.2)
            print(f"  💰 TODAY'S TOTAL: {format_currency(total_value)}")
            console.set_color()
        else:
            print("  No orders yet today.")
        
        # Recent orders
        print()
        console.set_color(1.0, 0.8, 0.2)
        print(f"\n📜 RECENT ORDERS (last 20):")
        console.set_color()
        print("-" * 44)
        
        for order in recent_orders:
            scoped_id = order.get("scoped_id", "N/A")
            customer = order.get("customer", {}).get("name", "N/A")[:20]
            status = order.get("status", {}).get("label", "N/A")[:12]
            date = order.get("created_at", "")[:10]
            
            # Truncate customer name if needed
            if len(customer) > 18:
                customer = customer[:17] + "…"
            
            print(f"  {scoped_id:8} | {customer:18} | {status}")
        
        print()
        console.set_color(0.2, 0.8, 0.2)
        print("✓ Dashboard loaded")
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
