import 'dart:async';
import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:ezrxmobile/application/about_us/about_us_bloc.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/account/ez_point/ez_point_bloc.dart';
import 'package:ezrxmobile/application/account/national_privacy_commission/national_privacy_commission_bloc.dart';
import 'package:ezrxmobile/application/account/notification_settings/notification_settings_bloc.dart';
import 'package:ezrxmobile/application/account/settings/setting_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_filter/announcement_filter_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_details/announcement_info_details_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_filter/articles_info_filter_bloc.dart';
import 'package:ezrxmobile/application/auth/forgot_password/forgot_password_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/application/faq/faq_bloc.dart';
import 'package:ezrxmobile/application/notification/notification_bloc.dart';
import 'package:ezrxmobile/application/order/bundle/add_to_cart/bundle_add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
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
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_filter/soa_filter_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_list_bloc.dart';
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
import 'package:ezrxmobile/infrastructure/core/chatbot/chatbot_service.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/datadog/datadog_service.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/account_selector_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/banner_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/material_banner_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/setting_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/application/returns/return_summary_filter/return_summary_filter_bloc.dart';
import 'package:universal_io/io.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/analytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/crashlytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cred_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/okta/okta_login.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router_observer.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sizer/sizer.dart';
import 'package:upgrader/upgrader.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode.dart';
import 'package:ezrxmobile/infrastructure/core/material_info_scanner/material_info_scanner.dart';
import 'package:wakelock/wakelock.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/product_suggestion_history_storage.dart';

final _crashlytics = locator<FirebaseCrashlyticsService>().crashlytics;

