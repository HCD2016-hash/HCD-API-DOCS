"""
SanMar FTP GTIN Downloader and Processor
Hub City Design Inc. - Ron Hoover Order

This script:
1. Connects to SanMar FTP server
2. Downloads GTIN CSV files (SanMar_SDL_N.csv and SanMar_EPDD.csv)
3. Extracts Port Authority product GTINs
4. Matches to your Ron Hoover order
5. Creates label print file with official SanMar UPC barcodes

Requirements:
- Python 3.x
- pip install pandas openpyxl

Usage:
1. Edit the FTP_PASSWORD variable below
2. Run: python sanmar_gtin_downloader.py
3. Script downloads data and creates label file
"""

import ftplib
import os
import pandas as pd
from datetime import datetime

# ===== FTP CREDENTIALS =====
FTP_SERVER = "ftp.sanmar.com"
FTP_USERNAME = "198952"
FTP_PASSWORD = "LE!Tr4e4L8F9zz"  # ← ENTER YOUR PASSWORD HERE
FTP_PORT = 21

# ===== FILE LOCATIONS =====
DOWNLOAD_DIR = "sanmar_gtin_data"
ORDER_FILE = "Ron_Hoover_Order_Detail.xlsx"

# ===== YOUR PRODUCTS (from Ron Hoover order) =====
TARGET_PRODUCTS = {
    'J331': 'Port Authority All-Conditions Jacket - Mens',
    'L331': 'Port Authority All-Conditions Jacket - Womens', 
    'J327': 'Port Authority Hooded Charger Jacket',
    'L900': 'Port Authority Women\'s Collective Outer Shell',
    'BG223': 'Port Authority Exec Backpack'
}

# Product variations (some products use *** suffix in your order)
PRODUCT_VARIATIONS = {
    'J327***': 'J327',
    'L900***': 'L900'
}


def connect_to_ftp():
    """Connect to SanMar FTP server"""
    print("=" * 70)
    print("SANMAR FTP CONNECTION")
    print("=" * 70)
    
    if FTP_PASSWORD == "YOUR_PASSWORD_HERE":
        print("\n❌ ERROR: You need to enter your FTP password in the script!")
        print("Edit line 24: FTP_PASSWORD = \"YOUR_PASSWORD_HERE\"")
        print("Replace YOUR_PASSWORD_HERE with your actual password")
        return None
    
    try:
        print(f"\nConnecting to {FTP_SERVER}...")
        ftp = ftplib.FTP()
        ftp.connect(FTP_SERVER, FTP_PORT)
        ftp.login(FTP_USERNAME, FTP_PASSWORD)
        print("✓ Successfully connected to SanMar FTP!")
        
        # Show current directory
        print(f"\nCurrent directory: {ftp.pwd()}")
        
        return ftp
        
    except ftplib.error_perm as e:
        print(f"\n❌ FTP Login Error: {e}")
        print("\nPossible issues:")
        print("  1. Incorrect password")
        print("  2. Account not activated yet")
        print("  3. Need to request FTP access from SanMar")
        return None
        
    except Exception as e:
        print(f"\n❌ Connection Error: {e}")
        print("\nCheck your internet connection and try again.")
        return None


def list_ftp_directory(ftp, path="/"):
    """List files in FTP directory"""
    print(f"\nListing files in: {path}")
    print("-" * 70)
    
    try:
        ftp.cwd(path)
        files = []
        ftp.retrlines('LIST', files.append)
        
        for f in files:
            print(f"  {f}")
        
        # Also try to get just filenames
        print("\n  Files/directories:")
        filenames = []
        try:
            ftp.retrlines('NLST', filenames.append)
            for name in filenames:
                print(f"    - {name}")
        except:
            pass
            
        return files
        
    except Exception as e:
        print(f"Error listing directory: {e}")
        return []


def download_gtin_files(ftp):
    """Download SanMar GTIN CSV files"""
    print("\n" + "=" * 70)
    print("DOWNLOADING GTIN FILES")
    print("=" * 70)
    
    # Create download directory
    os.makedirs(DOWNLOAD_DIR, exist_ok=True)
    
    # Files to download
    gtin_files = [
        'SanMar_SDL_N.csv',
        'SanMar_EPDD.csv'
    ]
    
    # Common subdirectories to search
    search_paths = [
        '/SanMarPDD',
        '/SanMarPDD/SanMarPI',
        '/',
        '/data',
        '/export',
        '/csv',
        '/gtin'
    ]
    
    downloaded = []
    
    for filename in gtin_files:
        local_path = os.path.join(DOWNLOAD_DIR, filename)
        found = False
        
        print(f"\nSearching for: {filename}")
        
        for search_path in search_paths:
            try:
                # Try to change to directory
                ftp.cwd(search_path)
                
                # List files to see what's there
                files = []
                ftp.retrlines('NLST', files.append)
                
                # Check if our file exists (case-insensitive)
                matching_file = None
                for f in files:
                    if f.lower() == filename.lower():
                        matching_file = f
                        break
                
                if matching_file:
                    print(f"  ✓ Found in: {search_path}")
                    
                    # Download the file
                    with open(local_path, 'wb') as f:
                        ftp.retrbinary(f'RETR {matching_file}', f.write)
                    
                    file_size = os.path.getsize(local_path)
                    print(f"  ✓ Downloaded: {matching_file} ({file_size:,} bytes)")
                    downloaded.append(local_path)
                    found = True
                    break
                    
            except ftplib.error_perm:
                # Directory doesn't exist or no permission, continue searching
                continue
            except Exception as e:
                print(f"  ⚠ Error checking {search_path}: {e}")
                continue
        
        if not found:
            print(f"  ❌ Could not find {filename} in any directory")
            print(f"     Searched: {', '.join(search_paths)}")
    
    return downloaded


