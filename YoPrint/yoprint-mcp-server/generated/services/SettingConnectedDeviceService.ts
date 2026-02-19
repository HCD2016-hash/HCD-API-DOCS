/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SettingConnectedDeviceService {
    /**
     * List connected devices
     * Retrieve a list of all connected devices. Currently supports Square credit card terminals for payment processing
     * @param teamSlug Team slug identifier
     * @returns any List of connected devices (currently Square credit card terminals)
     * @throws ApiError
     */
    public static getSettingConnectedDeviceList(
        teamSlug: string,
    ): CancelablePromise<{
        data: Array<{
            /**
             * Connected device ID
             */
            id: string;
            /**
             * Device identifier
             */
            device_id: string;
            /**
             * Device name
             */
            device_name: string;
            /**
             * Type of connected device (currently only square_terminal for Square credit card terminals)
             */
            device_type: 'square_terminal';
            /**
             * Device-specific configuration (Square terminal configuration for square_terminal type)
             */
            device_config: {
                /**
                 * Terminal code
                 */
                code: string;
                /**
                 * Creation timestamp
                 */
                created_at: string;
                /**
                 * Terminal ID
                 */
                id: string;
                /**
                 * Device ID (available after pairing)
                 */
                device_id?: string;
                /**
                 * Location ID
                 */
                location_id: string;
                /**
                 * Terminal name
                 */
                name: string;
                /**
                 * Pairing user
                 */
                pair_by: string;
                /**
                 * Product type
                 */
                product_type: string;
                /**
                 * Terminal pairing status
                 */
                status: 'UNPAIRED' | 'PAIRED' | 'UNKNOWN';
                /**
                 * Status change timestamp
                 */
                status_changed_at: string;
                /**
                 * Indicates if device was not found
                 */
                device_not_found?: boolean;
                /**
                 * Terminal version
                 */
                version: string;
            };
            /**
             * Current device status
             */
            device_status: 'ready' | 'unpaired' | 'not-found' | 'unknown';
            /**
             * Whether the device is enabled
             */
            is_enabled: boolean;
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
            url: '/v1/api/store/{team_slug}/setting/connected_device',
            path: {
                'team_slug': teamSlug,
            },
        });
    }
    /**
     * Delete connected device
     * Remove a connected device. Currently supports Square credit card terminals. You will still need to disconnect Square Terminal manually as this is not supported by Square
     * @param teamSlug Team slug identifier
     * @param id Connected device ID to delete
     * @returns any Connected device deleted successfully
     * @throws ApiError
     */
    public static deleteSettingConnectedDevice(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        /**
         * No data returned on successful deletion
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
            url: '/v1/api/store/{team_slug}/setting/connected_device/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
}
