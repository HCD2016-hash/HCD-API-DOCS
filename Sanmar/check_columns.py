"""
Quick Diagnostic - Check SanMar CSV Column Names
This will show us exactly what columns are in the files
"""

import pandas as pd
import os

DOWNLOAD_DIR = "sanmar_gtin_data"

print("=" * 80)
print("SANMAR CSV COLUMN DIAGNOSTIC")
print("=" * 80)

csv_files = [
    os.path.join(DOWNLOAD_DIR, 'SanMar_SDL_N.csv'),
    os.path.join(DOWNLOAD_DIR, 'SanMar_EPDD.csv')
]

for csv_file in csv_files:
    if not os.path.exists(csv_file):
        print(f"\n❌ File not found: {csv_file}")
        continue
    
    print(f"\n{'=' * 80}")
    print(f"FILE: {os.path.basename(csv_file)}")
    print(f"{'=' * 80}")
    
    try:
        # Read just the first few rows
        df = pd.read_csv(csv_file, nrows=5, low_memory=False)
        
        print(f"\nTotal columns: {len(df.columns)}")
        print("\nALL COLUMN NAMES:")
        for i, col in enumerate(df.columns, 1):
            print(f"  {i:3d}. {col}")
        
        # Look for J331 specifically
        print(f"\nSearching for J331 in the file...")
        df_full = pd.read_csv(csv_file, low_memory=False)
        
        # Try to find style column
        style_candidates = [c for c in df_full.columns if 'STYLE' in c.upper() or 'SKU' in c.upper()]
        print(f"\nPossible style columns: {style_candidates}")
        
        if style_candidates:
            style_col = style_candidates[0]
            j331_rows = df_full[df_full[style_col] == 'J331']
            
            if len(j331_rows) > 0:
                print(f"\n✓ Found {len(j331_rows)} rows for J331")
                print("\nFirst J331 row sample:")
                print(j331_rows.iloc[0].to_dict())
            else:
                print(f"\n⚠ No J331 found in column: {style_col}")
                print(f"Sample values from {style_col}:")
                print(df_full[style_col].head(10).tolist())
        
    except Exception as e:
        print(f"\n❌ Error reading file: {e}")
        import traceback
        traceback.print_exc()

print("\n" + "=" * 80)
print("DIAGNOSTIC COMPLETE")
print("=" * 80)