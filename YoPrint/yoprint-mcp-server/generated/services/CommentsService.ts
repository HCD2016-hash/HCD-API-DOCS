/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class CommentsService {
    /**
     * Get comments for purchase order
     * Retrieves a list of comments associated with a specific purchase order
     * @param teamSlug Team slug identifier
     * @param purchaseOrderId Purchase order identifier
     * @returns any List of comments for the purchase order
     * @throws ApiError
     */
    public static getCommentListForPurchaseOrder(
        teamSlug: string,
        purchaseOrderId: string,
    ): CancelablePromise<{
        /**
         * Array of comment objects
         */
        data: Array<{
            /**
             * Unique identifier for the comment
             */
            id: string;
            /**
             * The comment text content
             */
            comment: string;
            /**
             * ID of the associated purchase order (only present for purchase order comments)
             */
            purchase_order_id?: string | null;
            /**
             * ID of the associated sales order (only present for sales order/job comments)
             */
            order_id?: string | null;
            /**
             * ID of the associated job (only present for sales order/job comments)
             */
            job_id?: string | null;
            /**
             * Scoped identifier for the job (only present for sales order/job comments)
             */
            job_scoped_id?: string | null;
            /**
             * Name of the associated job (only present for sales order/job comments)
             */
            job_name?: string | null;
            /**
             * ID of the user who created the comment
             */
            user_id: string;
            /**
             * Whether the comment has been edited
             */
            is_edited: boolean;
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last update timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: string;
            /**
             * Whether the comment is marked as trashed
             */
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
            url: '/v1/api/store/{team_slug}/purchase_order/{purchaseOrderId}/comment',
            path: {
                'team_slug': teamSlug,
                'purchaseOrderId': purchaseOrderId,
            },
        });
    }
    /**
     * Create comment for purchase order
     * Creates a new comment for a specific purchase order
     * @param teamSlug Team slug identifier
     * @param purchaseOrderId Purchase order identifier
     * @param requestBody
     * @returns any Comment created successfully
     * @throws ApiError
     */
    public static createCommentForPurchaseOrder(
        teamSlug: string,
        purchaseOrderId: string,
        requestBody: {
            /**
             * The comment text content to create
             */
            comment: string;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the comment
             */
            id: string;
            /**
             * The comment text content
             */
            comment: string;
            /**
             * ID of the associated purchase order (only present for purchase order comments)
             */
            purchase_order_id?: string | null;
            /**
             * ID of the associated sales order (only present for sales order/job comments)
             */
            order_id?: string | null;
            /**
             * ID of the associated job (only present for sales order/job comments)
             */
            job_id?: string | null;
            /**
             * Scoped identifier for the job (only present for sales order/job comments)
             */
            job_scoped_id?: string | null;
            /**
             * Name of the associated job (only present for sales order/job comments)
             */
            job_name?: string | null;
            /**
             * ID of the user who created the comment
             */
            user_id: string;
            /**
             * Whether the comment has been edited
             */
            is_edited: boolean;
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last update timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: string;
            /**
             * Whether the comment is marked as trashed
             */
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
            url: '/v1/api/store/{team_slug}/purchase_order/{purchaseOrderId}/comment',
            path: {
                'team_slug': teamSlug,
                'purchaseOrderId': purchaseOrderId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get comments for sales order
     * Retrieves a list of comments associated with a specific sales order
     * @param teamSlug Team slug identifier
     * @param salesOrderId Sales order identifier
     * @returns any List of comments for the sales order
     * @throws ApiError
     */
    public static getCommentListForSalesOrder(
        teamSlug: string,
        salesOrderId: string,
    ): CancelablePromise<{
        /**
         * Array of comment objects
         */
        data: Array<{
            /**
             * Unique identifier for the comment
             */
            id: string;
            /**
             * The comment text content
             */
            comment: string;
            /**
             * ID of the associated purchase order (only present for purchase order comments)
             */
            purchase_order_id?: string | null;
            /**
             * ID of the associated sales order (only present for sales order/job comments)
             */
            order_id?: string | null;
            /**
             * ID of the associated job (only present for sales order/job comments)
             */
            job_id?: string | null;
            /**
             * Scoped identifier for the job (only present for sales order/job comments)
             */
            job_scoped_id?: string | null;
            /**
             * Name of the associated job (only present for sales order/job comments)
             */
            job_name?: string | null;
            /**
             * ID of the user who created the comment
             */
            user_id: string;
            /**
             * Whether the comment has been edited
             */
            is_edited: boolean;
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last update timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: string;
            /**
             * Whether the comment is marked as trashed
             */
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
            url: '/v2/api/store/{team_slug}/v2/sales_order/{salesOrderId}/comment/index',
            path: {
                'team_slug': teamSlug,
                'salesOrderId': salesOrderId,
            },
        });
    }
    /**
     * Create comment for sales order
     * Creates a new comment for a specific sales order
     * @param teamSlug Team slug identifier
     * @param salesOrderId Sales order identifier
     * @param requestBody
     * @returns any Comment created successfully
     * @throws ApiError
     */
    public static createCommentForSalesOrder(
        teamSlug: string,
        salesOrderId: string,
        requestBody: {
            /**
             * The comment text content to create
             */
            comment: string;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the comment
             */
            id: string;
            /**
             * The comment text content
             */
            comment: string;
            /**
             * ID of the associated purchase order (only present for purchase order comments)
             */
            purchase_order_id?: string | null;
            /**
             * ID of the associated sales order (only present for sales order/job comments)
             */
            order_id?: string | null;
            /**
             * ID of the associated job (only present for sales order/job comments)
             */
            job_id?: string | null;
            /**
             * Scoped identifier for the job (only present for sales order/job comments)
             */
            job_scoped_id?: string | null;
            /**
             * Name of the associated job (only present for sales order/job comments)
             */
            job_name?: string | null;
            /**
             * ID of the user who created the comment
             */
            user_id: string;
            /**
             * Whether the comment has been edited
             */
            is_edited: boolean;
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last update timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: string;
            /**
             * Whether the comment is marked as trashed
             */
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
            url: '/v2/api/store/{team_slug}/v2/sales_order/{salesOrderId}/comment',
            path: {
                'team_slug': teamSlug,
                'salesOrderId': salesOrderId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get comments for job
     * Retrieves a list of comments associated with a specific job
     * @param teamSlug Team slug identifier
     * @param jobId Job identifier
     * @returns any List of comments for the job
     * @throws ApiError
     */
    public static getCommentListForJob(
        teamSlug: string,
        jobId: string,
    ): CancelablePromise<{
        /**
         * Array of comment objects
         */
        data: Array<{
            /**
             * Unique identifier for the comment
             */
            id: string;
            /**
             * The comment text content
             */
            comment: string;
            /**
             * ID of the associated purchase order (only present for purchase order comments)
             */
            purchase_order_id?: string | null;
            /**
             * ID of the associated sales order (only present for sales order/job comments)
             */
            order_id?: string | null;
            /**
             * ID of the associated job (only present for sales order/job comments)
             */
            job_id?: string | null;
            /**
             * Scoped identifier for the job (only present for sales order/job comments)
             */
            job_scoped_id?: string | null;
            /**
             * Name of the associated job (only present for sales order/job comments)
             */
            job_name?: string | null;
            /**
             * ID of the user who created the comment
             */
            user_id: string;
            /**
             * Whether the comment has been edited
             */
            is_edited: boolean;
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last update timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: string;
            /**
             * Whether the comment is marked as trashed
             */
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
            url: '/v2/api/store/{team_slug}/v2/job/{jobId}/comment',
            path: {
                'team_slug': teamSlug,
                'jobId': jobId,
            },
        });
    }
    /**
     * Create comment for job
     * Creates a new comment for a specific job
     * @param teamSlug Team slug identifier
     * @param jobId Job identifier
     * @param requestBody
     * @returns any Comment created successfully
     * @throws ApiError
     */
    public static createCommentForJob(
        teamSlug: string,
        jobId: string,
        requestBody: {
            /**
             * The comment text content to create
             */
            comment: string;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the comment
             */
            id: string;
            /**
             * The comment text content
             */
            comment: string;
            /**
             * ID of the associated purchase order (only present for purchase order comments)
             */
            purchase_order_id?: string | null;
            /**
             * ID of the associated sales order (only present for sales order/job comments)
             */
            order_id?: string | null;
            /**
             * ID of the associated job (only present for sales order/job comments)
             */
            job_id?: string | null;
            /**
             * Scoped identifier for the job (only present for sales order/job comments)
             */
            job_scoped_id?: string | null;
            /**
             * Name of the associated job (only present for sales order/job comments)
             */
            job_name?: string | null;
            /**
             * ID of the user who created the comment
             */
            user_id: string;
            /**
             * Whether the comment has been edited
             */
            is_edited: boolean;
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last update timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: string;
            /**
             * Whether the comment is marked as trashed
             */
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
            url: '/v2/api/store/{team_slug}/v2/job/{jobId}/comment',
            path: {
                'team_slug': teamSlug,
                'jobId': jobId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get single comment
     * Retrieves a specific comment by its ID
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any Comment details
     * @throws ApiError
     */
    public static getComment(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the comment
             */
            id: string;
            /**
             * The comment text content
             */
            comment: string;
            /**
             * ID of the associated purchase order (only present for purchase order comments)
             */
            purchase_order_id?: string | null;
            /**
             * ID of the associated sales order (only present for sales order/job comments)
             */
            order_id?: string | null;
            /**
             * ID of the associated job (only present for sales order/job comments)
             */
            job_id?: string | null;
            /**
             * Scoped identifier for the job (only present for sales order/job comments)
             */
            job_scoped_id?: string | null;
            /**
             * Name of the associated job (only present for sales order/job comments)
             */
            job_name?: string | null;
            /**
             * ID of the user who created the comment
             */
            user_id: string;
            /**
             * Whether the comment has been edited
             */
            is_edited: boolean;
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last update timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: string;
            /**
             * Whether the comment is marked as trashed
             */
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
            url: '/v1/api/store/{team_slug}/comment/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Update comment
     * Updates an existing comment
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @param requestBody
     * @returns any Comment updated successfully
     * @throws ApiError
     */
    public static updateComment(
        teamSlug: string,
        id: string,
        requestBody: {
            /**
             * The updated comment text content
             */
            comment: string;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the comment
             */
            id: string;
            /**
             * The comment text content
             */
            comment: string;
            /**
             * ID of the associated purchase order (only present for purchase order comments)
             */
            purchase_order_id?: string | null;
            /**
             * ID of the associated sales order (only present for sales order/job comments)
             */
            order_id?: string | null;
            /**
             * ID of the associated job (only present for sales order/job comments)
             */
            job_id?: string | null;
            /**
             * Scoped identifier for the job (only present for sales order/job comments)
             */
            job_scoped_id?: string | null;
            /**
             * Name of the associated job (only present for sales order/job comments)
             */
            job_name?: string | null;
            /**
             * ID of the user who created the comment
             */
            user_id: string;
            /**
             * Whether the comment has been edited
             */
            is_edited: boolean;
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last update timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: string;
            /**
             * Whether the comment is marked as trashed
             */
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
            url: '/v1/api/store/{team_slug}/comment/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Remove comment
     * Deletes a specific comment
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any Comment removed successfully
     * @throws ApiError
     */
    public static removeComment(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the comment
             */
            id: string;
            /**
             * The comment text content
             */
            comment: string;
            /**
             * ID of the associated purchase order (only present for purchase order comments)
             */
            purchase_order_id?: string | null;
            /**
             * ID of the associated sales order (only present for sales order/job comments)
             */
            order_id?: string | null;
            /**
             * ID of the associated job (only present for sales order/job comments)
             */
            job_id?: string | null;
            /**
             * Scoped identifier for the job (only present for sales order/job comments)
             */
            job_scoped_id?: string | null;
            /**
             * Name of the associated job (only present for sales order/job comments)
             */
            job_name?: string | null;
            /**
             * ID of the user who created the comment
             */
            user_id: string;
            /**
             * Whether the comment has been edited
             */
            is_edited: boolean;
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last update timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: string;
            /**
             * Whether the comment is marked as trashed
             */
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
            method: 'DELETE',
            url: '/v1/api/store/{team_slug}/comment/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
}
