/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class AsyncUploadService {
    /**
     * Upload file for later attachment
     * Uploads a file asynchronously and returns an upload ID that can be used to attach the file to entities (sales orders, jobs, purchase orders, etc.) in subsequent API calls
     * @param teamSlug Team identifier for context-aware file upload
     * @param formData File upload with collection type specification
     * @returns any File uploaded successfully with upload ID for entity attachment
     * @throws ApiError
     */
    public static uploadFileAsync(
        teamSlug: string,
        formData: {
            /**
             * Upload collection type specifying the intended use of the file before entity attachment
             */
            collection: 'default' | 'mockup' | 'production_file';
            /**
             * File to be uploaded asynchronously for later attachment to entities
             */
            media: Blob;
        },
    ): CancelablePromise<{
        data: ({
            /**
             * Unique media identifier
             */
            id: string;
            /**
             * Collection type the media belongs to
             */
            collection: string;
            /**
             * MIME type of the uploaded file
             */
            mime_type: string;
            /**
             * Whether the uploaded file is an image
             */
            is_image: boolean;
            /**
             * Whether to show this media in PDF exports
             */
            show_in_pdf: boolean;
            /**
             * Display name of the media
             */
            name: string;
            /**
             * Original filename of the uploaded file
             */
            file_name: string;
            /**
             * File size in bytes
             */
            size: number;
            /**
             * Direct URL to access the file
             */
            url: string;
            /**
             * URL for viewing the file in browser
             */
            view_url: string;
            /**
             * Preview image URLs in different sizes (only for image files)
             */
            preview?: {
                /**
                 * Large preview image URL
                 */
                large: string;
                /**
                 * Medium preview image URL
                 */
                medium: string;
                /**
                 * Small preview image URL
                 */
                small: string;
            };
            /**
             * Position/order of the media in collections
             */
            position: number;
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
        } & {
            /**
             * Current approval status for job context
             */
            current_approval_status?: 'pending' | 'approved' | 'rejected' | 'changes_requested';
            /**
             * Current approval details (null if no approval exists)
             */
            current_approval?: ({
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
            } | null);
            /**
             * Associated job identifier when attached to a job
             */
            job_id?: string;
            /**
             * Associated job services
             */
            job_service?: Array<Record<string, any>>;
            /**
             * Associated purchase order identifier when attached to a PO
             */
            po_id?: string;
            /**
             * Associated sales order identifier when attached to a sales order
             */
            order_id?: string;
        });
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Whether the upload was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/v1/api/store/{teamSlug}/async_upload',
            path: {
                'teamSlug': teamSlug,
            },
            formData: formData,
            mediaType: 'multipart/form-data',
        });
    }
    /**
     * Remove uploaded file before attachment
     * Removes an uploaded file by its upload ID before it has been attached to any entities. Once a file is attached to an entity, it should be removed through the entity-specific media endpoints.
     * @param teamSlug Team identifier for context-aware file removal
     * @param uploadId Upload identifier to remove (obtained from upload response)
     * @returns any Upload removed successfully
     * @throws ApiError
     */
    public static removeUploadedFile(
        teamSlug: string,
        uploadId: string,
    ): CancelablePromise<{
        /**
         * Whether the upload was successfully removed
         */
        data: boolean;
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Whether the removal request was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'DELETE',
            url: '/v1/api/store/{teamSlug}/async_upload/{upload_id}',
            path: {
                'teamSlug': teamSlug,
                'upload_id': uploadId,
            },
        });
    }
}
