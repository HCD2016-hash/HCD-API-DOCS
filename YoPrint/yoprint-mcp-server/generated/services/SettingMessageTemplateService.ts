/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SettingMessageTemplateService {
    /**
     * Get message templates list
     * Retrieves a list of message templates for the specified team.
     * @param teamSlug Team slug identifier
     * @returns any List of message templates retrieved successfully
     * @throws ApiError
     */
    public static getMessageTemplatesList(
        teamSlug: string,
    ): CancelablePromise<{
        data: Array<{
            /**
             * Unique identifier for the message template
             */
            id: string;
            /**
             * Template type (e.g., purchase_order_message, sales_order_message, quote_message, etc.)
             */
            type: string;
            /**
             * Human-readable name for the message template
             */
            name: string;
            /**
             * Email subject line template (null for SMS templates)
             */
            subject: (string | null);
            /**
             * Template body content with placeholder variables
             */
            body: string;
            /**
             * Whether this is a system-managed template (read-only)
             */
            system?: boolean;
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Update timestamp in UTC ISO 8601 format (null if never updated) (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: (string | null);
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
            url: '/v2/api/store/{team_slug}/setting/message_template',
            path: {
                'team_slug': teamSlug,
            },
        });
    }
    /**
     * Create message template
     * Creates a new message template.
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Message template created successfully
     * @throws ApiError
     */
    public static createMessageTemplate(
        teamSlug: string,
        requestBody: {
            /**
             * Template type (e.g., purchase_order_message, sales_order_message, quote_message, etc.)
             */
            type: string;
            /**
             * Human-readable name for the message template
             */
            name: string;
            /**
             * Email subject line template (null for SMS templates)
             */
            subject: string;
            /**
             * Template body content with placeholder variables
             */
            body: string;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the message template
             */
            id: string;
            /**
             * Template type (e.g., purchase_order_message, sales_order_message, quote_message, etc.)
             */
            type: string;
            /**
             * Human-readable name for the message template
             */
            name: string;
            /**
             * Email subject line template (null for SMS templates)
             */
            subject: (string | null);
            /**
             * Template body content with placeholder variables
             */
            body: string;
            /**
             * Whether this is a system-managed template (read-only)
             */
            system?: boolean;
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Update timestamp in UTC ISO 8601 format (null if never updated) (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: (string | null);
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
            url: '/v2/api/store/{team_slug}/setting/message_template',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get message template by ID
     * Retrieves a specific message template by its ID.
     * @param teamSlug Team slug identifier
     * @param id Message template ID
     * @returns any Message template retrieved successfully
     * @throws ApiError
     */
    public static getMessageTemplateById(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the message template
             */
            id: string;
            /**
             * Template type (e.g., purchase_order_message, sales_order_message, quote_message, etc.)
             */
            type: string;
            /**
             * Human-readable name for the message template
             */
            name: string;
            /**
             * Email subject line template (null for SMS templates)
             */
            subject: (string | null);
            /**
             * Template body content with placeholder variables
             */
            body: string;
            /**
             * Whether this is a system-managed template (read-only)
             */
            system?: boolean;
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Update timestamp in UTC ISO 8601 format (null if never updated) (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: (string | null);
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
            url: '/v2/api/store/{team_slug}/setting/message_template/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Update message template
     * Updates an existing message template.
     * @param teamSlug Team slug identifier
     * @param id Message template ID
     * @param requestBody
     * @returns any Message template updated successfully
     * @throws ApiError
     */
    public static updateMessageTemplate(
        teamSlug: string,
        id: string,
        requestBody: {
            /**
             * Unique identifier for the message template
             */
            id: string;
            /**
             * Human-readable name for the message template
             */
            name: string;
            /**
             * Email subject line template (null for SMS templates)
             */
            subject: string;
            /**
             * Template body content with placeholder variables
             */
            body: string;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the message template
             */
            id: string;
            /**
             * Template type (e.g., purchase_order_message, sales_order_message, quote_message, etc.)
             */
            type: string;
            /**
             * Human-readable name for the message template
             */
            name: string;
            /**
             * Email subject line template (null for SMS templates)
             */
            subject: (string | null);
            /**
             * Template body content with placeholder variables
             */
            body: string;
            /**
             * Whether this is a system-managed template (read-only)
             */
            system?: boolean;
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Update timestamp in UTC ISO 8601 format (null if never updated) (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: (string | null);
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
            url: '/v2/api/store/{team_slug}/setting/message_template/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Delete message template
     * Deletes an existing message template.
     * @param teamSlug Team slug identifier
     * @param id Message template ID
     * @returns any Message template deleted successfully
     * @throws ApiError
     */
    public static deleteMessageTemplate(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        /**
         * Null response indicating successful deletion
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
            url: '/v2/api/store/{team_slug}/setting/message_template/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Preview message template
     * Previews template rendering with placeholders.
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Template preview generated successfully
     * @throws ApiError
     */
    public static previewMessageTemplate(
        teamSlug: string,
        requestBody: {
            /**
             * Template type for preview rendering
             */
            type: string;
            /**
             * Template body content to preview
             */
            body: string;
        },
    ): CancelablePromise<{
        /**
         * Indicates if the request was successful
         */
        success: boolean;
        data: {
            /**
             * Rendered template body with placeholders filled
             */
            rendered_body: string;
            /**
             * Rendered subject line (null for SMS templates)
             */
            rendered_subject: (string | null);
        };
    }> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/v2/api/store/{team_slug}/setting/message_template/preview',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Compile message template
     * Compiles template with actual business object data.
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Template compiled successfully
     * @throws ApiError
     */
    public static compileMessageTemplate(
        teamSlug: string,
        requestBody: {
            /**
             * Message template ID to compile
             */
            id: string;
            /**
             * Business object ID to compile template with (e.g., sales order ID)
             */
            object_id: string;
        },
    ): CancelablePromise<{
        /**
         * Indicates if the request was successful
         */
        success: boolean;
        data: {
            /**
             * Compiled template body with business object data
             */
            compiled_body: string;
            /**
             * Compiled subject line (null for SMS templates)
             */
            compiled_subject: (string | null);
        };
    }> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/v2/api/store/{team_slug}/setting/message_template/compile',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
}
