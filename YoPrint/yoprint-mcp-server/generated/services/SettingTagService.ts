/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SettingTagService {
    /**
     * Get tags
     * Retrieves a paginated list of tags for a specific store
     * @param teamSlug Team slug identifier
     * @param page Page number for pagination
     * @returns any List of tags
     * @throws ApiError
     */
    public static getList(
        teamSlug: string,
        page: number,
    ): CancelablePromise<{
        data: Array<{
            id: string;
            name: string;
            /**
             * Hexadecimal color code
             */
            color_hex: string;
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
            url: '/v1/api/store/{team_slug}/tag',
            path: {
                'team_slug': teamSlug,
            },
            query: {
                'page': page,
            },
        });
    }
    /**
     * Create tag
     * Creates a new tag entity
     * @param teamSlug Team slug identifier
     * @param requestBody Tag data
     * @returns any Created tag
     * @throws ApiError
     */
    public static create(
        teamSlug: string,
        requestBody: {
            name: string;
            /**
             * Hexadecimal color code
             */
            color_hex: string;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            /**
             * Hexadecimal color code
             */
            color_hex: string;
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
            url: '/v1/api/store/{team_slug}/tag',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Update tag
     * Updates an existing tag entity
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @param requestBody Updated tag data
     * @returns any Updated tag
     * @throws ApiError
     */
    public static update(
        teamSlug: string,
        id: string,
        requestBody: {
            id: string;
            name: string;
            /**
             * Hexadecimal color code
             */
            color_hex: string;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            /**
             * Hexadecimal color code
             */
            color_hex: string;
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
            url: '/v1/api/store/{team_slug}/tag/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Remove tag
     * Removes a tag entity
     * @param teamSlug Team slug identifier
     * @param tagId Tag identifier to remove
     * @returns any Tag removed successfully
     * @throws ApiError
     */
    public static remove(
        teamSlug: string,
        tagId: string,
    ): CancelablePromise<{
        /**
         * Null data for successful deletion
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
            url: '/v1/api/store/{team_slug}/tag/{tag_id}',
            path: {
                'team_slug': teamSlug,
                'tag_id': tagId,
            },
        });
    }
}
