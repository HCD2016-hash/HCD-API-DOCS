/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class DefaultService {
    /**
     * Get list of users
     * Retrieve list of users for a store
     * @param teamId Team identifier
     * @returns any List of users retrieved successfully
     * @throws ApiError
     */
    public static getV1ApiStoreSettingUser(
        teamId: string,
    ): CancelablePromise<{
        data: Array<{
            id: string;
            name: string;
            email: string;
            avatar_url: string;
            timezone?: string;
            is_owner: boolean;
            sso?: boolean;
            roles?: Array<{
                id: string;
                name: string;
            }>;
            /**
             * Last login timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            last_login_at: string;
        }>;
        links?: {
            first?: string;
            last?: string;
            prev?: string;
            next?: string;
        };
        meta?: {
            current_page?: number;
            from?: number;
            last_page?: number;
            path?: string;
            per_page?: number;
            to?: number;
            total?: number;
        };
    }> {
        return __request(OpenAPI, {
            method: 'GET',
            url: '/v1/api/store/{team_slug}/setting/user',
            path: {
                'teamId': teamId,
            },
        });
    }
    /**
     * Change user role assignment
     * Change user's role assignment to a different group
     * @param teamId Team identifier
     * @param roleId Role identifier to assign user to
     * @param requestBody
     * @returns any User role assignment changed successfully
     * @throws ApiError
     */
    public static patchV1ApiStoreSettingGroupChangeUserGroup(
        teamId: string,
        roleId: string,
        requestBody: {
            user_id: string;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            email: string;
            avatar_url: string;
            timezone?: string;
            is_owner: boolean;
            sso?: boolean;
            roles?: Array<{
                id: string;
                name: string;
            }>;
            /**
             * Last login timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            last_login_at: string;
        };
    }> {
        return __request(OpenAPI, {
            method: 'PATCH',
            url: '/v1/api/store/{team_slug}/setting/group/{roleId}/change_user_group',
            path: {
                'teamId': teamId,
                'roleId': roleId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Remove user from store
     * Remove user from store team
     * @param teamId Team identifier
     * @param userId User identifier to remove
     * @returns any User removed successfully
     * @throws ApiError
     */
    public static deleteV1ApiStoreSettingUser(
        teamId: string,
        userId: string,
    ): CancelablePromise<{
        data: null;
    }> {
        return __request(OpenAPI, {
            method: 'DELETE',
            url: '/v1/api/store/{team_slug}/setting/user/{userId}',
            path: {
                'teamId': teamId,
                'userId': userId,
            },
        });
    }
    /**
     * Get list of user invitations
     * Retrieve all user invitations for a store
     * @param teamId Team identifier
     * @returns any List of user invitations retrieved successfully
     * @throws ApiError
     */
    public static getV1ApiStoreSettingInvite(
        teamId: string,
    ): CancelablePromise<{
        data: Array<{
            id: string;
            email: string;
            expired: boolean;
            role: {
                id: string;
                name: string;
                permissions: Array<string>;
                users: Array<{
                    id: string;
                    name: string;
                    email: string;
                    avatar_url: string;
                }>;
            };
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
            url: '/v1/api/store/{team_slug}/setting/invite',
            path: {
                'teamId': teamId,
            },
        });
    }
    /**
     * Create user invitation
     * Create a new user invitation
     * @param teamId Team identifier
     * @param requestBody
     * @returns any User invitation created successfully
     * @throws ApiError
     */
    public static postV1ApiStoreSettingInvite(
        teamId: string,
        requestBody: {
            email: string;
            role_id: string;
        },
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
            method: 'POST',
            url: '/v1/api/store/{team_slug}/setting/invite',
            path: {
                'teamId': teamId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Update user invitation
     * Update an existing user invitation
     * @param teamId Team identifier
     * @param id User invitation identifier
     * @param requestBody
     * @returns any User invitation updated successfully
     * @throws ApiError
     */
    public static putV1ApiStoreSettingInvite(
        teamId: string,
        id: string,
        requestBody: {
            id: string;
            role_id: string;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            email: string;
            expired: boolean;
            role: {
                id: string;
                name: string;
                permissions: Array<string>;
                users: Array<{
                    id: string;
                    name: string;
                    email: string;
                    avatar_url: string;
                }>;
            };
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
            url: '/v1/api/store/{team_slug}/setting/invite/{id}',
            path: {
                'teamId': teamId,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Remove user invitation
     * Remove a user invitation
     * @param teamId Team identifier
     * @param id User invitation identifier
     * @returns any User invitation removed successfully
     * @throws ApiError
     */
    public static deleteV1ApiStoreSettingInvite(
        teamId: string,
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
            url: '/v1/api/store/{team_slug}/setting/invite/{id}',
            path: {
                'teamId': teamId,
                'id': id,
            },
        });
    }
}
