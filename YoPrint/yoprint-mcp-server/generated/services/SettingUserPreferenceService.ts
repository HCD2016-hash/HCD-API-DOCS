/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SettingUserPreferenceService {
    /**
     * Get current user preference
     * Retrieves the current user's column ordering preferences for AG Grid tables
     * @param teamSlug Team slug identifier
     * @returns any User preference data retrieved successfully
     * @throws ApiError
     */
    public static getUserPreference(
        teamSlug: string,
    ): CancelablePromise<{
        data: {
            /**
             * Maps table/grid names to their column state configurations for AG Grid
             */
            column_order: Record<string, Array<Record<string, any>>>;
            /**
             * Version number for preference data
             */
            version?: number;
        };
        status: number;
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'GET',
            url: '/v1/api/store/{team_slug}/current_user_preference',
            path: {
                'team_slug': teamSlug,
            },
        });
    }
    /**
     * Update current user preference
     * Updates the current user's column ordering preferences for AG Grid tables
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any User preference updated successfully
     * @throws ApiError
     */
    public static updateUserPreference(
        teamSlug: string,
        requestBody: {
            preference: {
                /**
                 * Maps table/grid names to their column state configurations for AG Grid
                 */
                column_order?: Record<string, Array<Record<string, any>>>;
                /**
                 * Version number for preference data
                 */
                version?: number;
            };
        },
    ): CancelablePromise<{
        data: {
            /**
             * Maps table/grid names to their column state configurations for AG Grid
             */
            column_order: Record<string, Array<Record<string, any>>>;
            /**
             * Version number for preference data
             */
            version?: number;
        };
        status: number;
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/v1/api/store/{team_slug}/current_user_preference',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
}
