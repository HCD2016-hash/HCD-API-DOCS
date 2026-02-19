/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class CustomerAddressService {
    /**
     * List customer addresses
     * Retrieve all addresses for a specific customer
     * @param teamSlug Team slug identifier
     * @param customerId Customer identifier
     * @returns any List of customer addresses
     * @throws ApiError
     */
    public static getCustomerAddressList(
        teamSlug: string,
        customerId: string,
    ): CancelablePromise<{
        data: Array<{
            id: string;
            customer_id: string;
            label: string;
            address1: string;
            address2: string;
            city: string;
            state: string;
            state_code: string;
            country: string;
            country_code: string;
            postcode: string;
            role: 'shipping' | 'billing' | 'store_location';
            note: string;
            is_primary: boolean;
            is_default_warehouse: boolean;
            hold_stock: boolean;
            nexus: boolean;
            postal_can_validate: boolean;
            postal_validated: boolean;
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
            url: '/v1/api/store/{team_slug}/customer/{customer_id}/address',
            path: {
                'team_slug': teamSlug,
                'customer_id': customerId,
            },
        });
    }
    /**
     * Create new customer address
     * Create a new address for a customer
     * @param teamSlug Team slug identifier
     * @param customerId Customer identifier
     * @param requestBody
     * @returns any Successfully created customer address
     * @throws ApiError
     */
    public static createCustomerAddress(
        teamSlug: string,
        customerId: string,
        requestBody: {
            label: string;
            address1: string;
            address2?: string;
            city?: string;
            state_code?: string;
            country_code: string;
            postcode?: string;
            role: 'shipping' | 'billing' | 'store_location';
            note?: string;
            is_primary: boolean;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            customer_id: string;
            label: string;
            address1: string;
            address2: string;
            city: string;
            state: string;
            state_code: string;
            country: string;
            country_code: string;
            postcode: string;
            role: 'shipping' | 'billing' | 'store_location';
            note: string;
            is_primary: boolean;
            is_default_warehouse: boolean;
            hold_stock: boolean;
            nexus: boolean;
            postal_can_validate: boolean;
            postal_validated: boolean;
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
            url: '/v1/api/store/{team_slug}/customer/{customer_id}/address',
            path: {
                'team_slug': teamSlug,
                'customer_id': customerId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get single customer address
     * Retrieves a specific customer address by ID
     * @param teamSlug Team slug identifier
     * @param customerId Customer identifier
     * @param id Resource ID
     * @returns any Customer address details
     * @throws ApiError
     */
    public static getCustomerAddress(
        teamSlug: string,
        customerId: string,
        id: string,
    ): CancelablePromise<{
        data: {
            id: string;
            customer_id: string;
            label: string;
            address1: string;
            address2: string;
            city: string;
            state: string;
            state_code: string;
            country: string;
            country_code: string;
            postcode: string;
            role: 'shipping' | 'billing' | 'store_location';
            note: string;
            is_primary: boolean;
            is_default_warehouse: boolean;
            hold_stock: boolean;
            nexus: boolean;
            postal_can_validate: boolean;
            postal_validated: boolean;
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
            method: 'GET',
            url: '/v1/api/store/{team_slug}/customer/{customer_id}/address/{id}',
            path: {
                'team_slug': teamSlug,
                'customer_id': customerId,
                'id': id,
            },
        });
    }
    /**
     * Update customer address
     * Update an existing customer address
     * @param teamSlug Team slug identifier
     * @param customerId Customer identifier
     * @param id Resource ID
     * @param requestBody
     * @returns any Successfully updated customer address
     * @throws ApiError
     */
    public static updateCustomerAddress(
        teamSlug: string,
        customerId: string,
        id: string,
        requestBody: {
            label?: string;
            address1?: string;
            address2?: string;
            city?: string;
            state_code?: string;
            country_code?: string;
            postcode?: string;
            note?: string;
            is_primary?: boolean;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            customer_id: string;
            label: string;
            address1: string;
            address2: string;
            city: string;
            state: string;
            state_code: string;
            country: string;
            country_code: string;
            postcode: string;
            role: 'shipping' | 'billing' | 'store_location';
            note: string;
            is_primary: boolean;
            is_default_warehouse: boolean;
            hold_stock: boolean;
            nexus: boolean;
            postal_can_validate: boolean;
            postal_validated: boolean;
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
            url: '/v1/api/store/{team_slug}/customer/{customer_id}/address/{id}',
            path: {
                'team_slug': teamSlug,
                'customer_id': customerId,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Remove customer address
     * Delete a customer address
     * @param teamSlug Team slug identifier
     * @param customerId Customer identifier
     * @param id Resource ID
     * @returns any Successfully removed customer address
     * @throws ApiError
     */
    public static removeCustomerAddress(
        teamSlug: string,
        customerId: string,
        id: string,
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
            url: '/v1/api/store/{team_slug}/customer/{customer_id}/address/{id}',
            path: {
                'team_slug': teamSlug,
                'customer_id': customerId,
                'id': id,
            },
        });
    }
    /**
     * Set primary customer address
     * Mark a customer address as primary
     * @param teamSlug Team slug identifier
     * @param customerId Customer identifier
     * @param id Resource ID
     * @returns any Successfully set address as primary
     * @throws ApiError
     */
    public static setCustomerAddressPrimary(
        teamSlug: string,
        customerId: string,
        id: string,
    ): CancelablePromise<{
        data: {
            id: string;
            customer_id: string;
            label: string;
            address1: string;
            address2: string;
            city: string;
            state: string;
            state_code: string;
            country: string;
            country_code: string;
            postcode: string;
            role: 'shipping' | 'billing' | 'store_location';
            note: string;
            is_primary: boolean;
            is_default_warehouse: boolean;
            hold_stock: boolean;
            nexus: boolean;
            postal_can_validate: boolean;
            postal_validated: boolean;
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
            url: '/v1/api/store/{team_slug}/customer/{customer_id}/address/{id}/primary',
            path: {
                'team_slug': teamSlug,
                'customer_id': customerId,
                'id': id,
            },
        });
    }
}
