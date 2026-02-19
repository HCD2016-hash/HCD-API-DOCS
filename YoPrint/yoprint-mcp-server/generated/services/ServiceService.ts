/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class ServiceService {
    /**
     * Get list of services
     * Retrieve all services for a store
     * @param teamSlug Team slug identifier
     * @returns any List of services
     * @throws ApiError
     */
    public static getServiceList(
        teamSlug: string,
    ): CancelablePromise<{
        data: Array<{
            id: string;
            name: string;
            allow_cust_loc: boolean;
            option?: Array<string>;
            locations?: Array<{
                id: string;
                name: string;
                enable: boolean;
                services: Array<{
                    id: string;
                    name: string;
                }>;
                trashed: boolean;
            }>;
            pricing_type: 'single' | 'additional' | 'single_flat';
            primary_matrix: {
                default: {
                    config: {
                        type: 'normal' | 'percent';
                        column_position?: Array<string>;
                    };
                    data: Record<string, Array<{
                        price: number;
                        quantity: number;
                    }>>;
                };
            };
            position?: number;
            additional_matrix?: ({
                default: {
                    config: {
                        type: 'normal' | 'percent';
                        column_position?: Array<string>;
                    };
                    data: Record<string, Array<{
                        price: number;
                        quantity: number;
                    }>>;
                };
            } | null);
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
            url: '/v1/api/store/{team_slug}/service',
            path: {
                'team_slug': teamSlug,
            },
        });
    }
    /**
     * Create service
     * Create a new service
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Successfully created service
     * @throws ApiError
     */
    public static createService(
        teamSlug: string,
        requestBody: {
            name: string;
            id: (string | null);
            locations: Array<{
                id: string;
                name: string;
                enable: boolean;
            }>;
            allow_cust_loc: boolean;
            pricing_type: 'single' | 'additional' | 'single_flat';
            primary_matrix: {
                default: {
                    config: {
                        type: 'normal' | 'percent';
                        column_position?: Array<string>;
                    };
                    data: Record<string, Array<{
                        price: number;
                        quantity: number;
                    }>>;
                };
            };
            additional_matrix: ({
                default: {
                    config: {
                        type: 'normal' | 'percent';
                        column_position?: Array<string>;
                    };
                    data: Record<string, Array<{
                        price: number;
                        quantity: number;
                    }>>;
                };
            } | null);
        },
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            allow_cust_loc: boolean;
            option?: Array<string>;
            locations?: Array<{
                id: string;
                name: string;
                enable: boolean;
                services: Array<{
                    id: string;
                    name: string;
                }>;
                trashed: boolean;
            }>;
            pricing_type: 'single' | 'additional' | 'single_flat';
            primary_matrix: {
                default: {
                    config: {
                        type: 'normal' | 'percent';
                        column_position?: Array<string>;
                    };
                    data: Record<string, Array<{
                        price: number;
                        quantity: number;
                    }>>;
                };
            };
            position?: number;
            additional_matrix?: ({
                default: {
                    config: {
                        type: 'normal' | 'percent';
                        column_position?: Array<string>;
                    };
                    data: Record<string, Array<{
                        price: number;
                        quantity: number;
                    }>>;
                };
            } | null);
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
            url: '/v1/api/store/{team_slug}/service',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get one service entity
     * Retrieve a specific service by ID
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any Service details
     * @throws ApiError
     */
    public static getService(
        teamSlug: string,
        id: string,
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            allow_cust_loc: boolean;
            option?: Array<string>;
            locations?: Array<{
                id: string;
                name: string;
                enable: boolean;
                services: Array<{
                    id: string;
                    name: string;
                }>;
                trashed: boolean;
            }>;
            pricing_type: 'single' | 'additional' | 'single_flat';
            primary_matrix: {
                default: {
                    config: {
                        type: 'normal' | 'percent';
                        column_position?: Array<string>;
                    };
                    data: Record<string, Array<{
                        price: number;
                        quantity: number;
                    }>>;
                };
            };
            position?: number;
            additional_matrix?: ({
                default: {
                    config: {
                        type: 'normal' | 'percent';
                        column_position?: Array<string>;
                    };
                    data: Record<string, Array<{
                        price: number;
                        quantity: number;
                    }>>;
                };
            } | null);
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
            url: '/v1/api/store/{team_slug}/service/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Update service
     * Update an existing service
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @param requestBody
     * @returns any Successfully updated service
     * @throws ApiError
     */
    public static updateService(
        teamSlug: string,
        id: string,
        requestBody: {
            name: string;
            id: (string | null);
            locations: Array<{
                id: string;
                name: string;
                enable: boolean;
            }>;
            allow_cust_loc: boolean;
            pricing_type: 'single' | 'additional' | 'single_flat';
            primary_matrix: {
                default: {
                    config: {
                        type: 'normal' | 'percent';
                        column_position?: Array<string>;
                    };
                    data: Record<string, Array<{
                        price: number;
                        quantity: number;
                    }>>;
                };
            };
            additional_matrix: ({
                default: {
                    config: {
                        type: 'normal' | 'percent';
                        column_position?: Array<string>;
                    };
                    data: Record<string, Array<{
                        price: number;
                        quantity: number;
                    }>>;
                };
            } | null);
        },
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            allow_cust_loc: boolean;
            option?: Array<string>;
            locations?: Array<{
                id: string;
                name: string;
                enable: boolean;
                services: Array<{
                    id: string;
                    name: string;
                }>;
                trashed: boolean;
            }>;
            pricing_type: 'single' | 'additional' | 'single_flat';
            primary_matrix: {
                default: {
                    config: {
                        type: 'normal' | 'percent';
                        column_position?: Array<string>;
                    };
                    data: Record<string, Array<{
                        price: number;
                        quantity: number;
                    }>>;
                };
            };
            position?: number;
            additional_matrix?: ({
                default: {
                    config: {
                        type: 'normal' | 'percent';
                        column_position?: Array<string>;
                    };
                    data: Record<string, Array<{
                        price: number;
                        quantity: number;
                    }>>;
                };
            } | null);
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
            url: '/v1/api/store/{team_slug}/service/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Remove service
     * Remove a service
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @returns any Successfully removed service
     * @throws ApiError
     */
    public static removeService(
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
            url: '/v1/api/store/{team_slug}/service/{id}',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
        });
    }
    /**
     * Clone service
     * Create a duplicate of an existing service
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @param requestBody
     * @returns any Successfully cloned service
     * @throws ApiError
     */
    public static cloneService(
        teamSlug: string,
        id: string,
        requestBody: any,
    ): CancelablePromise<{
        data: {
            id: string;
            name: string;
            allow_cust_loc: boolean;
            option?: Array<string>;
            locations?: Array<{
                id: string;
                name: string;
                enable: boolean;
                services: Array<{
                    id: string;
                    name: string;
                }>;
                trashed: boolean;
            }>;
            pricing_type: 'single' | 'additional' | 'single_flat';
            primary_matrix: {
                default: {
                    config: {
                        type: 'normal' | 'percent';
                        column_position?: Array<string>;
                    };
                    data: Record<string, Array<{
                        price: number;
                        quantity: number;
                    }>>;
                };
            };
            position?: number;
            additional_matrix?: ({
                default: {
                    config: {
                        type: 'normal' | 'percent';
                        column_position?: Array<string>;
                    };
                    data: Record<string, Array<{
                        price: number;
                        quantity: number;
                    }>>;
                };
            } | null);
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
            method: 'PATCH',
            url: '/v1/api/store/{team_slug}/service/{id}/clone',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Arrange services
     * Reorder service display positions
     * @param teamSlug Team slug identifier
     * @param requestBody
     * @returns any Successfully arranged services
     * @throws ApiError
     */
    public static arrangeServices(
        teamSlug: string,
        requestBody: {
            items: Array<{
                id: string;
                position?: number;
            }>;
        },
    ): CancelablePromise<{
        data: Array<{
            id: string;
            name: string;
            allow_cust_loc: boolean;
            option?: Array<string>;
            locations?: Array<{
                id: string;
                name: string;
                enable: boolean;
                services: Array<{
                    id: string;
                    name: string;
                }>;
                trashed: boolean;
            }>;
            pricing_type: 'single' | 'additional' | 'single_flat';
            primary_matrix: {
                default: {
                    config: {
                        type: 'normal' | 'percent';
                        column_position?: Array<string>;
                    };
                    data: Record<string, Array<{
                        price: number;
                        quantity: number;
                    }>>;
                };
            };
            position?: number;
            additional_matrix?: ({
                default: {
                    config: {
                        type: 'normal' | 'percent';
                        column_position?: Array<string>;
                    };
                    data: Record<string, Array<{
                        price: number;
                        quantity: number;
                    }>>;
                };
            } | null);
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
            url: '/v1/api/store/{team_slug}/service/arrange',
            path: {
                'team_slug': teamSlug,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Export service pricing matrix
     * Export service pricing matrix as CSV file
     * @param teamSlug Team slug identifier
     * @param id Resource ID
     * @param requestBody
     * @returns binary CSV file download
     * @throws ApiError
     */
    public static exportServiceMatrix(
        teamSlug: string,
        id: string,
        requestBody: any,
    ): CancelablePromise<Blob> {
        return __request(OpenAPI, {
            method: 'PATCH',
            url: '/v1/api/store/{team_slug}/service/{id}/export_matrix',
            path: {
                'team_slug': teamSlug,
                'id': id,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
}
