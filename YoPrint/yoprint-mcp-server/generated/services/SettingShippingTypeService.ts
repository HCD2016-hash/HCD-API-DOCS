/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SettingShippingTypeService {
    /**
     * Get shipping type list
     * Retrieve all shipping type configurations for a team
     * @param teamSlug Team slug identifier
     * @returns any Shipping type list retrieved successfully
     * @throws ApiError
     */
    public static getV1ApiStoreSettingShippingType(
        teamSlug: string,
    ): CancelablePromise<{
        data: Array<{
            id: string;
            name: string;
            type: 'courier' | 'self_delivery' | 'pick_up' | 'integration' | 'integration_shippo';
            default: boolean;
            external_integration_id: (string | null);
            service_code: (string | null);
            price_type: ('markup' | 'margin' | null);
            price_percent: (number | null);
            min_price: (number | null);
            trashed: boolean;
        }>;
        pagination?: ({
            count: number;
            currentPage: number;
            links: {
                next?: string;
                prev: string;
            };
            perPage: number;
            total: number;
            totalPages: number;
        } | null);
        status: number;
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'GET',
            url: '/v1/api/store/{team_slug}/setting/shipping_type',
            path: {
                'team_slug': teamSlug,
            },
        });
    }
    /**
     * Create shipping type
     * Create new shipping type configuration
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Shipping type created successfully
     * @throws ApiError
     */
    public static postV1ApiStoreSettingShippingType(
        teamSlug: string,
        requestBody: {
            name: string;
            type: 'courier' | 'self_delivery' | 'pick_up' | 'integration' | 'integration_shippo';
            external_integration_id: (string | null);
            service_code: (string | null);
            price_type: ('markup' | 'margin' | null);
            price_percent: (number | null);
            min_price: (number | null);
            default: boolean;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            type: 'courier' | 'self_delivery' | 'pick_up' | 'integration' | 'integration_shippo';
            default: boolean;
            external_integration_id: (string | null);
            service_code: (string | null);
            price_type: ('markup' | 'margin' | null);
            price_percent: (number | null);
            min_price: (number | null);
            trashed: boolean;
        };
        status: number;
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/v1/api/store/{team_slug}/setting/shipping_type',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get single shipping type
     * Retrieve single shipping type configuration by ID
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any Shipping type retrieved successfully
     * @throws ApiError
     */
    public static getV1ApiStoreSettingShippingType1(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            type: 'courier' | 'self_delivery' | 'pick_up' | 'integration' | 'integration_shippo';
            default: boolean;
            external_integration_id: (string | null);
            service_code: (string | null);
            price_type: ('markup' | 'margin' | null);
            price_percent: (number | null);
            min_price: (number | null);
            trashed: boolean;
        };
        status: number;
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'GET',
            url: '/v1/api/store/{team_slug}/setting/shipping_type/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Update shipping type
     * Update existing shipping type configuration
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @param requestBody
     * @returns any Shipping type updated successfully
     * @throws ApiError
     */
    public static putV1ApiStoreSettingShippingType(
        teamSlug: string,
        id: string,
        requestBody: {
            id: string;
            name?: string;
            type?: 'courier' | 'self_delivery' | 'pick_up' | 'integration' | 'integration_shippo';
            service_code?: string;
            price_type?: 'markup' | 'margin';
            price_percent?: number;
            min_price?: number;
            default?: boolean;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            type: 'courier' | 'self_delivery' | 'pick_up' | 'integration' | 'integration_shippo';
            default: boolean;
            external_integration_id: (string | null);
            service_code: (string | null);
            price_type: ('markup' | 'margin' | null);
            price_percent: (number | null);
            min_price: (number | null);
            trashed: boolean;
        };
        status: number;
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'PUT',
            url: '/v1/api/store/{team_slug}/setting/shipping_type/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Remove shipping type
     * Remove shipping type configuration
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any Shipping type removed successfully
     * @throws ApiError
     */
    public static deleteV1ApiStoreSettingShippingType(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: null;
        status: number;
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'DELETE',
            url: '/v1/api/store/{team_slug}/setting/shipping_type/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
}
