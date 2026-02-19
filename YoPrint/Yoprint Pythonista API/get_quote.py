# get_quote.py
# YoPrint: Quote Lookup by Q Number
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


def search_quote(scoped_id):
    """Search for quote by Q number, return UUID"""
    # Auto-add Q prefix if just digits
    if scoped_id.isdigit():
        scoped_id = f"Q{scoped_id}"
    scoped_id = scoped_id.upper()
    
    url = f"{BASE_URL_V1}/global/scoped_id_search"
    payload = {"type": "quote", "scoped_id": scoped_id}
    
    response = requests.post(url, headers=HEADERS, json=payload)
    response.raise_for_status()
    
    data = response.json().get("data", [])
    for item in data:
        if item.get("scoped_id") == scoped_id:
            return item
    return data[0] if data else None


def get_quote_details(uuid):
    """Get full quote details"""
    # Quotes use same endpoint as sales orders with is_quote flag
    url = f"{BASE_URL_V2}/v2/sales_order/{uuid}"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data")


def format_currency(value):
    try:
        return f"${float(value):,.2f}"
    except (ValueError, TypeError):
        return "$0.00"


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     YOPRINT QUOTE LOOKUP")
    print("=" * 44)
    console.set_color()
    print()
    
    quote_id = dialogs.input_alert(
        "Quote Lookup",
        "Enter quote number (e.g., Q1234 or just 1234):",
        "",
        "Look Up"
    )
    
    if not quote_id:
        print("Cancelled.")
        return
    
    print(f"Looking up {quote_id}...")
    print()
    
    try:
        search_result = search_quote(quote_id)
        if not search_result:
            console.set_color(1.0, 0.3, 0.3)
            print(f"ERROR: Quote {quote_id} not found")
            console.set_color()
            return
        
        quote = get_quote_details(search_result["id"])
        
        # Verify it's actually a quote
        is_quote = quote.get("is_quote", False)
        
        console.set_color(0.8, 0.4, 1.0)  # Purple for quotes
        print("=" * 44)
        print(f"  QUOTE: {quote.get('scoped_id', 'N/A')}")
        print("=" * 44)
        console.set_color()
        print()
        
        print(f"CUSTOMER:  {quote.get('customer', {}).get('name', 'N/A')}")
        print(f"STATUS:    {quote.get('status', {}).get('label', 'N/A')}")
        
        # Quote vs Order indicator
        if is_quote:
            console.set_color(0.8, 0.4, 1.0)
            print(f"TYPE:      Quote (not converted)")
            console.set_color()
        else:
            console.set_color(0.2, 0.8, 0.2)
            print(f"TYPE:      Converted to Order")
            console.set_color()
        
        print()
        
        console.set_color(1.0, 0.8, 0.2)
        print("DATES:")
        console.set_color()
        print(f"  Created:    {quote.get('created_at', 'N/A')[:10]}")
        print(f"  Issue Date: {quote.get('issue_date', 'N/A')}")
        print(f"  Due Date:   {quote.get('due_date', 'N/A')}")
        print()
        
        console.set_color(1.0, 0.8, 0.2)
        print("FINANCIALS:")
        console.set_color()
        print(f"  Subtotal: {format_currency(quote.get('calc_subtotal'))}")
        print(f"  Tax:      {format_currency(quote.get('calc_tax'))}")
        print(f"  Discount: {format_currency(quote.get('calc_discount'))}")
        console.set_color(0.2, 0.8, 0.2)
        print(f"  TOTAL:    {format_currency(quote.get('calc_total'))}")
        console.set_color()
        print()
        
        # Jobs summary
        jobs = quote.get("jobs", [])
        if jobs:
            console.set_color(1.0, 0.8, 0.2)
            print(f"JOBS ({len(jobs)}):")
            console.set_color()
            for job in jobs:
                job_name = job.get("name", "N/A")
                qty = job.get("quantity", 0)
                price = job.get("price", 0)
                print(f"  • {job_name}")
                print(f"    Qty: {qty} | Price: {format_currency(price)}")
        
        print()
        console.set_color(0.2, 0.8, 0.2)
        print("✓ Lookup complete")
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
