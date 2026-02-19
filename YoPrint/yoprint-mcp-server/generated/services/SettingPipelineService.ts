/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SettingPipelineService {
    /**
     * Get pipeline configurations
     * Retrieve all pipeline configurations for a team
     * @param teamSlug Team slug identifier
     * @returns any Pipeline configurations retrieved successfully
     * @throws ApiError
     */
    public static getV1ApiStoreSettingPipeline(
        teamSlug: string,
    ): CancelablePromise<{
        data: Array<{
            id: string;
            label: string;
            color: string;
            enable: boolean;
            trashed: boolean;
            version: number;
            statuses: Array<{
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
            url: '/v1/api/store/{team_slug}/setting/pipeline',
            path: {
                'team_slug': teamSlug,
            },
        });
    }
    /**
     * Create pipeline configuration
     * Create new pipeline configuration
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Pipeline configuration created successfully
     * @throws ApiError
     */
    public static postV1ApiStoreSettingPipeline(
        teamSlug: string,
        requestBody: {
            label: string;
            enable: boolean;
            color: string;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            label: string;
            color: string;
            enable: boolean;
            trashed: boolean;
            version: number;
            statuses: Array<{
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
            url: '/v1/api/store/{team_slug}/setting/pipeline',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get pipeline configuration
     * Retrieve specific pipeline configuration by ID
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any Pipeline configuration retrieved successfully
     * @throws ApiError
     */
    public static getV1ApiStoreSettingPipeline1(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: {
            id: string;
            label: string;
            color: string;
            enable: boolean;
            trashed: boolean;
            version: number;
            statuses: Array<{
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
            url: '/v1/api/store/{team_slug}/setting/pipeline/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Update pipeline configuration
     * Update existing pipeline configuration
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @param requestBody
     * @returns any Pipeline configuration updated successfully
     * @throws ApiError
     */
    public static putV1ApiStoreSettingPipeline(
        teamSlug: string,
        id: string,
        requestBody: {
            id: string;
            label?: string;
            enable?: boolean;
            color?: string;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            label: string;
            color: string;
            enable: boolean;
            trashed: boolean;
            version: number;
            statuses: Array<{
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
            url: '/v1/api/store/{team_slug}/setting/pipeline/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Remove pipeline configuration
     * Remove pipeline configuration
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any Pipeline configuration removed successfully
     * @throws ApiError
     */
    public static deleteV1ApiStoreSettingPipeline(
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
            url: '/v1/api/store/{team_slug}/setting/pipeline/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
}
