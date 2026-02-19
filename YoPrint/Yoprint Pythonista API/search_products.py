# search_products.py
# YoPrint: Search Product Catalog
# Works in Pythonista 3 on iPhone/iPad

import requests
import console
import dialogs
import clipboard

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def search_products(term):
    """Search product catalog"""
    url = f"{BASE_URL}/product_list_search"
    payload = {"name": term}
    response = requests.post(url, headers=HEADERS, json=payload)
    response.raise_for_status()
    return response.json().get("data", [])


def main():
    while True:
        console.clear()
        console.set_color(0.2, 0.6, 1.0)
        print("=" * 44)
        print("     YOPRINT PRODUCT SEARCH")
        print("=" * 44)
        console.set_color()
        print()
        print("  Search your product catalog")
        print()
        console.set_color(0.5, 0.5, 0.5)
        print("  Examples: shirt | hat | Gildan | polo")
        print("  Leave blank to see all products")
        console.set_color()
        print()
        
        term = dialogs.input_alert(
            "Product Search",
            "Enter product name:",
            "",
            "Search"
        )
        
        if term is None:  # Cancelled
            return
        
        print(f"Searching '{term}'..." if term else "Loading all products...")
        
        try:
            products = search_products(term)
            
            if not products:
                console.set_color(1.0, 0.6, 0.2)
                print("\nNo products found.")
                console.set_color()
                
                again = dialogs.alert("No Results", "Search again?", "Yes", "Exit")
                if again != 1:
                    return
                continue
            
            console.set_color(0.2, 0.8, 0.2)
            print(f"\nFound {len(products)} product(s)")
            console.set_color()
            print("-" * 44)
            
            # Build selection list
            choices = []
            for i, product in enumerate(products, 1):
                name = product.get("name", "N/A")
                sku = product.get("sku", "")
                
                if sku:
                    display = f"{i}. {name} [{sku}]"
                else:
                    display = f"{i}. {name}"
                
                # Truncate if too long
                if len(display) > 40:
                    display = display[:37] + "..."
                
                choices.append(display)
                
                # Also print to console
                console.set_color(1.0, 0.8, 0.2)
                print(f"  {i}.")
                console.set_color()
                print(f"     {name}")
                if sku:
                    console.set_color(0.5, 0.5, 0.5)
                    print(f"     SKU: {sku}")
                    console.set_color()
            
            choices.append("🔍 New Search")
            choices.append("❌ Exit")
            
            print()
            print("-" * 44)
            
            selection = dialogs.list_dialog(f"Products ({len(products)})", choices)
            
            if not selection or "Exit" in selection:
                return
            
            if "New Search" in selection:
                continue
            
            # Show selected product details
            idx = choices.index(selection)
            if idx < len(products):
                show_product_details(products[idx])
            
        except requests.exceptions.HTTPError as e:
            console.set_color(1.0, 0.3, 0.3)
            print(f"API Error: {e}")
            console.set_color()
            input("\nPress Enter to continue...")
        except Exception as e:
            console.set_color(1.0, 0.3, 0.3)
            print(f"Error: {e}")
            console.set_color()
            input("\nPress Enter to continue...")


def show_product_details(product):
    """Show details for selected product"""
    console.clear()
    console.set_color(0.2, 0.8, 0.2)
    print("=" * 44)
    print("  PRODUCT DETAILS")
    print("=" * 44)
    console.set_color()
    print()
    
    name = product.get("name", "N/A")
    sku = product.get("sku", "")
    pid = product.get("id", "")
    description = product.get("description", "")
    
    console.set_color(1.0, 0.8, 0.2)
    print(f"  {name}")
    console.set_color()
    print()
    
    if sku:
        print(f"  SKU: {sku}")
    
    if description:
        print(f"  Description: {description[:100]}...")
    
    console.set_color(0.5, 0.5, 0.5)
    print(f"  ID: {pid}")
    console.set_color()
    
    print()
    
    # Actions
    action = dialogs.list_dialog("Actions", [
        "📋 Copy Product ID",
        "📋 Copy SKU" if sku else None,
        "🔙 Back to Results"
    ])
    
    if action and "Product ID" in action:
        clipboard.set(pid)
        console.set_color(0.2, 0.8, 0.2)
        print(f"✓ Copied: {pid}")
        console.set_color()
    elif action and "SKU" in action and sku:
        clipboard.set(sku)
        console.set_color(0.2, 0.8, 0.2)
        print(f"✓ Copied: {sku}")
        console.set_color()


if __name__ == "__main__":
    main()
