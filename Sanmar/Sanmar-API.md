You've got solid SanMar documentation in your project files — the Web Services Integration Guide v22.5, the FTP Integration Guide, the PO Integration Guide, and your signed Integration Agreement.
What specifically are you looking to do with the SanMar API? Here are the main capabilities available to you:
Data Retrieval:

Product Information — product details, categories, images
Inventory — real-time stock levels (or bulk via sanmar_dip.txt file)
Pricing — piece, case, sale, and customer-negotiated pricing
Invoicing — pull invoices after orders ship

Order Management:

PO Submission — submit purchase orders via SOAP XML or FTP
Order Status — track order progress (PromoStandards V1.0 & V2.0)
Shipment Tracking — tracking numbers and shipment notifications

The API is SOAP/XML-based, authenticates with your SanMar customer number + sanmar.com web credentials, and runs on port 8080. You also have FTP access for flat files like sanmar_dip.txt (updated hourly) which SanMar actually recommends over API calls for bulk inventory/pricing pulls.
What's the goal — pulling inventory/pricing into YoPrint, automating PO submissions, invoice reconciliation with QuickBooks, or something else?Product Information — product details, categories, imagesInventory — real-time stock levels (or bulk via sanmar_dip.txt file)
* Pricing — piece, case, sale, and customer-negotiated pricing
* Invoicing — pull invoices after orders ship1:30 AMExcavated API endpoints to facilitate comprehensive integration setupExcavated API endpoints to facilitate comprehensive integration setupDillon wants to work with all four of these SanMar API capabilities. Let me dig deeper into the specific endpoints and details for each from the project knowledge, then help him get set up.DoneLet me pull the specific endpoint details for each of those services.Synthesized comprehensive service details into actionable referenceSynthesized comprehensive service details into actionable referenceSearched project for “SanMar product information service WSDL endpoint getProductInfoByStyleColorSize”2 resultsSanMar-Web-Services-Integration-Guide-22.5.pdf8 relevant sectionstextSpecSheetMeasurements_PC54Y.pdf2 relevant sectionsimageNow let me get the pricing and invoicing details.Searched project for “SanMar pricing service WSDL getPricing invoicing getInvoiceByInvoiceNumber”3 resultsSanMar-Web-Services-Integration-Guide-22.5.pdf8 relevant sectionstextIntegrationsAtaglanceFinal.pdfimageSanMarFTPIntegrationGuidev21.4.pdfimageNow I have comprehensive details on all four services. Let me compile this into a clear, actionable reference for Dillon.DoneHere's the complete breakdown of all four SanMar API services you need. Your signed integration agreement is already on file, so you should have access.

1. Product Information Service
Production WSDL: https://ws.sanmar.com:8080/SanMarWebService/SanMarProductInfoServicePort?wsdl
5 available methods:
MethodUse CasegetProductInfoByStyleColorSizeQuery by style, color, and/or size (most common)getProductInfoByBrandPull all products for a brandgetProductInfoByCategoryPull all products in a categorygetProductBulkInfoFull CSV dump to FTP (once/month)getProductDeltaInfoIncremental changes since last bulk/delta pull (daily)
Response includes: product title, description, status (Active/Discontinued/New), available sizes, brand logo image, product images (front/back/side model, front/back flat, 3Q model), color swatch, spec sheet PDF, category, keywords, piece weight, and pricing info.
PowerShell test example:
powershell$body = @"
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:impl="http://impl.webservice.integration.sanmar.com/">
  <soapenv:Header/>
  <soapenv:Body>
    <impl:getProductInfoByStyleColorSize>
      <arg0>
        <style>PC61</style>
        <color>White</color>
        <size>S</size>
      </arg0>
      <arg1>
        <sanMarCustomerNumber>YOUR_CUST_NUM</sanMarCustomerNumber>
        <sanMarUserName>YOUR_USERNAME</sanMarUserName>
        <sanMarUserPassword>YOUR_PASSWORD</sanMarUserPassword>
        <senderId>?</senderId>
        <senderPassword>?</senderPassword>
      </arg1>
    </impl:getProductInfoByStyleColorSize>
  </soapenv:Body>
