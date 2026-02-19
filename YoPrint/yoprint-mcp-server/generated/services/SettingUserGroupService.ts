/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SettingUserGroupService {
    /**
     * Get user groups
     * Retrieve a paginated list of user groups
     * @param teamSlug Team slug identifier
     * @returns any User groups retrieved successfully
     * @throws ApiError
     */
    public static getV1ApiStoreSettingGroup(
        teamSlug: string,
    ): CancelablePromise<{
        data: Array<{
            id: string;
            name: string;
            permissions?: Array<string>;
            users?: Array<{
                id: string;
                name: string;
                avatar_url: string;
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
            url: '/v1/api/store/{team_slug}/setting/group',
            path: {
                'team_slug': teamSlug,
            },
        });
    }
    /**
     * Create user group
     * Create a new user group
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any User group created successfully
     * @throws ApiError
     */
    public static postV1ApiStoreSettingGroup(
        teamSlug: string,
        requestBody: {
            name: string;
            permissions: Array<string>;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            permissions?: Array<string>;
            users?: Array<{
                id: string;
                name: string;
                avatar_url: string;
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
            url: '/v1/api/store/{team_slug}/setting/group',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get user group
     * Retrieve a single user group by ID
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any User group retrieved successfully
     * @throws ApiError
     */
    public static getV1ApiStoreSettingGroup1(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            permissions?: Array<string>;
            users?: Array<{
                id: string;
                name: string;
                avatar_url: string;
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
            url: '/v1/api/store/{team_slug}/setting/group/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Update user group
     * Update an existing user group
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @param requestBody
     * @returns any User group updated successfully
     * @throws ApiError
     */
    public static putV1ApiStoreSettingGroup(
        teamSlug: string,
        id: string,
        requestBody: {
            id: string;
            name: string;
            permissions: Array<string>;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            permissions?: Array<string>;
            users?: Array<{
                id: string;
                name: string;
                avatar_url: string;
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
            url: '/v1/api/store/{team_slug}/setting/group/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Remove user group
     * Remove an existing user group
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any User group removed successfully
     * @throws ApiError
     */
    public static deleteV1ApiStoreSettingGroup(
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
            url: '/v1/api/store/{team_slug}/setting/group/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
}
