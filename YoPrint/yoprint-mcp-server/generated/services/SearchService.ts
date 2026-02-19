/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SearchService {
    /**
     * Search vendors
     * Searches for vendors
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Successful response
     * @throws ApiError
     */
    public static searchVendors(
        teamSlug: string,
        requestBody: {
            /**
             * Search query string
             */
            name: string;
        },
    ): CancelablePromise<{
        /**
         * Array of search hits
         */
        data: Array<({
            /**
             * Type discriminator for job search hits
             */
            global_search_type: 'job';
            /**
             * Job unique identifier
             */
            id: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted job identifier
             */
            scoped_id: string;
            /**
             * Job name
             */
            name: string;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            order: {
                /**
                 * Order ID
                 */
                id: string;
                /**
                 * Order scoped ID
                 */
                scoped_id: string;
                /**
                 * Customer PO number
                 */
                customer_po_number: string;
                /**
                 * Draft status
                 */
                draft: boolean;
                /**
                 * Quote flag
                 */
                quote: boolean;
            };
            /**
             * Media attachments
             */
            media: Array<{
                /**
                 * Media ID
                 */
                id: string;
                /**
                 * Media name
                 */
                name: string;
                /**
                 * File name
                 */
                file_name: string;
            }>;
            status: {
                /**
                 * Status ID
                 */
                id: string;
                /**
                 * Status role
                 */
                role: string;
                /**
                 * Status type
                 */
                type: string;
                /**
                 * Status label
                 */
                label: string;
                /**
                 * Customer-facing status label
                 */
                customer_label: string;
                /**
                 * Status color
                 */
                color: string;
            };
        } | {
            /**
             * Order unique identifier
             */
            id: string;
            /**
             * Order name
             */
            name: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted order identifier
             */
            scoped_id: string;
            /**
             * Quote flag
             */
            quote: boolean;
            /**
             * Customer PO number
             */
            customer_po_number: string;
            /**
             * Issue date
             */
            issue_date: string;
            /**
             * Start date
             */
            start_date: string;
            /**
             * Due date
             */
            due_date: string;
            /**
             * Customer due date
             */
            cust_due_date: string;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated discount
             */
            calc_discount: number;
            /**
             * Calculated total
             */
            calc_total: number;
            /**
             * Calculated deposit total
             */
            calc_deposit_total: number;
            /**
             * Paid amount
             */
            paid_amount: number;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            warehouse: {
                /**
                 * Warehouse ID
                 */
                id: string;
                /**
                 * Warehouse label
                 */
                label: string;
                /**
                 * Warehouse address
                 */
                address: string;
            };
            status: {
                id: string;
                role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                label: string;
                customer_label: string;
                color: string;
                position: number;
                trashed: boolean;
                pipeline_id?: string;
            };
            /**
             * Draft status
             */
            draft: boolean;
            /**
             * Type discriminator for order search hits
             */
            global_search_type: 'order';
            /**
             * Order version
             */
            version: number;
        } | {
            /**
             * Shipment unique identifier
             */
            id: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted shipment identifier
             */
            scoped_id: string;
            /**
             * Ready to ship status
             */
            ready_to_ship: boolean;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            order: {
                /**
                 * Order ID
                 */
                id: string;
                /**
                 * Order scoped ID
                 */
                scoped_id: string;
                /**
                 * Customer PO number
                 */
                customer_po_number: string;
                /**
                 * Draft status
                 */
                draft: boolean;
                /**
                 * Quote flag
                 */
                quote: boolean;
            };
            status: {
                /**
                 * Status ID
                 */
                id: string;
                /**
                 * Status role
                 */
                role: string;
                /**
                 * Status type
                 */
                type: string;
                /**
                 * Status label
                 */
                label: string;
                /**
                 * Customer-facing status label
                 */
                customer_label: string;
                /**
                 * Status color
                 */
                color: string;
            };
            shipping_type: {
                /**
                 * Shipping type ID
                 */
                id: string;
                /**
                 * Shipping type name
                 */
                name: string;
            };
            shipping_address: {
                /**
                 * Address ID
                 */
                id: string;
                /**
                 * Address label
                 */
                label: string;
                /**
                 * Full address
                 */
                address: string;
            };
            /**
             * Type discriminator for shipment search hits
             */
            global_search_type: 'shipment';
        } | {
            /**
             * Purchase order unique identifier
             */
            id: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted purchase order identifier
             */
            scoped_id: string;
            /**
             * Assigned user IDs
             */
            assigned_users: Array<string>;
            /**
             * Issue date
             */
            issue_date: string;
            /**
             * Due date
             */
            due_date: string;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated total
             */
            calc_total: number;
            vendor: {
                /**
                 * Vendor ID
                 */
                id: string;
                /**
                 * Vendor name
                 */
                name: string;
                /**
                 * Team ID
                 */
                team_id: number;
                /**
                 * Vendor deletion status
                 */
                deleted: boolean;
                /**
                 * Vendor account number
                 */
                account_number: string;
                /**
                 * Vendor website
                 */
                website: string;
            };
            warehouse: {
                /**
                 * Warehouse ID
                 */
                id: string;
                /**
                 * Warehouse label
                 */
                label: string;
                /**
                 * Warehouse address
                 */
                address: string;
            };
            status: {
                id: string;
                role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                label: string;
                customer_label: string;
                color: string;
                position: number;
                trashed: boolean;
                pipeline_id?: string;
            };
            /**
             * Type discriminator for purchase order search hits
             */
            global_search_type: 'purchase_order';
        } | {
            /**
             * Customer unique identifier
             */
            id: string;
            /**
             * Customer name
             */
            name: string;
            /**
             * Total ordered amount
             */
            ordered_amount: number;
            /**
             * Total quote amount
             */
            quote_amount: number;
            /**
             * Total unpaid amount
             */
            unpaid_amount: number;
            /**
             * Total deposit due amount
             */
            deposit_due_amount: number;
            /**
             * Total overdue amount
             */
            overdue_amount: number;
            /**
             * Customer portal display hash ID
             */
            customer_portal_display_hash_id: string;
            /**
             * Type discriminator for customer search hits
             */
            global_search_type: 'customer';
        } | {
            /**
             * Vendor unique identifier
             */
            id: string;
            /**
             * Vendor name
             */
            name: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Vendor account number
             */
            account_number: string;
            /**
             * Vendor website
             */
            website: string;
            /**
             * Type discriminator for vendor search hits
             */
            global_search_type: 'vendor';
        } | {
            /**
             * Type discriminator for product search hits
             */
            global_search_type: 'product';
            /**
             * Product source type
             */
            type: 'custom' | 'db_catalog' | 'db_catalog_style';
            /**
             * Product type classification
             */
            product_type: 'simple' | 'variant' | 'SSActivewear' | 'SanMar' | 'AlphaBroder' | 'tsf' | 'conde';
            /**
             * Product unique identifier
             */
            id: string;
            /**
             * Product name
             */
            name: string;
            /**
             * Product brand
             */
            brand: string;
            /**
             * Product style name
             */
            style_name: string;
        } | {
            /**
             * Type discriminator for invoice search hits
             */
            global_search_type: 'invoice';
            /**
             * Invoice unique identifier
             */
            id: string;
            /**
             * Formatted invoice identifier
             */
            scoped_id: string;
            /**
             * Amount paid
             */
            paid_amount: number;
            /**
             * Payment completion status
             */
            is_paid: boolean;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated discount
             */
            calc_discount: number;
            /**
             * Calculated total
             */
            calc_total: number;
            customer: {
                /**
                 * Customer name
                 */
                name: string;
                /**
                 * Customer ID
                 */
                id: string;
            };
            order: {
                /**
                 * Order ID
                 */
                id: string;
                /**
                 * Order scoped ID
                 */
                scoped_id: string;
                /**
                 * Customer PO number
                 */
                customer_po_number: string;
                /**
                 * Quote flag
                 */
                quote: boolean;
            };
            shipping_address: {
                /**
                 * Address ID
                 */
                id: string;
                /**
                 * Address label
                 */
                label: string;
                /**
                 * Full address
                 */
                address: string;
            };
        } | {
            /**
             * Type discriminator for tag search hits
             */
            global_search_type: 'tag';
            /**
             * Tag unique identifier
             */
            id: string;
            /**
             * Tag name
             */
            name: string;
        })>;
        pagination?: {
            /**
             * Number of items on current page
             */
            count: number;
            /**
             * Current page number
             */
            currentPage: number;
            links: {
                /**
                 * Next page URL
                 */
                next?: string;
                /**
                 * Previous page URL
                 */
                prev: string;
            };
            /**
             * Items per page
             */
            perPage: number;
            /**
             * Total number of items
             */
            total: number;
            /**
             * Total number of pages
             */
            totalPages: number;
        };
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Indicates if the request was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/v1/api/store/{team_slug}/vendor/search',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Search by scoped ID
     * Searches for entities by their scoped ID (formatted identifiers like INV-001, PO-123)
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Successful response
     * @throws ApiError
     */
    public static scopedIdSearch(
        teamSlug: string,
        requestBody: {
            /**
             * Type of entity to search
             */
            type: 'order' | 'invoice' | 'purchase_order' | 'shipment' | 'job';
            /**
             * The scoped identifier to search for
             */
            scoped_id: string;
        },
    ): CancelablePromise<{
        /**
         * Array of search hits
         */
        data: Array<({
            /**
             * Type discriminator for job search hits
             */
            global_search_type: 'job';
            /**
             * Job unique identifier
             */
            id: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted job identifier
             */
            scoped_id: string;
            /**
             * Job name
             */
            name: string;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            order: {
                /**
                 * Order ID
                 */
                id: string;
                /**
                 * Order scoped ID
                 */
                scoped_id: string;
                /**
                 * Customer PO number
                 */
                customer_po_number: string;
                /**
                 * Draft status
                 */
                draft: boolean;
                /**
                 * Quote flag
                 */
                quote: boolean;
            };
            /**
             * Media attachments
             */
            media: Array<{
                /**
                 * Media ID
                 */
                id: string;
                /**
                 * Media name
                 */
                name: string;
                /**
                 * File name
                 */
                file_name: string;
            }>;
            status: {
                /**
                 * Status ID
                 */
                id: string;
                /**
                 * Status role
                 */
                role: string;
                /**
                 * Status type
                 */
                type: string;
                /**
                 * Status label
                 */
                label: string;
                /**
                 * Customer-facing status label
                 */
                customer_label: string;
                /**
                 * Status color
                 */
                color: string;
            };
        } | {
            /**
             * Order unique identifier
             */
            id: string;
            /**
             * Order name
             */
            name: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted order identifier
             */
            scoped_id: string;
            /**
             * Quote flag
             */
            quote: boolean;
            /**
             * Customer PO number
             */
            customer_po_number: string;
            /**
             * Issue date
             */
            issue_date: string;
            /**
             * Start date
             */
            start_date: string;
            /**
             * Due date
             */
            due_date: string;
            /**
             * Customer due date
             */
            cust_due_date: string;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated discount
             */
            calc_discount: number;
            /**
             * Calculated total
             */
            calc_total: number;
            /**
             * Calculated deposit total
             */
            calc_deposit_total: number;
            /**
             * Paid amount
             */
            paid_amount: number;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            warehouse: {
                /**
                 * Warehouse ID
                 */
                id: string;
                /**
                 * Warehouse label
                 */
                label: string;
                /**
                 * Warehouse address
                 */
                address: string;
            };
            status: {
                id: string;
                role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                label: string;
                customer_label: string;
                color: string;
                position: number;
                trashed: boolean;
                pipeline_id?: string;
            };
            /**
             * Draft status
             */
            draft: boolean;
            /**
             * Type discriminator for order search hits
             */
            global_search_type: 'order';
            /**
             * Order version
             */
            version: number;
        } | {
            /**
             * Shipment unique identifier
             */
            id: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted shipment identifier
             */
            scoped_id: string;
            /**
             * Ready to ship status
             */
            ready_to_ship: boolean;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            order: {
                /**
                 * Order ID
                 */
                id: string;
                /**
                 * Order scoped ID
                 */
                scoped_id: string;
                /**
                 * Customer PO number
                 */
                customer_po_number: string;
                /**
                 * Draft status
                 */
                draft: boolean;
                /**
                 * Quote flag
                 */
                quote: boolean;
            };
            status: {
                /**
                 * Status ID
                 */
                id: string;
                /**
                 * Status role
                 */
                role: string;
                /**
                 * Status type
                 */
                type: string;
                /**
                 * Status label
                 */
                label: string;
                /**
                 * Customer-facing status label
                 */
                customer_label: string;
                /**
                 * Status color
                 */
                color: string;
            };
            shipping_type: {
                /**
                 * Shipping type ID
                 */
                id: string;
                /**
                 * Shipping type name
                 */
                name: string;
            };
            shipping_address: {
                /**
                 * Address ID
                 */
                id: string;
                /**
                 * Address label
                 */
                label: string;
                /**
                 * Full address
                 */
                address: string;
            };
            /**
             * Type discriminator for shipment search hits
             */
            global_search_type: 'shipment';
        } | {
            /**
             * Purchase order unique identifier
             */
            id: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted purchase order identifier
             */
            scoped_id: string;
            /**
             * Assigned user IDs
             */
            assigned_users: Array<string>;
            /**
             * Issue date
             */
            issue_date: string;
            /**
             * Due date
             */
            due_date: string;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated total
             */
            calc_total: number;
            vendor: {
                /**
                 * Vendor ID
                 */
                id: string;
                /**
                 * Vendor name
                 */
                name: string;
                /**
                 * Team ID
                 */
                team_id: number;
                /**
                 * Vendor deletion status
                 */
                deleted: boolean;
                /**
                 * Vendor account number
                 */
                account_number: string;
                /**
                 * Vendor website
                 */
                website: string;
            };
            warehouse: {
                /**
                 * Warehouse ID
                 */
                id: string;
                /**
                 * Warehouse label
                 */
                label: string;
                /**
                 * Warehouse address
                 */
                address: string;
            };
            status: {
                id: string;
                role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                label: string;
                customer_label: string;
                color: string;
                position: number;
                trashed: boolean;
                pipeline_id?: string;
            };
            /**
             * Type discriminator for purchase order search hits
             */
            global_search_type: 'purchase_order';
        } | {
            /**
             * Customer unique identifier
             */
            id: string;
            /**
             * Customer name
             */
            name: string;
            /**
             * Total ordered amount
             */
            ordered_amount: number;
            /**
             * Total quote amount
             */
            quote_amount: number;
            /**
             * Total unpaid amount
             */
            unpaid_amount: number;
            /**
             * Total deposit due amount
             */
            deposit_due_amount: number;
            /**
             * Total overdue amount
             */
            overdue_amount: number;
            /**
             * Customer portal display hash ID
             */
            customer_portal_display_hash_id: string;
            /**
             * Type discriminator for customer search hits
             */
            global_search_type: 'customer';
        } | {
            /**
             * Vendor unique identifier
             */
            id: string;
            /**
             * Vendor name
             */
            name: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Vendor account number
             */
            account_number: string;
            /**
             * Vendor website
             */
            website: string;
            /**
             * Type discriminator for vendor search hits
             */
            global_search_type: 'vendor';
        } | {
            /**
             * Type discriminator for product search hits
             */
            global_search_type: 'product';
            /**
             * Product source type
             */
            type: 'custom' | 'db_catalog' | 'db_catalog_style';
            /**
             * Product type classification
             */
            product_type: 'simple' | 'variant' | 'SSActivewear' | 'SanMar' | 'AlphaBroder' | 'tsf' | 'conde';
            /**
             * Product unique identifier
             */
            id: string;
            /**
             * Product name
             */
            name: string;
            /**
             * Product brand
             */
            brand: string;
            /**
             * Product style name
             */
            style_name: string;
        } | {
            /**
             * Type discriminator for invoice search hits
             */
            global_search_type: 'invoice';
            /**
             * Invoice unique identifier
             */
            id: string;
            /**
             * Formatted invoice identifier
             */
            scoped_id: string;
            /**
             * Amount paid
             */
            paid_amount: number;
            /**
             * Payment completion status
             */
            is_paid: boolean;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated discount
             */
            calc_discount: number;
            /**
             * Calculated total
             */
            calc_total: number;
            customer: {
                /**
                 * Customer name
                 */
                name: string;
                /**
                 * Customer ID
                 */
                id: string;
            };
            order: {
                /**
                 * Order ID
                 */
                id: string;
                /**
                 * Order scoped ID
                 */
                scoped_id: string;
                /**
                 * Customer PO number
                 */
                customer_po_number: string;
                /**
                 * Quote flag
                 */
                quote: boolean;
            };
            shipping_address: {
                /**
                 * Address ID
                 */
                id: string;
                /**
                 * Address label
                 */
                label: string;
                /**
                 * Full address
                 */
                address: string;
            };
        } | {
            /**
             * Type discriminator for tag search hits
             */
            global_search_type: 'tag';
            /**
             * Tag unique identifier
             */
            id: string;
            /**
             * Tag name
             */
            name: string;
        })>;
        pagination?: {
            /**
             * Number of items on current page
             */
            count: number;
            /**
             * Current page number
             */
            currentPage: number;
            links: {
                /**
                 * Next page URL
                 */
                next?: string;
                /**
                 * Previous page URL
                 */
                prev: string;
            };
            /**
             * Items per page
             */
            perPage: number;
            /**
             * Total number of items
             */
            total: number;
            /**
             * Total number of pages
             */
            totalPages: number;
        };
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Indicates if the request was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/v1/api/store/{team_slug}/global/scoped_id_search',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Search customers by name
     * Searches for customers by name with simplified response
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Successful response
     * @throws ApiError
     */
    public static customerNameSearch(
        teamSlug: string,
        requestBody: {
            /**
             * Customer name search query
             */
            name: string;
        },
    ): CancelablePromise<{
        /**
         * Array of search hits
         */
        data: Array<({
            /**
             * Type discriminator for job search hits
             */
            global_search_type: 'job';
            /**
             * Job unique identifier
             */
            id: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted job identifier
             */
            scoped_id: string;
            /**
             * Job name
             */
            name: string;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            order: {
                /**
                 * Order ID
                 */
                id: string;
                /**
                 * Order scoped ID
                 */
                scoped_id: string;
                /**
                 * Customer PO number
                 */
                customer_po_number: string;
                /**
                 * Draft status
                 */
                draft: boolean;
                /**
                 * Quote flag
                 */
                quote: boolean;
            };
            /**
             * Media attachments
             */
            media: Array<{
                /**
                 * Media ID
                 */
                id: string;
                /**
                 * Media name
                 */
                name: string;
                /**
                 * File name
                 */
                file_name: string;
            }>;
            status: {
                /**
                 * Status ID
                 */
                id: string;
                /**
                 * Status role
                 */
                role: string;
                /**
                 * Status type
                 */
                type: string;
                /**
                 * Status label
                 */
                label: string;
                /**
                 * Customer-facing status label
                 */
                customer_label: string;
                /**
                 * Status color
                 */
                color: string;
            };
        } | {
            /**
             * Order unique identifier
             */
            id: string;
            /**
             * Order name
             */
            name: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted order identifier
             */
            scoped_id: string;
            /**
             * Quote flag
             */
            quote: boolean;
            /**
             * Customer PO number
             */
            customer_po_number: string;
            /**
             * Issue date
             */
            issue_date: string;
            /**
             * Start date
             */
            start_date: string;
            /**
             * Due date
             */
            due_date: string;
            /**
             * Customer due date
             */
            cust_due_date: string;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated discount
             */
            calc_discount: number;
            /**
             * Calculated total
             */
            calc_total: number;
            /**
             * Calculated deposit total
             */
            calc_deposit_total: number;
            /**
             * Paid amount
             */
            paid_amount: number;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            warehouse: {
                /**
                 * Warehouse ID
                 */
                id: string;
                /**
                 * Warehouse label
                 */
                label: string;
                /**
                 * Warehouse address
                 */
                address: string;
            };
            status: {
                id: string;
                role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                label: string;
                customer_label: string;
                color: string;
                position: number;
                trashed: boolean;
                pipeline_id?: string;
            };
            /**
             * Draft status
             */
            draft: boolean;
            /**
             * Type discriminator for order search hits
             */
            global_search_type: 'order';
            /**
             * Order version
             */
            version: number;
        } | {
            /**
             * Shipment unique identifier
             */
            id: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted shipment identifier
             */
            scoped_id: string;
            /**
             * Ready to ship status
             */
            ready_to_ship: boolean;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            order: {
                /**
                 * Order ID
                 */
                id: string;
                /**
                 * Order scoped ID
                 */
                scoped_id: string;
                /**
                 * Customer PO number
                 */
                customer_po_number: string;
                /**
                 * Draft status
                 */
                draft: boolean;
                /**
                 * Quote flag
                 */
                quote: boolean;
            };
            status: {
                /**
                 * Status ID
                 */
                id: string;
                /**
                 * Status role
                 */
                role: string;
                /**
                 * Status type
                 */
                type: string;
                /**
                 * Status label
                 */
                label: string;
                /**
                 * Customer-facing status label
                 */
                customer_label: string;
                /**
                 * Status color
                 */
                color: string;
            };
            shipping_type: {
                /**
                 * Shipping type ID
                 */
                id: string;
                /**
                 * Shipping type name
                 */
                name: string;
            };
            shipping_address: {
                /**
                 * Address ID
                 */
                id: string;
                /**
                 * Address label
                 */
                label: string;
                /**
                 * Full address
                 */
                address: string;
            };
            /**
             * Type discriminator for shipment search hits
             */
            global_search_type: 'shipment';
        } | {
            /**
             * Purchase order unique identifier
             */
            id: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted purchase order identifier
             */
            scoped_id: string;
            /**
             * Assigned user IDs
             */
            assigned_users: Array<string>;
            /**
             * Issue date
             */
            issue_date: string;
            /**
             * Due date
             */
            due_date: string;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated total
             */
            calc_total: number;
            vendor: {
                /**
                 * Vendor ID
                 */
                id: string;
                /**
                 * Vendor name
                 */
                name: string;
                /**
                 * Team ID
                 */
                team_id: number;
                /**
                 * Vendor deletion status
                 */
                deleted: boolean;
                /**
                 * Vendor account number
                 */
                account_number: string;
                /**
                 * Vendor website
                 */
                website: string;
            };
            warehouse: {
                /**
                 * Warehouse ID
                 */
                id: string;
                /**
                 * Warehouse label
                 */
                label: string;
                /**
                 * Warehouse address
                 */
                address: string;
            };
            status: {
                id: string;
                role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                label: string;
                customer_label: string;
                color: string;
                position: number;
                trashed: boolean;
                pipeline_id?: string;
            };
            /**
             * Type discriminator for purchase order search hits
             */
            global_search_type: 'purchase_order';
        } | {
            /**
             * Customer unique identifier
             */
            id: string;
            /**
             * Customer name
             */
            name: string;
            /**
             * Total ordered amount
             */
            ordered_amount: number;
            /**
             * Total quote amount
             */
            quote_amount: number;
            /**
             * Total unpaid amount
             */
            unpaid_amount: number;
            /**
             * Total deposit due amount
             */
            deposit_due_amount: number;
            /**
             * Total overdue amount
             */
            overdue_amount: number;
            /**
             * Customer portal display hash ID
             */
            customer_portal_display_hash_id: string;
            /**
             * Type discriminator for customer search hits
             */
            global_search_type: 'customer';
        } | {
            /**
             * Vendor unique identifier
             */
            id: string;
            /**
             * Vendor name
             */
            name: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Vendor account number
             */
            account_number: string;
            /**
             * Vendor website
             */
            website: string;
            /**
             * Type discriminator for vendor search hits
             */
            global_search_type: 'vendor';
        } | {
            /**
             * Type discriminator for product search hits
             */
            global_search_type: 'product';
            /**
             * Product source type
             */
            type: 'custom' | 'db_catalog' | 'db_catalog_style';
            /**
             * Product type classification
             */
            product_type: 'simple' | 'variant' | 'SSActivewear' | 'SanMar' | 'AlphaBroder' | 'tsf' | 'conde';
            /**
             * Product unique identifier
             */
            id: string;
            /**
             * Product name
             */
            name: string;
            /**
             * Product brand
             */
            brand: string;
            /**
             * Product style name
             */
            style_name: string;
        } | {
            /**
             * Type discriminator for invoice search hits
             */
            global_search_type: 'invoice';
            /**
             * Invoice unique identifier
             */
            id: string;
            /**
             * Formatted invoice identifier
             */
            scoped_id: string;
            /**
             * Amount paid
             */
            paid_amount: number;
            /**
             * Payment completion status
             */
            is_paid: boolean;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated discount
             */
            calc_discount: number;
            /**
             * Calculated total
             */
            calc_total: number;
            customer: {
                /**
                 * Customer name
                 */
                name: string;
                /**
                 * Customer ID
                 */
                id: string;
            };
            order: {
                /**
                 * Order ID
                 */
                id: string;
                /**
                 * Order scoped ID
                 */
                scoped_id: string;
                /**
                 * Customer PO number
                 */
                customer_po_number: string;
                /**
                 * Quote flag
                 */
                quote: boolean;
            };
            shipping_address: {
                /**
                 * Address ID
                 */
                id: string;
                /**
                 * Address label
                 */
                label: string;
                /**
                 * Full address
                 */
                address: string;
            };
        } | {
            /**
             * Type discriminator for tag search hits
             */
            global_search_type: 'tag';
            /**
             * Tag unique identifier
             */
            id: string;
            /**
             * Tag name
             */
            name: string;
        })>;
        pagination?: {
            /**
             * Number of items on current page
             */
            count: number;
            /**
             * Current page number
             */
            currentPage: number;
            links: {
                /**
                 * Next page URL
                 */
                next?: string;
                /**
                 * Previous page URL
                 */
                prev: string;
            };
            /**
             * Items per page
             */
            perPage: number;
            /**
             * Total number of items
             */
            total: number;
            /**
             * Total number of pages
             */
            totalPages: number;
        };
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Indicates if the request was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/v1/api/store/{team_slug}/global/customer_name_search',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Global search
     * Performs a global search across all entity types
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Successful response
     * @throws ApiError
     */
    public static globalSearch(
        teamSlug: string,
        requestBody: {
            /**
             * Search query string
             */
            name: string;
        },
    ): CancelablePromise<{
        /**
         * Array of search hits
         */
        data: Array<({
            /**
             * Type discriminator for job search hits
             */
            global_search_type: 'job';
            /**
             * Job unique identifier
             */
            id: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted job identifier
             */
            scoped_id: string;
            /**
             * Job name
             */
            name: string;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            order: {
                /**
                 * Order ID
                 */
                id: string;
                /**
                 * Order scoped ID
                 */
                scoped_id: string;
                /**
                 * Customer PO number
                 */
                customer_po_number: string;
                /**
                 * Draft status
                 */
                draft: boolean;
                /**
                 * Quote flag
                 */
                quote: boolean;
            };
            /**
             * Media attachments
             */
            media: Array<{
                /**
                 * Media ID
                 */
                id: string;
                /**
                 * Media name
                 */
                name: string;
                /**
                 * File name
                 */
                file_name: string;
            }>;
            status: {
                /**
                 * Status ID
                 */
                id: string;
                /**
                 * Status role
                 */
                role: string;
                /**
                 * Status type
                 */
                type: string;
                /**
                 * Status label
                 */
                label: string;
                /**
                 * Customer-facing status label
                 */
                customer_label: string;
                /**
                 * Status color
                 */
                color: string;
            };
        } | {
            /**
             * Order unique identifier
             */
            id: string;
            /**
             * Order name
             */
            name: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted order identifier
             */
            scoped_id: string;
            /**
             * Quote flag
             */
            quote: boolean;
            /**
             * Customer PO number
             */
            customer_po_number: string;
            /**
             * Issue date
             */
            issue_date: string;
            /**
             * Start date
             */
            start_date: string;
            /**
             * Due date
             */
            due_date: string;
            /**
             * Customer due date
             */
            cust_due_date: string;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated discount
             */
            calc_discount: number;
            /**
             * Calculated total
             */
            calc_total: number;
            /**
             * Calculated deposit total
             */
            calc_deposit_total: number;
            /**
             * Paid amount
             */
            paid_amount: number;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            warehouse: {
                /**
                 * Warehouse ID
                 */
                id: string;
                /**
                 * Warehouse label
                 */
                label: string;
                /**
                 * Warehouse address
                 */
                address: string;
            };
            status: {
                id: string;
                role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                label: string;
                customer_label: string;
                color: string;
                position: number;
                trashed: boolean;
                pipeline_id?: string;
            };
            /**
             * Draft status
             */
            draft: boolean;
            /**
             * Type discriminator for order search hits
             */
            global_search_type: 'order';
            /**
             * Order version
             */
            version: number;
        } | {
            /**
             * Shipment unique identifier
             */
            id: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted shipment identifier
             */
            scoped_id: string;
            /**
             * Ready to ship status
             */
            ready_to_ship: boolean;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            order: {
                /**
                 * Order ID
                 */
                id: string;
                /**
                 * Order scoped ID
                 */
                scoped_id: string;
                /**
                 * Customer PO number
                 */
                customer_po_number: string;
                /**
                 * Draft status
                 */
                draft: boolean;
                /**
                 * Quote flag
                 */
                quote: boolean;
            };
            status: {
                /**
                 * Status ID
                 */
                id: string;
                /**
                 * Status role
                 */
                role: string;
                /**
                 * Status type
                 */
                type: string;
                /**
                 * Status label
                 */
                label: string;
                /**
                 * Customer-facing status label
                 */
                customer_label: string;
                /**
                 * Status color
                 */
                color: string;
            };
            shipping_type: {
                /**
                 * Shipping type ID
                 */
                id: string;
                /**
                 * Shipping type name
                 */
                name: string;
            };
            shipping_address: {
                /**
                 * Address ID
                 */
                id: string;
                /**
                 * Address label
                 */
                label: string;
                /**
                 * Full address
                 */
                address: string;
            };
            /**
             * Type discriminator for shipment search hits
             */
            global_search_type: 'shipment';
        } | {
            /**
             * Purchase order unique identifier
             */
            id: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted purchase order identifier
             */
            scoped_id: string;
            /**
             * Assigned user IDs
             */
            assigned_users: Array<string>;
            /**
             * Issue date
             */
            issue_date: string;
            /**
             * Due date
             */
            due_date: string;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated total
             */
            calc_total: number;
            vendor: {
                /**
                 * Vendor ID
                 */
                id: string;
                /**
                 * Vendor name
                 */
                name: string;
                /**
                 * Team ID
                 */
                team_id: number;
                /**
                 * Vendor deletion status
                 */
                deleted: boolean;
                /**
                 * Vendor account number
                 */
                account_number: string;
                /**
                 * Vendor website
                 */
                website: string;
            };
            warehouse: {
                /**
                 * Warehouse ID
                 */
                id: string;
                /**
                 * Warehouse label
                 */
                label: string;
                /**
                 * Warehouse address
                 */
                address: string;
            };
            status: {
                id: string;
                role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                label: string;
                customer_label: string;
                color: string;
                position: number;
                trashed: boolean;
                pipeline_id?: string;
            };
            /**
             * Type discriminator for purchase order search hits
             */
            global_search_type: 'purchase_order';
        } | {
            /**
             * Customer unique identifier
             */
            id: string;
            /**
             * Customer name
             */
            name: string;
            /**
             * Total ordered amount
             */
            ordered_amount: number;
            /**
             * Total quote amount
             */
            quote_amount: number;
            /**
             * Total unpaid amount
             */
            unpaid_amount: number;
            /**
             * Total deposit due amount
             */
            deposit_due_amount: number;
            /**
             * Total overdue amount
             */
            overdue_amount: number;
            /**
             * Customer portal display hash ID
             */
            customer_portal_display_hash_id: string;
            /**
             * Type discriminator for customer search hits
             */
            global_search_type: 'customer';
        } | {
            /**
             * Vendor unique identifier
             */
            id: string;
            /**
             * Vendor name
             */
            name: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Vendor account number
             */
            account_number: string;
            /**
             * Vendor website
             */
            website: string;
            /**
             * Type discriminator for vendor search hits
             */
            global_search_type: 'vendor';
        } | {
            /**
             * Type discriminator for product search hits
             */
            global_search_type: 'product';
            /**
             * Product source type
             */
            type: 'custom' | 'db_catalog' | 'db_catalog_style';
            /**
             * Product type classification
             */
            product_type: 'simple' | 'variant' | 'SSActivewear' | 'SanMar' | 'AlphaBroder' | 'tsf' | 'conde';
            /**
             * Product unique identifier
             */
            id: string;
            /**
             * Product name
             */
            name: string;
            /**
             * Product brand
             */
            brand: string;
            /**
             * Product style name
             */
            style_name: string;
        } | {
            /**
             * Type discriminator for invoice search hits
             */
            global_search_type: 'invoice';
            /**
             * Invoice unique identifier
             */
            id: string;
            /**
             * Formatted invoice identifier
             */
            scoped_id: string;
            /**
             * Amount paid
             */
            paid_amount: number;
            /**
             * Payment completion status
             */
            is_paid: boolean;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated discount
             */
            calc_discount: number;
            /**
             * Calculated total
             */
            calc_total: number;
            customer: {
                /**
                 * Customer name
                 */
                name: string;
                /**
                 * Customer ID
                 */
                id: string;
            };
            order: {
                /**
                 * Order ID
                 */
                id: string;
                /**
                 * Order scoped ID
                 */
                scoped_id: string;
                /**
                 * Customer PO number
                 */
                customer_po_number: string;
                /**
                 * Quote flag
                 */
                quote: boolean;
            };
            shipping_address: {
                /**
                 * Address ID
                 */
                id: string;
                /**
                 * Address label
                 */
                label: string;
                /**
                 * Full address
                 */
                address: string;
            };
        } | {
            /**
             * Type discriminator for tag search hits
             */
            global_search_type: 'tag';
            /**
             * Tag unique identifier
             */
            id: string;
            /**
             * Tag name
             */
            name: string;
        })>;
        pagination?: {
            /**
             * Number of items on current page
             */
            count: number;
            /**
             * Current page number
             */
            currentPage: number;
            links: {
                /**
                 * Next page URL
                 */
                next?: string;
                /**
                 * Previous page URL
                 */
                prev: string;
            };
            /**
             * Items per page
             */
            perPage: number;
            /**
             * Total number of items
             */
            total: number;
            /**
             * Total number of pages
             */
            totalPages: number;
        };
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Indicates if the request was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/v1/api/store/{team_slug}/global/search',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Search sales orders
     * Searches specifically for sales orders (quote: false is automatically added)
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Successful response
     * @throws ApiError
     */
    public static salesOrderSearch(
        teamSlug: string,
        requestBody: {
            /**
             * Search query string
             */
            name: string;
        },
    ): CancelablePromise<{
        /**
         * Array of order search hits
         */
        data: Array<{
            /**
             * Order unique identifier
             */
            id: string;
            /**
             * Order name
             */
            name: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted order identifier
             */
            scoped_id: string;
            /**
             * Quote flag
             */
            quote: boolean;
            /**
             * Customer PO number
             */
            customer_po_number: string;
            /**
             * Issue date
             */
            issue_date: string;
            /**
             * Start date
             */
            start_date: string;
            /**
             * Due date
             */
            due_date: string;
            /**
             * Customer due date
             */
            cust_due_date: string;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated discount
             */
            calc_discount: number;
            /**
             * Calculated total
             */
            calc_total: number;
            /**
             * Calculated deposit total
             */
            calc_deposit_total: number;
            /**
             * Paid amount
             */
            paid_amount: number;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            warehouse: {
                /**
                 * Warehouse ID
                 */
                id: string;
                /**
                 * Warehouse label
                 */
                label: string;
                /**
                 * Warehouse address
                 */
                address: string;
            };
            status: {
                id: string;
                role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                label: string;
                customer_label: string;
                color: string;
                position: number;
                trashed: boolean;
                pipeline_id?: string;
            };
            /**
             * Draft status
             */
            draft: boolean;
            /**
             * Type discriminator for order search hits
             */
            global_search_type: 'order';
            /**
             * Order version
             */
            version: number;
        }>;
        pagination?: {
            /**
             * Number of items on current page
             */
            count: number;
            /**
             * Current page number
             */
            currentPage: number;
            links: {
                /**
                 * Next page URL
                 */
                next?: string;
                /**
                 * Previous page URL
                 */
                prev: string;
            };
            /**
             * Items per page
             */
            perPage: number;
            /**
             * Total number of items
             */
            total: number;
            /**
             * Total number of pages
             */
            totalPages: number;
        };
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Indicates if the request was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/v1/api/store/{team_slug}/sales_order/search',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Search customers
     * Searches for customers with detailed financial information
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Successful response
     * @throws ApiError
     */
    public static customerSearch(
        teamSlug: string,
        requestBody: {
            /**
             * Search query string
             */
            name: string;
        },
    ): CancelablePromise<{
        /**
         * Array of search hits
         */
        data: Array<({
            /**
             * Type discriminator for job search hits
             */
            global_search_type: 'job';
            /**
             * Job unique identifier
             */
            id: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted job identifier
             */
            scoped_id: string;
            /**
             * Job name
             */
            name: string;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            order: {
                /**
                 * Order ID
                 */
                id: string;
                /**
                 * Order scoped ID
                 */
                scoped_id: string;
                /**
                 * Customer PO number
                 */
                customer_po_number: string;
                /**
                 * Draft status
                 */
                draft: boolean;
                /**
                 * Quote flag
                 */
                quote: boolean;
            };
            /**
             * Media attachments
             */
            media: Array<{
                /**
                 * Media ID
                 */
                id: string;
                /**
                 * Media name
                 */
                name: string;
                /**
                 * File name
                 */
                file_name: string;
            }>;
            status: {
                /**
                 * Status ID
                 */
                id: string;
                /**
                 * Status role
                 */
                role: string;
                /**
                 * Status type
                 */
                type: string;
                /**
                 * Status label
                 */
                label: string;
                /**
                 * Customer-facing status label
                 */
                customer_label: string;
                /**
                 * Status color
                 */
                color: string;
            };
        } | {
            /**
             * Order unique identifier
             */
            id: string;
            /**
             * Order name
             */
            name: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted order identifier
             */
            scoped_id: string;
            /**
             * Quote flag
             */
            quote: boolean;
            /**
             * Customer PO number
             */
            customer_po_number: string;
            /**
             * Issue date
             */
            issue_date: string;
            /**
             * Start date
             */
            start_date: string;
            /**
             * Due date
             */
            due_date: string;
            /**
             * Customer due date
             */
            cust_due_date: string;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated discount
             */
            calc_discount: number;
            /**
             * Calculated total
             */
            calc_total: number;
            /**
             * Calculated deposit total
             */
            calc_deposit_total: number;
            /**
             * Paid amount
             */
            paid_amount: number;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            warehouse: {
                /**
                 * Warehouse ID
                 */
                id: string;
                /**
                 * Warehouse label
                 */
                label: string;
                /**
                 * Warehouse address
                 */
                address: string;
            };
            status: {
                id: string;
                role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                label: string;
                customer_label: string;
                color: string;
                position: number;
                trashed: boolean;
                pipeline_id?: string;
            };
            /**
             * Draft status
             */
            draft: boolean;
            /**
             * Type discriminator for order search hits
             */
            global_search_type: 'order';
            /**
             * Order version
             */
            version: number;
        } | {
            /**
             * Shipment unique identifier
             */
            id: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted shipment identifier
             */
            scoped_id: string;
            /**
             * Ready to ship status
             */
            ready_to_ship: boolean;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            order: {
                /**
                 * Order ID
                 */
                id: string;
                /**
                 * Order scoped ID
                 */
                scoped_id: string;
                /**
                 * Customer PO number
                 */
                customer_po_number: string;
                /**
                 * Draft status
                 */
                draft: boolean;
                /**
                 * Quote flag
                 */
                quote: boolean;
            };
            status: {
                /**
                 * Status ID
                 */
                id: string;
                /**
                 * Status role
                 */
                role: string;
                /**
                 * Status type
                 */
                type: string;
                /**
                 * Status label
                 */
                label: string;
                /**
                 * Customer-facing status label
                 */
                customer_label: string;
                /**
                 * Status color
                 */
                color: string;
            };
            shipping_type: {
                /**
                 * Shipping type ID
                 */
                id: string;
                /**
                 * Shipping type name
                 */
                name: string;
            };
            shipping_address: {
                /**
                 * Address ID
                 */
                id: string;
                /**
                 * Address label
                 */
                label: string;
                /**
                 * Full address
                 */
                address: string;
            };
            /**
             * Type discriminator for shipment search hits
             */
            global_search_type: 'shipment';
        } | {
            /**
             * Purchase order unique identifier
             */
            id: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted purchase order identifier
             */
            scoped_id: string;
            /**
             * Assigned user IDs
             */
            assigned_users: Array<string>;
            /**
             * Issue date
             */
            issue_date: string;
            /**
             * Due date
             */
            due_date: string;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated total
             */
            calc_total: number;
            vendor: {
                /**
                 * Vendor ID
                 */
                id: string;
                /**
                 * Vendor name
                 */
                name: string;
                /**
                 * Team ID
                 */
                team_id: number;
                /**
                 * Vendor deletion status
                 */
                deleted: boolean;
                /**
                 * Vendor account number
                 */
                account_number: string;
                /**
                 * Vendor website
                 */
                website: string;
            };
            warehouse: {
                /**
                 * Warehouse ID
                 */
                id: string;
                /**
                 * Warehouse label
                 */
                label: string;
                /**
                 * Warehouse address
                 */
                address: string;
            };
            status: {
                id: string;
                role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                label: string;
                customer_label: string;
                color: string;
                position: number;
                trashed: boolean;
                pipeline_id?: string;
            };
            /**
             * Type discriminator for purchase order search hits
             */
            global_search_type: 'purchase_order';
        } | {
            /**
             * Customer unique identifier
             */
            id: string;
            /**
             * Customer name
             */
            name: string;
            /**
             * Total ordered amount
             */
            ordered_amount: number;
            /**
             * Total quote amount
             */
            quote_amount: number;
            /**
             * Total unpaid amount
             */
            unpaid_amount: number;
            /**
             * Total deposit due amount
             */
            deposit_due_amount: number;
            /**
             * Total overdue amount
             */
            overdue_amount: number;
            /**
             * Customer portal display hash ID
             */
            customer_portal_display_hash_id: string;
            /**
             * Type discriminator for customer search hits
             */
            global_search_type: 'customer';
        } | {
            /**
             * Vendor unique identifier
             */
            id: string;
            /**
             * Vendor name
             */
            name: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Vendor account number
             */
            account_number: string;
            /**
             * Vendor website
             */
            website: string;
            /**
             * Type discriminator for vendor search hits
             */
            global_search_type: 'vendor';
        } | {
            /**
             * Type discriminator for product search hits
             */
            global_search_type: 'product';
            /**
             * Product source type
             */
            type: 'custom' | 'db_catalog' | 'db_catalog_style';
            /**
             * Product type classification
             */
            product_type: 'simple' | 'variant' | 'SSActivewear' | 'SanMar' | 'AlphaBroder' | 'tsf' | 'conde';
            /**
             * Product unique identifier
             */
            id: string;
            /**
             * Product name
             */
            name: string;
            /**
             * Product brand
             */
            brand: string;
            /**
             * Product style name
             */
            style_name: string;
        } | {
            /**
             * Type discriminator for invoice search hits
             */
            global_search_type: 'invoice';
            /**
             * Invoice unique identifier
             */
            id: string;
            /**
             * Formatted invoice identifier
             */
            scoped_id: string;
            /**
             * Amount paid
             */
            paid_amount: number;
            /**
             * Payment completion status
             */
            is_paid: boolean;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated discount
             */
            calc_discount: number;
            /**
             * Calculated total
             */
            calc_total: number;
            customer: {
                /**
                 * Customer name
                 */
                name: string;
                /**
                 * Customer ID
                 */
                id: string;
            };
            order: {
                /**
                 * Order ID
                 */
                id: string;
                /**
                 * Order scoped ID
                 */
                scoped_id: string;
                /**
                 * Customer PO number
                 */
                customer_po_number: string;
                /**
                 * Quote flag
                 */
                quote: boolean;
            };
            shipping_address: {
                /**
                 * Address ID
                 */
                id: string;
                /**
                 * Address label
                 */
                label: string;
                /**
                 * Full address
                 */
                address: string;
            };
        } | {
            /**
             * Type discriminator for tag search hits
             */
            global_search_type: 'tag';
            /**
             * Tag unique identifier
             */
            id: string;
            /**
             * Tag name
             */
            name: string;
        })>;
        pagination?: {
            /**
             * Number of items on current page
             */
            count: number;
            /**
             * Current page number
             */
            currentPage: number;
            links: {
                /**
                 * Next page URL
                 */
                next?: string;
                /**
                 * Previous page URL
                 */
                prev: string;
            };
            /**
             * Items per page
             */
            perPage: number;
            /**
             * Total number of items
             */
            total: number;
            /**
             * Total number of pages
             */
            totalPages: number;
        };
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Indicates if the request was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/v1/api/store/{team_slug}/customer/search',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Search products
     * Searches for products across different product types
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Successful response
     * @throws ApiError
     */
    public static productSearch(
        teamSlug: string,
        requestBody: {
            /**
             * Search query string
             */
            name: string;
        },
    ): CancelablePromise<{
        /**
         * Array of search hits
         */
        data: Array<({
            /**
             * Type discriminator for job search hits
             */
            global_search_type: 'job';
            /**
             * Job unique identifier
             */
            id: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted job identifier
             */
            scoped_id: string;
            /**
             * Job name
             */
            name: string;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            order: {
                /**
                 * Order ID
                 */
                id: string;
                /**
                 * Order scoped ID
                 */
                scoped_id: string;
                /**
                 * Customer PO number
                 */
                customer_po_number: string;
                /**
                 * Draft status
                 */
                draft: boolean;
                /**
                 * Quote flag
                 */
                quote: boolean;
            };
            /**
             * Media attachments
             */
            media: Array<{
                /**
                 * Media ID
                 */
                id: string;
                /**
                 * Media name
                 */
                name: string;
                /**
                 * File name
                 */
                file_name: string;
            }>;
            status: {
                /**
                 * Status ID
                 */
                id: string;
                /**
                 * Status role
                 */
                role: string;
                /**
                 * Status type
                 */
                type: string;
                /**
                 * Status label
                 */
                label: string;
                /**
                 * Customer-facing status label
                 */
                customer_label: string;
                /**
                 * Status color
                 */
                color: string;
            };
        } | {
            /**
             * Order unique identifier
             */
            id: string;
            /**
             * Order name
             */
            name: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted order identifier
             */
            scoped_id: string;
            /**
             * Quote flag
             */
            quote: boolean;
            /**
             * Customer PO number
             */
            customer_po_number: string;
            /**
             * Issue date
             */
            issue_date: string;
            /**
             * Start date
             */
            start_date: string;
            /**
             * Due date
             */
            due_date: string;
            /**
             * Customer due date
             */
            cust_due_date: string;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated discount
             */
            calc_discount: number;
            /**
             * Calculated total
             */
            calc_total: number;
            /**
             * Calculated deposit total
             */
            calc_deposit_total: number;
            /**
             * Paid amount
             */
            paid_amount: number;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            warehouse: {
                /**
                 * Warehouse ID
                 */
                id: string;
                /**
                 * Warehouse label
                 */
                label: string;
                /**
                 * Warehouse address
                 */
                address: string;
            };
            status: {
                id: string;
                role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                label: string;
                customer_label: string;
                color: string;
                position: number;
                trashed: boolean;
                pipeline_id?: string;
            };
            /**
             * Draft status
             */
            draft: boolean;
            /**
             * Type discriminator for order search hits
             */
            global_search_type: 'order';
            /**
             * Order version
             */
            version: number;
        } | {
            /**
             * Shipment unique identifier
             */
            id: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted shipment identifier
             */
            scoped_id: string;
            /**
             * Ready to ship status
             */
            ready_to_ship: boolean;
            customer: {
                /**
                 * Customer ID
                 */
                id: string;
                /**
                 * Customer name
                 */
                name: string;
            };
            order: {
                /**
                 * Order ID
                 */
                id: string;
                /**
                 * Order scoped ID
                 */
                scoped_id: string;
                /**
                 * Customer PO number
                 */
                customer_po_number: string;
                /**
                 * Draft status
                 */
                draft: boolean;
                /**
                 * Quote flag
                 */
                quote: boolean;
            };
            status: {
                /**
                 * Status ID
                 */
                id: string;
                /**
                 * Status role
                 */
                role: string;
                /**
                 * Status type
                 */
                type: string;
                /**
                 * Status label
                 */
                label: string;
                /**
                 * Customer-facing status label
                 */
                customer_label: string;
                /**
                 * Status color
                 */
                color: string;
            };
            shipping_type: {
                /**
                 * Shipping type ID
                 */
                id: string;
                /**
                 * Shipping type name
                 */
                name: string;
            };
            shipping_address: {
                /**
                 * Address ID
                 */
                id: string;
                /**
                 * Address label
                 */
                label: string;
                /**
                 * Full address
                 */
                address: string;
            };
            /**
             * Type discriminator for shipment search hits
             */
            global_search_type: 'shipment';
        } | {
            /**
             * Purchase order unique identifier
             */
            id: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Formatted purchase order identifier
             */
            scoped_id: string;
            /**
             * Assigned user IDs
             */
            assigned_users: Array<string>;
            /**
             * Issue date
             */
            issue_date: string;
            /**
             * Due date
             */
            due_date: string;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated total
             */
            calc_total: number;
            vendor: {
                /**
                 * Vendor ID
                 */
                id: string;
                /**
                 * Vendor name
                 */
                name: string;
                /**
                 * Team ID
                 */
                team_id: number;
                /**
                 * Vendor deletion status
                 */
                deleted: boolean;
                /**
                 * Vendor account number
                 */
                account_number: string;
                /**
                 * Vendor website
                 */
                website: string;
            };
            warehouse: {
                /**
                 * Warehouse ID
                 */
                id: string;
                /**
                 * Warehouse label
                 */
                label: string;
                /**
                 * Warehouse address
                 */
                address: string;
            };
            status: {
                id: string;
                role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                label: string;
                customer_label: string;
                color: string;
                position: number;
                trashed: boolean;
                pipeline_id?: string;
            };
            /**
             * Type discriminator for purchase order search hits
             */
            global_search_type: 'purchase_order';
        } | {
            /**
             * Customer unique identifier
             */
            id: string;
            /**
             * Customer name
             */
            name: string;
            /**
             * Total ordered amount
             */
            ordered_amount: number;
            /**
             * Total quote amount
             */
            quote_amount: number;
            /**
             * Total unpaid amount
             */
            unpaid_amount: number;
            /**
             * Total deposit due amount
             */
            deposit_due_amount: number;
            /**
             * Total overdue amount
             */
            overdue_amount: number;
            /**
             * Customer portal display hash ID
             */
            customer_portal_display_hash_id: string;
            /**
             * Type discriminator for customer search hits
             */
            global_search_type: 'customer';
        } | {
            /**
             * Vendor unique identifier
             */
            id: string;
            /**
             * Vendor name
             */
            name: string;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Vendor account number
             */
            account_number: string;
            /**
             * Vendor website
             */
            website: string;
            /**
             * Type discriminator for vendor search hits
             */
            global_search_type: 'vendor';
        } | {
            /**
             * Type discriminator for product search hits
             */
            global_search_type: 'product';
            /**
             * Product source type
             */
            type: 'custom' | 'db_catalog' | 'db_catalog_style';
            /**
             * Product type classification
             */
            product_type: 'simple' | 'variant' | 'SSActivewear' | 'SanMar' | 'AlphaBroder' | 'tsf' | 'conde';
            /**
             * Product unique identifier
             */
            id: string;
            /**
             * Product name
             */
            name: string;
            /**
             * Product brand
             */
            brand: string;
            /**
             * Product style name
             */
            style_name: string;
        } | {
            /**
             * Type discriminator for invoice search hits
             */
            global_search_type: 'invoice';
            /**
             * Invoice unique identifier
             */
            id: string;
            /**
             * Formatted invoice identifier
             */
            scoped_id: string;
            /**
             * Amount paid
             */
            paid_amount: number;
            /**
             * Payment completion status
             */
            is_paid: boolean;
            /**
             * Deletion status
             */
            deleted: boolean;
            /**
             * Calculated subtotal
             */
            calc_subtotal: number;
            /**
             * Calculated tax
             */
            calc_tax: number;
            /**
             * Calculated discount
             */
            calc_discount: number;
            /**
             * Calculated total
             */
            calc_total: number;
            customer: {
                /**
                 * Customer name
                 */
                name: string;
                /**
                 * Customer ID
                 */
                id: string;
            };
            order: {
                /**
                 * Order ID
                 */
                id: string;
                /**
                 * Order scoped ID
                 */
                scoped_id: string;
                /**
                 * Customer PO number
                 */
                customer_po_number: string;
                /**
                 * Quote flag
                 */
                quote: boolean;
            };
            shipping_address: {
                /**
                 * Address ID
                 */
                id: string;
                /**
                 * Address label
                 */
                label: string;
                /**
                 * Full address
                 */
                address: string;
            };
        } | {
            /**
             * Type discriminator for tag search hits
             */
            global_search_type: 'tag';
            /**
             * Tag unique identifier
             */
            id: string;
            /**
             * Tag name
             */
            name: string;
        })>;
        pagination?: {
            /**
             * Number of items on current page
             */
            count: number;
            /**
             * Current page number
             */
            currentPage: number;
            links: {
                /**
                 * Next page URL
                 */
                next?: string;
                /**
                 * Previous page URL
                 */
                prev: string;
            };
            /**
             * Items per page
             */
            perPage: number;
            /**
             * Total number of items
             */
            total: number;
            /**
             * Total number of pages
             */
            totalPages: number;
        };
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Indicates if the request was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/v1/api/store/{team_slug}/product_list_search',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
}
