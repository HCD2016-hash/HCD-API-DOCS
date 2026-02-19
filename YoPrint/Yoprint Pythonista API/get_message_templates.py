# get_message_templates.py
# YoPrint: View Email/SMS Message Templates
# Works in Pythonista 3 on iPhone/iPad

import requests
import console
import dialogs
import clipboard

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL_V2 = f"https://secure.yoprint.com/v2/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def get_message_templates():
    """Get all message templates (uses V2 API)"""
    url = f"{BASE_URL_V2}/setting/message_template"
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json().get("data", [])


def main():
    console.clear()
    console.set_color(0.2, 0.6, 1.0)
    print("=" * 44)
    print("     YOPRINT MESSAGE TEMPLATES")
    print("=" * 44)
    console.set_color()
    print()
    print("  Email and SMS templates")
    print()
    print("Loading...")
    
    try:
        templates = get_message_templates()
        
        if not templates:
            console.set_color(1.0, 0.6, 0.2)
            print("\nNo message templates found.")
            console.set_color()
            return
        
        console.set_color(0.2, 0.8, 0.2)
        print(f"\nFound {len(templates)} template(s)")
        console.set_color()
        print("-" * 44)
        print()
        
        # Group by enabled status
        enabled_templates = [t for t in templates if t.get("enabled")]
        disabled_templates = [t for t in templates if not t.get("enabled")]
        
        if enabled_templates:
            console.set_color(0.2, 0.8, 0.2)
            print(f"  ENABLED ({len(enabled_templates)})")
            console.set_color()
            print()
            
            for template in enabled_templates:
                name = template.get("name", "N/A")
                t_type = template.get("type", "")
                subject = template.get("subject", "")
                tid = template.get("id", "")
                
                console.set_color(0.2, 0.8, 0.2)
                print(f"  ✓ {name}")
                console.set_color()
                
                if t_type:
                    console.set_color(0.5, 0.5, 0.5)
                    print(f"    Type: {t_type}")
                    console.set_color()
                
                if subject:
                    # Truncate long subjects
                    subj_display = subject[:35] + "..." if len(subject) > 35 else subject
                    console.set_color(0.5, 0.5, 0.5)
                    print(f"    Subject: {subj_display}")
                    console.set_color()
                
                print()
        
        if disabled_templates:
            console.set_color(1.0, 0.3, 0.3)
            print(f"  DISABLED ({len(disabled_templates)})")
            console.set_color()
            print()
            
            for template in disabled_templates:
                name = template.get("name", "N/A")
                t_type = template.get("type", "")
                
                console.set_color(1.0, 0.3, 0.3)
                print(f"  ✗ {name}")
                console.set_color()
                
                if t_type:
                    console.set_color(0.5, 0.5, 0.5)
                    print(f"    Type: {t_type}")
                    console.set_color()
                
                print()
        
        print("-" * 44)
        console.set_color(0.2, 0.8, 0.2)
        print("✓ Complete")
        console.set_color()
        
        # Option to view details
        choices = []
        for t in templates:
            status = "✓" if t.get("enabled") else "✗"
            choices.append(f"{status} {t.get('name', 'N/A')}")
        choices.append("❌ Exit")
        
        selection = dialogs.list_dialog("View Template Details", choices)
        
        if selection and "Exit" not in selection:
            idx = choices.index(selection)
            if idx < len(templates):
                show_template_details(templates[idx])
        
    except requests.exceptions.HTTPError as e:
        console.set_color(1.0, 0.3, 0.3)
        print(f"API Error: {e}")
        console.set_color()
    except Exception as e:
        console.set_color(1.0, 0.3, 0.3)
        print(f"Error: {e}")
        console.set_color()


def show_template_details(template):
    """Show full template details"""
    console.clear()
    console.set_color(0.2, 0.8, 0.2)
    print("=" * 44)
    print("  TEMPLATE DETAILS")
    print("=" * 44)
    console.set_color()
    print()
    
    name = template.get("name", "N/A")
    enabled = template.get("enabled", False)
    t_type = template.get("type", "")
    subject = template.get("subject", "")
    tid = template.get("id", "")
    
    console.set_color(1.0, 0.8, 0.2)
    print(f"  {name}")
    console.set_color()
    print()
    
    if enabled:
        console.set_color(0.2, 0.8, 0.2)
        print("  Status: Enabled")
    else:
        console.set_color(1.0, 0.3, 0.3)
        print("  Status: Disabled")
    console.set_color()
    
    if t_type:
        print(f"  Type: {t_type}")
    
    if subject:
        print(f"  Subject: {subject}")
    
    console.set_color(0.5, 0.5, 0.5)
    print(f"  ID: {tid}")
    console.set_color()
    
    print()
    
    action = dialogs.list_dialog("Actions", [
        "📋 Copy Template ID",
        "🔙 Back"
    ])
    
    if action and "Copy" in action:
        clipboard.set(tid)
        console.set_color(0.2, 0.8, 0.2)
        print(f"✓ Copied: {tid}")
        console.set_color()


if __name__ == "__main__":
    main()