def extract_port_authority_gtins(csv_files):
    """Extract Port Authority product GTINs from CSV files"""
    print("\n" + "=" * 70)
    print("EXTRACTING PORT AUTHORITY GTINs")
    print("=" * 70)
    
    all_gtins = []
    
    for csv_file in csv_files:
        print(f"\nProcessing: {os.path.basename(csv_file)}")
        
        try:
            # Read CSV
            df = pd.read_csv(csv_file, low_memory=False)
            
            print(f"  Total rows: {len(df):,}")
            print(f"  Columns: {', '.join(df.columns[:10])}...")
            
            # SanMar specific column names (now we know them!)
            style_col = 'STYLE#' if 'STYLE#' in df.columns else None
            gtin_col = 'GTIN' if 'GTIN' in df.columns else None
            size_col = 'SIZE' if 'SIZE' in df.columns else None
            color_col = 'COLOR_NAME' if 'COLOR_NAME' in df.columns else None
            
            if not style_col or not gtin_col:
                print(f"  ⚠ Missing required columns")
                print(f"    Style column: {style_col}")
                print(f"    GTIN column: {gtin_col}")
                continue
            
            print(f"  ✓ Found columns: STYLE#, GTIN, SIZE, COLOR_NAME")
            
            if not style_col or not gtin_col:
                print(f"  ⚠ Could not find style or GTIN columns in this file")
                continue
            
            # Filter for Port Authority products
            for product_code in TARGET_PRODUCTS.keys():
                product_df = df[df[style_col] == product_code].copy()
                
                if len(product_df) > 0:
                    print(f"  ✓ Found {len(product_df)} entries for {product_code}")
                    
                    # Extract relevant columns
                    extracted = product_df[[style_col, gtin_col]].copy()
                    extracted['Product'] = product_code
                    
                    # Handle GTIN formatting (stored as float, need to convert properly)
                    def format_gtin(gtin_val):
                        if pd.isna(gtin_val):
                            return None
                        # Convert to integer first to remove decimal
                        gtin_int = int(float(gtin_val))
                        # Pad to 14 digits (GTIN-14 format) with leading zeros
                        return str(gtin_int).zfill(14)
                    
                    extracted['GTIN'] = product_df[gtin_col].apply(format_gtin)
                    
                    # Remove rows with no GTIN
                    extracted = extracted[extracted['GTIN'].notna()]
                    
                    if size_col and size_col in product_df.columns:
                        extracted['Size'] = product_df[size_col]
                    else:
                        extracted['Size'] = 'N/A'
                    
                    if color_col and color_col in product_df.columns:
                        extracted['Color'] = product_df[color_col]
                    else:
                        extracted['Color'] = 'N/A'
                    
                    all_gtins.append(extracted)
            
        except Exception as e:
            print(f"  ❌ Error processing file: {e}")
            continue
    
    if not all_gtins:
        print("\n⚠ WARNING: No Port Authority GTINs found in downloaded files")
        return None
    
    # Combine all GTINs
    combined_df = pd.concat(all_gtins, ignore_index=True)
    
    # Remove duplicates
    combined_df = combined_df.drop_duplicates(subset=['Product', 'Size', 'Color', 'GTIN'])
    
    print(f"\n✓ Total Port Authority GTINs extracted: {len(combined_df)}")
    
    return combined_df


def match_to_order(gtin_df, order_file):
    """Match GTINs to Ron Hoover order"""
    print("\n" + "=" * 70)
    print("MATCHING GTINs TO YOUR ORDER")
    print("=" * 70)
    
    if not os.path.exists(order_file):
        print(f"\n⚠ Order file not found: {order_file}")
        print("Continuing with all Port Authority GTINs...")
        return gtin_df
    
    try:
        # Read order
        order_df = pd.read_excel(order_file)
        
        print(f"\nOrder file loaded: {len(order_df)} items")
        
        # Get unique product/size combinations needed
        order_products = order_df[['productId', 'size', 'fit']].drop_duplicates()
        
        # Normalize product IDs (remove *** suffix)
        order_products['productId_normalized'] = order_products['productId'].replace(PRODUCT_VARIATIONS)
        
        # Match GTINs to order
        matched = []
        
        for _, row in order_products.iterrows():
            product = row['productId_normalized']
            size = row['size']
            
            # Find matching GTIN
            mask = (gtin_df['Product'] == product)
            if pd.notna(size):
                mask = mask & (gtin_df['Size'] == size)
            
            matches = gtin_df[mask]
            
            if len(matches) > 0:
                matched.append(matches.iloc[0])
                print(f"  ✓ {product} Size {size}: {matches.iloc[0]['GTIN']}")
            else:
                print(f"  ⚠ No GTIN found for {product} Size {size}")
        
        if matched:
            matched_df = pd.DataFrame(matched)
            print(f"\n✓ Matched {len(matched_df)} GTINs to your order")
            return matched_df
        else:
            print("\n⚠ No matches found, returning all GTINs")
            return gtin_df
            
    except Exception as e:
        print(f"\n⚠ Error matching to order: {e}")
        print("Continuing with all Port Authority GTINs...")
        return gtin_df


