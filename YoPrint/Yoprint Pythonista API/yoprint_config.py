# yoprint_config.py
# YoPrint API Configuration for Pythonista
# Store your API key here - keep this file private!

TEAM_SLUG = "hub-city-design-inc"
API_KEY = "1b3e5c0715f2a1140fecdbfba3f57186"

# Base URLs
BASE_URL_V1 = f"https://secure.yoprint.com/v1/api/store/{TEAM_SLUG}"
BASE_URL_V2 = f"https://secure.yoprint.com/v2/api/store/{TEAM_SLUG}"

def get_headers():
    """Return standard headers for API requests"""
    return {
        "Authorization": API_KEY,
        "Content-Type": "application/json"
    }
