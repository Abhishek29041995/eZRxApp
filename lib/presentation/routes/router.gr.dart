// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i81;
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart'
    as _i89;
import 'package:ezrxmobile/domain/account/entities/user.dart' as _i84;
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart'
    as _i83;
import 'package:ezrxmobile/domain/auth/value/value_objects.dart' as _i88;
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart' as _i86;
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart'
    as _i87;
import 'package:ezrxmobile/domain/order/entities/material_info.dart' as _i85;
import 'package:ezrxmobile/presentation/account/change_password/change_password_page.dart'
    as _i14;
import 'package:ezrxmobile/presentation/account/contact_us/contact_us_page.dart'
    as _i19;
import 'package:ezrxmobile/presentation/account/customer_search/customer_search.dart'
    as _i21;
import 'package:ezrxmobile/presentation/account/ez_point/ez_point_webview_page.dart'
    as _i22;
import 'package:ezrxmobile/presentation/account/national_privacy_commission/national_privacy_commission_page.dart'
    as _i33;
import 'package:ezrxmobile/presentation/account/notification_settings/notification_settings_page.dart'
    as _i38;
import 'package:ezrxmobile/presentation/account/privacy_consent/privacy_consent_page.dart'
    as _i52;
import 'package:ezrxmobile/presentation/account/profile/profile_page.dart'
    as _i56;
import 'package:ezrxmobile/presentation/account/sales_org_search.dart' as _i68;
import 'package:ezrxmobile/presentation/aup_tc/aup_tc_page.dart' as _i10;
import 'package:ezrxmobile/presentation/auth/forgot_password/forgot_password_confirmation_page.dart'
    as _i24;
import 'package:ezrxmobile/presentation/auth/forgot_password/forgot_password_page.dart'
    as _i25;
import 'package:ezrxmobile/presentation/auth/login/login_page.dart' as _i31;
import 'package:ezrxmobile/presentation/auth/reset_password/reset_password_page.dart'
    as _i58;
import 'package:ezrxmobile/presentation/auth/reset_password_link_expired/reset_password_link_expired_page.dart'
    as _i57;
import 'package:ezrxmobile/presentation/auth/reset_password_success/reset_password_success_page.dart'
    as _i59;
import 'package:ezrxmobile/presentation/core/pdfview_page.dart' as _i51;
import 'package:ezrxmobile/presentation/core/static_html_viewer.dart' as _i74;
import 'package:ezrxmobile/presentation/core/webview_page.dart' as _i80;
import 'package:ezrxmobile/presentation/faq/faq.dart' as _i23;
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/announcement_info_details_page.dart'
    as _i5;
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/announcements_tab.dart'
    as _i7;
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements_page.dart'
    as _i6;
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/articles/article_details.dart'
    as _i8;
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/articles/articles_tab.dart'
    as _i9;
import 'package:ezrxmobile/presentation/home/home_tab.dart' as _i28;
import 'package:ezrxmobile/presentation/home/widgets/select_order_type_bottom_sheet.dart'
    as _i70;
import 'package:ezrxmobile/presentation/home_tab.dart' as _i27;
import 'package:ezrxmobile/presentation/intro/intro_page.dart' as _i29;
import 'package:ezrxmobile/presentation/more/more_tab.dart' as _i32;
import 'package:ezrxmobile/presentation/more/section/about_us/about_us_page.dart'
    as _i1;
import 'package:ezrxmobile/presentation/more/section/ezcs_tickets/submit_ticket/submit_ticket_page.dart'
    as _i75;
import 'package:ezrxmobile/presentation/notification/notification_tab.dart'
    as _i39;
import 'package:ezrxmobile/presentation/orders/cart/cart_page.dart' as _i13;
import 'package:ezrxmobile/presentation/orders/cart/checkout/checkout_page.dart'
    as _i15;
import 'package:ezrxmobile/presentation/orders/cart/small_order_fee_modal/small_order_fee_modal.dart'
    as _i71;
import 'package:ezrxmobile/presentation/orders/create_order/scan_material_info.dart'
    as _i69;
import 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart'
    as _i40;
import 'package:ezrxmobile/presentation/orders/order_tab/orders_tab.dart'
    as _i41;
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/view_by_item_section.dart'
    as _i77;
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart'
    as _i79;
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart'
    as _i76;
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/view_by_order_details.dart'
    as _i78;
import 'package:ezrxmobile/presentation/payments/account_summary/account_summary_page.dart'
    as _i2;
import 'package:ezrxmobile/presentation/payments/all_credits/all_credits.dart'
    as _i3;
import 'package:ezrxmobile/presentation/payments/all_invoices/all_invoices.dart'
    as _i4;
import 'package:ezrxmobile/presentation/payments/claim_management/claim_management_page.dart'
    as _i16;
import 'package:ezrxmobile/presentation/payments/claim_submitted/claim_submitted_page.dart'
    as _i17;
import 'package:ezrxmobile/presentation/payments/credit_details/credit_details.dart'
    as _i20;
import 'package:ezrxmobile/presentation/payments/full_summary/full_summary.dart'
    as _i26;
import 'package:ezrxmobile/presentation/payments/invoice_details/invoice_details.dart'
    as _i30;
import 'package:ezrxmobile/presentation/payments/new_claim_submission/new_claim_submission_page.dart'
    as _i34;
import 'package:ezrxmobile/presentation/payments/new_payment/new_payment_page.dart'
    as _i35;
import 'package:ezrxmobile/presentation/payments/new_payment/tabs/available_credits_tab/available_credits_tab.dart'
    as _i11;
import 'package:ezrxmobile/presentation/payments/new_payment/tabs/outstanding_invoices_tab/outstanding_invoices_tab.dart'
    as _i42;
import 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/payment_method_tab.dart'
    as _i46;
import 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart'
    as _i43;
import 'package:ezrxmobile/presentation/payments/payment_completed/payment_completed_page.dart'
    as _i44;
import 'package:ezrxmobile/presentation/payments/payment_failed/payment_failed_page.dart'
    as _i45;
import 'package:ezrxmobile/presentation/payments/payment_home/payment_page.dart'
    as _i47;
import 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart'
    as _i49;
import 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart'
    as _i48;
import 'package:ezrxmobile/presentation/payments/payment_webview/payment_webview_page.dart'
    as _i50;
import 'package:ezrxmobile/presentation/payments/statement_accounts/statement_accounts.dart'
    as _i73;
import 'package:ezrxmobile/presentation/products/bundle_details/bundle_detail_page.dart'
    as _i12;
