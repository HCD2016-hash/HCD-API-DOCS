/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SettingCompanyLocationService {
    /**
     * Get list of company locations
     * Retrieve a list of company locations
     * @param teamSlug Team slug identifier
     * @returns any Successfully retrieved company locations
     * @throws ApiError
     */
    public static getCompanyLocations(
        teamSlug: string,
    ): CancelablePromise<{
        data: Array<{
            /**
             * Unique identifier for the company location
             */
            id: string;
            /**
             * Location label or name
             */
            label: string;
            /**
             * Primary address line
             */
            address1: string;
            /**
             * Secondary address line
             */
            address2: string;
            /**
             * City name
             */
            city: string;
            /**
             * State or province name
             */
            state: string;
            /**
             * State or province code
             */
            state_code: string;
            /**
             * Country name
             */
            country: string;
            /**
             * Country code
             */
            country_code: string;
            /**
             * Postal or ZIP code
             */
            postcode: string;
            /**
             * Address role type (always store_location for company locations)
             */
            role: 'store_location';
            /**
             * Additional notes (can be empty or null)
             */
            note: string | null;
            /**
             * Whether this is the primary location
             */
            is_primary: boolean;
            /**
             * Whether this is the default warehouse location
             */
            is_default_warehouse: boolean;
            /**
             * Whether this location can hold stock
             */
            hold_stock: boolean;
            /**
             * Whether this location has tax nexus
             */
            nexus: boolean;
            /**
             * Whether the location is marked as deleted
             */
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
            url: '/v1/api/store/{team_slug}/setting/location',
            path: {
                'team_slug': teamSlug,
            },
        });
    }
    /**
     * Create new company location
     * Create a new company location
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Successfully created company location
     * @throws ApiError
     */
    public static createCompanyLocation(
        teamSlug: string,
        requestBody: {
            /**
             * Location label or name
             */
            label: string;
            /**
             * Primary address line
             */
            address1: string;
            /**
             * Secondary address line
             */
            address2: string;
            /**
             * City name
             */
            city: string;
            /**
             * State or province name
             */
            state: string;
            /**
             * State or province code
             */
            state_code: string;
            /**
             * Country name
             */
            country: string;
            /**
             * Country code
             */
            country_code: string;
            /**
             * Postal or ZIP code
             */
            postcode: string;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the company location
             */
            id: string;
            /**
             * Location label or name
             */
            label: string;
            /**
             * Primary address line
             */
            address1: string;
            /**
             * Secondary address line
             */
            address2: string;
            /**
             * City name
             */
            city: string;
            /**
             * State or province name
             */
            state: string;
            /**
             * State or province code
             */
            state_code: string;
            /**
             * Country name
             */
            country: string;
            /**
             * Country code
             */
            country_code: string;
            /**
             * Postal or ZIP code
             */
            postcode: string;
            /**
             * Address role type (always store_location for company locations)
             */
            role: 'store_location';
            /**
             * Additional notes (can be empty or null)
             */
            note: string | null;
            /**
             * Whether this is the primary location
             */
            is_primary: boolean;
            /**
             * Whether this is the default warehouse location
             */
            is_default_warehouse: boolean;
            /**
             * Whether this location can hold stock
             */
            hold_stock: boolean;
            /**
             * Whether this location has tax nexus
             */
            nexus: boolean;
            /**
             * Whether the location is marked as deleted
             */
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
            url: '/v1/api/store/{team_slug}/setting/location',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Update company location
     * Update an existing company location or set nexus status
     * @param teamSlug Team slug identifier
     * @param id Company location ID
     * @param requestBody
     * @returns any Successfully updated company location
     * @throws ApiError
     */
    public static updateCompanyLocation(
        teamSlug: string,
        id: string,
        requestBody: ({
            /**
             * Unique identifier for the company location
             */
            id: string;
            /**
             * Location label or name
             */
            label: string;
            /**
             * Primary address line
             */
            address1: string;
            /**
             * Secondary address line
             */
            address2: string;
            /**
             * City name
             */
            city: string;
            /**
             * State or province name
             */
            state: string;
            /**
             * State or province code
             */
            state_code: string;
            /**
             * Country name
             */
            country: string;
            /**
             * Country code
             */
            country_code: string;
            /**
             * Postal or ZIP code
             */
            postcode: string;
        } | {
            /**
             * Unique identifier for the company location
             */
            id: string;
            /**
             * Location label or name
             */
            label?: string;
            /**
             * Whether this location has tax nexus
             */
            nexus: boolean;
        }),
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the company location
             */
            id: string;
            /**
             * Location label or name
             */
            label: string;
            /**
             * Primary address line
             */
            address1: string;
            /**
             * Secondary address line
             */
            address2: string;
            /**
             * City name
             */
            city: string;
            /**
             * State or province name
             */
            state: string;
            /**
             * State or province code
             */
            state_code: string;
            /**
             * Country name
             */
            country: string;
            /**
             * Country code
             */
            country_code: string;
            /**
             * Postal or ZIP code
             */
            postcode: string;
            /**
             * Address role type (always store_location for company locations)
             */
            role: 'store_location';
            /**
             * Additional notes (can be empty or null)
             */
            note: string | null;
            /**
             * Whether this is the primary location
             */
            is_primary: boolean;
            /**
             * Whether this is the default warehouse location
             */
            is_default_warehouse: boolean;
            /**
             * Whether this location can hold stock
             */
            hold_stock: boolean;
            /**
             * Whether this location has tax nexus
             */
            nexus: boolean;
            /**
             * Whether the location is marked as deleted
             */
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
            url: '/v1/api/store/{team_slug}/setting/location/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Delete company location
     * Delete an existing company location. Note: Locations marked as primary or default warehouse cannot be deleted.
     * @param teamSlug Team slug identifier
     * @param id Company location ID
     * @returns any Successfully deleted company location
     * @throws ApiError
     */
    public static deleteCompanyLocation(
        teamSlug: string,
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
            url: '/v1/api/store/{team_slug}/setting/location/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            errors: {
                422: `Unprocessable Entity - Cannot delete primary or default warehouse location`,
            },
        });
    }
    /**
     * Set location hold stock status
     * Enable or disable stock holding for a company location
     * @param teamSlug Team slug identifier
     * @param id Company location ID
     * @returns any Successfully updated hold stock status
     * @throws ApiError
     */
    public static setCompanyLocationHoldStock(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the company location
             */
            id: string;
            /**
             * Location label or name
             */
            label: string;
            /**
             * Primary address line
             */
            address1: string;
            /**
             * Secondary address line
             */
            address2: string;
            /**
             * City name
             */
            city: string;
            /**
             * State or province name
             */
            state: string;
            /**
             * State or province code
             */
            state_code: string;
            /**
             * Country name
             */
            country: string;
            /**
             * Country code
             */
            country_code: string;
            /**
             * Postal or ZIP code
             */
            postcode: string;
            /**
             * Address role type (always store_location for company locations)
             */
            role: 'store_location';
            /**
             * Additional notes (can be empty or null)
             */
            note: string | null;
            /**
             * Whether this is the primary location
             */
            is_primary: boolean;
            /**
             * Whether this is the default warehouse location
             */
            is_default_warehouse: boolean;
            /**
             * Whether this location can hold stock
             */
            hold_stock: boolean;
            /**
             * Whether this location has tax nexus
             */
            nexus: boolean;
            /**
             * Whether the location is marked as deleted
             */
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
            url: '/v1/api/store/{team_slug}/setting/location/{id}/hold_stock',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Set as primary location
     * Set a company location as the primary location
     * @param teamSlug Team slug identifier
     * @param id Company location ID
     * @returns any Successfully set as primary location
     * @throws ApiError
     */
    public static setCompanyLocationAsPrimary(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the company location
             */
            id: string;
            /**
             * Location label or name
             */
            label: string;
            /**
             * Primary address line
             */
            address1: string;
            /**
             * Secondary address line
             */
            address2: string;
            /**
             * City name
             */
            city: string;
            /**
             * State or province name
             */
            state: string;
            /**
             * State or province code
             */
            state_code: string;
            /**
             * Country name
             */
            country: string;
            /**
             * Country code
             */
            country_code: string;
            /**
             * Postal or ZIP code
             */
            postcode: string;
            /**
             * Address role type (always store_location for company locations)
             */
            role: 'store_location';
            /**
             * Additional notes (can be empty or null)
             */
            note: string | null;
            /**
             * Whether this is the primary location
             */
            is_primary: boolean;
            /**
             * Whether this is the default warehouse location
             */
            is_default_warehouse: boolean;
            /**
             * Whether this location can hold stock
             */
            hold_stock: boolean;
            /**
             * Whether this location has tax nexus
             */
            nexus: boolean;
            /**
             * Whether the location is marked as deleted
             */
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
            url: '/v1/api/store/{team_slug}/setting/location/{id}/primary',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Set as default warehouse
     * Set a company location as the default warehouse
     * @param teamSlug Team slug identifier
     * @param id Company location ID
     * @returns any Successfully set as default warehouse
     * @throws ApiError
     */
    public static setCompanyLocationAsDefaultWarehouse(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the company location
             */
            id: string;
            /**
             * Location label or name
             */
            label: string;
            /**
             * Primary address line
             */
            address1: string;
            /**
             * Secondary address line
             */
            address2: string;
            /**
             * City name
             */
            city: string;
            /**
             * State or province name
             */
            state: string;
            /**
             * State or province code
             */
            state_code: string;
            /**
             * Country name
             */
            country: string;
            /**
             * Country code
             */
            country_code: string;
            /**
             * Postal or ZIP code
             */
            postcode: string;
            /**
             * Address role type (always store_location for company locations)
             */
            role: 'store_location';
            /**
             * Additional notes (can be empty or null)
             */
            note: string | null;
            /**
             * Whether this is the primary location
             */
            is_primary: boolean;
            /**
             * Whether this is the default warehouse location
             */
            is_default_warehouse: boolean;
            /**
             * Whether this location can hold stock
             */
            hold_stock: boolean;
            /**
             * Whether this location has tax nexus
             */
            nexus: boolean;
            /**
             * Whether the location is marked as deleted
             */
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
            url: '/v1/api/store/{team_slug}/setting/location/{id}/default_warehouse',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
}
