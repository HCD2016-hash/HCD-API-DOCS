/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class PurchaseOrderHistoryService {
    /**
     * Get purchase order activity history
     * Retrieve activity history for a specific purchase order
     * @param teamSlug Team slug identifier
     * @param purchaseOrderId Purchase order ID
     * @param page Page number for pagination
     * @returns any Successfully retrieved purchase order activity history
     * @throws ApiError
     */
    public static getPurchaseOrderActivityHistory(
        teamSlug: string,
        purchaseOrderId: string,
        page: number = 1,
    ): CancelablePromise<{
        data: Array<{
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
            url: '/v1/api/store/{team_slug}/purchase_order/{purchaseOrderId}/history',
            path: {
                'team_slug': teamSlug,
                'purchaseOrderId': purchaseOrderId,
            },
            query: {
                'page': page,
            },
        });
    }
}
