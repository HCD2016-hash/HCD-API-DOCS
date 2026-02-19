/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class AutoTaxService {
    /**
     * Calculate tax rate
     * Calculate tax rate for a customer and address
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Tax rate calculation result
     * @throws ApiError
     */
    public static postV1ApiStoreMiscCalcTax(
        teamSlug: string,
        requestBody: {
            customer_id: string;
            address_id: string;
        },
    ): CancelablePromise<{
        data: {
            type: 'tax_free' | 'single_tax' | 'multiple_tax';
            total: number;
            shipping_taxable: boolean;
        };
        status: number;
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/v1/api/store/{team_slug}/misc/calc_tax',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
}
