import 'package:dio/dio.dart';
import 'package:ezrxmobile/application/about_us/about_us_bloc.dart';
import 'package:ezrxmobile/application/account/contact_us/contact_us_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/ez_point/ez_point_bloc.dart';
import 'package:ezrxmobile/application/account/national_privacy_commission/national_privacy_commission_bloc.dart';
import 'package:ezrxmobile/application/account/notification_settings/notification_settings_bloc.dart';
import 'package:ezrxmobile/application/account/privacy_consent/privacy_consent_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/settings/setting_bloc.dart';
import 'package:ezrxmobile/application/account/submit_ticket/bloc/submit_ticket_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_attachment_bloc/announcement_attachment_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_filter/announcement_filter_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_details/announcement_info_details_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_filter/articles_info_filter_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/forgot_password/forgot_password_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/application/contact_us/contact_us_details_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/application/faq/faq_bloc.dart';
import 'package:ezrxmobile/application/notification/notification_bloc.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/bundle/add_to_cart/bundle_add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/discount_override/discount_override_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_detail_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_list_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_filter/view_by_item_filter_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_filter/view_by_order_filter_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/bank_in_accounts/bank_in_accounts_bloc.dart';
import 'package:ezrxmobile/application/payments/claim_management/claim_management_bloc.dart';
import 'package:ezrxmobile/application/payments/claim_management/filter/claim_management_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/payments/download_e_credit/download_e_credit_bloc.dart';
import 'package:ezrxmobile/application/payments/download_e_invoice/download_e_invoice_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/filter/full_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/full_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/new_claim_submission/new_claim_submission_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/filter/available_credit_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/filter/outstanding_invoice_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_in_progress/payment_in_progress_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/filter/payment_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_filter/soa_filter_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/attachments/return_request_attachment_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/filter/return_items_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/return_items_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/view_by_item_filter/view_by_item_return_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/details/return_details_by_request_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/return_list_by_request_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/view_by_request_filter/view_by_request_return_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_filter/return_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/repository/i_combo_deal_repository.dart';
import 'package:ezrxmobile/infrastructure/about_us/datasource/about_us_local.dart';
import 'package:ezrxmobile/infrastructure/about_us/datasource/about_us_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/about_us/datasource/about_us_remote.dart';
import 'package:ezrxmobile/infrastructure/about_us/repository/about_us_repository.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/contact_us_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/contact_us_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/contact_us_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_license_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_license_query.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_license_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ez_point_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ez_point_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ez_point_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ezcs_ticket_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ezcs_ticket_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ezcs_ticket_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/language_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/language_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/language_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/notification_settings_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/notification_settings_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/notification_settings_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/bank_beneficiary_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/contact_us_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_code_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_license_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/ez_point_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/ezcs_ticket_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/notification_settings_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/sales_org_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/sales_rep_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_local.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_remote.dart';
import 'package:ezrxmobile/infrastructure/announcement/repository/announcement_repository.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_article_tag_local.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_article_tag_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_article_tag_remote.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_attachment_download_locale.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_attachment_download_remote.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_local.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_remote.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/repository/announcement_article_tag_repository.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/repository/announcement_attachment_repository.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/repository/announcement_info_repository.dart';
import 'package:ezrxmobile/infrastructure/article_info/datasource/article_info_local.dart';
import 'package:ezrxmobile/infrastructure/article_info/datasource/article_info_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/article_info/datasource/article_info_remote.dart';
import 'package:ezrxmobile/infrastructure/article_info/repository/article_info_repository.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/datasource/tncdate_local.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/datasource/tncdate_remote.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/repository/aup_tc_repository.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/change_password_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/change_password_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/forgot_password_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/forgot_password_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/auth_repository.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/change_password_repository.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/forgot_password_repository.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_local.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_remote.dart';
import 'package:ezrxmobile/infrastructure/banner/repository/banner_repository.dart';
import 'package:ezrxmobile/infrastructure/chatbot/repository/chatbot_repository.dart';
import 'package:ezrxmobile/infrastructure/connectivity/repository/connectivity_repository.dart';
import 'package:ezrxmobile/infrastructure/contact_us/datasource/contact_us_local.dart';
import 'package:ezrxmobile/infrastructure/contact_us/datasource/contact_us_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/contact_us/datasource/contact_us_remote.dart';
import 'package:ezrxmobile/infrastructure/contact_us/repository/contact_us_repository.dart';
import 'package:ezrxmobile/infrastructure/core/chatbot/chatbot_service.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/infrastructure/core/common/take_picture_service.dart';
import 'package:ezrxmobile/infrastructure/core/connectivity/connectivity_service.dart';
import 'package:ezrxmobile/infrastructure/core/crypto/encryption.dart';
import 'package:ezrxmobile/infrastructure/core/datadog/datadog_service.dart';
import 'package:ezrxmobile/infrastructure/core/device/repository/device_repository.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/analytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/crashlytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/performance_monitor.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/core/http/interceptor/auth_interceptor.dart';
import 'package:ezrxmobile/infrastructure/core/http/interceptor/datadog_interceptor.dart';
import 'package:ezrxmobile/infrastructure/core/http/interceptor/performance_interceptor.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/account_selector_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cred_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/banner_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/material_banner_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/product_suggestion_history_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/secure_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/setting_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/material_info_scanner/material_info_scanner.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/repository/mixpanel_repository.dart';
import 'package:ezrxmobile/infrastructure/core/okta/okta_login.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/infrastructure/core/deep_linking/deep_linking_service.dart';
import 'package:ezrxmobile/infrastructure/deep_linking/repository/deep_linking_repository.dart';
import 'package:ezrxmobile/infrastructure/faq/datasource/faq_local.dart';
import 'package:ezrxmobile/infrastructure/faq/datasource/faq_query_mutaion.dart';
import 'package:ezrxmobile/infrastructure/faq/datasource/faq_remote.dart';
import 'package:ezrxmobile/infrastructure/faq/repository/faq_repository.dart';
import 'package:ezrxmobile/infrastructure/notification/datasource/notification_local.dart';
import 'package:ezrxmobile/infrastructure/notification/datasource/notification_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/notification/datasource/notification_remote.dart';
import 'package:ezrxmobile/infrastructure/notification/repository/notification_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/favourite_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/favourite_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/favourite_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/re_order_permission_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/re_order_permission_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/re_order_permission_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/materials_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_querymutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/combo_deal_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/favourite_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_bundle_list_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_filter_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_list_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_price_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_status_tracker_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/payment_customer_information_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/payment_term_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/po_attachment_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/price_override_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/product_details_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/product_search_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/re_order_permission_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/scan_material_info_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/stock_info_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/tender_contract_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_item_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_order_details_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_order_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/account_summary_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/account_summary_query.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/account_summary_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/bank_instruction_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/claim_management_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/claim_management_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/claim_management_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/credit_and_invoice_details_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/credit_and_invoice_details_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/credit_and_invoice_details_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_query.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/e_invoice_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/e_invoice_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_query.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_in_progress_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_in_progress_query.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_in_progress_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/soa_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/soa_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/bank_instruction_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/claim_management_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/e_invoice_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/new_payment_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_query.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_query.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/account_summary_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/all_credits_and_invoices_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/credit_and_invoice_details_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/download_payment_attachment_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/payment_in_progress_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/payment_summary_details_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/payment_summary_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/soa_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/request_information_query.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_list_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_list_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_query.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_query.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_code_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_code_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_code_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_list_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_request_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_summary_details_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/usage_code_repository.dart';
import 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/create_payment_invoice_pdf.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router_observer.dart';
import 'package:ezrxmobile/presentation/splash/upgrader_localization_message.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:local_auth/local_auth.dart';
import 'package:upgrader/upgrader.dart';

GetIt locator = GetIt.instance;
const httpServiceWithoutInterceptor = 'HttpServiceWithoutInterceptor';

