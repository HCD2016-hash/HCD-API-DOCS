/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class SettingTeamService {
    /**
     * Get team settings
     * @param teamId
     * @returns any Team settings retrieved successfully
     * @throws ApiError
     */
    public static getTeamSetting(
        teamId: string,
    ): CancelablePromise<{
        data: {
            pagination_per_page: number;
            catalog_alp: boolean;
            catalog_alpca: boolean;
            catalog_sanmar: boolean;
            catalog_sanmar_ca: boolean;
            catalog_ssa: boolean;
            catalog_ssaca: boolean;
            catalog_tsf: boolean;
            catalog_augusta: boolean;
            catalog_conde: boolean;
            catalog_delta: boolean;
            conde_markup_percentage: number;
            enable_stock_management: boolean;
            enable_estimated_profit: boolean;
            enable_cust_portal_email_login: boolean;
            enable_cust_portal_custom_product_description: boolean;
            pdf_sales_order_show_custom_product_description: boolean;
            enable_cust_portal_split_payment_button: boolean;
            show_address_label_in_pdf: boolean;
            team_wide_notification_order: boolean;
            message_use_customer_portal_link: boolean;
            show_job_approval_term: boolean;
            job_approval_term_text: string;
            show_order_approval_term: boolean;
            order_approval_term_text: string;
            show_order_term: boolean;
            order_term_text: string;
            show_pdf_order_term: boolean;
            show_pdf_invoice_header_text: boolean;
            pdf_invoice_header_text: string;
            use_qr_code: boolean;
            pdf_order_term_text: string;
            pdf_bill_addr_show_primary_contact: boolean;
            pdf_show_packed_by: boolean;
            pdf_show_contact_info: Array<'header_right' | 'footer_left'>;
            pdf_sales_order_mockup_display_width: string;
            pdf_internal_job_mockup_display_width: string;
            pdf_sales_order_display_option: Array<string>;
            pdf_job_label_dymo_30336_option: Array<string>;
            pdf_job_label_option: Array<string>;
            pdf_purchase_order_options: Array<string>;
            pdf_purchase_order_label_options: Array<string>;
            pdf_cp_packing_slip_option: Array<string>;
            pdf_show_related_order_in_po: 'none' | 'all' | 'label_only' | 'detail_only';
            pdf_shipment_label_display_option: Array<'related_jobs' | 'dates'>;
            enable_ship_due_date: boolean;
            enable_ship_packed_by: boolean;
            pdf_header_use_logo: boolean;
            pdf_tax_show_team_tax_number: boolean;
            pdf_date_format: string;
            pdf_tax_show_customer_tax_number: boolean;
            tax_number_label: string;
            tax_invoice_label: string;
            web_date_format: string;
            tax_label_name: string;
            stripe_webhook_url?: string;
            paypal_webhook_url?: string;
            square_webhook_url?: string;
            weight: string;
            dimension: string;
            cust_portal_payment_option_default_enabled: boolean;
            ui_preference: (any[] | {
                version?: number;
            });
            cust_msg_status: boolean;
            email_use_reply_to_as_from_email_address: boolean;
            default_pricing_strategy: string;
            show_payment_history_in_invoice: boolean;
            column: Array<string>;
            show_so_profit: boolean;
            enable_customer_message: boolean;
            pdf_sales_order_show_order_item_description: boolean;
            auto_allocate_inventory_on_job_status_change: boolean;
            auto_allocate_inventory_on_order_status_change: boolean;
            cust_portal_direct_payment_link_bypass_enabled: boolean;
            pdf_purchase_order_swap_address_location: boolean;
            enable_stripe?: boolean;
            stripe_webhook_sig?: string;
            stripe_secret_key?: string;
            publishable_key?: string;
            enable_authorize_net?: boolean;
            authorize_login_id?: string;
            authorize_trans_key?: string;
            authorize_client_key?: string;
            authorize_sig_key?: string;
            enable_paypal?: boolean;
            paypal_client_id?: string;
            paypal_secret?: string;
            enable_square?: boolean;
            enable_square_payment?: boolean;
            square_access_token?: string;
            square_client_id?: string;
            square_location_id?: string;
            square_webhook_sig?: string;
            square_webhook_locations?: Array<{
                id: string;
            }>;
            enable_charge_it_pro?: boolean;
            charge_it_pro_oid?: string;
            charge_it_pro_auth_key?: string;
            charge_it_pro_mode?: 'in-person' | 'online' | 'both';
            charge_it_pro_device_id?: string;
            order_prod_start_day?: number;
            order_prod_end_day?: number;
            order_due_day?: number;
            quote_prod_start_day?: number;
            quote_prod_end_day?: number;
            quote_due_day?: number;
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
            url: '/v1/api/store/{team_slug}/setting',
            path: {
                'teamId': teamId,
            },
        });
    }
    /**
     * Update team detail information
     * @param teamId
     * @param requestBody
     * @returns any Team detail updated successfully
     * @throws ApiError
     */
    public static updateTeamDetail(
        teamId: string,
        requestBody: {
            name?: string;
            email?: string;
            website?: string;
            phone?: string;
            phone_country?: string;
            timezone?: string;
            tax_number?: string;
        },
    ): CancelablePromise<{
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
    }> {
        return __request(OpenAPI, {
            method: 'PUT',
            url: '/v1/api/store/{team_slug}/setting',
            path: {
                'teamId': teamId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Update general team settings
     * @param teamId
     * @param requestBody
     * @returns any General settings updated successfully
     * @throws ApiError
     */
    public static updateGeneralTeamSetting(
        teamId: string,
        requestBody: Record<string, any>,
    ): CancelablePromise<{
        data: {
            pagination_per_page: number;
            catalog_alp: boolean;
            catalog_alpca: boolean;
            catalog_sanmar: boolean;
            catalog_sanmar_ca: boolean;
            catalog_ssa: boolean;
            catalog_ssaca: boolean;
            catalog_tsf: boolean;
            catalog_augusta: boolean;
            catalog_conde: boolean;
            catalog_delta: boolean;
            conde_markup_percentage: number;
            enable_stock_management: boolean;
            enable_estimated_profit: boolean;
            enable_cust_portal_email_login: boolean;
            enable_cust_portal_custom_product_description: boolean;
            pdf_sales_order_show_custom_product_description: boolean;
            enable_cust_portal_split_payment_button: boolean;
            show_address_label_in_pdf: boolean;
            team_wide_notification_order: boolean;
            message_use_customer_portal_link: boolean;
            show_job_approval_term: boolean;
            job_approval_term_text: string;
            show_order_approval_term: boolean;
            order_approval_term_text: string;
            show_order_term: boolean;
            order_term_text: string;
            show_pdf_order_term: boolean;
            show_pdf_invoice_header_text: boolean;
            pdf_invoice_header_text: string;
            use_qr_code: boolean;
            pdf_order_term_text: string;
            pdf_bill_addr_show_primary_contact: boolean;
            pdf_show_packed_by: boolean;
            pdf_show_contact_info: Array<'header_right' | 'footer_left'>;
            pdf_sales_order_mockup_display_width: string;
            pdf_internal_job_mockup_display_width: string;
            pdf_sales_order_display_option: Array<string>;
            pdf_job_label_dymo_30336_option: Array<string>;
            pdf_job_label_option: Array<string>;
            pdf_purchase_order_options: Array<string>;
            pdf_purchase_order_label_options: Array<string>;
            pdf_cp_packing_slip_option: Array<string>;
            pdf_show_related_order_in_po: 'none' | 'all' | 'label_only' | 'detail_only';
            pdf_shipment_label_display_option: Array<'related_jobs' | 'dates'>;
            enable_ship_due_date: boolean;
            enable_ship_packed_by: boolean;
            pdf_header_use_logo: boolean;
            pdf_tax_show_team_tax_number: boolean;
            pdf_date_format: string;
            pdf_tax_show_customer_tax_number: boolean;
            tax_number_label: string;
            tax_invoice_label: string;
            web_date_format: string;
            tax_label_name: string;
            stripe_webhook_url?: string;
            paypal_webhook_url?: string;
            square_webhook_url?: string;
            weight: string;
            dimension: string;
            cust_portal_payment_option_default_enabled: boolean;
            ui_preference: (any[] | {
                version?: number;
            });
            cust_msg_status: boolean;
            email_use_reply_to_as_from_email_address: boolean;
            default_pricing_strategy: string;
            show_payment_history_in_invoice: boolean;
            column: Array<string>;
            show_so_profit: boolean;
            enable_customer_message: boolean;
            pdf_sales_order_show_order_item_description: boolean;
            auto_allocate_inventory_on_job_status_change: boolean;
            auto_allocate_inventory_on_order_status_change: boolean;
            cust_portal_direct_payment_link_bypass_enabled: boolean;
            pdf_purchase_order_swap_address_location: boolean;
            enable_stripe?: boolean;
            stripe_webhook_sig?: string;
            stripe_secret_key?: string;
            publishable_key?: string;
            enable_authorize_net?: boolean;
            authorize_login_id?: string;
            authorize_trans_key?: string;
            authorize_client_key?: string;
            authorize_sig_key?: string;
            enable_paypal?: boolean;
            paypal_client_id?: string;
            paypal_secret?: string;
            enable_square?: boolean;
            enable_square_payment?: boolean;
            square_access_token?: string;
            square_client_id?: string;
            square_location_id?: string;
            square_webhook_sig?: string;
            square_webhook_locations?: Array<{
                id: string;
            }>;
            enable_charge_it_pro?: boolean;
            charge_it_pro_oid?: string;
            charge_it_pro_auth_key?: string;
            charge_it_pro_mode?: 'in-person' | 'online' | 'both';
            charge_it_pro_device_id?: string;
            order_prod_start_day?: number;
            order_prod_end_day?: number;
            order_due_day?: number;
            quote_prod_start_day?: number;
            quote_prod_end_day?: number;
            quote_due_day?: number;
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
            url: '/v1/api/store/{team_slug}/setting/general',
            path: {
                'teamId': teamId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get team detail information
     * @param teamId
     * @returns any Team detail retrieved successfully
     * @throws ApiError
     */
    public static getTeamDetail(
        teamId: string,
    ): CancelablePromise<{
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
    }> {
        return __request(OpenAPI, {
            method: 'GET',
            url: '/v1/api/store/{team_slug}/setting/detail',
            path: {
                'teamId': teamId,
            },
        });
    }
    /**
     * Update payment gateway settings
     * @param teamId
     * @param requestBody
     * @returns any Payment gateway settings updated successfully
     * @throws ApiError
     */
    public static updatePaymentGateway(
        teamId: string,
        requestBody: Record<string, any>,
    ): CancelablePromise<{
        data: {
            pagination_per_page: number;
            catalog_alp: boolean;
            catalog_alpca: boolean;
            catalog_sanmar: boolean;
            catalog_sanmar_ca: boolean;
            catalog_ssa: boolean;
            catalog_ssaca: boolean;
            catalog_tsf: boolean;
            catalog_augusta: boolean;
            catalog_conde: boolean;
            catalog_delta: boolean;
            conde_markup_percentage: number;
            enable_stock_management: boolean;
            enable_estimated_profit: boolean;
            enable_cust_portal_email_login: boolean;
            enable_cust_portal_custom_product_description: boolean;
            pdf_sales_order_show_custom_product_description: boolean;
            enable_cust_portal_split_payment_button: boolean;
            show_address_label_in_pdf: boolean;
            team_wide_notification_order: boolean;
            message_use_customer_portal_link: boolean;
            show_job_approval_term: boolean;
            job_approval_term_text: string;
            show_order_approval_term: boolean;
            order_approval_term_text: string;
            show_order_term: boolean;
            order_term_text: string;
            show_pdf_order_term: boolean;
            show_pdf_invoice_header_text: boolean;
            pdf_invoice_header_text: string;
            use_qr_code: boolean;
            pdf_order_term_text: string;
            pdf_bill_addr_show_primary_contact: boolean;
            pdf_show_packed_by: boolean;
            pdf_show_contact_info: Array<'header_right' | 'footer_left'>;
            pdf_sales_order_mockup_display_width: string;
            pdf_internal_job_mockup_display_width: string;
            pdf_sales_order_display_option: Array<string>;
            pdf_job_label_dymo_30336_option: Array<string>;
            pdf_job_label_option: Array<string>;
            pdf_purchase_order_options: Array<string>;
            pdf_purchase_order_label_options: Array<string>;
            pdf_cp_packing_slip_option: Array<string>;
            pdf_show_related_order_in_po: 'none' | 'all' | 'label_only' | 'detail_only';
            pdf_shipment_label_display_option: Array<'related_jobs' | 'dates'>;
            enable_ship_due_date: boolean;
            enable_ship_packed_by: boolean;
            pdf_header_use_logo: boolean;
            pdf_tax_show_team_tax_number: boolean;
            pdf_date_format: string;
            pdf_tax_show_customer_tax_number: boolean;
            tax_number_label: string;
            tax_invoice_label: string;
            web_date_format: string;
            tax_label_name: string;
            stripe_webhook_url?: string;
            paypal_webhook_url?: string;
            square_webhook_url?: string;
            weight: string;
            dimension: string;
            cust_portal_payment_option_default_enabled: boolean;
            ui_preference: (any[] | {
                version?: number;
            });
            cust_msg_status: boolean;
            email_use_reply_to_as_from_email_address: boolean;
            default_pricing_strategy: string;
            show_payment_history_in_invoice: boolean;
            column: Array<string>;
            show_so_profit: boolean;
            enable_customer_message: boolean;
            pdf_sales_order_show_order_item_description: boolean;
            auto_allocate_inventory_on_job_status_change: boolean;
            auto_allocate_inventory_on_order_status_change: boolean;
            cust_portal_direct_payment_link_bypass_enabled: boolean;
            pdf_purchase_order_swap_address_location: boolean;
            enable_stripe?: boolean;
            stripe_webhook_sig?: string;
            stripe_secret_key?: string;
            publishable_key?: string;
            enable_authorize_net?: boolean;
            authorize_login_id?: string;
            authorize_trans_key?: string;
            authorize_client_key?: string;
            authorize_sig_key?: string;
            enable_paypal?: boolean;
            paypal_client_id?: string;
            paypal_secret?: string;
            enable_square?: boolean;
            enable_square_payment?: boolean;
            square_access_token?: string;
            square_client_id?: string;
            square_location_id?: string;
            square_webhook_sig?: string;
            square_webhook_locations?: Array<{
                id: string;
            }>;
            enable_charge_it_pro?: boolean;
            charge_it_pro_oid?: string;
            charge_it_pro_auth_key?: string;
            charge_it_pro_mode?: 'in-person' | 'online' | 'both';
            charge_it_pro_device_id?: string;
            order_prod_start_day?: number;
            order_prod_end_day?: number;
            order_due_day?: number;
            quote_prod_start_day?: number;
            quote_prod_end_day?: number;
            quote_due_day?: number;
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
            url: '/v1/api/store/{team_slug}/setting/payment_gateway',
            path: {
                'teamId': teamId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get Square location list
     * @param teamId
     * @param requestBody
     * @returns any Square locations retrieved successfully
     * @throws ApiError
     */
    public static getSquareLocationList(
        teamId: string,
        requestBody: {
            square_access_token: string;
        },
    ): CancelablePromise<{
        data: Array<{
            id: string;
            name: string;
            status: 'ACTIVE' | 'INACTIVE';
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
            url: '/v1/api/store/{team_slug}/setting/payment_gateway/get_square_location_list',
            path: {
                'teamId': teamId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Get team running numbers
     * @param teamId
     * @returns any Running numbers retrieved successfully
     * @throws ApiError
     */
    public static getTeamRunningNumber(
        teamId: string,
    ): CancelablePromise<{
        data: {
            sales_order: number;
            quote?: number;
            purchase_order: number;
            order_invoice: number;
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
            url: '/v1/api/store/{team_slug}/setting/running_number',
            path: {
                'teamId': teamId,
            },
        });
    }
    /**
     * Update team running numbers
     * @param teamId
     * @param requestBody
     * @returns any Running numbers updated successfully
     * @throws ApiError
     */
    public static updateTeamRunningNumber(
        teamId: string,
        requestBody: {
            sales_order?: number;
            purchase_order?: number;
            order_invoice?: number;
        },
    ): CancelablePromise<{
        data: {
            sales_order: number;
            quote?: number;
            purchase_order: number;
            order_invoice: number;
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
            url: '/v1/api/store/{team_slug}/setting/running_number',
            path: {
                'teamId': teamId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Save custom domain configuration
     * @param teamId
     * @param requestBody
     * @returns any Custom domain saved successfully
     * @throws ApiError
     */
    public static saveCustomDomain(
        teamId: string,
        requestBody: {
            custom_domain: string;
        },
    ): CancelablePromise<{
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
    }> {
        return __request(OpenAPI, {
            method: 'PUT',
            url: '/v1/api/store/{team_slug}/setting/custom_domain/update',
            path: {
                'teamId': teamId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Enable team feature addon
     * @param teamId
     * @param featureName
     * @param requestBody
     * @returns any Feature addon enabled successfully
     * @throws ApiError
     */
    public static enableFeatureAddon(
        teamId: string,
        featureName: 'cust_msg_status',
        requestBody: Record<string, any>,
    ): CancelablePromise<{
        data: {
            pagination_per_page: number;
            catalog_alp: boolean;
            catalog_alpca: boolean;
            catalog_sanmar: boolean;
            catalog_sanmar_ca: boolean;
            catalog_ssa: boolean;
            catalog_ssaca: boolean;
            catalog_tsf: boolean;
            catalog_augusta: boolean;
            catalog_conde: boolean;
            catalog_delta: boolean;
            conde_markup_percentage: number;
            enable_stock_management: boolean;
            enable_estimated_profit: boolean;
            enable_cust_portal_email_login: boolean;
            enable_cust_portal_custom_product_description: boolean;
            pdf_sales_order_show_custom_product_description: boolean;
            enable_cust_portal_split_payment_button: boolean;
            show_address_label_in_pdf: boolean;
            team_wide_notification_order: boolean;
            message_use_customer_portal_link: boolean;
            show_job_approval_term: boolean;
            job_approval_term_text: string;
            show_order_approval_term: boolean;
            order_approval_term_text: string;
            show_order_term: boolean;
            order_term_text: string;
            show_pdf_order_term: boolean;
            show_pdf_invoice_header_text: boolean;
            pdf_invoice_header_text: string;
            use_qr_code: boolean;
            pdf_order_term_text: string;
            pdf_bill_addr_show_primary_contact: boolean;
            pdf_show_packed_by: boolean;
            pdf_show_contact_info: Array<'header_right' | 'footer_left'>;
            pdf_sales_order_mockup_display_width: string;
            pdf_internal_job_mockup_display_width: string;
            pdf_sales_order_display_option: Array<string>;
            pdf_job_label_dymo_30336_option: Array<string>;
            pdf_job_label_option: Array<string>;
            pdf_purchase_order_options: Array<string>;
            pdf_purchase_order_label_options: Array<string>;
            pdf_cp_packing_slip_option: Array<string>;
            pdf_show_related_order_in_po: 'none' | 'all' | 'label_only' | 'detail_only';
            pdf_shipment_label_display_option: Array<'related_jobs' | 'dates'>;
            enable_ship_due_date: boolean;
            enable_ship_packed_by: boolean;
            pdf_header_use_logo: boolean;
            pdf_tax_show_team_tax_number: boolean;
            pdf_date_format: string;
            pdf_tax_show_customer_tax_number: boolean;
            tax_number_label: string;
            tax_invoice_label: string;
            web_date_format: string;
            tax_label_name: string;
            stripe_webhook_url?: string;
            paypal_webhook_url?: string;
            square_webhook_url?: string;
            weight: string;
            dimension: string;
            cust_portal_payment_option_default_enabled: boolean;
            ui_preference: (any[] | {
                version?: number;
            });
            cust_msg_status: boolean;
            email_use_reply_to_as_from_email_address: boolean;
            default_pricing_strategy: string;
            show_payment_history_in_invoice: boolean;
            column: Array<string>;
            show_so_profit: boolean;
            enable_customer_message: boolean;
            pdf_sales_order_show_order_item_description: boolean;
            auto_allocate_inventory_on_job_status_change: boolean;
            auto_allocate_inventory_on_order_status_change: boolean;
            cust_portal_direct_payment_link_bypass_enabled: boolean;
            pdf_purchase_order_swap_address_location: boolean;
            enable_stripe?: boolean;
            stripe_webhook_sig?: string;
            stripe_secret_key?: string;
            publishable_key?: string;
            enable_authorize_net?: boolean;
            authorize_login_id?: string;
            authorize_trans_key?: string;
            authorize_client_key?: string;
            authorize_sig_key?: string;
            enable_paypal?: boolean;
            paypal_client_id?: string;
            paypal_secret?: string;
            enable_square?: boolean;
            enable_square_payment?: boolean;
            square_access_token?: string;
            square_client_id?: string;
            square_location_id?: string;
            square_webhook_sig?: string;
            square_webhook_locations?: Array<{
                id: string;
            }>;
            enable_charge_it_pro?: boolean;
            charge_it_pro_oid?: string;
            charge_it_pro_auth_key?: string;
            charge_it_pro_mode?: 'in-person' | 'online' | 'both';
            charge_it_pro_device_id?: string;
            order_prod_start_day?: number;
            order_prod_end_day?: number;
            order_due_day?: number;
            quote_prod_start_day?: number;
            quote_prod_end_day?: number;
            quote_due_day?: number;
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
            url: '/v1/api/store/{team_slug}/setting/feature_addon/{featureName}/enable',
            path: {
                'teamId': teamId,
                'featureName': featureName,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Disable team feature addon
     * @param teamId
     * @param featureName
     * @param requestBody
     * @returns any Feature addon disabled successfully
     * @throws ApiError
     */
    public static disableFeatureAddon(
        teamId: string,
        featureName: 'cust_msg_status',
        requestBody: Record<string, any>,
    ): CancelablePromise<{
        data: {
            pagination_per_page: number;
            catalog_alp: boolean;
            catalog_alpca: boolean;
            catalog_sanmar: boolean;
            catalog_sanmar_ca: boolean;
            catalog_ssa: boolean;
            catalog_ssaca: boolean;
            catalog_tsf: boolean;
            catalog_augusta: boolean;
            catalog_conde: boolean;
            catalog_delta: boolean;
            conde_markup_percentage: number;
            enable_stock_management: boolean;
            enable_estimated_profit: boolean;
            enable_cust_portal_email_login: boolean;
            enable_cust_portal_custom_product_description: boolean;
            pdf_sales_order_show_custom_product_description: boolean;
            enable_cust_portal_split_payment_button: boolean;
            show_address_label_in_pdf: boolean;
            team_wide_notification_order: boolean;
            message_use_customer_portal_link: boolean;
            show_job_approval_term: boolean;
            job_approval_term_text: string;
            show_order_approval_term: boolean;
            order_approval_term_text: string;
            show_order_term: boolean;
            order_term_text: string;
            show_pdf_order_term: boolean;
            show_pdf_invoice_header_text: boolean;
            pdf_invoice_header_text: string;
            use_qr_code: boolean;
            pdf_order_term_text: string;
            pdf_bill_addr_show_primary_contact: boolean;
            pdf_show_packed_by: boolean;
            pdf_show_contact_info: Array<'header_right' | 'footer_left'>;
            pdf_sales_order_mockup_display_width: string;
            pdf_internal_job_mockup_display_width: string;
            pdf_sales_order_display_option: Array<string>;
            pdf_job_label_dymo_30336_option: Array<string>;
            pdf_job_label_option: Array<string>;
            pdf_purchase_order_options: Array<string>;
            pdf_purchase_order_label_options: Array<string>;
            pdf_cp_packing_slip_option: Array<string>;
            pdf_show_related_order_in_po: 'none' | 'all' | 'label_only' | 'detail_only';
            pdf_shipment_label_display_option: Array<'related_jobs' | 'dates'>;
            enable_ship_due_date: boolean;
            enable_ship_packed_by: boolean;
            pdf_header_use_logo: boolean;
            pdf_tax_show_team_tax_number: boolean;
            pdf_date_format: string;
            pdf_tax_show_customer_tax_number: boolean;
            tax_number_label: string;
            tax_invoice_label: string;
            web_date_format: string;
            tax_label_name: string;
            stripe_webhook_url?: string;
            paypal_webhook_url?: string;
            square_webhook_url?: string;
            weight: string;
            dimension: string;
            cust_portal_payment_option_default_enabled: boolean;
            ui_preference: (any[] | {
                version?: number;
            });
            cust_msg_status: boolean;
            email_use_reply_to_as_from_email_address: boolean;
            default_pricing_strategy: string;
            show_payment_history_in_invoice: boolean;
            column: Array<string>;
            show_so_profit: boolean;
            enable_customer_message: boolean;
            pdf_sales_order_show_order_item_description: boolean;
            auto_allocate_inventory_on_job_status_change: boolean;
            auto_allocate_inventory_on_order_status_change: boolean;
            cust_portal_direct_payment_link_bypass_enabled: boolean;
            pdf_purchase_order_swap_address_location: boolean;
            enable_stripe?: boolean;
            stripe_webhook_sig?: string;
            stripe_secret_key?: string;
            publishable_key?: string;
            enable_authorize_net?: boolean;
            authorize_login_id?: string;
            authorize_trans_key?: string;
            authorize_client_key?: string;
            authorize_sig_key?: string;
            enable_paypal?: boolean;
            paypal_client_id?: string;
            paypal_secret?: string;
            enable_square?: boolean;
            enable_square_payment?: boolean;
            square_access_token?: string;
            square_client_id?: string;
            square_location_id?: string;
            square_webhook_sig?: string;
            square_webhook_locations?: Array<{
                id: string;
            }>;
            enable_charge_it_pro?: boolean;
            charge_it_pro_oid?: string;
            charge_it_pro_auth_key?: string;
            charge_it_pro_mode?: 'in-person' | 'online' | 'both';
            charge_it_pro_device_id?: string;
            order_prod_start_day?: number;
            order_prod_end_day?: number;
            order_due_day?: number;
            quote_prod_start_day?: number;
            quote_prod_end_day?: number;
            quote_due_day?: number;
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
            url: '/v1/api/store/{team_slug}/setting/feature_addon/{featureName}/disable',
            path: {
                'teamId': teamId,
                'featureName': featureName,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
    /**
     * Upload team logo image
     * @param teamId
     * @param formData
     * @returns any Image uploaded successfully
     * @throws ApiError
     */
    public static uploadTeamImage(
        teamId: string,
        formData: {
            file?: Blob;
        },
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
            method: 'POST',
            url: '/v1/api/store/{team_slug}/setting/photo',
            path: {
                'teamId': teamId,
            },
            formData: formData,
            mediaType: 'multipart/form-data',
        });
    }
    /**
     * Delete team logo image
     * @param teamId
     * @returns any Image deleted successfully
     * @throws ApiError
     */
    public static deleteTeamImage(
        teamId: string,
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
            url: '/v1/api/store/{team_slug}/setting/photo',
            path: {
                'teamId': teamId,
            },
        });
    }
    /**
     * Upload customer portal background image
     * @param teamId
     * @param formData
     * @returns any Background image uploaded successfully
     * @throws ApiError
     */
    public static uploadCustomerPortalBackground(
        teamId: string,
        formData: {
            file?: Blob;
        },
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
            method: 'POST',
            url: '/v1/api/store/{team_slug}/setting/customer_portal_bg',
            path: {
                'teamId': teamId,
            },
            formData: formData,
            mediaType: 'multipart/form-data',
        });
    }
    /**
     * Setup team address during onboarding
     * @param teamId
     * @param requestBody
     * @returns any Address setup completed successfully
     * @throws ApiError
     */
    public static onboardSetupAddress(
        teamId: string,
        requestBody: Record<string, any>,
    ): CancelablePromise<any> {
        return __request(OpenAPI, {
            method: 'PUT',
            url: '/v1/api/store/{team_slug}/onboard/setup_address',
            path: {
                'teamId': teamId,
            },
            body: requestBody,
            mediaType: 'application/json',
        });
    }
}
