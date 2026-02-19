/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SettingWebhookService {
    /**
     * Get webhook subscriptions list
     * Retrieves a paginated list of webhook subscriptions for the team
     * @param teamSlug Team slug identifier
     * @param page Page number for pagination
     * @returns any Webhook subscriptions retrieved successfully
     * @throws ApiError
     */
    public static getWebhookSubscriptionsList(
        teamSlug: string,
        page: number,
    ): CancelablePromise<{
        data: Array<{
            /**
             * Unique identifier for the webhook subscription
             */
            id: string;
            /**
             * Target URL for webhook delivery
             */
            url: string;
            /**
             * Human-readable name for the webhook
             */
            name: string;
            /**
             * Secret token for webhook signature verification
             */
            secret: string;
            /**
             * Current status of the webhook subscription
             */
            status: 'active' | 'disabled';
            /**
             * Reason for disabling if status is disabled (null if webhook is active)
             */
            disable_reason: (string | null);
            /**
             * Source type for the webhook subscription
             */
            source: 'yoprint' | 'zapier' | 'manual' | 'integration';
            /**
             * Array of subscribed event types
             */
            enabled_events: Array<'all' | 'contact.created' | 'contact.deleted' | 'contact.updated' | 'customer.created' | 'customer.deleted' | 'customer.updated' | 'job.status_changed' | 'job_approval.approved' | 'job_approval.change_requested' | 'message.bounced_customer' | 'message.bounced_purchase_order' | 'message.received_customer' | 'message.received_purchase_order' | 'message.status_changed' | 'order.created' | 'order.status_changed' | 'order_approval.approved' | 'order_approval.change_requested' | 'purchase_order.status_changed' | 'quote.created' | 'sales_order.status_changed' | 'shipment.status_changed' | 'work_pipeline.status_changed' | 'customer_credit.deposited' | 'customer_credit.withdrew' | 'payment_received.any_amount' | 'payment_received.deposit_amount' | 'payment_received.full_amount' | 'payment.refund_issued' | 'order.converted_to_quote' | 'quote.converted_to_sales_order'>;
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last update timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: string;
        }>;
        pagination?: {
            count: number;
            currentPage: number;
            links?: {
                next?: (string | null);
                prev: string;
            };
            perPage: number;
            total: number;
            totalPages: number;
        };
        status: number;
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'GET',
            url: '/v1/api/store/{team_slug}/setting/webhook_subscription',
            path: {
                'team_slug': teamSlug,
            },
            query: {
                'page': page,
            },
        });
    }
    /**
     * Create webhook subscription
     * Creates a new webhook subscription for receiving event notifications
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Webhook subscription created successfully
     * @throws ApiError
     */
    public static createWebhookSubscription(
        teamSlug: string,
        requestBody: {
            /**
             * Target URL for webhook delivery
             */
            url: string;
            /**
             * Human-readable name for the webhook
             */
            name: string;
            /**
             * Array of event types to subscribe to
             */
            enabled_events: Array<'all' | 'contact.created' | 'contact.deleted' | 'contact.updated' | 'customer.created' | 'customer.deleted' | 'customer.updated' | 'job.status_changed' | 'job_approval.approved' | 'job_approval.change_requested' | 'message.bounced_customer' | 'message.bounced_purchase_order' | 'message.received_customer' | 'message.received_purchase_order' | 'message.status_changed' | 'order.created' | 'order.status_changed' | 'order_approval.approved' | 'order_approval.change_requested' | 'purchase_order.status_changed' | 'quote.created' | 'sales_order.status_changed' | 'shipment.status_changed' | 'work_pipeline.status_changed' | 'customer_credit.deposited' | 'customer_credit.withdrew' | 'payment_received.any_amount' | 'payment_received.deposit_amount' | 'payment_received.full_amount' | 'payment.refund_issued' | 'order.converted_to_quote' | 'quote.converted_to_sales_order'>;
            /**
             * Source type for the webhook subscription
             */
            source: 'yoprint' | 'zapier' | 'manual' | 'integration';
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the webhook subscription
             */
            id: string;
            /**
             * Target URL for webhook delivery
             */
            url: string;
            /**
             * Human-readable name for the webhook
             */
            name: string;
            /**
             * Secret token for webhook signature verification
             */
            secret: string;
            /**
             * Current status of the webhook subscription
             */
            status: 'active' | 'disabled';
            /**
             * Reason for disabling if status is disabled (null if webhook is active)
             */
            disable_reason: (string | null);
            /**
             * Source type for the webhook subscription
             */
            source: 'yoprint' | 'zapier' | 'manual' | 'integration';
            /**
             * Array of subscribed event types
             */
            enabled_events: Array<'all' | 'contact.created' | 'contact.deleted' | 'contact.updated' | 'customer.created' | 'customer.deleted' | 'customer.updated' | 'job.status_changed' | 'job_approval.approved' | 'job_approval.change_requested' | 'message.bounced_customer' | 'message.bounced_purchase_order' | 'message.received_customer' | 'message.received_purchase_order' | 'message.status_changed' | 'order.created' | 'order.status_changed' | 'order_approval.approved' | 'order_approval.change_requested' | 'purchase_order.status_changed' | 'quote.created' | 'sales_order.status_changed' | 'shipment.status_changed' | 'work_pipeline.status_changed' | 'customer_credit.deposited' | 'customer_credit.withdrew' | 'payment_received.any_amount' | 'payment_received.deposit_amount' | 'payment_received.full_amount' | 'payment.refund_issued' | 'order.converted_to_quote' | 'quote.converted_to_sales_order'>;
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last update timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: string;
        };
        status: number;
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/v1/api/store/{team_slug}/setting/webhook_subscription',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get single webhook subscription
     * Retrieves a specific webhook subscription by ID
     * @param teamSlug Team slug identifier
     * @param id Webhook subscription ID
     * @returns any Webhook subscription retrieved successfully
     * @throws ApiError
     */
    public static getWebhookSubscription(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the webhook subscription
             */
            id: string;
            /**
             * Target URL for webhook delivery
             */
            url: string;
            /**
             * Human-readable name for the webhook
             */
            name: string;
            /**
             * Secret token for webhook signature verification
             */
            secret: string;
            /**
             * Current status of the webhook subscription
             */
            status: 'active' | 'disabled';
            /**
             * Reason for disabling if status is disabled (null if webhook is active)
             */
            disable_reason: (string | null);
            /**
             * Source type for the webhook subscription
             */
            source: 'yoprint' | 'zapier' | 'manual' | 'integration';
            /**
             * Array of subscribed event types
             */
            enabled_events: Array<'all' | 'contact.created' | 'contact.deleted' | 'contact.updated' | 'customer.created' | 'customer.deleted' | 'customer.updated' | 'job.status_changed' | 'job_approval.approved' | 'job_approval.change_requested' | 'message.bounced_customer' | 'message.bounced_purchase_order' | 'message.received_customer' | 'message.received_purchase_order' | 'message.status_changed' | 'order.created' | 'order.status_changed' | 'order_approval.approved' | 'order_approval.change_requested' | 'purchase_order.status_changed' | 'quote.created' | 'sales_order.status_changed' | 'shipment.status_changed' | 'work_pipeline.status_changed' | 'customer_credit.deposited' | 'customer_credit.withdrew' | 'payment_received.any_amount' | 'payment_received.deposit_amount' | 'payment_received.full_amount' | 'payment.refund_issued' | 'order.converted_to_quote' | 'quote.converted_to_sales_order'>;
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last update timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: string;
        };
        status: number;
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'GET',
            url: '/v1/api/store/{team_slug}/setting/webhook_subscription/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Update webhook subscription
     * Updates an existing webhook subscription
     * @param teamSlug Team slug identifier
     * @param id Webhook subscription ID
     * @param requestBody
     * @returns any Webhook subscription updated successfully
     * @throws ApiError
     */
    public static updateWebhookSubscription(
        teamSlug: string,
        id: string,
        requestBody: {
            /**
             * Target URL for webhook delivery
             */
            url: string;
            /**
             * Current status of the webhook subscription
             */
            status?: 'active' | 'disabled';
            /**
             * Human-readable name for the webhook
             */
            name?: string;
            /**
             * Array of event types to subscribe to
             */
            enabled_events?: Array<'all' | 'contact.created' | 'contact.deleted' | 'contact.updated' | 'customer.created' | 'customer.deleted' | 'customer.updated' | 'job.status_changed' | 'job_approval.approved' | 'job_approval.change_requested' | 'message.bounced_customer' | 'message.bounced_purchase_order' | 'message.received_customer' | 'message.received_purchase_order' | 'message.status_changed' | 'order.created' | 'order.status_changed' | 'order_approval.approved' | 'order_approval.change_requested' | 'purchase_order.status_changed' | 'quote.created' | 'sales_order.status_changed' | 'shipment.status_changed' | 'work_pipeline.status_changed' | 'customer_credit.deposited' | 'customer_credit.withdrew' | 'payment_received.any_amount' | 'payment_received.deposit_amount' | 'payment_received.full_amount' | 'payment.refund_issued' | 'order.converted_to_quote' | 'quote.converted_to_sales_order'>;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Unique identifier for the webhook subscription
             */
            id: string;
            /**
             * Target URL for webhook delivery
             */
            url: string;
            /**
             * Human-readable name for the webhook
             */
            name: string;
            /**
             * Secret token for webhook signature verification
             */
            secret: string;
            /**
             * Current status of the webhook subscription
             */
            status: 'active' | 'disabled';
            /**
             * Reason for disabling if status is disabled (null if webhook is active)
             */
            disable_reason: (string | null);
            /**
             * Source type for the webhook subscription
             */
            source: 'yoprint' | 'zapier' | 'manual' | 'integration';
            /**
             * Array of subscribed event types
             */
            enabled_events: Array<'all' | 'contact.created' | 'contact.deleted' | 'contact.updated' | 'customer.created' | 'customer.deleted' | 'customer.updated' | 'job.status_changed' | 'job_approval.approved' | 'job_approval.change_requested' | 'message.bounced_customer' | 'message.bounced_purchase_order' | 'message.received_customer' | 'message.received_purchase_order' | 'message.status_changed' | 'order.created' | 'order.status_changed' | 'order_approval.approved' | 'order_approval.change_requested' | 'purchase_order.status_changed' | 'quote.created' | 'sales_order.status_changed' | 'shipment.status_changed' | 'work_pipeline.status_changed' | 'customer_credit.deposited' | 'customer_credit.withdrew' | 'payment_received.any_amount' | 'payment_received.deposit_amount' | 'payment_received.full_amount' | 'payment.refund_issued' | 'order.converted_to_quote' | 'quote.converted_to_sales_order'>;
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last update timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: string;
        };
        status: number;
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'PUT',
            url: '/v1/api/store/{team_slug}/setting/webhook_subscription/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Remove webhook subscription
     * Deletes an existing webhook subscription
     * @param teamSlug Team slug identifier
     * @param id Webhook subscription ID
     * @returns any Webhook subscription removed successfully
     * @throws ApiError
     */
    public static removeWebhookSubscription(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: null;
        status: number;
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'DELETE',
            url: '/v1/api/store/{team_slug}/setting/webhook_subscription/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Get webhook logs
     * Retrieves paginated webhook delivery logs for a specific webhook subscription
     * @param teamSlug Team slug identifier
     * @param id Webhook subscription ID
     * @param page Page number for pagination
     * @returns any Webhook logs retrieved successfully
     * @throws ApiError
     */
    public static getWebhookLogs(
        teamSlug: string,
        id: string,
        page: number,
    ): CancelablePromise<{
        data: Array<{
            /**
             * Unique identifier for the log entry
             */
            id: string;
            /**
             * Associated webhook message ID
             */
            webhook_message_id: string;
            /**
             * Associated webhook subscription ID
             */
            webhook_subscription_id: string;
            /**
             * Delivery attempt number
             */
            attempt: number;
            /**
             * Timestamp when delivery was attempted in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            sent_at?: (string | null);
            /**
             * Scheduled next retry timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            next_retry_at?: (string | null);
            /**
             * HTTP status code from delivery attempt
             */
            status_code: number;
            /**
             * Delivery status for webhook attempts
             */
            status: 'pending' | 'error' | 'success';
            /**
             * Error message if delivery failed
             */
            error: string;
            /**
             * Target URL used for delivery
             */
            url: string;
            message: {
                /**
                 * Unique identifier for the webhook message
                 */
                id: string;
                /**
                 * Event types that can trigger webhook notifications
                 */
                type: 'all' | 'contact.created' | 'contact.deleted' | 'contact.updated' | 'customer.created' | 'customer.deleted' | 'customer.updated' | 'job.status_changed' | 'job_approval.approved' | 'job_approval.change_requested' | 'message.bounced_customer' | 'message.bounced_purchase_order' | 'message.received_customer' | 'message.received_purchase_order' | 'message.status_changed' | 'order.created' | 'order.status_changed' | 'order_approval.approved' | 'order_approval.change_requested' | 'purchase_order.status_changed' | 'quote.created' | 'sales_order.status_changed' | 'shipment.status_changed' | 'work_pipeline.status_changed' | 'customer_credit.deposited' | 'customer_credit.withdrew' | 'payment_received.any_amount' | 'payment_received.deposit_amount' | 'payment_received.full_amount' | 'payment.refund_issued' | 'order.converted_to_quote' | 'quote.converted_to_sales_order';
                /**
                 * Event payload data (varies by event type)
                 */
                payload: any;
                /**
                 * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
                 */
                created_at: string;
                /**
                 * Last update timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
                 */
                updated_at: string;
            };
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * Last update timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: string;
        }>;
        pagination?: {
            count: number;
            currentPage: number;
            links?: {
                next?: (string | null);
                prev: string;
            };
            perPage: number;
            total: number;
            totalPages: number;
        };
        status: number;
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'GET',
            url: '/v1/api/store/{team_slug}/setting/webhook_subscription/{id}/log',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            query: {
                'page': page,
            },
        });
    }
}
