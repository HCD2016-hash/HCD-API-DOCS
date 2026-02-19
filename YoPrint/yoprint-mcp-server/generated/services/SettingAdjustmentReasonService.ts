/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SettingAdjustmentReasonService {
    /**
     * Get list of adjustment reasons
     * Retrieve a list of adjustment reasons
     * @param teamSlug Team slug identifier
     * @returns any Successfully retrieved adjustment reasons
     * @throws ApiError
     */
    public static getAdjustmentReasons(
        teamSlug: string,
    ): CancelablePromise<{
        data: Array<{
            /**
             * Unique identifier for the adjustment reason
             */
            id: string;
            /**
             * The adjustment reason text
             */
            reason: string;
            /**
             * Whether the adjustment reason is enabled
             */
            enable: boolean;
            /**
             * Whether this is a system-defined adjustment reason
             */
            system: boolean;
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
            url: '/v1/api/store/{team_slug}/setting/adjustment_reason',
            path: {
                'team_slug': teamSlug,
            },
        });
    }
    /**
     * Create new adjustment reason
     * Create a new adjustment reason
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Successfully created adjustment reason
     * @throws ApiError
     */
    public static createAdjustmentReason(
        teamSlug: string,
        requestBody: {
            /**
             * The adjustment reason text
             */
            reason: string;
            /**
             * Whether the adjustment reason is enabled
             */
            enable: boolean;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the adjustment reason
             */
            id: string;
            /**
             * The adjustment reason text
             */
            reason: string;
            /**
             * Whether the adjustment reason is enabled
             */
            enable: boolean;
            /**
             * Whether this is a system-defined adjustment reason
             */
            system: boolean;
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
            url: '/v1/api/store/{team_slug}/setting/adjustment_reason',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Update adjustment reason
     * Update an existing adjustment reason
     * @param teamSlug Team slug identifier
     * @param id Adjustment reason ID
     * @param requestBody
     * @returns any Successfully updated adjustment reason
     * @throws ApiError
     */
    public static updateAdjustmentReason(
        teamSlug: string,
        id: string,
        requestBody: {
            /**
             * Unique identifier for the adjustment reason
             */
            id: string;
            /**
             * The adjustment reason text
             */
            reason?: string;
            /**
             * Whether the adjustment reason is enabled
             */
            enable?: boolean;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the adjustment reason
             */
            id: string;
            /**
             * The adjustment reason text
             */
            reason: string;
            /**
             * Whether the adjustment reason is enabled
             */
            enable: boolean;
            /**
             * Whether this is a system-defined adjustment reason
             */
            system: boolean;
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
            url: '/v1/api/store/{team_slug}/setting/adjustment_reason/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Delete adjustment reason
     * Delete an existing adjustment reason
     * @param teamSlug Team slug identifier
     * @param id Adjustment reason ID
     * @returns any Successfully deleted adjustment reason
     * @throws ApiError
     */
    public static deleteAdjustmentReason(
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
            url: '/v1/api/store/{team_slug}/setting/adjustment_reason/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
}
