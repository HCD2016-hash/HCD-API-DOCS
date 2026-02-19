/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class ActivityService {
    /**
     * Get user activity feed
     * Retrieve the current user's activity feed with optional filtering
     * @param teamSlug Team slug identifier
     * @param notSeenYet Filter to show only unseen activities (1 for true, 0 for false)
     * @param showArchive Include archived activities (1 for true, 0 for false)
     * @param page Page number for pagination
     * @returns any Successfully retrieved activity feed
     * @throws ApiError
     */
    public static getActivityFeed(
        teamSlug: string,
        notSeenYet: 0 | 1 = 0,
        showArchive: 0 | 1 = 0,
        page: number = 1,
    ): CancelablePromise<{
        data: Array<{
            /**
             * Unique identifier for the activity feed item
             */
            id: string;
            /**
             * Whether the user has seen this activity
             */
            seen: boolean;
            /**
             * Whether this activity is archived
             */
            archive: boolean;
            /**
             * When the activity feed item was created
             */
            created_at: string;
            activity: {
                /**
                 * Unique identifier for the activity
                 */
                id: string;
                /**
                 * Type of entity this activity relates to
                 */
                type: 'order' | 'purchase_order' | 'shipment' | 'job';
                /**
                 * The action that was performed
                 */
                action: 'approval_approved_by_customer' | 'approval_changes_requested_by_customer' | 'approval_sent_by_user' | 'customer_message_bounced' | 'new_comment' | 'order_approval_approved_by_customer' | 'order_approval_changes_requested_by_customer' | 'order_approval_requested_by_user' | 'order_approval_sent_by_user' | 'order_changes_in_view_mode' | 'order_conversion' | 'order_deleted_in_view_mode' | 'order_restored' | 'order_pending_reminder_sent' | 'purchase_order_changes' | 'purchase_order_message_bounced' | 'purchase_order_received_add' | 'purchase_order_received_remove' | 'received_customer_message' | 'received_customer_payment' | 'received_purchase_order_message' | 'received_user_payment' | 'status_change';
                /**
                 * Translation key for the activity message
                 */
                message_key: 'job.status_change' | 'job.new_comment' | 'order.approval_approved_by_customer' | 'order.approval_changes_requested_by_customer' | 'order.approval_sent_by_user' | 'order.customer_message_bounced' | 'order.new_comment' | 'order.order_restored' | 'order.order_approval_approved_by_customer' | 'order.order_approval_changes_requested_by_customer' | 'order.order_approval_requested_by_user' | 'order.order_approval_sent_by_user' | 'order.order_changes_in_view_mode' | 'order.order_conversion' | 'order.order_deleted_in_view_mode' | 'order.order_pending_reminder_sent' | 'order.received_customer_message' | 'order.received_customer_payment' | 'order.received_user_payment' | 'order.status_change' | 'purchase_order.purchase_order_changes' | 'purchase_order.purchase_order_message_bounced' | 'purchase_order.purchase_order_received_add' | 'purchase_order.purchase_order_received_remove' | 'purchase_order.received_purchase_order_message' | 'purchase_order.status_change' | 'purchase_order.new_comment' | 'shipment.status_change';
                /**
                 * When the activity was created
                 */
                created_at: string;
                /**
                 * Activity context object containing related entities and metadata
                 */
                object: {
                    contact?: {
                        id: string;
                        first_name: string;
                        last_name: string;
                    };
                    customer?: {
                        id: string;
                        name: string;
                    };
                    job?: {
                        id: string;
                        name: string;
                        scoped_id: string;
                    };
                    shipment?: {
                        id: string;
                        scoped_id: string;
                    };
                    order?: {
                        id: string;
                        scoped_id: string;
                    };
                    user?: {
                        id: string;
                        name: string;
                        avatar_url: string;
                    };
                    vendor?: {
                        id: string;
                        name: string;
                    };
                    purchase_order?: {
                        id: string;
                        scoped_id: string;
                    };
                    restored_at?: {
                        date: string;
                        timezone: string;
                        timezone_type: number;
                    };
                    changes?: Array<{
                        key: string;
                        new: (string | {
                            id: string;
                            name: string;
                        });
                        old: (string | {
                            id: string;
                            name: string;
                        });
                        type: 'date' | 'string' | 'user' | 'changes_only' | 'add_link' | 'remove_link' | 'vendor' | 'address';
                    }>;
                    team?: {
                        id: string;
                        name: string;
                    };
                    from?: string;
                    to?: string;
                    from_status?: {
                        id: string;
                        role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                        type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                        label: string;
                        customer_label: string;
                        color: string;
                        position: number;
                        trashed: boolean;
                        pipeline_id?: string;
                    };
                    to_status?: {
                        id: string;
                        role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                        type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                        label: string;
                        customer_label: string;
                        color: string;
                        position: number;
                        trashed: boolean;
                        pipeline_id?: string;
                    };
                    count?: number;
                };
                /**
                 * Team context for the activity
                 */
                team: {
                    id: string;
                    name: string;
                    slug: string;
                };
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
            url: '/v1/api/store/{team_slug}/current_user_feed',
            path: {
                'team_slug': teamSlug,
            },
            query: {
                'not_seen_yet': notSeenYet,
                'show_archive': showArchive,
                'page': page,
            },
        });
    }
    /**
     * Mark all feed items as seen
     * Mark all activity feed items as seen for the current user
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Successfully marked all items as seen
     * @throws ApiError
     */
    public static markAllFeedItemsAsSeen(
        teamSlug: string,
        requestBody: any,
    ): CancelablePromise<{
        data: null;
        success: boolean;
        status: string;
    }> {
        return __request(OpenAPI, {
            method: 'PUT',
            url: '/v1/api/store/{team_slug}/current_user_feed/mark_all_as_seen',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Archive all feed items
     * Archive all activity feed items for the current user
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Successfully archived all items
     * @throws ApiError
     */
    public static archiveAllFeedItems(
        teamSlug: string,
        requestBody: any,
    ): CancelablePromise<{
        data: null;
        success: boolean;
        status: string;
    }> {
        return __request(OpenAPI, {
            method: 'PUT',
            url: '/v1/api/store/{team_slug}/current_user_feed/mark_all_as_archive',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Mark specific feed items as seen
     * Mark specific activity feed items as seen
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Successfully marked items as seen
     * @throws ApiError
     */
    public static markFeedItemsAsSeen(
        teamSlug: string,
        requestBody: Array<{
            /**
             * Activity feed item ID to mark as seen
             */
            id: string;
        }>,
    ): CancelablePromise<{
        data: Array<{
            /**
             * Unique identifier for the activity feed item
             */
            id: string;
            /**
             * Whether the user has seen this activity
             */
            seen: boolean;
            /**
             * Whether this activity is archived
             */
            archive: boolean;
            /**
             * When the activity feed item was created
             */
            created_at: string;
            activity: {
                /**
                 * Unique identifier for the activity
                 */
                id: string;
                /**
                 * Type of entity this activity relates to
                 */
                type: 'order' | 'purchase_order' | 'shipment' | 'job';
                /**
                 * The action that was performed
                 */
                action: 'approval_approved_by_customer' | 'approval_changes_requested_by_customer' | 'approval_sent_by_user' | 'customer_message_bounced' | 'new_comment' | 'order_approval_approved_by_customer' | 'order_approval_changes_requested_by_customer' | 'order_approval_requested_by_user' | 'order_approval_sent_by_user' | 'order_changes_in_view_mode' | 'order_conversion' | 'order_deleted_in_view_mode' | 'order_restored' | 'order_pending_reminder_sent' | 'purchase_order_changes' | 'purchase_order_message_bounced' | 'purchase_order_received_add' | 'purchase_order_received_remove' | 'received_customer_message' | 'received_customer_payment' | 'received_purchase_order_message' | 'received_user_payment' | 'status_change';
                /**
                 * Translation key for the activity message
                 */
                message_key: 'job.status_change' | 'job.new_comment' | 'order.approval_approved_by_customer' | 'order.approval_changes_requested_by_customer' | 'order.approval_sent_by_user' | 'order.customer_message_bounced' | 'order.new_comment' | 'order.order_restored' | 'order.order_approval_approved_by_customer' | 'order.order_approval_changes_requested_by_customer' | 'order.order_approval_requested_by_user' | 'order.order_approval_sent_by_user' | 'order.order_changes_in_view_mode' | 'order.order_conversion' | 'order.order_deleted_in_view_mode' | 'order.order_pending_reminder_sent' | 'order.received_customer_message' | 'order.received_customer_payment' | 'order.received_user_payment' | 'order.status_change' | 'purchase_order.purchase_order_changes' | 'purchase_order.purchase_order_message_bounced' | 'purchase_order.purchase_order_received_add' | 'purchase_order.purchase_order_received_remove' | 'purchase_order.received_purchase_order_message' | 'purchase_order.status_change' | 'purchase_order.new_comment' | 'shipment.status_change';
                /**
                 * When the activity was created
                 */
                created_at: string;
                /**
                 * Activity context object containing related entities and metadata
                 */
                object: {
                    contact?: {
                        id: string;
                        first_name: string;
                        last_name: string;
                    };
                    customer?: {
                        id: string;
                        name: string;
                    };
                    job?: {
                        id: string;
                        name: string;
                        scoped_id: string;
                    };
                    shipment?: {
                        id: string;
                        scoped_id: string;
                    };
                    order?: {
                        id: string;
                        scoped_id: string;
                    };
                    user?: {
                        id: string;
                        name: string;
                        avatar_url: string;
                    };
                    vendor?: {
                        id: string;
                        name: string;
                    };
                    purchase_order?: {
                        id: string;
                        scoped_id: string;
                    };
                    restored_at?: {
                        date: string;
                        timezone: string;
                        timezone_type: number;
                    };
                    changes?: Array<{
                        key: string;
                        new: (string | {
                            id: string;
                            name: string;
                        });
                        old: (string | {
                            id: string;
                            name: string;
                        });
                        type: 'date' | 'string' | 'user' | 'changes_only' | 'add_link' | 'remove_link' | 'vendor' | 'address';
                    }>;
                    team?: {
                        id: string;
                        name: string;
                    };
                    from?: string;
                    to?: string;
                    from_status?: {
                        id: string;
                        role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                        type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                        label: string;
                        customer_label: string;
                        color: string;
                        position: number;
                        trashed: boolean;
                        pipeline_id?: string;
                    };
                    to_status?: {
                        id: string;
                        role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                        type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                        label: string;
                        customer_label: string;
                        color: string;
                        position: number;
                        trashed: boolean;
                        pipeline_id?: string;
                    };
                    count?: number;
                };
                /**
                 * Team context for the activity
                 */
                team: {
                    id: string;
                    name: string;
                    slug: string;
                };
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
            method: 'PUT',
            url: '/v1/api/store/{team_slug}/current_user_feed/seen',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Archive specific feed items
     * Archive specific activity feed items
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Successfully archived items
     * @throws ApiError
     */
    public static archiveFeedItems(
        teamSlug: string,
        requestBody: Array<{
            /**
             * Activity feed item ID to archive
             */
            id: string;
        }>,
    ): CancelablePromise<{
        data: Array<{
            /**
             * Unique identifier for the activity feed item
             */
            id: string;
            /**
             * Whether the user has seen this activity
             */
            seen: boolean;
            /**
             * Whether this activity is archived
             */
            archive: boolean;
            /**
             * When the activity feed item was created
             */
            created_at: string;
            activity: {
                /**
                 * Unique identifier for the activity
                 */
                id: string;
                /**
                 * Type of entity this activity relates to
                 */
                type: 'order' | 'purchase_order' | 'shipment' | 'job';
                /**
                 * The action that was performed
                 */
                action: 'approval_approved_by_customer' | 'approval_changes_requested_by_customer' | 'approval_sent_by_user' | 'customer_message_bounced' | 'new_comment' | 'order_approval_approved_by_customer' | 'order_approval_changes_requested_by_customer' | 'order_approval_requested_by_user' | 'order_approval_sent_by_user' | 'order_changes_in_view_mode' | 'order_conversion' | 'order_deleted_in_view_mode' | 'order_restored' | 'order_pending_reminder_sent' | 'purchase_order_changes' | 'purchase_order_message_bounced' | 'purchase_order_received_add' | 'purchase_order_received_remove' | 'received_customer_message' | 'received_customer_payment' | 'received_purchase_order_message' | 'received_user_payment' | 'status_change';
                /**
                 * Translation key for the activity message
                 */
                message_key: 'job.status_change' | 'job.new_comment' | 'order.approval_approved_by_customer' | 'order.approval_changes_requested_by_customer' | 'order.approval_sent_by_user' | 'order.customer_message_bounced' | 'order.new_comment' | 'order.order_restored' | 'order.order_approval_approved_by_customer' | 'order.order_approval_changes_requested_by_customer' | 'order.order_approval_requested_by_user' | 'order.order_approval_sent_by_user' | 'order.order_changes_in_view_mode' | 'order.order_conversion' | 'order.order_deleted_in_view_mode' | 'order.order_pending_reminder_sent' | 'order.received_customer_message' | 'order.received_customer_payment' | 'order.received_user_payment' | 'order.status_change' | 'purchase_order.purchase_order_changes' | 'purchase_order.purchase_order_message_bounced' | 'purchase_order.purchase_order_received_add' | 'purchase_order.purchase_order_received_remove' | 'purchase_order.received_purchase_order_message' | 'purchase_order.status_change' | 'purchase_order.new_comment' | 'shipment.status_change';
                /**
                 * When the activity was created
                 */
                created_at: string;
                /**
                 * Activity context object containing related entities and metadata
                 */
                object: {
                    contact?: {
                        id: string;
                        first_name: string;
                        last_name: string;
                    };
                    customer?: {
                        id: string;
                        name: string;
                    };
                    job?: {
                        id: string;
                        name: string;
                        scoped_id: string;
                    };
                    shipment?: {
                        id: string;
                        scoped_id: string;
                    };
                    order?: {
                        id: string;
                        scoped_id: string;
                    };
                    user?: {
                        id: string;
                        name: string;
                        avatar_url: string;
                    };
                    vendor?: {
                        id: string;
                        name: string;
                    };
                    purchase_order?: {
                        id: string;
                        scoped_id: string;
                    };
                    restored_at?: {
                        date: string;
                        timezone: string;
                        timezone_type: number;
                    };
                    changes?: Array<{
                        key: string;
                        new: (string | {
                            id: string;
                            name: string;
                        });
                        old: (string | {
                            id: string;
                            name: string;
                        });
                        type: 'date' | 'string' | 'user' | 'changes_only' | 'add_link' | 'remove_link' | 'vendor' | 'address';
                    }>;
                    team?: {
                        id: string;
                        name: string;
                    };
                    from?: string;
                    to?: string;
                    from_status?: {
                        id: string;
                        role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                        type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                        label: string;
                        customer_label: string;
                        color: string;
                        position: number;
                        trashed: boolean;
                        pipeline_id?: string;
                    };
                    to_status?: {
                        id: string;
                        role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                        type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                        label: string;
                        customer_label: string;
                        color: string;
                        position: number;
                        trashed: boolean;
                        pipeline_id?: string;
                    };
                    count?: number;
                };
                /**
                 * Team context for the activity
                 */
                team: {
                    id: string;
                    name: string;
                    slug: string;
                };
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
            method: 'PUT',
            url: '/v1/api/store/{team_slug}/current_user_feed/archive',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Unarchive specific feed items
     * Unarchive specific activity feed items
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Successfully unarchived items
     * @throws ApiError
     */
    public static unarchiveFeedItems(
        teamSlug: string,
        requestBody: Array<{
            /**
             * Activity feed item ID to unarchive
             */
            id: string;
        }>,
    ): CancelablePromise<{
        data: Array<{
            /**
             * Unique identifier for the activity feed item
             */
            id: string;
            /**
             * Whether the user has seen this activity
             */
            seen: boolean;
            /**
             * Whether this activity is archived
             */
            archive: boolean;
            /**
             * When the activity feed item was created
             */
            created_at: string;
            activity: {
                /**
                 * Unique identifier for the activity
                 */
                id: string;
                /**
                 * Type of entity this activity relates to
                 */
                type: 'order' | 'purchase_order' | 'shipment' | 'job';
                /**
                 * The action that was performed
                 */
                action: 'approval_approved_by_customer' | 'approval_changes_requested_by_customer' | 'approval_sent_by_user' | 'customer_message_bounced' | 'new_comment' | 'order_approval_approved_by_customer' | 'order_approval_changes_requested_by_customer' | 'order_approval_requested_by_user' | 'order_approval_sent_by_user' | 'order_changes_in_view_mode' | 'order_conversion' | 'order_deleted_in_view_mode' | 'order_restored' | 'order_pending_reminder_sent' | 'purchase_order_changes' | 'purchase_order_message_bounced' | 'purchase_order_received_add' | 'purchase_order_received_remove' | 'received_customer_message' | 'received_customer_payment' | 'received_purchase_order_message' | 'received_user_payment' | 'status_change';
                /**
                 * Translation key for the activity message
                 */
                message_key: 'job.status_change' | 'job.new_comment' | 'order.approval_approved_by_customer' | 'order.approval_changes_requested_by_customer' | 'order.approval_sent_by_user' | 'order.customer_message_bounced' | 'order.new_comment' | 'order.order_restored' | 'order.order_approval_approved_by_customer' | 'order.order_approval_changes_requested_by_customer' | 'order.order_approval_requested_by_user' | 'order.order_approval_sent_by_user' | 'order.order_changes_in_view_mode' | 'order.order_conversion' | 'order.order_deleted_in_view_mode' | 'order.order_pending_reminder_sent' | 'order.received_customer_message' | 'order.received_customer_payment' | 'order.received_user_payment' | 'order.status_change' | 'purchase_order.purchase_order_changes' | 'purchase_order.purchase_order_message_bounced' | 'purchase_order.purchase_order_received_add' | 'purchase_order.purchase_order_received_remove' | 'purchase_order.received_purchase_order_message' | 'purchase_order.status_change' | 'purchase_order.new_comment' | 'shipment.status_change';
                /**
                 * When the activity was created
                 */
                created_at: string;
                /**
                 * Activity context object containing related entities and metadata
                 */
                object: {
                    contact?: {
                        id: string;
                        first_name: string;
                        last_name: string;
                    };
                    customer?: {
                        id: string;
                        name: string;
                    };
                    job?: {
                        id: string;
                        name: string;
                        scoped_id: string;
                    };
                    shipment?: {
                        id: string;
                        scoped_id: string;
                    };
                    order?: {
                        id: string;
                        scoped_id: string;
                    };
                    user?: {
                        id: string;
                        name: string;
                        avatar_url: string;
                    };
                    vendor?: {
                        id: string;
                        name: string;
                    };
                    purchase_order?: {
                        id: string;
                        scoped_id: string;
                    };
                    restored_at?: {
                        date: string;
                        timezone: string;
                        timezone_type: number;
                    };
                    changes?: Array<{
                        key: string;
                        new: (string | {
                            id: string;
                            name: string;
                        });
                        old: (string | {
                            id: string;
                            name: string;
                        });
                        type: 'date' | 'string' | 'user' | 'changes_only' | 'add_link' | 'remove_link' | 'vendor' | 'address';
                    }>;
                    team?: {
                        id: string;
                        name: string;
                    };
                    from?: string;
                    to?: string;
                    from_status?: {
                        id: string;
                        role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                        type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                        label: string;
                        customer_label: string;
                        color: string;
                        position: number;
                        trashed: boolean;
                        pipeline_id?: string;
                    };
                    to_status?: {
                        id: string;
                        role: 'order' | 'quote' | 'job' | 'purchase_order' | 'pipeline' | 'shipment' | 'customer_message';
                        type: 'start' | 'in_progress' | 'end' | 'pre_production' | 'failure_end';
                        label: string;
                        customer_label: string;
                        color: string;
                        position: number;
                        trashed: boolean;
                        pipeline_id?: string;
                    };
                    count?: number;
                };
                /**
                 * Team context for the activity
                 */
                team: {
                    id: string;
                    name: string;
                    slug: string;
                };
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
            method: 'PUT',
            url: '/v1/api/store/{team_slug}/current_user_feed/unarchive',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
}
