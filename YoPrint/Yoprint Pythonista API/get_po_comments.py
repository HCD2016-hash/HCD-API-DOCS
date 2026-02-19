# get_po_comments.py
# YoPrint: View comments on a purchase order
# Works in Pythonista 3 on iPhone/iPad

import requests
import console
import dialogs

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def lookup_po(po_number):
    """Lookup PO UUID by PO number"""
    url = f"{BASE_URL}/scoped_id_search"
    payload = {"scoped_id": po_number, "type": "purchase_order"}
    response = requests.post(url, headers=HEADERS, json=payload)
    response.raise_for_status()
    
    data = response.json().get("data", [])
    if not data:
        return None
    
    # Handle both single result and array
    if isinstance(data, list):
        for item in data:
            if item.get("scoped_id") == po_number:
                return item.get("id")
        return data[0].get("id") if data else None
    else:
        return data.get("id")


def get_comments(po_id):
    """Get PO comments"""
    url = f"{BASE_URL}/purchase_order/{po_id}/comment"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data", [])


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     PURCHASE ORDER COMMENTS")
    print("=" * 44)
    console.set_color()
    print()
    
    console.set_color(0.5, 0.5, 0.5)
    print("  View all comments on a PO")
    print("  Examples: PO1234 | po5678")
    console.set_color()
    print()
    
    # Get PO number
    po_input = dialogs.input_alert("PO Comments", "Enter PO number:")
    if not po_input:
        print("Cancelled.")
        return
    
    # Format PO number
    po_number = po_input.strip().upper()
    if po_number.isdigit():
        po_number = f"PO{po_number}"
    
    print(f"Looking up {po_number}...")
    
    try:
        po_id = lookup_po(po_number)
        
        if not po_id:
            console.set_color(1.0, 0.3, 0.3)
            print(f"\nPO '{po_number}' not found.")
            console.set_color()
            return
        
        console.set_color(0.5, 0.5, 0.5)
        print(f"Found PO ID: {po_id[:8]}...")
        console.set_color()
        print("Loading comments...")
        
        comments = get_comments(po_id)
        
        print()
        console.set_color(0.2, 0.8, 0.2)
        print(f"Found {len(comments)} comment(s)")
        console.set_color()
        print("-" * 44)
        print()
        
        if not comments:
            console.set_color(1.0, 0.6, 0.2)
            print("No comments found on this PO.")
            console.set_color()
        else:
            for comment in comments:
                # Get date
                created = comment.get("created_at", "")
                date = created[:10] if created else "Unknown"
                
                # Check if edited
                edited = " [edited]" if comment.get("is_edited") else ""
                
                console.set_color(0.5, 0.5, 0.5)
                print(f"  [{date}]{edited}")
                console.set_color()
                
                # Comment text
                text = comment.get("comment", "")
                if text:
                    print(f"  {text}")
                
                # Job reference if present
                job_name = comment.get("job_name")
                job_scoped = comment.get("job_scoped_id")
                if job_name or job_scoped:
                    console.set_color(0.5, 0.5, 0.5)
                    job_info = f"{job_scoped} - {job_name}" if job_scoped else job_name
                    print(f"  Job: {job_info}")
                    console.set_color()
                
                print()
        
        print("-" * 44)
        console.set_color(0.2, 0.8, 0.2)
        print("✓ Complete")
        console.set_color()
        
    except requests.exceptions.HTTPError as e:
        console.set_color(1.0, 0.3, 0.3)
        print(f"\nAPI Error: {e}")
        console.set_color()
    except Exception as e:
        console.set_color(1.0, 0.3, 0.3)
        print(f"\nError: {e}")
        console.set_color()


if __name__ == "__main__":
    main()
