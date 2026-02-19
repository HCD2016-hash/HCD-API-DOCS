# YoPrint Webhook Payload Samples (Knowledge File)

## Table of Contents
- [customer.created](#customer-created)
- [customer_contact.updated](#customer-contact-updated)
- [job.marked_as_not_rush](#job-marked-as-not-rush)
- [job.status_changed](#job-status-changed)
- [job_approval.approved](#job-approval-approved)
- [message.received_customer](#message-received-customer)
- [order.converted_to_quote](#order-converted-to-quote)
- [order.status_changed](#order-status-changed)
- [payment_received.any_amount](#payment-received-any-amount)
- [payment_received.deposit_amount](#payment-received-deposit-amount)
- [payment_received.full_amount](#payment-received-full-amount)
- [purchase_order.status_changed](#purchase-order-status-changed)
- [quote.converted_to_sales_order](#quote-converted-to-sales-order)
- [quote.created](#quote-created)
- [sales_order.status_changed](#sales-order-status-changed)
- [shipment.status_changed](#shipment-status-changed)
- [work_pipeline.status_changed](#work-pipeline-status-changed)

## customer.created

**Description:** Sample payload for `customer.created` (from Hub City Design's repo).

```json
{
  "id": "Q8epr1aXRor9PG",
  "name": "Forza",
  "trashed": false,
  "website": null,
  "contacts": [
    {
      "id": "WQ9Mv4MydxlBXA",
      "fax": "",
      "email": "tasha@forzasiteservices.com",
      "phone": "+1 806-466-7504",
      "trashed": false,
      "last_name": "Saiz",
      "created_at": "2025-10-27T22:39:30+00:00",
      "first_name": "Tasha",
      "is_primary": false,
      "updated_at": "2025-10-27T22:39:30+00:00",
      "customer_id": "Q8epr1aXRor9PG",
      "fax_country": "US",
      "send_invoice": false,
      "phone_country": "US",
      "default_receive_sms": false
    }
  ],
  "created_at": "2025-10-27T22:39:30+00:00",
  "tax_exempt": false,
  "updated_at": "2025-10-27T22:39:30+00:00",
  "vat_number": null,
  "wallet_fund": 0,
  "quote_amount": 0,
  "resale_number": null,
  "unpaid_amount": 0,
  "internal_notes": null,
  "ordered_amount": 0,
  "overdue_amount": 0,
  "wallet_currency": {
    "id": "YyAgrW6Zjz98Me",
    "iso": "USD",
    "name": "United States Dollar",
    "symbol": "$",
    "default": true,
    "trashed": false
  },
  "last_ordered_date": null,
  "customer_portal_id": "xwp56q",
  "deposit_due_amount": 0,
  "customer_portal_link": "https://portal.hubcitydesignlbk.com/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6MCwidGlkIjozMjMyLCJleHAiOjE3OTA5ODA3NzAsInN1YiI6MzkzOTg5LCJpYXQiOjE3NjE2MDQ3NzAsIm5iZiI6MTc2MTYwNDc3MCwianRpIjoicXhXQ1ZjbHVISjJZb0RpbCJ9.K566DMj8xPvgBlyB9XqFeVv2H3CAIfRgxQN4lJDl5UE",
  "default_warehouse_id": null,
  "default_payment_term_id": null,
  "default_pricing_group_id": null,
  "display_customer_portal_id": "xwp56q",
  "customer_portal_id_override": null,
  "customer_portal_payment_option": null,
  "has_customer_portal_id_override": false
}
```

## customer_contact.updated

**Description:** Sample payload for `customer_contact.updated` (from Hub City Design's repo).

```json
{
  "id": "mk6bzKbaDNl9G5",
  "fax": null,
  "email": "dustin@deltasigndesign.com",
  "phone": "806-241-8993",
  "trashed": false,
  "customer": {
    "id": "WNp4vRwPoel02x",
    "name": "Delta Sign and Designs",
    "trashed": false,
    "website": "",
    "created_at": "2024-05-19T04:23:22+00:00",
    "tax_exempt": false,
    "updated_at": "2024-05-19T04:23:22+00:00",
    "vat_number": null,
    "wallet_fund": 0,
    "quote_amount": 0,
    "resale_number": "",
    "unpaid_amount": 0,
    "internal_notes": "",
    "ordered_amount": 0,
    "overdue_amount": 0,
    "wallet_currency": {
      "id": "YyAgrW6Zjz98Me",
      "iso": "USD",
      "name": "United States Dollar",
      "symbol": "$",
      "default": true,
      "trashed": false
    },
    "last_ordered_date": null,
    "customer_portal_id": "0x34pj",
    "deposit_due_amount": 0,
    "customer_portal_link": "https://portal.hubcitydesignlbk.com/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6MjkyNTUwLCJ0aWQiOjMyMzIsImV4cCI6MTc5MDkzMDk0Miwic3ViIjoyNzQ4NjUsImlhdCI6MTc2MTU1NDk0MiwibmJmIjoxNzYxNTU0OTQyLCJqdGkiOiJFNVMydENGUzlKemw0QmRxIn0.Sdcdk7zCA_lHGBsPUXDOJeUWIGateo2AXIwAYgNYm1g",
    "default_warehouse_id": null,
    "default_payment_term_id": null,
    "default_pricing_group_id": null,
    "display_customer_portal_id": "0x34pj",
    "customer_portal_id_override": null,
    "customer_portal_payment_option": null,
    "has_customer_portal_id_override": false
  },
  "last_name": null,
  "created_at": "2024-05-19T04:23:22+00:00",
  "first_name": "Dustin",
  "is_primary": true,
  "updated_at": "2025-10-27T08:49:01+00:00",
  "customer_id": "WNp4vRwPoel02x",
  "fax_country": null,
  "send_invoice": false,
  "phone_country": "us",
  "default_receive_sms": true
}
```

## job.marked_as_not_rush

**Description:** Sample payload for `job.marked_as_not_rush` (from Hub City Design's repo).

```json
{
  "id": "mV4Xzg5264vqKd",
  "name": "Graphic Design Work",
  "note": "Most of the time you will submit customer poor artwork to be remade to&nbsp;\u200b<a href=\"https://www.jjdigitizing.com/login.html\" rel=\"noopener noreferrer\" target=\"_blank\">JJ Digitizing CLICK HERE</a>\u200b\u200b\u200b",
  "order": {
    "id": "aO0Zva65kElnMK",
    "mode": "create",
    "name": "Logo Vectorizing and File Collection ",
    "tags": [],
    "type": "quote",
    "quote": true,
    "status": {
      "id": "xDQwr811yLvRyG",
      "role": "quote",
      "type": "start",
      "color": "#0bf5fe",
      "label": "Pending",
      "trashed": false,
      "position": 0,
      "customer_label": "Pending"
    },
    "is_rush": false,
    "trashed": false,
    "version": 2,
    "calc_tax": 3140,
    "customer": {
      "id": "OaoDvOjXbXr8wA",
      "pdf": {
        "invoice_statement": "https://secure.yoprint.com/api/v2/document/pdf/customer_invoice_statement/GprQ3p8NGXtYlR/hub-city-design-inc/OaoDvOjXbXr8wA"
      },
      "hide": false,
      "name": "Foerster Travel",
      "trashed": false,
      "website": "",
      "created_at": "2024-05-04T02:45:56+00:00",
      "tax_exempt": false,
      "updated_at": "2025-03-21T21:26:48+00:00",
      "vat_number": null,
      "wallet_fund": 0,
      "quote_amount": 0,
      "resale_number": "",
      "unpaid_amount": 64050,
      "internal_notes": "",
      "ordered_amount": 80060,
      "overdue_amount": 0,
      "wallet_currency": {
        "id": "YyAgrW6Zjz98Me",
        "iso": "USD",
        "name": "United States Dollar",
        "symbol": "$",
        "default": true,
        "trashed": false
      },
      "last_ordered_date": "2025-03-21T21:23:19+00:00",
      "customer_portal_id": "0vkvjo",
      "deposit_due_amount": 30000,
      "customer_portal_link": "https://portal.hubcitydesignlbk.com/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjg4OTA0LCJ0aWQiOjMyMzIsImV4cCI6MTc5MDc1ODMyOSwic3ViIjoyNzE0ODgsImlhdCI6MTc2MTM4MjMyOSwibmJmIjoxNzYxMzgyMzI5LCJqdGkiOiJpcVpubFJHdGZ4T0VnR2l1In0.NbQ09o1PkdaJn-h7NpbXMlCj2NCwBELfDuJymKa4SIs",
      "default_warehouse_id": null,
      "default_payment_term_id": null,
      "default_pricing_group_id": null,
      "display_customer_portal_id": "0vkvjo",
      "customer_portal_id_override": null,
      "customer_portal_payment_option": null,
      "has_customer_portal_id_override": false
    },
    "due_date": "2025-11-06T08:43:23+00:00",
    "is_draft": true,
    "is_quote": true,
    "is_legacy": false,
    "prod_note": "Test Production Notes",
    "scoped_id": "SO1278",
    "status_id": "xDQwr811yLvRyG",
    "calc_total": 49590,
    "created_at": "2025-10-25T08:43:23+00:00",
    "created_by": "4DKZvMB42l7n2J",
    "is_created": false,
    "issue_date": "2025-10-25T08:43:23+00:00",
    "start_date": "2025-11-01T08:43:23+00:00",
    "unique_key": "ord_fee6e03-fe0696ga2ad0524c77c6-71712567f6a167b5facga46-d44d5ad",
    "updated_at": "2025-10-25T08:52:09+00:00",
    "client_note": "Test notes to customer",
    "customer_id": "OaoDvOjXbXr8wA",
    "deposit_due": "2025-10-27T08:43:34+00:00",
    "from_legacy": false,
    "grouped_pdf": [
      {
        "label": "Main",
        "documents": [
          {
            "url": "https://secure.yoprint.com/api/v2/document/pdf/quote/GprQ3p8NGXtYlR/hub-city-design-inc/aO0Zva65kElnMK",
            "label": "Quote",
            "description": "Quote details",
            "object_type": "quote"
          },
          {
            "url": "https://secure.yoprint.com/api/v2/document/pdf/quote_compact/GprQ3p8NGXtYlR/hub-city-design-inc/aO0Zva65kElnMK",
            "label": "Quote (Compact)",
            "description": "Quote details optimized for printing",
            "object_type": "quote"
          },
          {
            "url": "https://secure.yoprint.com/api/v2/document/pdf/so_invoices/GprQ3p8NGXtYlR/hub-city-design-inc/aO0Zva65kElnMK",
            "label": "All Invoices",
            "description": "All invoices",
            "object_type": "invoice"
          },
          {
            "url": "https://secure.yoprint.com/api/v2/document/pdf/so_compact_invoices/GprQ3p8NGXtYlR/hub-city-design-inc/aO0Zva65kElnMK",
            "label": "All Invoices (Compact)",
            "description": "All invoices optimized for printing",
            "object_type": "invoice"
          },
          {
            "url": "https://secure.yoprint.com/api/v2/document/pdf/so_as_invoice/GprQ3p8NGXtYlR/hub-city-design-inc/aO0Zva65kElnMK",
            "label": "Quote as Invoice",
            "description": "Uses the Quote ID as the Invoice ID",
            "object_type": "quote"
          },
          {
            "url": "https://secure.yoprint.com/api/v2/document/pdf/so_as_invoice_compact/GprQ3p8NGXtYlR/hub-city-design-inc/aO0Zva65kElnMK",
            "label": "Quote as Invoice (Compact)",
            "description": "Uses the Quote ID as the Invoice ID. Optimized for printing",
            "object_type": "quote"
          }
        ]
      },
      {
        "label": "Custom PDF",
        "documents": []
      },
      {
        "label": "Job",
        "documents": [
          {
            "url": "https://secure.yoprint.com/api/v2/document/pdf/so_jobs/GprQ3p8NGXtYlR/hub-city-design-inc/aO0Zva65kElnMK?show_mockup=0",
            "label": "All Jobs",
            "description": "All job details without mockup",
            "object_type": "job"
          },
          {
            "url": "https://secure.yoprint.com/api/v2/document/pdf/so_jobs/GprQ3p8NGXtYlR/hub-city-design-inc/aO0Zva65kElnMK?show_mockup=1",
            "label": "All Jobs (Mockups Incl.)",
            "description": "All job details including mockups",
            "object_type": "job"
          },
          {
            "url": "https://secure.yoprint.com/api/v2/document/pdf/so_jobs_label/GprQ3p8NGXtYlR/hub-city-design-inc/aO0Zva65kElnMK",
            "label": "All Job Labels (4\" x 6\")",
            "description": "All Job Labels (4\" x 6\")",
            "object_type": "job"
          },
          {
            "url": "https://secure.yoprint.com/api/v2/document/pdf/so_jobs_dymo_label/GprQ3p8NGXtYlR/hub-city-design-inc/aO0Zva65kElnMK",
            "label": "All Job Labels (1\" x 2-1/8\")",
            "description": "All Job Labels in  (1\" x 2-1/8\")",
            "object_type": "job"
          },
          {
            "url": "https://secure.yoprint.com/api/v2/document/pdf/so_worksheet/GprQ3p8NGXtYlR/hub-city-design-inc/aO0Zva65kElnMK",
            "label": "All Jobs Worksheet",
            "description": "All Jobs Worksheet",
            "object_type": "job"
          }
        ]
      },
      {
        "label": "Shipment",
        "documents": [
          {
            "url": "https://secure.yoprint.com/api/v2/document/pdf/so_shipment_uni/GprQ3p8NGXtYlR/hub-city-design-inc/aO0Zva65kElnMK",
            "label": "All Packing Slips",
            "description": "All shipment packing slips",
            "object_type": "shipment"
          },
          {
            "url": "https://secure.yoprint.com/api/v2/document/pdf/so_shipment_label_uni/GprQ3p8NGXtYlR/hub-city-design-inc/aO0Zva65kElnMK?doc_size=full",
            "label": "All Shipment Labels (Letter size)",
            "description": "All shipment labels with white labeling (Letter Size)",
            "object_type": "shipment"
          },
          {
            "url": "https://secure.yoprint.com/api/v2/document/pdf/so_shipment_label_uni/GprQ3p8NGXtYlR/hub-city-design-inc/aO0Zva65kElnMK?doc_size=label",
            "label": "All Shipment Labels (4\" x 6\")",
            "description": "All shipment labels with white labeling (4\" x 6\")",
            "object_type": "shipment"
          },
          {
            "url": "https://secure.yoprint.com/api/v2/document/pdf/so_shipments_dymo_label/GprQ3p8NGXtYlR/hub-city-design-inc/aO0Zva65kElnMK",
            "label": "All Shipment Labels (1\" x 2-1/8\")",
            "description": "All Shipment Labels to be printed on (1\" x 2-1/8\")",
            "object_type": "shipment"
          }
        ]
      }
    ],
    "paid_amount": 0,
    "creator_name": "Dillon White",
    "lock_version": 1761382329880948,
    "order_profit": {
      "dp": 2,
      "value": 4573
    },
    "warehouse_id": "1oVOzZo504rW5G",
    "calc_discount": 0,
    "calc_subtotal": 46450,
    "cust_due_date": "2025-11-08T08:43:23+00:00",
    "deposit_total": 50000,
    "ship_due_date": null,
    "assigned_users": [],
    "auto_saved_for": null,
    "invoiced_total": {
      "dp": 2,
      "value": 4959
    },
    "_legacy_hash_id": "aO0Zva65kElnMK",
    "approval_status": null,
    "billing_address": null,
    "full_amount_due": "2025-11-08T08:43:34+00:00",
    "internal_status": "draft",
    "payment_term_id": "X5PVrExkKzGWbB",
    "deposit_required": true,
    "inventory_status": "pending",
    "job_lock_version": 1761382329880882,
    "pricing_group_id": "gO4Klq8aJvMPex",
    "pricing_strategy": "job_separately",
    "shipping_address": null,
    "auto_invoice_type": "single_invoice",
    "has_valid_invoice": true,
    "order_balance_due": {
      "dp": 3,
      "value": 49590
    },
    "billing_address_id": null,
    "calc_deposit_total": 24800,
    "customer_has_email": true,
    "customer_po_number": "TEST Customer po",
    "deposit_amount_due": {
      "dp": 3,
      "value": 24800
    },
    "has_valid_shipment": false,
    "unallocated_amount": 0,
    "customer_contact_id": "Q5XOvkOZDBvxna",
    "customer_profile_id": null,
    "shipment_cost_total": {
      "dp": 2,
      "value": 0
    },
    "shipping_address_id": null,
    "auto_invoice_managed": true,
    "invoice_lock_version": 1761382329876317,
    "payment_lock_version": 1761381803392039,
    "credit_card_surcharge": {
      "dp": 2,
      "value": 0
    },
    "invoiced_tax_subtotal": {
      "dp": 2,
      "value": 314
    },
    "order_item_cart_total": {
      "dp": 2,
      "value": 4645
    },
    "producible_item_count": 1,
    "shipment_lock_version": 1761382329874387,
    "has_not_invoiced_items": false,
    "quickbook_disable_sync": false,
    "status_completion_date": null,
    "has_over_invoiced_items": false,
    "order_item_lock_version": 1761382329879256,
    "order_margin_percentage": {
      "dp": 2,
      "value": 9844
    },
    "order_markup_percentage": {
      "dp": 2,
      "value": 630690
    },
    "status_last_change_date": null,
    "last_payment_request_date": null,
    "quickbook_last_error_sync": null,
    "auto_invoice_shipment_rate": {
      "dp": 2,
      "value": 0
    },
    "invoiced_discount_subtotal": {
      "dp": 2,
      "value": 0
    },
    "invoiced_shipment_subtotal": {
      "dp": 2,
      "value": 0
    },
    "customer_billing_contact_id": "Q5XOvkOZDBvxna",
    "quickbook_last_success_sync": null,
    "shipment_billable_fee_total": {
      "dp": 2,
      "value": 0
    },
    "invoiced_order_item_subtotal": {
      "dp": 2,
      "value": 4645
    },
    "auto_invoice_shipment_price_type": "NONE",
    "has_shipment_items_not_allocated": true,
    "has_shipment_items_over_allocated": false,
    "has_external_integration_sync_error": false,
    "shipment_billable_fee_invoice_status": "fully_billed"
  },
  "mockup": [
    {
      "id": "6Z9Bz53q39vmab",
      "url": "https://download.yoprint.com/1431408/Logo-Package-Full-Color.png?s=CwOV63sLF5qehnjr9EyJKw&e=1761458400&download=1",
      "name": "Logo Package PNG Mockup Test",
      "size": 42873,
      "job_id": "mV4Xzg5264vqKd",
      "preview": {
        "large": "https://preview-v1.yoprint.com/12/fit/1200/1200/sm/0/plain/1431408/Logo-Package-Full-Color.png?secure=MuEiQMt9tGChbSC5cKUwAw==,1813222329",
        "small": "https://preview-v1.yoprint.com/12/fit/250/250/sm/0/plain/1431408/Logo-Package-Full-Color.png?secure=xwE9_FIAVMkGw3P44ZWd8Q==,1813222329",
        "medium": "https://preview-v1.yoprint.com/12/fit/800/800/sm/0/plain/1431408/Logo-Package-Full-Color.png?secure=oWMvnwH3lZd9KrkdYIjQkw==,1813222329"
      },
      "is_image": true,
      "position": 0,
      "view_url": "https://download.yoprint.com/1431408/Logo-Package-Full-Color.png?s=CwOV63sLF5qehnjr9EyJKw&e=1761458400",
      "file_name": "Logo-Package-Full-Color.png",
      "mime_type": "image/png",
      "collection": "mockup",
      "created_at": "2025-10-25T08:49:30+00:00",
      "preview_url": "https://preview-v1.yoprint.com/12/fit/0/900/sm/0/plain/1431408/Logo-Package-Full-Color.png?secure=a7t0kd3HC6Rosjg6PiDEew==,1813222329",
      "show_in_pdf": true,
      "job_services": [
        {
          "id": "4L9MzLnDy1vXQP",
          "note": "Standard Vectorizing Fee. Multiple logos depending on complexity can be eligible for a 5-10$ discount per. Complex jobs could be priced upwards of 100$<br>All based on time, if outsourced we need to get a quote from designer or have the final price prior to providing a $ figure to customer.&nbsp;",
          "_edit": {
            "is_new": true
          },
          "valid": true,
          "option": "Vectorizing/Redrawing Fee",
          "location": {
            "id": "QJw0rJ7d2vXBO3",
            "type": "database",
            "trashed": false,
            "display_name": "N/A"
          },
          "position": 1,
          "service_id": "Owakre16Or6975",
          "service_name": "Graphic Design Logo Clean Up All Files Delivered to Customer",
          "customer_note": null,
          "pricing_strategy": "job_separately",
          "pricing_matrix_used": "primary_pricing",
          "formatted_pricing_total": "$45.00"
        }
      ],
      "current_approval": null,
      "current_approval_status": null
    }
  ],
  "is_rush": false,
  "due_date": "2025-11-06T08:43:23+00:00",
  "order_id": "aO0Zva65kElnMK",
  "position": null,
  "services": [
    {
      "id": "4L9MzLnDy1vXQP",
      "note": "Standard Vectorizing Fee. Multiple logos depending on complexity can be eligible for a 5-10$ discount per. Complex jobs could be priced upwards of 100$<br>All based on time, if outsourced we need to get a quote from designer or have the final price prior to providing a $ figure to customer.&nbsp;",
      "_edit": {
        "is_new": true
      },
      "valid": true,
      "option": "Vectorizing/Redrawing Fee",
      "location": {
        "id": "QJw0rJ7d2vXBO3",
        "type": "database",
        "trashed": false,
        "display_name": "N/A"
      },
      "position": 1,
      "service_id": "Owakre16Or6975",
      "service_name": "Graphic Design Logo Clean Up All Files Delivered to Customer",
      "customer_note": null,
      "pricing_strategy": "job_separately",
      "pricing_matrix_used": "primary_pricing",
      "formatted_pricing_total": "$45.00"
    }
  ],
  "scoped_id": "JOB-2931",
  "status_id": "qdgwz3mm9bvG19",
  "created_at": "2025-10-25T08:44:37+00:00",
  "item_count": 1,
  "start_date": "2025-10-25T08:43:23+00:00",
  "unique_key": "job_c174c8e1b379ge908-5b4b87da8d768ae1gc2ef6-695f7febg4gfb474bab",
  "updated_at": "2025-10-25T08:52:09+00:00",
  "has_service": true,
  "qr_code_url": "https://ypnt.us/qr/y9-0p-job-1335810",
  "sales_order": {
    "name": "Logo Vectorizing and File Collection ",
    "is_rush": false,
    "due_date": "2025-11-06T08:43:23+00:00",
    "is_quote": true,
    "status_id": "xDQwr811yLvRyG",
    "created_by": "4DKZvMB42l7n2J",
    "issue_date": "2025-10-25T08:43:23+00:00",
    "start_date": "2025-11-01T08:43:23+00:00",
    "cust_due_date": "2025-11-08T08:43:23+00:00",
    "ship_due_date": null
  },
  "mockup_count": 1,
  "pricing_total": "$45.00",
  "location_count": 1,
  "order_scoped_id": "SO1278",
  "production_file": [
    {
      "id": "OPALrY2R2Wvexy",
      "url": "https://download.yoprint.com/1431409/Logo-Package-Full-Color.svg?s=-CkpkTkULVdSTQF7DqNnnA&e=1761458400&download=1",
      "name": "Logo Package Full Color",
      "size": 23115,
      "job_id": "mV4Xzg5264vqKd",
      "preview": null,
      "is_image": true,
      "position": 0,
      "view_url": "https://download.yoprint.com/1431409/Logo-Package-Full-Color.svg?s=-CkpkTkULVdSTQF7DqNnnA&e=1761458400",
      "file_name": "Logo-Package-Full-Color.svg",
      "mime_type": "image/svg+xml",
      "collection": "production_file",
      "created_at": "2025-10-25T08:51:58+00:00",
      "preview_url": null,
      "show_in_pdf": true,
      "job_services": [
        {
          "id": "4L9MzLnDy1vXQP",
          "note": "Standard Vectorizing Fee. Multiple logos depending on complexity can be eligible for a 5-10$ discount per. Complex jobs could be priced upwards of 100$<br>All based on time, if outsourced we need to get a quote from designer or have the final price prior to providing a $ figure to customer.&nbsp;",
          "_edit": {
            "is_new": true
          },
          "valid": true,
          "option": "Vectorizing/Redrawing Fee",
          "location": {
            "id": "QJw0rJ7d2vXBO3",
            "type": "database",
            "trashed": false,
            "display_name": "N/A"
          },
          "position": 1,
          "service_id": "Owakre16Or6975",
          "service_name": "Graphic Design Logo Clean Up All Files Delivered to Customer",
          "customer_note": null,
          "pricing_strategy": "job_separately",
          "pricing_matrix_used": "primary_pricing",
          "formatted_pricing_total": "$45.00"
        }
      ],
      "current_approval": null,
      "current_approval_status": null
    }
  ],
  "impression_count": 1,
  "inventory_status": "pending",
  "pricing_original_total": "$45.00",
  "status_completion_date": null,
  "status_last_change_date": null,
  "stock_on_hand_accounted": false,
  "need_cust_provide_product": false
}
```

## job.status_changed

**Description:** Sample payload for `job.status_changed` (from Hub City Design's repo).

```json
{
  "id": "q2nVrG92NAlagp",
  "pdf": [
    {
      "url": "https://secure.yoprint.com/api/v2/document/pdf/job/2WvVMxJn6Yuwrx/hub-city-design-inc/q2nVrG92NAlagp?show_mockup=0",
      "label": "Job Details",
      "description": "Job details without mockup",
      "object_type": "job"
    },
    {
      "url": "https://secure.yoprint.com/api/v2/document/pdf/job/2WvVMxJn6Yuwrx/hub-city-design-inc/q2nVrG92NAlagp?show_mockup=1",
      "label": "Job Details (Mockups Incl.)",
      "description": "Job details including mockups",
      "object_type": "job"
    },
    {
      "url": "https://secure.yoprint.com/api/v2/document/pdf/job_label/2WvVMxJn6Yuwrx/hub-city-design-inc/q2nVrG92NAlagp",
      "label": "Job Label (4\" x 6\")",
      "description": "Job Label (4\" x 6\")",
      "object_type": "job"
    },
    {
      "url": "https://secure.yoprint.com/api/v2/document/pdf/job_dymo_label/2WvVMxJn6Yuwrx/hub-city-design-inc/q2nVrG92NAlagp",
      "label": "Job Label (1\" x 2-1/8\")",
      "description": "Job Label (1\" x 2-1/8\")",
      "object_type": "job"
    }
  ],
  "name": "Texas Trader BackPacks",
  "note": "&nbsp;<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"913\" style=\"border-collapse: collapse;width:684pt;\" data-pasted=\"true\"><tbody><tr><td height=\"20\" align=\"right\" style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; height: 15pt; width: 84px; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">42918</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; width: 79px; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">Alberto</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; width: 111px; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">Saenz</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; width: 70px; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">DEQ</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; width: 67px; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">BG223</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; width: 156px; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">BG223 &mdash; Exec Backpack</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; width: 19px; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\"><br></td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; width: 31px; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\"><br></td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; width: 148px; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">Ron Hoover Equipment</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; width: 148px; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">DEQ</td></tr><tr><td height=\"20\" align=\"right\" style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; height: 15pt; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">45782</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">Raul</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">Coronado Jr</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">COR</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">BG223</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">BG223 &mdash; Exec Backpack</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\"><br></td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\"><br></td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">Ron Hoover Equipment</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">COR</td></tr><tr><td height=\"20\" align=\"right\" style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; height: 15pt; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">41938</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">James</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">Farley</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">COR</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">BG223</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">BG223 &mdash; Exec Backpack</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\"><br></td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\"><br></td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">Ron Hoover Equipment</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">COR</td></tr><tr><td height=\"20\" align=\"right\" style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; height: 15pt; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">60168</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">Trevor</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">Mathis</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">COR</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">BG223</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">BG223 &mdash; Exec Backpack</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\"><br></td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\"><br></td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">Ron Hoover Equipment</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">COR</td></tr><tr><td height=\"20\" align=\"right\" style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; height: 15pt; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">42915</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">Roel</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">Lopez</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">DEQ</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">BG223</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">BG223 &mdash; Exec Backpack</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\"><br></td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\"><br></td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">Ron Hoover Equipment</td><td style='color: black; font-size: 15px; font-weight: 400; font-style: normal; text-decoration: none; font-family: \"Aptos Narrow\", sans-serif; vertical-align: bottom; border: none; --darkreader-inline-color: var(--darkreader-text-000000, #e8e6e3); --darkreader-inline-border-top: none; --darkreader-inline-border-right: none; --darkreader-inline-border-bottom: none; --darkreader-inline-border-left: none;' data-darkreader-inline-color=\"\" data-darkreader-inline-border-top=\"\" data-darkreader-inline-border-right=\"\" data-darkreader-inline-border-bottom=\"\" data-darkreader-inline-border-left=\"\">DEQ</td></tr></tbody></table>",
  "mockup": [
    {
      "id": "NEV1vXKoeYr3LR",
      "url": "https://download.yoprint.com/1435118/Asset-1xmas.png?s=QWw7PKtb5ETbeC8wHPRXog&e=1761717600&download=1",
      "name": "Asset 1xmas",
      "size": 10170613,
      "job_id": "q2nVrG92NAlagp",
      "preview": {
        "large": "https://preview-v1.yoprint.com/12/fit/1200/1200/sm/0/plain/1435118/Asset-1xmas.png?secure=Eht2Shfg_2-Ocrl2M0pSQg==,1813518177",
        "small": "https://preview-v1.yoprint.com/12/fit/250/250/sm/0/plain/1435118/Asset-1xmas.png?secure=A_oB7IUycZ1EgWOHuU5R8Q==,1813518177",
        "medium": "https://preview-v1.yoprint.com/12/fit/800/800/sm/0/plain/1435118/Asset-1xmas.png?secure=CtNwff_4z1MtzGj4hkOzWQ==,1813518177"
      },
      "is_image": true,
      "position": 4294967295,
      "view_url": "https://download.yoprint.com/1435118/Asset-1xmas.png?s=QWw7PKtb5ETbeC8wHPRXog&e=1761717600",
      "file_name": "Asset-1xmas.png",
      "mime_type": "image/png",
      "collection": "mockup",
      "created_at": "2025-10-28T19:00:58+00:00",
      "job_service": [
        "OPALrYAQEbrexy"
      ],
      "show_in_pdf": true,
      "current_approval": null,
      "custom_properties": {
        "show_in_pdf": true
      },
      "current_approval_status": null,
      "current_approval_notes_to_customer": null,
      "current_approval_notes_from_customer": null
    }
  ],
  "status": {
    "id": "enY1z9yyWkzPmJ",
    "role": "job",
    "type": "in_progress",
    "color": "#be04fb",
    "label": "Ready for Production",
    "trashed": false,
    "position": 4,
    "customer_label": "Scheduled For Production"
  },
  "is_rush": false,
  "version": 2,
  "customer": {
    "id": "BVXdlj7pVNzpgY",
    "name": "Ron Hoover RV & Marine"
  },
  "due_date": "2025-10-05T19:46:19+00:00",
  "order_id": "8nDRz2Znq8zMEV",
  "position": 1337471,
  "services": [
    {
      "id": "OPALrYAQEbrexy",
      "note": "",
      "_edit": {
        "is_new": true
      },
      "valid": true,
      "option": "5000 Stitches or less",
      "version": 2,
      "location": {
        "id": "LwYOzn1RdlGPbn",
        "type": "database",
        "trashed": false,
        "display_name": "TBD"
      },
      "position": 1,
      "service_id": "mk6bzKMbnv9G5y",
      "from_legacy": false,
      "service_name": "Embroidery - Apparel/Accessory VIP",
      "customer_note": "",
      "pricing_total": {
        "dp": 3,
        "value": 11560
      },
      "pricing_strategy": "job_separately",
      "pricing_matrix_used": "primary_pricing"
    }
  ],
  "pipelines": [
    {
      "id": "6oejzBp7dVv8Gq",
      "name": "Embroidery",
      "note": null,
      "job_id": "q2nVrG92NAlagp",
      "status": {
        "id": "KG1dvwXXyMleP3",
        "role": "pipeline",
        "type": "start",
        "color": "#24e8e5",
        "label": "Pending",
        "trashed": false,
        "position": 0,
        "pipeline_id": "X5PVrELApzGWbB",
        "customer_label": "Pending"
      },
      "due_date": "2025-10-05T19:46:19+00:00",
      "job_name": "Texas Trader BackPacks",
      "order_id": "8nDRz2Znq8zMEV",
      "position": 0,
      "status_id": "KG1dvwXXyMleP3",
      "created_at": "2025-10-28T19:00:57+00:00",
      "order_name": null,
      "start_date": "2025-09-23T19:46:19+00:00",
      "updated_at": "2025-10-28T19:00:57+00:00",
      "job_is_rush": 0,
      "pipeline_id": "X5PVrELApzGWbB",
      "sales_order": {
        "due_date": null,
        "is_quote": false,
        "status_id": null,
        "created_by": null,
        "issue_date": null,
        "start_date": null,
        "customer_id": null,
        "cust_due_date": null,
        "customer_name": null,
        "ship_due_date": null
      },
      "job_scoped_id": "JOB-2949",
      "job_status_id": "enY1z9yyWkzPmJ",
      "assigned_users": [
        "N4Lpz0w3Kl3R0m",
        "OPALrYy0Wrexy9"
      ],
      "job_item_count": 2,
      "order_scoped_id": null,
      "status_completion_date": null,
      "assigned_users_hydrated": [
        {
          "id": "N4Lpz0w3Kl3R0m",
          "name": "Ashley Scott",
          "avatar_url": "https://download.yoprint.com/749377/5f2f58c4893afd346fdff02c5555d6eb.png?s=zt2DLuLnqHi1uhfGeJhckg&e=1761717600"
        },
        {
          "id": "OPALrYy0Wrexy9",
          "name": "Brooklyn Shirley",
          "avatar_url": "https://download.yoprint.com/1365101/5f2f58c4893afd346fdff02c5555d6eb.png?s=YqAYfS_rcKSkx-oHsosiQw&e=1761717600"
        }
      ],
      "status_last_change_date": "2025-10-22T15:11:28+00:00"
    }
  ],
  "scoped_id": "JOB-2949",
  "status_id": "enY1z9yyWkzPmJ",
  "item_count": 2,
  "start_date": "2025-09-23T19:46:19+00:00",
  "unique_key": "job_92aa3489d-9b1bb-c-03a5bb--298246-cc-c96001f9728g699a4a3e6557",
  "from_legacy": false,
  "has_service": true,
  "qr_code_url": "https://ypnt.us/qr/y9-0p-job-1337471",
  "sales_order": {
    "name": "Online Store Options",
    "is_rush": false,
    "due_date": "2025-10-05T19:46:19+00:00",
    "is_quote": true,
    "status_id": "xDQwr811yLvRyG",
    "created_by": "4DKZvMB42l7n2J",
    "issue_date": "2025-09-23T19:46:19+00:00",
    "start_date": "2025-09-30T19:46:19+00:00",
    "cust_due_date": "2025-10-07T19:46:19+00:00",
    "ship_due_date": null
  },
  "pricing_total": {
    "dp": 3,
    "value": 11560
  },
  "assigned_users": [],
  "auto_saved_for": null,
  "location_count": 1,
  "order_scoped_id": "SO1217",
  "previous_status": {
    "id": "qdgwz3mm9bvG19",
    "role": "job",
    "type": "start",
    "color": "#0df6ff",
    "label": "Pending",
    "trashed": false,
    "position": 0,
    "customer_label": "Pending"
  },
  "production_file": [],
  "impression_count": 2,
  "inventory_status": "not_committed",
  "pending_approval": null,
  "participant_emails": [
    "cgray@ronhoover.com"
  ],
  "previous_status_id": "qdgwz3mm9bvG19",
  "pricing_rule_applied": null,
  "services_still_valid": true,
  "pricing_original_total": {
    "dp": 3,
    "value": 11560
  },
  "status_completion_date": null,
  "status_last_change_date": null,
  "stock_on_hand_accounted": false,
  "order_customer_po_number": null,
  "need_cust_provide_product": false
}
```

## job_approval.approved

**Description:** Sample payload for `job_approval.approved` (from Hub City Design's repo).

```json
{
  "id": "enY1z9y73xzPmJ",
  "job": {
    "id": "YyAgrWXJaBv98M",
    "name": "Embroidery Apparel",
    "scoped_id": "JOB-2921"
  },
  "type": "job",
  "order": {
    "id": "4L9MzL3V01lXQP",
    "due_date": null,
    "is_quote": true,
    "scoped_id": "SO1267",
    "issue_date": "2025-10-20T18:29:53+00:00",
    "cust_due_date": null,
    "ship_due_date": null
  },
  "job_id": "YyAgrWXJaBv98M",
  "mockup": [
    {
      "id": "WQ9Mv4yBV9lBXA",
      "url": "https://download.yoprint.com/1310402/Bag-01.png?s=kc1la6_AWi1aBJBcv-eckA&e=1761631200&download=1",
      "name": "Bag-01",
      "size": 4108297,
      "status": "approved",
      "preview": {
        "large": "https://preview-v1.yoprint.com/12/fit/1200/1200/sm/0/plain/1310402/Bag-01.png?secure=WuRFBgKeR3E1YCq7zfkozg==,1813410444",
        "small": "https://preview-v1.yoprint.com/12/fit/250/250/sm/0/plain/1310402/Bag-01.png?secure=871L6HfzXIhx-g7rCutiUw==,1813410444",
        "medium": "https://preview-v1.yoprint.com/12/fit/800/800/sm/0/plain/1310402/Bag-01.png?secure=utS06E37m7bJFUIWcK0ahQ==,1813410444"
      },
      "is_image": true,
      "media_id": "Kg38zA3ZpnvyeE",
      "position": 4294967295,
      "view_url": "https://download.yoprint.com/1310402/Bag-01.png?s=kc1la6_AWi1aBJBcv-eckA&e=1761631200",
      "file_name": "Bag-01.png",
      "mime_type": "image/png",
      "collection": "mockup",
      "created_at": "2025-10-23T07:18:11+00:00",
      "updated_at": "2025-10-23T07:18:11+00:00",
      "is_show_in_pdf": true,
      "notes_to_customer": "",
      "notes_from_customer": null
    }
  ],
  "status": "completed",
  "customer": {
    "id": "pDQProkVOBr5dn",
    "name": "Xcel Energy"
  },
  "order_id": "4L9MzL3V01lXQP",
  "signature": "Brandyi Ammons",
  "created_at": "2025-10-23T07:19:05+00:00",
  "updated_at": "2025-10-27T13:07:24+00:00",
  "approved_by": null,
  "completed_at": "2025-10-27T13:07:24+00:00",
  "is_completed": true,
  "approved_by_type": "customer",
  "notes_to_customer": "",
  "notes_from_customer": null,
  "customer_last_viewed_at": "2025-10-27T13:07:17+00:00"
}
```

## message.received_customer

**Description:** Sample payload for `message.received_customer` (from Hub City Design's repo).

```json
{
  "id": "8nDRz28OoYvMEV",
  "name": null,
  "type": "inbound",
  "user": null,
  "email": null,
  "driver": "web",
  "status": "received",
  "system": false,
  "contact": {
    "id": "BVXdlj7ZxjzpgY",
    "fax": null,
    "email": "brandyi.j.ammons@xcelenergy.com",
    "phone": "+1 806-445-5868",
    "trashed": false,
    "last_name": "Ammons",
    "created_at": "2024-05-04T02:45:39+00:00",
    "first_name": "Brandyi",
    "is_primary": true,
    "updated_at": "2024-05-29T19:33:26+00:00",
    "customer_id": "pDQProkVOBr5dn",
    "fax_country": null,
    "send_invoice": false,
    "phone_country": "US",
    "default_receive_sms": true
  },
  "message": "If possible, I need to change order. We now only need 4 of each large shirt.",
  "user_id": null,
  "order_id": "4L9MzL3V01lXQP",
  "retryable": false,
  "status_id": null,
  "actor_type": "contact",
  "contact_id": "BVXdlj7ZxjzpgY",
  "created_at": "2025-10-27T13:10:08+00:00",
  "recipients": [],
  "attachments": [],
  "has_message": true,
  "order_quote": true,
  "participant": null,
  "display_type": "default_v2",
  "message_status": null,
  "order_scoped_id": "SO1267",
  "preview_message": "If possible, I need to change order. We now only need 4 of each large shirt.",
  "original_message": "If possible, I need to change order. We now only need 4 of each large shirt.",
  "purchase_order_id": null,
  "purchase_scoped_id": null,
  "has_original_message": true,
  "rendered_attachments": [],
  "message_participant_id": null
}
```

## order.converted_to_quote

**Description:** Sample payload for `order.converted_to_quote` (from Hub City Design's repo).

```json
{
  "id": "aO0Zva65kElnMK",
  "mode": "view",
  "name": "Logo Vectorizing and File Collection ",
  "tags": [],
  "type": "quote",
  "quote": true,
  "status": {
    "id": "xDQwr811yLvRyG",
    "role": "quote",
    "type": "start",
    "color": "#0bf5fe",
    "label": "Pending",
    "trashed": false,
    "position": 0,
    "customer_label": "Pending"
  },
  "is_rush": false,
  "trashed": false,
  "version": 2,
  "calc_tax": 3140,
  "customer": {
    "id": "OaoDvOjXbXr8wA",
    "name": "Foerster Travel",
    "trashed": false,
    "website": "",
    "contacts": [
      {
        "id": "Q5XOvkOZDBvxna",
        "fax": null,
        "email": "lindsay@foerstertravel.com",
        "phone": null,
        "trashed": false,
        "last_name": null,
        "created_at": "2024-05-04T02:45:56+00:00",
        "first_name": "Foerster Travel",
        "is_primary": true,
        "updated_at": "2024-05-04T02:45:56+00:00",
        "customer_id": "OaoDvOjXbXr8wA",
        "fax_country": null,
        "send_invoice": false,
        "phone_country": "us",
        "default_receive_sms": false
      },
      {
        "id": "OxBDzygnDXvAVK",
        "fax": null,
        "email": "lindsay@foerstertravel.com",
        "phone": null,
        "trashed": true,
        "last_name": null,
        "created_at": "2024-05-19T04:23:20+00:00",
        "first_name": "Contact #1",
        "is_primary": false,
        "updated_at": "2024-12-18T04:44:05+00:00",
        "customer_id": "OaoDvOjXbXr8wA",
        "fax_country": null,
        "send_invoice": false,
        "phone_country": "us",
        "default_receive_sms": false
      },
      {
        "id": "DkNwvVoBaWld3o",
        "fax": null,
        "email": "lindsay@foerstertravel.com",
        "phone": null,
        "trashed": true,
        "last_name": null,
        "created_at": "2024-05-19T04:25:20+00:00",
        "first_name": "Contact #2",
        "is_primary": false,
        "updated_at": "2024-12-18T04:44:03+00:00",
        "customer_id": "OaoDvOjXbXr8wA",
        "fax_country": null,
        "send_invoice": false,
        "phone_country": "us",
        "default_receive_sms": false
      },
      {
        "id": "6oejzB2dpKz8Gq",
        "fax": "",
        "email": "jmay@chemtechserv.com",
        "phone": "+1 806-474-3694",
        "trashed": false,
        "last_name": "May",
        "created_at": "2025-04-04T02:34:16+00:00",
        "first_name": "Jerrick",
        "is_primary": false,
        "updated_at": "2025-04-04T02:34:16+00:00",
        "customer_id": "OaoDvOjXbXr8wA",
        "fax_country": "",
        "send_invoice": false,
        "phone_country": "US",
        "default_receive_sms": true
      }
    ],
    "created_at": "2024-05-04T02:45:56+00:00",
    "tax_exempt": false,
    "updated_at": "2025-10-27T06:46:48+00:00",
    "vat_number": null,
    "wallet_fund": 0,
    "quote_amount": 0,
    "resale_number": "",
    "unpaid_amount": 113640,
    "internal_notes": "",
    "ordered_amount": 129650,
    "overdue_amount": 64050,
    "wallet_currency": {
      "id": "YyAgrW6Zjz98Me",
      "iso": "USD",
      "name": "United States Dollar",
      "symbol": "$",
      "default": true,
      "trashed": false
    },
    "last_ordered_date": "2025-10-25T08:43:23+00:00",
    "customer_portal_id": "0vkvjo",
    "deposit_due_amount": 24800,
    "customer_portal_link": "https://portal.hubcitydesignlbk.com/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjg4OTA0LCJ0aWQiOjMyMzIsImV4cCI6MTc5MDkyNTY0NCwic3ViIjoyNzE0ODgsImlhdCI6MTc2MTU0OTY0NCwibmJmIjoxNzYxNTQ5NjQ0LCJqdGkiOiIxUFpPdmFlaG9ndlZCRGR2In0.L0vtJOv8x9ZOBhPrR4tL4QkeZpe9ZWPqyrdZRlNcQGM",
    "default_warehouse_id": null,
    "default_payment_term_id": null,
    "default_pricing_group_id": null,
    "display_customer_portal_id": "0vkvjo",
    "customer_portal_id_override": null,
    "customer_portal_payment_option": null,
    "has_customer_portal_id_override": false
  },
  "due_date": "2025-11-06T08:43:23+00:00",
  "is_draft": false,
  "is_quote": true,
  "prod_note": "Test Production Notes",
  "scoped_id": "SO1278",
  "status_id": "xDQwr811yLvRyG",
  "calc_total": 49590,
  "created_at": "2025-10-25T08:43:23+00:00",
  "created_by": "4DKZvMB42l7n2J",
  "is_created": true,
  "issue_date": "2025-10-25T08:43:23+00:00",
  "start_date": "2025-11-01T08:43:23+00:00",
  "unique_key": "ord_fee6e03-fe0696ga2ad0524c77c6-71712567f6a167b5facga46-d44d5ad",
  "updated_at": "2025-10-27T07:20:44+00:00",
  "client_note": "Test notes to customer",
  "customer_id": "OaoDvOjXbXr8wA",
  "deposit_due": "2025-10-27T08:43:34+00:00",
  "paid_amount": 0,
  "warehouse_id": "1oVOzZo504rW5G",
  "calc_discount": 0,
  "calc_subtotal": 46450,
  "cust_due_date": "2025-11-08T08:43:23+00:00",
  "deposit_total": 50000,
  "ship_due_date": null,
  "assigned_users": [],
  "auto_saved_for": null,
  "discount_total": 0,
  "_legacy_hash_id": "aO0Zva65kElnMK",
  "approval_status": null,
  "full_amount_due": "2025-11-08T08:43:34+00:00",
  "payment_term_id": "X5PVrExkKzGWbB",
  "customer_profile": null,
  "deposit_required": true,
  "inventory_status": "not_committed",
  "pricing_group_id": "gO4Klq8aJvMPex",
  "pricing_strategy": "job_separately",
  "billing_address_id": null,
  "calc_deposit_total": 24800,
  "customer_has_email": false,
  "customer_po_number": "TEST Customer po",
  "formatted_calc_tax": "$3.14",
  "customer_contact_id": "Q5XOvkOZDBvxna",
  "customer_profile_id": null,
  "shipping_address_id": null,
  "formatted_calc_total": "$49.59",
  "has_pending_approval": false,
  "formatted_paid_amount": "$0.00",
  "quickbook_disable_sync": false,
  "status_completion_date": null,
  "formatted_calc_discount": "$0.00",
  "formatted_calc_subtotal": "$46.45",
  "formatted_deposit_total": "$50.00",
  "status_last_change_date": "2025-10-27T06:46:48+00:00",
  "formatted_invoiced_total": "$49.59",
  "has_pending_job_approval": false,
  "last_payment_request_date": null,
  "quickbook_last_error_sync": null,
  "customer_portal_order_link": "https://portal.hubcitydesignlbk.com/external-redirect/show_sales_order?order_id=aO0Zva65kElnMK&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjg4OTA0LCJ0aWQiOjMyMzIsImV4cCI6MTc5MDkyNTY0NCwic3ViIjoyNzE0ODgsImlhdCI6MTc2MTU0OTY0NCwibmJmIjoxNzYxNTQ5NjQ0LCJqdGkiOiIwWVF2ak85UXNlTkJLTmpWIn0.IDmOhyP-qIH63ukomOw7QUX0W_fzFn3XkvJ4z60pxZE",
  "has_pending_order_approval": false,
  "formatted_order_balance_due": "$49.59",
  "quickbook_last_success_sync": "2025-10-27T06:49:56+00:00",
  "customer_portal_payment_link": "https://portal.hubcitydesignlbk.com/external-redirect/show_sales_order?order_id=aO0Zva65kElnMK&show_payment=true&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjg4OTA0LCJ0aWQiOjMyMzIsImV4cCI6MTc5MDkyNTY0NCwic3ViIjoyNzE0ODgsImlhdCI6MTc2MTU0OTY0NCwibmJmIjoxNzYxNTQ5NjQ0LCJqdGkiOiJ2N0czRVZBSUx4UFh2Y2hjIn0.b8Mo2E4H2v1157HV9Yi61vV_Q91AyoU1f4o5sIfMYsQ",
  "formatted_calc_deposit_total": "$24.80",
  "formatted_deposit_amount_due": "$49.59",
  "formatted_shipment_cost_total": "$0.00",
  "formatted_invoiced_tax_subtotal": "$3.14",
  "formatted_order_item_cart_total": "$46.45",
  "has_external_integration_sync_error": false,
  "formatted_invoiced_discount_subtotal": "$0.00",
  "formatted_invoiced_shipment_subtotal": "$0.00",
  "formatted_shipment_billable_fee_total": "$0.00",
  "formatted_invoiced_order_item_subtotal": "$46.45"
}
```

## order.status_changed

**Description:** Sample payload for `order.status_changed` (from Hub City Design's repo).

```json
{
  "id": "06ZjrmDJOqzVRk",
  "mode": "view",
  "name": "PDWA PVC Hats-Printed Apparel",
  "tags": [],
  "quote": false,
  "status": {
    "id": "pDQProk6ZJr5dn",
    "role": "order",
    "type": "in_progress",
    "color": "#fed9a8",
    "label": "Waiting For PO Arrival",
    "trashed": false,
    "position": 4,
    "customer_label": "Products Ordered"
  },
  "is_rush": false,
  "trashed": false,
  "version": 2,
  "calc_tax": 0,
  "customer": {
    "id": "6Z9Bz52Z2ormab",
    "pdf": {
      "invoice_statement": "https://secure.yoprint.com/api/v2/document/pdf/customer_invoice_statement/kxvkD5WA18cklV/hub-city-design-inc/6Z9Bz52Z2ormab"
    },
    "hide": false,
    "name": "Palo Duro Wildfire Academy",
    "tags": [],
    "media": [],
    "trashed": false,
    "website": "",
    "contacts": [
      {
        "id": "KG1dvw4e7aleP3",
        "fax": "",
        "email": "jonathans4stevens@gmail.com",
        "phone": "+1 806-433-7730",
        "trashed": false,
        "last_name": "Stevens",
        "created_at": "2025-10-01T17:48:44+00:00",
        "first_name": "Jonathan ",
        "is_primary": false,
        "updated_at": "2025-10-15T15:17:23+00:00",
        "customer_id": "6Z9Bz52Z2ormab",
        "fax_country": "",
        "send_invoice": false,
        "phone_country": "US",
        "default_receive_sms": true
      },
      {
        "id": "LwYOznK59drGPb",
        "fax": "",
        "email": "palodurowildfireacademy@gmail.com",
        "phone": "",
        "trashed": false,
        "last_name": "",
        "created_at": "2025-10-01T18:00:49+00:00",
        "first_name": "Palo Duro Wildlife Academy",
        "is_primary": true,
        "updated_at": "2025-10-02T03:03:01+00:00",
        "customer_id": "6Z9Bz52Z2ormab",
        "fax_country": "",
        "send_invoice": false,
        "phone_country": "",
        "default_receive_sms": false
      }
    ],
    "addresses": [],
    "created_at": "2025-10-01T17:48:44+00:00",
    "tax_exempt": true,
    "updated_at": "2025-10-16T19:04:13+00:00",
    "vat_number": "",
    "wallet_fund": 0,
    "quote_amount": 0,
    "resale_number": "",
    "unpaid_amount": 3289550,
    "assigned_users": [
      {
        "id": "94mKlNO62zYaOZ",
        "name": "Leah Andrade",
        "avatar_url": "https://download.yoprint.com/1207855/5f2f58c4893afd346fdff02c5555d6eb.png?s=4blXCcHSDKCGi6EzZZ0GJA&e=1761717600"
      }
    ],
    "internal_notes": "",
    "ordered_amount": 5476670,
    "overdue_amount": 3289550,
    "wallet_currency": {
      "id": "YyAgrW6Zjz98Me",
      "iso": "USD",
      "name": "United States Dollar",
      "symbol": "$",
      "default": true,
      "trashed": false
    },
    "customer_profiles": [],
    "last_ordered_date": "2025-10-01T17:48:50+00:00",
    "customer_portal_id": "dp5rq7",
    "deposit_due_amount": 551220,
    "customer_portal_link": "https://portal.hubcitydesignlbk.com/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6NDE4MzQ3LCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1OTM0OCwic3ViIjozODE2MDgsImlhdCI6MTc2MTY4MzM0OCwibmJmIjoxNzYxNjgzMzQ4LCJqdGkiOiJxbGIybFlNMWtLMjByc05TIn0.zTNSp5KqtvZynBWBn94nu6N4Jlwmi6coX1RCIwL5ReQ",
    "default_warehouse_id": null,
    "default_payment_term_id": null,
    "default_pricing_group_id": null,
    "display_customer_portal_id": "dp5rq7",
    "customer_portal_id_override": null,
    "customer_portal_payment_option": null,
    "has_customer_portal_id_override": false
  },
  "due_date": null,
  "is_draft": false,
  "is_quote": false,
  "prod_note": "<span style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-pasted=\"true\" data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">T-shirt&nbsp;</span><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Small &nbsp; &nbsp; &nbsp; &nbsp; 5</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Medium &nbsp; 15</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Large &nbsp; &nbsp; &nbsp; 55</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">XL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;55</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">2XL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;20</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Total &nbsp;150</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\"><br></div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Hoodies&nbsp;</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Small &nbsp; &nbsp; &nbsp; &nbsp; 5</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Medium &nbsp; 15</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Large &nbsp; &nbsp; &nbsp; 25&nbsp;</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">XL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;30</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">2XL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;25</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Total 100</div>",
  "scoped_id": "SO1235",
  "status_id": "pDQProk6ZJr5dn",
  "calc_total": 5476670,
  "created_at": "2025-10-01T17:48:50+00:00",
  "created_by": "94mKlNO62zYaOZ",
  "is_created": true,
  "issue_date": "2025-10-01T17:48:50+00:00",
  "start_date": null,
  "unique_key": "ord_58gbg7bfcf0502bd25f8-eb39cc08dd1f62f7-66gg81g1acedgf8a445d02",
  "updated_at": "2025-10-27T16:14:51+00:00",
  "client_note": "",
  "customer_id": "6Z9Bz52Z2ormab",
  "deposit_due": "2025-10-03T17:48:50+00:00",
  "grouped_pdf": [
    {
      "label": "Main",
      "documents": [
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/order/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "Sales Order",
          "description": "Sales Order details"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/order_compact/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "Sales Order (Compact)",
          "description": "Sales Order details optimized for printing"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_invoices/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Invoices",
          "description": "All invoices"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_compact_invoices/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Invoices (Compact)",
          "description": "All invoices optimized for printing"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_as_invoice/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "Sales Order as Invoice",
          "description": "Uses the Sales Order ID as the Invoice ID"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_as_invoice_compact/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "Sales Order as Invoice (Compact)",
          "description": "Uses the Sales Order ID as the Invoice ID. Optimized for printing"
        }
      ]
    },
    {
      "label": "Job",
      "documents": [
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_jobs/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Jobs",
          "description": "All job details without mockup"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_jobs/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Jobs (Mockups Incl.)",
          "description": "All job details including mockups"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_jobs_label/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Job Labels (4\" x 6\")",
          "description": "All Job Labels (4\" x 6\")"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_jobs_dymo_label/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Job Labels (1\" x 2-1/8\")",
          "description": "All Job Labels in  (1\" x 2-1/8\")"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_worksheet/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Jobs Worksheet",
          "description": "All Jobs Worksheet"
        }
      ]
    },
    {
      "label": "Shipment",
      "documents": [
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_shipment/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Packing Slips",
          "description": "All shipment packing slips"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_shipment_label/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Shipment Labels (Letter size)",
          "description": "All Shipment labels to be printed on Letter Size"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_shipment_label/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Shipment Labels (4\" x 6\")",
          "description": "All Shipment labels to be printed on 4\" x 6\" labels"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_shipments_dymo_label/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Shipment Labels (1\" x 2-1/8\")",
          "description": "All Shipment Labels to be printed on (1\" x 2-1/8\")"
        }
      ]
    }
  ],
  "paid_amount": 2187120,
  "warehouse_id": "1oVOzZo504rW5G",
  "calc_discount": 0,
  "calc_subtotal": 5476670,
  "cust_due_date": null,
  "deposit_total": 50000,
  "ship_due_date": null,
  "assigned_users": [],
  "auto_saved_for": null,
  "discount_total": 0,
  "approval_status": "approved",
  "full_amount_due": "2025-10-15T17:48:50+00:00",
  "payment_term_id": "X5PVrExkKzGWbB",
  "previous_status": {
    "id": "pDQProk6ZJr5dn",
    "role": "order",
    "type": "in_progress",
    "color": "#fed9a8",
    "label": "Waiting For PO Arrival",
    "trashed": false,
    "position": 4,
    "customer_label": "Products Ordered"
  },
  "customer_profile": null,
  "deposit_required": true,
  "pricing_group_id": "gO4Klq8aJvMPex",
  "pricing_strategy": "job_separately",
  "billing_address_id": null,
  "calc_deposit_total": 2738340,
  "customer_has_email": true,
  "customer_po_number": null,
  "participant_emails": [
    "palodurowildfireacademy@gmail.com",
    "jonathans4stevens@gmail.com"
  ],
  "previous_status_id": "pDQProk6ZJr5dn",
  "customer_contact_id": null,
  "customer_profile_id": null,
  "shipping_address_id": null,
  "has_pending_approval": false,
  "quickbook_disable_sync": false,
  "status_completion_date": null,
  "status_last_change_date": "2025-10-27T16:14:51+00:00",
  "has_pending_job_approval": false,
  "last_payment_request_date": null,
  "quickbook_last_error_sync": null,
  "customer_portal_order_link": "https://portal.hubcitydesignlbk.com/external-redirect/show_sales_order?order_id=06ZjrmDJOqzVRk&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6NDE4MzQ3LCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1OTM0OCwic3ViIjozODE2MDgsImlhdCI6MTc2MTY4MzM0OCwibmJmIjoxNzYxNjgzMzQ4LCJqdGkiOiI5czJQQ2tWTmlXVjRhRm9QIn0.zaculWSaB1QDJdTilodPq2mJoxjNkVWkXu8gnFGs_zc",
  "has_pending_order_approval": false,
  "quickbook_last_success_sync": "2025-10-16T19:07:21+00:00",
  "customer_portal_payment_link": "https://portal.hubcitydesignlbk.com/external-redirect/show_sales_order?order_id=06ZjrmDJOqzVRk&show_payment=true&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6NDE4MzQ3LCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1OTM0OCwic3ViIjozODE2MDgsImlhdCI6MTc2MTY4MzM0OCwibmJmIjoxNzYxNjgzMzQ4LCJqdGkiOiJoRGY2bmNoRzJoanFsRW1XIn0.kLqFmN4SqL_9xPcpaIQOK6xQ9GTCNc-QsdLuL4jfWr0",
  "has_external_integration_sync_error": false
}
```

## payment_received.any_amount

**Description:** Sample payload for `payment_received.any_amount` (from Hub City Design's repo).

```json
{
  "id": "94mKlNO1BNzYaO",
  "order": {
    "id": "nm51l68QQorR37",
    "mode": "view",
    "name": "CAMS Carhartt Hoodies",
    "tags": [],
    "type": "quote",
    "quote": true,
    "status": {
      "id": "xDQwr811yLvRyG",
      "role": "quote",
      "type": "start",
      "color": "#0bf5fe",
      "label": "Pending",
      "trashed": false,
      "position": 0,
      "customer_label": "Pending"
    },
    "is_rush": false,
    "trashed": false,
    "version": 2,
    "calc_tax": 24900,
    "customer": {
      "id": "mk6bzKb30Nl9G5",
      "name": "CAMS Renewables",
      "trashed": false,
      "website": "",
      "contacts": [
        {
          "id": "06Zjrmjb91vVRk",
          "fax": null,
          "email": "jtheriault@camsrenewables.com",
          "phone": "(806) 891-1235",
          "trashed": false,
          "last_name": "Theriault",
          "created_at": "2024-05-31T04:14:19+00:00",
          "first_name": "Jacob",
          "is_primary": true,
          "updated_at": "2024-06-10T22:46:24+00:00",
          "customer_id": "mk6bzKb30Nl9G5",
          "fax_country": null,
          "send_invoice": false,
          "phone_country": "US",
          "default_receive_sms": true
        }
      ],
      "created_at": "2024-05-31T04:14:19+00:00",
      "tax_exempt": false,
      "updated_at": "2025-09-16T04:15:56+00:00",
      "vat_number": null,
      "wallet_fund": 0,
      "quote_amount": 0,
      "resale_number": "",
      "unpaid_amount": 0,
      "internal_notes": "",
      "ordered_amount": 3717070,
      "overdue_amount": 0,
      "wallet_currency": {
        "id": "YyAgrW6Zjz98Me",
        "iso": "USD",
        "name": "United States Dollar",
        "symbol": "$",
        "default": true,
        "trashed": false
      },
      "last_ordered_date": "2025-05-07T07:51:04+00:00",
      "customer_portal_id": "9p5xq2",
      "deposit_due_amount": 0,
      "customer_portal_link": "https://portal.hubcitydesignlbk.com/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjk0MzkzLCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1ODQ3NCwic3ViIjoyNzYwMDYsImlhdCI6MTc2MTY4MjQ3NCwibmJmIjoxNzYxNjgyNDc0LCJqdGkiOiJ6MlpwTW9NbzJleG84eVJMIn0.IH2QF9L2DsXIvzfp_hJCzjRgXvI8m73wE01jY-Ozm4A",
      "default_warehouse_id": null,
      "default_payment_term_id": null,
      "default_pricing_group_id": null,
      "display_customer_portal_id": "CAMS",
      "customer_portal_id_override": "CAMS",
      "customer_portal_payment_option": null,
      "has_customer_portal_id_override": true
    },
    "due_date": null,
    "is_draft": false,
    "is_quote": true,
    "prod_note": null,
    "scoped_id": "SO1285",
    "status_id": "xDQwr811yLvRyG",
    "calc_total": 393780,
    "created_at": "2025-10-28T20:03:58+00:00",
    "created_by": "4DKZvMB42l7n2J",
    "is_created": true,
    "issue_date": "2025-10-28T20:03:58+00:00",
    "start_date": null,
    "unique_key": "ord_0c5090351f798af42821bab03b4165gc9044c-5gg1da80c84d95a0a845g9",
    "updated_at": "2025-10-28T20:14:34+00:00",
    "client_note": null,
    "customer_id": "mk6bzKb30Nl9G5",
    "deposit_due": "2025-10-30T20:04:13+00:00",
    "paid_amount": 393780,
    "warehouse_id": "1oVOzZo504rW5G",
    "calc_discount": 0,
    "calc_subtotal": 368880,
    "cust_due_date": "2025-11-05T05:59:59+00:00",
    "deposit_total": 50000,
    "ship_due_date": null,
    "assigned_users": [],
    "auto_saved_for": null,
    "discount_total": 0,
    "_legacy_hash_id": "nm51l68QQorR37",
    "approval_status": null,
    "full_amount_due": "2025-11-11T20:04:13+00:00",
    "payment_term_id": "X5PVrExkKzGWbB",
    "customer_profile": null,
    "deposit_required": true,
    "inventory_status": "not_committed",
    "pricing_group_id": "gO4Klq8aJvMPex",
    "pricing_strategy": "job_separately",
    "billing_address_id": null,
    "calc_deposit_total": 196890,
    "customer_has_email": false,
    "customer_po_number": null,
    "formatted_calc_tax": "$24.90",
    "customer_contact_id": "06Zjrmjb91vVRk",
    "customer_profile_id": null,
    "shipping_address_id": "yQ6mlp5WAMzXOo",
    "formatted_calc_total": "$393.78",
    "has_pending_approval": false,
    "formatted_paid_amount": "$393.78",
    "quickbook_disable_sync": false,
    "status_completion_date": null,
    "formatted_calc_discount": "$0.00",
    "formatted_calc_subtotal": "$368.88",
    "formatted_deposit_total": "$50.00",
    "status_last_change_date": null,
    "formatted_invoiced_total": "$393.78",
    "has_pending_job_approval": false,
    "last_payment_request_date": null,
    "quickbook_last_error_sync": null,
    "customer_portal_order_link": "https://portal.hubcitydesignlbk.com/external-redirect/show_sales_order?order_id=nm51l68QQorR37&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjk0MzkzLCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1ODQ3NCwic3ViIjoyNzYwMDYsImlhdCI6MTc2MTY4MjQ3NCwibmJmIjoxNzYxNjgyNDc0LCJqdGkiOiJUOUFLWWduZXJHS3RIeGdpIn0.qwI4tuBYAENgkKAQHhGf94Cn9JIq0vS5uuoEeyYxtWU",
    "has_pending_order_approval": false,
    "formatted_order_balance_due": "$0.00",
    "quickbook_last_success_sync": "2025-10-28T20:13:58+00:00",
    "customer_portal_payment_link": "https://portal.hubcitydesignlbk.com/external-redirect/show_sales_order?order_id=nm51l68QQorR37&show_payment=true&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjk0MzkzLCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1ODQ3NCwic3ViIjoyNzYwMDYsImlhdCI6MTc2MTY4MjQ3NCwibmJmIjoxNzYxNjgyNDc0LCJqdGkiOiJqRHBwdmV1TG9tbkNicG1EIn0.Qsf7V9wWYhiNhiYIH-Fg9s7vWMPE_EoX_SJQjDC5wMw",
    "formatted_calc_deposit_total": "$196.89",
    "formatted_deposit_amount_due": "$0.00",
    "formatted_shipment_cost_total": "$0.00",
    "formatted_invoiced_tax_subtotal": "$24.90",
    "formatted_order_item_cart_total": "$368.88",
    "has_external_integration_sync_error": false,
    "formatted_invoiced_discount_subtotal": "$0.00",
    "formatted_invoiced_shipment_subtotal": "$0.00",
    "formatted_shipment_billable_fee_total": "$0.00",
    "formatted_invoiced_order_item_subtotal": "$368.88"
  },
  "action": "SQUARE_V2",
  "amount": "$393.78",
  "created_by": null,
  "transact_at": null,
  "reference_id": "tKOymRea4UUyYwuezLWQ6gWWzlFZY",
  "payment_gateway": "SQUARE_V2",
  "payment_method_name": null,
  "reference_description": null,
  "payment_gateway_source": "CARD"
}
```

## payment_received.deposit_amount

**Description:** Sample payload for `payment_received.deposit_amount` (from Hub City Design's repo).

```json
{
  "id": "pDQProPkEjv5dn",
  "order": {
    "id": "aWO4zx5qGJrw3g",
    "mode": "view",
    "name": "Leather & Emb Patch Hats",
    "tags": [],
    "type": "quote",
    "quote": true,
    "status": {
      "id": "WQ9Mv4yy9AlBXA",
      "role": "quote",
      "type": "in_progress",
      "color": "#ffab01",
      "label": "Approval Sent EMAIL ZAP",
      "trashed": false,
      "position": 5,
      "customer_label": "Pending Approval"
    },
    "is_rush": false,
    "trashed": false,
    "version": 2,
    "calc_tax": 49670,
    "customer": {
      "id": "8nDRz2xKn9vMEV",
      "name": "LBK Roofing",
      "trashed": false,
      "website": "",
      "contacts": [
        {
          "id": "N4Lpz0w11ql3R0",
          "fax": "",
          "email": "skylar@lbkroofing.com",
          "phone": "8062817110",
          "trashed": false,
          "last_name": "",
          "created_at": "2024-05-04T02:46:22+00:00",
          "first_name": "Skylar",
          "is_primary": true,
          "updated_at": "2024-05-26T05:15:27+00:00",
          "customer_id": "8nDRz2xKn9vMEV",
          "fax_country": "",
          "send_invoice": false,
          "phone_country": "us",
          "default_receive_sms": true
        },
        {
          "id": "xwaArd70EVzBGK",
          "fax": "",
          "email": "melody@lbkroofing.com",
          "phone": "+1 806-773-4440",
          "trashed": false,
          "last_name": "",
          "created_at": "2024-05-26T05:15:20+00:00",
          "first_name": "Melody",
          "is_primary": false,
          "updated_at": "2024-05-26T05:16:24+00:00",
          "customer_id": "8nDRz2xKn9vMEV",
          "fax_country": "",
          "send_invoice": false,
          "phone_country": "US",
          "default_receive_sms": false
        },
        {
          "id": "pDQProkJEJr5dn",
          "fax": "",
          "email": "michelle@lbkroofing.com",
          "phone": "",
          "trashed": false,
          "last_name": "Weise",
          "created_at": "2024-05-26T05:15:55+00:00",
          "first_name": "Michelle",
          "is_primary": false,
          "updated_at": "2025-09-10T06:39:33+00:00",
          "customer_id": "8nDRz2xKn9vMEV",
          "fax_country": "",
          "send_invoice": false,
          "phone_country": "",
          "default_receive_sms": false
        },
        {
          "id": "LwYOzn9LyOlGPb",
          "fax": null,
          "email": "dillon@hubcitydesignlbk.com",
          "phone": "+1 806-412-4899",
          "trashed": true,
          "last_name": "White",
          "created_at": "2024-08-15T16:01:59+00:00",
          "first_name": "Dillon",
          "is_primary": false,
          "updated_at": "2024-08-15T16:05:02+00:00",
          "customer_id": "8nDRz2xKn9vMEV",
          "fax_country": null,
          "send_invoice": false,
          "phone_country": "US",
          "default_receive_sms": false
        },
        {
          "id": "LwYOznKa6drGPb",
          "fax": "",
          "email": "todd@lbkroofing.com",
          "phone": "+1 806-620-6698",
          "trashed": false,
          "last_name": "",
          "created_at": "2025-07-29T08:57:36+00:00",
          "first_name": "Todd",
          "is_primary": false,
          "updated_at": "2025-07-29T08:57:36+00:00",
          "customer_id": "8nDRz2xKn9vMEV",
          "fax_country": "",
          "send_invoice": false,
          "phone_country": "US",
          "default_receive_sms": true
        }
      ],
      "created_at": "2024-05-04T02:46:22+00:00",
      "tax_exempt": false,
      "updated_at": "2025-09-16T04:46:32+00:00",
      "vat_number": "",
      "wallet_fund": 0,
      "quote_amount": 0,
      "resale_number": "",
      "unpaid_amount": 0,
      "internal_notes": "",
      "ordered_amount": 5665790,
      "overdue_amount": 0,
      "wallet_currency": {
        "id": "YyAgrW6Zjz98Me",
        "iso": "USD",
        "name": "United States Dollar",
        "symbol": "$",
        "default": true,
        "trashed": false
      },
      "last_ordered_date": "2025-07-29T08:30:36+00:00",
      "customer_portal_id": "9n8658",
      "deposit_due_amount": 0,
      "customer_portal_link": "https://portal.hubcitydesignlbk.com/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjg5MjQxLCJ0aWQiOjMyMzIsImV4cCI6MTc5MTAzNzQ3NSwic3ViIjoyNzE3OTUsImlhdCI6MTc2MTY2MTQ3NSwibmJmIjoxNzYxNjYxNDc1LCJqdGkiOiJpNWVCUUNieTJvMG5uSUVjIn0.Bc3vj1loW2aHs3xdXRUPDRJ5wfqZRA_UIOKfU-aaznI",
      "default_warehouse_id": null,
      "default_payment_term_id": null,
      "default_pricing_group_id": null,
      "display_customer_portal_id": "LBKROOFING",
      "customer_portal_id_override": "LBKROOFING",
      "customer_portal_payment_option": null,
      "has_customer_portal_id_override": true
    },
    "due_date": null,
    "is_draft": false,
    "is_quote": true,
    "prod_note": "256 Harvest - LBK Oval Leather Reverse Engraved<br>939- LBK TX Leather Reverse engraved<br>258- Emb Patch in house from previous inventory",
    "scoped_id": "SO1276",
    "status_id": "WQ9Mv4yy9AlBXA",
    "calc_total": 785540,
    "created_at": "2025-10-24T23:35:54+00:00",
    "created_by": "4DKZvMB42l7n2J",
    "is_created": true,
    "issue_date": "2025-10-28T05:00:00+00:00",
    "start_date": null,
    "unique_key": "ord_ce9dccd5-b952gb6-f9edg-97d-a85611bd121ge-g9cfc313b4g8-31745a",
    "updated_at": "2025-10-28T14:24:35+00:00",
    "client_note": "Mockups delivered upon quote approval.<br><br>256 Harvest - LBK Oval Leather Reverse Engraved<br data-pasted=\"true\">939- LBK TX Leather Reverse engraved<br>258- Emb Patch in house from previous inventory",
    "customer_id": "8nDRz2xKn9vMEV",
    "deposit_due": "2025-10-30T05:00:07+00:00",
    "paid_amount": 392770,
    "warehouse_id": "1oVOzZo504rW5G",
    "calc_discount": 0,
    "calc_subtotal": 735870,
    "cust_due_date": null,
    "deposit_total": 50000,
    "ship_due_date": null,
    "assigned_users": [],
    "auto_saved_for": null,
    "discount_total": 0,
    "_legacy_hash_id": "aWO4zx5qGJrw3g",
    "approval_status": "approved",
    "full_amount_due": "2025-11-11T05:00:07+00:00",
    "payment_term_id": "X5PVrExkKzGWbB",
    "customer_profile": null,
    "deposit_required": true,
    "inventory_status": "not_committed",
    "pricing_group_id": "DkNwvVGp7ld3oX",
    "pricing_strategy": "job_separately",
    "billing_address_id": null,
    "calc_deposit_total": 392770,
    "customer_has_email": false,
    "customer_po_number": null,
    "formatted_calc_tax": "$49.67",
    "customer_contact_id": "N4Lpz0w11ql3R0",
    "customer_profile_id": null,
    "shipping_address_id": null,
    "formatted_calc_total": "$785.54",
    "has_pending_approval": false,
    "formatted_paid_amount": "$392.77",
    "quickbook_disable_sync": false,
    "status_completion_date": null,
    "formatted_calc_discount": "$0.00",
    "formatted_calc_subtotal": "$735.87",
    "formatted_deposit_total": "$50.00",
    "status_last_change_date": "2025-10-28T08:46:11+00:00",
    "formatted_invoiced_total": "$785.54",
    "has_pending_job_approval": false,
    "last_payment_request_date": null,
    "quickbook_last_error_sync": null,
    "customer_portal_order_link": "https://portal.hubcitydesignlbk.com/external-redirect/show_sales_order?order_id=aWO4zx5qGJrw3g&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjg5MjQxLCJ0aWQiOjMyMzIsImV4cCI6MTc5MTAzNzQ3NSwic3ViIjoyNzE3OTUsImlhdCI6MTc2MTY2MTQ3NSwibmJmIjoxNzYxNjYxNDc1LCJqdGkiOiJXQU5salNRbmdYZENXU2oyIn0.oHmNZtgWZi5N6X-3BZpf7SqED74zw-k9H8qRHW3Tmfo",
    "has_pending_order_approval": false,
    "formatted_order_balance_due": "$392.77",
    "quickbook_last_success_sync": "2025-10-28T08:48:13+00:00",
    "customer_portal_payment_link": "https://portal.hubcitydesignlbk.com/external-redirect/show_sales_order?order_id=aWO4zx5qGJrw3g&show_payment=true&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjg5MjQxLCJ0aWQiOjMyMzIsImV4cCI6MTc5MTAzNzQ3NSwic3ViIjoyNzE3OTUsImlhdCI6MTc2MTY2MTQ3NSwibmJmIjoxNzYxNjYxNDc1LCJqdGkiOiJjYVBsYVJ6TVdha04xcEhJIn0.tGEZk-3R6hpI7RTx8RS9cRma7eu8hHEKNm52twelvks",
    "formatted_calc_deposit_total": "$392.77",
    "formatted_deposit_amount_due": "$392.77",
    "formatted_shipment_cost_total": "$0.00",
    "formatted_invoiced_tax_subtotal": "$49.67",
    "formatted_order_item_cart_total": "$735.87",
    "has_external_integration_sync_error": false,
    "formatted_invoiced_discount_subtotal": "$0.00",
    "formatted_invoiced_shipment_subtotal": "$0.00",
    "formatted_shipment_billable_fee_total": "$0.00",
    "formatted_invoiced_order_item_subtotal": "$735.87"
  },
  "action": "SQUARE_V2",
  "amount": "$392.77",
  "created_by": null,
  "transact_at": null,
  "reference_id": "J2dWwFV1ViFKrmiCQKINdoWK3vAZY",
  "payment_gateway": "SQUARE_V2",
  "payment_method_name": null,
  "reference_description": null,
  "payment_gateway_source": "CARD"
}
```

## payment_received.full_amount

**Description:** Sample payload for `payment_received.full_amount` (from Hub City Design's repo).

```json
{
  "id": "94mKlNO1BNzYaO",
  "order": {
    "id": "nm51l68QQorR37",
    "mode": "view",
    "name": "CAMS Carhartt Hoodies",
    "tags": [],
    "type": "quote",
    "quote": true,
    "status": {
      "id": "xDQwr811yLvRyG",
      "role": "quote",
      "type": "start",
      "color": "#0bf5fe",
      "label": "Pending",
      "trashed": false,
      "position": 0,
      "customer_label": "Pending"
    },
    "is_rush": false,
    "trashed": false,
    "version": 2,
    "calc_tax": 24900,
    "customer": {
      "id": "mk6bzKb30Nl9G5",
      "name": "CAMS Renewables",
      "trashed": false,
      "website": "",
      "contacts": [
        {
          "id": "06Zjrmjb91vVRk",
          "fax": null,
          "email": "jtheriault@camsrenewables.com",
          "phone": "(806) 891-1235",
          "trashed": false,
          "last_name": "Theriault",
          "created_at": "2024-05-31T04:14:19+00:00",
          "first_name": "Jacob",
          "is_primary": true,
          "updated_at": "2024-06-10T22:46:24+00:00",
          "customer_id": "mk6bzKb30Nl9G5",
          "fax_country": null,
          "send_invoice": false,
          "phone_country": "US",
          "default_receive_sms": true
        }
      ],
      "created_at": "2024-05-31T04:14:19+00:00",
      "tax_exempt": false,
      "updated_at": "2025-09-16T04:15:56+00:00",
      "vat_number": null,
      "wallet_fund": 0,
      "quote_amount": 0,
      "resale_number": "",
      "unpaid_amount": 0,
      "internal_notes": "",
      "ordered_amount": 3717070,
      "overdue_amount": 0,
      "wallet_currency": {
        "id": "YyAgrW6Zjz98Me",
        "iso": "USD",
        "name": "United States Dollar",
        "symbol": "$",
        "default": true,
        "trashed": false
      },
      "last_ordered_date": "2025-05-07T07:51:04+00:00",
      "customer_portal_id": "9p5xq2",
      "deposit_due_amount": 0,
      "customer_portal_link": "https://portal.hubcitydesignlbk.com/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjk0MzkzLCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1ODQ3NCwic3ViIjoyNzYwMDYsImlhdCI6MTc2MTY4MjQ3NCwibmJmIjoxNzYxNjgyNDc0LCJqdGkiOiJHZGNkZlY2ZFRtSTM3bnpuIn0.zbow3O4taKEWPGRrYEeZmh1y1Gny2fegrW9YV1Qp0i0",
      "default_warehouse_id": null,
      "default_payment_term_id": null,
      "default_pricing_group_id": null,
      "display_customer_portal_id": "CAMS",
      "customer_portal_id_override": "CAMS",
      "customer_portal_payment_option": null,
      "has_customer_portal_id_override": true
    },
    "due_date": null,
    "is_draft": false,
    "is_quote": true,
    "prod_note": null,
    "scoped_id": "SO1285",
    "status_id": "xDQwr811yLvRyG",
    "calc_total": 393780,
    "created_at": "2025-10-28T20:03:58+00:00",
    "created_by": "4DKZvMB42l7n2J",
    "is_created": true,
    "issue_date": "2025-10-28T20:03:58+00:00",
    "start_date": null,
    "unique_key": "ord_0c5090351f798af42821bab03b4165gc9044c-5gg1da80c84d95a0a845g9",
    "updated_at": "2025-10-28T20:14:34+00:00",
    "client_note": null,
    "customer_id": "mk6bzKb30Nl9G5",
    "deposit_due": "2025-10-30T20:04:13+00:00",
    "paid_amount": 393780,
    "warehouse_id": "1oVOzZo504rW5G",
    "calc_discount": 0,
    "calc_subtotal": 368880,
    "cust_due_date": "2025-11-05T05:59:59+00:00",
    "deposit_total": 50000,
    "ship_due_date": null,
    "assigned_users": [],
    "auto_saved_for": null,
    "discount_total": 0,
    "_legacy_hash_id": "nm51l68QQorR37",
    "approval_status": null,
    "full_amount_due": "2025-11-11T20:04:13+00:00",
    "payment_term_id": "X5PVrExkKzGWbB",
    "customer_profile": null,
    "deposit_required": true,
    "inventory_status": "not_committed",
    "pricing_group_id": "gO4Klq8aJvMPex",
    "pricing_strategy": "job_separately",
    "billing_address_id": null,
    "calc_deposit_total": 196890,
    "customer_has_email": false,
    "customer_po_number": null,
    "formatted_calc_tax": "$24.90",
    "customer_contact_id": "06Zjrmjb91vVRk",
    "customer_profile_id": null,
    "shipping_address_id": "yQ6mlp5WAMzXOo",
    "formatted_calc_total": "$393.78",
    "has_pending_approval": false,
    "formatted_paid_amount": "$393.78",
    "quickbook_disable_sync": false,
    "status_completion_date": null,
    "formatted_calc_discount": "$0.00",
    "formatted_calc_subtotal": "$368.88",
    "formatted_deposit_total": "$50.00",
    "status_last_change_date": null,
    "formatted_invoiced_total": "$393.78",
    "has_pending_job_approval": false,
    "last_payment_request_date": null,
    "quickbook_last_error_sync": null,
    "customer_portal_order_link": "https://portal.hubcitydesignlbk.com/external-redirect/show_sales_order?order_id=nm51l68QQorR37&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjk0MzkzLCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1ODQ3NCwic3ViIjoyNzYwMDYsImlhdCI6MTc2MTY4MjQ3NCwibmJmIjoxNzYxNjgyNDc0LCJqdGkiOiJaRE1XSTZxd3o5NnNKMVZvIn0.9t_kTRRBqg-8Z3s_3_QsXhUkIugaSV9E_OrZ_9G3N6g",
    "has_pending_order_approval": false,
    "formatted_order_balance_due": "$0.00",
    "quickbook_last_success_sync": "2025-10-28T20:13:58+00:00",
    "customer_portal_payment_link": "https://portal.hubcitydesignlbk.com/external-redirect/show_sales_order?order_id=nm51l68QQorR37&show_payment=true&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjk0MzkzLCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1ODQ3NCwic3ViIjoyNzYwMDYsImlhdCI6MTc2MTY4MjQ3NCwibmJmIjoxNzYxNjgyNDc0LCJqdGkiOiJNT3JlTzZibVFtR3Z2b0lXIn0.ocEJzAsKJs-QTq0-Maif7torudUpkLCmGw3gwZ6yvIo",
    "formatted_calc_deposit_total": "$196.89",
    "formatted_deposit_amount_due": "$0.00",
    "formatted_shipment_cost_total": "$0.00",
    "formatted_invoiced_tax_subtotal": "$24.90",
    "formatted_order_item_cart_total": "$368.88",
    "has_external_integration_sync_error": false,
    "formatted_invoiced_discount_subtotal": "$0.00",
    "formatted_invoiced_shipment_subtotal": "$0.00",
    "formatted_shipment_billable_fee_total": "$0.00",
    "formatted_invoiced_order_item_subtotal": "$368.88"
  },
  "action": "SQUARE_V2",
  "amount": "$393.78",
  "created_by": null,
  "transact_at": null,
  "reference_id": "tKOymRea4UUyYwuezLWQ6gWWzlFZY",
  "payment_gateway": "SQUARE_V2",
  "payment_method_name": null,
  "reference_description": null,
  "payment_gateway_source": "CARD"
}
```

## purchase_order.status_changed

**Description:** Sample payload for `purchase_order.status_changed` (from Hub City Design's repo).

```json
{
  "id": "OaoDvOp1pgl8wA",
  "pdf": [
    {
      "url": "https://secure.yoprint.com/api/document/purchase_order/2WvVMxJGRnUwrx/hub-city-design-inc/OaoDvOp1pgl8wA",
      "label": "Purchase Order Detail",
      "description": "Purchase Order Detail"
    },
    {
      "url": "https://secure.yoprint.com/api/document/purchase_order_label/2WvVMxJGRnUwrx/hub-city-design-inc/OaoDvOp1pgl8wA",
      "label": "Purchase Order Label (4\" x 6\")",
      "description": "Purchase Order Label"
    }
  ],
  "name": "PDWFA & RH Replacements ",
  "tags": [],
  "items": [
    {
      "id": "06ZjrmVA0ZvVRk",
      "tax": {
        "type": "custom",
        "total": 0,
        "is_override": null
      },
      "price": 9800,
      "product": {
        "id": "smr-707434",
        "type": "db_catalog"
      },
      "_hydrate": {
        "product": {
          "id": "smr-707434",
          "type": "variant_catalog",
          "brand": "Gildan",
          "dscnt": false,
          "title": "Heavy Blend \u2122 Hooded Sweatshirt. 18500",
          "weight": 12700,
          "size_id": "L",
          "trashed": false,
          "color_id": "MILITARY GREEN",
          "style_id": "smr-18500",
          "available": true,
          "color_hex": null,
          "size_label": "L",
          "style_name": "18500",
          "color_image": "https://marketing.sanmar.com/cache/swatchgifs/Gildan_MilitaryGreen.gif",
          "color_label": "Military Green",
          "product_type": "SanMar",
          "variant_type": "size_color",
          "display_dscnt": false
        },
        "product_display": {
          "size": "L",
          "color": "Military Green",
          "title": "Gildan - Heavy Blend \u2122 Hooded Sweatshirt. 18500",
          "display_title": "Gildan - Heavy Blend \u2122 Hooded Sweatshirt. 18500 - Military Green - L"
        }
      },
      "calc_tax": 0,
      "position": 0,
      "quantity": 1,
      "tax_total": 0,
      "calc_total": 9800,
      "calc_subtotal": 9800
    },
    {
      "id": "mk6bzKX9mmr9G5",
      "tax": {
        "type": "custom",
        "total": 0,
        "is_override": null
      },
      "price": 2190,
      "product": {
        "id": "smr-3000691",
        "type": "db_catalog"
      },
      "_hydrate": {
        "product": {
          "id": "smr-3000691",
          "type": "variant_catalog",
          "brand": "Gildan",
          "dscnt": false,
          "title": "Light Cotton Tee 3000",
          "weight": 4000,
          "size_id": "XL",
          "trashed": false,
          "color_id": "HEATHER DARK GREY",
          "style_id": "smr-3000",
          "available": true,
          "color_hex": null,
          "size_label": "XL",
          "style_name": "3000",
          "color_image": "https://marketing.sanmar.com/cache/swatchgifs/3000_HeatherDarkGrey_06202025.gif",
          "color_label": "Heather Dark Grey",
          "product_type": "SanMar",
          "variant_type": "size_color",
          "display_dscnt": false
        },
        "product_display": {
          "size": "XL",
          "color": "Heather Dark Grey",
          "title": "Gildan - Light Cotton Tee 3000",
          "display_title": "Gildan - Light Cotton Tee 3000 - Heather Dark Grey - XL"
        }
      },
      "calc_tax": 0,
      "position": 1,
      "quantity": 1,
      "tax_total": 0,
      "calc_total": 2190,
      "calc_subtotal": 2190
    },
    {
      "id": "8nDRz2K0EVrMEV",
      "tax": {
        "type": "custom",
        "total": 0,
        "is_override": null
      },
      "price": 11890,
      "product": {
        "id": "X5PVrE60pkvGWb",
        "type": "db_variant"
      },
      "_hydrate": {
        "product": {
          "id": "X5PVrE60pkvGWb",
          "type": "variant",
          "brand": "Sport Tek",
          "price": 28180,
          "title": "RH ST650 Men's Polo",
          "weight": null,
          "size_id": "XL",
          "trashed": false,
          "color_id": "Black",
          "style_id": "aO0ZvaNxdklnMK",
          "available": true,
          "color_hex": "#080808",
          "size_label": "XL",
          "color_image": "",
          "color_label": "Black",
          "description": "Ron Hoover embroidered logo on left chest, Top 50 logo right sleeve",
          "supplier_id": "ST650",
          "product_type": "variant",
          "variant_type": "size_color"
        },
        "product_display": {
          "size": "XL",
          "color": "Black",
          "title": "Sport Tek - RH ST650 Men's Polo",
          "display_title": "Sport Tek - RH ST650 Men's Polo - Black - XL"
        }
      },
      "calc_tax": 0,
      "position": 2,
      "quantity": 1,
      "tax_total": 0,
      "calc_total": 11890,
      "calc_subtotal": 11890
    }
  ],
  "status": {
    "id": "xwaArdNNQ9lBGK",
    "role": "purchase_order",
    "type": "in_progress",
    "color": "#760cc7",
    "label": "Awaiting Fulfillment",
    "trashed": false,
    "position": 7,
    "customer_label": "Products Pending Arrival"
  },
  "vendor": {
    "id": "mV4XzgVxDlqKdZ",
    "name": "SanMar",
    "trashed": false,
    "website": "",
    "contacts": [],
    "account_number": "",
    "internal_notes": "NET TERMS",
    "default_vendor_note": ""
  },
  "creator": {
    "id": "4DKZvMB42l7n2J",
    "sso": false,
    "name": "Dillon White",
    "email": "dillon@hubcitydesignlbk.com",
    "ga_id": "u5386",
    "hs_id": 5386,
    "timezone": "America/Chicago",
    "onboarded": true,
    "avatar_url": "https://download.yoprint.com/1230206/7.png?s=XLQwvFJqWm7RcLBMNlGbSg&e=1761717600",
    "last_trial": null,
    "preference": null,
    "trial_used": false,
    "has_affiliate_account": false
  },
  "pdf_url": "https://secure.yoprint.com/api/document/purchase_order/2WvVMxJGRnUwrx/hub-city-design-inc/OaoDvOp1pgl8wA",
  "trashed": false,
  "calc_tax": 0,
  "due_date": "2025-10-29T20:22:11+00:00",
  "scoped_id": "PO1047",
  "status_id": "xwaArdNNQ9lBGK",
  "vendor_id": "mV4XzgVxDlqKdZ",
  "warehouse": {
    "id": "1oVOzZo504rW5G",
    "city": "Lubbock",
    "note": "",
    "role": "store_location",
    "label": "HUB CITY DESIGN Inc.",
    "nexus": true,
    "state": "Texas",
    "country": "United States",
    "trashed": false,
    "address1": "12213 University Avenue",
    "address2": "10",
    "postcode": "79423",
    "hold_stock": true,
    "is_primary": true,
    "state_code": "TX",
    "country_code": "US",
    "postal_is_valid": false,
    "postal_validated": false,
    "postal_can_validate": true,
    "is_default_warehouse": true
  },
  "calc_total": 23880,
  "channel_id": "PO-93000",
  "created_at": "2025-10-28T20:26:18+00:00",
  "created_by": "4DKZvMB42l7n2J",
  "issue_date": "2025-10-28T20:22:11+00:00",
  "updated_at": "2025-10-28T20:28:53+00:00",
  "vendor_note": "",
  "warehouse_id": "1oVOzZo504rW5G",
  "calc_subtotal": 23880,
  "internal_note": "",
  "related_order": [
    {
      "id": "06ZjrmDJOqzVRk",
      "mode": "view",
      "name": "PDWA PVC Hats-Printed Apparel",
      "tags": [],
      "type": "order",
      "quote": false,
      "status": {
        "id": "pDQProk6ZJr5dn",
        "role": "order",
        "type": "in_progress",
        "color": "#fed9a8",
        "label": "Waiting For PO Arrival",
        "trashed": false,
        "position": 4,
        "customer_label": "Products Ordered"
      },
      "is_rush": false,
      "trashed": false,
      "version": 2,
      "calc_tax": 0,
      "customer": {
        "id": "6Z9Bz52Z2ormab",
        "name": "Palo Duro Wildfire Academy",
        "trashed": false,
        "website": "",
        "contacts": [
          {
            "id": "KG1dvw4e7aleP3",
            "fax": "",
            "email": "jonathans4stevens@gmail.com",
            "phone": "+1 806-433-7730",
            "trashed": false,
            "last_name": "Stevens",
            "created_at": "2025-10-01T17:48:44+00:00",
            "first_name": "Jonathan ",
            "is_primary": false,
            "updated_at": "2025-10-15T15:17:23+00:00",
            "customer_id": "6Z9Bz52Z2ormab",
            "fax_country": "",
            "send_invoice": false,
            "phone_country": "US",
            "default_receive_sms": true
          },
          {
            "id": "LwYOznK59drGPb",
            "fax": "",
            "email": "palodurowildfireacademy@gmail.com",
            "phone": "",
            "trashed": false,
            "last_name": "",
            "created_at": "2025-10-01T18:00:49+00:00",
            "first_name": "Palo Duro Wildlife Academy",
            "is_primary": true,
            "updated_at": "2025-10-02T03:03:01+00:00",
            "customer_id": "6Z9Bz52Z2ormab",
            "fax_country": "",
            "send_invoice": false,
            "phone_country": "",
            "default_receive_sms": false
          }
        ],
        "created_at": "2025-10-01T17:48:44+00:00",
        "tax_exempt": true,
        "updated_at": "2025-10-16T19:04:13+00:00",
        "vat_number": "",
        "wallet_fund": 0,
        "quote_amount": 0,
        "resale_number": "",
        "unpaid_amount": 3289550,
        "internal_notes": "",
        "ordered_amount": 5476670,
        "overdue_amount": 3289550,
        "wallet_currency": {
          "id": "YyAgrW6Zjz98Me",
          "iso": "USD",
          "name": "United States Dollar",
          "symbol": "$",
          "default": true,
          "trashed": false
        },
        "last_ordered_date": "2025-10-01T17:48:50+00:00",
        "customer_portal_id": "dp5rq7",
        "deposit_due_amount": 551220,
        "customer_portal_link": "https://portal.hubcitydesignlbk.com/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6NDE4MzQ3LCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1OTMzMywic3ViIjozODE2MDgsImlhdCI6MTc2MTY4MzMzMywibmJmIjoxNzYxNjgzMzMzLCJqdGkiOiJzVDV5SU9sckpDdmRCYU1IIn0.GlHU4sQ7Le309cvhXujuXnxlD1crvNdQ6gJDWWguh5k",
        "default_warehouse_id": null,
        "default_payment_term_id": null,
        "default_pricing_group_id": null,
        "display_customer_portal_id": "dp5rq7",
        "customer_portal_id_override": null,
        "customer_portal_payment_option": null,
        "has_customer_portal_id_override": false
      },
      "due_date": null,
      "is_draft": false,
      "is_quote": false,
      "prod_note": "<span style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-pasted=\"true\" data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">T-shirt&nbsp;</span><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Small &nbsp; &nbsp; &nbsp; &nbsp; 5</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Medium &nbsp; 15</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Large &nbsp; &nbsp; &nbsp; 55</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">XL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;55</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">2XL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;20</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Total &nbsp;150</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\"><br></div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Hoodies&nbsp;</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Small &nbsp; &nbsp; &nbsp; &nbsp; 5</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Medium &nbsp; 15</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Large &nbsp; &nbsp; &nbsp; 25&nbsp;</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">XL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;30</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">2XL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;25</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Total 100</div>",
      "scoped_id": "SO1235",
      "status_id": "pDQProk6ZJr5dn",
      "calc_total": 5476670,
      "created_at": "2025-10-01T17:48:50+00:00",
      "created_by": "94mKlNO62zYaOZ",
      "is_created": true,
      "issue_date": "2025-10-01T17:48:50+00:00",
      "start_date": null,
      "unique_key": "ord_58gbg7bfcf0502bd25f8-eb39cc08dd1f62f7-66gg81g1acedgf8a445d02",
      "updated_at": "2025-10-27T16:14:51+00:00",
      "client_note": "",
      "customer_id": "6Z9Bz52Z2ormab",
      "deposit_due": "2025-10-03T17:48:50+00:00",
      "paid_amount": 2187120,
      "warehouse_id": "1oVOzZo504rW5G",
      "calc_discount": 0,
      "calc_subtotal": 5476670,
      "cust_due_date": null,
      "deposit_total": 50000,
      "ship_due_date": null,
      "assigned_users": [],
      "auto_saved_for": null,
      "discount_total": 0,
      "_legacy_hash_id": "06ZjrmDJOqzVRk",
      "approval_status": "approved",
      "full_amount_due": "2025-10-15T17:48:50+00:00",
      "payment_term_id": "X5PVrExkKzGWbB",
      "customer_profile": null,
      "deposit_required": true,
      "inventory_status": "committed",
      "pricing_group_id": "gO4Klq8aJvMPex",
      "pricing_strategy": "job_separately",
      "billing_address_id": null,
      "calc_deposit_total": 2738340,
      "customer_has_email": false,
      "customer_po_number": null,
      "formatted_calc_tax": "$0.00",
      "customer_contact_id": null,
      "customer_profile_id": null,
      "shipping_address_id": null,
      "formatted_calc_total": "$5476.67",
      "has_pending_approval": false,
      "formatted_paid_amount": "$2187.12",
      "quickbook_disable_sync": false,
      "status_completion_date": null,
      "formatted_calc_discount": "$0.00",
      "formatted_calc_subtotal": "$5476.67",
      "formatted_deposit_total": "$50.00",
      "status_last_change_date": "2025-10-27T16:14:51+00:00",
      "formatted_invoiced_total": "$5476.67",
      "has_pending_job_approval": false,
      "last_payment_request_date": null,
      "quickbook_last_error_sync": null,
      "customer_portal_order_link": "https://portal.hubcitydesignlbk.com/external-redirect/show_sales_order?order_id=06ZjrmDJOqzVRk&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6NDE4MzQ3LCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1OTMzMywic3ViIjozODE2MDgsImlhdCI6MTc2MTY4MzMzMywibmJmIjoxNzYxNjgzMzMzLCJqdGkiOiJPam02TWgzc3lVdUpwdWh0In0.6GfOswQqt4N5asoJYezbqHBEDVY20sUBoFYaiRf2kIc",
      "has_pending_order_approval": false,
      "formatted_order_balance_due": "$3289.55",
      "quickbook_last_success_sync": "2025-10-16T19:07:21+00:00",
      "customer_portal_payment_link": "https://portal.hubcitydesignlbk.com/external-redirect/show_sales_order?order_id=06ZjrmDJOqzVRk&show_payment=true&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6NDE4MzQ3LCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1OTMzMywic3ViIjozODE2MDgsImlhdCI6MTc2MTY4MzMzMywibmJmIjoxNzYxNjgzMzMzLCJqdGkiOiJWTmFKOXJkRjZQRVNnUUJuIn0.H7bCB8yQVtgyDiUg-JFL_CVHRs0OkOy1bjZsFfieKcw",
      "formatted_calc_deposit_total": "$2738.34",
      "formatted_deposit_amount_due": "$3289.55",
      "formatted_shipment_cost_total": "$0.00",
      "formatted_invoiced_tax_subtotal": "$0.00",
      "formatted_order_item_cart_total": "$5476.67",
      "has_external_integration_sync_error": false,
      "formatted_invoiced_discount_subtotal": "$0.00",
      "formatted_invoiced_shipment_subtotal": "$0.00",
      "formatted_shipment_billable_fee_total": "$0.00",
      "formatted_invoiced_order_item_subtotal": "$5476.67"
    }
  ],
  "doc_viewer_url": "https://secure.yoprint.com/api/document_viewer/purchase_order/2WvVMxJGRnUwrx/hub-city-design-inc/OaoDvOp1pgl8wA",
  "billing_address": {
    "id": "1oVOzZo504rW5G",
    "city": "Lubbock",
    "note": "",
    "role": "store_location",
    "label": "HUB CITY DESIGN Inc.",
    "nexus": true,
    "state": "Texas",
    "country": "United States",
    "trashed": false,
    "address1": "12213 University Avenue",
    "address2": "10",
    "postcode": "79423",
    "hold_stock": true,
    "is_primary": true,
    "state_code": "TX",
    "country_code": "US",
    "postal_is_valid": false,
    "postal_validated": false,
    "postal_can_validate": true,
    "is_default_warehouse": true
  },
  "previous_status": {
    "id": "q2nVrG66x4zagp",
    "role": "purchase_order",
    "type": "start",
    "color": "#05a8a8",
    "label": "Pending Final Approval",
    "trashed": false,
    "position": 0,
    "customer_label": "PO Created"
  },
  "billing_address_id": "1oVOzZo504rW5G",
  "previous_status_id": "q2nVrG66x4zagp",
  "is_custom_warehouse": false,
  "quickbook_disable_sync": false,
  "status_completion_date": null,
  "status_last_change_date": "2025-10-28T20:28:53+00:00",
  "quickbook_last_error_sync": null,
  "quickbook_last_success_sync": null
}
```

## quote.converted_to_sales_order

**Description:** Sample payload for `quote.converted_to_sales_order` (from Hub City Design's repo).

```json
{
  "id": "nm51l68QQorR37",
  "mode": "view",
  "name": "CAMS Carhartt Hoodies",
  "tags": [],
  "type": "order",
  "quote": false,
  "status": {
    "id": "4L9MzLeeqMrXQP",
    "role": "order",
    "type": "start",
    "color": "#fba700",
    "label": "P/O Not Created or Submitted",
    "trashed": false,
    "position": 1,
    "customer_label": "Products Ordered"
  },
  "is_rush": false,
  "trashed": false,
  "version": 2,
  "calc_tax": 24900,
  "customer": {
    "id": "mk6bzKb30Nl9G5",
    "name": "CAMS Renewables",
    "trashed": false,
    "website": "",
    "contacts": [
      {
        "id": "06Zjrmjb91vVRk",
        "fax": null,
        "email": "jtheriault@camsrenewables.com",
        "phone": "(806) 891-1235",
        "trashed": false,
        "last_name": "Theriault",
        "created_at": "2024-05-31T04:14:19+00:00",
        "first_name": "Jacob",
        "is_primary": true,
        "updated_at": "2024-06-10T22:46:24+00:00",
        "customer_id": "mk6bzKb30Nl9G5",
        "fax_country": null,
        "send_invoice": false,
        "phone_country": "US",
        "default_receive_sms": true
      }
    ],
    "created_at": "2024-05-31T04:14:19+00:00",
    "tax_exempt": false,
    "updated_at": "2025-09-16T04:15:56+00:00",
    "vat_number": null,
    "wallet_fund": 0,
    "quote_amount": 0,
    "resale_number": "",
    "unpaid_amount": 0,
    "internal_notes": "",
    "ordered_amount": 3717070,
    "overdue_amount": 0,
    "wallet_currency": {
      "id": "YyAgrW6Zjz98Me",
      "iso": "USD",
      "name": "United States Dollar",
      "symbol": "$",
      "default": true,
      "trashed": false
    },
    "last_ordered_date": "2025-05-07T07:51:04+00:00",
    "customer_portal_id": "9p5xq2",
    "deposit_due_amount": 0,
    "customer_portal_link": "https://portal.hubcitydesignlbk.com/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjk0MzkzLCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1ODQ5MSwic3ViIjoyNzYwMDYsImlhdCI6MTc2MTY4MjQ5MSwibmJmIjoxNzYxNjgyNDkxLCJqdGkiOiJ3M1pkV0czRFo5RWNvWDdNIn0.b-eUnaw5nR4Hs6f6kPlVsdDZnyF2zoou-oYq9sAhr0c",
    "default_warehouse_id": null,
    "default_payment_term_id": null,
    "default_pricing_group_id": null,
    "display_customer_portal_id": "CAMS",
    "customer_portal_id_override": "CAMS",
    "customer_portal_payment_option": null,
    "has_customer_portal_id_override": true
  },
  "due_date": null,
  "is_draft": false,
  "is_quote": false,
  "prod_note": null,
  "scoped_id": "SO1285",
  "status_id": "4L9MzLeeqMrXQP",
  "calc_total": 393780,
  "created_at": "2025-10-28T20:03:58+00:00",
  "created_by": "4DKZvMB42l7n2J",
  "is_created": true,
  "issue_date": "2025-10-28T20:03:58+00:00",
  "start_date": null,
  "unique_key": "ord_0c5090351f798af42821bab03b4165gc9044c-5gg1da80c84d95a0a845g9",
  "updated_at": "2025-10-28T20:14:51+00:00",
  "client_note": null,
  "customer_id": "mk6bzKb30Nl9G5",
  "deposit_due": "2025-10-30T20:04:13+00:00",
  "paid_amount": 393780,
  "warehouse_id": "1oVOzZo504rW5G",
  "calc_discount": 0,
  "calc_subtotal": 368880,
  "cust_due_date": "2025-11-05T05:59:59+00:00",
  "deposit_total": 50000,
  "ship_due_date": null,
  "assigned_users": [],
  "auto_saved_for": null,
  "discount_total": 0,
  "_legacy_hash_id": "nm51l68QQorR37",
  "approval_status": null,
  "full_amount_due": "2025-11-11T20:04:13+00:00",
  "payment_term_id": "X5PVrExkKzGWbB",
  "customer_profile": null,
  "deposit_required": true,
  "inventory_status": "not_committed",
  "pricing_group_id": "gO4Klq8aJvMPex",
  "pricing_strategy": "job_separately",
  "billing_address_id": null,
  "calc_deposit_total": 196890,
  "customer_has_email": false,
  "customer_po_number": null,
  "formatted_calc_tax": "$24.90",
  "customer_contact_id": "06Zjrmjb91vVRk",
  "customer_profile_id": null,
  "shipping_address_id": "yQ6mlp5WAMzXOo",
  "formatted_calc_total": "$393.78",
  "has_pending_approval": false,
  "formatted_paid_amount": "$393.78",
  "quickbook_disable_sync": false,
  "status_completion_date": null,
  "formatted_calc_discount": "$0.00",
  "formatted_calc_subtotal": "$368.88",
  "formatted_deposit_total": "$50.00",
  "status_last_change_date": null,
  "formatted_invoiced_total": "$393.78",
  "has_pending_job_approval": false,
  "last_payment_request_date": null,
  "quickbook_last_error_sync": null,
  "customer_portal_order_link": "https://portal.hubcitydesignlbk.com/external-redirect/show_sales_order?order_id=nm51l68QQorR37&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjk0MzkzLCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1ODQ5MSwic3ViIjoyNzYwMDYsImlhdCI6MTc2MTY4MjQ5MSwibmJmIjoxNzYxNjgyNDkxLCJqdGkiOiJmNjNMSUdTV3lQSGVhTXpaIn0.LYvYSroB_QhuYbDSPHmHCj9l7JPVgaNRIVDHSlLBjWg",
  "has_pending_order_approval": false,
  "formatted_order_balance_due": "$0.00",
  "quickbook_last_success_sync": null,
  "customer_portal_payment_link": "https://portal.hubcitydesignlbk.com/external-redirect/show_sales_order?order_id=nm51l68QQorR37&show_payment=true&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjk0MzkzLCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1ODQ5MSwic3ViIjoyNzYwMDYsImlhdCI6MTc2MTY4MjQ5MSwibmJmIjoxNzYxNjgyNDkxLCJqdGkiOiI5dFowNDRoNUxzVmJlbEtpIn0.iZbEDs9CSO_YQxssrbjb3-jkq4SuP2_GPSsVQDzwQvU",
  "formatted_calc_deposit_total": "$196.89",
  "formatted_deposit_amount_due": "$0.00",
  "formatted_shipment_cost_total": "$0.00",
  "formatted_invoiced_tax_subtotal": "$24.90",
  "formatted_order_item_cart_total": "$368.88",
  "has_external_integration_sync_error": false,
  "formatted_invoiced_discount_subtotal": "$0.00",
  "formatted_invoiced_shipment_subtotal": "$0.00",
  "formatted_shipment_billable_fee_total": "$0.00",
  "formatted_invoiced_order_item_subtotal": "$368.88"
}
```

## quote.created

**Description:** Sample payload for `quote.created` (from Hub City Design's repo).

```json
{
  "id": "nm51l68QQorR37",
  "mode": "view",
  "name": "CAMS Carhartt Hoodies",
  "tags": [],
  "quote": true,
  "status": {
    "id": "xDQwr811yLvRyG",
    "role": "quote",
    "type": "start",
    "color": "#0bf5fe",
    "label": "Pending",
    "trashed": false,
    "position": 0,
    "customer_label": "Pending"
  },
  "is_rush": false,
  "trashed": false,
  "version": 2,
  "calc_tax": 0,
  "customer": {
    "id": "mk6bzKb30Nl9G5",
    "pdf": {
      "invoice_statement": "https://secure.yoprint.com/api/v2/document/pdf/customer_invoice_statement/8nvM3AJMW2fezW/hub-city-design-inc/mk6bzKb30Nl9G5"
    },
    "hide": false,
    "name": "CAMS Renewables",
    "tags": [],
    "media": [],
    "trashed": false,
    "website": "",
    "contacts": [
      {
        "id": "06Zjrmjb91vVRk",
        "fax": null,
        "email": "jtheriault@camsrenewables.com",
        "phone": "(806) 891-1235",
        "trashed": false,
        "last_name": "Theriault",
        "created_at": "2024-05-31T04:14:19+00:00",
        "first_name": "Jacob",
        "is_primary": true,
        "updated_at": "2024-06-10T22:46:24+00:00",
        "customer_id": "mk6bzKb30Nl9G5",
        "fax_country": null,
        "send_invoice": false,
        "phone_country": "US",
        "default_receive_sms": true
      }
    ],
    "addresses": [
      {
        "id": "yQ6mlp5WAMzXOo",
        "city": "Floydada",
        "note": null,
        "role": "shipping",
        "label": "Main Shipping Address",
        "nexus": true,
        "state": "TX",
        "country": "United States",
        "trashed": false,
        "address1": "1904 FM786",
        "address2": "",
        "postcode": "79235",
        "hold_stock": false,
        "is_primary": true,
        "state_code": "TX",
        "customer_id": "mk6bzKb30Nl9G5",
        "country_code": "US",
        "postal_is_valid": false,
        "postal_validated": false,
        "postal_can_validate": true,
        "is_default_warehouse": false
      }
    ],
    "created_at": "2024-05-31T04:14:19+00:00",
    "tax_exempt": false,
    "updated_at": "2025-09-16T04:15:56+00:00",
    "vat_number": null,
    "wallet_fund": 0,
    "quote_amount": 0,
    "resale_number": "",
    "unpaid_amount": 0,
    "assigned_users": [
      {
        "id": "4DKZvMB42l7n2J",
        "name": "Dillon White",
        "avatar_url": "https://download.yoprint.com/1230206/7.png?s=XLQwvFJqWm7RcLBMNlGbSg&e=1761717600"
      },
      {
        "id": "aWO4zxLMdzw3gN",
        "name": "Haleigh McCarley",
        "avatar_url": "https://download.yoprint.com/653913/5f2f58c4893afd346fdff02c5555d6eb.png?s=hui69XbjX1lP3gZn_TTMaw&e=1761717600"
      },
      {
        "id": "OaoDvOoEyv8wA9",
        "name": "Allison White",
        "avatar_url": "https://download.yoprint.com/659006/5f2f58c4893afd346fdff02c5555d6eb.png?s=_uGu8wZ2FPEFXJvEj13cIQ&e=1761717600"
      },
      {
        "id": "qQxmrD66kldyA7",
        "name": "Sarah Conner",
        "avatar_url": "https://download.yoprint.com/770872/5f2f58c4893afd346fdff02c5555d6eb.png?s=63hMNupRU5_nJgtDpjmOZg&e=1761717600"
      }
    ],
    "internal_notes": "",
    "ordered_amount": 3717070,
    "overdue_amount": 0,
    "wallet_currency": {
      "id": "YyAgrW6Zjz98Me",
      "iso": "USD",
      "name": "United States Dollar",
      "symbol": "$",
      "default": true,
      "trashed": false
    },
    "customer_profiles": [],
    "last_ordered_date": "2025-05-07T07:51:04+00:00",
    "customer_portal_id": "9p5xq2",
    "deposit_due_amount": 0,
    "customer_portal_link": "https://portal.hubcitydesignlbk.com/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjk0MzkzLCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1ODI0Miwic3ViIjoyNzYwMDYsImlhdCI6MTc2MTY4MjI0MiwibmJmIjoxNzYxNjgyMjQyLCJqdGkiOiJEb0dEb040bGJ3cnU2TFY2In0._hJ7joq-TIrcoVNB2fQe2sm7cj-DUFBxpoKmN5o4sl4",
    "default_warehouse_id": null,
    "default_payment_term_id": null,
    "default_pricing_group_id": null,
    "display_customer_portal_id": "CAMS",
    "customer_portal_id_override": "CAMS",
    "customer_portal_payment_option": null,
    "has_customer_portal_id_override": true
  },
  "due_date": null,
  "is_draft": false,
  "is_quote": true,
  "prod_note": null,
  "scoped_id": "SO1285",
  "status_id": "xDQwr811yLvRyG",
  "calc_total": 0,
  "created_at": "2025-10-28T20:03:58+00:00",
  "created_by": "4DKZvMB42l7n2J",
  "is_created": true,
  "issue_date": "2025-10-28T20:03:58+00:00",
  "start_date": null,
  "unique_key": "ord_0c5090351f798af42821bab03b4165gc9044c-5gg1da80c84d95a0a845g9",
  "updated_at": "2025-10-28T20:10:42+00:00",
  "client_note": null,
  "customer_id": "mk6bzKb30Nl9G5",
  "deposit_due": "2025-10-30T20:04:13+00:00",
  "grouped_pdf": [
    {
      "label": "Main",
      "documents": [
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/quote/8nvM3AJMW2fezW/hub-city-design-inc/nm51l68QQorR37",
          "label": "Quote",
          "description": "Quote details"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/quote_compact/8nvM3AJMW2fezW/hub-city-design-inc/nm51l68QQorR37",
          "label": "Quote (Compact)",
          "description": "Quote details optimized for printing"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_invoices/8nvM3AJMW2fezW/hub-city-design-inc/nm51l68QQorR37",
          "label": "All Invoices",
          "description": "All invoices"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_compact_invoices/8nvM3AJMW2fezW/hub-city-design-inc/nm51l68QQorR37",
          "label": "All Invoices (Compact)",
          "description": "All invoices optimized for printing"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_as_invoice/8nvM3AJMW2fezW/hub-city-design-inc/nm51l68QQorR37",
          "label": "Quote as Invoice",
          "description": "Uses the Quote ID as the Invoice ID"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_as_invoice_compact/8nvM3AJMW2fezW/hub-city-design-inc/nm51l68QQorR37",
          "label": "Quote as Invoice (Compact)",
          "description": "Uses the Quote ID as the Invoice ID. Optimized for printing"
        }
      ]
    },
    {
      "label": "Job",
      "documents": [
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_jobs/8nvM3AJMW2fezW/hub-city-design-inc/nm51l68QQorR37",
          "label": "All Jobs",
          "description": "All job details without mockup"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_jobs/8nvM3AJMW2fezW/hub-city-design-inc/nm51l68QQorR37",
          "label": "All Jobs (Mockups Incl.)",
          "description": "All job details including mockups"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_jobs_label/8nvM3AJMW2fezW/hub-city-design-inc/nm51l68QQorR37",
          "label": "All Job Labels (4\" x 6\")",
          "description": "All Job Labels (4\" x 6\")"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_jobs_dymo_label/8nvM3AJMW2fezW/hub-city-design-inc/nm51l68QQorR37",
          "label": "All Job Labels (1\" x 2-1/8\")",
          "description": "All Job Labels in  (1\" x 2-1/8\")"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_worksheet/8nvM3AJMW2fezW/hub-city-design-inc/nm51l68QQorR37",
          "label": "All Jobs Worksheet",
          "description": "All Jobs Worksheet"
        }
      ]
    },
    {
      "label": "Shipment",
      "documents": [
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_shipment/8nvM3AJMW2fezW/hub-city-design-inc/nm51l68QQorR37",
          "label": "All Packing Slips",
          "description": "All shipment packing slips"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_shipment_label/8nvM3AJMW2fezW/hub-city-design-inc/nm51l68QQorR37",
          "label": "All Shipment Labels (Letter size)",
          "description": "All Shipment labels to be printed on Letter Size"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_shipment_label/8nvM3AJMW2fezW/hub-city-design-inc/nm51l68QQorR37",
          "label": "All Shipment Labels (4\" x 6\")",
          "description": "All Shipment labels to be printed on 4\" x 6\" labels"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_shipments_dymo_label/8nvM3AJMW2fezW/hub-city-design-inc/nm51l68QQorR37",
          "label": "All Shipment Labels (1\" x 2-1/8\")",
          "description": "All Shipment Labels to be printed on (1\" x 2-1/8\")"
        }
      ]
    }
  ],
  "paid_amount": 0,
  "warehouse_id": "1oVOzZo504rW5G",
  "calc_discount": 0,
  "calc_subtotal": 0,
  "cust_due_date": "2025-11-05T05:59:59+00:00",
  "deposit_total": 50000,
  "ship_due_date": null,
  "assigned_users": [],
  "auto_saved_for": null,
  "discount_total": 0,
  "approval_status": null,
  "full_amount_due": "2025-11-11T20:04:13+00:00",
  "payment_term_id": "X5PVrExkKzGWbB",
  "customer_profile": null,
  "deposit_required": true,
  "pricing_group_id": "gO4Klq8aJvMPex",
  "pricing_strategy": "job_separately",
  "billing_address_id": null,
  "calc_deposit_total": 178720,
  "customer_has_email": true,
  "customer_po_number": null,
  "customer_contact_id": "06Zjrmjb91vVRk",
  "customer_profile_id": null,
  "shipping_address_id": "yQ6mlp5WAMzXOo",
  "has_pending_approval": false,
  "quickbook_disable_sync": false,
  "status_completion_date": null,
  "status_last_change_date": null,
  "has_pending_job_approval": false,
  "last_payment_request_date": null,
  "quickbook_last_error_sync": null,
  "customer_portal_order_link": "https://portal.hubcitydesignlbk.com/external-redirect/show_sales_order?order_id=nm51l68QQorR37&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjk0MzkzLCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1ODI0Miwic3ViIjoyNzYwMDYsImlhdCI6MTc2MTY4MjI0MiwibmJmIjoxNzYxNjgyMjQyLCJqdGkiOiJSb3YxU05UeHFJV3RVZ1FMIn0.YCff7BbK9URKF3uhGMQGlv9Dbu11FMfgvxbvgHx5yRc",
  "has_pending_order_approval": false,
  "quickbook_last_success_sync": null,
  "customer_portal_payment_link": "https://portal.hubcitydesignlbk.com/external-redirect/show_sales_order?order_id=nm51l68QQorR37&show_payment=true&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjk0MzkzLCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1ODI0Miwic3ViIjoyNzYwMDYsImlhdCI6MTc2MTY4MjI0MiwibmJmIjoxNzYxNjgyMjQyLCJqdGkiOiI5dXJJS2l6OWZPaEg2YTlhIn0.1A-0dHXYs8Yc37mpXkduuUJcPaiWOB6aR4zIEERgEFQ",
  "has_external_integration_sync_error": false
}
```

## sales_order.status_changed

**Description:** Sample payload for `sales_order.status_changed` (from Hub City Design's repo).

```json
{
  "id": "06ZjrmDJOqzVRk",
  "mode": "view",
  "name": "PDWA PVC Hats-Printed Apparel",
  "tags": [],
  "quote": false,
  "status": {
    "id": "pDQProk6ZJr5dn",
    "role": "order",
    "type": "in_progress",
    "color": "#fed9a8",
    "label": "Waiting For PO Arrival",
    "trashed": false,
    "position": 4,
    "customer_label": "Products Ordered"
  },
  "is_rush": false,
  "trashed": false,
  "version": 2,
  "calc_tax": 0,
  "customer": {
    "id": "6Z9Bz52Z2ormab",
    "pdf": {
      "invoice_statement": "https://secure.yoprint.com/api/v2/document/pdf/customer_invoice_statement/kxvkD5WA18cklV/hub-city-design-inc/6Z9Bz52Z2ormab"
    },
    "hide": false,
    "name": "Palo Duro Wildfire Academy",
    "tags": [],
    "media": [],
    "trashed": false,
    "website": "",
    "contacts": [
      {
        "id": "KG1dvw4e7aleP3",
        "fax": "",
        "email": "jonathans4stevens@gmail.com",
        "phone": "+1 806-433-7730",
        "trashed": false,
        "last_name": "Stevens",
        "created_at": "2025-10-01T17:48:44+00:00",
        "first_name": "Jonathan ",
        "is_primary": false,
        "updated_at": "2025-10-15T15:17:23+00:00",
        "customer_id": "6Z9Bz52Z2ormab",
        "fax_country": "",
        "send_invoice": false,
        "phone_country": "US",
        "default_receive_sms": true
      },
      {
        "id": "LwYOznK59drGPb",
        "fax": "",
        "email": "palodurowildfireacademy@gmail.com",
        "phone": "",
        "trashed": false,
        "last_name": "",
        "created_at": "2025-10-01T18:00:49+00:00",
        "first_name": "Palo Duro Wildlife Academy",
        "is_primary": true,
        "updated_at": "2025-10-02T03:03:01+00:00",
        "customer_id": "6Z9Bz52Z2ormab",
        "fax_country": "",
        "send_invoice": false,
        "phone_country": "",
        "default_receive_sms": false
      }
    ],
    "addresses": [],
    "created_at": "2025-10-01T17:48:44+00:00",
    "tax_exempt": true,
    "updated_at": "2025-10-16T19:04:13+00:00",
    "vat_number": "",
    "wallet_fund": 0,
    "quote_amount": 0,
    "resale_number": "",
    "unpaid_amount": 3289550,
    "assigned_users": [
      {
        "id": "94mKlNO62zYaOZ",
        "name": "Leah Andrade",
        "avatar_url": "https://download.yoprint.com/1207855/5f2f58c4893afd346fdff02c5555d6eb.png?s=4blXCcHSDKCGi6EzZZ0GJA&e=1761717600"
      }
    ],
    "internal_notes": "",
    "ordered_amount": 5476670,
    "overdue_amount": 3289550,
    "wallet_currency": {
      "id": "YyAgrW6Zjz98Me",
      "iso": "USD",
      "name": "United States Dollar",
      "symbol": "$",
      "default": true,
      "trashed": false
    },
    "customer_profiles": [],
    "last_ordered_date": "2025-10-01T17:48:50+00:00",
    "customer_portal_id": "dp5rq7",
    "deposit_due_amount": 551220,
    "customer_portal_link": "https://portal.hubcitydesignlbk.com/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6NDE4MzQ3LCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1OTM0OCwic3ViIjozODE2MDgsImlhdCI6MTc2MTY4MzM0OCwibmJmIjoxNzYxNjgzMzQ4LCJqdGkiOiI4dFd4dTc5VXFiejFDTjluIn0.S24qHe26OoKYgKNO5D1zW36T8ZIdUPSih2_BqU-cQUc",
    "default_warehouse_id": null,
    "default_payment_term_id": null,
    "default_pricing_group_id": null,
    "display_customer_portal_id": "dp5rq7",
    "customer_portal_id_override": null,
    "customer_portal_payment_option": null,
    "has_customer_portal_id_override": false
  },
  "due_date": null,
  "is_draft": false,
  "is_quote": false,
  "prod_note": "<span style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-pasted=\"true\" data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">T-shirt&nbsp;</span><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Small &nbsp; &nbsp; &nbsp; &nbsp; 5</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Medium &nbsp; 15</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Large &nbsp; &nbsp; &nbsp; 55</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">XL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;55</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">2XL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;20</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Total &nbsp;150</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\"><br></div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Hoodies&nbsp;</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Small &nbsp; &nbsp; &nbsp; &nbsp; 5</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Medium &nbsp; 15</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Large &nbsp; &nbsp; &nbsp; 25&nbsp;</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">XL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;30</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">2XL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;25</div><div style='color: rgb(222, 222, 221); font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen, Ubuntu, \"Helvetica Neue\", \"Apple Color Emoji\", sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(21, 22, 23); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; --darkreader-inline-color: var(--darkreader-text-dededd, #d4d0cb); --darkreader-inline-bgcolor: var(--darkreader-background-151617, #2f3233);' data-darkreader-inline-color=\"\" data-darkreader-inline-bgcolor=\"\">Total 100</div>",
  "scoped_id": "SO1235",
  "status_id": "pDQProk6ZJr5dn",
  "calc_total": 5476670,
  "created_at": "2025-10-01T17:48:50+00:00",
  "created_by": "94mKlNO62zYaOZ",
  "is_created": true,
  "issue_date": "2025-10-01T17:48:50+00:00",
  "start_date": null,
  "unique_key": "ord_58gbg7bfcf0502bd25f8-eb39cc08dd1f62f7-66gg81g1acedgf8a445d02",
  "updated_at": "2025-10-27T16:14:51+00:00",
  "client_note": "",
  "customer_id": "6Z9Bz52Z2ormab",
  "deposit_due": "2025-10-03T17:48:50+00:00",
  "grouped_pdf": [
    {
      "label": "Main",
      "documents": [
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/order/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "Sales Order",
          "description": "Sales Order details"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/order_compact/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "Sales Order (Compact)",
          "description": "Sales Order details optimized for printing"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_invoices/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Invoices",
          "description": "All invoices"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_compact_invoices/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Invoices (Compact)",
          "description": "All invoices optimized for printing"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_as_invoice/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "Sales Order as Invoice",
          "description": "Uses the Sales Order ID as the Invoice ID"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_as_invoice_compact/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "Sales Order as Invoice (Compact)",
          "description": "Uses the Sales Order ID as the Invoice ID. Optimized for printing"
        }
      ]
    },
    {
      "label": "Job",
      "documents": [
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_jobs/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Jobs",
          "description": "All job details without mockup"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_jobs/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Jobs (Mockups Incl.)",
          "description": "All job details including mockups"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_jobs_label/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Job Labels (4\" x 6\")",
          "description": "All Job Labels (4\" x 6\")"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_jobs_dymo_label/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Job Labels (1\" x 2-1/8\")",
          "description": "All Job Labels in  (1\" x 2-1/8\")"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_worksheet/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Jobs Worksheet",
          "description": "All Jobs Worksheet"
        }
      ]
    },
    {
      "label": "Shipment",
      "documents": [
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_shipment/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Packing Slips",
          "description": "All shipment packing slips"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_shipment_label/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Shipment Labels (Letter size)",
          "description": "All Shipment labels to be printed on Letter Size"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_shipment_label/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Shipment Labels (4\" x 6\")",
          "description": "All Shipment labels to be printed on 4\" x 6\" labels"
        },
        {
          "url": "https://secure.yoprint.com/api/v2/document/pdf/so_shipments_dymo_label/kxvkD5WA18cklV/hub-city-design-inc/06ZjrmDJOqzVRk",
          "label": "All Shipment Labels (1\" x 2-1/8\")",
          "description": "All Shipment Labels to be printed on (1\" x 2-1/8\")"
        }
      ]
    }
  ],
  "paid_amount": 2187120,
  "warehouse_id": "1oVOzZo504rW5G",
  "calc_discount": 0,
  "calc_subtotal": 5476670,
  "cust_due_date": null,
  "deposit_total": 50000,
  "ship_due_date": null,
  "assigned_users": [],
  "auto_saved_for": null,
  "discount_total": 0,
  "approval_status": "approved",
  "full_amount_due": "2025-10-15T17:48:50+00:00",
  "payment_term_id": "X5PVrExkKzGWbB",
  "previous_status": {
    "id": "pDQProk6ZJr5dn",
    "role": "order",
    "type": "in_progress",
    "color": "#fed9a8",
    "label": "Waiting For PO Arrival",
    "trashed": false,
    "position": 4,
    "customer_label": "Products Ordered"
  },
  "customer_profile": null,
  "deposit_required": true,
  "pricing_group_id": "gO4Klq8aJvMPex",
  "pricing_strategy": "job_separately",
  "billing_address_id": null,
  "calc_deposit_total": 2738340,
  "customer_has_email": true,
  "customer_po_number": null,
  "participant_emails": [
    "palodurowildfireacademy@gmail.com",
    "jonathans4stevens@gmail.com"
  ],
  "previous_status_id": "pDQProk6ZJr5dn",
  "customer_contact_id": null,
  "customer_profile_id": null,
  "shipping_address_id": null,
  "has_pending_approval": false,
  "quickbook_disable_sync": false,
  "status_completion_date": null,
  "status_last_change_date": "2025-10-27T16:14:51+00:00",
  "has_pending_job_approval": false,
  "last_payment_request_date": null,
  "quickbook_last_error_sync": null,
  "customer_portal_order_link": "https://portal.hubcitydesignlbk.com/external-redirect/show_sales_order?order_id=06ZjrmDJOqzVRk&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6NDE4MzQ3LCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1OTM0OCwic3ViIjozODE2MDgsImlhdCI6MTc2MTY4MzM0OCwibmJmIjoxNzYxNjgzMzQ4LCJqdGkiOiJ1MGRkUUlBVnZMdUhRMnpvIn0.upVB7H756owOZQZW9zOvUxfVNQuOrYo5K55pak0cl1Q",
  "has_pending_order_approval": false,
  "quickbook_last_success_sync": "2025-10-16T19:07:21+00:00",
  "customer_portal_payment_link": "https://portal.hubcitydesignlbk.com/external-redirect/show_sales_order?order_id=06ZjrmDJOqzVRk&show_payment=true&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6NDE4MzQ3LCJ0aWQiOjMyMzIsImV4cCI6MTc5MTA1OTM0OCwic3ViIjozODE2MDgsImlhdCI6MTc2MTY4MzM0OCwibmJmIjoxNzYxNjgzMzQ4LCJqdGkiOiJiaUpVTWMzdHk2bzk2enM4In0.LH6NZjFe3WZjuPdgEmHLQJ_ri39iUAXS1sxWa4vcPe8",
  "has_external_integration_sync_error": false
}
```

## shipment.status_changed

**Description:** Sample payload for `shipment.status_changed` (from Hub City Design's repo).

```json
{
  "id": "qdgwz34mWDrG19",
  "pdf": [
    {
      "url": "https://secure.yoprint.com/api/document/shipment/k9re6jkEK2IXvE/hub-city-design-inc/qdgwz34mWDrG19",
      "label": "Packing Slip",
      "description": "Packing Slip"
    },
    {
      "url": "https://secure.yoprint.com/api/document/shipment_label/k9re6jkEK2IXvE/hub-city-design-inc/qdgwz34mWDrG19?doc_size=full",
      "label": "Shipment Label (Letter Size)",
      "description": "Shipment label printed on Letter Size"
    },
    {
      "url": "https://secure.yoprint.com/api/document/shipment_label/k9re6jkEK2IXvE/hub-city-design-inc/qdgwz34mWDrG19?doc_size=label",
      "label": "Shipment Label (4\" x 6\")",
      "description": "Shipment label printed on 4\" x 6\" label"
    },
    {
      "url": "https://secure.yoprint.com/api/document/shipment_dymo_label/k9re6jkEK2IXvE/hub-city-design-inc/qdgwz34mWDrG19?doc_size=label",
      "label": "Shipment Label (1\" x 2-1/8\")",
      "description": "Shipment label printed on (1\" x 2-1/8\")"
    }
  ],
  "items": [
    {
      "id": "O0ZvaN81WklnMK",
      "tax": {
        "type": "",
        "total": null,
        "is_override": false
      },
      "job_id": "KG1dvwNAbareP3",
      "pricing": {
        "type": "system",
        "product": {
          "cost": null
        }
      },
      "product": {
        "id": "k6bzKpWmp9r9G5",
        "type": "order_item"
      },
      "_hydrate": {
        "job": {
          "id": "KG1dvwNAbareP3",
          "pdf": [
            {
              "url": "https://secure.yoprint.com/api/v2/document/pdf/job/k9re6jkEK2IXvE/hub-city-design-inc/KG1dvwNAbareP3?show_mockup=0",
              "label": "Job Details",
              "description": "Job details without mockup",
              "object_type": "job"
            },
            {
              "url": "https://secure.yoprint.com/api/v2/document/pdf/job/k9re6jkEK2IXvE/hub-city-design-inc/KG1dvwNAbareP3?show_mockup=1",
              "label": "Job Details (Mockups Incl.)",
              "description": "Job details including mockups",
              "object_type": "job"
            },
            {
              "url": "https://secure.yoprint.com/api/v2/document/pdf/job_label/k9re6jkEK2IXvE/hub-city-design-inc/KG1dvwNAbareP3",
              "label": "Job Label (4\" x 6\")",
              "description": "Job Label (4\" x 6\")",
              "object_type": "job"
            },
            {
              "url": "https://secure.yoprint.com/api/v2/document/pdf/job_dymo_label/k9re6jkEK2IXvE/hub-city-design-inc/KG1dvwNAbareP3",
              "label": "Job Label (1\" x 2-1/8\")",
              "description": "Job Label (1\" x 2-1/8\")",
              "object_type": "job"
            }
          ],
          "name": "Embroidery Apparel",
          "note": "",
          "is_rush": false,
          "version": 2,
          "customer": {
            "id": "4L9MzLGb6WlXQP",
            "name": "Royal Equine Dentistry"
          },
          "due_date": "2025-03-23T18:20:05+00:00",
          "order_id": "LwYOzn7gR1rGPb",
          "position": 1175184,
          "scoped_id": "JOB-1834",
          "status_id": "qQxmrDQQPVvdyA",
          "item_count": 5,
          "start_date": "2025-03-11T18:20:05+00:00",
          "unique_key": "job_aad0-49159c6c8cbb3614b72ff1f16783d00b1d44g7f1-2-8e0g84f9df66",
          "from_legacy": false,
          "has_service": true,
          "qr_code_url": "https://ypnt.us/qr/y9-0p-job-1175184",
          "sales_order": {
            "name": "Jackets",
            "is_rush": false,
            "due_date": null,
            "is_quote": false,
            "status_id": "OwakrePPQ1z697",
            "created_by": "N4Lpz0wojl3R0m",
            "issue_date": "2025-03-11T18:20:05+00:00",
            "start_date": null,
            "cust_due_date": null,
            "ship_due_date": null
          },
          "pricing_total": {
            "dp": 3,
            "value": 12500
          },
          "auto_saved_for": null,
          "location_count": 1,
          "order_scoped_id": "SO0799",
          "impression_count": 5,
          "inventory_status": "not_applicable",
          "services_still_valid": true,
          "pricing_original_total": {
            "dp": 3,
            "value": 12500
          },
          "status_completion_date": "2025-03-11T21:42:11+00:00",
          "status_last_change_date": "2025-03-11T21:42:11+00:00",
          "stock_on_hand_accounted": false,
          "order_customer_po_number": null,
          "need_cust_provide_product": false
        },
        "job_status": {
          "id": "qQxmrDQQPVvdyA",
          "role": "job",
          "type": "end",
          "color": "#0f151e",
          "label": "Completed",
          "trashed": false,
          "position": 7,
          "customer_label": "Completed"
        },
        "product_display": {
          "tax": 0,
          "total": 0,
          "discount": 0,
          "subtotal": 0
        }
      },
      "position": 100000,
      "quantity": 5
    },
    {
      "id": "VXdljQGgBjvpgY",
      "tax": {
        "type": "",
        "total": null,
        "is_override": false
      },
      "job_id": null,
      "pricing": {
        "type": "shipment_cost",
        "product": {
          "cost": null
        }
      },
      "product": {
        "type": "shipment_cost"
      },
      "_hydrate": {
        "product_display": {
          "tax": 0,
          "total": 0,
          "discount": 0,
          "subtotal": 0
        }
      },
      "position": 200000,
      "quantity": 1
    }
  ],
  "status": {
    "id": "OxBDzyeeyJzAVK",
    "role": "shipment",
    "type": "end",
    "color": "#161f2c",
    "label": "Shipped",
    "trashed": false,
    "position": 6,
    "customer_label": "Completed"
  },
  "tax_id": null,
  "version": 2,
  "calc_tax": 0,
  "customer": {
    "id": "4L9MzLGb6WlXQP",
    "pdf": {
      "invoice_statement": "https://secure.yoprint.com/api/v2/document/pdf/customer_invoice_statement/k9re6jkEK2IXvE/hub-city-design-inc/4L9MzLGb6WlXQP"
    },
    "hide": false,
    "name": "Royal Equine Dentistry",
    "trashed": false,
    "website": "",
    "created_at": "2024-05-04T02:45:38+00:00",
    "tax_exempt": true,
    "updated_at": "2025-03-19T15:33:59+00:00",
    "vat_number": null,
    "wallet_fund": 0,
    "quote_amount": 0,
    "resale_number": "",
    "unpaid_amount": 0,
    "internal_notes": "",
    "ordered_amount": 1290870,
    "overdue_amount": 0,
    "wallet_currency": {
      "id": "YyAgrW6Zjz98Me",
      "iso": "USD",
      "name": "United States Dollar",
      "symbol": "$",
      "default": true,
      "trashed": false
    },
    "last_ordered_date": "2025-03-11T18:20:05+00:00",
    "customer_portal_id": "e6p7yo",
    "deposit_due_amount": 0,
    "customer_portal_link": "https://portal.hubcitydesignlbk.com/?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjdXN0b21lciIsImNvbl9pZCI6Mjg4NjcyLCJ0aWQiOjMyMzIsImV4cCI6MTc5MTAwOTgxNywic3ViIjoyNzEyNTcsImlhdCI6MTc2MTYzMzgxNywibmJmIjoxNzYxNjMzODE3LCJqdGkiOiJGcVp2cU9zdUpJVFhEblFOIn0.BHM-KLtdLj3T37C4w2eBUXNI7ycPbsjKtd2AYf6QK6Q",
    "default_warehouse_id": null,
    "default_payment_term_id": null,
    "default_pricing_group_id": null,
    "display_customer_portal_id": "beaukelley62",
    "customer_portal_id_override": "beaukelley62",
    "customer_portal_payment_option": null,
    "has_customer_portal_id_override": true
  },
  "order_id": "LwYOzn7gR1rGPb",
  "tax_type": null,
  "packed_by": null,
  "scoped_id": "SHIP-1110",
  "status_id": "OxBDzyeeyJzAVK",
  "tax_total": null,
  "calc_total": 0,
  "customer_id": "4L9MzLGb6WlXQP",
  "calc_discount": 0,
  "calc_subtotal": 0,
  "delivery_cost": null,
  "discount_type": "percent",
  "ready_to_ship": true,
  "ship_due_date": null,
  "auto_saved_for": null,
  "delivery_notes": null,
  "delivery_total": null,
  "discount_total": 0,
  "internal_notes": null,
  "order_scoped_id": "SO0799",
  "previous_status": {
    "id": "OPALrYZZ07vexy",
    "role": "shipment",
    "type": "start",
    "color": "#a7c6ff",
    "label": "Shipment Created Awaiting Confirmation",
    "trashed": false,
    "position": 0,
    "customer_label": "Shipment Created Awaiting Confirmation"
  },
  "delivery_is_cost": false,
  "delivery_taxable": false,
  "shipping_type_id": "xwaArdQODvBGKZ",
  "customer_due_date": null,
  "customer_po_number": null,
  "previous_status_id": "OPALrYZZ07vexy",
  "shipping_address_id": "mV4XzgVbXxlqKd",
  "status_completion_date": "2025-10-28T06:43:37+00:00",
  "status_last_change_date": "2025-10-28T06:43:37+00:00"
}
```

## work_pipeline.status_changed

**Description:** Sample payload for `work_pipeline.status_changed` (from Hub City Design's repo).

```json
{
  "id": "6oejzBp7dVv8Gq",
  "name": "Embroidery",
  "note": null,
  "job_id": "q2nVrG92NAlagp",
  "status": {
    "id": "OaoDvOooZev8wA",
    "role": "pipeline",
    "type": "in_progress",
    "color": "#982abc",
    "label": "Ready For Production",
    "trashed": false,
    "position": 3,
    "pipeline_id": "X5PVrELApzGWbB",
    "customer_label": "In Progress"
  },
  "due_date": "2025-10-05T19:46:19+00:00",
  "job_name": "Texas Trader BackPacks",
  "order_id": "8nDRz2Znq8zMEV",
  "position": 0,
  "status_id": "OaoDvOooZev8wA",
  "created_at": "2025-10-28T19:00:57+00:00",
  "order_name": null,
  "start_date": "2025-09-23T19:46:19+00:00",
  "updated_at": "2025-10-28T19:02:59+00:00",
  "job_is_rush": 0,
  "pipeline_id": "X5PVrELApzGWbB",
  "sales_order": {
    "due_date": null,
    "is_quote": false,
    "status_id": null,
    "created_by": null,
    "issue_date": null,
    "start_date": null,
    "customer_id": null,
    "cust_due_date": null,
    "customer_name": null,
    "ship_due_date": null
  },
  "job_scoped_id": "JOB-2949",
  "job_status_id": "enY1z9yyWkzPmJ",
  "assigned_users": [
    "N4Lpz0w3Kl3R0m",
    "OPALrYy0Wrexy9"
  ],
  "job_item_count": 2,
  "order_scoped_id": null,
  "previous_status": {
    "id": "KG1dvwXXyMleP3",
    "role": "pipeline",
    "type": "start",
    "color": "#24e8e5",
    "label": "Pending",
    "trashed": false,
    "position": 0,
    "pipeline_id": "X5PVrELApzGWbB",
    "customer_label": "Pending"
  },
  "previous_status_id": "KG1dvwXXyMleP3",
  "status_completion_date": null,
  "assigned_users_hydrated": [
    {
      "id": "N4Lpz0w3Kl3R0m",
      "name": "Ashley Scott",
      "avatar_url": "https://download.yoprint.com/749377/5f2f58c4893afd346fdff02c5555d6eb.png?s=zt2DLuLnqHi1uhfGeJhckg&e=1761717600"
    },
    {
      "id": "OPALrYy0Wrexy9",
      "name": "Brooklyn Shirley",
      "avatar_url": "https://download.yoprint.com/1365101/5f2f58c4893afd346fdff02c5555d6eb.png?s=YqAYfS_rcKSkx-oHsosiQw&e=1761717600"
    }
  ],
  "status_last_change_date": "2025-10-28T19:02:59+00:00"
}
```
