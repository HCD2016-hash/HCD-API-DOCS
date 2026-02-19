/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SettingTaxTypeService {
    /**
     * Get tax types
     * Retrieves a paginated list of tax type configurations for the store
     * @param teamSlug Team slug identifier
     * @returns any List of tax type configurations
     * @throws ApiError
     */
    public static getList(
        teamSlug: string,
    ): CancelablePromise<{
        /**
         * Array of tax type configurations
         */
        data: Array<{
            /**
             * Unique tax type identifier
             */
            id: string;
            /**
             * Whether tax rates can be overridden
             */
            can_override_rates: boolean;
            /**
             * Whether tax rules can be overridden
             */
            can_override_rules: boolean;
            /**
             * Whether this is the default tax type
             */
            default: boolean;
            /**
             * Whether tax type is enabled
             */
            enable: boolean;
            /**
             * Tax type name
             */
            name: string;
            /**
             * Secondary tax classification
             */
            secondary_type?: ('auto' | 'other' | 'EU' | 'US' | 'CA' | null);
            /**
             * Whether shipping is taxable
             */
            shipping_taxable: boolean;
            /**
             * Geographic locations where tax type is supported
             */
            supported_place: Array<{
                /**
                 * Geographic location identifier
                 */
                id: string;
                /**
                 * Geographic location display name
                 */
                label: string;
            }>;
            /**
             * Tax rate or total amount
             */
            total: number;
            /**
             * Primary tax calculation type
             */
            type: 'simple' | 'system' | 'auto_tax' | 'line_tax';
            /**
             * Whether tax type is soft deleted
             */
            trashed: boolean;
            /**
             * Line-level tax definitions for complex tax structures
             */
            line_taxes?: null;
            /**
             * Whether tax is applied before discount calculations
             */
            apply_before_disc?: (boolean | null);
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
            url: '/api/store/{teamSlug}/setting/tax_type',
            path: {
                'team_slug': teamSlug,
            },
        });
    }
    /**
     * Create tax type
     * Creates a new tax type configuration. Supports simple and line_tax types only.
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Tax type created successfully
     * @throws ApiError
     */
    public static create(
        teamSlug: string,
        requestBody: {
            /**
             * Tax type (only simple and line_tax supported for creation)
             */
            type: 'simple' | 'line_tax';
            /**
             * Tax type name (must be unique within store)
             */
            name: string;
            /**
             * Tax rate percentage or amount
             */
            total?: (number | null);
            /**
             * Line tax definitions (required when type is line_tax)
             */
            line_taxes?: null;
            /**
             * Whether shipping costs are subject to tax
             */
            shipping_taxable: boolean;
            /**
             * Whether tax type is active
             */
            enable: boolean;
            /**
             * Whether this should be the default tax type
             */
            default: boolean;
            /**
             * Whether tax is calculated before discount application
             */
            apply_before_disc: boolean;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique tax type identifier
             */
            id: string;
            /**
             * Whether tax rates can be overridden
             */
            can_override_rates: boolean;
            /**
             * Whether tax rules can be overridden
             */
            can_override_rules: boolean;
            /**
             * Whether this is the default tax type
             */
            default: boolean;
            /**
             * Whether tax type is enabled
             */
            enable: boolean;
            /**
             * Tax type name
             */
            name: string;
            /**
             * Secondary tax classification
             */
            secondary_type?: ('auto' | 'other' | 'EU' | 'US' | 'CA' | null);
            /**
             * Whether shipping is taxable
             */
            shipping_taxable: boolean;
            /**
             * Geographic locations where tax type is supported
             */
            supported_place: Array<{
                /**
                 * Geographic location identifier
                 */
                id: string;
                /**
                 * Geographic location display name
                 */
                label: string;
            }>;
            /**
             * Tax rate or total amount
             */
            total: number;
            /**
             * Primary tax calculation type
             */
            type: 'simple' | 'system' | 'auto_tax' | 'line_tax';
            /**
             * Whether tax type is soft deleted
             */
            trashed: boolean;
            /**
             * Line-level tax definitions for complex tax structures
             */
            line_taxes?: null;
            /**
             * Whether tax is applied before discount calculations
             */
            apply_before_disc?: (boolean | null);
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
            url: '/api/store/{teamSlug}/setting/tax_type',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get tax type
     * Retrieves a specific tax type configuration by ID
     * @param teamSlug Team slug identifier
     * @param id Tax type ID
     * @returns any Tax type configuration details
     * @throws ApiError
     */
    public static getOne(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: {
            /**
             * Unique tax type identifier
             */
            id: string;
            /**
             * Whether tax rates can be overridden
             */
            can_override_rates: boolean;
            /**
             * Whether tax rules can be overridden
             */
            can_override_rules: boolean;
            /**
             * Whether this is the default tax type
             */
            default: boolean;
            /**
             * Whether tax type is enabled
             */
            enable: boolean;
            /**
             * Tax type name
             */
            name: string;
            /**
             * Secondary tax classification
             */
            secondary_type?: ('auto' | 'other' | 'EU' | 'US' | 'CA' | null);
            /**
             * Whether shipping is taxable
             */
            shipping_taxable: boolean;
            /**
             * Geographic locations where tax type is supported
             */
            supported_place: Array<{
                /**
                 * Geographic location identifier
                 */
                id: string;
                /**
                 * Geographic location display name
                 */
                label: string;
            }>;
            /**
             * Tax rate or total amount
             */
            total: number;
            /**
             * Primary tax calculation type
             */
            type: 'simple' | 'system' | 'auto_tax' | 'line_tax';
            /**
             * Whether tax type is soft deleted
             */
            trashed: boolean;
            /**
             * Line-level tax definitions for complex tax structures
             */
            line_taxes?: null;
            /**
             * Whether tax is applied before discount calculations
             */
            apply_before_disc?: (boolean | null);
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
            url: '/api/store/{teamSlug}/setting/tax_type/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Update tax type
     * Updates an existing tax type configuration with partial data
     * @param teamSlug Team slug identifier
     * @param id Tax type ID
     * @param requestBody
     * @returns any Tax type updated successfully
     * @throws ApiError
     */
    public static update(
        teamSlug: string,
        id: string,
        requestBody: {
            /**
             * Tax type ID to update
             */
            id: string;
            /**
             * Whether this should be the default tax type
             */
            default?: boolean;
            /**
             * Whether tax type is active
             */
            enable?: boolean;
            /**
             * Tax type name (must be unique within store)
             */
            name?: string;
            /**
             * Whether shipping costs are subject to tax
             */
            shipping_taxable?: boolean;
            /**
             * Tax rate percentage or amount
             */
            total?: number;
            /**
             * Line tax definitions for complex tax structures
             */
            line_taxes?: Array<{
                /**
                 * Line tax name
                 */
                name: string;
                /**
                 * Line tax rate/amount
                 */
                total: number;
            }>;
            /**
             * Tax type (only simple and line_tax supported for updates)
             */
            type?: 'simple' | 'line_tax';
            /**
             * Whether tax is applied before discount calculations
             */
            apply_before_disc?: boolean;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique tax type identifier
             */
            id: string;
            /**
             * Whether tax rates can be overridden
             */
            can_override_rates: boolean;
            /**
             * Whether tax rules can be overridden
             */
            can_override_rules: boolean;
            /**
             * Whether this is the default tax type
             */
            default: boolean;
            /**
             * Whether tax type is enabled
             */
            enable: boolean;
            /**
             * Tax type name
             */
            name: string;
            /**
             * Secondary tax classification
             */
            secondary_type?: ('auto' | 'other' | 'EU' | 'US' | 'CA' | null);
            /**
             * Whether shipping is taxable
             */
            shipping_taxable: boolean;
            /**
             * Geographic locations where tax type is supported
             */
            supported_place: Array<{
                /**
                 * Geographic location identifier
                 */
                id: string;
                /**
                 * Geographic location display name
                 */
                label: string;
            }>;
            /**
             * Tax rate or total amount
             */
            total: number;
            /**
             * Primary tax calculation type
             */
            type: 'simple' | 'system' | 'auto_tax' | 'line_tax';
            /**
             * Whether tax type is soft deleted
             */
            trashed: boolean;
            /**
             * Line-level tax definitions for complex tax structures
             */
            line_taxes?: null;
            /**
             * Whether tax is applied before discount calculations
             */
            apply_before_disc?: (boolean | null);
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
            url: '/api/store/{teamSlug}/setting/tax_type/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Remove tax type
     * Soft deletes a tax type configuration by marking it as trashed
     * @param teamSlug Team slug identifier
     * @param id Tax type ID
     * @returns any Tax type removed successfully
     * @throws ApiError
     */
    public static remove(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        /**
         * No data returned for successful deletion
         */
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
            url: '/api/store/{teamSlug}/setting/tax_type/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
}
