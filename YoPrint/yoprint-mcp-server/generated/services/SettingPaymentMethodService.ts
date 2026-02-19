/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SettingPaymentMethodService {
    /**
     * Get payment methods
     * Retrieves a paginated list of payment methods
     * @param teamSlug Team slug identifier
     * @returns any List of payment methods
     * @throws ApiError
     */
    public static getList(
        teamSlug: string,
    ): CancelablePromise<{
        data: Array<{
            id: string;
            name: string;
            default: boolean;
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
            url: '/v1/api/store/{team_slug}/setting/payment_method',
            path: {
                'team_slug': teamSlug,
            },
        });
    }
    /**
     * Create payment method
     * Creates a new payment method
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Payment method created successfully
     * @throws ApiError
     */
    public static create(
        teamSlug: string,
        requestBody: {
            name: string;
            default: boolean;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            default: boolean;
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
            url: '/v1/api/store/{team_slug}/setting/payment_method',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get payment method
     * Retrieves a single payment method by ID
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any Payment method details
     * @throws ApiError
     */
    public static getOne(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            default: boolean;
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
            url: '/v1/api/store/{team_slug}/setting/payment_method/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Update payment method
     * Updates an existing payment method
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @param requestBody
     * @returns any Payment method updated successfully
     * @throws ApiError
     */
    public static update(
        teamSlug: string,
        id: string,
        requestBody: {
            id: string;
            name?: string;
            default?: boolean;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            default: boolean;
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
            url: '/v1/api/store/{team_slug}/setting/payment_method/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Remove payment method
     * Removes a payment method
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any Payment method removed successfully
     * @throws ApiError
     */
    public static remove(
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
            url: '/v1/api/store/{team_slug}/setting/payment_method/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
}