def create_label_file(gtin_df):
    """Create label print file with SanMar GTINs"""
    print("\n" + "=" * 70)
    print("CREATING LABEL PRINT FILE")
    print("=" * 70)
    
    output_file = f"SanMar_GTIN_Labels_{datetime.now().strftime('%Y%m%d_%H%M%S')}.xlsx"
    
    # Prepare label data
    label_data = []
    label_id = 1
    
    for _, row in gtin_df.iterrows():
        label_data.append({
            'Label_ID': f"SM{label_id:04d}",
            'Product_ID': row['Product'],
            'Product_Name': TARGET_PRODUCTS.get(row['Product'], 'Unknown'),
            'Size': row.get('Size', 'N/A'),
            'Color': row.get('Color', 'N/A'),
            'GTIN_UPC': row['GTIN'],
            'Barcode_Format': 'UPC-A' if len(str(row['GTIN'])) == 12 else 'EAN-13',
            'Notes': 'Official SanMar GTIN'
        })
        label_id += 1
    
    # Create DataFrame
    labels_df = pd.DataFrame(label_data)
    
    # Save to Excel
    labels_df.to_excel(output_file, index=False)
    
    print(f"\n✓ Label file created: {output_file}")
    print(f"  Total labels: {len(labels_df)}")
    print(f"\nLabel file contains:")
    print(f"  - Product ID")
    print(f"  - Product Name")
    print(f"  - Size")
    print(f"  - Color")
    print(f"  - Official SanMar GTIN/UPC")
    
    return output_file


def main():
    """Main execution"""
    print("\n" + "=" * 70)
    print("SANMAR GTIN DOWNLOADER - HUB CITY DESIGN INC.")
    print("=" * 70)
    print(f"\nTarget Products:")
    for code, name in TARGET_PRODUCTS.items():
        print(f"  - {code}: {name}")
    
    # Connect to FTP
    ftp = connect_to_ftp()
    if not ftp:
        print("\n❌ Cannot proceed without FTP connection")
        print("\nIf you need help:")
        print("  1. Verify your password is correct")
        print("  2. Contact: sanmarintegrations@sanmar.com")
        print("  3. Request FTP access confirmation")
        return
    
    try:
        # List directory to see structure
        print("\n" + "=" * 70)
        print("FTP DIRECTORY STRUCTURE")
        print("=" * 70)
        list_ftp_directory(ftp, "/")
        
        # Explore SanMarPDD directory
        print("\n" + "=" * 70)
        print("EXPLORING SANMARPDD DIRECTORY")
        print("=" * 70)
        list_ftp_directory(ftp, "/SanMarPDD")
        
        # Check if there's a subdirectory
        try:
            list_ftp_directory(ftp, "/SanMarPDD/SanMarPI")
        except:
            pass
        
        # Download GTIN files
        csv_files = download_gtin_files(ftp)
        
        if not csv_files:
            print("\n❌ No GTIN files downloaded")
            print("\nTrying to find files manually...")
            print("Listing root directory:")
            list_ftp_directory(ftp, "/")
            return
        
        # Close FTP connection
        ftp.quit()
        print("\n✓ FTP connection closed")
        
        # Extract Port Authority GTINs
        gtin_df = extract_port_authority_gtins(csv_files)
        
        if gtin_df is None or len(gtin_df) == 0:
            print("\n❌ No GTINs extracted")
            return
        
        # Match to order (if order file exists)
        matched_df = match_to_order(gtin_df, ORDER_FILE)
        
        # Create label file
        output_file = create_label_file(matched_df)
        
        print("\n" + "=" * 70)
        print("✓ COMPLETE!")
        print("=" * 70)
        print(f"\nYour label file is ready: {output_file}")
        print("\nNext steps:")
        print("  1. Open the label file in Excel")
        print("  2. Use the GTIN_UPC column for printing labels")
        print("  3. Import into your label software or use with ZP450")
        
    except Exception as e:
        print(f"\n❌ Unexpected error: {e}")
        import traceback
        traceback.print_exc()
        
    finally:
        try:
            ftp.quit()
        except:
            pass


if __name__ == "__main__":
    main()