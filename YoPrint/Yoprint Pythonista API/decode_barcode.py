# decode_barcode.py
# YoPrint: Decode Barcode / QR Code
# Works in Pythonista 3 on iPhone/iPad

import requests
import json
import console
import dialogs
import clipboard

# Config
TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

BASE_URL = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
HEADERS = {"Authorization": API_KEY, "Content-Type": "application/json"}


def decode_barcode(value):
    """Decode a YoPrint barcode/QR code value"""
    url = f"{BASE_URL}/decode_barcode"
    payload = {"value": value}
    response = requests.post(url, headers=HEADERS, json=payload)
    response.raise_for_status()
    return response.json().get("data")


def main():
    while True:
        console.clear()
        console.set_color(1.0, 0.8, 0.2)
        print("=" * 44)
        print("     YOPRINT BARCODE DECODER")
        print("=" * 44)
        console.set_color()
        print()
        print("  Decode YoPrint barcodes and QR codes")
        print()
        console.set_color(0.5, 0.5, 0.5)
        print("  Examples:")
        print("    y9-0p-job-1584")
        print("    y9-0p-so-4521")
        print()
        print("  TIP: Enter only the barcode ID,")
        print("       NOT the full URL!")
        console.set_color()
        print()
        
        barcode = dialogs.input_alert(
            "Decode Barcode",
            "Enter barcode/QR value:",
            "",
            "Decode"
        )
        
        if not barcode:
            return
        
        print(f"Decoding: {barcode}")
        print()
        
        try:
            data = decode_barcode(barcode)
            
            if not data:
                console.set_color(1.0, 0.6, 0.2)
                print("No data returned for this barcode.")
                console.set_color()
                
                again = dialogs.alert("No Results", "Try another?", "Yes", "Exit")
                if again != 1:
                    return
                continue
            
            console.set_color(0.2, 0.8, 0.2)
            print("=" * 44)
            print("  BARCODE DECODED!")
            print("=" * 44)
            console.set_color()
            print()
            
            # Type
            item_type = data.get("type", "Unknown")
            console.set_color(0.2, 0.6, 1.0)
            print(f"  Type:      {item_type.upper()}")
            console.set_color()
            
            # Scoped ID (SO1234, J1234, etc.)
            scoped_id = data.get("scoped_id", "")
            if scoped_id:
                console.set_color(1.0, 0.8, 0.2)
                print(f"  Number:    {scoped_id}")
                console.set_color()
            
            # Name
            name = data.get("name", "")
            if name:
                print(f"  Name:      {name}")
            
            # UUID
            uuid = data.get("id", "")
            if uuid:
                console.set_color(0.5, 0.5, 0.5)
                print(f"  ID:        {uuid}")
                console.set_color()
            
            # Customer info if present
            customer = data.get("customer", {})
            if customer and customer.get("name"):
                print(f"  Customer:  {customer.get('name')}")
            
            # Status if present
            status = data.get("status", {})
            if status and status.get("label"):
                print(f"  Status:    {status.get('label')}")
            
            print()
            
            # Actions
            choices = ["📋 Copy ID to Clipboard"]
            if scoped_id:
                choices.append(f"📋 Copy {scoped_id}")
            choices.append("🔍 Decode Another")
            choices.append("❌ Exit")
            
            action = dialogs.list_dialog("Actions", choices)
            
            if not action or "Exit" in action:
                return
            
            if "Copy ID" in action and uuid:
                clipboard.set(uuid)
                console.set_color(0.2, 0.8, 0.2)
                print(f"✓ Copied: {uuid}")
                console.set_color()
            elif scoped_id and scoped_id in action:
                clipboard.set(scoped_id)
                console.set_color(0.2, 0.8, 0.2)
                print(f"✓ Copied: {scoped_id}")
                console.set_color()
            
            if "Another" not in action:
                return
            
        except requests.exceptions.HTTPError as e:
            console.set_color(1.0, 0.3, 0.3)
            print(f"API Error: {e}")
            console.set_color()
            
            again = dialogs.alert("Error", "Try another barcode?", "Yes", "Exit")
            if again != 1:
                return
        except Exception as e:
            console.set_color(1.0, 0.3, 0.3)
            print(f"Error: {e}")
            console.set_color()
            
            again = dialogs.alert("Error", "Try another barcode?", "Yes", "Exit")
            if again != 1:
                return


if __name__ == "__main__":
    main()
