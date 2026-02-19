/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class ContactService {
    /**
     * Get contacts for customer
     * Retrieves a list of contacts associated with a specific customer
     * @param teamSlug Team slug identifier
     * @param customerId Customer identifier
     * @returns any List of contacts for the customer
     * @throws ApiError
     */
    public static getContactListForCustomer(
        teamSlug: string,
        customerId: string,
    ): CancelablePromise<{
        data: Array<{
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
        pagination?: Record<string, any>;
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Whether the request was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'GET',
            url: '/v1/api/store/{team_slug}/customer/{customerId}/contact',
            path: {
                'team_slug': teamSlug,
                'customerId': customerId,
            },
        });
    }
    /**
     * Create contact for customer
     * Creates a new contact for a specific customer
     * @param teamSlug Team slug identifier
     * @param customerId Customer identifier
     * @param requestBody
     * @returns any Contact created successfully
     * @throws ApiError
     */
    public static createContactForCustomer(
        teamSlug: string,
        customerId: string,
        requestBody: {
            customer_id: string;
            first_name: string;
            last_name?: string;
            email?: string;
            phone?: string;
            phone_country?: string;
            fax?: string;
            fax_country?: string;
            send_invoice: boolean;
            is_primary: boolean;
            default_receive_sms: boolean;
        },
    ): CancelablePromise<{
        data: {
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
        };
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Whether the request was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/v1/api/store/{team_slug}/customer/{customerId}/contact',
            path: {
                'team_slug': teamSlug,
                'customerId': customerId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Set primary contact for customer
     * Sets a contact as the primary contact for a specific customer
     * @param teamSlug Team slug identifier
     * @param customerId Customer identifier
     * @param contactId Contact identifier
     * @param requestBody
     * @returns any Primary contact set successfully
     * @throws ApiError
     */
    public static setPrimaryContactForCustomer(
        teamSlug: string,
        customerId: string,
        contactId: string,
        requestBody: {
            id: string;
            customer_id: string;
        },
    ): CancelablePromise<{
        data: {
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
        };
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Whether the request was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'PATCH',
            url: '/v1/api/store/{team_slug}/customer/{customerId}/contact/{contactId}/primary',
            path: {
                'team_slug': teamSlug,
                'customerId': customerId,
                'contactId': contactId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get contacts for vendor
     * Retrieves a list of contacts associated with a specific vendor
     * @param teamSlug Team slug identifier
     * @param vendorId Vendor identifier
     * @returns any List of contacts for the vendor
     * @throws ApiError
     */
    public static getContactListForVendor(
        teamSlug: string,
        vendorId: string,
    ): CancelablePromise<{
        data: Array<{
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
        pagination?: Record<string, any>;
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Whether the request was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'GET',
            url: '/v1/api/store/{team_slug}/vendor/{vendorId}/contact',
            path: {
                'team_slug': teamSlug,
                'vendorId': vendorId,
            },
        });
    }
    /**
     * Create contact for vendor
     * Creates a new contact for a specific vendor
     * @param teamSlug Team slug identifier
     * @param vendorId Vendor identifier
     * @param requestBody
     * @returns any Contact created successfully
     * @throws ApiError
     */
    public static createContactForVendor(
        teamSlug: string,
        vendorId: string,
        requestBody: {
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
        },
    ): CancelablePromise<{
        data: {
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
        };
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Whether the request was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/v1/api/store/{team_slug}/vendor/{vendorId}/contact',
            path: {
                'team_slug': teamSlug,
                'vendorId': vendorId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Set primary contact for vendor
     * Sets a contact as the primary contact for a specific vendor
     * @param teamSlug Team slug identifier
     * @param vendorId Vendor identifier
     * @param contactId Contact identifier
     * @param requestBody
     * @returns any Primary contact set successfully
     * @throws ApiError
     */
    public static setPrimaryContactForVendor(
        teamSlug: string,
        vendorId: string,
        contactId: string,
        requestBody: {
            id: string;
            vendor_id: string;
        },
    ): CancelablePromise<{
        data: {
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
        };
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Whether the request was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'PATCH',
            url: '/v1/api/store/{team_slug}/vendor/{vendorId}/contact/{contactId}/primary',
            path: {
                'team_slug': teamSlug,
                'vendorId': vendorId,
                'contactId': contactId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Update contact
     * Updates an existing contact
     * @param teamSlug Team slug identifier
     * @param contactId Contact identifier
     * @param requestBody
     * @returns any Contact updated successfully
     * @throws ApiError
     */
    public static updateContact(
        teamSlug: string,
        contactId: string,
        requestBody: {
            id: string;
            first_name?: string;
            last_name?: string;
            email?: string;
            phone?: string;
            phone_country?: string;
            fax?: string;
            fax_country?: string;
            send_invoice?: boolean;
            default_receive_sms?: boolean;
        },
    ): CancelablePromise<{
        data: {
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
        };
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Whether the request was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'PUT',
            url: '/v1/api/store/{team_slug}/contact/{contactId}',
            path: {
                'team_slug': teamSlug,
                'contactId': contactId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Remove contact
     * Deletes an existing contact
     * @param teamSlug Team slug identifier
     * @param contactId Contact identifier
     * @returns any Contact removed successfully
     * @throws ApiError
     */
    public static removeContact(
        teamSlug: string,
        contactId: string,
    ): CancelablePromise<{
        data: null;
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Whether the request was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'DELETE',
            url: '/v1/api/store/{team_slug}/contact/{contactId}',
            path: {
                'team_slug': teamSlug,
                'contactId': contactId,
            },
        });
    }
}
