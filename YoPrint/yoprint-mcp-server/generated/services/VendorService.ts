/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class VendorService {
    /**
     * Get list of vendors
     * Returns paginated vendor records with contact information
     * @param teamSlug Team slug identifier
     * @param page Page number (1-based)
     * @returns any Successful response
     * @throws ApiError
     */
    public static getVendorList(
        teamSlug: string,
        page: number,
    ): CancelablePromise<{
        /**
         * Array of vendor objects
         */
        data: Array<{
            /**
             * Unique vendor identifier
             */
            id: string;
            /**
             * Vendor account number
             */
            account_number: string;
            /**
             * Array of associated contact objects
             */
            contacts?: Array<{
                id: string;
                customer_id?: string | null;
                vendor_id?: string | null;
                first_name: string;
                last_name: string;
                email: string;
                phone: string;
                phone_country: string;
                fax: string;
                fax_country: string;
                is_primary: boolean;
                default_receive_sms: boolean;
                trashed: boolean;
            }>;
            /**
             * Default note for vendor
             */
            default_vendor_note?: string;
            /**
             * Internal notes about vendor
             */
            internal_notes?: string;
            /**
             * Vendor name
             */
            name: string;
            /**
             * Soft delete status
             */
            trashed?: boolean;
            /**
             * Vendor website URL
             */
            website: string;
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
            method: 'GET',
            url: '/v1/api/store/{team_slug}/vendor',
            path: {
                'team_slug': teamSlug,
            },
            query: {
                'page': page,
            },
        });
    }
    /**
     * Create vendor
     * Creates vendor with contacts and returns created record
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Successful response
     * @throws ApiError
     */
    public static createVendor(
        teamSlug: string,
        requestBody: {
            /**
             * Vendor name
             */
            name: string;
            /**
             * Vendor website URL
             */
            website: (string | null);
            /**
             * Vendor account number
             */
            account_number: (string | null);
            /**
             * Internal notes about vendor
             */
            internal_notes: (string | null);
            /**
             * Default note for vendor
             */
            default_vendor_note: (string | null);
            /**
             * Array of contact creation requests or null values
             */
            contact: Array<({
                vendor_id?: string;
                first_name: (string | null);
                last_name?: (string | null);
                email?: (string | null);
                phone?: (string | null);
                phone_country?: (string | null);
                fax?: (string | null);
                fax_country?: (string | null);
                send_invoice: boolean;
                is_primary: boolean;
                default_receive_sms: boolean;
            } | null)>;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique vendor identifier
             */
            id: string;
            /**
             * Vendor account number
             */
            account_number: string;
            /**
             * Array of associated contact objects
             */
            contacts?: Array<{
                id: string;
                customer_id?: string | null;
                vendor_id?: string | null;
                first_name: string;
                last_name: string;
                email: string;
                phone: string;
                phone_country: string;
                fax: string;
                fax_country: string;
                is_primary: boolean;
                default_receive_sms: boolean;
                trashed: boolean;
            }>;
            /**
             * Default note for vendor
             */
            default_vendor_note?: string;
            /**
             * Internal notes about vendor
             */
            internal_notes?: string;
            /**
             * Vendor name
             */
            name: string;
            /**
             * Soft delete status
             */
            trashed?: boolean;
            /**
             * Vendor website URL
             */
            website: string;
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
            url: '/v1/api/store/{team_slug}/vendor',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get one vendor entity
     * Returns vendor details including soft-deleted records
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any Successful response
     * @throws ApiError
     */
    public static getVendor(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: {
            /**
             * Unique vendor identifier
             */
            id: string;
            /**
             * Vendor account number
             */
            account_number: string;
            /**
             * Array of associated contact objects
             */
            contacts?: Array<{
                id: string;
                customer_id?: string | null;
                vendor_id?: string | null;
                first_name: string;
                last_name: string;
                email: string;
                phone: string;
                phone_country: string;
                fax: string;
                fax_country: string;
                is_primary: boolean;
                default_receive_sms: boolean;
                trashed: boolean;
            }>;
            /**
             * Default note for vendor
             */
            default_vendor_note?: string;
            /**
             * Internal notes about vendor
             */
            internal_notes?: string;
            /**
             * Vendor name
             */
            name: string;
            /**
             * Soft delete status
             */
            trashed?: boolean;
            /**
             * Vendor website URL
             */
            website: string;
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
            method: 'GET',
            url: '/v1/api/store/{team_slug}/vendor/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Update vendor
     * Updates vendor fields and returns updated record
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @param requestBody
     * @returns any Successful response
     * @throws ApiError
     */
    public static updateVendor(
        teamSlug: string,
        id: string,
        requestBody: {
            /**
             * Vendor name
             */
            name?: string;
            /**
             * Vendor website URL
             */
            website?: string;
            /**
             * Vendor account number
             */
            account_number?: string;
            /**
             * Internal notes about vendor
             */
            internal_notes?: string;
            /**
             * Default note for vendor
             */
            default_vendor_note?: string;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique vendor identifier
             */
            id: string;
            /**
             * Vendor account number
             */
            account_number: string;
            /**
             * Array of associated contact objects
             */
            contacts?: Array<{
                id: string;
                customer_id?: string | null;
                vendor_id?: string | null;
                first_name: string;
                last_name: string;
                email: string;
                phone: string;
                phone_country: string;
                fax: string;
                fax_country: string;
                is_primary: boolean;
                default_receive_sms: boolean;
                trashed: boolean;
            }>;
            /**
             * Default note for vendor
             */
            default_vendor_note?: string;
            /**
             * Internal notes about vendor
             */
            internal_notes?: string;
            /**
             * Vendor name
             */
            name: string;
            /**
             * Soft delete status
             */
            trashed?: boolean;
            /**
             * Vendor website URL
             */
            website: string;
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
            method: 'PUT',
            url: '/v1/api/store/{team_slug}/vendor/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Delete vendor
     * Soft-deletes vendor record (recoverable)
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any Successful response
     * @throws ApiError
     */
    public static deleteVendor(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        /**
         * No data returned for delete operation
         */
        data: null;
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Indicates if the deletion was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'DELETE',
            url: '/v1/api/store/{team_slug}/vendor/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
}
