/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class MiscService {
    /**
     * Get unique identifier for a specified document
     * Generates a unique identifier for a specified type of document
     * @param teamSlug Team slug identifier
     * @param type Specifies the document type for which a unique scoped_id will be generated with corresponding prefix
     * @returns any Successful response
     * @throws ApiError
     */
    public static getUniqueIdentifier(
        teamSlug: string,
        type: 'sales_order' | 'quote' | 'purchase_order' | 'stock_adjustment' | 'stock_transfer' | 'defect',
    ): CancelablePromise<{
        data: {
            /**
             * The generated unique identifier
             */
            identifier: string;
        };
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Indicates if the request was successful
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'GET',
            url: '/v1/api/store/{team_slug}/available_identifier',
            path: {
                'team_slug': teamSlug,
            },
            query: {
                'type': type,
            },
        });
    }
    /**
     * Validate Elasticsearch query syntax
     * Validates an Elasticsearch query string syntax before execution. The endpoint takes the query string from the "search" parameter, passes it to Elasticsearch's validateQuery API to check if the query syntax is valid, and returns success (200) if valid or error (422) if invalid. This pre-validation prevents runtime errors, provides immediate feedback on syntax errors, and ensures queries are properly formatted for operators like AND, OR, NOT, field searches, wildcards, and range queries.
     * @param requestBody
     * @returns any Query syntax is valid
     * @throws ApiError
     */
    public static validateElasticSearchQuery(
        requestBody: {
            /**
             * The Elasticsearch query string to validate. Supports query syntax including boolean operators (AND, OR, NOT), field searches (field:value), wildcards (*), phrase searches ("exact phrase"), range queries ([min TO max]), and parentheses for grouping. Example: "status:active AND (priority:high OR priority:critical)"
             */
            search: string;
        },
    ): CancelablePromise<{
        /**
         * No data returned, validation is indicated by success
         */
        data: null;
        /**
         * HTTP status code
         */
        status: number;
        /**
         * Indicates if the query is valid
         */
        success: boolean;
    }> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/v1/api/misc/validate_elastic_search_query',
            body: requestBody,
            mediaType: 'application/json',
            errors: {
                422: `Query syntax is invalid`,
            },
        });
    }
}
