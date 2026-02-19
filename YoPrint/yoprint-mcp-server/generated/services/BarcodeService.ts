/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class BarcodeService {
    /**
     * Decode barcode value
     * Analyzes a barcode value to identify the entity type, ID, and hierarchical relationships within the YoPrint system. Note: Only pass the barcode identifier (e.g., "y9-0p-job-1584"), not the full URL. If you have a URL like "https://ypnt.us/qrt/y9-0p-job-1584", extract only the last segment after the final slash.
     * @param teamSlug Team identifier for context-aware barcode decoding
     * @param requestBody Barcode identifier to decode (not the full URL)
     * @returns any Barcode decoded successfully
     * @throws ApiError
     */
    public static decodeBarcode(
        teamSlug: string,
        requestBody: {
            /**
             * Barcode identifier to decode (e.g., "y9-0p-job-1584"). Do not include the full URL - extract only the barcode portion after the last slash if you have a URL like "https://ypnt.us/qrt/y9-0p-job-1584".
             */
            value: string;
        },
    ): CancelablePromise<({
        /**
         * The response data
         */
        data: Record<string, any>;
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Whether the request was successful
         */
        success: boolean;
    } & {
        data?: {
            /**
             * Identified entity type from barcode analysis
             */
            type: 'sales_order' | 'quote' | 'purchase_order' | 'shipment' | 'job' | 'transfer_adjustment';
            /**
             * Unique identifier of the decoded entity
             */
            id: string;
            /**
             * Optional parent entity in hierarchical relationship (e.g., job parent is sales order)
             */
            parent?: {
                /**
                 * Parent entity type
                 */
                type: 'sales_order' | 'quote' | 'purchase_order' | 'shipment' | 'job' | 'transfer_adjustment';
                /**
                 * Parent entity identifier
                 */
                id: string;
            };
        };
    })> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/v1/api/store/{teamSlug}/decode_barcode',
            path: {
                'teamSlug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
}