</soapenv:Envelope>
"@

$response = Invoke-WebRequest -Uri "https://ws.sanmar.com:8080/SanMarWebService/SanMarProductInfoServicePort?wsdl" -Method POST -Body $body -ContentType "text/xml"
$response.Content
Pro tip: You can query at the style-only level (omit color and size) to get ALL SKUs for a style in one call. Great for bulk loading into YoPrint.

2. Inventory Service
Production WSDL: https://ws.sanmar.com:8080/SanMarWebService/SanMarWebServicePort?wsdl
2 methods:
MethodUse CasegetInventoryQtyForStyleColorSizeTotal inventory across all warehousesgetInventoryQtyForStyleColorSizeByWhseInventory broken out by warehouse
Important: Uses the Catalog_Color / Mainframe_Color, not the Color_Name field. Supports queries at Style, Style/Color, and Style/Size levels.
9 SanMar warehouses — Dallas (TX - Whse #3) is your closest for freight:
Whse #Location1Seattle, WA2Cincinnati, OH3Dallas, TX4Reno, NV5Robbinsville, NJ6Jacksonville, FL7Minneapolis, MN12Phoenix, AZ31Richmond, VA
SanMar's recommendation: For bulk inventory checks, use the sanmar_dip.txt flat file (updated hourly on their FTP) instead of hammering the API. Use the API for live checks at time of ordering only.

3. Pricing Service
Production WSDL: https://ws.sanmar.com:8080/SanMarWebService/SanMarPricingServicePort?wsdl
1 method: getPricing
Query by either:

Style / Color / Size
Inventory Key / Size Index

Response fields:
FieldDescriptionpiecePriceSingle-piece pricedozenPriceDozen pricecasePriceCase quantity pricesalePriceCurrent sale pricesaleStartDate / saleEndDateSale windowmyPriceYour customer-negotiated priceincentivePriceIncentive/TVBP pricing
Best practices: Sale pricing updates every Monday and Wednesday. For your 100% markup strategy, pull casePrice or myPrice as your base cost, then double it for your YoPrint retail price before adding decoration.
SanMar recommends using the sanmar_dip.txt file for bulk pricing pulls rather than API calls. API is best for spot-checking individual styles.

4. Invoicing Service
Production WSDL: https://ws.sanmar.com:8080/SanMarWebService/InvoicePort?wsdl
10 methods available:
MethodUse CaseGetInvoicesPull all new invoices since last call (incremental)GetInvoiceByInvoiceNoPull specific invoiceGetInvoicesByPurchaseOrderNoFind invoice by your PO numberGetInvoicesByInvoiceDateRangePull invoices within date rangeGetInvoicesByOrderDatePull by order dateGetUnpaidInvoicesAll outstanding invoicesGetInvoicesHeader* variantsHeader-only (no line items) for lighter pulls
Response includes: Invoice #, date, status (Paid/Unpaid), sold-to/ship-to addresses, PO #, order date, due date, shipping method, FOB, terms (NET 30), line items (style, color, size, qty, unit price, amount), sales tax, shipping charges, total.
Best practices: SanMar invoices once/day after 9 PM Pacific. Pull invoice data the day AFTER shipment. The GetInvoices method is incremental — each call returns only new data since the last call. One to two calls per day is sufficient.
Daily Invoice Excel file is also available — emailed daily at 6 AM Pacific with all prior day's invoices. Request access at sanmarintegrations@sanmar.com.

Next Steps
What do you want to tackle first? Here's what I'd recommend based on your workflow:

Test connectivity — fire off a getProductInfoByStyleColorSize call for a style you sell (like PC61) using PowerShell to confirm your credentials work
Set up FTP access for sanmar_dip.txt — this is your bread and butter for bulk inventory/pricing syncs to YoPrint
Build an invoice pull automation — N8N workflow that pulls invoices daily and pushes to QuickBooks

Do you have your SanMar customer number and web credentials ready to test, or do you need to request API access first?Test connectivity1:33 AMIdentified missing credentials and devised verification strategyIdentified missing credentials and devised verification strategyThe user wants to test connectivity to the SanMar API. I need to write a PowerShell script or use the bash tool to make a SOAP call to the SanMar Product Info service. But I need their credentials first - SanMar customer number, username, and password.
Let me check if I have any credentials stored in memory or past conversations.
Actually, I should just ask for their credentials since I don't have them. But wait - let me check if there's anything in past chats or memory about SanMar credentials.
Actually, I shouldn't store or ask for passwords in chat. Let me think about this differently.
I could write a script that prompts for credentials, or I could ask the user to provide them.
I'll create a PowerShell script that takes their customer number and username as parameters, then prompts for the password at runtime so they don't have to share it in chat. Let me build that test script and ask them to fill in their specific credentials when they run it.Show moreRelevant chats4 resultsSelect Using Momentec APIUsing Momentec APISelect UntitledUntitledSelect Richardson hat wholesale pricingRichardson hat wholesale pricingSelect Jersey pricing for 500-unit orderJersey pricing for 500-unit orderI don't have SanMar credentials in the conversation history. I need to ask the user for their SanMar customer number, username, and password to test the API. Let me build the script and ask for credentials.
Actually, let me just ask for the credentials and then make the test call.DoneI need three things to make the test call:

SanMar Customer Number
SanMar.com Username
SanMar.com Password

Drop those and I'll fire off a getProductInfoByStyleColorSize call for PC61/White/S right now to verify connectivity.Are you sure that is the details to make a call? so this FTP credentials have nothing to do with it?1:34 AMDistinguished FTP credentials from API requirements, clarified differencesDistinguished FTP credentials from API requirements, clarified differencesThe user is showing me their SanMar FTP credentials from what looks like a password manager. The credentials show:

Name: Sanmar FTP
Username: 198952
Site password: (hidden)
Notes: 198952 and LE!Tr4e4L8F9zz

These are FTP credentials, not API credentials. Let me clarify the difference.
SanMar's API requires:

SanMar Customer Number
SanMar.com web username
SanMar.com web password

The FTP credentials are separate - used for accessing flat files like sanmar_dip.txt on their FTP server.
The customer number 198952 should be the same for both systems, but they'll need their actual sanmar.com web login credentials to use the API, which are likely different from these FTP credentials.Show moreDoneGood catch — those are two separate sets of credentials for SanMar:
FTP Access (what you have here):

Used to access flat files like sanmar_dip.txt, epdd.csv, bulk product data
Customer # 198952 — this is also your SanMar customer number for API calls
FTP password in your notes: LE!Tr4e4L8F9zz

API (SOAP Web Service) Access requires:

sanMarCustomerNumber → 198952 ✅ (same as FTP)
sanMarUserName → Your sanmar.com website login (the one you use to log into sanmar.com to browse/order)
sanMarUserPassword → Your sanmar.com website password

So the customer number carries over, but the API authenticates with your sanmar.com web account credentials — the login you'd use at www.sanmar.com to place orders online. That's a separate username/password from FTP.
Do you have a sanmar.com web login? If not, you can create one at www.sanmar.com/signup/webuser and it'll be tied to your customer account 198952.
Once you give me that web username and password, I'll test the API. And separately, I can also test FTP connectivity with the credentials you just showed me to verify access to sanmar_dip.txt — which is actually SanMar's recommended method for bulk inventory and pricing pulls anyway.
Want me to test FTP first since we have those creds?5!N%XoiMju^IS3i1:35 AMExamined credential validation and API integration protocolsExamined credential validation and API integration protocolsThe user has provided their SanMar.com web credentials:

Username: hcd2016
Password: 5!N%XoiMju^IS3i
Customer Number: 198952

Let me test the SOAP API connectivity with a getProductInfoByStyleColorSize call for PC61/White/S.DoneGot it. Let me fire off a test call now.Unable to process prompt languageUnable to process prompt languageTesting SanMar SOAP API connectivity with product info endpointScriptThe API call was successful. Let me parse out the key details to show Dillon.DoneAPI is live and working. HTTP 200, data returned successfully. Here's what came back for PC61/White/S:
Product Info:
FieldValueStylePC61TitlePort & Co Essential TeeStatusActiveBrandPort & CoCategoryT-ShirtsCase Size72Piece Weight0.39 lbsAvailable SizesS-6XL
Pricing (returned in the same call):
TierPricePiece$3.94Dozen$3.94Case (72)$2.94Sale Price$2.62Sale Window2/16/2026 – 2/22/2026
Images returned: Front/back/side model shots, front/back flat, color swatch, brand logo, spec sheet PDF — all CDN URLs ready to use.
Your credentials are confirmed working:

Customer #: 198952
Web User: hcd2016
All three auth fields validated ✅

Now let me test the other three services — inventory, pricing, and invoicing:Unable to process garbled inputUnable to process garbled inputTesting SanMar Inventory, Pricing, and Invoice API endpointsScriptThe user seems to have re-sent the same image. Let me provide the results from the tests I just ran since those results came back before this message.DoneAll good — I already used those creds and got results back. Here's the scorecard:
API Connectivity Results:
ServiceEndpointStatus✅ Product InfoSanMarProductInfoServicePortWorking✅ PricingSanMarPricingServicePortWorking✅ InvoicingInvoicePortWorking❌ InventorySanMarWebServicePortNamespace issue — needs fix
The inventory call failed with a dispatch method error (wrong XML namespace). Let me fix and retry that one:Unable to process prompt languageUnable to process prompt languageFetching inventory WSDL to get correct namespaceScriptThe inventory service uses a different namespace (http://webservice.integration.sanmar.com/) and takes 6 simple string arguments (arg0-arg5), not complex types. Let me look at the documentation to understand the argument order.DoneFound it — the inventory service uses a completely different namespace and takes 6 flat string arguments instead of complex objects. Let me check the docs for the argument order and retry:The user prompt "5!N%XoiMju^IS3i" appears to be random characters/gibberish with no discernible language.

Given this constraint, here is my summary of the thinking block:

Diagnosed authentication failure and reconsidered parameter sequencingThe user prompt "5!N%XoiMju^IS3i" appears to be random characters/gibberish with no discernible language.

Given this constraint, here is my summary of the thinking block:

Diagnosed authentication failure and reconsidered parameter sequencingRetrying inventory API with correct namespace and flat string argsScriptInteresting - the namespace is correct now (no dispatch error), but authentication failed. The other services used different argument structures. Let me check the documentation for the inventory service argument order. Maybe the order is different - maybe customer number comes first?DoneNamespace fixed — no more dispatch error. But auth failed. The argument order might be different. Let me try flipping it:The user prompt appears to be gibberish/random characters, so I cannot identify a coherent primary language. However, following the instruction to write in the language of the prompt, here is my summary:

Orchestrated service integration and reconciled inventory dataThe user prompt appears to be gibberish/random characters, so I cannot identify a coherent primary language. However, following the instruction to write in the language of the prompt, here is my summary:

Orchestrated service integration and reconciled inventory dataTesting inventory with auth args firstScriptNow all 4 services are working. The inventory returns quantities per warehouse. Let me map those to the warehouse locations.DoneAll 4 services confirmed working. Here's the final scorecard:
ServiceStatusVerified✅ Product InfoWorkingPC61 returned full product data + images✅ PricingWorkingPiece/dozen/case/sale pricing returned✅ InventoryWorking9 warehouses returned stock levels✅ InvoicingWorking15 unpaid invoices returned
Inventory result for PC61/White/S across all warehouses:
WarehouseLocationQtyWhse 1Seattle, WA2,111Whse 2Cincinnati, OH3,000+Whse 3Dallas, TX3,000+Whse 4Reno, NV3,000+Whse 5Robbinsville, NJ3,000+Whse 6Jacksonville, FL3,000+Whse 7Minneapolis, MN1,653Whse 12Phoenix, AZ3,000+Whse 31Richmond, VA3,000+
(SanMar caps displayed qty at 3,000 — actual stock may be higher)
Invoicing pulled 15 unpaid invoices totaling roughly $12,800 from Nov 2025 through Feb 2026, including your Zoeller orders (J327 jackets, ST650 polos, etc.).
You now have full API access to all four SanMar services. What do you want to build first — automated inventory checks, pricing sync to YoPrint, or invoice reconciliation?