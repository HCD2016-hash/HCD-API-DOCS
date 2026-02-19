/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SettingPaymentTermService {
    /**
     * Get payment terms
     * Retrieves a paginated list of payment terms
     * @param teamSlug Team slug identifier
     * @returns any List of payment terms
     * @throws ApiError
     */
    public static getList(
        teamSlug: string,
    ): CancelablePromise<{
        data: Array<{
            id: string;
            default: boolean;
            enable_deposit: boolean;
            name: string;
            deposit_percent: number;
            deposit_due: number;
            deposit_due_from: 'issue_date' | 'customer_due_date';
            full_amount_due: number;
            full_amount_due_from: 'issue_date' | 'customer_due_date';
            trashed?: boolean;
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
            url: '/v1/api/store/{team_slug}/setting/payment_term',
            path: {
                'team_slug': teamSlug,
            },
        });
    }
    /**
     * Create payment term
     * Creates a new payment term
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Created payment term
     * @throws ApiError
     */
    public static create(
        teamSlug: string,
        requestBody: {
            name: string;
            enable_deposit: boolean;
            deposit_percent: number;
            deposit_due: number;
            deposit_due_from: 'issue_date' | 'customer_due_date';
            full_amount_due: number;
            full_amount_due_from: 'issue_date' | 'customer_due_date';
            default: boolean;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            default: boolean;
            enable_deposit: boolean;
            name: string;
            deposit_percent: number;
            deposit_due: number;
            deposit_due_from: 'issue_date' | 'customer_due_date';
            full_amount_due: number;
            full_amount_due_from: 'issue_date' | 'customer_due_date';
            trashed?: boolean;
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
            url: '/v1/api/store/{team_slug}/setting/payment_term',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get payment term details
     * Retrieves details for a single payment term
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any Payment term details
     * @throws ApiError
     */
    public static getOne(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: {
            id: string;
            default: boolean;
            enable_deposit: boolean;
            name: string;
            deposit_percent: number;
            deposit_due: number;
            deposit_due_from: 'issue_date' | 'customer_due_date';
            full_amount_due: number;
            full_amount_due_from: 'issue_date' | 'customer_due_date';
            trashed?: boolean;
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
            url: '/v1/api/store/{team_slug}/setting/payment_term/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Update payment term
     * Updates an existing payment term
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @param requestBody
     * @returns any Updated payment term
     * @throws ApiError
     */
    public static update(
        teamSlug: string,
        id: string,
        requestBody: {
            id: string;
            name?: string;
            enable_deposit?: boolean;
            deposit_percent?: number;
            deposit_due?: number;
            deposit_due_from?: 'issue_date' | 'customer_due_date';
            full_amount_due?: number;
            full_amount_due_from?: 'issue_date' | 'customer_due_date';
            default?: boolean;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            default: boolean;
            enable_deposit: boolean;
            name: string;
            deposit_percent: number;
            deposit_due: number;
            deposit_due_from: 'issue_date' | 'customer_due_date';
            full_amount_due: number;
            full_amount_due_from: 'issue_date' | 'customer_due_date';
            trashed?: boolean;
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
            url: '/v1/api/store/{team_slug}/setting/payment_term/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Remove payment term
     * Removes an existing payment term
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any Payment term removed
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
            url: '/v1/api/store/{team_slug}/setting/payment_term/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
}