Future<void> initialSetup({
  required Flavor flavor,
  bool bypassNotificationPermission = false,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setupLocator();

  final config = locator<Config>();
  config.appFlavor = flavor;
  //TODO(Hob): Will remove this when lambda support auto grant permission
  config.bypassNotificationPermission = bypassNotificationPermission;

  await Firebase.initializeApp(options: kIsWeb ? config.firebaseOptions : null);

  if (kDebugMode) {
    await Upgrader.clearSavedSettings();
    if (Platform.isAndroid) {
      await InAppWebViewController.setWebContentsDebuggingEnabled(true);
    }
  } else {
    FlutterError.onError = (errorDetails) {
      // Flutter re-thow all the image exceptions so we add this to ignore all the image resource exception that flutter re-throw. This is a temporary fix until Flutter resolves this issue.
      if (errorDetails.library == 'image resource service') {
        return;
      }
      _crashlytics.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      if (!kIsWeb) {
        _crashlytics.recordError(error, stack);

        return true;
      }

      return false;
    };
  }

  await locator<PackageInfoService>().init();
  await locator<RemoteConfigService>().init();
  await locator<TokenStorage>().init();
  await locator<CredStorage>().init();
  await locator<OktaLoginServices>().init();
  await locator<AccountSelectorStorage>().init();
  await locator<SettingStorage>().init();
  await locator<DeviceStorage>().init();
  await locator<BannerStorage>().init();
  await locator<ProductSuggestionHistoryStorage>().init();
  await locator<MixpanelService>().init();
  await locator<DatadogService>().init();
  await locator<MaterialBannerStorage>().init();

  if (!kIsWeb) {
    await Wakelock.enable();
    await locator<ClevertapService>().init();
    await locator<ChatBotService>().init();
    await ScanditFlutterDataCaptureBarcode.initialize();
    await locator<MaterialInfoScanner>().init();
  }
}

Future<void> runAppWithCrashlyticsAndLocalization() async {
  final configuration = locator<DatadogService>().configuration;

  await DatadogSdk.runApp(
    configuration,
    locator<Config>().enableDatadog
        ? TrackingConsent.granted
        : TrackingConsent.notGranted,
    () {
      runApp(
        EasyLocalization(
          supportedLocales: const [
            Locale('en'),
            Locale('th'),
            Locale('zh'),
            Locale('my'),
            Locale('vi'),
            Locale('km'),
            Locale('id'),
          ],
          path: 'assets/langs/langs.csv',
          fallbackLocale: const Locale('en'),
          saveLocale: true,
          useOnlyLangCode: true,
          assetLoader: CsvAssetLoader(),
          child: Sizer(
            builder: (context, orientation, deviceType) {
              return const App();
            },
          ),
        ),
      );
    },
  );
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = locator<AppRouter>();

    /*TODO(Hob): Will consider to move BlocProvider of Payment Module to PaymentPage
    Initialize for reduce bloc scope and auto dispose when payment page dispose
    when we ready to refactor bloc scope */

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => locator<AuthBloc>()..add(const AuthEvent.init()),
        ),
        BlocProvider<LoginFormBloc>(
          create: (context) => locator<LoginFormBloc>()
            ..add(const LoginFormEvent.fetchCurrentMarket()),
        ),
        BlocProvider<ProxyLoginFormBloc>(
          create: (context) => locator<ProxyLoginFormBloc>(),
        ),
        BlocProvider<UserBloc>(create: (context) => locator<UserBloc>()),
        BlocProvider<SalesOrgBloc>(
          create: (context) =>
              locator<SalesOrgBloc>()..add(const SalesOrgEvent.initialized()),
        ),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => locator<CustomerCodeBloc>(),
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => locator<EligibilityBloc>(),
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => locator<AnnouncementBloc>(),
        ),
        BlocProvider<MaterialFilterBloc>(
          create: (context) => locator<MaterialFilterBloc>(),
        ),
        BlocProvider<MaterialListBloc>(
          create: (context) => locator<MaterialListBloc>(),
        ),
        BlocProvider<BundleAddToCartBloc>(
          create: (context) => locator<BundleAddToCartBloc>(),
        ),
        BlocProvider<ViewByItemsBloc>(
          create: (context) => locator<ViewByItemsBloc>(),
        ),
        BlocProvider<ViewByItemFilterBloc>(
          create: (context) => locator<ViewByItemFilterBloc>(),
        ),
        BlocProvider<ResetPasswordBloc>(
          create: (context) => locator<ResetPasswordBloc>(),
        ),
        BlocProvider<ForgotPasswordBloc>(
          create: (context) => locator<ForgotPasswordBloc>(),
        ),
        BlocProvider<MaterialPriceBloc>(
          create: (context) => locator<MaterialPriceBloc>(),
        ),
        BlocProvider<PaymentCustomerInformationBloc>(
          create: (context) => locator<PaymentCustomerInformationBloc>(),
        ),
        BlocProvider<PaymentTermBloc>(
          create: (context) => locator<PaymentTermBloc>(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => locator<CartBloc>(),
        ),
        BlocProvider<OrderSummaryBloc>(
          create: (context) => locator<OrderSummaryBloc>(),
        ),
        BlocProvider<AdditionalDetailsBloc>(
          create: (context) => locator<AdditionalDetailsBloc>(),
        ),
        BlocProvider<ViewByOrderDetailsBloc>(
          create: (context) => locator<ViewByOrderDetailsBloc>(),
        ),
        BlocProvider<PoAttachmentBloc>(
          create: (context) => locator<PoAttachmentBloc>(),
        ),
        BlocProvider<OrderEligibilityBloc>(
          create: (context) => locator<OrderEligibilityBloc>(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => locator<CartBloc>(),
        ),
        BlocProvider<UsageCodeBloc>(
          create: (context) => locator<UsageCodeBloc>(),
        ),
        BlocProvider<ComboDealListBloc>(
          create: (context) => locator<ComboDealListBloc>(),
        ),
        BlocProvider<ComboDealMaterialDetailBloc>(
          create: (context) => locator<ComboDealMaterialDetailBloc>(),
        ),
        BlocProvider<ScanMaterialInfoBloc>(
          create: (context) => locator<ScanMaterialInfoBloc>(),
        ),
        BlocProvider<TenderContractListBloc>(
          create: (context) => locator<TenderContractListBloc>(),
        ),
        BlocProvider<ZPPaymentSummaryBloc>(
          create: (context) => locator<ZPPaymentSummaryBloc>(),
        ),
        BlocProvider<MPPaymentSummaryBloc>(
          create: (context) => locator<MPPaymentSummaryBloc>(),
        ),
        BlocProvider<PaymentSummaryFilterBloc>(
          create: (context) => locator<PaymentSummaryFilterBloc>(),
        ),
        BlocProvider<ZPSoaBloc>(
          create: (context) => locator<ZPSoaBloc>(),
        ),
        BlocProvider<MPSoaBloc>(
          create: (context) => locator<MPSoaBloc>(),
        ),
        BlocProvider<SoaFilterBloc>(
          create: (context) => locator<SoaFilterBloc>(),
        ),
        BlocProvider<ReturnSummaryFilterBloc>(
          create: (context) => locator<ReturnSummaryFilterBloc>(),
        ),
        BlocProvider<ReturnSummaryDetailsBloc>(
          create: (context) => locator<ReturnSummaryDetailsBloc>(),
        ),
        BlocProvider<DeepLinkingBloc>(
          create: (context) => locator<DeepLinkingBloc>(),
        ),
        // BlocProvider<AdminPoAttachmentBloc>(
        //   create: (context) => locator<AdminPoAttachmentBloc>(),
        // ),
        // BlocProvider<AdminPoAttachmentFilterBloc>(
        //   create: (context) => locator<AdminPoAttachmentFilterBloc>(),
        // ),
        BlocProvider<AllInvoicesFilterBloc>(
          create: (context) => locator<AllInvoicesFilterBloc>(),
        ),
        BlocProvider<FullSummaryFilterBloc>(
          create: (context) => locator<FullSummaryFilterBloc>(),
        ),
        BlocProvider<ZPAllInvoicesBloc>(
          create: (context) => locator<ZPAllInvoicesBloc>(),
        ),
        BlocProvider<MPAllInvoicesBloc>(
          create: (context) => locator<MPAllInvoicesBloc>(),
        ),
        BlocProvider<CreditAndInvoiceDetailsBloc>(
          create: (context) => locator<CreditAndInvoiceDetailsBloc>(),
        ),
        BlocProvider<ZPAllCreditsBloc>(
          create: (context) => locator<ZPAllCreditsBloc>(),
        ),
        BlocProvider<MPAllCreditsBloc>(
          create: (context) => locator<MPAllCreditsBloc>(),
        ),
        BlocProvider<ZPFullSummaryBloc>(
          create: (context) => locator<ZPFullSummaryBloc>(),
        ),
        BlocProvider<MPFullSummaryBloc>(
          create: (context) => locator<MPFullSummaryBloc>(),
        ),
        BlocProvider<OutstandingInvoicesBloc>(
          create: (context) => locator<OutstandingInvoicesBloc>(),
        ),
        BlocProvider<AvailableCreditsBloc>(
          create: (context) => locator<AvailableCreditsBloc>(),
        ),
        BlocProvider<NewPaymentBloc>(
          create: (context) => locator<NewPaymentBloc>(),
        ),
        BlocProvider<DownloadPaymentAttachmentsBloc>(
          create: (context) => locator<DownloadPaymentAttachmentsBloc>(),
        ),
        BlocProvider<SettingBloc>(
          create: (context) => locator<SettingBloc>(),
        ),
        BlocProvider<AllCreditsFilterBloc>(
          create: (context) => locator<AllCreditsFilterBloc>(),
        ),
        BlocProvider<ZPAccountSummaryBloc>(
          create: (context) => locator<ZPAccountSummaryBloc>(),
        ),
        BlocProvider<MPAccountSummaryBloc>(
          create: (context) => locator<MPAccountSummaryBloc>(),
        ),
        BlocProvider<ProductSearchBloc>(
          create: (context) => locator<ProductSearchBloc>(),
        ),
        BlocProvider<ViewByOrderBloc>(
          create: (context) => locator<ViewByOrderBloc>(),
        ),
        BlocProvider<ViewByOrderFilterBloc>(
          create: (context) => locator<ViewByOrderFilterBloc>(),
        ),
        BlocProvider<ChatBotBloc>(
          create: (context) =>
              locator<ChatBotBloc>()..add(const ChatBotEvent.initialize()),
        ),
        BlocProvider<ReturnListByItemBloc>(
          create: (context) => locator<ReturnListByItemBloc>(),
        ),
        BlocProvider<ReturnListByRequestBloc>(
          create: (context) => locator<ReturnListByRequestBloc>(),
        ),
        BlocProvider<ViewByItemDetailsBloc>(
          create: (context) => locator<ViewByItemDetailsBloc>(),
        ),
        BlocProvider<AnnouncementInfoBloc>(
          create: (context) => locator<AnnouncementInfoBloc>(),
        ),
        BlocProvider<AnnouncementInfoDetailsBloc>(
          create: (context) => locator<AnnouncementInfoDetailsBloc>(),
        ),
        BlocProvider<AnnouncementFilterBloc>(
          create: (context) => locator<AnnouncementFilterBloc>(),
        ),
        BlocProvider<ViewByItemReturnFilterBloc>(
          create: (context) => locator<ViewByItemReturnFilterBloc>(),
        ),
        BlocProvider<ViewByRequestReturnFilterBloc>(
          create: (context) => locator<ViewByRequestReturnFilterBloc>(),
        ),
        BlocProvider<PaymentSummaryDetailsBloc>(
          create: (context) => locator<PaymentSummaryDetailsBloc>(),
        ),
        BlocProvider<ProductImageBloc>(
          create: (context) => locator<ProductImageBloc>(),
        ),
        BlocProvider<OutstandingInvoiceFilterBloc>(
          create: (context) => locator<OutstandingInvoiceFilterBloc>(),
        ),
        BlocProvider<AvailableCreditFilterBloc>(
          create: (context) => locator<AvailableCreditFilterBloc>(),
        ),
        BlocProvider<ArticlesInfoBloc>(
          create: (context) => locator<ArticlesInfoBloc>(),
        ),
        BlocProvider<ArticlesInfoFilterBloc>(
          create: (context) => locator<ArticlesInfoFilterBloc>(),
        ),
        BlocProvider<ReturnDetailsByRequestBloc>(
          create: (context) => locator<ReturnDetailsByRequestBloc>(),
        ),
        BlocProvider<ReturnItemsFilterBloc>(
          create: (context) => locator<ReturnItemsFilterBloc>(),
        ),
        BlocProvider<ReturnItemsBloc>(
          create: (context) => locator<ReturnItemsBloc>(),
        ),
        BlocProvider<NewRequestBloc>(
          create: (context) => locator<NewRequestBloc>(),
        ),
        BlocProvider<ReturnRequestAttachmentBloc>(
          create: (context) => locator<ReturnRequestAttachmentBloc>(),
        ),
        BlocProvider<NotificationBloc>(
          create: (context) => locator<NotificationBloc>(),
        ),
        BlocProvider<FaqBloc>(
          create: (context) => locator<FaqBloc>(),
        ),
        BlocProvider<ZPPaymentInProgressBloc>(
          create: (context) => locator<ZPPaymentInProgressBloc>(),
        ),
        BlocProvider<MPPaymentInProgressBloc>(
          create: (context) => locator<MPPaymentInProgressBloc>(),
        ),
        BlocProvider<CustomerLicenseBloc>(
          create: (context) => locator<CustomerLicenseBloc>(),
        ),
        BlocProvider<ReOrderPermissionBloc>(
          create: (context) => locator<ReOrderPermissionBloc>(),
        ),
        BlocProvider<EZPointBloc>(
          create: (context) => locator<EZPointBloc>(),
        ),
        BlocProvider<NotificationSettingsBloc>(
          create: (context) => locator<NotificationSettingsBloc>(),
        ),
        BlocProvider<BankInAccountsBloc>(
          create: (context) => locator<BankInAccountsBloc>(),
        ),
        BlocProvider<DownloadECreditBloc>(
          create: (context) => locator<DownloadECreditBloc>(),
        ),
        BlocProvider<AboutUsBloc>(
          create: (context) => locator<AboutUsBloc>(),
        ),
        BlocProvider<NationalPrivacyCommissionBloc>(
          create: (context) => locator<NationalPrivacyCommissionBloc>(),
        ),
        BlocProvider<ClaimManagementBloc>(
          create: (context) => locator<ClaimManagementBloc>(),
        ),
        BlocProvider<ClaimManagementFilterBloc>(
          create: (context) => locator<ClaimManagementFilterBloc>(),
        ),
        BlocProvider<NewClaimSubmissionBloc>(
          create: (context) => locator<NewClaimSubmissionBloc>(),
        ),
      ],
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        title: locator<Config>().appName,
        theme: appThemeData[AppTheme.light],
        // darkTheme: appThemeData[AppTheme.dark],
        // themeMode: ThemeMode.system,
        routerDelegate: AutoRouterDelegate(
          router,
          navigatorObservers: () => [
            locator<FirebaseAnalyticsService>().observer,
            locator<RouterObserver>(),
            locator<DatadogService>().navigationObserver,
          ],
        ),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: child,
          ),
        ),
        routeInformationParser: router.defaultRouteParser(),
      ),
    );
  }
}

// class _EntryPage extends StatelessWidget {
//   final Widget? child;
//   const _EntryPage({
//     Key? key,
//     required this.child,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Overlay(
//       initialEntries: [
//         OverlayEntry(
//           builder: (context) => ChatBotWidget(
//             child: child!,
//           ),
//         ),
//       ],
//     );
//   }
// }
