/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class ApprovalService {
    /**
     * Get filtered list of approvals
     * Retrieve a filtered list of approvals using POST method for complex filtering. This endpoint uses POST instead of GET to support complex filter criteria in the request body. Response excludes mockup arrays for performance.
     * @param teamSlug Team slug identifier
     * @param page Page number for pagination
     * @param requestBody Filter and sort criteria for approval list. Omit filters and sort arrays if empty to avoid 422 errors.
     * @returns any Successfully retrieved filtered approvals
     * @throws ApiError
     */
    public static getApprovals(
        teamSlug: string,
        page: number = 1,
        requestBody?: {
            /**
             * Array of filter conditions (omit if empty to avoid 422 error)
             */
            filters?: Array<{
                /**
                 * Field to filter on
                 */
                key: string;
                /**
                 * Filter operator
                 */
                operator: 'gt' | 'gte' | 'eq' | 'neq' | 'lt' | 'lte' | 'in' | 'nin';
                /**
                 * Filter value
                 */
                value: any;
            }>;
            /**
             * Array of sort conditions (omit if empty to avoid 422 error)
             */
            sort?: Array<{
                /**
                 * Field to sort by
                 */
                key: string;
                /**
                 * Sort direction
                 */
                direction: 'asc' | 'desc';
            }>;
            /**
             * Page number for pagination
             */
            page?: number;
        },
    ): CancelablePromise<{
        /**
         * Array of approval items (without mockup array for performance)
         */
        data: Array<{
            /**
             * Unique identifier for the approval
             */
            id: string;
            /**
             * Type of approval - either job-level or order-level
             */
            type: 'job' | 'order';
            /**
             * Who approved the approval - user or customer
             */
            approved_by: 'user' | 'customer';
            /**
             * Associated job ID (only present when type=job)
             */
            job_id?: string;
            /**
             * Job scoped identifier (only present when type=job)
             */
            job_scoped_id?: string;
            /**
             * Job display name (only present when type=job)
             */
            job_name?: string;
            /**
             * Associated order ID
             */
            order_id: string;
            /**
             * Order scoped identifier
             */
            order_scoped_id: string;
            /**
             * Whether the associated order is a quote
             */
            order_quote: boolean;
            /**
             * User who approved the approval (null if not yet approved by user)
             */
            approved_by_user?: (string | null);
            /**
             * Whether the approval is completed
             */
            completed: boolean;
            /**
             * Completion timestamp in UTC ISO 8601 format (null if not completed) (e.g., 2023-12-25T10:30:00.000Z)
             */
            completed_at?: (string | null);
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last time customer viewed this approval in UTC ISO 8601 format (null if never viewed) (e.g., 2023-12-25T10:30:00.000Z)
             */
            customer_last_viewed_date?: (string | null);
            /**
             * Feedback or notes provided by the customer (null or empty string if no notes provided)
             */
            notes_from_customer?: (string | null);
            /**
             * Instructions or notes provided to the customer (can be empty string)
             */
            notes_to_customer: string;
            /**
             * Customer signature data (null if not signed yet)
             */
            signature?: (string | null);
            /**
             * Status of the approval workflow
             */
            status: 'pending' | 'sent-to-customer' | 'viewed-by-customer' | 'need-changes' | 'completed';
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
            url: '/v1/api/store/{team_slug}/approvals/filter',
            path: {
                'team_slug': teamSlug,
            },
            query: {
                'page': page,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get all approvals for a specific order
     * Retrieve all approvals associated with a specific sales order. Response includes mockup arrays for job approvals.
     * @param teamSlug Team slug identifier
     * @param orderId Order ID to get approvals for
     * @returns any Successfully retrieved order approvals
     * @throws ApiError
     */
    public static getApprovalsForOrder(
        teamSlug: string,
        orderId: string,
    ): CancelablePromise<{
        /**
         * Array of approval items (without mockup array for performance)
         */
        data: Array<{
            /**
             * Unique identifier for the approval
             */
            id: string;
            /**
             * Type of approval - either job-level or order-level
             */
            type: 'job' | 'order';
            /**
             * Who approved the approval - user or customer
             */
            approved_by: 'user' | 'customer';
            /**
             * Associated job ID (only present when type=job)
             */
            job_id?: string;
            /**
             * Job scoped identifier (only present when type=job)
             */
            job_scoped_id?: string;
            /**
             * Job display name (only present when type=job)
             */
            job_name?: string;
            /**
             * Associated order ID
             */
            order_id: string;
            /**
             * Order scoped identifier
             */
            order_scoped_id: string;
            /**
             * Whether the associated order is a quote
             */
            order_quote: boolean;
            /**
             * User who approved the approval (null if not yet approved by user)
             */
            approved_by_user?: (string | null);
            /**
             * Whether the approval is completed
             */
            completed: boolean;
            /**
             * Completion timestamp in UTC ISO 8601 format (null if not completed) (e.g., 2023-12-25T10:30:00.000Z)
             */
            completed_at?: (string | null);
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last time customer viewed this approval in UTC ISO 8601 format (null if never viewed) (e.g., 2023-12-25T10:30:00.000Z)
             */
            customer_last_viewed_date?: (string | null);
            /**
             * Feedback or notes provided by the customer (null or empty string if no notes provided)
             */
            notes_from_customer?: (string | null);
            /**
             * Instructions or notes provided to the customer (can be empty string)
             */
            notes_to_customer: string;
            /**
             * Customer signature data (null if not signed yet)
             */
            signature?: (string | null);
            /**
             * Status of the approval workflow
             */
            status: 'pending' | 'sent-to-customer' | 'viewed-by-customer' | 'need-changes' | 'completed';
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
            url: '/v2/api/store/{team_slug}/v2/sales_order/{orderId}/all_approvals',
            path: {
                'team_slug': teamSlug,
                'orderId': orderId,
            },
        });
    }
    /**
     * Get single approval details
     * Retrieve detailed information for a single approval. Returns CollectionResponseModel (not EntityResponseModel) as per API implementation. Includes mockup array for job approvals.
     * @param teamSlug Team slug identifier
     * @param id Approval ID
     * @returns any Successfully retrieved approval details
     * @throws ApiError
     */
    public static getApproval(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        /**
         * Array of approval items (without mockup array for performance)
         */
        data: Array<{
            /**
             * Unique identifier for the approval
             */
            id: string;
            /**
             * Type of approval - either job-level or order-level
             */
            type: 'job' | 'order';
            /**
             * Who approved the approval - user or customer
             */
            approved_by: 'user' | 'customer';
            /**
             * Associated job ID (only present when type=job)
             */
            job_id?: string;
            /**
             * Job scoped identifier (only present when type=job)
             */
            job_scoped_id?: string;
            /**
             * Job display name (only present when type=job)
             */
            job_name?: string;
            /**
             * Associated order ID
             */
            order_id: string;
            /**
             * Order scoped identifier
             */
            order_scoped_id: string;
            /**
             * Whether the associated order is a quote
             */
            order_quote: boolean;
            /**
             * User who approved the approval (null if not yet approved by user)
             */
            approved_by_user?: (string | null);
            /**
             * Whether the approval is completed
             */
            completed: boolean;
            /**
             * Completion timestamp in UTC ISO 8601 format (null if not completed) (e.g., 2023-12-25T10:30:00.000Z)
             */
            completed_at?: (string | null);
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last time customer viewed this approval in UTC ISO 8601 format (null if never viewed) (e.g., 2023-12-25T10:30:00.000Z)
             */
            customer_last_viewed_date?: (string | null);
            /**
             * Feedback or notes provided by the customer (null or empty string if no notes provided)
             */
            notes_from_customer?: (string | null);
            /**
             * Instructions or notes provided to the customer (can be empty string)
             */
            notes_to_customer: string;
            /**
             * Customer signature data (null if not signed yet)
             */
            signature?: (string | null);
            /**
             * Status of the approval workflow
             */
            status: 'pending' | 'sent-to-customer' | 'viewed-by-customer' | 'need-changes' | 'completed';
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
            url: '/v1/api/store/{team_slug}/approvals/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Delete approval
     * Delete an existing approval
     * @param teamSlug Team slug identifier
     * @param id Approval ID to delete
     * @returns any Successfully deleted approval
     * @throws ApiError
     */
    public static deleteApproval(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        /**
         * No data returned for delete operations
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
            url: '/v1/api/store/{team_slug}/approvals/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Create new job approval
     * Create a new approval for a specific job with mockup media attachments
     * @param teamSlug Team slug identifier
     * @param jobId Job ID to create approval for
     * @param requestBody Job approval creation data
     * @returns any Successfully created job approval
     * @throws ApiError
     */
    public static createJobApproval(
        teamSlug: string,
        jobId: string,
        requestBody: {
            /**
             * Associated order ID
             */
            order_id: string;
            /**
             * Associated job ID
             */
            job_id: string;
            /**
             * Instructions or notes to provide to the customer (can be empty string)
             */
            notes_to_customer: string;
            /**
             * Array of media items to include in the job approval
             */
            mockup: Array<{
                /**
                 * Media file ID to include in approval
                 */
                media_id: string;
                /**
                 * Notes for this specific media item (can be empty string)
                 */
                notes_to_customer: string;
            }>;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the approval
             */
            id: string;
            /**
             * Type of approval - either job-level or order-level
             */
            type: 'job' | 'order';
            /**
             * Who approved the approval - user or customer
             */
            approved_by: 'user' | 'customer';
            /**
             * Associated job ID (only present when type=job)
             */
            job_id?: string;
            /**
             * Job scoped identifier (only present when type=job)
             */
            job_scoped_id?: string;
            /**
             * Job display name (only present when type=job)
             */
            job_name?: string;
            /**
             * Associated order ID
             */
            order_id: string;
            /**
             * Order scoped identifier
             */
            order_scoped_id: string;
            /**
             * Whether the associated order is a quote
             */
            order_quote: boolean;
            /**
             * User who approved the approval (null if not yet approved by user)
             */
            approved_by_user?: (string | null);
            /**
             * Whether the approval is completed
             */
            completed: boolean;
            /**
             * Completion timestamp in UTC ISO 8601 format (null if not completed) (e.g., 2023-12-25T10:30:00.000Z)
             */
            completed_at?: (string | null);
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last time customer viewed this approval in UTC ISO 8601 format (null if never viewed) (e.g., 2023-12-25T10:30:00.000Z)
             */
            customer_last_viewed_date?: (string | null);
            /**
             * Media attachments for approval (only present for job approvals in detail view, absent in list endpoints)
             */
            mockup?: Array<{
                /**
                 * Unique identifier for the media approval
                 */
                id: string;
                /**
                 * Reference to the media file
                 */
                media_id: string;
                /**
                 * Notes or instructions provided to the customer for this media (can be null or empty string)
                 */
                notes_to_customer?: (string | null);
                /**
                 * Feedback or notes provided by the customer for this media (can be null or empty string)
                 */
                notes_from_customer?: (string | null);
                /**
                 * Status of individual media approval within an approval
                 */
                status: 'pending-approval' | 'approved' | 'need-changes';
                /**
                 * Media collection identifier
                 */
                collection: string;
                /**
                 * MIME type of the media file
                 */
                mime_type: string;
                /**
                 * Whether the media is an image file
                 */
                is_image: boolean;
                /**
                 * Whether to include this media in PDF exports
                 */
                show_in_pdf: boolean;
                /**
                 * Display name of the media
                 */
                name: string;
                /**
                 * Original file name of the media
                 */
                file_name: string;
                /**
                 * File size in bytes
                 */
                size: number;
                /**
                 * Download URL for the media
                 */
                url: string;
                /**
                 * View URL for the media
                 */
                view_url: string;
                /**
                 * Preview URLs for different sizes (optional)
                 */
                preview?: {
                    /**
                     * Large preview URL
                     */
                    large: string;
                    /**
                     * Medium preview URL
                     */
                    medium: string;
                    /**
                     * Small preview URL
                     */
                    small: string;
                };
                /**
                 * Display order position of this media
                 */
                position: number;
                /**
                 * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
                 */
                created_at: string;
            }>;
            /**
             * Feedback or notes provided by the customer (null or empty string if no notes provided)
             */
            notes_from_customer?: (string | null);
            /**
             * Instructions or notes provided to the customer (can be empty string)
             */
            notes_to_customer: string;
            /**
             * Customer signature data (null if not signed yet)
             */
            signature?: (string | null);
            /**
             * Status of the approval workflow
             */
            status: 'pending' | 'sent-to-customer' | 'viewed-by-customer' | 'need-changes' | 'completed';
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
            url: '/v2/api/store/{team_slug}/v2/job/{jobId}/approval',
            path: {
                'team_slug': teamSlug,
                'jobId': jobId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Create new order approval
     * Create a new approval for a specific sales order
     * @param teamSlug Team slug identifier
     * @param orderId Order ID to create approval for
     * @param requestBody Order approval creation data
     * @returns any Successfully created order approval
     * @throws ApiError
     */
    public static createOrderApproval(
        teamSlug: string,
        orderId: string,
        requestBody: {
            /**
             * Associated order ID
             */
            order_id: string;
            /**
             * Instructions or notes to provide to the customer (can be empty string)
             */
            notes_to_customer: string;
            /**
             * Whether to send the approval to customer later or immediately
             */
            send_later: boolean;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the approval
             */
            id: string;
            /**
             * Type of approval - either job-level or order-level
             */
            type: 'job' | 'order';
            /**
             * Who approved the approval - user or customer
             */
            approved_by: 'user' | 'customer';
            /**
             * Associated job ID (only present when type=job)
             */
            job_id?: string;
            /**
             * Job scoped identifier (only present when type=job)
             */
            job_scoped_id?: string;
            /**
             * Job display name (only present when type=job)
             */
            job_name?: string;
            /**
             * Associated order ID
             */
            order_id: string;
            /**
             * Order scoped identifier
             */
            order_scoped_id: string;
            /**
             * Whether the associated order is a quote
             */
            order_quote: boolean;
            /**
             * User who approved the approval (null if not yet approved by user)
             */
            approved_by_user?: (string | null);
            /**
             * Whether the approval is completed
             */
            completed: boolean;
            /**
             * Completion timestamp in UTC ISO 8601 format (null if not completed) (e.g., 2023-12-25T10:30:00.000Z)
             */
            completed_at?: (string | null);
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last time customer viewed this approval in UTC ISO 8601 format (null if never viewed) (e.g., 2023-12-25T10:30:00.000Z)
             */
            customer_last_viewed_date?: (string | null);
            /**
             * Media attachments for approval (only present for job approvals in detail view, absent in list endpoints)
             */
            mockup?: Array<{
                /**
                 * Unique identifier for the media approval
                 */
                id: string;
                /**
                 * Reference to the media file
                 */
                media_id: string;
                /**
                 * Notes or instructions provided to the customer for this media (can be null or empty string)
                 */
                notes_to_customer?: (string | null);
                /**
                 * Feedback or notes provided by the customer for this media (can be null or empty string)
                 */
                notes_from_customer?: (string | null);
                /**
                 * Status of individual media approval within an approval
                 */
                status: 'pending-approval' | 'approved' | 'need-changes';
                /**
                 * Media collection identifier
                 */
                collection: string;
                /**
                 * MIME type of the media file
                 */
                mime_type: string;
                /**
                 * Whether the media is an image file
                 */
                is_image: boolean;
                /**
                 * Whether to include this media in PDF exports
                 */
                show_in_pdf: boolean;
                /**
                 * Display name of the media
                 */
                name: string;
                /**
                 * Original file name of the media
                 */
                file_name: string;
                /**
                 * File size in bytes
                 */
                size: number;
                /**
                 * Download URL for the media
                 */
                url: string;
                /**
                 * View URL for the media
                 */
                view_url: string;
                /**
                 * Preview URLs for different sizes (optional)
                 */
                preview?: {
                    /**
                     * Large preview URL
                     */
                    large: string;
                    /**
                     * Medium preview URL
                     */
                    medium: string;
                    /**
                     * Small preview URL
                     */
                    small: string;
                };
                /**
                 * Display order position of this media
                 */
                position: number;
                /**
                 * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
                 */
                created_at: string;
            }>;
            /**
             * Feedback or notes provided by the customer (null or empty string if no notes provided)
             */
            notes_from_customer?: (string | null);
            /**
             * Instructions or notes provided to the customer (can be empty string)
             */
            notes_to_customer: string;
            /**
             * Customer signature data (null if not signed yet)
             */
            signature?: (string | null);
            /**
             * Status of the approval workflow
             */
            status: 'pending' | 'sent-to-customer' | 'viewed-by-customer' | 'need-changes' | 'completed';
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
            url: '/v2/api/store/{team_slug}/v2/sales_order/{orderId}/approval',
            path: {
                'team_slug': teamSlug,
                'orderId': orderId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Update job approval
     * Update an existing job approval including mockup media modifications
     * @param teamSlug Team slug identifier
     * @param id Approval ID to update
     * @param requestBody Job approval update data
     * @returns any Successfully updated job approval
     * @throws ApiError
     */
    public static updateJobApproval(
        teamSlug: string,
        id: string,
        requestBody: {
            /**
             * Approval ID to update
             */
            id: string;
            /**
             * Associated order ID
             */
            order_id: string;
            /**
             * Associated job ID
             */
            job_id: string;
            /**
             * Updated instructions or notes for the customer (can be empty string)
             */
            notes_to_customer: string;
            /**
             * Array of media updates for the job approval
             */
            mockup: Array<{
                /**
                 * Media approval ID (null for new media)
                 */
                id: string | null;
                /**
                 * Media file ID
                 */
                media_id: string;
                /**
                 * Notes for this media item (can be empty string)
                 */
                notes_to_customer: string;
                /**
                 * Action to perform on approval media
                 */
                action: 'create' | 'update' | 'delete';
            }>;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the approval
             */
            id: string;
            /**
             * Type of approval - either job-level or order-level
             */
            type: 'job' | 'order';
            /**
             * Who approved the approval - user or customer
             */
            approved_by: 'user' | 'customer';
            /**
             * Associated job ID (only present when type=job)
             */
            job_id?: string;
            /**
             * Job scoped identifier (only present when type=job)
             */
            job_scoped_id?: string;
            /**
             * Job display name (only present when type=job)
             */
            job_name?: string;
            /**
             * Associated order ID
             */
            order_id: string;
            /**
             * Order scoped identifier
             */
            order_scoped_id: string;
            /**
             * Whether the associated order is a quote
             */
            order_quote: boolean;
            /**
             * User who approved the approval (null if not yet approved by user)
             */
            approved_by_user?: (string | null);
            /**
             * Whether the approval is completed
             */
            completed: boolean;
            /**
             * Completion timestamp in UTC ISO 8601 format (null if not completed) (e.g., 2023-12-25T10:30:00.000Z)
             */
            completed_at?: (string | null);
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last time customer viewed this approval in UTC ISO 8601 format (null if never viewed) (e.g., 2023-12-25T10:30:00.000Z)
             */
            customer_last_viewed_date?: (string | null);
            /**
             * Media attachments for approval (only present for job approvals in detail view, absent in list endpoints)
             */
            mockup?: Array<{
                /**
                 * Unique identifier for the media approval
                 */
                id: string;
                /**
                 * Reference to the media file
                 */
                media_id: string;
                /**
                 * Notes or instructions provided to the customer for this media (can be null or empty string)
                 */
                notes_to_customer?: (string | null);
                /**
                 * Feedback or notes provided by the customer for this media (can be null or empty string)
                 */
                notes_from_customer?: (string | null);
                /**
                 * Status of individual media approval within an approval
                 */
                status: 'pending-approval' | 'approved' | 'need-changes';
                /**
                 * Media collection identifier
                 */
                collection: string;
                /**
                 * MIME type of the media file
                 */
                mime_type: string;
                /**
                 * Whether the media is an image file
                 */
                is_image: boolean;
                /**
                 * Whether to include this media in PDF exports
                 */
                show_in_pdf: boolean;
                /**
                 * Display name of the media
                 */
                name: string;
                /**
                 * Original file name of the media
                 */
                file_name: string;
                /**
                 * File size in bytes
                 */
                size: number;
                /**
                 * Download URL for the media
                 */
                url: string;
                /**
                 * View URL for the media
                 */
                view_url: string;
                /**
                 * Preview URLs for different sizes (optional)
                 */
                preview?: {
                    /**
                     * Large preview URL
                     */
                    large: string;
                    /**
                     * Medium preview URL
                     */
                    medium: string;
                    /**
                     * Small preview URL
                     */
                    small: string;
                };
                /**
                 * Display order position of this media
                 */
                position: number;
                /**
                 * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
                 */
                created_at: string;
            }>;
            /**
             * Feedback or notes provided by the customer (null or empty string if no notes provided)
             */
            notes_from_customer?: (string | null);
            /**
             * Instructions or notes provided to the customer (can be empty string)
             */
            notes_to_customer: string;
            /**
             * Customer signature data (null if not signed yet)
             */
            signature?: (string | null);
            /**
             * Status of the approval workflow
             */
            status: 'pending' | 'sent-to-customer' | 'viewed-by-customer' | 'need-changes' | 'completed';
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
            url: '/v2/api/store/{team_slug}/v2/job/approval/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Update order approval
     * Update an existing order approval
     * @param teamSlug Team slug identifier
     * @param orderId Order ID associated with approval
     * @param id Approval ID to update
     * @param requestBody Order approval update data
     * @returns any Successfully updated order approval
     * @throws ApiError
     */
    public static updateOrderApproval(
        teamSlug: string,
        orderId: string,
        id: string,
        requestBody: {
            /**
             * Approval ID to update
             */
            id: string;
            /**
             * Associated order ID
             */
            order_id: string;
            /**
             * Updated instructions or notes for the customer (can be empty string)
             */
            notes_to_customer: string;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the approval
             */
            id: string;
            /**
             * Type of approval - either job-level or order-level
             */
            type: 'job' | 'order';
            /**
             * Who approved the approval - user or customer
             */
            approved_by: 'user' | 'customer';
            /**
             * Associated job ID (only present when type=job)
             */
            job_id?: string;
            /**
             * Job scoped identifier (only present when type=job)
             */
            job_scoped_id?: string;
            /**
             * Job display name (only present when type=job)
             */
            job_name?: string;
            /**
             * Associated order ID
             */
            order_id: string;
            /**
             * Order scoped identifier
             */
            order_scoped_id: string;
            /**
             * Whether the associated order is a quote
             */
            order_quote: boolean;
            /**
             * User who approved the approval (null if not yet approved by user)
             */
            approved_by_user?: (string | null);
            /**
             * Whether the approval is completed
             */
            completed: boolean;
            /**
             * Completion timestamp in UTC ISO 8601 format (null if not completed) (e.g., 2023-12-25T10:30:00.000Z)
             */
            completed_at?: (string | null);
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last time customer viewed this approval in UTC ISO 8601 format (null if never viewed) (e.g., 2023-12-25T10:30:00.000Z)
             */
            customer_last_viewed_date?: (string | null);
            /**
             * Media attachments for approval (only present for job approvals in detail view, absent in list endpoints)
             */
            mockup?: Array<{
                /**
                 * Unique identifier for the media approval
                 */
                id: string;
                /**
                 * Reference to the media file
                 */
                media_id: string;
                /**
                 * Notes or instructions provided to the customer for this media (can be null or empty string)
                 */
                notes_to_customer?: (string | null);
                /**
                 * Feedback or notes provided by the customer for this media (can be null or empty string)
                 */
                notes_from_customer?: (string | null);
                /**
                 * Status of individual media approval within an approval
                 */
                status: 'pending-approval' | 'approved' | 'need-changes';
                /**
                 * Media collection identifier
                 */
                collection: string;
                /**
                 * MIME type of the media file
                 */
                mime_type: string;
                /**
                 * Whether the media is an image file
                 */
                is_image: boolean;
                /**
                 * Whether to include this media in PDF exports
                 */
                show_in_pdf: boolean;
                /**
                 * Display name of the media
                 */
                name: string;
                /**
                 * Original file name of the media
                 */
                file_name: string;
                /**
                 * File size in bytes
                 */
                size: number;
                /**
                 * Download URL for the media
                 */
                url: string;
                /**
                 * View URL for the media
                 */
                view_url: string;
                /**
                 * Preview URLs for different sizes (optional)
                 */
                preview?: {
                    /**
                     * Large preview URL
                     */
                    large: string;
                    /**
                     * Medium preview URL
                     */
                    medium: string;
                    /**
                     * Small preview URL
                     */
                    small: string;
                };
                /**
                 * Display order position of this media
                 */
                position: number;
                /**
                 * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
                 */
                created_at: string;
            }>;
            /**
             * Feedback or notes provided by the customer (null or empty string if no notes provided)
             */
            notes_from_customer?: (string | null);
            /**
             * Instructions or notes provided to the customer (can be empty string)
             */
            notes_to_customer: string;
            /**
             * Customer signature data (null if not signed yet)
             */
            signature?: (string | null);
            /**
             * Status of the approval workflow
             */
            status: 'pending' | 'sent-to-customer' | 'viewed-by-customer' | 'need-changes' | 'completed';
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
            url: '/v2/api/store/{team_slug}/v2/sales_order/{orderId}/approval/{id}',
            path: {
                'team_slug': teamSlug,
                'orderId': orderId,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Complete job approval
     * Complete a job approval with customer signature and media approval status
     * @param teamSlug Team slug identifier
     * @param id Approval ID to complete
     * @param requestBody Job approval completion data including signature and media status
     * @returns any Successfully completed job approval
     * @throws ApiError
     */
    public static completeJobApproval(
        teamSlug: string,
        id: string,
        requestBody: {
            /**
             * Approval ID to complete
             */
            id: string;
            /**
             * Associated order ID
             */
            order_id: string;
            /**
             * Associated job ID
             */
            job_id: string;
            /**
             * Customer signature data
             */
            signature: string;
            /**
             * Overall customer feedback for the approval (can be empty string)
             */
            notes_from_customer: string;
            /**
             * Media approval status and feedback from customer
             */
            mockup: Array<{
                /**
                 * Media approval ID (optional for completion)
                 */
                id?: string;
                /**
                 * Customer feedback for this media item (can be empty string)
                 */
                notes_from_customer: string;
                /**
                 * Status of individual media approval within an approval
                 */
                status: 'pending-approval' | 'approved' | 'need-changes';
            }>;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the approval
             */
            id: string;
            /**
             * Type of approval - either job-level or order-level
             */
            type: 'job' | 'order';
            /**
             * Who approved the approval - user or customer
             */
            approved_by: 'user' | 'customer';
            /**
             * Associated job ID (only present when type=job)
             */
            job_id?: string;
            /**
             * Job scoped identifier (only present when type=job)
             */
            job_scoped_id?: string;
            /**
             * Job display name (only present when type=job)
             */
            job_name?: string;
            /**
             * Associated order ID
             */
            order_id: string;
            /**
             * Order scoped identifier
             */
            order_scoped_id: string;
            /**
             * Whether the associated order is a quote
             */
            order_quote: boolean;
            /**
             * User who approved the approval (null if not yet approved by user)
             */
            approved_by_user?: (string | null);
            /**
             * Whether the approval is completed
             */
            completed: boolean;
            /**
             * Completion timestamp in UTC ISO 8601 format (null if not completed) (e.g., 2023-12-25T10:30:00.000Z)
             */
            completed_at?: (string | null);
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last time customer viewed this approval in UTC ISO 8601 format (null if never viewed) (e.g., 2023-12-25T10:30:00.000Z)
             */
            customer_last_viewed_date?: (string | null);
            /**
             * Media attachments for approval (only present for job approvals in detail view, absent in list endpoints)
             */
            mockup?: Array<{
                /**
                 * Unique identifier for the media approval
                 */
                id: string;
                /**
                 * Reference to the media file
                 */
                media_id: string;
                /**
                 * Notes or instructions provided to the customer for this media (can be null or empty string)
                 */
                notes_to_customer?: (string | null);
                /**
                 * Feedback or notes provided by the customer for this media (can be null or empty string)
                 */
                notes_from_customer?: (string | null);
                /**
                 * Status of individual media approval within an approval
                 */
                status: 'pending-approval' | 'approved' | 'need-changes';
                /**
                 * Media collection identifier
                 */
                collection: string;
                /**
                 * MIME type of the media file
                 */
                mime_type: string;
                /**
                 * Whether the media is an image file
                 */
                is_image: boolean;
                /**
                 * Whether to include this media in PDF exports
                 */
                show_in_pdf: boolean;
                /**
                 * Display name of the media
                 */
                name: string;
                /**
                 * Original file name of the media
                 */
                file_name: string;
                /**
                 * File size in bytes
                 */
                size: number;
                /**
                 * Download URL for the media
                 */
                url: string;
                /**
                 * View URL for the media
                 */
                view_url: string;
                /**
                 * Preview URLs for different sizes (optional)
                 */
                preview?: {
                    /**
                     * Large preview URL
                     */
                    large: string;
                    /**
                     * Medium preview URL
                     */
                    medium: string;
                    /**
                     * Small preview URL
                     */
                    small: string;
                };
                /**
                 * Display order position of this media
                 */
                position: number;
                /**
                 * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
                 */
                created_at: string;
            }>;
            /**
             * Feedback or notes provided by the customer (null or empty string if no notes provided)
             */
            notes_from_customer?: (string | null);
            /**
             * Instructions or notes provided to the customer (can be empty string)
             */
            notes_to_customer: string;
            /**
             * Customer signature data (null if not signed yet)
             */
            signature?: (string | null);
            /**
             * Status of the approval workflow
             */
            status: 'pending' | 'sent-to-customer' | 'viewed-by-customer' | 'need-changes' | 'completed';
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
            url: '/v2/api/store/{team_slug}/v2/job/approval/{id}/complete',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Complete order approval
     * Complete an order approval with customer signature
     * @param teamSlug Team slug identifier
     * @param orderId Order ID associated with approval
     * @param id Approval ID to complete
     * @param requestBody Order approval completion data including signature
     * @returns any Successfully completed order approval
     * @throws ApiError
     */
    public static completeOrderApproval(
        teamSlug: string,
        orderId: string,
        id: string,
        requestBody: {
            /**
             * Approval ID to complete
             */
            id: string;
            /**
             * Associated order ID
             */
            order_id: string;
            /**
             * Customer signature data
             */
            signature: string;
            /**
             * Customer feedback for the approval (can be empty string)
             */
            notes_from_customer: string;
            /**
             * Final status of the order approval
             */
            status: 'completed' | 'need-changes';
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the approval
             */
            id: string;
            /**
             * Type of approval - either job-level or order-level
             */
            type: 'job' | 'order';
            /**
             * Who approved the approval - user or customer
             */
            approved_by: 'user' | 'customer';
            /**
             * Associated job ID (only present when type=job)
             */
            job_id?: string;
            /**
             * Job scoped identifier (only present when type=job)
             */
            job_scoped_id?: string;
            /**
             * Job display name (only present when type=job)
             */
            job_name?: string;
            /**
             * Associated order ID
             */
            order_id: string;
            /**
             * Order scoped identifier
             */
            order_scoped_id: string;
            /**
             * Whether the associated order is a quote
             */
            order_quote: boolean;
            /**
             * User who approved the approval (null if not yet approved by user)
             */
            approved_by_user?: (string | null);
            /**
             * Whether the approval is completed
             */
            completed: boolean;
            /**
             * Completion timestamp in UTC ISO 8601 format (null if not completed) (e.g., 2023-12-25T10:30:00.000Z)
             */
            completed_at?: (string | null);
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last time customer viewed this approval in UTC ISO 8601 format (null if never viewed) (e.g., 2023-12-25T10:30:00.000Z)
             */
            customer_last_viewed_date?: (string | null);
            /**
             * Media attachments for approval (only present for job approvals in detail view, absent in list endpoints)
             */
            mockup?: Array<{
                /**
                 * Unique identifier for the media approval
                 */
                id: string;
                /**
                 * Reference to the media file
                 */
                media_id: string;
                /**
                 * Notes or instructions provided to the customer for this media (can be null or empty string)
                 */
                notes_to_customer?: (string | null);
                /**
                 * Feedback or notes provided by the customer for this media (can be null or empty string)
                 */
                notes_from_customer?: (string | null);
                /**
                 * Status of individual media approval within an approval
                 */
                status: 'pending-approval' | 'approved' | 'need-changes';
                /**
                 * Media collection identifier
                 */
                collection: string;
                /**
                 * MIME type of the media file
                 */
                mime_type: string;
                /**
                 * Whether the media is an image file
                 */
                is_image: boolean;
                /**
                 * Whether to include this media in PDF exports
                 */
                show_in_pdf: boolean;
                /**
                 * Display name of the media
                 */
                name: string;
                /**
                 * Original file name of the media
                 */
                file_name: string;
                /**
                 * File size in bytes
                 */
                size: number;
                /**
                 * Download URL for the media
                 */
                url: string;
                /**
                 * View URL for the media
                 */
                view_url: string;
                /**
                 * Preview URLs for different sizes (optional)
                 */
                preview?: {
                    /**
                     * Large preview URL
                     */
                    large: string;
                    /**
                     * Medium preview URL
                     */
                    medium: string;
                    /**
                     * Small preview URL
                     */
                    small: string;
                };
                /**
                 * Display order position of this media
                 */
                position: number;
                /**
                 * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
                 */
                created_at: string;
            }>;
            /**
             * Feedback or notes provided by the customer (null or empty string if no notes provided)
             */
            notes_from_customer?: (string | null);
            /**
             * Instructions or notes provided to the customer (can be empty string)
             */
            notes_to_customer: string;
            /**
             * Customer signature data (null if not signed yet)
             */
            signature?: (string | null);
            /**
             * Status of the approval workflow
             */
            status: 'pending' | 'sent-to-customer' | 'viewed-by-customer' | 'need-changes' | 'completed';
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
            url: '/v2/api/store/{team_slug}/v2/sales_order/{orderId}/approval/{id}/complete',
            path: {
                'team_slug': teamSlug,
                'orderId': orderId,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Send approval to customer
     * Send an approval to the customer for review
     * @param teamSlug Team slug identifier
     * @param id Approval ID to send to customer
     * @returns any Successfully sent approval to customer
     * @throws ApiError
     */
    public static sendApprovalToCustomer(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        /**
         * No data returned for delete operations
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
            method: 'PATCH',
            url: '/v1/api/store/{team_slug}/approvals/{id}/send_to_customer',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
}
