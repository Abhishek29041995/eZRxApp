import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/about_us/about_us_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/settings/setting_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_filter/announcement_filter_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_filter/articles_info_filter_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/forgot_password/forgot_password_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/application/notification/notification_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_filter/view_by_item_filter_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_filter/view_by_order_filter_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:ezrxmobile/domain/account/entities/settings.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/entities/forgot_password.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/create_order/camera_files_permission_bottomsheet.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/splash/splash_page.dart';
import 'package:ezrxmobile/presentation/splash/upgrader_localization_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:upgrader/upgrader.dart';
import '../../common_mock_data/customer_code_mock.dart';
import '../../common_mock_data/mock_bloc.dart';
import '../../common_mock_data/mock_other.dart';
import '../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../common_mock_data/sales_organsiation_mock.dart';
import '../../common_mock_data/user_mock.dart';
import '../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late AuthBloc authBlocMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late AupTcBloc aupTcBlocMock;
  late CartBloc cartBlocMock;
  late PaymentCustomerInformationBloc paymentCustomerInformationBlocMock;
  late PaymentTermBloc paymentTermBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late AppRouter autoRouterMock;
  late AboutUsBloc aboutUsBlocMock;
  late UsageCodeBloc usageCodeBlocMock;
  late MaterialListBloc materialListBlocMock;
  late ScanMaterialInfoBloc scanMaterialInfoMockBloc;
  late SettingBloc settingBlocMock;
  late ViewByItemDetailsBloc viewByItemDetailsBlocMock;
  late MaterialFilterBloc materialFilterBlocMock;
  late ProductDetailBloc productDetailBloc;
  late LoginFormBloc loginFormBloc;
  late ProductImageBloc productImageBloc;
  late AnnouncementBloc announcementBlocMock;
  late AnnouncementInfoBloc announcementInfoBlocMock;
  late RemoteConfigService remoteConfigServiceMock;
  late DeepLinkingBloc deepLinkingBlocMock;
  late ViewByItemsBloc mockViewByItemsBloc;
  late NotificationBloc mockNotificationBloc;
  late PriceOverrideBloc mockPriceOverrideBloc;
  late ResetPasswordBloc resetPasswordBlocMock;
  final mockOrderHistoryDetailsBloc = ViewByOrderDetailsBlocMock();
  final mockOrderHistoryFilterBloc = ViewByItemFilterBlocMock();
  final mockViewByOrderBloc = ViewByOrderBlocMock();
  final chatBotBloc = ChatBotMockBloc();
  late MaterialPriceBloc mockMaterialPriceBloc;
  late CreditAndInvoiceDetailsBloc creditAndInvoiceDetailsBloc;
  late ViewByOrderFilterBloc viewByOrderFilterBlocMock;
  late ProductSearchBloc productSearchBlocMock;
  late DownloadPaymentAttachmentsBloc downloadPaymentAttachmentsBlocMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late ComboDealMaterialDetailBloc comboDealMaterialDetailBlocMock;
  late OrderSummaryBloc orderSummaryBlocMock;
  late AvailableCreditsBloc availableCreditsBlocMock;
  late OutstandingInvoicesBloc outstandingInvoicesBlocMock;
  late ReOrderPermissionBloc reOrderPermissionBlocMock;
  late ArticlesInfoBloc articlesInfoBlocMock;
  late ArticlesInfoFilterBloc articlesInfoFilterBlocMock;
  late CustomerLicenseBloc customerLicenseBlocMock;
  late AnnouncementFilterBloc announcementFilterBlocMock;
  late PoAttachmentBloc poAttachmentBlocMock;
  late CustomerCodeConfig customerCodeConfig;
  late PaymentSummaryDetailsBloc paymentSummaryDetailsBlocMock;
  late ForgotPasswordBloc forgotPasswordBlocMock;
  late OrderHistoryDetails orderHistoryDetails;

  final fakeSalesOrganisation =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601'));

  final fakeUser = User.empty().copyWith(
    id: 'fake-id',
    username: Username('fake-username'),
    fullName: const FullName(firstName: 'first name', lastName: 'last name'),
    userSalesOrganisations: [fakeSalesOrganisation],
    customerCode: CustomerCode('130046'),
    email: EmailAddress('a@abc.com'),
    role: Role.empty().copyWith(
      type: RoleType('internal_sales_rep'),
      id: 'fake-id',
      name: 'fake-name',
      description: 'fake-description',
    ),
    settings: Settings.empty().copyWith(
      languagePreference: Language.mandarin(),
    ),
  );

  final valueVariantForResetPassword = ValueVariant<User>({
    User.empty().copyWith(
      id: 'fake-id',
      isResetUserPassword: true,
    ),
    User.empty().copyWith(
      id: 'fake-id',
      isResetUserPassword: false,
    ),
  });

  setUpAll(() async {
    remoteConfigServiceMock = RemoteConfigServiceMock();
    locator.registerLazySingleton(() => MixpanelServiceMock());
    locator.registerLazySingleton(() => ChatBotServiceMock());
    locator.registerLazySingleton<RemoteConfigService>(
      () => remoteConfigServiceMock,
    );
    locator.registerFactory<AppRouter>(() => AutoRouteMock());
    locator.registerLazySingleton(() => mockViewByItemsBloc);
    locator.registerLazySingleton(() => mockMaterialPriceBloc);
    locator.registerLazySingleton(() => mockNotificationBloc);
    locator.registerLazySingleton(() => mockPriceOverrideBloc);
    locator.registerLazySingleton(
      () => Upgrader(),
    );
    customerCodeConfig =
        await CustomerCodeLocalDataSource().getCustomerCodeConfig();
    orderHistoryDetails =
        await ViewByOrderDetailsLocalDataSource().getOrderHistoryDetails();
  });

  group('Splash Screen', () {
    setUp(() {
      customerCodeBlocMock = CustomerCodeBlocMock();
      authBlocMock = AuthBlocMock();
      userBlocMock = UserBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      aupTcBlocMock = AupTcBlocMock();
      cartBlocMock = CartBlocMock();
      paymentCustomerInformationBlocMock = PaymentCustomerInformationBlocMock();
      paymentTermBlocMock = PaymentTermBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      autoRouterMock = locator<AppRouter>();
      usageCodeBlocMock = UsageCodeBlocMock();
      materialListBlocMock = MaterialListBlocMock();
      materialFilterBlocMock = MaterialFilterBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      announcementInfoBlocMock = AnnouncementInfoBlocMock();
      deepLinkingBlocMock = DeepLinkingBlocMock();
      mockViewByItemsBloc = ViewByItemsBlocMock();
      scanMaterialInfoMockBloc = ScanMaterialInfoBlocMock();
      settingBlocMock = SettingMockBloc();
      mockMaterialPriceBloc = MaterialPriceBlocMock();
      viewByItemDetailsBlocMock = ViewByItemDetailsBlocMock();
      productDetailBloc = ProductDetailBlocMock();
      creditAndInvoiceDetailsBloc = CreditAndInvoiceDetailsBlocMock();
      loginFormBloc = LoginFormBlocMock();
      mockNotificationBloc = NotificationBlocMock();
      aboutUsBlocMock = AboutUsBlocMock();
      mockPriceOverrideBloc = PriceOverrideBlocMock();
      viewByOrderFilterBlocMock = ViewByOrderFilterBlocMock();
      productSearchBlocMock = ProductSearchBlocMock();
      downloadPaymentAttachmentsBlocMock = DownloadPaymentAttachmentsBlocMock();
      additionalDetailsBlocMock = AdditionalDetailsBlocMock();
      comboDealMaterialDetailBlocMock = ComboDealMaterialDetailBlocMock();
      orderSummaryBlocMock = OrderSummaryBlocMock();
      availableCreditsBlocMock = AvailableCreditsBlocMock();
      outstandingInvoicesBlocMock = OutstandingInvoicesBlocMock();
      reOrderPermissionBlocMock = ReOrderPermissionBlocMock();
      articlesInfoBlocMock = ArticlesInfoBlocMock();
      productImageBloc = ProductImageBlocMock();
      articlesInfoFilterBlocMock = ArticlesInfoFilterBlocMock();
      customerLicenseBlocMock = CustomerLicenseBlocMock();
      announcementFilterBlocMock = AnnouncementFilterBlocMock();
      resetPasswordBlocMock = ResetPasswordBlocMock();
      poAttachmentBlocMock = PoAttachmentBlocMock();
      paymentSummaryDetailsBlocMock = PaymentSummaryDetailsBlocMock();
      forgotPasswordBlocMock = ForgotPasswordBlocMock();

      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => settingBlocMock.state).thenReturn(SettingState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());

      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => aupTcBlocMock.state).thenReturn(AupTcState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => aboutUsBlocMock.state).thenReturn(AboutUsState.initial());
      when(() => paymentCustomerInformationBlocMock.state)
          .thenReturn(PaymentCustomerInformationState.initial());
      when(() => paymentTermBlocMock.state)
          .thenReturn(PaymentTermState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => usageCodeBlocMock.state).thenReturn(UsageCodeState.initial());
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      when(() => materialFilterBlocMock.state)
          .thenReturn(MaterialFilterState.initial());
      when(() => scanMaterialInfoMockBloc.state)
          .thenReturn(ScanMaterialInfoState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => deepLinkingBlocMock.state)
          .thenReturn(const DeepLinkingState.initial());
      when(() => mockViewByItemsBloc.state)
          .thenReturn(ViewByItemsState.initial());
      when(() => mockOrderHistoryDetailsBloc.state)
          .thenReturn(ViewByOrderDetailsState.initial());
      when(() => mockOrderHistoryFilterBloc.state)
          .thenReturn(ViewByItemFilterState.initial());
      when(() => mockViewByOrderBloc.state)
          .thenReturn(ViewByOrderState.initial());
      when(() => mockMaterialPriceBloc.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => viewByItemDetailsBlocMock.state)
          .thenReturn(ViewByItemDetailsState.initial());
      when(() => productDetailBloc.state)
          .thenReturn(ProductDetailState.initial());
      when(() => creditAndInvoiceDetailsBloc.state)
          .thenReturn(CreditAndInvoiceDetailsState.initial());
      when(() => loginFormBloc.state).thenReturn(LoginFormState.initial());
      when(() => mockNotificationBloc.state)
          .thenReturn(NotificationState.initial());
      when(() => mockPriceOverrideBloc.state)
          .thenReturn(PriceOverrideState.initial());
      when(() => chatBotBloc.state).thenReturn(ChatBotState.initial());
      when(() => viewByOrderFilterBlocMock.state)
          .thenReturn(ViewByOrderFilterState.initial());
      when(() => productSearchBlocMock.state)
          .thenReturn(ProductSearchState.initial());
      when(() => downloadPaymentAttachmentsBlocMock.state)
          .thenReturn(DownloadPaymentAttachmentsState.initial());
      when(() => additionalDetailsBlocMock.state)
          .thenReturn(AdditionalDetailsState.initial());
      when(() => comboDealMaterialDetailBlocMock.state)
          .thenReturn(ComboDealMaterialDetailState.initial());
      when(() => orderSummaryBlocMock.state)
          .thenReturn(OrderSummaryState.initial());
      when(() => availableCreditsBlocMock.state)
          .thenReturn(AvailableCreditsState.initial());
      when(() => outstandingInvoicesBlocMock.state)
          .thenReturn(OutstandingInvoicesState.initial());
      when(() => reOrderPermissionBlocMock.state)
          .thenReturn(ReOrderPermissionState.initial());
      when(() => articlesInfoBlocMock.state)
          .thenReturn(ArticlesInfoState.initial());
      when(() => productImageBloc.state)
          .thenReturn(ProductImageState.initial());
      when(() => resetPasswordBlocMock.state)
          .thenReturn(ResetPasswordState.initial());
      when(() => articlesInfoFilterBlocMock.state)
          .thenReturn(ArticlesInfoFilterState.initial());
      when(() => customerLicenseBlocMock.state)
          .thenReturn(CustomerLicenseState.initial());
      when(() => announcementFilterBlocMock.state)
          .thenReturn(AnnouncementFilterState.initial());
      when(() => poAttachmentBlocMock.state)
          .thenReturn(PoAttachmentState.initial());
      when(() => paymentSummaryDetailsBlocMock.state)
          .thenReturn(PaymentSummaryDetailsState.initial());
      when(() => autoRouterMock.currentPath).thenReturn('/main');
      when(() => forgotPasswordBlocMock.state)
          .thenReturn(ForgotPasswordState.initial());
    });

    Future getWidget(tester) async {
      return await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          usingLocalization: true,
          providers: [
            BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock,
            ),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<AboutUsBloc>(
              create: (context) => aboutUsBlocMock,
            ),
            BlocProvider<AupTcBloc>(create: (context) => aupTcBlocMock),
            BlocProvider<CartBloc>(create: (context) => cartBlocMock),
            BlocProvider<PaymentCustomerInformationBloc>(
              create: (context) => paymentCustomerInformationBlocMock,
            ),
            BlocProvider<PaymentTermBloc>(
              create: (context) => paymentTermBlocMock,
            ),
            BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityBlocMock,
            ),
            BlocProvider<UsageCodeBloc>(
              create: (context) => usageCodeBlocMock,
            ),
            BlocProvider<MaterialListBloc>(
              create: (context) => materialListBlocMock,
            ),
            BlocProvider<MaterialFilterBloc>(
              create: (context) => materialFilterBlocMock,
            ),
            BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock,
            ),
            BlocProvider<DeepLinkingBloc>(
              create: (context) => deepLinkingBlocMock,
            ),
            BlocProvider<ViewByItemsBloc>(
              create: (context) => mockViewByItemsBloc,
            ),
            BlocProvider<ViewByOrderDetailsBloc>(
              create: (context) => mockOrderHistoryDetailsBloc,
            ),
            BlocProvider<ScanMaterialInfoBloc>(
              create: (context) => scanMaterialInfoMockBloc,
            ),
            BlocProvider<SettingBloc>(
              create: (context) => settingBlocMock,
            ),
            BlocProvider<ViewByItemFilterBloc>(
              create: (context) => mockOrderHistoryFilterBloc,
            ),
            BlocProvider<ViewByOrderBloc>(
              create: (context) => mockViewByOrderBloc,
            ),
            BlocProvider<ChatBotBloc>(
              create: (context) => chatBotBloc,
            ),
            BlocProvider<AnnouncementInfoBloc>(
              create: (context) => announcementInfoBlocMock,
            ),
            BlocProvider<MaterialPriceBloc>(
              create: (context) => mockMaterialPriceBloc,
            ),
            BlocProvider<ViewByItemDetailsBloc>(
              create: (context) => viewByItemDetailsBlocMock,
            ),
            BlocProvider<ProductDetailBloc>(
              create: (context) => productDetailBloc,
            ),
            BlocProvider<CreditAndInvoiceDetailsBloc>(
              create: (context) => creditAndInvoiceDetailsBloc,
            ),
            BlocProvider<LoginFormBloc>(create: (context) => loginFormBloc),
            BlocProvider<NotificationBloc>(
              create: (context) => mockNotificationBloc,
            ),
            BlocProvider<PriceOverrideBloc>(
              create: (context) => mockPriceOverrideBloc,
            ),
            BlocProvider<ViewByOrderFilterBloc>(
              create: (context) => viewByOrderFilterBlocMock,
            ),
            BlocProvider<PaymentSummaryDetailsBloc>(
              create: (context) => paymentSummaryDetailsBlocMock,
            ),
            BlocProvider<ProductSearchBloc>(
              create: (context) => productSearchBlocMock,
            ),
            BlocProvider<DownloadPaymentAttachmentsBloc>(
              create: (context) => downloadPaymentAttachmentsBlocMock,
            ),
            BlocProvider<AdditionalDetailsBloc>(
              create: (context) => additionalDetailsBlocMock,
            ),
            BlocProvider<ComboDealMaterialDetailBloc>(
              create: (context) => comboDealMaterialDetailBlocMock,
            ),
            BlocProvider<OrderSummaryBloc>(
              create: (context) => orderSummaryBlocMock,
            ),
            BlocProvider<AvailableCreditsBloc>(
              create: (context) => availableCreditsBlocMock,
            ),
            BlocProvider<OutstandingInvoicesBloc>(
              create: (context) => outstandingInvoicesBlocMock,
            ),
            BlocProvider<ReOrderPermissionBloc>(
              create: (context) => reOrderPermissionBlocMock,
            ),
            BlocProvider<ArticlesInfoBloc>(
              create: (context) => articlesInfoBlocMock,
            ),
            BlocProvider<ProductImageBloc>(
              create: (context) => productImageBloc,
            ),
            BlocProvider<ResetPasswordBloc>(
              create: (context) => resetPasswordBlocMock,
            ),
            BlocProvider<ArticlesInfoFilterBloc>(
              create: (context) => articlesInfoFilterBlocMock,
            ),
            BlocProvider<CustomerLicenseBloc>(
              create: (context) => customerLicenseBlocMock,
            ),
            BlocProvider<AnnouncementFilterBloc>(
              create: (context) => announcementFilterBlocMock,
            ),
            BlocProvider<PoAttachmentBloc>(
              create: (context) => poAttachmentBlocMock,
            ),
            BlocProvider<ForgotPasswordBloc>(
              create: (context) => forgotPasswordBlocMock,
            ),
          ],
          child: const SplashPage(),
        ),
      );
    }

    //commented test case reason:
    //since MixpanelService has changed we need to mock
    //the actual Mixpanel library class otherwise we will face this
    //issue:
    //The following LateError was thrown building:
    // LateInitializationError: Field 'mixpanel' has not been initialized.

    // testWidgets('When Auth State is un-authenticated', (tester) async {
    //   final expectedAuthListStates = [
    //     const AuthState.loading(),
    //     const AuthState.unauthenticated()
    //   ];
    //   whenListen(authBlocMock, Stream.fromIterable(expectedAuthListStates));
    //   await getWidget(tester);
    //   await tester.pump();
    //   final splashLoadingIndicator =
    //       find.byKey(const Key('splashLoadingIndicator'), skipOffstage: false);
    //   expect(splashLoadingIndicator, findsNWidgets(1));
    //   verify(() => userBlocMock.add(const UserEvent.initialized())).called(1);
    //   expect(autoRouterMock.current.name, LoginPageRoute.name);
    // });

    testWidgets(
        'When Auth State is authenticated and user having multiple customerCodes',
        (tester) async {
      final expectedAuthListStates = [
        const AuthState.authenticated(),
      ];
      when(
        () => autoRouterMock.replaceAll(
          const [SplashPageRoute(), HomeNavigationTabbarRoute()],
        ),
      ).thenAnswer((_) async => Future.value());
      whenListen(authBlocMock, Stream.fromIterable(expectedAuthListStates));
      await getWidget(tester);
      await tester.pump();
      verify(() => userBlocMock.add(const UserEvent.fetch())).called(1);
    });

    testWidgets('Should reset products filter', (tester) async {
      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial().copyWith(
          selectedMaterialFilter:
              MaterialFilter.empty().copyWith(isFavourite: true),
        ),
      );

      final expectedStates = [
        EligibilityState.initial().copyWith(
          shipToInfo: fakeShipToInfo,
        ),
      ];
      whenListen(eligibilityBlocMock, Stream.fromIterable(expectedStates));

      await getWidget(tester);
      await tester.pump();

      verify(
        () =>
            materialFilterBlocMock.add(const MaterialFilterEvent.resetFilter()),
      ).called(1);
    });

    testWidgets('When PaymentCustomerInformation bloc is listening',
        (tester) async {
      final fakeSalesRepInfo = SalesRepresentativeInfo.empty();
      const fakePaymentCustomerInformation = PaymentCustomerInformation(
        paymentTerm: 'paymentTerm',
        shipToInfoList: <ShipToInfo>[],
        billToInfo: [],
      );
      final expectedPaymentStates = [
        PaymentCustomerInformationState.initial(),
        PaymentCustomerInformationState.initial().copyWith(
          paymentCustomerInformation: fakePaymentCustomerInformation,
        ),
      ];

      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
      );

      when(() => salesOrgBlocMock.state).thenAnswer(
        (invocation) => SalesOrgState.initial().copyWith(
          salesOrganisation: fakeTWSalesOrganisation,
          configs: fakeTWSalesOrgConfigs,
        ),
      );

      when(() => userBlocMock.state).thenAnswer(
        (invocation) => UserState.initial().copyWith(
          salesRepInfo: fakeSalesRepInfo,
          user: fakeSalesRepUser,
        ),
      );

      whenListen(
        paymentCustomerInformationBlocMock,
        Stream.fromIterable(expectedPaymentStates),
      );

      await getWidget(tester);
      await tester.pump();

      verify(
        () => paymentTermBlocMock.add(
          PaymentTermEvent.fetch(
            customeCodeInfo: fakeCustomerCodeInfo,
            paymentCustomerInformation: fakePaymentCustomerInformation,
            salesOrganisation: fakeTWSalesOrganisation,
            salesOrganisationConfigs: fakeTWSalesOrgConfigs,
            salesRepresentativeInfo: fakeSalesRepInfo,
            user: fakeSalesRepUser,
          ),
        ),
      ).called(1);
    });

    testWidgets(
        'When PaymentCustomerInformation bloc event call when customer code changes',
        (tester) async {
      final expectedStates = [
        EligibilityState.initial(),
        EligibilityState.initial().copyWith(
          shipToInfo: fakeShipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeTWSalesOrganisation,
        ),
      ];
      whenListen(
        eligibilityBlocMock,
        Stream.fromIterable(expectedStates),
      );

      await getWidget(tester);
      await tester.pump();

      verify(
        () => paymentCustomerInformationBlocMock
            .add(const PaymentCustomerInformationEvent.initialized()),
      ).called(1);

      verify(
        () => paymentCustomerInformationBlocMock.add(
          PaymentCustomerInformationEvent.fetch(
            customeCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeTWSalesOrganisation,
            selectedShipToCode: fakeShipToInfo.shipToCustomerCode,
          ),
        ),
      ).called(1);
    });

    testWidgets('When cart bloc has error', (tester) async {
      final expectedStates = [
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: true,
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('Fake-Error'),
            ),
          ),
        ),
      ];
      whenListen(cartBlocMock, Stream.fromIterable(expectedStates));
      await getWidget(tester);
      await tester.pumpAndSettle();
      expect(find.text('Fake-Error'.tr()), findsOneWidget);
    });

    testWidgets('When user dont have state organization', (tester) async {
      final user = fakeInternalSalesRepUser.copyWith(acceptPrivacyPolicy: true);
      final expectedEligibilityStates = [
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrgConfigs: SalesOrganisationConfigs.empty(),
          user: fakeUser,
        ),
        EligibilityState.initial().copyWith(
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeTWSalesOrganisation,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: user,
        ),
      ];

      when(() => salesOrgBlocMock.state).thenAnswer(
        (invocation) => SalesOrgState.initial().copyWith(
          configs: fakeSalesOrganisationConfigs,
          salesOrganisation: fakeTWSalesOrganisation,
        ),
      );

      whenListen(
        eligibilityBlocMock,
        Stream.fromIterable(expectedEligibilityStates),
      );
      final expectedStates = [
        CartState.initial().copyWith(apiFailureOrSuccessOption: none()),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            Right([PriceAggregate.empty()]),
          ),
          isFetching: true,
        ),
      ];
      whenListen(cartBlocMock, Stream.fromIterable(expectedStates));
      final expectedUserListStates = [
        UserState.initial(),
        UserState.initial().copyWith(
          user: user,
        ),
      ];
      whenListen(userBlocMock, Stream.fromIterable(expectedUserListStates));

      await getWidget(tester);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      verify(
        () => cartBlocMock.add(
          CartEvent.initialized(
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeTWSalesOrganisation,
            salesOrganisationConfigs: fakeSalesOrganisationConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: user,
          ),
        ),
      ).called(1);
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('When user role has return admin access ', (tester) async {
      final user = fakeRootAdminUser.copyWith(acceptPrivacyPolicy: true);
      final expectedEligibilityStates = [
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrgConfigs: SalesOrganisationConfigs.empty(),
          user: fakeUser,
        ),
        EligibilityState.initial().copyWith(
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeTWSalesOrganisation,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: user,
        ),
      ];

      whenListen(
        eligibilityBlocMock,
        Stream.fromIterable(expectedEligibilityStates),
      );

      final expectedUserListStates = [
        UserState.initial(),
        UserState.initial().copyWith(
          user: user.copyWith(disableReturns: false),
        ),
      ];
      whenListen(userBlocMock, Stream.fromIterable(expectedUserListStates));

      when(() => salesOrgBlocMock.state).thenAnswer(
        (invocation) => SalesOrgState.initial().copyWith(
          configs: fakeSalesOrganisationConfigs,
          salesOrganisation: fakeTWSalesOrganisation,
        ),
      );

      await getWidget(tester);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      expect(find.byType(Scaffold), findsOneWidget);
    });

    test('testing UpgraderLocalizationMessage valid', () async {
      expect(UpgraderLocalizationMessage(), isNotNull);
      expect(
        () => UpgraderLocalizationMessage().message(UpgraderMessage.body),
        isNotNull,
      );
      expect(
        () => UpgraderLocalizationMessage()
            .message(UpgraderMessage.buttonTitleIgnore),
        isNotNull,
      );
      expect(
        () => UpgraderLocalizationMessage()
            .message(UpgraderMessage.buttonTitleLater),
        isNotNull,
      );
      expect(
        () => UpgraderLocalizationMessage().message(UpgraderMessage.prompt),
        isNotNull,
      );
      expect(
        () =>
            UpgraderLocalizationMessage().message(UpgraderMessage.releaseNotes),
        isNotNull,
      );
      expect(
        () => UpgraderLocalizationMessage().message(UpgraderMessage.title),
        isNotNull,
      );
    });

    testWidgets('Return Request Type fetch on Eligibility Change - Failure',
        (tester) async {
      final expectedStates = [EligibilityState.initial()];
      whenListen(eligibilityBlocMock, Stream.fromIterable(expectedStates));

      await getWidget(tester);
      await tester.pump();
    });

    testWidgets('When user Language Change', (tester) async {
      final expectedUserListStates = [
        UserState.initial().copyWith(
          user: fakeUser.copyWith(acceptPrivacyPolicy: true),
        ),
      ];
      whenListen(userBlocMock, Stream.fromIterable(expectedUserListStates));

      await getWidget(tester);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(
        EasyLocalization.of(tester.element(find.byType(Scaffold)))?.locale,
        const Locale('en'),
      );
    });

    testWidgets('When Login on Behalf terms and condition page not displayed',
        (tester) async {
      final expectedUserListStates = [
        UserState.initial().copyWith(
          user: fakeUser,
          isLoginOnBehalf: true,
        ),
      ];
      whenListen(userBlocMock, Stream.fromIterable(expectedUserListStates));

      await getWidget(tester);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      verifyNever(
        () => aupTcBlocMock.add(AupTcEvent.show(fakeUser)),
      );
    });

    testWidgets('When Upsert Cart But Exceed Maximum Quantity', (tester) async {
      final cartListStates = [
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.maximumCartQuantityExceed('99999'),
            ),
          ),
        ),
      ];
      whenListen(cartBlocMock, Stream.fromIterable(cartListStates));

      await getWidget(tester);
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.customSnackBar),
          matching: find.text(
            'In cart quantity should not be more than {maximumNumber}.'.tr(
              namedArgs: {
                'maximumNumber': '99999',
              },
            ),
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Chat bot error message', (tester) async {
      final expectedStates = [
        ChatBotState.initial().copyWith(
          chatbotFailureOrSuccessOption:
              optionOf(Left(FailureHandler.handleFailure('Fake-error'))),
        ),
      ];
      whenListen(chatBotBloc, Stream.fromIterable(expectedStates));

      await getWidget(tester);
      await tester.pumpAndSettle();

      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.customSnackBar),
          matching: find.textContaining('Fake-error'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('fetch product details image', (tester) async {
      final material = MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('fake-material'),
      );
      final expectedUserListStates = [
        ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            materialInfo: material,
          ),
          failureOrSuccessOption: optionOf(const Right(unit)),
        ),
      ];

      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );

      whenListen(
        productDetailBloc,
        Stream.fromIterable(expectedUserListStates),
      );

      await getWidget(tester);
    });

    testWidgets('fetch bundle details image ', (tester) async {
      final materials = [
        MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-material-1'),
        ),
        MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-material-2'),
        ),
      ];
      final expectedUserListStates = [
        ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType.bundle(),
              bundle: Bundle.empty().copyWith(
                materials: materials,
              ),
            ),
          ),
          failureOrSuccessOption: optionOf(const Right(unit)),
        ),
      ];

      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );

      whenListen(
        productDetailBloc,
        Stream.fromIterable(expectedUserListStates),
      );

      await getWidget(tester);
    });

    testWidgets(
        'When user preferred language gets updated cart initial event called',
        (tester) async {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeRootAdminUser.copyWith(
          preferredLanguage: Language('EN'),
        ),
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeTWSalesOrganisation,
        salesOrgConfigs: fakeTWSalesOrgConfigs,
        shipToInfo: fakeShipToInfo,
      );

      final expectedListStates = [
        eligibilityState.copyWith(
          user: fakeRootAdminUser.copyWith(
            preferredLanguage: Language('ZH'),
          ),
        ),
      ];
      whenListen(
        eligibilityBlocMock,
        Stream.fromIterable(expectedListStates),
        initialState: eligibilityState,
      );

      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 500));
      verify(
        () => cartBlocMock.add(
          CartEvent.initialized(
            user: fakeRootAdminUser.copyWith(
              preferredLanguage: Language('ZH'),
            ),
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeTWSalesOrganisation,
            salesOrganisationConfigs: fakeTWSalesOrgConfigs,
            shipToInfo: fakeShipToInfo,
          ),
        ),
      ).called(1);
    });

    testWidgets(
        'On Eligibility bloc customer code to change fetch new customer config',
        (tester) async {
      final expectedStates = [
        EligibilityState.initial(),
        EligibilityState.initial().copyWith(
          shipToInfo: fakeShipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
      ];
      whenListen(eligibilityBlocMock, Stream.fromIterable(expectedStates));

      await getWidget(tester);
      await tester.pump();
      verify(
        () => customerCodeBlocMock.add(
          CustomerCodeEvent.fetchCustomerCodeConfig(
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ),
      ).called(1);
    });

    testWidgets('On customer config fetch update eligibility bloc',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: fakeUser,
          salesOrganisation: fakeSalesOrganisation,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
        ),
      );
      final expectedStates = [
        CustomerCodeState.initial(),
        CustomerCodeState.initial().copyWith(
          customerCodeConfig: customerCodeConfig,
        ),
      ];
      whenListen(customerCodeBlocMock, Stream.fromIterable(expectedStates));

      await getWidget(tester);
      await tester.pump();
      verify(
        () => eligibilityBlocMock.add(
          EligibilityEvent.updatedCustomerCodeConfig(
            customerCodeConfig: customerCodeConfig,
          ),
        ),
      ).called(1);
    });

    testWidgets('On customer config fetch error', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: fakeUser,
          salesOrganisation: fakeSalesOrganisation,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
        ),
      );
      final expectedStates = [
        CustomerCodeState.initial(),
        CustomerCodeState.initial().copyWith(
          configFailureOrSuccessOption:
              optionOf(Left(FailureHandler.handleFailure('Fake-error'))),
        ),
      ];
      whenListen(customerCodeBlocMock, Stream.fromIterable(expectedStates));

      await getWidget(tester);
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.customSnackBar),
          matching: find.textContaining('Fake-error'),
        ),
        findsOneWidget,
      );
      verify(
        () => eligibilityBlocMock.add(
          EligibilityEvent.updatedCustomerCodeConfig(
            customerCodeConfig: CustomerCodeConfig.empty(),
          ),
        ),
      ).called(1);
    });

    group('Scan material -', () {
      testWidgets('Should show camera permission denied bottom sheet',
          (tester) async {
        when(
          () => autoRouterMock.popUntilRouteWithName(
            HomeNavigationTabbarRoute.name,
          ),
        ).thenAnswer((_) async => true);
        whenListen(
          scanMaterialInfoMockBloc,
          Stream.fromIterable([
            ScanMaterialInfoState.initial().copyWith(
              apiFailureOrSuccessOption: optionOf(
                const Left(ApiFailure.cameraPermissionFailed(true)),
              ),
            ),
          ]),
        );

        await getWidget(tester);
        await tester.pumpAndSettle();
        final bottomSheet = find.byType(CameraFilesPermission);
        expect(bottomSheet, findsOne);
        expect(
          find.descendant(
            of: bottomSheet,
            matching: find.text('eZRx+ is unable to turn on camera'),
          ),
          findsOne,
        );
        expect(
          find.descendant(
            of: bottomSheet,
            matching: find.text(
              'Camera access was denied. Grant camera access permission in Settings to capture photos on eZRx+.',
            ),
          ),
          findsOne,
        );
        final cancelButton = find.byKey(WidgetKeys.cancelButton);
        expect(
          find.descendant(of: cancelButton, matching: find.text('Cancel')),
          findsOne,
        );
        final openSettingButton = find.byKey(WidgetKeys.confirmButton);
        expect(
          find.descendant(
            of: openSettingButton,
            matching: find.text('Open Settings'),
          ),
          findsOne,
        );
        await tester.tap(cancelButton);
        await tester.pumpAndSettle();
        verify(
          () => autoRouterMock
              .popUntilRouteWithName(HomeNavigationTabbarRoute.name),
        ).called(1);
      });

      testWidgets('Should show gallery permission denied bottom sheet',
          (tester) async {
        when(() => autoRouterMock.maybePop()).thenAnswer((_) async => true);
        whenListen(
          scanMaterialInfoMockBloc,
          Stream.fromIterable([
            ScanMaterialInfoState.initial().copyWith(
              apiFailureOrSuccessOption: optionOf(
                const Left(ApiFailure.storagePermissionFailed()),
              ),
            ),
          ]),
        );

        await getWidget(tester);
        await tester.pumpAndSettle();
        final bottomSheet = find.byType(CameraFilesPermission);
        expect(bottomSheet, findsOne);
        expect(
          find.descendant(
            of: bottomSheet,
            matching: find.text('eZRx+ is unable to access your files'),
          ),
          findsOne,
        );
        expect(
          find.descendant(
            of: bottomSheet,
            matching: find.text(
              'Photos and files access was denied. Grant photos and files access permission in Settings to upload photos and documents on eZRx+.',
            ),
          ),
          findsOne,
        );
        final cancelButton = find.byKey(WidgetKeys.cancelButton);
        expect(
          find.descendant(of: cancelButton, matching: find.text('Cancel')),
          findsOne,
        );
        final openSettingButton = find.byKey(WidgetKeys.confirmButton);
        expect(
          find.descendant(
            of: openSettingButton,
            matching: find.text('Open Settings'),
          ),
          findsOne,
        );
        await tester.tap(cancelButton);
        await tester.pumpAndSettle();
        verify(() => autoRouterMock.maybePop()).called(1);
      });

      testWidgets('Should show scan not found bottom sheet', (tester) async {
        when(() => autoRouterMock.push(const ScanMaterialInfoRoute()))
            .thenAnswer((_) async => true);
        whenListen(
          scanMaterialInfoMockBloc,
          Stream.fromIterable([
            ScanMaterialInfoState.initial().copyWith(
              apiFailureOrSuccessOption: optionOf(
                const Left(ApiFailure.scannedProductNotFound()),
              ),
            ),
          ]),
        );

        await getWidget(tester);
        await tester.pumpAndSettle();
        final bottomSheet = find.byType(ConfirmBottomSheet);
        expect(bottomSheet, findsOne);
        expect(
          find.descendant(
            of: bottomSheet,
            matching: find.text('Unable to find this product'),
          ),
          findsOne,
        );
        expect(
          find.descendant(
            of: bottomSheet,
            matching: find.text(
              'Please try scanning different barcode',
            ),
          ),
          findsOne,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.confirmBottomSheetCancelButton),
            matching: find.text('Close'),
          ),
          findsOne,
        );
        final scanAgain =
            find.byKey(WidgetKeys.confirmBottomSheetConfirmButton);
        expect(
          find.descendant(
            of: scanAgain,
            matching: find.text('Scan again'),
          ),
          findsOne,
        );
        await tester.tap(scanAgain);
        await tester.pumpAndSettle();
        verify(() => autoRouterMock.push(const ScanMaterialInfoRoute()))
            .called(1);
      });

      testWidgets(
          'paymentSummaryDetailsBloc & creditAndInvoiceDetailsBloc call initialized independently',
          (tester) async {
        final expectedStates = [
          EligibilityState.initial(),
          EligibilityState.initial().copyWith(
            shipToInfo: fakeShipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeTWSalesOrganisation,
            user: fakeUser,
          ),
        ];
        whenListen(
          eligibilityBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await getWidget(tester);
        await tester.pump();

        verify(
          () => paymentSummaryDetailsBlocMock.add(
            PaymentSummaryDetailsEvent.initialized(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganization: fakeTWSalesOrganisation,
              shipToInfo: fakeShipToInfo,
              user: fakeUser,
            ),
          ),
        ).called(1);

        verify(
          () => creditAndInvoiceDetailsBloc.add(
            CreditAndInvoiceDetailsEvent.initialized(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeTWSalesOrganisation,
            ),
          ),
        ).called(1);
      });
    });

    group('redirect to page through url', () {
      testWidgets('When Redirecting History page - success', (tester) async {
        final expectedDeeplinkStates = [
          const DeepLinkingState.initial(),
          DeepLinkingState.linkPending(
            EzrxLink(Uri(path: '/history_details').toString()),
          ),
          DeepLinkingState.redirectOrderDetail(
            OrderNumber('fake-order-history'),
          ),
        ];
        whenListen(
          deepLinkingBlocMock,
          Stream.fromIterable(expectedDeeplinkStates),
        );
        await getWidget(tester);
        await tester.pump();
        verify(
          () => deepLinkingBlocMock.add(
            DeepLinkingEvent.consumePendingLink(
              selectedCustomerCode: CustomerCodeInfo.empty(),
              selectedShipTo: ShipToInfo.empty(),
              materialFilter: MaterialFilter.empty(),
            ),
          ),
        ).called(1);
      });
      testWidgets('When Redirecting History page -failure ', (tester) async {
        final expectedDeeplinkStates = [
          const DeepLinkingState.error(ApiFailure.orderDetailRoute()),
        ];
        whenListen(
          deepLinkingBlocMock,
          Stream.fromIterable(expectedDeeplinkStates),
        );
        await getWidget(tester);
        await tester.pumpAndSettle();
        expect(
          find.text('This order is not available on your account'),
          findsOneWidget,
        );
      });

      testWidgets(
          'When Redirecting Products tab with manufacturer name search - success',
          (tester) async {
        final link = Uri.parse(
          'https://uat-mm.ezrxplus.com/product-listing?manufacturer=Daiichi+Sankyo+%28Thailand%29+Ltd',
        );
        final parameters = EzrxLinkQueryParameter(link.queryParameters);
        final searchKey = parameters.extractMaterialNumber;

        final updatedMaterialFilter = materialFilterBlocMock
            .state.materialFilter
            .copyWith(manufactureListSelected: parameters.manufacturerList);

        when(() => autoRouterMock.navigate(const ProductsTabRoute()))
            .thenAnswer(
          (_) => Future.value(),
        );
        final expectedDeepLinkStates = [
          const DeepLinkingState.initial(),
          DeepLinkingState.linkPending(
            EzrxLink(link.toString()),
          ),
          DeepLinkingState.redirectProductsTab(
            SearchKey.search(searchKey),
            updatedMaterialFilter,
          ),
        ];
        when(() => eligibilityBlocMock.state).thenAnswer(
          (invocation) => EligibilityState.initial().copyWith(
            shipToInfo: fakeShipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeTWSalesOrganisation,
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(type: RoleType('root_admin')),
            ),
          ),
        );
        whenListen(
          deepLinkingBlocMock,
          Stream.fromIterable(expectedDeepLinkStates),
        );
        await getWidget(tester);
        await tester.pump();

        verify(
          () => materialListBlocMock.add(
            const MaterialListEvent.updateSearchKey(searchKey: ''),
          ),
        ).called(1);

        verify(
          () => materialListBlocMock.add(
            MaterialListEvent.fetch(
              selectedMaterialFilter: updatedMaterialFilter,
            ),
          ),
        ).called(1);

        verify(
          () => autoRouterMock.navigate(const ProductsTabRoute()),
        ).called(1);
      });

      testWidgets(
          'When Redirecting Products tab with unknown manufacturer name search - success',
          (tester) async {
        final link = Uri.parse(
          'https://uat-mm.ezrxplus.com/product-listing?unknown=Daiichi+Sankyo+%28Thailand%29+Ltd',
        );
        final parameters = EzrxLinkQueryParameter(link.queryParameters);
        final searchKey = parameters.extractMaterialNumber;

        final updatedMaterialFilter = materialFilterBlocMock
            .state.materialFilter
            .copyWith(manufactureListSelected: parameters.manufacturerList);

        when(() => autoRouterMock.navigate(const ProductsTabRoute()))
            .thenAnswer(
          (_) => Future.value(),
        );
        final expectedDeepLinkStates = [
          const DeepLinkingState.initial(),
          DeepLinkingState.linkPending(
            EzrxLink(link.toString()),
          ),
          DeepLinkingState.redirectProductsTab(
            SearchKey.search(searchKey),
            updatedMaterialFilter,
          ),
        ];
        when(() => eligibilityBlocMock.state).thenAnswer(
          (invocation) => EligibilityState.initial().copyWith(
            shipToInfo: fakeShipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeTWSalesOrganisation,
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(type: RoleType('root_admin')),
            ),
          ),
        );
        whenListen(
          deepLinkingBlocMock,
          Stream.fromIterable(expectedDeepLinkStates),
        );
        await getWidget(tester);
        await tester.pump();

        verify(
          () => materialListBlocMock.add(
            const MaterialListEvent.updateSearchKey(searchKey: ''),
          ),
        ).called(1);

        verify(
          () => materialListBlocMock.add(
            MaterialListEvent.fetch(
              selectedMaterialFilter: updatedMaterialFilter,
            ),
          ),
        ).called(1);

        verify(
          () => autoRouterMock.navigate(const ProductsTabRoute()),
        ).called(1);
      });

      testWidgets(
          'Unable to Redirect to Products tab with manufacturer name search, if don\'t have access - success',
          (tester) async {
        final link = Uri.parse(
          'https://uat-mm.ezrxplus.com/product-listing?manufacturer=Daiichi+Sankyo+%28Thailand%29+Ltd',
        );
        final parameters = EzrxLinkQueryParameter(link.queryParameters);
        final searchKey = parameters.extractMaterialNumber;

        final updatedMaterialFilter = materialFilterBlocMock
            .state.materialFilter
            .copyWith(manufactureListSelected: parameters.manufacturerList);

        final expectedDeepLinkStates = [
          const DeepLinkingState.initial(),
          DeepLinkingState.linkPending(
            EzrxLink(link.toString()),
          ),
          DeepLinkingState.redirectProductsTab(
            SearchKey.search(searchKey),
            updatedMaterialFilter,
          ),
        ];
        whenListen(
          deepLinkingBlocMock,
          Stream.fromIterable(expectedDeepLinkStates),
        );

        when(() => eligibilityBlocMock.state).thenAnswer(
          (invocation) => EligibilityState.initial().copyWith(
            shipToInfo: fakeShipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeTWSalesOrganisation,
            user: fakeUser, //internal sales rep
          ),
        );
        await getWidget(tester);
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byType(CustomSnackBar),
            matching: find.text('You don\'t have access'),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Unable to Redirect to Order Details Page, if don\'t have access - success',
          (tester) async {
        final link = Uri.parse(
          'https://uat-mm.ezrxplus.com/product-listing?manufacturer=Daiichi+Sankyo+%28Thailand%29+Ltd',
        );

        final expectedDeepLinkStates = [
          const DeepLinkingState.initial(),
          DeepLinkingState.linkPending(
            EzrxLink(link.toString()),
          ),
          DeepLinkingState.redirectOrderDetail(
            OrderNumber('fake-order-number'),
          ),
        ];
        whenListen(
          deepLinkingBlocMock,
          Stream.fromIterable(expectedDeepLinkStates),
        );

        when(() => eligibilityBlocMock.state).thenAnswer(
          (invocation) => EligibilityState.initial().copyWith(
            shipToInfo: fakeShipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeTWSalesOrganisation,
            user: fakeUser, //internal sales rep
          ),
        );
        await getWidget(tester);
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byType(CustomSnackBar),
            matching: find.text('You do not have access to view this order'),
          ),
          findsOneWidget,
        );
      });
    });

    testWidgets(
      'open reset password page depend on eligibleResetPassword',
      (tester) async {
        final userVariant =
            valueVariantForResetPassword.currentValue ?? User.empty();

        final isResetUserPassword = userVariant.isResetUserPassword;
        final expectedStates = [
          UserState.initial(),
          UserState.initial().copyWith(
            isLoginOnBehalf: false,
            user: userVariant.copyWith(
              acceptPrivacyPolicy: true,
            ),
          ),
        ];
        whenListen(userBlocMock, Stream.fromIterable(expectedStates));
        when(
          () => autoRouterMock.push(
            ResetPasswordPageRoute(
              isFirstLogin: true,
            ),
          ),
        ).thenAnswer((_) async => true);
        await getWidget(tester);
        await tester.pump();
        await tester.pump(
          const Duration(milliseconds: 500),
        ); //Welcome message delay duration

        if (isResetUserPassword) {
          verify(
            () => autoRouterMock.push(
              ResetPasswordPageRoute(
                isFirstLogin: true,
              ),
            ),
          ).called(1);
        } else {
          verifyNever(
            () => autoRouterMock.push(
              ResetPasswordPageRoute(
                isFirstLogin: true,
              ),
            ),
          );
        }
      },
      variant: valueVariantForResetPassword,
    );

    testWidgets('When Redirecting About Us Page', (tester) async {
      final link = Uri.parse(
        'https://uat-id.ezrxplus.com/about-us',
      );

      when(() => autoRouterMock.push(const AboutUsPageRoute())).thenAnswer(
        (_) => Future.value(),
      );
      final expectedDeepLinkStates = [
        const DeepLinkingState.initial(),
        DeepLinkingState.linkPending(
          EzrxLink(link.toString()),
        ),
        const DeepLinkingState.redirectAboutUs(),
      ];
      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          shipToInfo: fakeShipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeTWSalesOrganisation,
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('root_admin')),
          ),
        ),
      );
      whenListen(
        deepLinkingBlocMock,
        Stream.fromIterable(expectedDeepLinkStates),
      );
      await getWidget(tester);
      await tester.pump();

      verify(
        () => autoRouterMock.push(const AboutUsPageRoute()),
      ).called(1);
    });

    testWidgets('Log user out when get user api failure', (tester) async {
      whenListen(
        userBlocMock,
        Stream.fromIterable([
          UserState.initial().copyWith(
            userFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-message'))),
          ),
        ]),
      );
      await getWidget(tester);
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
      verify(
        () => authBlocMock.add(
          const AuthEvent.logout(),
        ),
      ).called(1);
    });
    testWidgets('Should refresh product tab when select new order type',
        (tester) async {
      final fakeEligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrgConfigs: fakeMYSalesOrgConfigs,
        salesOrganisation: fakeMYSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
      );
      whenListen(
        eligibilityBlocMock,
        Stream.fromIterable([
          fakeEligibilityState,
          fakeEligibilityState.copyWith
              .user(selectedOrderType: DocumentType.zpor()),
        ]),
      );
      await getWidget(tester);
      await tester.pumpAndSettle();

      verify(
        () => materialListBlocMock.add(
          MaterialListEvent.initialized(
            user: fakeUser.copyWith(selectedOrderType: DocumentType.zpor()),
            configs: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            selectedMaterialFilter: MaterialFilter.empty(),
          ),
        ),
      ).called(1);
    });

    testWidgets(' -> displays error message', (WidgetTester tester) async {
      final expectedStates = [
        ForgotPasswordState.initial(),
        ForgotPasswordState.initial().copyWith(
          resetPasswordFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('Fake-Error'),
            ),
          ),
          isSubmitting: true,
        ),
      ];
      whenListen(forgotPasswordBlocMock, Stream.fromIterable(expectedStates));
      await getWidget(tester);
      await tester.pumpAndSettle();
      expect(find.text(('Fake-Error')), findsOneWidget);
    });

    testWidgets(
        ' -> navigates to forgot password confirmation page successfully',
        (WidgetTester tester) async {
      final expectedStates = [
        ForgotPasswordState.initial().copyWith(
          resetPasswordFailureOrSuccessOption: none(),
        ),
        ForgotPasswordState.initial().copyWith(
          resetPasswordFailureOrSuccessOption: optionOf(
            Right(
              ForgotPassword.empty().copyWith(
                email: 'fake.username@email.com',
                success: true,
              ),
            ),
          ),
        ),
      ];
      when(
        () => autoRouterMock.push(const ForgetPasswordConfirmationPageRoute()),
      ).thenAnswer((_) async => true);
      whenListen(forgotPasswordBlocMock, Stream.fromIterable(expectedStates));
      await getWidget(tester);
      await tester.pumpAndSettle();

      verify(
        () => autoRouterMock.push(const ForgetPasswordConfirmationPageRoute()),
      ).called(1);
    });

    testWidgets(
        'Should navigate to view by order detail when order fetched not empty',
        (tester) async {
      final fakeUser = User.empty().copyWith.role(type: RoleType('root_admin'));
      when(
        () => autoRouterMock.push(const ViewByOrderDetailsPageRoute()),
      ).thenAnswer((_) async => true);
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: fakeUser,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeSalesOrganisation,
        ),
      );

      final expectedStates = [
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: true,
        ),
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: orderHistoryDetails,
        ),
      ];
      whenListen(
        mockOrderHistoryDetailsBloc,
        Stream.fromIterable(expectedStates),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();

      verify(
        () => autoRouterMock.push(const ViewByOrderDetailsPageRoute()),
      ).called(1);
    });

    testWidgets('Should show snackbar when order fetched empty',
        (tester) async {
      final fakeUser = User.empty().copyWith.role(type: RoleType('root_admin'));

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: fakeUser,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeSalesOrganisation,
        ),
      );

      final expectedStates = [
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: true,
        ),
        ViewByOrderDetailsState.initial(),
      ];
      whenListen(
        mockOrderHistoryDetailsBloc,
        Stream.fromIterable(expectedStates),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();

      expect(
        find.descendant(
          of: find.byType(CustomSnackBar),
          matching: find.text(
            'You do not have access to view this order',
          ),
        ),
        findsOneWidget,
      );
      verifyNever(
        () => autoRouterMock.push(const ViewByOrderDetailsPageRoute()),
      );
    });
  });
}