import 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart'
    as _i18;
import 'package:ezrxmobile/presentation/products/product_details/product_details_page.dart'
    as _i53;
import 'package:ezrxmobile/presentation/products/product_suggestion/product_suggestion_page.dart'
    as _i54;
import 'package:ezrxmobile/presentation/products/products_tab.dart' as _i55;
import 'package:ezrxmobile/presentation/returns/new_request/new_request_page.dart'
    as _i36;
import 'package:ezrxmobile/presentation/returns/new_request/new_request_success/new_request_successful_page.dart'
    as _i37;
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart'
    as _i62;
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_tab.dart'
    as _i63;
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/return_review_tab.dart'
    as _i66;
import 'package:ezrxmobile/presentation/returns/return_list/return_by_item_page.dart'
    as _i60;
import 'package:ezrxmobile/presentation/returns/return_list/return_by_request_page.dart'
    as _i61;
import 'package:ezrxmobile/presentation/returns/return_list/return_root/return_root.dart'
    as _i67;
import 'package:ezrxmobile/presentation/returns/return_summary_by_item_details/return_summary_by_item_details.dart'
    as _i65;
import 'package:ezrxmobile/presentation/returns/return_summary_request_details/return_request_details.dart'
    as _i64;
import 'package:ezrxmobile/presentation/splash/splash_page.dart' as _i72;
import 'package:flutter/material.dart' as _i82;

abstract class $AppRouter extends _i81.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i81.PageFactory> pagesMap = {
    AboutUsPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutUsPage(),
      );
    },
    AccountSummaryRoute.name: (routeData) {
      final args = routeData.argsAs<AccountSummaryRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AccountSummary(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    AllCreditsPageRoute.name: (routeData) {
      final args = routeData.argsAs<AllCreditsPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AllCreditsPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    AllInvoicesPageRoute.name: (routeData) {
      final args = routeData.argsAs<AllInvoicesPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.AllInvoicesPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    AnnouncementInfoDetailsPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AnnouncementInfoDetailsPage(),
      );
    },
    AnnouncementsPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.AnnouncementsPage(),
      );
    },
    AnnouncementsTabRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.AnnouncementsTab(),
      );
    },
    ArticleDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleDetailsRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.ArticleDetails(
          key: args.key,
          article: args.article,
        ),
      );
    },
    ArticlesTabRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ArticlesTab(),
      );
    },
    AupTCPageRoute.name: (routeData) {
      final args = routeData.argsAs<AupTCPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.AupTCPage(
          key: args.key,
          user: args.user,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    AvailableCreditsTabRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.AvailableCreditsTab(),
      );
    },
    BundleDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<BundleDetailPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.BundleDetailPage(
          key: args.key,
          materialInfo: args.materialInfo,
          banner: args.banner,
        ),
      );
    },
    CartPageRoute.name: (routeData) {
      final args = routeData.argsAs<CartPageRouteArgs>(
          orElse: () => const CartPageRouteArgs());
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.CartPage(
          key: args.key,
          isReOrder: args.isReOrder,
          deliveryInfo: args.deliveryInfo,
        ),
      );
    },
    ChangePasswordPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ChangePasswordPage(),
      );
    },
    CheckoutPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.CheckoutPage(),
      );
    },
    ClaimManagementPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.ClaimManagementPage(),
      );
    },
    ClaimSubmittedPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.ClaimSubmittedPage(),
      );
    },
    ComboDetailPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.ComboDetailPage(),
      );
    },
    ContactUsPageRoute.name: (routeData) {
      final args = routeData.argsAs<ContactUsPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.ContactUsPage(
          key: args.key,
          appMarket: args.appMarket,
        ),
      );
    },
    CreditDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<CreditDetailsPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.CreditDetailsPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    CustomerSearchPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.CustomerSearchPage(),
      );
    },
    EZPointWebviewPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.EZPointWebviewPage(),
      );
    },
    FAQPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.FAQPage(),
      );
    },
    ForgetPasswordConfirmationPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.ForgetPasswordConfirmationPage(),
      );
    },
    ForgetPasswordPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.ForgetPasswordPage(),
      );
    },
    FullSummaryPageRoute.name: (routeData) {
      final args = routeData.argsAs<FullSummaryPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.FullSummaryPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    HomeNavigationTabbarRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.HomeNavigationTabbar(),
      );
    },
    HomeTabRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.HomeTab(),
      );
    },
    IntroPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.IntroPage(),
      );
    },
    InvoiceDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<InvoiceDetailsPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i30.InvoiceDetailsPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.LoginPage(),
      );
    },
    MoreTabRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i32.MoreTab(),
      );
    },
    NationalPrivacyCommissionPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i33.NationalPrivacyCommissionPage(),
      );
    },
    NewClaimSubmissionPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i34.NewClaimSubmissionPage(),
      );
    },
    NewPaymentPageRoute.name: (routeData) {
      final args = routeData.argsAs<NewPaymentPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i35.NewPaymentPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    NewRequestPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i36.NewRequestPage(),
      );
    },
    NewRequestSuccessfulPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i37.NewRequestSuccessfulPage(),
      );
    },
    NotificationSettingsPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i38.NotificationSettingsPage(),
      );
    },
    NotificationTabRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i39.NotificationTab(),
      );
    },
    OrderSuccessPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i40.OrderSuccessPage(),
      );
    },
    OrdersTabRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i41.OrdersTab(),
      );
    },
    OutstandingInvoicesTabRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i42.OutstandingInvoicesTab(),
      );
    },
    PaymentAdviceCreatedPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentAdviceCreatedPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i43.PaymentAdviceCreatedPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    PaymentCompletedPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentCompletedPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.PaymentCompletedPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    PaymentFailedPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentFailedPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i45.PaymentFailedPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    PaymentMethodTabRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i46.PaymentMethodTab(),
      );
    },
    PaymentPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i47.PaymentPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    PaymentSummaryDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentSummaryDetailsPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i48.PaymentSummaryDetailsPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    PaymentSummaryPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentSummaryPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i49.PaymentSummaryPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    PaymentWebviewPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<Uri?>(
        routeData: routeData,
        child: const _i50.PaymentWebviewPage(),
      );
    },
    PdfViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<PdfViewPageRouteArgs>(
          orElse: () => const PdfViewPageRouteArgs());
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i51.PdfViewPage(
          key: args.key,
          url: args.url,
          titleText: args.titleText,
        ),
      );
    },
    PrivacyConsentPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i52.PrivacyConsentPage(),
      );
    },
    ProductDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i53.ProductDetailsPage(
          key: args.key,
          materialInfo: args.materialInfo,
          isEditTender: args.isEditTender,
          banner: args.banner,
        ),
      );
    },
    ProductSuggestionPageRoute.name: (routeData) {
      final args = routeData.argsAs<ProductSuggestionPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i54.ProductSuggestionPage(
          key: args.key,
          parentRoute: args.parentRoute,
        ),
      );
    },
    ProductsTabRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i55.ProductsTab(),
      );
    },
    ProfilePageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i56.ProfilePage(),
      );
    },
    ResetPasswordLinkExpiredPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i57.ResetPasswordLinkExpiredPage(),
      );
    },
    ResetPasswordPageRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordPageRouteArgs>(
          orElse: () => const ResetPasswordPageRouteArgs());
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i58.ResetPasswordPage(
          key: args.key,
          isFirstLogin: args.isFirstLogin,
        ),
      );
    },
    ResetPasswordSuccessRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordSuccessRouteArgs>(
          orElse: () => const ResetPasswordSuccessRouteArgs());
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i59.ResetPasswordSuccess(
          key: args.key,
          isFirstLogin: args.isFirstLogin,
        ),
      );
    },
    ReturnByItemPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i60.ReturnByItemPage(),
      );
    },
    ReturnByRequestPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i61.ReturnByRequestPage(),
      );
    },
    ReturnDetailsTabRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i62.ReturnDetailsTab(),
      );
    },
    ReturnItemsTabRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i63.ReturnItemsTab(),
      );
    },
    ReturnRequestDetailsRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i64.ReturnRequestDetails(),
      );
    },
    ReturnRequestSummaryByItemDetailsRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i65.ReturnRequestSummaryByItemDetails(),
      );
    },
    ReturnReviewTabRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i66.ReturnReviewTab(),
      );
    },
    ReturnRootRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i67.ReturnRoot(),
      );
    },
    SalesOrgSearchRoute.name: (routeData) {
      final args = routeData.argsAs<SalesOrgSearchRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i68.SalesOrgSearch(
          key: args.key,
          avialableSalesOrgList: args.avialableSalesOrgList,
        ),
      );
    },
    ScanMaterialInfoRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i69.ScanMaterialInfo(),
      );
    },
    SelectOrderTypeBottomSheetRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i70.SelectOrderTypeBottomSheet(),
      );
    },
    SmallOrderFeePageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i71.SmallOrderFeePage(),
      );
    },
    SplashPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i72.SplashPage(),
      );
    },
    StatementAccountsPageRoute.name: (routeData) {
      final args = routeData.argsAs<StatementAccountsPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i73.StatementAccountsPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    StaticHtmlViewerRoute.name: (routeData) {
      final args = routeData.argsAs<StaticHtmlViewerRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i74.StaticHtmlViewer(
          key: args.key,
          title: args.title,
          htmlPath: args.htmlPath,
          styleCss: args.styleCss,
        ),
      );
    },
    SubmitTicketPageRoute.name: (routeData) {
      final args = routeData.argsAs<SubmitTicketPageRouteArgs>();
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i75.SubmitTicketPage(
          key: args.key,
          chatUrl: args.chatUrl,
        ),
      );
    },
    ViewByItemDetailsPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i76.ViewByItemDetailsPage(),
      );
    },
    ViewByItemsPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i77.ViewByItemsPage(),
      );
    },
    ViewByOrderDetailsPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i78.ViewByOrderDetailsPage(),
      );
    },
    ViewByOrdersPageRoute.name: (routeData) {
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i79.ViewByOrdersPage(),
      );
    },
    WebViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPageRouteArgs>(
          orElse: () => const WebViewPageRouteArgs());
      return _i81.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i80.WebViewPage(
          key: args.key,
          url: args.url,
          initialFile: args.initialFile,
          titleText: args.titleText,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutUsPage]
