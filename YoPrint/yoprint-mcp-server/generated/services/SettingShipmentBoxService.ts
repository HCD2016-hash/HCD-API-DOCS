/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SettingShipmentBoxService {
    /**
     * Get shipment box configurations
     * Retrieve all shipment box configurations for a team
     * @param teamSlug Team slug identifier
     * @returns any Shipment box configurations retrieved successfully
     * @throws ApiError
     */
    public static getV1ApiStoreSettingShipmentBox(
        teamSlug: string,
    ): CancelablePromise<{
        data: Array<{
            id: string;
            name: string;
            is_default: boolean;
            is_insured: boolean;
            height: number;
            width: number;
            length: number;
            /**
             * Length unit for shipment box dimensions - IN for inches, CM for centimeters
             */
            length_unit: 'IN' | 'CM';
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
            url: '/v1/api/store/{team_slug}/setting/shipment_box',
            path: {
                'team_slug': teamSlug,
            },
        });
    }
    /**
     * Create shipment box configuration
     * Create new shipment box configuration
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Shipment box configuration created successfully
     * @throws ApiError
     */
    public static postV1ApiStoreSettingShipmentBox(
        teamSlug: string,
        requestBody: {
            name: string;
            is_default: boolean;
            is_insured: boolean;
            height: number;
            width: number;
            length: number;
            /**
             * Length unit for shipment box dimensions - IN for inches, CM for centimeters
             */
            length_unit: 'IN' | 'CM';
        },
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            is_default: boolean;
            is_insured: boolean;
            height: number;
            width: number;
            length: number;
            /**
             * Length unit for shipment box dimensions - IN for inches, CM for centimeters
             */
            length_unit: 'IN' | 'CM';
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
            url: '/v1/api/store/{team_slug}/setting/shipment_box',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get shipment box configuration
     * Retrieve specific shipment box configuration by ID
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any Shipment box configuration retrieved successfully
     * @throws ApiError
     */
    public static getV1ApiStoreSettingShipmentBox1(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            is_default: boolean;
            is_insured: boolean;
            height: number;
            width: number;
            length: number;
            /**
             * Length unit for shipment box dimensions - IN for inches, CM for centimeters
             */
            length_unit: 'IN' | 'CM';
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
            url: '/v1/api/store/{team_slug}/setting/shipment_box/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Update shipment box configuration
     * Update existing shipment box configuration
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @param requestBody
     * @returns any Shipment box configuration updated successfully
     * @throws ApiError
     */
    public static putV1ApiStoreSettingShipmentBox(
        teamSlug: string,
        id: string,
        requestBody: {
            id: string;
            name?: string;
            is_default?: boolean;
            is_insured?: boolean;
            height?: number;
            width?: number;
            length?: number;
            /**
             * Length unit for shipment box dimensions - IN for inches, CM for centimeters
             */
            length_unit?: 'IN' | 'CM';
        },
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            is_default: boolean;
            is_insured: boolean;
            height: number;
            width: number;
            length: number;
            /**
             * Length unit for shipment box dimensions - IN for inches, CM for centimeters
             */
            length_unit: 'IN' | 'CM';
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
            url: '/v1/api/store/{team_slug}/setting/shipment_box/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Remove shipment box configuration
     * Remove shipment box configuration
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any Shipment box configuration removed successfully
     * @throws ApiError
     */
    public static deleteV1ApiStoreSettingShipmentBox(
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
            url: '/v1/api/store/{team_slug}/setting/shipment_box/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
}
