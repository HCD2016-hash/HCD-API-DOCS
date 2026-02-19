# job_status.py
# YoPrint: Check Job Status
# Works in Pythonista 3 on iPhone/iPad

import requests
import json
import console
import dialogs

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL_V1 = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
BASE_URL_V2 = f"https://secure.yoprint.com/v2/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def search_order(scoped_id):
    """Search for order by SO number"""
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


def get_order_with_jobs(uuid):
    """Get order with all job details"""
    url = f"{BASE_URL_V2}/v2/sales_order/{uuid}"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data")


def get_status_color(status):
    """Return color based on status label"""
    status_lower = status.lower()
    if "complete" in status_lower or "shipped" in status_lower:
        return (0.2, 0.8, 0.2)  # Green
    elif "progress" in status_lower or "production" in status_lower:
        return (1.0, 0.8, 0.2)  # Yellow
    elif "hold" in status_lower or "waiting" in status_lower:
        return (1.0, 0.5, 0.2)  # Orange
    elif "cancel" in status_lower:
        return (1.0, 0.3, 0.3)  # Red
    else:
        return (0.7, 0.7, 0.7)  # Gray


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     YOPRINT JOB STATUS CHECK")
    print("=" * 44)
    console.set_color()
    print()
    
    order_id = dialogs.input_alert(
        "Job Status",
        "Enter order number (e.g., SO1234):",
        "",
        "Check Status"
    )
    
    if not order_id:
        print("Cancelled.")
        return
    
    print(f"Loading jobs for {order_id}...")
    print()
    
    try:
        # Find order
        search_result = search_order(order_id)
        if not search_result:
            console.set_color(1.0, 0.3, 0.3)
            print(f"Order {order_id} not found")
            console.set_color()
            return
        
        # Get full order with jobs
        order = get_order_with_jobs(search_result["id"])
        jobs = order.get("jobs", [])
        
        # Header
        console.set_color(0.2, 0.8, 0.2)
        print("=" * 44)
        print(f"  {order.get('scoped_id')} - {order.get('customer', {}).get('name', 'N/A')}")
        print("=" * 44)
        console.set_color()
        
        # Order status
        order_status = order.get("status", {}).get("label", "N/A")
        color = get_status_color(order_status)
        print()
        print("ORDER STATUS: ", end="")
        console.set_color(*color)
        print(order_status)
        console.set_color()
        
        # Jobs
        print()
        console.set_color(1.0, 0.8, 0.2)
        print(f"JOBS ({len(jobs)}):")
        console.set_color()
        print("-" * 44)
        
        for i, job in enumerate(jobs, 1):
            job_name = job.get("name", "N/A")
            job_status = job.get("status", {}).get("label", "N/A") if isinstance(job.get("status"), dict) else job.get("status", "N/A")
            quantity = job.get("quantity", 0)
            service = job.get("service", {}).get("name", "N/A") if isinstance(job.get("service"), dict) else "N/A"
            
            color = get_status_color(str(job_status))
            
            print()
            console.set_color(0.2, 0.6, 1.0)
            print(f"  [{i}] {job_name}")
            console.set_color()
            print(f"      Service:  {service}")
            print(f"      Quantity: {quantity}")
            print("      Status:   ", end="")
            console.set_color(*color)
            print(job_status)
            console.set_color()
            
            # Due date if available
            due = job.get("due_date")
            if due:
                print(f"      Due:      {due}")
        
        print()
        print("-" * 44)
        console.set_color(0.2, 0.8, 0.2)
        print("✓ Status check complete")
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