void setupLocator() {
  //============================================================
  //  CORE
  //
  //============================================================

  locator.registerLazySingleton(() => Config());
  locator.registerLazySingleton(() => PackageInfoService());
  locator.registerLazySingleton(() => AppRouter());

  locator.registerLazySingleton(
    () => PushNotificationService(
      appRouter: locator<AppRouter>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => OktaLoginServices(config: locator<Config>()),
  );

  locator.registerLazySingleton(() => PerformanceMonitorService());
  locator.registerLazySingleton(() => ProductSuggestionHistoryStorage());
  locator.registerLazySingleton(
    () => FirebaseAnalyticsService(
      analytics: FirebaseAnalytics.instance,
      observer:
          FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ),
  );

  locator.registerLazySingleton(
    () => FirebaseCrashlyticsService(
      crashlytics: FirebaseCrashlytics.instance,
    ),
  );

  locator.registerLazySingleton(
    () => RemoteConfigService(
      config: locator<Config>(),
      firebaseCrashlyticsService: locator<FirebaseCrashlyticsService>(),
    ),
  );

  locator.registerLazySingleton(() => ConnectivityService());

  locator.registerLazySingleton(
    () => RouterObserver(
      firebaseAnalyticsService: locator<FirebaseAnalyticsService>(),
      mixpanelService: locator<MixpanelService>(),
      clevertapService: locator<ClevertapService>(),
    ),
  );
  locator.registerLazySingleton(() => DeviceStorage());
  locator.registerLazySingleton(() => MaterialBannerStorage(hive: Hive));
  locator.registerLazySingleton(() => BannerStorage());
  locator.registerLazySingleton(
    () => DeviceRepository(
      deviceStorage: locator<DeviceStorage>(),
      deviceInfo: locator<DeviceInfo>(),
      permissionService: locator<PermissionService>(),
      mixpanelService: locator<MixpanelService>(),
    ),
  );
  locator.registerLazySingleton(
    () => ConnectivityRepository(
      connectivityService: locator<ConnectivityService>(),
    ),
  );
  locator.registerLazySingleton(() => SecureStorage());
  locator.registerLazySingleton(
    () => TokenStorage(secureStorage: locator<SecureStorage>()),
  );
  locator.registerLazySingleton(
    () => CredStorage(secureStorage: locator<SecureStorage>()),
  );
  locator.registerLazySingleton(() => SettingStorage());
  locator.registerLazySingleton(
    () => MaterialInfoScanner(config: locator<Config>()),
  );

  locator.registerLazySingleton(
    () => AuthInterceptor(
      deviceStorage: locator<DeviceStorage>(),
      tokenStorage: locator<TokenStorage>(),
      packageInfoService: locator<PackageInfoService>(),
      config: locator<Config>(),
      authQueryMutation: locator<AuthQueryMutation>(),
      pushNotificationService: locator<PushNotificationService>(),
    ),
  );
  locator.registerLazySingleton(
    () => PerformanceInterceptor(
      performanceMonitorService: locator<PerformanceMonitorService>(),
    ),
  );

  //Datadog
  locator.registerLazySingleton(
    () => DatadogService(
      packageInfoService: locator<PackageInfoService>(),
      config: locator<Config>(),
      deviceStorage: locator<DeviceStorage>(),
    ),
  );

  locator.registerLazySingleton(
    () => DatadogInterceptor(
      datadogService: locator<DatadogService>(),
    ),
  );

  locator.registerLazySingleton(
    () => HttpService(
      config: locator<Config>(),
      interceptors: [
        locator<AuthInterceptor>(),
        locator<PerformanceInterceptor>(),
        locator<DatadogInterceptor>(),
      ],
    ),
  );

  locator.registerLazySingleton(
    () => HttpService(
      config: locator<Config>(),
      interceptors: <Interceptor>[],
    ),
    instanceName: httpServiceWithoutInterceptor,
  );

  locator.registerLazySingleton(() => DataSourceExceptionHandler());

  locator.registerLazySingleton(() => LocalAuthentication());

  locator.registerLazySingleton(
    () => Upgrader(
      messages: UpgraderLocalizationMessage(),
      debugLogging: locator<Config>().appFlavor != Flavor.prod,
      // We're hardcode countryCode and languageCode here because of
      // 'tagRegExpSource' in upgrader package only check text by English
      countryCode: 'US',
      languageCode: 'en',
    ),
  );

  //============================================================
  //  Auth
  //
  //============================================================
  locator.registerLazySingleton(() => AuthQueryMutation());
  locator.registerLazySingleton(() => AuthLocalDataSource());
  locator.registerLazySingleton(
    () => AuthRemoteDataSource(
      httpService: locator<HttpService>(),
      authQueryMutation: locator<AuthQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => ClevertapService(
      config: locator<Config>(),
      pushNotificationService: locator<PushNotificationService>(),
    ),
  );

  locator.registerLazySingleton(
    () => AuthRepository(
      accountSelectorStorage: locator<AccountSelectorStorage>(),
      config: locator<Config>(),
      remoteDataSource: locator<AuthRemoteDataSource>(),
      localDataSource: locator<AuthLocalDataSource>(),
      tokenStorage: locator<TokenStorage>(),
      credStorage: locator<CredStorage>(),
      settingStorage: locator<SettingStorage>(),
      oktaLoginServices: locator<OktaLoginServices>(),
      pushNotificationService: locator<PushNotificationService>(),
      localAuthentication: locator<LocalAuthentication>(),
      mixpanelService: locator<MixpanelService>(),
      clevertapService: locator<ClevertapService>(),
      productSuggestionHistoryStorage:
          locator<ProductSuggestionHistoryStorage>(),
      materialBannerStorage: locator<MaterialBannerStorage>(),
    ),
  );

  locator.registerLazySingleton(
    () => AuthBloc(
      authRepository: locator<AuthRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => LoginFormBloc(
      authRepository: locator<AuthRepository>(),
      deviceRepository: locator<DeviceRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => ProxyLoginFormBloc(authRepository: locator<AuthRepository>()),
  );

  //============================================================
  //  User
  //
  //============================================================
  locator.registerLazySingleton(
    () => LanguageMutation(),
  );

  locator.registerLazySingleton(
    () => LanguageLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => LanguageRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      languageMutation: locator<LanguageMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );
  locator.registerLazySingleton(() => UserQueryMutation());
  locator.registerLazySingleton(
    () => UserLocalDataSource(tokenStorage: locator<TokenStorage>()),
  );
  locator.registerLazySingleton(
    () => UserRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      userQueryMutation: locator<UserQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      remoteConfigService: locator<RemoteConfigService>(),
    ),
  );

  locator.registerLazySingleton(
    () => UserRepository(
      clevertapService: locator<ClevertapService>(),
      config: locator<Config>(),
      remoteDataSource: locator<UserRemoteDataSource>(),
      localDataSource: locator<UserLocalDataSource>(),
      firebaseAnalyticsService: locator<FirebaseAnalyticsService>(),
      firebaseCrashlyticsService: locator<FirebaseCrashlyticsService>(),
      tokenStorage: locator<TokenStorage>(),
      mixpanelService: locator<MixpanelService>(),
      datadogService: locator<DatadogService>(),
      languageLocalDataSource: locator<LanguageLocalDataSource>(),
      languageRemoteDataSource: locator<LanguageRemoteDataSource>(),
      deviceStorage: locator<DeviceStorage>(),
    ),
  );

  locator.registerLazySingleton(
    () => UserBloc(
      userRepository: locator<UserRepository>(),
      authRepository: locator<AuthRepository>(),
      salesRepRepository: locator<SalesRepRepository>(),
      deviceRepository: locator<DeviceRepository>(),
    ),
  );

  //============================================================
  //  Banner
  //
  //============================================================
  locator.registerLazySingleton(() => BannerQueryMutation());

  locator.registerLazySingleton(() => BannerLocalDataSource());

  locator.registerLazySingleton(
    () => BannerRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      bannerQueryMutation: locator<BannerQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => BannerRepository(
      config: locator<Config>(),
      localDataSource: locator<BannerLocalDataSource>(),
      remoteDataSource: locator<BannerRemoteDataSource>(),
    ),
  );

  locator.registerFactory(
    () => BannerBloc(
      bannerRepository: locator<BannerRepository>(),
    ),
  );

  //============================================================
  //  Additional bonus
  //
  //============================================================
  locator.registerFactory(
    () => BonusMaterialBloc(
      materialListRepository: locator<MaterialListRepository>(),
      cartRepository: locator<CartRepository>(),
      config: locator<Config>(),
      stockInfoRepository: locator<StockInfoRepository>(),
    ),
  );
  //============================================================
  //  Price Override
  //
  //============================================================
  locator.registerLazySingleton(
    () => PriceOverrideLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => PriceOverrideRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      priceOverrideQueryMutation: locator<PriceOverrideQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => PriceOverrideQueryMutation(),
  );

  locator.registerLazySingleton(
    () => PriceOverrideRepository(
      remoteDataSource: locator<PriceOverrideRemoteDataSource>(),
      config: locator<Config>(),
      localDataSource: locator<PriceOverrideLocalDataSource>(),
      mixpanelService: locator<MixpanelService>(),
    ),
  );
  locator.registerFactory(
    () => PriceOverrideBloc(
      priceOverrideRepository: locator<PriceOverrideRepository>(),
    ),
  );
  //============================================================
  //  Sales Org
  //
  //============================================================

  locator.registerLazySingleton(() => SalesOrgQueryMutation());

  locator.registerLazySingleton(() => SalesOrgLocalDataSource());

  locator.registerLazySingleton(() => AccountSelectorStorage(hive: Hive));

  locator.registerLazySingleton(
    () => SalesOrgRemoteDataSource(
      httpService: locator<HttpService>(),
      salesOrgQueryMutation: locator<SalesOrgQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      remoteConfigService: locator<RemoteConfigService>(),
    ),
  );

  locator.registerLazySingleton(
    () => SalesOrgRepository(
      accountSelectorStorage: locator<AccountSelectorStorage>(),
      config: locator<Config>(),
      localDataSource: locator<SalesOrgLocalDataSource>(),
      remoteDataSource: locator<SalesOrgRemoteDataSource>(),
      deviceStorage: locator<DeviceStorage>(),
    ),
  );

  locator.registerLazySingleton(
    () => SalesOrgBloc(
      salesOrgRepository: locator<SalesOrgRepository>(),
    ),
  );

  //============================================================
  //  Customer Code
  //
  //============================================================
  locator.registerLazySingleton(() => CustomerCodeQueryMutation());

  locator.registerLazySingleton(() => CustomerCodeLocalDataSource());

  locator.registerLazySingleton(
    () => CustomerCodeRemoteDataSource(
      httpService: locator<HttpService>(),
      customerCodeQueryMutation: locator<CustomerCodeQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      config: locator<Config>(),
      remoteConfigService: locator<RemoteConfigService>(),
    ),
  );

  locator.registerLazySingleton(
    () => CustomerCodeRepository(
      config: locator<Config>(),
      remoteDataSource: locator<CustomerCodeRemoteDataSource>(),
      localCustomerCodeDataSource: locator<CustomerCodeLocalDataSource>(),
      accountSelectorStorage: locator<AccountSelectorStorage>(),
      deviceStorage: locator<DeviceStorage>(),
    ),
  );

  locator.registerFactory(
    () => CustomerCodeBloc(
      customerCodeRepository: locator<CustomerCodeRepository>(),
      config: locator<Config>(),
    ),
  );

  //============================================================
  //  Eligibility
  //
  //============================================================

  locator.registerLazySingleton(
    () => EligibilityBloc(
      chatBotRepository: locator<ChatBotRepository>(),
      mixpanelRepository: locator<MixpanelRepository>(),
      customerCodeRepository: locator<CustomerCodeRepository>(),
      config: locator<Config>(),
      stockRepository: locator<StockInfoRepository>(),
      connectivityRepository: locator<ConnectivityRepository>(),
    ),
  );

  //============================================================
  //  Announcement
  //
  //============================================================

  locator.registerLazySingleton(() => AnnouncementQueryMutation());

  locator.registerLazySingleton(
    () => AnnouncementRemoteDataSource(
      httpService: locator<HttpService>(),
      queryMutation: locator<AnnouncementQueryMutation>(),
      exceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(() => AnnouncementLocalDataSource());

  locator.registerLazySingleton(
    () => AnnouncementRepository(
      config: locator<Config>(),
      dateTimeStorage: locator<BannerStorage>(),
      remoteDataSource: locator<AnnouncementRemoteDataSource>(),
      localDataSource: locator<AnnouncementLocalDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => AnnouncementBloc(
      announcementRepository: locator<AnnouncementRepository>(),
    )..add(const AnnouncementEvent.getClosedTime()),
  );

  //============================================================
  //  Order
  //
  //============================================================

  locator.registerLazySingleton(() => OrderQueryMutation());

  locator.registerLazySingleton(() => OrderLocalDataSource());

  locator.registerLazySingleton(
    () => OrderRemoteDataSource(
      httpService: locator<HttpService>(),
      queryMutation: locator<OrderQueryMutation>(),
      exceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(() => Encryption());

  locator.registerLazySingleton(
    () => OrderRepository(
      config: locator<Config>(),
      localDataSource: locator<OrderLocalDataSource>(),
      remoteDataSource: locator<OrderRemoteDataSource>(),
      encryption: locator<Encryption>(),
      orderDetailLocalDataSource: locator<ViewByOrderDetailsLocalDataSource>(),
      orderHistoryDetailsRemoteDataSource:
          locator<ViewByOrderDetailsRemoteDataSource>(),
      stockInfoRemoteDataSource: locator<StockInfoRemoteDataSource>(),
      stockInfoLocalDataSource: locator<StockInfoLocalDataSource>(),
      deviceStorage: locator<DeviceStorage>(),
      remoteConfigService: locator<RemoteConfigService>(),
      materialBannerStorage: locator<MaterialBannerStorage>(),
      mixpanelService: locator<MixpanelService>(),
      clevertapService: locator<ClevertapService>(),
      upgrader: locator<Upgrader>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderSummaryBloc(
      repository: locator<OrderRepository>(),
      stockInfoRepository: locator<StockInfoRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => AdditionalDetailsBloc(),
  );

  locator.registerLazySingleton(
    () => OrderEligibilityBloc(),
  );

  //============================================================
  //  Sales Rep
  //
  //============================================================

  locator.registerLazySingleton(() => SalesRepQueryMutation());

  locator.registerLazySingleton(() => SalesRepLocalDataSource());

  locator.registerLazySingleton(
    () => SalesRepRemoteDataSource(
      httpService: locator<HttpService>(),
      salesRepQueryMutation: locator<SalesRepQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => SalesRepRepository(
      config: locator<Config>(),
      remoteDataSource: locator<SalesRepRemoteDataSource>(),
      localDataSource: locator<SalesRepLocalDataSource>(),
    ),
  );

  //============================================================
  //  Material List
  //
  //============================================================

  locator.registerLazySingleton(() => ProductsQuery());

  locator.registerLazySingleton(() => MaterialListLocalDataSource());

  locator.registerLazySingleton(
    () => MaterialListRemoteDataSource(
      httpService: locator<HttpService>(),
      materialListQuery: locator<ProductsQuery>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      remoteConfigService: locator<RemoteConfigService>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialListRepository(
      config: locator<Config>(),
      materialListLocalDataSource: locator<MaterialListLocalDataSource>(),
      materialListRemoteDataSource: locator<MaterialListRemoteDataSource>(),
      stockInfoLocalDataSource: locator<StockInfoLocalDataSource>(),
      stockInfoRemoteDataSource: locator<StockInfoRemoteDataSource>(),
      deviceStorage: locator<DeviceStorage>(),
    ),
  );

  locator.registerFactory(
    () => MaterialListBloc(
      materialListRepository: locator<MaterialListRepository>(),
      favouriteRepository: locator<FavouriteRepository>(),
      config: locator<Config>(),
      stockInfoRepository: locator<StockInfoRepository>(),
    ),
  );

  locator.registerLazySingleton(() => MaterialBundleQuery());

  locator.registerLazySingleton(() => MaterialBundleListLocalDatasource());

  locator.registerLazySingleton(
    () => MaterialBundleListRemoteDataSource(
      httpService: locator<HttpService>(),
      materialBundleQuery: locator<MaterialBundleQuery>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialBundleListRepository(
      config: locator<Config>(),
      materialBundleListLocalDatasource:
          locator<MaterialBundleListLocalDatasource>(),
      materialBundleListRemoteDatasource:
          locator<MaterialBundleListRemoteDataSource>(),
    ),
  );

  //============================================================
  //   Material Details
  //
  //============================================================

  locator.registerLazySingleton(() => ProductDetailLocalDataSource());

  locator.registerLazySingleton(() => ProductDetailQuery());

  locator.registerLazySingleton(
    () => ProductDetailRemoteDataSource(
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      httpService: locator<HttpService>(),
      productDetailQuery: locator<ProductDetailQuery>(),
      remoteConfigService: locator<RemoteConfigService>(),
    ),
  );

  locator.registerLazySingleton(
    () => ProductDetailRepository(
      config: locator<Config>(),
      productDetailLocalDataSource: locator<ProductDetailLocalDataSource>(),
      productDetailRemoteDataSource: locator<ProductDetailRemoteDataSource>(),
      stockInfoLocalDataSource: locator<StockInfoLocalDataSource>(),
      stockInfoRemoteDataSource: locator<StockInfoRemoteDataSource>(),
      materialListLocalDataSource: locator<MaterialListLocalDataSource>(),
      materialListRemoteDataSource: locator<MaterialListRemoteDataSource>(),
      deviceStorage: locator<DeviceStorage>(),
    ),
  );

  locator.registerFactory(
    () => ProductDetailBloc(
      productDetailRepository: locator<ProductDetailRepository>(),
      favouriteRepository: locator<FavouriteRepository>(),
      stockInfoRepository: locator<StockInfoRepository>(),
    ),
  );

  //============================================================
  //  Bundle Add To Cart
  //
  //============================================================

  locator.registerLazySingleton(
    () => BundleAddToCartBloc(),
  );

  //============================================================
  //  Reset Password
  //
  //============================================================
  locator.registerLazySingleton(() => ChangePasswordLocalDataSource());

  locator.registerLazySingleton(
    () => ChangePasswordRemoteDataSource(
      httpService: locator<HttpService>(),
      authQueryMutation: locator<AuthQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => ChangePasswordRepository(
      config: locator<Config>(),
      localDataSource: locator<ChangePasswordLocalDataSource>(),
      remoteDataSource: locator<ChangePasswordRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => ResetPasswordBloc(
      changePasswordRepository: locator<ChangePasswordRepository>(),
    ),
  );

  //============================================================
  //  forgot Password
  //
  //============================================================
  locator.registerLazySingleton(() => ForgotPasswordLocalDataSource());
  locator.registerLazySingleton(
    () => ForgotPasswordRemoteDataSource(
      httpService: locator<HttpService>(),
      authQueryMutation: locator<AuthQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      config: locator<Config>(),
    ),
  );
  locator.registerLazySingleton(
    () => ForgotPasswordRepository(
      config: locator<Config>(),
      localDataSource: locator<ForgotPasswordLocalDataSource>(),
      remoteDataSource: locator<ForgotPasswordRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => ForgotPasswordBloc(
      forgotPasswordRepository: locator<ForgotPasswordRepository>(),
    ),
  );

  //============================================================
  //  Order History
  //
  //============================================================

  locator.registerLazySingleton(() => ViewByItemLocalDataSource());
  locator.registerLazySingleton(() => ViewByItemQueryMutation());
  locator.registerLazySingleton(
    () => ViewByItemRemoteDataSource(
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      httpService: locator<HttpService>(),
      viewByItemQueryMutation: locator<ViewByItemQueryMutation>(),
      remoteConfigService: locator<RemoteConfigService>(),
    ),
  );

  locator.registerLazySingleton(
    () => ViewByItemRepository(
      config: locator<Config>(),
      viewByItemLocalDataSource: locator<ViewByItemLocalDataSource>(),
      viewByItemRemoteDataSource: locator<ViewByItemRemoteDataSource>(),
      deviceStorage: locator<DeviceStorage>(),
    ),
  );
  locator.registerFactory(
    () => ViewByItemsBloc(
      viewByItemRepository: locator<ViewByItemRepository>(),
      config: locator<Config>(),
    ),
  );
  //============================================================
  //  Order History Filter
  //
  //============================================================

  locator.registerLazySingleton(
    () => ViewByItemFilterBloc(),
  );

  //============================================================
  // View by Order  Details
  //
  //============================================================

  locator.registerLazySingleton(() => ViewByOrderDetailsLocalDataSource());

  locator.registerLazySingleton(() => ViewByOrderDetailsQueryMutation());

  locator.registerLazySingleton(
    () => ViewByOrderDetailsRepository(
      config: locator<Config>(),
      localDataSource: locator<ViewByOrderDetailsLocalDataSource>(),
      orderHistoryDetailsRemoteDataSource:
          locator<ViewByOrderDetailsRemoteDataSource>(),
      deviceStorage: locator<DeviceStorage>(),
    ),
  );

  locator.registerLazySingleton(
    () => ViewByOrderDetailsBloc(
      viewByOrderDetailsRepository: locator<ViewByOrderDetailsRepository>(),
      productDetailRepository: locator<ProductDetailRepository>(),
      viewByItemRepository: locator<ViewByItemRepository>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => ViewByOrderDetailsRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      viewByOrderDetailsQueryMutation:
          locator<ViewByOrderDetailsQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      remoteConfigService: locator<RemoteConfigService>(),
    ),
  );

  //============================================================
  //  Payment Customer Information
  //
  //============================================================

  locator.registerLazySingleton(
    () => PaymentCustomerInformationLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => BankInstructionLocalDataSource(),
  );

  locator
      .registerLazySingleton(() => PaymentCustomerInformationQueryMutation());

  locator.registerLazySingleton(
    () => PaymentCustomerInformationRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      paymentCustomerInformationQueryMutation:
          locator<PaymentCustomerInformationQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentCustomerInformationRepository(
      config: locator<Config>(),
      remoteDataSource: locator<PaymentCustomerInformationRemoteDataSource>(),
      localDataSource: locator<PaymentCustomerInformationLocalDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => PaymentCustomerInformationBloc(
      paymentCustomerInformationRepository:
          locator<PaymentCustomerInformationRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => BankInstructionRepository(
      localDataSource: locator<BankInstructionLocalDataSource>(),
    ),
  );

  //============================================================
  //  T&C
  //
  //============================================================

  locator.registerLazySingleton(
    () => AcceptanceDateLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => AcceptanceDateRemoteDataSource(
      httpService: locator<HttpService>(),
      exceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => AupTcRepository(
      config: locator<Config>(),
      localDataSource: locator<AcceptanceDateLocalDataSource>(),
      remoteDataSource: locator<AcceptanceDateRemoteDataSource>(),
    ),
  );

  locator.registerFactory(
    () => AupTcBloc(
      aupTcRepository: locator<AupTcRepository>(),
      config: locator<Config>(),
    ),
  );

  //============================================================
  //  Payment Terms
  //
  //============================================================

  locator.registerLazySingleton(() => PaymentTermsQueryMutation());

  locator.registerLazySingleton(() => PaymentTermLocalDataSource());

  locator.registerLazySingleton(
    () => PaymentTermsRemoteDataSource(
      httpService: locator<HttpService>(),
      config: locator<Config>(),
      payemttTermsQueryMutation: locator<PaymentTermsQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentTermsRepository(
      config: locator<Config>(),
      localDataSource: locator<PaymentTermLocalDataSource>(),
      remoteDataSource: locator<PaymentTermsRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentTermBloc(
      paymentTermRepository: locator<PaymentTermsRepository>(),
    ),
  );

  //============================================================
  //  Material Price
  //
  //============================================================

  locator.registerLazySingleton(() => MaterialPriceQueryMutation());

  locator.registerLazySingleton(() => MaterialPriceLocalDataSource());

  locator.registerLazySingleton(
    () => MaterialPriceRemoteDataSource(
      httpService: locator<HttpService>(),
      queryMutation: locator<MaterialPriceQueryMutation>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialPriceRepository(
      config: locator<Config>(),
      localDataSource: locator<MaterialPriceLocalDataSource>(),
      remoteDataSource: locator<MaterialPriceRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialPriceBloc(
      repository: locator<MaterialPriceRepository>(),
    ),
  );

  //============================================================
  //  Material Filter
  //
  //============================================================

  locator.registerLazySingleton(() => MaterialFilterQueryMutation());
  locator.registerLazySingleton(() => MaterialFilterLocalDataSource());

  locator.registerLazySingleton(
    () => MaterialFilterRemoteDataSource(
      httpService: locator<HttpService>(),
      config: locator<Config>(),
      materialFilterQueryMutation: locator<MaterialFilterQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialFilterRepository(
      config: locator<Config>(),
      filterMaterialRemoteDataSource: locator<MaterialFilterRemoteDataSource>(),
      filterMaterialLocalDataSource: locator<MaterialFilterLocalDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialFilterBloc(
      materialFilterRepository: locator<MaterialFilterRepository>(),
    ),
  );

  //============================================================
  //  Order History Details Po Document Type
  //
  //============================================================

  locator.registerLazySingleton(
    () => FilePickerService(),
  );
  locator.registerLazySingleton(
    () => PermissionService(),
  );

  locator.registerLazySingleton(
    () => DeviceInfo(),
  );

  locator.registerLazySingleton(
    () => FileSystemHelper(),
  );

  locator.registerLazySingleton(
    () => TakePictureService(),
  );

  locator.registerLazySingleton(
    () => PoDocumentLocalDataSource(),
  );
  locator.registerLazySingleton(() => PoDocumentQuery());
  locator.registerLazySingleton(
    () => PoDocumentRemoteDataSource(
      httpService: locator<HttpService>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      config: locator<Config>(),
      queryMutation: locator<PoDocumentQuery>(),
    ),
  );

  locator.registerLazySingleton(
    () => PoAttachmentRepository(
      config: locator<Config>(),
      remoteDataSource: locator<PoDocumentRemoteDataSource>(),
      localDataSource: locator<PoDocumentLocalDataSource>(),
      permissionService: locator<PermissionService>(),
      deviceInfo: locator<DeviceInfo>(),
      filePickerService: locator<FilePickerService>(),
      fileSystemHelper: locator<FileSystemHelper>(),
      takePictureService: locator<TakePictureService>(),
    ),
  );

  locator.registerFactory(
    () => PoAttachmentBloc(
      poAttachmentRepository: locator<PoAttachmentRepository>(),
    ),
  );

  //============================================================
  //  Tender Contract
  //
  //============================================================

  locator.registerLazySingleton(() => TenderContractQuery());

  locator.registerLazySingleton(() => TenderContractLocalDataSource());

  locator.registerLazySingleton(
    () => TenderContractRemoteDataSource(
      httpService: locator<HttpService>(),
      tenderContractQuery: locator<TenderContractQuery>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => TenderContractRepository(
      config: locator<Config>(),
      tenderContractLocalDataSource: locator<TenderContractLocalDataSource>(),
      tenderContractRemoteDataSource: locator<TenderContractRemoteDataSource>(),
    ),
  );

  locator.registerFactory(
    () => TenderContractBloc(
      tenderContractRepository: locator<TenderContractRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => TenderContractListBloc(
      tenderContractRepository: locator<TenderContractRepository>(),
    ),
  );

  locator.registerFactory(
    () => TenderContractDetailBloc(
      tenderContractRepository: locator<TenderContractRepository>(),
    ),
  );

  //============================================================
  //  Payments Download Documents
  //
  //============================================================

  locator.registerLazySingleton(() => DownloadPaymentAttachmentQuery());

  locator
      .registerLazySingleton(() => DownloadPaymentAttachmentLocalDataSource());

  locator.registerLazySingleton(
    () => DownloadPaymentAttachmentRemoteDataSource(
      httpService: locator<HttpService>(),
      downloadPaymentAttachmentQuery: locator<DownloadPaymentAttachmentQuery>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => DownloadPaymentAttachmentRepository(
      config: locator<Config>(),
      localDataSource: locator<DownloadPaymentAttachmentLocalDataSource>(),
      remoteDataSource: locator<DownloadPaymentAttachmentRemoteDataSource>(),
      permissionService: locator<PermissionService>(),
      deviceInfo: locator<DeviceInfo>(),
      fileSystemHelper: locator<FileSystemHelper>(),
    ),
  );

  locator.registerFactory(
    () => DownloadPaymentAttachmentsBloc(
      paymentAttachmentRepository:
          locator<DownloadPaymentAttachmentRepository>(),
    ),
  );

  //============================================================
  //  Download e-credit
  //
  //============================================================

  locator.registerLazySingleton(
    () => DownloadECreditBloc(
      repository: locator<DownloadPaymentAttachmentRepository>(),
    ),
  );

  // Using registerFactory here because we need multiple instances of DiscountOverrideBloc
  locator.registerFactory(
    () => DiscountOverrideBloc(
      repository: locator<MaterialPriceRepository>(),
    ),
  );

  //============================================================
  //  Return List
  //
  //============================================================

  locator.registerLazySingleton(() => ReturnListLocalDataSource());

  locator.registerLazySingleton(() => ReturnQuery());

  locator.registerLazySingleton(
    () => ReturnListRemoteDataSource(
      httpService: locator<HttpService>(),
      queryMutation: locator<ReturnQuery>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      remoteConfigService: locator<RemoteConfigService>(),
    ),
  );

  locator.registerLazySingleton(
    () => ReturnListRepository(
      config: locator<Config>(),
      localDataSource: locator<ReturnListLocalDataSource>(),
      remoteDataSource: locator<ReturnListRemoteDataSource>(),
      deviceInfo: locator<DeviceInfo>(),
      fileSystemHelper: locator<FileSystemHelper>(),
      permissionService: locator<PermissionService>(),
      deviceStorage: locator<DeviceStorage>(),
    ),
  );

  locator.registerLazySingleton(
    () => ReturnListByItemBloc(
      returnListRepository: locator<ReturnListRepository>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => ReturnListByRequestBloc(
      returnListRepository: locator<ReturnListRepository>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => ViewByItemReturnFilterBloc(),
  );

  locator.registerLazySingleton(
    () => ViewByRequestReturnFilterBloc(),
  );

  //============================================================
  //  Cart
  //
  //============================================================

  locator.registerLazySingleton(() => StockInfoLocalDataSource());
  locator.registerLazySingleton(() => StockInfoQueryMutation());
  locator.registerLazySingleton(() => CartLocalDataSource());
  locator.registerLazySingleton(() => CartQueryMutation());

  locator.registerLazySingleton(
    () => StockInfoRemoteDataSource(
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      httpService: locator<HttpService>(),
      stockInfoQueryMutation: locator<StockInfoQueryMutation>(),
    ),
  );

  locator.registerLazySingleton(
    () => CartRemoteDataSource(
      cartQueryMutation: locator<CartQueryMutation>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      httpService: locator<HttpService>(),
      remoteConfigService: locator<RemoteConfigService>(),
    ),
  );

  locator.registerLazySingleton(
    () => CartRepository(
      mixpanelService: locator<MixpanelService>(),
      config: locator<Config>(),
      stockInfoLocalDataSource: locator<StockInfoLocalDataSource>(),
      stockInfoRemoteDataSource: locator<StockInfoRemoteDataSource>(),
      cartLocalDataSource: locator<CartLocalDataSource>(),
      cartRemoteDataSource: locator<CartRemoteDataSource>(),
      deviceStorage: locator<DeviceStorage>(),
      materialBannerStorage: locator<MaterialBannerStorage>(),
    ),
  );

  locator.registerLazySingleton(
    () => CartBloc(
      locator<CartRepository>(),
      locator<ProductDetailRepository>(),
      locator<StockInfoRepository>(),
    ),
  );

  //============================================================
  //  Usage
  //
  //============================================================

  locator.registerLazySingleton(
    () => UsageCodeBloc(usageRepository: locator<UsageRepository>()),
  );
  locator.registerLazySingleton(
    () => UsageCodeLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => UsageCodeQueryMutation(),
  );
  locator.registerLazySingleton(
    () => UsageCodeRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      usageCodeQueryMutation: locator<UsageCodeQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );
  locator.registerLazySingleton(
    () => UsageRepository(
      config: locator<Config>(),
      usageLocalDataSource: locator<UsageCodeLocalDataSource>(),
      usageRemoteDataSource: locator<UsageCodeRemoteDataSource>(),
    ),
  );

  //============================================================
  //  Return Request Information
  //
  //============================================================
  locator.registerLazySingleton(() => RequestInformationQuery());

  locator.registerLazySingleton(
    () => ReturnSummaryDetailsRequestInformationLocal(),
  );
  locator.registerLazySingleton(
    () => ReturnSummaryDetailsRequestInformationRemote(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      requestInformationQuery: locator<RequestInformationQuery>(),
      remoteConfigService: locator<RemoteConfigService>(),
    ),
  );

  //============================================================
  //  Return Summary Filter
  //
  //============================================================

  locator.registerLazySingleton(
    () => ReturnSummaryFilterBloc(),
  );

  //Mixpanel

  locator.registerLazySingleton(
    () => MixpanelService(
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => MixpanelRepository(
      mixpanelService: locator<MixpanelService>(),
    ),
  );

  //============================================================
  //  Payment Summary
  //
  //============================================================

  locator.registerLazySingleton(
    () => ZPPaymentSummaryBloc(
      paymentSummaryRepository: locator<PaymentSummaryRepository>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => MPPaymentSummaryBloc(
      paymentSummaryRepository: locator<PaymentSummaryRepository>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentSummaryFilterBloc(
      paymentSummaryRepository: locator<PaymentSummaryRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentSummaryLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => PaymentSummaryQuery(),
  );

  locator.registerLazySingleton(
    () => PaymentSummaryRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      paymentSummaryQuery: locator<PaymentSummaryQuery>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentSummaryRepository(
      config: locator<Config>(),
      localDataSource: locator<PaymentSummaryLocalDataSource>(),
      remoteDataSource: locator<PaymentSummaryRemoteDataSource>(),
    ),
  );

  //============================================================
  //  Payment Soa
  //
  //============================================================

  locator.registerLazySingleton(
    () => SoaLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => SoaRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => SoaRepository(
      config: locator<Config>(),
      localDataSource: locator<SoaLocalDataSource>(),
      remoteDataSource: locator<SoaRemoteDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => ZPSoaBloc(
      repository: locator<SoaRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => MPSoaBloc(
      repository: locator<SoaRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => SoaFilterBloc(),
  );

  //============================================================
  //  Payment e invoice
  //
  //============================================================

  locator.registerLazySingleton(
    () => EInvoiceLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => EInvoiceRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      exceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => EInvoiceRepository(
      config: locator<Config>(),
      localDataSource: locator<EInvoiceLocalDataSource>(),
      remoteDataSource: locator<EInvoiceRemoteDataSource>(),
    ),
  );
  locator.registerFactory(
    () => DownloadEInvoiceBloc(
      eInvoiceRepository: locator<EInvoiceRepository>(),
      downloadPaymentAttachmentRepository:
          locator<DownloadPaymentAttachmentRepository>(),
    ),
  );

  //============================================================
  //  Payment In Progress
  //
  //============================================================

  locator.registerLazySingleton(
    () => PaymentInProgressQuery(),
  );
  locator.registerLazySingleton(
    () => PaymentInProgressLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => PaymentInProgressRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      paymentInProgressQuery: locator<PaymentInProgressQuery>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentInProgressRepository(
      config: locator<Config>(),
      localDataSource: locator<PaymentInProgressLocalDataSource>(),
      remoteDataSource: locator<PaymentInProgressRemoteDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => ZPPaymentInProgressBloc(
      repository: locator<PaymentInProgressRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => MPPaymentInProgressBloc(
      repository: locator<PaymentInProgressRepository>(),
    ),
  );

  //============================================================
  //  Payment Item
  //
  //============================================================
  locator.registerLazySingleton(
    () => CreatePaymentInvoicePdf(),
  );

  locator.registerLazySingleton(
    () => PaymentSummaryDetailsBloc(
      paymentItemRepository: locator<PaymentSummaryDetailsRepository>(),
      newPaymentRepository: locator<NewPaymentRepository>(),
      deviceRepository: locator<DeviceRepository>(),
      bankInstructionRepository: locator<BankInstructionRepository>(),
      createPaymentInvoicePdf: locator<CreatePaymentInvoicePdf>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentItemLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => PaymentItemQuery(),
  );

  locator.registerLazySingleton(
    () => PaymentItemRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      paymentItemQuery: locator<PaymentItemQuery>(),
      paymentSummaryQuery: locator<PaymentSummaryQuery>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentSummaryDetailsRepository(
      config: locator<Config>(),
      localDataSource: locator<PaymentItemLocalDataSource>(),
      remoteDataSource: locator<PaymentItemRemoteDataSource>(),
    ),
  );
  //============================================================
  //  Combo Deals
  //
  //============================================================
  locator.registerLazySingleton(
    () => ComboDealQueryMutation(),
  );

  locator.registerLazySingleton(
    () => ComboDealLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => ComboDealRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      queryMutation: locator<ComboDealQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton<IComboDealRepository>(
    () => ComboDealRepository(
      config: locator<Config>(),
      localDataSource: locator<ComboDealLocalDataSource>(),
      remoteDataSource: locator<ComboDealRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => ComboDealListBloc(
      repository: locator<IComboDealRepository>(),
    ),
  );

  locator.registerFactory(
    () => ComboDealMaterialDetailBloc(
      productDetailRepository: locator<ProductDetailRepository>(),
      materialListRepository: locator<MaterialListRepository>(),
      config: locator<Config>(),
      stockInfoRepository: locator<StockInfoRepository>(),
    ),
  );

  //============================================================
  //  Scan Material Information
  //
  //============================================================
  locator.registerLazySingleton(
    () => ScanMaterialInfoRepository(
      mixpanelService: locator<MixpanelService>(),
      materialInfoScanner: locator<MaterialInfoScanner>(),
      filePickerService: locator<FilePickerService>(),
      permissionService: locator<PermissionService>(),
      deviceInfo: locator<DeviceInfo>(),
    ),
  );
  locator.registerLazySingleton(
    () => ScanMaterialInfoBloc(
      scanInfoRepository: locator<ScanMaterialInfoRepository>(),
      productSearchRepository: locator<ProductSearchRepository>(),
    ),
  );

  //============================================================
  //  Return Summary Details
  //
  //============================================================

  locator.registerLazySingleton(
    () => ReturnSummaryDetailsRepository(
      config: locator<Config>(),
      returnRequestInformationLocalDataSource:
          locator<ReturnSummaryDetailsRequestInformationLocal>(),
      returnRequestInformationRemoteDataSource:
          locator<ReturnSummaryDetailsRequestInformationRemote>(),
      deviceStorage: locator<DeviceStorage>(),
    ),
  );

  locator.registerLazySingleton(
    () => ReturnSummaryDetailsBloc(
      returnSummaryDetailsRepository: locator<ReturnSummaryDetailsRepository>(),
      returnRequestRepository: locator<ReturnRequestRepository>(),
      poAttachmentRepository: locator<PoAttachmentRepository>(),
    ),
  );

  //============================================================
  //  Return Details By Request
  //
  //============================================================

  locator.registerLazySingleton(
    () => ReturnDetailsByRequestBloc(
      returnRequestInformationRepository:
          locator<ReturnSummaryDetailsRepository>(),
      returnRequestRepository: locator<ReturnRequestRepository>(),
      poAttachmentRepository: locator<PoAttachmentRepository>(),
    ),
  );

  //============================================================
  // Deep Linking
  //
  //============================================================
  locator.registerLazySingleton(() => DeepLinkingService());

  locator.registerLazySingleton(
    () => DeepLinkingRepository(
      config: locator<Config>(),
      deviceStorage: locator<DeviceStorage>(),
      service: locator<DeepLinkingService>(),
    ),
  );

  locator.registerLazySingleton(
    () => DeepLinkingBloc(
      repository: locator<DeepLinkingRepository>(),
      chatBotService: locator<ChatBotService>(),
    ),
  );

  //============================================================

  //  Manage Bank Beneficiary
  //
  //============================================================

  locator.registerLazySingleton(() => BankBeneficiaryLocalDataSource());

  locator.registerLazySingleton(() => BankBeneficiaryQueryMutation());

  locator.registerLazySingleton(
    () => BankBeneficiaryRemoteDataSource(
      httpService: locator<HttpService>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      bankBeneficiaryQueryMutation: locator<BankBeneficiaryQueryMutation>(),
    ),
  );

  locator.registerLazySingleton(
    () => BankBeneficiaryRepository(
      config: locator<Config>(),
      localDataSource: locator<BankBeneficiaryLocalDataSource>(),
      remoteDataSource: locator<BankBeneficiaryRemoteDataSource>(),
    ),
  );

  //============================================================
  //  All Invoices and Credits
  //
  //============================================================
  locator.registerLazySingleton(
    () => AllInvoicesFilterBloc(),
  );
  locator.registerLazySingleton(
    () => FullSummaryFilterBloc(),
  );
  locator.registerFactory(
    () => ZPAllInvoicesBloc(
      allCreditsAndInvoicesRepository:
          locator<AllCreditsAndInvoicesRepository>(),
      config: locator<Config>(),
    ),
  );
  locator.registerFactory(
    () => MPAllInvoicesBloc(
      allCreditsAndInvoicesRepository:
          locator<AllCreditsAndInvoicesRepository>(),
      config: locator<Config>(),
    ),
  );
  locator.registerLazySingleton(
    () => AllCreditsAndInvoicesLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => AllCreditsAndInvoicesQueryMutation(),
  );
  locator.registerLazySingleton(
    () => AllCreditsAndInvoicesRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      allCreditsAndInvoicesQueryMutation:
          locator<AllCreditsAndInvoicesQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );
  locator.registerLazySingleton(
    () => AllCreditsAndInvoicesRepository(
      config: locator<Config>(),
      localDataSource: locator<AllCreditsAndInvoicesLocalDataSource>(),
      remoteDataSource: locator<AllCreditsAndInvoicesRemoteDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => ZPAllCreditsBloc(
      allCreditsAndInvoicesRepository:
          locator<AllCreditsAndInvoicesRepository>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => MPAllCreditsBloc(
      allCreditsAndInvoicesRepository:
          locator<AllCreditsAndInvoicesRepository>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => ZPFullSummaryBloc(
      allCreditsAndInvoicesRepository:
          locator<AllCreditsAndInvoicesRepository>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => MPFullSummaryBloc(
      allCreditsAndInvoicesRepository:
          locator<AllCreditsAndInvoicesRepository>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => AllCreditsFilterBloc(),
  );
  locator.registerLazySingleton(
    () => CreditAndInvoiceDetailsRepository(
      config: locator<Config>(),
      localDataSource: locator<CreditAndInvoiceDetailsLocalDataSource>(),
      remoteDataSource: locator<CreditAndInvoiceDetailsRemoteDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => CreditAndInvoiceDetailsBloc(
      creditAndInvoiceDetailsRepository:
          locator<CreditAndInvoiceDetailsRepository>(),
      allCreditsAndInvoicesRepository:
          locator<AllCreditsAndInvoicesRepository>(),
    ),
  );
  locator.registerLazySingleton(
    () => CreditAndInvoiceDetailsLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => CreditAndInvoiceDetailsQueryMutation(),
  );
  locator.registerLazySingleton(
    () => CreditAndInvoiceDetailsRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      creditAndInvoiceDetailsQueryMutation:
          locator<CreditAndInvoiceDetailsQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  //============================================================
  //  Payments: New Payment
  //
  //============================================================

  locator.registerLazySingleton(
    () => NewPaymentQuery(),
  );
  locator.registerLazySingleton(
    () => NewPaymentLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => NewPaymentRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      newPaymentQuery: locator<NewPaymentQuery>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );
  locator.registerLazySingleton(
    () => NewPaymentRepository(
      config: locator<Config>(),
      localDataSource: locator<NewPaymentLocalDataSource>(),
      remoteDataSource: locator<NewPaymentRemoteDataSource>(),
      fileSystemHelper: locator<FileSystemHelper>(),
      deviceInfo: locator<DeviceInfo>(),
      deviceStorage: locator<DeviceStorage>(),
    ),
  );
  locator.registerLazySingleton(
    () => OutstandingInvoicesBloc(
      newPaymentRepository: locator<NewPaymentRepository>(),
      allCreditsAndInvoicesRepository:
          locator<AllCreditsAndInvoicesRepository>(),
      config: locator<Config>(),
    ),
  );
  locator.registerLazySingleton(
    () => OutstandingInvoiceFilterBloc(),
  );
  locator.registerLazySingleton(
    () => AvailableCreditsBloc(
      newPaymentRepository: locator<NewPaymentRepository>(),
      config: locator<Config>(),
    ),
  );
  locator.registerLazySingleton(
    () => AvailableCreditFilterBloc(),
  );
  locator.registerLazySingleton(
    () => NewPaymentBloc(
      newPaymentRepository: locator<NewPaymentRepository>(),
      deviceRepository: locator<DeviceRepository>(),
    ),
  );
  locator.registerLazySingleton(
    () => BankInAccountsBloc(
      bankBeneficiaryRepository: locator<BankBeneficiaryRepository>(),
    ),
  );

  //============================================================
  //  Update Sales Org Config
  //
  //============================================================

  //============================================================
  //  Product Search
  //
  //============================================================

  locator.registerLazySingleton(
    () => ProductSearchRepository(
      config: locator<Config>(),
      materialListLocalDataSource: locator<MaterialListLocalDataSource>(),
      materialListRemoteDataSource: locator<MaterialListRemoteDataSource>(),
      productSuggestionHistoryStorage:
          locator<ProductSuggestionHistoryStorage>(),
      deviceStorage: locator<DeviceStorage>(),
    ),
  );
  locator.registerLazySingleton(
    () => ProductSearchBloc(
      productSearchRepository: locator<ProductSearchRepository>(),
      config: locator<Config>(),
    ),
  );

  //============================================================
  //  Settings
  //
  //============================================================

  locator.registerLazySingleton(
    () => SettingBloc(
      authRepository: locator<AuthRepository>(),
    ),
  );

  //============================================================
  //  Account Summary
  //
  //============================================================

  locator.registerLazySingleton(() => AccountSummaryLocalDataSource());

  locator.registerLazySingleton(() => AccountSummaryQuery());

  locator.registerLazySingleton(
    () => AccountSummaryRemoteDataSource(
      httpService: locator<HttpService>(),
      query: locator<AccountSummaryQuery>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => AccountSummaryRepository(
      config: locator<Config>(),
      localDataSource: locator<AccountSummaryLocalDataSource>(),
      remoteDataSource: locator<AccountSummaryRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => ZPAccountSummaryBloc(
      accountSummaryRepository: locator<AccountSummaryRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => MPAccountSummaryBloc(
      accountSummaryRepository: locator<AccountSummaryRepository>(),
    ),
  );

  //============================================================
  // View By Order History
  //
  //============================================================

  locator.registerLazySingleton(() => ViewByOrderLocalDataSource());
  locator.registerLazySingleton(
    () => ViewByOrderRemoteDataSource(
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      httpService: locator<HttpService>(),
      viewByOrderQuery: locator<ViewByOrderDetailsQueryMutation>(),
      remoteConfigService: locator<RemoteConfigService>(),
    ),
  );

  locator.registerLazySingleton(
    () => ViewByOrderRepository(
      config: locator<Config>(),
      localDataSource: locator<ViewByOrderLocalDataSource>(),
      remoteDataSource: locator<ViewByOrderRemoteDataSource>(),
      deviceStorage: locator<DeviceStorage>(),
    ),
  );
  locator.registerFactory(
    () => ViewByOrderBloc(
      viewByOrderRepository: locator<ViewByOrderRepository>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => ViewByOrderFilterBloc(),
  );

  locator.registerLazySingleton(
    () => ChatBotService(
      config: locator<Config>(),
      pushNotificationService: locator<PushNotificationService>(),
    ),
  );

  locator.registerLazySingleton(
    () => ChatBotRepository(
      chatBotService: locator<ChatBotService>(),
      deepLinkingService: locator<DeepLinkingService>(),
      tokenStorage: locator<TokenStorage>(),
      config: locator<Config>(),
      deviceStorage: locator<DeviceStorage>(),
    ),
  );

  locator.registerLazySingleton(
    () => ChatBotBloc(
      chatBotRepository: locator<ChatBotRepository>(),
    ),
  );

  //============================================================
  //
  // Product Images
  //
  //============================================================
  locator.registerLazySingleton(
    () => ProductImageBloc(
      repository: locator<ProductDetailRepository>(),
    ),
  );

  //============================================================
  //
  // Favourites
  //
  //============================================================
  locator.registerLazySingleton(
    () => FavouriteRepository(
      config: locator<Config>(),
      favouriteLocalDataSource: locator<FavouriteLocalDataSource>(),
      favouriteRemoteDataSource: locator<FavouriteRemoteDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => FavouriteLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => FavouriteRemoteDataSource(
      httpService: locator<HttpService>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      favouriteMutation: locator<FavouriteMutation>(),
    ),
  );
  locator.registerLazySingleton(
    () => FavouriteMutation(),
  );
  //============================================================
  //  View by item Details
  //
  //============================================================

  locator.registerLazySingleton(
    () => ViewByItemDetailsBloc(
      orderStatusTrackerRepository: locator<OrderStatusTrackerRepository>(),
      viewByItemRepository: locator<ViewByItemRepository>(),
      config: locator<Config>(),
    ),
  );

  //============================================================
  //  Articles
  //
  //============================================================

  locator.registerLazySingleton(() => ArticleInfoQueryMutation());
  locator.registerLazySingleton(() => ArticleInfoLocalDataSource());

  locator.registerLazySingleton(
    () => ArticleInfoRemoteDataSource(
      httpService: locator<HttpService>(),
      exceptionHandler: locator<DataSourceExceptionHandler>(),
      queryMutation: locator<ArticleInfoQueryMutation>(),
    ),
  );

  locator.registerLazySingleton(
    () => ArticleInfoRepository(
      config: locator<Config>(),
      localDataSource: locator<ArticleInfoLocalDataSource>(),
      remoteDataSource: locator<ArticleInfoRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => ArticlesInfoBloc(
      articleInfoRepository: locator<ArticleInfoRepository>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(() => AnnouncementArticleTagQueryMutation());
  locator.registerLazySingleton(() => AnnouncementArticleTagLocalDataSource());

  locator.registerLazySingleton(
    () => AnnouncementArticlTagRemoteDataSource(
      httpService: locator<HttpService>(),
      exceptionHandler: locator<DataSourceExceptionHandler>(),
      queryMutation: locator<AnnouncementArticleTagQueryMutation>(),
    ),
  );

  locator.registerLazySingleton(
    () => AnnouncementArticleTagRepository(
      config: locator<Config>(),
      localDataSource: locator<AnnouncementArticleTagLocalDataSource>(),
      remoteDataSource: locator<AnnouncementArticlTagRemoteDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => ArticlesInfoFilterBloc(
      announcementArticleTagRepository:
          locator<AnnouncementArticleTagRepository>(),
    ),
  );

  //============================================================
  //  Announcement
  //
  //============================================================

  locator.registerLazySingleton(() => AnnouncementInfoLocalDataSource());

  locator.registerLazySingleton(() => AnnouncementInfoQueryMutation());

  locator.registerLazySingleton(
    () => AnnouncementInfoRemoteDataSource(
      httpService: locator<HttpService>(),
      queryMutation: locator<AnnouncementInfoQueryMutation>(),
      exceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => AnnouncementInfoRepository(
      config: locator<Config>(),
      localDataSource: locator<AnnouncementInfoLocalDataSource>(),
      remoteDataSource: locator<AnnouncementInfoRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => AnnouncementInfoBloc(
      announcementInfoRepository: locator<AnnouncementInfoRepository>(),
      config: locator<Config>(),
    ),
  );
  locator.registerLazySingleton(
    () => AnnouncementInfoDetailsBloc(
      announcementInfoRepository: locator<AnnouncementInfoRepository>(),
    ),
  );
  locator.registerLazySingleton(
    () => AnnouncementFilterBloc(
      announcementArticleTagRepository:
          locator<AnnouncementArticleTagRepository>(),
    ),
  );
  locator.registerLazySingleton(
    () => AnnouncementAttachmentDownloadLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => AnnouncementAttachmentDownloadRemoteDataSource(
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      httpService:
          locator<HttpService>(instanceName: httpServiceWithoutInterceptor),
    ),
  );
  locator.registerLazySingleton(
    () => AnnouncementAttachmentRepository(
      config: locator<Config>(),
      localDataSource: locator<AnnouncementAttachmentDownloadLocalDataSource>(),
      remoteDataSource:
          locator<AnnouncementAttachmentDownloadRemoteDataSource>(),
      permissionService: locator<PermissionService>(),
      deviceInfo: locator<DeviceInfo>(),
      filePickerService: locator<FilePickerService>(),
      fileSystemHelper: locator<FileSystemHelper>(),
    ),
  );

  locator.registerFactory(
    () => AnnouncementAttachmentBloc(
      announcementAttachmentRepository:
          locator<AnnouncementAttachmentRepository>(),
    ),
  );
  //============================================================
  //  Order Status Tracker
  //
  //============================================================

  locator.registerLazySingleton(() => OrderStatusTrackerLocalDataSource());

  locator.registerLazySingleton(() => OrderStatusTrackerQuery());

  locator.registerLazySingleton(
    () => OrderStatusTrackerRemoteDataSource(
      httpService: locator<HttpService>(),
      queryMutation: locator<OrderStatusTrackerQuery>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderStatusTrackerRepository(
      config: locator<Config>(),
      localDataSource: locator<OrderStatusTrackerLocalDataSource>(),
      remoteDataSource: locator<OrderStatusTrackerRemoteDataSource>(),
    ),
  );

  //============================================================
  //  Returns: New Request
  //
  //============================================================
  locator.registerLazySingleton(
    () => ReturnRequestQuery(),
  );
  locator.registerLazySingleton(
    () => ReturnRequestLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => ReturnRequestRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      query: locator<ReturnRequestQuery>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      remoteConfigService: locator<RemoteConfigService>(),
    ),
  );
  locator.registerLazySingleton(
    () => ReturnRequestRepository(
      config: locator<Config>(),
      localDataSource: locator<ReturnRequestLocalDataSource>(),
      remoteDataSource: locator<ReturnRequestRemoteDataSource>(),
      permissionService: locator<PermissionService>(),
      deviceInfo: locator<DeviceInfo>(),
      filePickerService: locator<FilePickerService>(),
      fileSystemHelper: locator<FileSystemHelper>(),
      deviceStorage: locator<DeviceStorage>(),
      poDocumentRemoteDataSource: locator<PoDocumentRemoteDataSource>(),
      poDocumentLocalDataSource: locator<PoDocumentLocalDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => ReturnItemsFilterBloc(),
  );
  locator.registerLazySingleton(
    () => ReturnItemsBloc(
      newRequestRepository: locator<ReturnRequestRepository>(),
      config: locator<Config>(),
    ),
  );
  locator.registerLazySingleton(
    () => NewRequestBloc(
      newRequestRepository: locator<ReturnRequestRepository>(),
    ),
  );
  locator.registerLazySingleton(
    () => ReturnRequestAttachmentBloc(
      returnRequestRepository: locator<ReturnRequestRepository>(),
      poAttachmentRepository: locator<PoAttachmentRepository>(),
    ),
  );

  //============================================================
  //  Contact Us
  //============================================================
  locator.registerLazySingleton(() => ContactUsQuery());

  locator.registerLazySingleton(() => ContactUsDetailsLocalDataSource());

  locator.registerLazySingleton(
    () => ContactUsDetailsRemoteDataSource(
      httpService: locator<HttpService>(),
      queryMutation: locator<ContactUsQuery>(),
      exceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => ContactUsDetailsRepository(
      config: locator<Config>(),
      localDataSource: locator<ContactUsDetailsLocalDataSource>(),
      remoteDataSource: locator<ContactUsDetailsRemoteDataSource>(),
    ),
  );

  locator.registerFactory(
    () => ContactUsDetailsBloc(
      contactUsRepository: locator<ContactUsDetailsRepository>(),
    ),
  );
  locator.registerLazySingleton(() => ContactUsLocalDataSource());

  locator.registerLazySingleton(() => ContactUsQueryMutation());

  locator.registerLazySingleton(
    () => ContactUsRemoteDataSource(
      httpService: locator<HttpService>(),
      mutation: locator<ContactUsQueryMutation>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => ContactUsRepository(
      config: locator<Config>(),
      localDataSource: locator<ContactUsLocalDataSource>(),
      remoteDataSource: locator<ContactUsRemoteDataSource>(),
    ),
  );

  locator.registerFactory(
    () => ContactUsBloc(
      contactUsRepository: locator<ContactUsRepository>(),
    ),
  );

  //============================================================
  //  Notification
  //
  //============================================================

  locator.registerLazySingleton(() => NotificationLocalDataSource());

  locator.registerLazySingleton(() => NotificationQuery());

  locator.registerLazySingleton(
    () => NotificationRemoteDataSource(
      httpService: locator<HttpService>(),
      notificationQuery: locator<NotificationQuery>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      config: locator<Config>(),
      remoteConfigService: locator<RemoteConfigService>(),
    ),
  );

  locator.registerLazySingleton(
    () => NotificationRepository(
      config: locator<Config>(),
      localDataSource: locator<NotificationLocalDataSource>(),
      remoteDataSource: locator<NotificationRemoteDataSource>(),
      deviceStorage: locator<DeviceStorage>(),
    ),
  );

  locator.registerLazySingleton(
    () => NotificationBloc(
      notificationRepository: locator<NotificationRepository>(),
      config: locator<Config>(),
    ),
  );

  //============================================================
  //  FAQ
  //
  //============================================================

  locator.registerLazySingleton(() => FAQInfoQueryMutation());
  locator.registerLazySingleton(() => FAQInfoLocalDataSource());

  locator.registerLazySingleton(
    () => FAQInfoRemoteDataSource(
      httpService: locator<HttpService>(),
      exceptionHandler: locator<DataSourceExceptionHandler>(),
      queryMutation: locator<FAQInfoQueryMutation>(),
    ),
  );

  locator.registerLazySingleton(
    () => FAQInfoRepository(
      config: locator<Config>(),
      localDataSource: locator<FAQInfoLocalDataSource>(),
      remoteDataSource: locator<FAQInfoRemoteDataSource>(),
    ),
  );

  locator.registerFactory(
    () => FaqBloc(
      faqInfoRepository: locator<FAQInfoRepository>(),
      config: locator<Config>(),
    ),
  );

  //============================================================
  //  Customer License
  //
  //============================================================
  locator.registerLazySingleton(
    () => CustomerLicenseQuery(),
  );

  locator.registerLazySingleton(
    () => CustomerLicenseLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => CustomerLicenseRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      customerLicenseQuery: locator<CustomerLicenseQuery>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );
  locator.registerLazySingleton(
    () => CustomerLicenseRepository(
      config: locator<Config>(),
      localDataSource: locator<CustomerLicenseLocalDataSource>(),
      remoteDataSource: locator<CustomerLicenseRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => CustomerLicenseBloc(
      customerLicenseRepository: locator<CustomerLicenseRepository>(),
      config: locator<Config>(),
    ),
  );

  //============================================================
  //  Reorder
  //
  //============================================================

  locator.registerLazySingleton(() => ReOrderPermissionLocalDataSource());

  locator.registerLazySingleton(() => ReOrderPermissionQuery());

  locator.registerLazySingleton(
    () => ReOrderPermissionRemoteDataSource(
      reOrderPermissionQuery: locator<ReOrderPermissionQuery>(),
      httpService: locator<HttpService>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => ReOrderPermissionRepository(
      config: locator<Config>(),
      localDataSource: locator<ReOrderPermissionLocalDataSource>(),
      remoteDataSource: locator<ReOrderPermissionRemoteDataSource>(),
    ),
  );

  locator.registerFactory(
    () => ReOrderPermissionBloc(
      reOrderPermissionRepository: locator<ReOrderPermissionRepository>(),
      materialPriceRepository: locator<MaterialPriceRepository>(),
    ),
  );

  //============================================================
  //  About Us
  //============================================================

  locator.registerLazySingleton(
    () => AboutUsQueryMutation(),
  );

  locator.registerLazySingleton(
    () => AboutUsLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => AboutUsRemoteDataSource(
      exceptionHandler: locator<DataSourceExceptionHandler>(),
      httpService: locator<HttpService>(),
      queryMutation: locator<AboutUsQueryMutation>(),
    ),
  );

  locator.registerLazySingleton(
    () => AboutUsRepository(
      localDataSource: locator<AboutUsLocalDataSource>(),
      remoteDataSource: locator<AboutUsRemoteDataSource>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => AboutUsBloc(
      repository: locator<AboutUsRepository>(),
    ),
  );

  //============================================================
  //  EZPoint
  //
  //============================================================
  locator.registerLazySingleton(() => EZPointMutation());

  locator.registerLazySingleton(() => EZPointLocalDataSource());

  locator.registerLazySingleton(
    () => EZPointRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      ezPointMutation: locator<EZPointMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => EZPointRepository(
      config: locator<Config>(),
      localDataSource: locator<EZPointLocalDataSource>(),
      remoteDataSource: locator<EZPointRemoteDataSource>(),
    ),
  );

  locator.registerFactory(
    () => EZPointBloc(
      eZPointRepository: locator<EZPointRepository>(),
    ),
  );

  //============================================================
  //  National Privacy Commission
  //
  //============================================================

  locator.registerFactory(
    () => NationalPrivacyCommissionBloc(
      poAttachmentRepository: locator<PoAttachmentRepository>(),
    ),
  );

  //============================================================
  //  Notification Settings
  //
  //============================================================
  locator.registerLazySingleton(() => NotificationSettingsMutation());

  locator.registerLazySingleton(() => NotificationSettingsLocalDataSource());

  locator.registerLazySingleton(
    () => NotificationSettingsRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      notificationSettingsMutation: locator<NotificationSettingsMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => NotificationSettingsRepository(
      config: locator<Config>(),
      localDataSource: locator<NotificationSettingsLocalDataSource>(),
      remoteDataSource: locator<NotificationSettingsRemoteDataSource>(),
    ),
  );

  locator.registerFactory(
    () => NotificationSettingsBloc(
      notificationSettingsRepository: locator<NotificationSettingsRepository>(),
    ),
  );

  locator.registerFactory(
    () => PrivacyConsentBloc(
      userRepository: locator<UserRepository>(),
    ),
  );

  //============================================================
  //  Stock
  //
  //============================================================

  locator.registerLazySingleton(
    () => StockInfoRepository(
      config: locator<Config>(),
      localDataSource: locator<StockInfoLocalDataSource>(),
      remoteDataSource: locator<StockInfoRemoteDataSource>(),
    ),
  );

  //============================================================
  //  Claim Management
  //
  //============================================================

  locator.registerLazySingleton(() => ClaimManagementQueryMutation());

  locator.registerLazySingleton(() => ClaimManagementLocalDataSource());

  locator.registerLazySingleton(
    () => ClaimManagementRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      claimManagementQueryMutation: locator<ClaimManagementQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => ClaimManagementRepository(
      config: locator<Config>(),
      localDataSource: locator<ClaimManagementLocalDataSource>(),
      remoteDataSource: locator<ClaimManagementRemoteDataSource>(),
      fileSystemHelper: locator<FileSystemHelper>(),
    ),
  );

  locator.registerLazySingleton(
    () => ClaimManagementBloc(
      config: locator<Config>(),
      claimManagementRepository: locator<ClaimManagementRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => ClaimManagementFilterBloc(),
  );

  locator.registerLazySingleton(
    () => NewClaimSubmissionBloc(
      config: locator<Config>(),
      claimManagementRepository: locator<ClaimManagementRepository>(),
    ),
  );

  //============================================================
  //  EZCS Ticket
  //
  //============================================================

  locator.registerLazySingleton(() => EZCSTicketLocalDataSource());

  locator.registerLazySingleton(() => EZCSTicketQueryMutation());

  locator.registerLazySingleton(
    () => EZCSTicketRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      ezcsTicketQueryMutation: locator<EZCSTicketQueryMutation>(),
    ),
  );

  locator.registerLazySingleton(
    () => EZCSTicketRepository(
      config: locator<Config>(),
      localDataSource: locator<EZCSTicketLocalDataSource>(),
      remoteDataSource: locator<EZCSTicketRemoteDataSource>(),
      fileSystemHelper: locator<FileSystemHelper>(),
    ),
  );

  locator.registerFactory(
    () => SubmitTicketBloc(
      ezcsTicketRepository: locator<EZCSTicketRepository>(),
      config: locator<Config>(),
    ),
  );
}
