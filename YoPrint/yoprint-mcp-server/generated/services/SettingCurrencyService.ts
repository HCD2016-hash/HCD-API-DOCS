/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SettingCurrencyService {
    /**
     * List currencies
     * Retrieve a list of all configured currencies
     * @param teamSlug Team slug identifier
     * @returns any List of currencies
     * @throws ApiError
     */
    public static getSettingCurrencyList(
        teamSlug: string,
    ): CancelablePromise<{
        data: Array<{
            /**
             * Currency ID
             */
            id: string;
            /**
             * Currency name (e.g., US Dollar)
             */
            name: string;
            /**
             * ISO 4217 currency code (e.g., USD)
             */
            iso: string;
            /**
             * Currency symbol (e.g., $)
             */
            symbol: string;
            /**
             * Whether this is the default currency
             */
            default: boolean;
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
            url: '/v1/api/store/{team_slug}/setting/currency',
            path: {
                'team_slug': teamSlug,
            },
        });
    }
    /**
     * Update currency
     * Update currency details
     * @param teamSlug Team slug identifier
     * @param id Currency ID to update
     * @param requestBody
     * @returns any Currency updated successfully
     * @throws ApiError
     */
    public static updateSettingCurrency(
        teamSlug: string,
        id: string,
        requestBody: {
            /**
             * Currency ID
             */
            id: string;
            /**
             * ISO 4217 currency code (e.g., USD)
             */
            iso: string;
            /**
             * Currency name (e.g., US Dollar)
             */
            name: string;
            /**
             * Currency symbol (e.g., $)
             */
            symbol: string;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Currency ID
             */
            id: string;
            /**
             * Currency name (e.g., US Dollar)
             */
            name: string;
            /**
             * ISO 4217 currency code (e.g., USD)
             */
            iso: string;
            /**
             * Currency symbol (e.g., $)
             */
            symbol: string;
            /**
             * Whether this is the default currency
             */
            default: boolean;
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
            url: '/v1/api/store/{team_slug}/setting/currency/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
}
