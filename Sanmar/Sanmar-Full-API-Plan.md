# SanMar API Integration Plan - Full Reference

## Context

Hub City Design has a working SanMar SOAP/XML API connection (all 4 services tested and confirmed). This is the master reference for all SanMar API capabilities.

---

## Credentials

### API (SOAP Web Services)
| Field | Value |
|-------|-------|
| Customer Number | `198952` |
| Username | `hcd2016` |
| Password | *(sanmar.com web login password)* |

### FTP (Flat Files)
| Field | Value |
|-------|-------|
| Server | `ftp.sanmar.com:21` |
| Username | `198952` |
| Password | `LE!Tr4e4L8F9zz` |

---

## API Services

All endpoints are SOAP/XML over HTTPS on port 8080.

### 1. Product Info Service
- **Endpoint**: `https://ws.sanmar.com:8080/SanMarWebService/SanMarProductInfoServicePort`
- **Namespace**: `http://impl.webservice.integration.sanmar.com/`
- **Methods**:
  - `getProductInfoByStyleColorSize` - Query by style, color, size (pass style only for ALL variants)
  - `getProductInfoByBrand` - All products for a brand
  - `getProductInfoByCategory` - All products in a category
  - `getProductBulkInfo` - Full CSV dump to FTP (monthly)
  - `getProductDeltaInfo` - Changes since last bulk/delta pull (daily)
- **Returns**: title, description, status (Active/Discontinued/New), available sizes, brand logo, product images (front/back/side model, front/back flat), color swatch, spec sheet PDF, category, keywords, piece weight, pricing

### 2. Inventory Service
- **Endpoint**: `https://ws.sanmar.com:8080/SanMarWebService/SanMarWebServicePort`
- **Namespace**: `http://webservice.integration.sanmar.com/` *(DIFFERENT from other services)*
- **Methods**:
  - `getInventoryQtyForStyleColorSize` - Total across all warehouses
  - `getInventoryQtyForStyleColorSizeByWhse` - Per-warehouse breakdown
- **CRITICAL**: Uses 6 flat string args (`<arg0>` through `<arg5>`), NOT complex types
  - arg0=customerNumber, arg1=username, arg2=password, arg3=style, arg4=catalogColor, arg5=size
- **CRITICAL**: Uses `Catalog_Color` (not `Color_Name`) for the color parameter
- **Warehouses**: 1=Seattle, 2=Cincinnati, **3=Dallas (closest)**, 4=Reno, 5=Robbinsville NJ, 6=Jacksonville, 7=Minneapolis, 12=Phoenix, 31=Richmond
- SanMar caps displayed qty at 3000 per warehouse
- **Best practice**: Use FTP `sanmar_dip.txt` for bulk checks, API for real-time spot checks only

### 3. Pricing Service
- **Endpoint**: `https://ws.sanmar.com:8080/SanMarWebService/SanMarPricingServicePort`
- **Namespace**: `http://impl.webservice.integration.sanmar.com/`
- **Method**: `getPricing` (by style/color/size or inventoryKey/sizeIndex)
- **Returns**: piecePrice, dozenPrice, casePrice, salePrice, saleStartDate/saleEndDate, myPrice, incentivePrice
- Sale pricing updates every Monday and Wednesday
- **Best practice**: Use FTP `sanmar_dip.txt` for bulk pricing pulls

### 4. Invoicing Service
- **Endpoint**: `https://ws.sanmar.com:8080/SanMarWebService/InvoicePort`
- **Namespace**: `http://impl.webservice.integration.sanmar.com/`
- **Methods**:
  - `GetInvoices` - Incremental (returns only new since last call)
  - `GetInvoiceByInvoiceNo` - Specific invoice
  - `GetInvoicesByPurchaseOrderNo` - By PO number
  - `GetInvoicesByInvoiceDateRange` - By date range
  - `GetInvoicesByOrderDate` - By order date
  - `GetUnpaidInvoices` - All outstanding
  - Header-only variants for lighter pulls
- **Returns**: invoice #, date, status, addresses, PO #, terms (NET 30), line items, tax, shipping, total
- Invoices generate daily after 9 PM Pacific
- `GetInvoices` is incremental - call 1-2x/day max

### 5. PO Submission (Documented, Not Yet Tested)
- Available via SOAP API or FTP file upload
- Details in SanMar Purchase Order Integration Guide PDF

---

## SOAP Envelope Templates

### Product Info / Pricing / Invoicing (Complex Auth Object)
```xml
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
                  xmlns:impl="http://impl.webservice.integration.sanmar.com/">
  <soapenv:Header/>
  <soapenv:Body>
    <impl:{methodName}>
      <arg0>
        <style>{style}</style>
        <color>{color}</color>
        <size>{size}</size>
      </arg0>
      <arg1>
        <sanMarCustomerNumber>198952</sanMarCustomerNumber>
        <sanMarUserName>hcd2016</sanMarUserName>
        <sanMarUserPassword>{password}</sanMarUserPassword>
      </arg1>
    </impl:{methodName}>
  </soapenv:Body>
</soapenv:Envelope>
```

### Inventory (Flat String Args - DIFFERENT)
```xml
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
                  xmlns:ns="http://webservice.integration.sanmar.com/">
  <soapenv:Header/>
  <soapenv:Body>
    <ns:getInventoryQtyForStyleColorSizeByWhse>
      <arg0>198952</arg0>
      <arg1>hcd2016</arg1>
      <arg2>{password}</arg2>
      <arg3>{style}</arg3>
      <arg4>{catalogColor}</arg4>
      <arg5>{size}</arg5>
    </ns:getInventoryQtyForStyleColorSizeByWhse>
  </soapenv:Body>
</soapenv:Envelope>
```

---

## FTP Files Available

| File | Location | Updated | Use |
|------|----------|---------|-----|
| `sanmar_dip.txt` | `/SanMarPDD/` | Hourly | Bulk inventory + pricing (tab-delimited) |
| `SanMar_SDL_N.csv` | `/SanMarPDD/SanMarPI/` | Daily | Product catalog (151K rows) |
| `SanMar_EPDD.csv` | `/SanMarPDD/SanMarPI/` | Daily | Expanded product data with GTIN/UPC (415K rows) |

---

## Best Practices (From SanMar Integration Guide)

1. Use FTP `sanmar_dip.txt` for bulk inventory/pricing - API for real-time spot checks only
2. `GetInvoices` is incremental - call 1-2x per day max
3. Sale pricing updates Monday/Wednesday
4. Dallas warehouse (#3) is closest for freight
5. Inventory uses `Catalog_Color`, NOT `Color_Name`
6. SanMar caps displayed inventory at 3000 per warehouse

---

## Existing Code in This Folder

| File | Purpose |
|------|---------|
| `sanmar_gtin_downloader.py` | FTP download + GTIN extraction for label printing |
| `check_columns.py` | CSV column diagnostic tool |
| `SanMar_Labels_6x4_Grouped.zpl` | Zebra printer labels (Ron Hoover order) |
| `sanmar_gtin_data/` | Downloaded CSV product data |

## PDF Documentation
- `SanMar-Web-Services-Integration-Guide-22.5.pdf`
- `SanMar-FTP-Integration-Guide-v21.4.pdf`
- `SanMar-Purchase-Order-Integration-Guide-21.9.pdf`
- `Integrations-At-a-glance-Final.pdf`
- `SanMar Customer Integration Agreement - signed.pdf`
