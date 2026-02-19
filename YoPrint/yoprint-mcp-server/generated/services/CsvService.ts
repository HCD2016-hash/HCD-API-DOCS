/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class CsvService {
    /**
     * Upload customer CSV file
     * Upload a CSV file containing customer data for processing and import
     * @param teamSlug Team slug identifier
     * @param formData CSV file upload
     * @returns any CSV file uploaded successfully
     * @throws ApiError
     */
    public static uploadCustomerTemplate(
        teamSlug: string,
        formData: {
            /**
             * CSV file to upload
             */
            file: Blob;
        },
    ): CancelablePromise<{
        data: {
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * URL to the CSV file
             */
            csv_url?: string | null;
            /**
             * Unique job identifier
             */
            id: string;
            /**
             * Job processing status
             */
            status: 'pending' | 'validation_failed' | 'import_success' | 'import_partial' | 'failed';
            /**
             * Validation completion flag
             */
            validated: boolean;
            /**
             * Count of rows with errors
             */
            error_row: number;
            /**
             * Count of successfully processed rows
             */
            success_row: number;
            /**
             * Total number of rows
             */
            total_row: number;
            /**
             * CSV import type
             */
            type: 'customer_csv' | 'variant_product_csv' | 'simple_product_csv';
            /**
             * Last update timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: string;
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
            url: '/v1/api/store/{team_slug}/csv/import/customer',
            path: {
                'team_slug': teamSlug,
            },
            formData: formData,
            mediaType: 'multipart/form-data',
        });
    }
    /**
     * Get all CSV jobs
     * Retrieve a list of all CSV import jobs for the team
     * @param teamSlug Team slug identifier
     * @returns any Successfully retrieved CSV jobs
     * @throws ApiError
     */
    public static getAllCsvJobs(
        teamSlug: string,
    ): CancelablePromise<{
        data: Array<{
            /**
             * Creation timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            created_at: string;
            /**
             * URL to the CSV file
             */
            csv_url?: string | null;
            /**
             * Unique job identifier
             */
            id: string;
            /**
             * Job processing status
             */
            status: 'pending' | 'validation_failed' | 'import_success' | 'import_partial' | 'failed';
            /**
             * Validation completion flag
             */
            validated: boolean;
            /**
             * Count of rows with errors
             */
            error_row: number;
            /**
             * Count of successfully processed rows
             */
            success_row: number;
            /**
             * Total number of rows
             */
            total_row: number;
            /**
             * CSV import type
             */
            type: 'customer_csv' | 'variant_product_csv' | 'simple_product_csv';
            /**
             * Last update timestamp in UTC ISO 8601 format (e.g., 2023-12-25T10:30:00.000Z)
             */
            updated_at: string;
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
            url: '/v1/api/store/{team_slug}/csv/jobs',
            path: {
                'team_slug': teamSlug,
            },
        });
    }
}
