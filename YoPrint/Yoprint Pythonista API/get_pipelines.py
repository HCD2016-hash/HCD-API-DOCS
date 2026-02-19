# get_pipelines.py
# YoPrint: View Task Pipelines & Statuses
# Works in Pythonista 3 on iPhone/iPad

import requests
import console

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def get_pipelines():
    """Get all pipeline configurations"""
    url = f"{BASE_URL}/setting/pipeline"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data", [])


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     YOPRINT PIPELINES")
    print("=" * 44)
    console.set_color()
    print()
    print("  Workflow pipelines and their statuses")
    print()
    print("Loading...")
    
    try:
        pipelines = get_pipelines()
        
        if not pipelines:
            console.set_color(1.0, 0.6, 0.2)
            print("\nNo pipelines found.")
            console.set_color()
            return
        
        console.set_color(0.2, 0.8, 0.2)
        print(f"\nFound {len(pipelines)} pipeline(s)")
        console.set_color()
        print("-" * 44)
        
        for pipeline in pipelines:
            label = pipeline.get("label", "N/A")
            pid = pipeline.get("id", "")
            enabled = pipeline.get("enable", False)
            color = pipeline.get("color", "")
            statuses = pipeline.get("statuses", [])
            
            print()
            console.set_color(0.2, 0.6, 1.0)
            print(f"  [{label}]")
            console.set_color()
            
            # Enabled status
            if enabled:
                console.set_color(0.2, 0.8, 0.2)
                print("    Status: Enabled")
            else:
                console.set_color(1.0, 0.3, 0.3)
                print("    Status: Disabled")
            console.set_color()
            
            console.set_color(0.5, 0.5, 0.5)
            print(f"    ID: {pid}")
            if color:
                print(f"    Color: {color}")
            console.set_color()
            
            # Show statuses in order
            if statuses:
                console.set_color(0.5, 0.5, 0.5)
                print("    Statuses:")
                console.set_color()
                
                # Sort by position
                sorted_statuses = sorted(statuses, key=lambda x: x.get("position", 0))
                
                for status in sorted_statuses:
                    s_label = status.get("label", "N/A")
                    s_type = status.get("type", "")
                    
                    # Type indicator
                    if s_type == "start":
                        console.set_color(0.2, 0.8, 0.2)
                        print(f"      [START] {s_label}")
                    elif s_type == "end":
                        console.set_color(1.0, 0.6, 0.2)
                        print(f"      [END]   {s_label}")
                    else:
                        console.set_color()
                        print(f"              {s_label}")
                    console.set_color()
        
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
