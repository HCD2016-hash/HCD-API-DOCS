# get_approvals.py
# YoPrint: View Pending Approvals
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


def get_approvals(page=1):
    """Get filtered approvals list"""
    url = f"{BASE_URL}/approvals/filter"
    # Only send page - empty arrays cause 422 errors
    payload = {"page": page}
    response = requests.post(url, headers=HEADERS, json=payload)
    response.raise_for_status()
    return response.json()


def get_status_color(status):
    """Return color based on approval status"""
    status_lower = status.lower() if status else ""
    if status_lower == "pending":
        return (1.0, 0.8, 0.2)  # Yellow
    elif status_lower == "completed" or status_lower == "approved":
        return (0.2, 0.8, 0.2)  # Green
    elif status_lower == "need-changes" or status_lower == "rejected":
        return (1.0, 0.3, 0.3)  # Red
    else:
        return None  # Default


def main():
    console.clear()
    console.set_color(1.0, 0.8, 0.2)
    print("=" * 44)
    print("     YOPRINT APPROVALS")
    print("=" * 44)
    console.set_color()
    print()
    print("  View pending and completed approvals")
    print()
    print("Loading...")
    
    try:
        response = get_approvals()
        approvals = response.get("data", [])
        pagination = response.get("pagination", {})
        
        if not approvals:
            console.set_color(0.2, 0.8, 0.2)
            print("\n✓ No pending approvals!")
            console.set_color()
            return
        
        console.set_color(0.2, 0.8, 0.2)
        print(f"\nFound {len(approvals)} approval(s)")
        console.set_color()
        
        if pagination:
            current = pagination.get("currentPage", 1)
            total_pages = pagination.get("totalPages", 1)
            total_items = pagination.get("total", len(approvals))
            console.set_color(0.5, 0.5, 0.5)
            print(f"Page {current} of {total_pages} | Total: {total_items}")
            console.set_color()
        
        print("-" * 44)
        print()
        
        # Count by status
        pending_count = sum(1 for a in approvals if a.get("status", "").lower() == "pending")
        
        if pending_count > 0:
            console.set_color(1.0, 0.8, 0.2)
            print(f"  ⚠️  {pending_count} PENDING APPROVAL(S)")
            console.set_color()
            print()
        
        for approval in approvals:
            status = approval.get("status", "Unknown")
            aid = approval.get("id", "N/A")
            order_id = approval.get("order_id", "")
            job_id = approval.get("job_id", "")
            created = approval.get("created_at", "")[:10] if approval.get("created_at") else ""
            
            # Status with color
            color = get_status_color(status)
            if color:
                console.set_color(*color)
            print(f"  [{status.upper()}]")
            console.set_color()
            
            console.set_color(0.5, 0.5, 0.5)
            print(f"    ID: {aid}")
            console.set_color()
            
            if order_id:
                print(f"    Order: {order_id}")
            if job_id:
                print(f"    Job: {job_id}")
            if created:
                console.set_color(0.5, 0.5, 0.5)
                print(f"    Created: {created}")
                console.set_color()
            
            print()
        
        print("-" * 44)
        console.set_color(0.2, 0.8, 0.2)
        print("✓ Complete")
        console.set_color()
        
        # Option to copy an approval ID
        choices = []
        for a in approvals:
            status = a.get("status", "?")
            aid = a.get("id", "")[:8]
            choices.append(f"[{status}] {aid}...")
        choices.append("❌ Exit")
        
        selection = dialogs.list_dialog("Copy Approval ID", choices)
        
        if selection and "Exit" not in selection:
            idx = choices.index(selection)
            if idx < len(approvals):
                full_id = approvals[idx].get("id", "")
                clipboard.set(full_id)
                console.set_color(0.2, 0.8, 0.2)
                print(f"\n✓ Copied: {full_id}")
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
