/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SettingJobPresetService {
    /**
     * Get job presets list
     * Retrieves a paginated list of job presets for the specified team.
     * @param teamSlug Team slug identifier
     * @returns any List of job presets retrieved successfully
     * @throws ApiError
     */
    public static getJobPresetsList(
        teamSlug: string,
    ): CancelablePromise<{
        data: Array<{
            id: string;
            name: string;
            note: string;
            is_valid: boolean;
            service: Array<{
                id: string;
                service_id: string;
                service_name: string;
                location: {
                    id: (string | null);
                    name?: string;
                    display_name: string;
                    type: 'database' | 'custom';
                    trashed?: boolean;
                };
                note: string;
                customer_note?: string | null;
                option: string;
                position: number;
                valid: boolean;
                _edit?: {
                    is_new: boolean;
                };
            }>;
            pipeline: Array<{
                id: string;
                pipeline_id: string;
                position: number;
                name: string;
                note: string | null;
                trashed: boolean;
                is_valid: boolean;
                assigned_users: Array<{
                    id: string;
                    name: string;
                    avatar_url: string;
                }>;
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
            url: '/v1/api/store/{team_slug}/setting/job_preset',
            path: {
                'team_slug': teamSlug,
            },
        });
    }
    /**
     * Create job preset
     * Creates a new job preset.
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Job preset created successfully
     * @throws ApiError
     */
    public static createJobPreset(
        teamSlug: string,
        requestBody: {
            name: string;
            note?: string;
            service: Array<{
                service_id: string;
                location: {
                    id?: string;
                    name?: string;
                    type: 'database' | 'custom';
                };
                note?: string;
                option: string;
                position: number;
                action: 'create' | 'update' | 'delete';
            }>;
            pipeline: Array<{
                pipeline_id: string;
                position: number;
                name: string;
                assigned_users: Array<{
                    id: string;
                    name: string;
                    avatar_url: string;
                }>;
                action: 'create' | 'update' | 'delete';
            }>;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            note: string;
            is_valid: boolean;
            service: Array<{
                id: string;
                service_id: string;
                service_name: string;
                location: {
                    id: (string | null);
                    name?: string;
                    display_name: string;
                    type: 'database' | 'custom';
                    trashed?: boolean;
                };
                note: string;
                customer_note?: string | null;
                option: string;
                position: number;
                valid: boolean;
                _edit?: {
                    is_new: boolean;
                };
            }>;
            pipeline: Array<{
                id: string;
                pipeline_id: string;
                position: number;
                name: string;
                note: string | null;
                trashed: boolean;
                is_valid: boolean;
                assigned_users: Array<{
                    id: string;
                    name: string;
                    avatar_url: string;
                }>;
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
            url: '/v1/api/store/{team_slug}/setting/job_preset',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get job preset by ID
     * Retrieves a specific job preset by ID.
     * @param teamSlug Team slug identifier
     * @param id Job preset ID
     * @returns any Job preset retrieved successfully
     * @throws ApiError
     */
    public static getJobPresetById(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            note: string;
            is_valid: boolean;
            service: Array<{
                id: string;
                service_id: string;
                service_name: string;
                location: {
                    id: (string | null);
                    name?: string;
                    display_name: string;
                    type: 'database' | 'custom';
                    trashed?: boolean;
                };
                note: string;
                customer_note?: string | null;
                option: string;
                position: number;
                valid: boolean;
                _edit?: {
                    is_new: boolean;
                };
            }>;
            pipeline: Array<{
                id: string;
                pipeline_id: string;
                position: number;
                name: string;
                note: string | null;
                trashed: boolean;
                is_valid: boolean;
                assigned_users: Array<{
                    id: string;
                    name: string;
                    avatar_url: string;
                }>;
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
            url: '/v1/api/store/{team_slug}/setting/job_preset/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Update job preset
     * Updates an existing job preset.
     * @param teamSlug Team slug identifier
     * @param id Job preset ID
     * @param requestBody
     * @returns any Job preset updated successfully
     * @throws ApiError
     */
    public static updateJobPreset(
        teamSlug: string,
        id: string,
        requestBody: {
            id: string;
            name: string;
            note?: string;
            service: Array<({
                id: string;
                service_id: string;
                location: {
                    id?: string;
                    name?: string;
                    type: 'database' | 'custom';
                };
                note?: string;
                option: string;
                position: number;
                action: 'update' | 'create' | 'delete';
            } | {
                service_id: string;
                location: {
                    id?: string;
                    name?: string;
                    type: 'database' | 'custom';
                };
                note?: string;
                option: string;
                position: number;
                action: 'create' | 'update' | 'delete';
            })>;
            pipeline: Array<({
                pipeline_id: string;
                position: number;
                name: string;
                assigned_users: Array<{
                    id: string;
                    name: string;
                    avatar_url: string;
                }>;
                action: 'create' | 'update' | 'delete';
            } | {
                id: string;
                pipeline_id: string;
                position: number;
                name: string;
                assigned_users: Array<{
                    id: string;
                    name: string;
                    avatar_url: string;
                }>;
                action: 'create' | 'update' | 'delete';
            })>;
        },
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            note: string;
            is_valid: boolean;
            service: Array<{
                id: string;
                service_id: string;
                service_name: string;
                location: {
                    id: (string | null);
                    name?: string;
                    display_name: string;
                    type: 'database' | 'custom';
                    trashed?: boolean;
                };
                note: string;
                customer_note?: string | null;
                option: string;
                position: number;
                valid: boolean;
                _edit?: {
                    is_new: boolean;
                };
            }>;
            pipeline: Array<{
                id: string;
                pipeline_id: string;
                position: number;
                name: string;
                note: string | null;
                trashed: boolean;
                is_valid: boolean;
                assigned_users: Array<{
                    id: string;
                    name: string;
                    avatar_url: string;
                }>;
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
            url: '/v1/api/store/{team_slug}/setting/job_preset/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Remove job preset
     * Removes a job preset.
     * @param teamSlug Team slug identifier
     * @param id Job preset ID
     * @returns any Job preset removed successfully
     * @throws ApiError
     */
    public static removeJobPreset(
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
            url: '/v1/api/store/{team_slug}/setting/job_preset/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
}