class AboutUsPageRoute extends _i81.PageRouteInfo<void> {
  const AboutUsPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          AboutUsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AccountSummary]
class AccountSummaryRoute extends _i81.PageRouteInfo<AccountSummaryRouteArgs> {
  AccountSummaryRoute({
    _i82.Key? key,
    required bool isMarketPlace,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          AccountSummaryRoute.name,
          args: AccountSummaryRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
          initialChildren: children,
        );

  static const String name = 'AccountSummaryRoute';

  static const _i81.PageInfo<AccountSummaryRouteArgs> page =
      _i81.PageInfo<AccountSummaryRouteArgs>(name);
}

class AccountSummaryRouteArgs {
  const AccountSummaryRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i82.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'AccountSummaryRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i3.AllCreditsPage]
class AllCreditsPageRoute extends _i81.PageRouteInfo<AllCreditsPageRouteArgs> {
  AllCreditsPageRoute({
    _i82.Key? key,
    required bool isMarketPlace,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          AllCreditsPageRoute.name,
          args: AllCreditsPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
          initialChildren: children,
        );

  static const String name = 'AllCreditsPageRoute';

  static const _i81.PageInfo<AllCreditsPageRouteArgs> page =
      _i81.PageInfo<AllCreditsPageRouteArgs>(name);
}

class AllCreditsPageRouteArgs {
  const AllCreditsPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i82.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'AllCreditsPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i4.AllInvoicesPage]
class AllInvoicesPageRoute
    extends _i81.PageRouteInfo<AllInvoicesPageRouteArgs> {
  AllInvoicesPageRoute({
    _i82.Key? key,
    required bool isMarketPlace,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          AllInvoicesPageRoute.name,
          args: AllInvoicesPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
          initialChildren: children,
        );

  static const String name = 'AllInvoicesPageRoute';

  static const _i81.PageInfo<AllInvoicesPageRouteArgs> page =
      _i81.PageInfo<AllInvoicesPageRouteArgs>(name);
}

class AllInvoicesPageRouteArgs {
  const AllInvoicesPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i82.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'AllInvoicesPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i5.AnnouncementInfoDetailsPage]
class AnnouncementInfoDetailsPageRoute extends _i81.PageRouteInfo<void> {
  const AnnouncementInfoDetailsPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          AnnouncementInfoDetailsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnnouncementInfoDetailsPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i6.AnnouncementsPage]
class AnnouncementsPageRoute extends _i81.PageRouteInfo<void> {
  const AnnouncementsPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          AnnouncementsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnnouncementsPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i7.AnnouncementsTab]
class AnnouncementsTabRoute extends _i81.PageRouteInfo<void> {
  const AnnouncementsTabRoute({List<_i81.PageRouteInfo>? children})
      : super(
          AnnouncementsTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnnouncementsTabRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ArticleDetails]
class ArticleDetailsRoute extends _i81.PageRouteInfo<ArticleDetailsRouteArgs> {
  ArticleDetailsRoute({
    _i82.Key? key,
    required _i83.AnnouncementArticleItem article,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          ArticleDetailsRoute.name,
          args: ArticleDetailsRouteArgs(
            key: key,
            article: article,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleDetailsRoute';

  static const _i81.PageInfo<ArticleDetailsRouteArgs> page =
      _i81.PageInfo<ArticleDetailsRouteArgs>(name);
}

class ArticleDetailsRouteArgs {
  const ArticleDetailsRouteArgs({
    this.key,
    required this.article,
  });

  final _i82.Key? key;

  final _i83.AnnouncementArticleItem article;

  @override
  String toString() {
    return 'ArticleDetailsRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [_i9.ArticlesTab]
class ArticlesTabRoute extends _i81.PageRouteInfo<void> {
  const ArticlesTabRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ArticlesTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArticlesTabRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i10.AupTCPage]
class AupTCPageRoute extends _i81.PageRouteInfo<AupTCPageRouteArgs> {
  AupTCPageRoute({
    _i82.Key? key,
    required _i84.User user,
    required bool isMarketPlace,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          AupTCPageRoute.name,
          args: AupTCPageRouteArgs(
            key: key,
            user: user,
            isMarketPlace: isMarketPlace,
          ),
          initialChildren: children,
        );

  static const String name = 'AupTCPageRoute';

  static const _i81.PageInfo<AupTCPageRouteArgs> page =
      _i81.PageInfo<AupTCPageRouteArgs>(name);
}

class AupTCPageRouteArgs {
  const AupTCPageRouteArgs({
    this.key,
    required this.user,
    required this.isMarketPlace,
  });

  final _i82.Key? key;

  final _i84.User user;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'AupTCPageRouteArgs{key: $key, user: $user, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i11.AvailableCreditsTab]
class AvailableCreditsTabRoute extends _i81.PageRouteInfo<void> {
  const AvailableCreditsTabRoute({List<_i81.PageRouteInfo>? children})
      : super(
          AvailableCreditsTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'AvailableCreditsTabRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i12.BundleDetailPage]
class BundleDetailPageRoute
    extends _i81.PageRouteInfo<BundleDetailPageRouteArgs> {
  BundleDetailPageRoute({
    _i82.Key? key,
    required _i85.MaterialInfo materialInfo,
    _i86.EZReachBanner? banner,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          BundleDetailPageRoute.name,
          args: BundleDetailPageRouteArgs(
            key: key,
            materialInfo: materialInfo,
            banner: banner,
          ),
          initialChildren: children,
        );

  static const String name = 'BundleDetailPageRoute';

  static const _i81.PageInfo<BundleDetailPageRouteArgs> page =
      _i81.PageInfo<BundleDetailPageRouteArgs>(name);
}

class BundleDetailPageRouteArgs {
  const BundleDetailPageRouteArgs({
    this.key,
    required this.materialInfo,
    this.banner,
  });

  final _i82.Key? key;

  final _i85.MaterialInfo materialInfo;

  final _i86.EZReachBanner? banner;

  @override
  String toString() {
    return 'BundleDetailPageRouteArgs{key: $key, materialInfo: $materialInfo, banner: $banner}';
  }
}

/// generated route for
/// [_i13.CartPage]
class CartPageRoute extends _i81.PageRouteInfo<CartPageRouteArgs> {
  CartPageRoute({
    _i82.Key? key,
    bool isReOrder = false,
    _i87.DeliveryInfoData? deliveryInfo,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          CartPageRoute.name,
          args: CartPageRouteArgs(
            key: key,
            isReOrder: isReOrder,
            deliveryInfo: deliveryInfo,
          ),
          initialChildren: children,
        );

  static const String name = 'CartPageRoute';

  static const _i81.PageInfo<CartPageRouteArgs> page =
      _i81.PageInfo<CartPageRouteArgs>(name);
}

class CartPageRouteArgs {
  const CartPageRouteArgs({
    this.key,
    this.isReOrder = false,
    this.deliveryInfo,
  });

  final _i82.Key? key;

  final bool isReOrder;

  final _i87.DeliveryInfoData? deliveryInfo;

  @override
  String toString() {
    return 'CartPageRouteArgs{key: $key, isReOrder: $isReOrder, deliveryInfo: $deliveryInfo}';
  }
}

/// generated route for
/// [_i14.ChangePasswordPage]
class ChangePasswordPageRoute extends _i81.PageRouteInfo<void> {
  const ChangePasswordPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ChangePasswordPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i15.CheckoutPage]
class CheckoutPageRoute extends _i81.PageRouteInfo<void> {
  const CheckoutPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          CheckoutPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckoutPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i16.ClaimManagementPage]
class ClaimManagementPageRoute extends _i81.PageRouteInfo<void> {
  const ClaimManagementPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ClaimManagementPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ClaimManagementPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i17.ClaimSubmittedPage]
class ClaimSubmittedPageRoute extends _i81.PageRouteInfo<void> {
  const ClaimSubmittedPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ClaimSubmittedPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ClaimSubmittedPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ComboDetailPage]
class ComboDetailPageRoute extends _i81.PageRouteInfo<void> {
  const ComboDetailPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ComboDetailPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ComboDetailPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i19.ContactUsPage]
class ContactUsPageRoute extends _i81.PageRouteInfo<ContactUsPageRouteArgs> {
  ContactUsPageRoute({
    _i82.Key? key,
    required _i88.AppMarket appMarket,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          ContactUsPageRoute.name,
          args: ContactUsPageRouteArgs(
            key: key,
            appMarket: appMarket,
          ),
          initialChildren: children,
        );

  static const String name = 'ContactUsPageRoute';

  static const _i81.PageInfo<ContactUsPageRouteArgs> page =
      _i81.PageInfo<ContactUsPageRouteArgs>(name);
}

class ContactUsPageRouteArgs {
  const ContactUsPageRouteArgs({
    this.key,
    required this.appMarket,
  });

  final _i82.Key? key;

  final _i88.AppMarket appMarket;

  @override
  String toString() {
    return 'ContactUsPageRouteArgs{key: $key, appMarket: $appMarket}';
  }
}

/// generated route for
/// [_i20.CreditDetailsPage]
class CreditDetailsPageRoute
    extends _i81.PageRouteInfo<CreditDetailsPageRouteArgs> {
  CreditDetailsPageRoute({
    _i82.Key? key,
    required bool isMarketPlace,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          CreditDetailsPageRoute.name,
          args: CreditDetailsPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
          initialChildren: children,
        );

  static const String name = 'CreditDetailsPageRoute';

  static const _i81.PageInfo<CreditDetailsPageRouteArgs> page =
      _i81.PageInfo<CreditDetailsPageRouteArgs>(name);
}

class CreditDetailsPageRouteArgs {
  const CreditDetailsPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i82.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'CreditDetailsPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i21.CustomerSearchPage]
class CustomerSearchPageRoute extends _i81.PageRouteInfo<void> {
  const CustomerSearchPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          CustomerSearchPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerSearchPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i22.EZPointWebviewPage]
class EZPointWebviewPageRoute extends _i81.PageRouteInfo<void> {
  const EZPointWebviewPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          EZPointWebviewPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'EZPointWebviewPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i23.FAQPage]
class FAQPageRoute extends _i81.PageRouteInfo<void> {
  const FAQPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          FAQPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'FAQPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i24.ForgetPasswordConfirmationPage]
class ForgetPasswordConfirmationPageRoute extends _i81.PageRouteInfo<void> {
  const ForgetPasswordConfirmationPageRoute(
      {List<_i81.PageRouteInfo>? children})
      : super(
          ForgetPasswordConfirmationPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordConfirmationPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i25.ForgetPasswordPage]
class ForgetPasswordPageRoute extends _i81.PageRouteInfo<void> {
  const ForgetPasswordPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ForgetPasswordPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i26.FullSummaryPage]
class FullSummaryPageRoute
    extends _i81.PageRouteInfo<FullSummaryPageRouteArgs> {
  FullSummaryPageRoute({
    _i82.Key? key,
    required bool isMarketPlace,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          FullSummaryPageRoute.name,
          args: FullSummaryPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
          initialChildren: children,
        );

  static const String name = 'FullSummaryPageRoute';

  static const _i81.PageInfo<FullSummaryPageRouteArgs> page =
      _i81.PageInfo<FullSummaryPageRouteArgs>(name);
}

class FullSummaryPageRouteArgs {
  const FullSummaryPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i82.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'FullSummaryPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i27.HomeNavigationTabbar]
class HomeNavigationTabbarRoute extends _i81.PageRouteInfo<void> {
  const HomeNavigationTabbarRoute({List<_i81.PageRouteInfo>? children})
      : super(
          HomeNavigationTabbarRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeNavigationTabbarRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i28.HomeTab]
class HomeTabRoute extends _i81.PageRouteInfo<void> {
  const HomeTabRoute({List<_i81.PageRouteInfo>? children})
      : super(
          HomeTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeTabRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i29.IntroPage]
class IntroPageRoute extends _i81.PageRouteInfo<void> {
  const IntroPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          IntroPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i30.InvoiceDetailsPage]
class InvoiceDetailsPageRoute
    extends _i81.PageRouteInfo<InvoiceDetailsPageRouteArgs> {
  InvoiceDetailsPageRoute({
    _i82.Key? key,
    required bool isMarketPlace,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          InvoiceDetailsPageRoute.name,
          args: InvoiceDetailsPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
          initialChildren: children,
        );

  static const String name = 'InvoiceDetailsPageRoute';

  static const _i81.PageInfo<InvoiceDetailsPageRouteArgs> page =
      _i81.PageInfo<InvoiceDetailsPageRouteArgs>(name);
}

class InvoiceDetailsPageRouteArgs {
  const InvoiceDetailsPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i82.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'InvoiceDetailsPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i31.LoginPage]
class LoginPageRoute extends _i81.PageRouteInfo<void> {
  const LoginPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i32.MoreTab]
class MoreTabRoute extends _i81.PageRouteInfo<void> {
  const MoreTabRoute({List<_i81.PageRouteInfo>? children})
      : super(
          MoreTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoreTabRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i33.NationalPrivacyCommissionPage]
class NationalPrivacyCommissionPageRoute extends _i81.PageRouteInfo<void> {
  const NationalPrivacyCommissionPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          NationalPrivacyCommissionPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'NationalPrivacyCommissionPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i34.NewClaimSubmissionPage]
class NewClaimSubmissionPageRoute extends _i81.PageRouteInfo<void> {
  const NewClaimSubmissionPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          NewClaimSubmissionPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewClaimSubmissionPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i35.NewPaymentPage]
class NewPaymentPageRoute extends _i81.PageRouteInfo<NewPaymentPageRouteArgs> {
  NewPaymentPageRoute({
    _i82.Key? key,
    required bool isMarketPlace,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          NewPaymentPageRoute.name,
          args: NewPaymentPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
          initialChildren: children,
        );

  static const String name = 'NewPaymentPageRoute';

  static const _i81.PageInfo<NewPaymentPageRouteArgs> page =
      _i81.PageInfo<NewPaymentPageRouteArgs>(name);
}

class NewPaymentPageRouteArgs {
  const NewPaymentPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i82.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'NewPaymentPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i36.NewRequestPage]
class NewRequestPageRoute extends _i81.PageRouteInfo<void> {
  const NewRequestPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          NewRequestPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewRequestPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i37.NewRequestSuccessfulPage]
class NewRequestSuccessfulPageRoute extends _i81.PageRouteInfo<void> {
  const NewRequestSuccessfulPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          NewRequestSuccessfulPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewRequestSuccessfulPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i38.NotificationSettingsPage]
class NotificationSettingsPageRoute extends _i81.PageRouteInfo<void> {
  const NotificationSettingsPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          NotificationSettingsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationSettingsPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i39.NotificationTab]
class NotificationTabRoute extends _i81.PageRouteInfo<void> {
  const NotificationTabRoute({List<_i81.PageRouteInfo>? children})
      : super(
          NotificationTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationTabRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i40.OrderSuccessPage]
class OrderSuccessPageRoute extends _i81.PageRouteInfo<void> {
  const OrderSuccessPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          OrderSuccessPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderSuccessPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i41.OrdersTab]
class OrdersTabRoute extends _i81.PageRouteInfo<void> {
  const OrdersTabRoute({List<_i81.PageRouteInfo>? children})
      : super(
          OrdersTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersTabRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i42.OutstandingInvoicesTab]
class OutstandingInvoicesTabRoute extends _i81.PageRouteInfo<void> {
  const OutstandingInvoicesTabRoute({List<_i81.PageRouteInfo>? children})
      : super(
          OutstandingInvoicesTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'OutstandingInvoicesTabRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i43.PaymentAdviceCreatedPage]
class PaymentAdviceCreatedPageRoute
    extends _i81.PageRouteInfo<PaymentAdviceCreatedPageRouteArgs> {
  PaymentAdviceCreatedPageRoute({
    _i82.Key? key,
    required bool isMarketPlace,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          PaymentAdviceCreatedPageRoute.name,
          args: PaymentAdviceCreatedPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentAdviceCreatedPageRoute';

  static const _i81.PageInfo<PaymentAdviceCreatedPageRouteArgs> page =
      _i81.PageInfo<PaymentAdviceCreatedPageRouteArgs>(name);
}

class PaymentAdviceCreatedPageRouteArgs {
  const PaymentAdviceCreatedPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i82.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentAdviceCreatedPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i44.PaymentCompletedPage]
class PaymentCompletedPageRoute
    extends _i81.PageRouteInfo<PaymentCompletedPageRouteArgs> {
  PaymentCompletedPageRoute({
    _i82.Key? key,
    required bool isMarketPlace,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          PaymentCompletedPageRoute.name,
          args: PaymentCompletedPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentCompletedPageRoute';

  static const _i81.PageInfo<PaymentCompletedPageRouteArgs> page =
      _i81.PageInfo<PaymentCompletedPageRouteArgs>(name);
}

class PaymentCompletedPageRouteArgs {
  const PaymentCompletedPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i82.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentCompletedPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i45.PaymentFailedPage]
class PaymentFailedPageRoute
    extends _i81.PageRouteInfo<PaymentFailedPageRouteArgs> {
  PaymentFailedPageRoute({
    _i82.Key? key,
    required bool isMarketPlace,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          PaymentFailedPageRoute.name,
          args: PaymentFailedPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentFailedPageRoute';

  static const _i81.PageInfo<PaymentFailedPageRouteArgs> page =
      _i81.PageInfo<PaymentFailedPageRouteArgs>(name);
}

class PaymentFailedPageRouteArgs {
  const PaymentFailedPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i82.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentFailedPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i46.PaymentMethodTab]
class PaymentMethodTabRoute extends _i81.PageRouteInfo<void> {
  const PaymentMethodTabRoute({List<_i81.PageRouteInfo>? children})
      : super(
          PaymentMethodTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentMethodTabRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i47.PaymentPage]
class PaymentPageRoute extends _i81.PageRouteInfo<PaymentPageRouteArgs> {
  PaymentPageRoute({
    _i82.Key? key,
    required bool isMarketPlace,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          PaymentPageRoute.name,
          args: PaymentPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentPageRoute';

  static const _i81.PageInfo<PaymentPageRouteArgs> page =
      _i81.PageInfo<PaymentPageRouteArgs>(name);
}

class PaymentPageRouteArgs {
  const PaymentPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i82.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i48.PaymentSummaryDetailsPage]
class PaymentSummaryDetailsPageRoute
    extends _i81.PageRouteInfo<PaymentSummaryDetailsPageRouteArgs> {
  PaymentSummaryDetailsPageRoute({
    _i82.Key? key,
    required bool isMarketPlace,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          PaymentSummaryDetailsPageRoute.name,
          args: PaymentSummaryDetailsPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentSummaryDetailsPageRoute';

  static const _i81.PageInfo<PaymentSummaryDetailsPageRouteArgs> page =
      _i81.PageInfo<PaymentSummaryDetailsPageRouteArgs>(name);
}

class PaymentSummaryDetailsPageRouteArgs {
  const PaymentSummaryDetailsPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i82.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentSummaryDetailsPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i49.PaymentSummaryPage]
class PaymentSummaryPageRoute
    extends _i81.PageRouteInfo<PaymentSummaryPageRouteArgs> {
  PaymentSummaryPageRoute({
    _i82.Key? key,
    required bool isMarketPlace,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          PaymentSummaryPageRoute.name,
          args: PaymentSummaryPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentSummaryPageRoute';

  static const _i81.PageInfo<PaymentSummaryPageRouteArgs> page =
      _i81.PageInfo<PaymentSummaryPageRouteArgs>(name);
}

class PaymentSummaryPageRouteArgs {
  const PaymentSummaryPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i82.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentSummaryPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i50.PaymentWebviewPage]
class PaymentWebviewPageRoute extends _i81.PageRouteInfo<void> {
  const PaymentWebviewPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          PaymentWebviewPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentWebviewPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i51.PdfViewPage]
class PdfViewPageRoute extends _i81.PageRouteInfo<PdfViewPageRouteArgs> {
  PdfViewPageRoute({
    _i82.Key? key,
    String url = '',
    String titleText = '',
    List<_i81.PageRouteInfo>? children,
  }) : super(
          PdfViewPageRoute.name,
          args: PdfViewPageRouteArgs(
            key: key,
            url: url,
            titleText: titleText,
          ),
          initialChildren: children,
        );

  static const String name = 'PdfViewPageRoute';

  static const _i81.PageInfo<PdfViewPageRouteArgs> page =
      _i81.PageInfo<PdfViewPageRouteArgs>(name);
}

class PdfViewPageRouteArgs {
  const PdfViewPageRouteArgs({
    this.key,
    this.url = '',
    this.titleText = '',
  });

  final _i82.Key? key;

  final String url;

  final String titleText;

  @override
  String toString() {
    return 'PdfViewPageRouteArgs{key: $key, url: $url, titleText: $titleText}';
  }
}

/// generated route for
/// [_i52.PrivacyConsentPage]
class PrivacyConsentPageRoute extends _i81.PageRouteInfo<void> {
  const PrivacyConsentPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          PrivacyConsentPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyConsentPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i53.ProductDetailsPage]
class ProductDetailsPageRoute
    extends _i81.PageRouteInfo<ProductDetailsPageRouteArgs> {
  ProductDetailsPageRoute({
    _i82.Key? key,
    required _i85.MaterialInfo materialInfo,
    bool isEditTender = false,
    _i86.EZReachBanner? banner,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          ProductDetailsPageRoute.name,
          args: ProductDetailsPageRouteArgs(
            key: key,
            materialInfo: materialInfo,
            isEditTender: isEditTender,
            banner: banner,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsPageRoute';

  static const _i81.PageInfo<ProductDetailsPageRouteArgs> page =
      _i81.PageInfo<ProductDetailsPageRouteArgs>(name);
}

class ProductDetailsPageRouteArgs {
  const ProductDetailsPageRouteArgs({
    this.key,
    required this.materialInfo,
    this.isEditTender = false,
    this.banner,
  });

  final _i82.Key? key;

  final _i85.MaterialInfo materialInfo;

  final bool isEditTender;

  final _i86.EZReachBanner? banner;

  @override
  String toString() {
    return 'ProductDetailsPageRouteArgs{key: $key, materialInfo: $materialInfo, isEditTender: $isEditTender, banner: $banner}';
  }
}

/// generated route for
/// [_i54.ProductSuggestionPage]
class ProductSuggestionPageRoute
    extends _i81.PageRouteInfo<ProductSuggestionPageRouteArgs> {
  ProductSuggestionPageRoute({
    _i82.Key? key,
    required String parentRoute,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          ProductSuggestionPageRoute.name,
          args: ProductSuggestionPageRouteArgs(
            key: key,
            parentRoute: parentRoute,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductSuggestionPageRoute';

  static const _i81.PageInfo<ProductSuggestionPageRouteArgs> page =
      _i81.PageInfo<ProductSuggestionPageRouteArgs>(name);
}

class ProductSuggestionPageRouteArgs {
  const ProductSuggestionPageRouteArgs({
    this.key,
    required this.parentRoute,
  });

  final _i82.Key? key;

  final String parentRoute;

  @override
  String toString() {
    return 'ProductSuggestionPageRouteArgs{key: $key, parentRoute: $parentRoute}';
  }
}

/// generated route for
/// [_i55.ProductsTab]
class ProductsTabRoute extends _i81.PageRouteInfo<void> {
  const ProductsTabRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ProductsTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsTabRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i56.ProfilePage]
class ProfilePageRoute extends _i81.PageRouteInfo<void> {
  const ProfilePageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ProfilePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i57.ResetPasswordLinkExpiredPage]
class ResetPasswordLinkExpiredPageRoute extends _i81.PageRouteInfo<void> {
  const ResetPasswordLinkExpiredPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ResetPasswordLinkExpiredPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordLinkExpiredPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i58.ResetPasswordPage]
class ResetPasswordPageRoute
    extends _i81.PageRouteInfo<ResetPasswordPageRouteArgs> {
  ResetPasswordPageRoute({
    _i82.Key? key,
    bool isFirstLogin = false,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          ResetPasswordPageRoute.name,
          args: ResetPasswordPageRouteArgs(
            key: key,
            isFirstLogin: isFirstLogin,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordPageRoute';

  static const _i81.PageInfo<ResetPasswordPageRouteArgs> page =
      _i81.PageInfo<ResetPasswordPageRouteArgs>(name);
}

class ResetPasswordPageRouteArgs {
  const ResetPasswordPageRouteArgs({
    this.key,
    this.isFirstLogin = false,
  });

  final _i82.Key? key;

  final bool isFirstLogin;

  @override
  String toString() {
    return 'ResetPasswordPageRouteArgs{key: $key, isFirstLogin: $isFirstLogin}';
  }
}

/// generated route for
/// [_i59.ResetPasswordSuccess]
class ResetPasswordSuccessRoute
    extends _i81.PageRouteInfo<ResetPasswordSuccessRouteArgs> {
  ResetPasswordSuccessRoute({
    _i82.Key? key,
    bool isFirstLogin = false,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          ResetPasswordSuccessRoute.name,
          args: ResetPasswordSuccessRouteArgs(
            key: key,
            isFirstLogin: isFirstLogin,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordSuccessRoute';

  static const _i81.PageInfo<ResetPasswordSuccessRouteArgs> page =
      _i81.PageInfo<ResetPasswordSuccessRouteArgs>(name);
}

class ResetPasswordSuccessRouteArgs {
  const ResetPasswordSuccessRouteArgs({
    this.key,
    this.isFirstLogin = false,
  });

  final _i82.Key? key;

  final bool isFirstLogin;

  @override
  String toString() {
    return 'ResetPasswordSuccessRouteArgs{key: $key, isFirstLogin: $isFirstLogin}';
  }
}

/// generated route for
/// [_i60.ReturnByItemPage]
class ReturnByItemPageRoute extends _i81.PageRouteInfo<void> {
  const ReturnByItemPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ReturnByItemPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReturnByItemPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i61.ReturnByRequestPage]
class ReturnByRequestPageRoute extends _i81.PageRouteInfo<void> {
  const ReturnByRequestPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ReturnByRequestPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReturnByRequestPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i62.ReturnDetailsTab]
class ReturnDetailsTabRoute extends _i81.PageRouteInfo<void> {
  const ReturnDetailsTabRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ReturnDetailsTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReturnDetailsTabRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i63.ReturnItemsTab]
class ReturnItemsTabRoute extends _i81.PageRouteInfo<void> {
  const ReturnItemsTabRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ReturnItemsTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReturnItemsTabRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i64.ReturnRequestDetails]
class ReturnRequestDetailsRoute extends _i81.PageRouteInfo<void> {
  const ReturnRequestDetailsRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ReturnRequestDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReturnRequestDetailsRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i65.ReturnRequestSummaryByItemDetails]
class ReturnRequestSummaryByItemDetailsRoute extends _i81.PageRouteInfo<void> {
  const ReturnRequestSummaryByItemDetailsRoute(
      {List<_i81.PageRouteInfo>? children})
      : super(
          ReturnRequestSummaryByItemDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReturnRequestSummaryByItemDetailsRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i66.ReturnReviewTab]
class ReturnReviewTabRoute extends _i81.PageRouteInfo<void> {
  const ReturnReviewTabRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ReturnReviewTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReturnReviewTabRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i67.ReturnRoot]
class ReturnRootRoute extends _i81.PageRouteInfo<void> {
  const ReturnRootRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ReturnRootRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReturnRootRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i68.SalesOrgSearch]
class SalesOrgSearchRoute extends _i81.PageRouteInfo<SalesOrgSearchRouteArgs> {
  SalesOrgSearchRoute({
    _i82.Key? key,
    required List<_i89.SalesOrganisation> avialableSalesOrgList,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          SalesOrgSearchRoute.name,
          args: SalesOrgSearchRouteArgs(
            key: key,
            avialableSalesOrgList: avialableSalesOrgList,
          ),
          initialChildren: children,
        );

  static const String name = 'SalesOrgSearchRoute';

  static const _i81.PageInfo<SalesOrgSearchRouteArgs> page =
      _i81.PageInfo<SalesOrgSearchRouteArgs>(name);
}

class SalesOrgSearchRouteArgs {
  const SalesOrgSearchRouteArgs({
    this.key,
    required this.avialableSalesOrgList,
  });

  final _i82.Key? key;

  final List<_i89.SalesOrganisation> avialableSalesOrgList;

  @override
  String toString() {
    return 'SalesOrgSearchRouteArgs{key: $key, avialableSalesOrgList: $avialableSalesOrgList}';
  }
}

/// generated route for
/// [_i69.ScanMaterialInfo]
class ScanMaterialInfoRoute extends _i81.PageRouteInfo<void> {
  const ScanMaterialInfoRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ScanMaterialInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanMaterialInfoRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i70.SelectOrderTypeBottomSheet]
class SelectOrderTypeBottomSheetRoute extends _i81.PageRouteInfo<void> {
  const SelectOrderTypeBottomSheetRoute({List<_i81.PageRouteInfo>? children})
      : super(
          SelectOrderTypeBottomSheetRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectOrderTypeBottomSheetRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i71.SmallOrderFeePage]
class SmallOrderFeePageRoute extends _i81.PageRouteInfo<void> {
  const SmallOrderFeePageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          SmallOrderFeePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SmallOrderFeePageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i72.SplashPage]
class SplashPageRoute extends _i81.PageRouteInfo<void> {
  const SplashPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          SplashPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i73.StatementAccountsPage]
class StatementAccountsPageRoute
    extends _i81.PageRouteInfo<StatementAccountsPageRouteArgs> {
  StatementAccountsPageRoute({
    _i82.Key? key,
    required bool isMarketPlace,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          StatementAccountsPageRoute.name,
          args: StatementAccountsPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
          initialChildren: children,
        );

  static const String name = 'StatementAccountsPageRoute';

  static const _i81.PageInfo<StatementAccountsPageRouteArgs> page =
      _i81.PageInfo<StatementAccountsPageRouteArgs>(name);
}

class StatementAccountsPageRouteArgs {
  const StatementAccountsPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i82.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'StatementAccountsPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i74.StaticHtmlViewer]
class StaticHtmlViewerRoute
    extends _i81.PageRouteInfo<StaticHtmlViewerRouteArgs> {
  StaticHtmlViewerRoute({
    _i82.Key? key,
    String title = '',
    required String htmlPath,
    String styleCss = '',
    List<_i81.PageRouteInfo>? children,
  }) : super(
          StaticHtmlViewerRoute.name,
          args: StaticHtmlViewerRouteArgs(
            key: key,
            title: title,
            htmlPath: htmlPath,
            styleCss: styleCss,
          ),
          initialChildren: children,
        );

  static const String name = 'StaticHtmlViewerRoute';

  static const _i81.PageInfo<StaticHtmlViewerRouteArgs> page =
      _i81.PageInfo<StaticHtmlViewerRouteArgs>(name);
}

class StaticHtmlViewerRouteArgs {
  const StaticHtmlViewerRouteArgs({
    this.key,
    this.title = '',
    required this.htmlPath,
    this.styleCss = '',
  });

  final _i82.Key? key;

  final String title;

  final String htmlPath;

  final String styleCss;

  @override
  String toString() {
    return 'StaticHtmlViewerRouteArgs{key: $key, title: $title, htmlPath: $htmlPath, styleCss: $styleCss}';
  }
}

/// generated route for
/// [_i75.SubmitTicketPage]
class SubmitTicketPageRoute
    extends _i81.PageRouteInfo<SubmitTicketPageRouteArgs> {
  SubmitTicketPageRoute({
    _i82.Key? key,
    required String chatUrl,
    List<_i81.PageRouteInfo>? children,
  }) : super(
          SubmitTicketPageRoute.name,
          args: SubmitTicketPageRouteArgs(
            key: key,
            chatUrl: chatUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'SubmitTicketPageRoute';

  static const _i81.PageInfo<SubmitTicketPageRouteArgs> page =
      _i81.PageInfo<SubmitTicketPageRouteArgs>(name);
}

class SubmitTicketPageRouteArgs {
  const SubmitTicketPageRouteArgs({
    this.key,
    required this.chatUrl,
  });

  final _i82.Key? key;

  final String chatUrl;

  @override
  String toString() {
    return 'SubmitTicketPageRouteArgs{key: $key, chatUrl: $chatUrl}';
  }
}

/// generated route for
/// [_i76.ViewByItemDetailsPage]
class ViewByItemDetailsPageRoute extends _i81.PageRouteInfo<void> {
  const ViewByItemDetailsPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ViewByItemDetailsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ViewByItemDetailsPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i77.ViewByItemsPage]
class ViewByItemsPageRoute extends _i81.PageRouteInfo<void> {
  const ViewByItemsPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ViewByItemsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ViewByItemsPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i78.ViewByOrderDetailsPage]
class ViewByOrderDetailsPageRoute extends _i81.PageRouteInfo<void> {
  const ViewByOrderDetailsPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ViewByOrderDetailsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ViewByOrderDetailsPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i79.ViewByOrdersPage]
class ViewByOrdersPageRoute extends _i81.PageRouteInfo<void> {
  const ViewByOrdersPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ViewByOrdersPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ViewByOrdersPageRoute';

  static const _i81.PageInfo<void> page = _i81.PageInfo<void>(name);
}

/// generated route for
/// [_i80.WebViewPage]
class WebViewPageRoute extends _i81.PageRouteInfo<WebViewPageRouteArgs> {
  WebViewPageRoute({
    _i82.Key? key,
    String url = '',
    String? initialFile,
    String titleText = '',
    List<_i81.PageRouteInfo>? children,
  }) : super(
          WebViewPageRoute.name,
          args: WebViewPageRouteArgs(
            key: key,
            url: url,
            initialFile: initialFile,
            titleText: titleText,
          ),
          initialChildren: children,
        );

  static const String name = 'WebViewPageRoute';

  static const _i81.PageInfo<WebViewPageRouteArgs> page =
      _i81.PageInfo<WebViewPageRouteArgs>(name);
}

class WebViewPageRouteArgs {
  const WebViewPageRouteArgs({
    this.key,
    this.url = '',
    this.initialFile,
    this.titleText = '',
  });

  final _i82.Key? key;

  final String url;

  final String? initialFile;

  final String titleText;

  @override
  String toString() {
    return 'WebViewPageRouteArgs{key: $key, url: $url, initialFile: $initialFile, titleText: $titleText}';
  }
}
