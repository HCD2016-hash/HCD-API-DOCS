/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SettingStatusService {
    /**
     * Get status configurations
     * Retrieve all status configurations for a team
     * @param teamSlug Team slug identifier
     * @returns any Status configurations retrieved successfully
     * @throws ApiError
     */
    public static getV1ApiStoreSettingStatus(
        teamSlug: string,
    ): CancelablePromise<{
        data: Array<{
            id: string;
            role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
            type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
            label: string;
            customer_label: string;
            color: string;
            position: number;
            trashed: boolean;
            pipeline_id?: string;
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
            url: '/v1/api/store/{team_slug}/setting/status',
            path: {
                'team_slug': teamSlug,
            },
        });
    }
    /**
     * Create status configuration
     * Create a new status configuration
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Status configuration created successfully
     * @throws ApiError
     */
    public static postV1ApiStoreSettingStatus(
        teamSlug: string,
        requestBody: {
            label: string;
            customer_label?: string;
            color: string;
            type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
            role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
            position: number;
            pipeline_id?: string;
        },
    ): CancelablePromise<{
        data: {
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
            url: '/v1/api/store/{team_slug}/setting/status',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Update status order
     * Update the position order of multiple status configurations
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Status order updated successfully
     * @throws ApiError
     */
    public static postV1ApiStoreSettingStatusSync(
        teamSlug: string,
        requestBody: {
            data: Array<{
                id: string;
                position: number;
                action: 'update';
            }>;
        },
    ): CancelablePromise<{
        data: Array<{
            id: string;
            role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
            type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
            label: string;
            customer_label: string;
            color: string;
            position: number;
            trashed: boolean;
            pipeline_id?: string;
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
            method: 'POST',
            url: '/v1/api/store/{team_slug}/setting/status/sync',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Update status configuration
     * Update an existing status configuration
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @param requestBody
     * @returns any Status configuration updated successfully
     * @throws ApiError
     */
    public static putV1ApiStoreSettingStatus(
        teamSlug: string,
        id: string,
        requestBody: {
            id: string;
            label: string;
            customer_label?: string;
            color: string;
        },
    ): CancelablePromise<{
        data: {
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
            url: '/v1/api/store/{team_slug}/setting/status/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Remove status configuration
     * Remove an existing status configuration
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns void
     * @throws ApiError
     */
    public static deleteV1ApiStoreSettingStatus(
        teamSlug: string,
        id: string,
    ): CancelablePromise<void> {
        return __request(OpenAPI, {
            method: 'DELETE',
            url: '/v1/api/store/{team_slug}/setting/status/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
}
