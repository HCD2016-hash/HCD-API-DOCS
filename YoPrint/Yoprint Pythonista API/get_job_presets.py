# get_job_presets.py
# YoPrint: List All Job Presets
# Works in Pythonista 3 on iPhone/iPad

import requests
import console

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def get_job_presets():
    """Get all job presets"""
    url = f"{BASE_URL}/setting/job_preset"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data", [])


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     YOPRINT JOB PRESETS")
    print("=" * 44)
    console.set_color()
    print()
    
    print("Loading job presets...")
    
    try:
        presets = get_job_presets()
        
        if not presets:
            console.set_color(1.0, 0.6, 0.2)
            print("\nNo job presets found.")
            console.set_color()
            return
        
        console.set_color(0.2, 0.8, 0.2)
        print(f"\nFound {len(presets)} job preset(s)")
        console.set_color()
        print("-" * 44)
        
        for i, preset in enumerate(presets, 1):
            name = preset.get("name", "N/A")
            preset_id = preset.get("id", "")
            description = preset.get("description", "")
            
            print()
            console.set_color(1.0, 0.8, 0.2)
            print(f"  [{i}] {name}")
            console.set_color()
            
            console.set_color(0.5, 0.5, 0.5)
            print(f"      ID: {preset_id}")
            console.set_color()
            
            if description:
                print(f"      {description[:60]}")
        
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
