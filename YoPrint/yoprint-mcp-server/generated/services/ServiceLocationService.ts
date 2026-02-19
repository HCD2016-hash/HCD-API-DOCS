/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class ServiceLocationService {
    /**
     * List service locations
     * Retrieve all service locations for a team
     * @param teamSlug Team slug identifier
     * @returns any List of service locations
     * @throws ApiError
     */
    public static getServiceLocationList(
        teamSlug: string,
    ): CancelablePromise<{
        data: Array<{
            id: string;
            name: string;
            enable: boolean;
            services: Array<{
                id: string;
                name: string;
            }>;
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
            url: '/v1/api/store/{team_slug}/service_location',
            path: {
                'team_slug': teamSlug,
            },
        });
    }
    /**
     * Create service location
     * Create a new service location
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Successfully created service location
     * @throws ApiError
     */
    public static createServiceLocation(
        teamSlug: string,
        requestBody: {
            enable: boolean;
            name: string;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            enable: boolean;
            services: Array<{
                id: string;
                name: string;
            }>;
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
            url: '/v1/api/store/{team_slug}/service_location',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get service location
     * Retrieve a specific service location by ID
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any Service location details
     * @throws ApiError
     */
    public static getServiceLocation(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            enable: boolean;
            services: Array<{
                id: string;
                name: string;
            }>;
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
            url: '/v1/api/store/{team_slug}/service_location/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Update service location
     * Update an existing service location
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @param requestBody
     * @returns any Successfully updated service location
     * @throws ApiError
     */
    public static updateServiceLocation(
        teamSlug: string,
        id: string,
        requestBody: {
            id: string;
            enable?: boolean;
            name?: string;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            enable: boolean;
            services: Array<{
                id: string;
                name: string;
            }>;
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
            url: '/v1/api/store/{team_slug}/service_location/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Remove service location
     * Remove a service location (soft delete to trash)
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any Successfully removed service location
     * @throws ApiError
     */
    public static removeServiceLocation(
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
            url: '/v1/api/store/{team_slug}/service_location/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
}
