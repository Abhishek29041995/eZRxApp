import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/application/notification/notification_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/access_right.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/notification/entities/notification.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_license_local.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/notification/datasource/notification_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/browse_products/browse_products.dart';
import 'package:ezrxmobile/presentation/home/bundle_section/bundle_section.dart';
import 'package:ezrxmobile/presentation/home/home_tab.dart';
import 'package:ezrxmobile/presentation/home/product_offer_section/product_offer_section.dart';
import 'package:ezrxmobile/presentation/home/widgets/explore_marketplace_banner.dart';
import 'package:ezrxmobile/presentation/home/widgets/quick_access_menu.dart';
import 'package:ezrxmobile/presentation/home_tab.dart';
import 'package:ezrxmobile/presentation/orders/recent_order/recent_order_section.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';

import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:upgrader/upgrader.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../common_mock_data/customer_code_mock.dart';
import '../../common_mock_data/mock_bloc.dart';
import '../../common_mock_data/mock_other.dart';
import '../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../common_mock_data/sales_organsiation_mock.dart';
import '../../common_mock_data/user_mock.dart';
import '../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.logger.enableLevels = [];
  late CustomerCodeBlocMock mockCustomerCodeBloc;
  late SalesOrgBlocMock salesOrgBlocMock;
  late NotificationBloc notificationBlocMock;
  late MaterialListBloc materialListBlocMock;
  late ViewByItemsBloc viewByItemsBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late MaterialPriceBlocMock materialPriceBlocMock;
  late CartBlocMock cartBlocMock;
  late BannerBloc mockBannerBloc;
  late AuthBloc authBlocMock;
  late AupTcBlocMock mockAupTcBloc;
  late AnnouncementBloc announcementBlocMock;
  late UserBlocMock userBlocMock;
  late AppRouter autoRouterMock;
  late ProductSearchBloc productSearchBlocMock;
  late AnnouncementInfoBlocMock announcementInfoBlocMock;
  late ProductImageBlocMock productImageBlocMock;
  late Notifications notifications;
  late DeepLinkingBloc deepLinkingBlocMock;
  late List<MaterialInfo> bundles;
  late CustomerLicenseBloc customerLicenseBlocMock;
  late List<CustomerLicense> customerLicense;

  final fakeUser = User.empty().copyWith(
    username: Username('fake-user'),
    role: Role.empty().copyWith(
      type: RoleType('client'),
    ),
    acceptPrivacyPolicy: true,
    enableOrderType: true,
  );

  final fakeCustomerCodeInfo = CustomerCodeInfo.empty().copyWith(
    customerCodeSoldTo: 'fake-1234',
  );
  final fakeSalesOrganisation =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601'));

  setUpAll(() async {
    locator.registerFactory(() => mockCustomerCodeBloc);
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerFactory(() => mockBannerBloc);
    locator.registerLazySingleton(() => eligibilityBlocMock);
    autoRouterMock = locator<AppRouter>();
    locator.registerFactory(() => materialListBlocMock);
    locator.registerFactory(() => viewByItemsBlocMock);
    locator.registerFactory(() => notificationBlocMock);
    notifications = await NotificationLocalDataSource().getNotificationList();
    bundles = (await MaterialListLocalDataSource().getProductList()).products;
    customerLicense =
        await CustomerLicenseLocalDataSource().getCustomerLicense();
    locator.registerLazySingleton(
      () => Upgrader(),
    );
  });

  group('Home Tab Screen', () {
    setUp(() {
      mockCustomerCodeBloc = CustomerCodeBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      deepLinkingBlocMock = DeepLinkingBlocMock();
      materialListBlocMock = MaterialListBlocMock();
      viewByItemsBlocMock = ViewByItemsBlocMock();
      materialPriceBlocMock = MaterialPriceBlocMock();
      mockBannerBloc = BannerBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      userBlocMock = UserBlocMock();
      cartBlocMock = CartBlocMock();
      mockAupTcBloc = AupTcBlocMock();

      productSearchBlocMock = ProductSearchBlocMock();
      announcementInfoBlocMock = AnnouncementInfoBlocMock();
      productImageBlocMock = ProductImageBlocMock();
      notificationBlocMock = NotificationBlocMock();
      customerLicenseBlocMock = CustomerLicenseBlocMock();

      VisibilityDetectorController.instance.updateInterval = Duration.zero;

      when(() => mockAupTcBloc.state).thenReturn(
        AupTcState.initial().copyWith(
          privacyConsent: false,
          tncConsent: false,
        ),
      );
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial()
            .copyWith(salesOrganisation: fakeSalesOrganisation),
      );
      when(() => deepLinkingBlocMock.state)
          .thenReturn(const DeepLinkingState.initial());
      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial(),
      );
      when(() => notificationBlocMock.state).thenReturn(
        NotificationState.initial(),
      );
      when(() => customerLicenseBlocMock.state)
          .thenReturn(CustomerLicenseState.initial());
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => viewByItemsBlocMock.state)
          .thenReturn(ViewByItemsState.initial());
      when(() => mockCustomerCodeBloc.state).thenReturn(
        CustomerCodeState.initial(),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo:
              fakeCustomerCodeInfo.copyWith(status: Status('EDI')),
          user: fakeUser,
        ),
      );
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => mockBannerBloc.state).thenReturn(
        BannerState.initial().copyWith(
          banner: [EZReachBanner.empty()],
        ),
      );
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => productSearchBlocMock.state).thenReturn(
        ProductSearchState.initial(),
      );
      when(() => announcementInfoBlocMock.state).thenReturn(
        AnnouncementInfoState.initial().copyWith(
          isLoading: false,
        ),
      );
      when(() => productImageBlocMock.state).thenReturn(
        ProductImageState.initial(),
      );
    });

    Widget getWidget({
      widget = const HomeTab(),
    }) =>
        WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          usingLocalization: true,
          useMediaQuery: false,
          providers: [
            BlocProvider<AupTcBloc>(create: (context) => mockAupTcBloc),
            BlocProvider<SalesOrgBloc>(
              create: (context) => salesOrgBlocMock,
            ),
            BlocProvider<NotificationBloc>(
              create: (context) => notificationBlocMock,
            ),
            BlocProvider<DeepLinkingBloc>(
              create: (context) => deepLinkingBlocMock,
            ),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => mockCustomerCodeBloc,
            ),
            BlocProvider<ViewByItemsBloc>(
              create: (context) => viewByItemsBlocMock,
            ),
            BlocProvider<MaterialListBloc>(
              create: (context) => materialListBlocMock,
            ),
            BlocProvider<MaterialPriceBloc>(
              create: (context) => materialPriceBlocMock,
            ),
            BlocProvider<CartBloc>(create: (context) => cartBlocMock),
            BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityBlocMock,
            ),
            BlocProvider<BannerBloc>(create: (context) => mockBannerBloc),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock,
            ),
            BlocProvider<ProductSearchBloc>(
              create: (context) => productSearchBlocMock,
            ),
            BlocProvider<AnnouncementInfoBloc>(
              create: (context) => announcementInfoBlocMock,
            ),
            BlocProvider<ProductImageBloc>(
              create: (context) => productImageBlocMock,
            ),
            BlocProvider<CustomerLicenseBloc>(
              create: (context) => customerLicenseBlocMock,
            ),
          ],
          child: widget,
          routeName: HomeNavigationTabbarRoute.name,
        );

    testWidgets(
      ' -> Find HomeScreen',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: User.empty().copyWith(
              accessRight: AccessRight.empty().copyWith(products: true),
              role: Role.empty().copyWith(
                type: RoleType('client_user'),
              ),
            ),
            shipToInfo: fakeShipToInfo,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final homeScreen = find.byKey(
          WidgetKeys.homeScreen,
        );
        expect(homeScreen, findsOneWidget);
        expect(find.byType(ProductsOnOffer), findsOneWidget);
        expect(find.byType(BundleSection), findsOneWidget);
        expect(find.byType(BrowseProduct), findsOneWidget);
      },
    );

    testWidgets(
      ' -> Find HomeScreen disable promotion on ID market',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: User.empty().copyWith(
              accessRight: AccessRight.empty().copyWith(products: true),
              role: Role.empty().copyWith(
                type: RoleType('client_user'),
              ),
            ),
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            shipToInfo: fakeShipToInfo,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final homeScreen = find.byKey(
          WidgetKeys.homeScreen,
        );
        expect(homeScreen, findsOneWidget);
        expect(find.byType(ProductsOnOffer), findsNothing);
        expect(find.byType(BundleSection), findsNothing);
        expect(find.byType(BrowseProduct), findsOneWidget);
      },
    );

    testWidgets(
      ' -> HomeScreen on refresh',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: User.empty().copyWith(
              accessRight: AccessRight.empty().copyWith(products: true),
              role: Role.empty().copyWith(
                type: RoleType('client_user'),
              ),
              userSalesOrganisations: [
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2001')),
              ],
            ),
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        await tester.pump(const Duration(milliseconds: 100));
        final handle = tester.ensureSemantics();

        final homeScreen = find.byKey(
          WidgetKeys.homeScreen,
        );
        expect(homeScreen, findsOneWidget);
        await tester.dragUntilVisible(
          find.byType(
            RefreshProgressIndicator,
          ),
          find.byType(
            QuickAccessMenuPanel,
          ),
          const Offset(0.0, 1000.0),
        );
        await tester.pump(const Duration(seconds: 1));
        expect(
          find.byType(RefreshProgressIndicator),
          findsOneWidget,
        );
        await tester.pump(const Duration(milliseconds: 300));
        verify(
          () => salesOrgBlocMock.add(
            SalesOrgEvent.loadSavedOrganisation(
              salesOrganisations: [
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2001')),
              ],
            ),
          ),
        ).called(1);
        handle.dispose();
      },
    );

    testWidgets(
      ' -> Find customer blocked banner',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            shipToInfo: ShipToInfo.empty()
                .copyWith(customerBlock: CustomerBlock('blocked')),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final homeScreen = find.byKey(
          WidgetKeys.homeScreen,
        );
        final customerBlockedBanner =
            find.byKey(WidgetKeys.customerBlockedBanner);
        expect(homeScreen, findsOneWidget);
        expect(customerBlockedBanner, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Find customer blocked banner not visible when value of customerBlock field is not blocked for ID market',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo.copyWith(
              status: Status('01 - Overall Blocked'),
            ),
            shipToInfo: fakeShipToInfo.copyWith(
              customerBlock: CustomerBlock('not blocked'),
              status: Status('01 - Overall Blocked'),
            ),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final homeScreen = find.byKey(
          WidgetKeys.homeScreen,
        );
        final customerBlockedBanner =
            find.byKey(WidgetKeys.customerBlockedBanner);
        expect(homeScreen, findsOneWidget);
        expect(customerBlockedBanner, findsNothing);
      },
    );
    testWidgets(
      ' -> Find Bundle Section for id market',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeRootAdminUser,
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bundlesFinder = find.byType(BundleSection);
        expect(bundlesFinder, findsNothing);
      },
    );

    testWidgets(
      ' -> Find material description in Bundle Section',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            user: fakeRootAdminUser,
            shipToInfo: fakeShipToInfo,
          ),
        );
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: bundles,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final homeScreen = find.byKey(
          WidgetKeys.homeScreen,
        );
        final description =
            find.text('\u2022  Entresto FCT 100mg 56s (4X14) SG');
        expect(homeScreen, findsOneWidget);

        expect(find.byType(BundleSection), findsOneWidget);
        expect(description, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Recently ordered section not visible when user does not have access to order history tab',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeExternalSalesRepUser.copyWith(
              accessRight: AccessRight.empty().copyWith(
                orders: false,
              ),
            ),
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final recentOrderFinder = find.byType(RecentOrdersSection);
        expect(recentOrderFinder, findsNothing);
      },
    );

    testWidgets(
      ' -> Recently ordered section visible when user have access to order history tab',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeExternalSalesRepUser.copyWith(
              accessRight: AccessRight.empty().copyWith(
                orders: true,
              ),
            ),
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeShipToInfo,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final recentOrderFinder = find.byType(RecentOrdersSection);
        expect(recentOrderFinder, findsOneWidget);
      },
    );

    group('HomeQuickAccessPaymentsMenu Test', () {
      testWidgets(
        ' -> Hide homeQuickAccessPaymentsMenu when Enable Payment Configuration is off',
        (WidgetTester tester) async {
          VisibilityDetectorController.instance.updateInterval = Duration.zero;
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: SalesOrganisation.empty().copyWith(
                //Philippine market: ZPC PH
                salesOrg: SalesOrg('2500'),
              ),
              salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
                //Enable Payment Configuration is off
                disablePayment: true,
              ),
            ),
          );
          when(() => userBlocMock.state).thenReturn(
            UserState.initial().copyWith(
              user: User.empty().copyWith(
                role: Role.empty().copyWith(
                  type: RoleType('client_user'),
                ),
              ),
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();
          final homeQuickAccessPaymentsMenu =
              find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
          expect(homeQuickAccessPaymentsMenu, findsNothing);
        },
      );

      testWidgets(
        ' -> Show homeQuickAccessPaymentsMenu when Enable Payment Configuration is on',
        (WidgetTester tester) async {
          VisibilityDetectorController.instance.updateInterval = Duration.zero;
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakePHSalesOrganisation,
              salesOrgConfigs: fakePHSalesOrgConfigs,
              user: fakeClientUser,
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();
          final homeQuickAccessPaymentsMenu =
              find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
          expect(homeQuickAccessPaymentsMenu, findsOneWidget);
        },
      );

      testWidgets(
        ' -> show homeQuickAccessEZPointMenu for ID',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: SalesOrganisation.empty().copyWith(
                //For ID market
                salesOrg: SalesOrg('1900'),
              ),
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();

          expect(find.text('eZPoint'), findsOneWidget);
          final homeQuickAccessEZPointMenu =
              find.byKey(WidgetKeys.homeQuickAccessEZPointMenu);
          expect(homeQuickAccessEZPointMenu, findsOneWidget);
        },
      );

      testWidgets(
        ' -> hide homeQuickAccessEZPointMenu for other market',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: SalesOrganisation.empty().copyWith(
                //For SG market
                salesOrg: SalesOrg('2601'),
              ),
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();
          expect(find.text('eZPoint'), findsNothing);
          final homeQuickAccessEZPointMenu =
              find.byKey(WidgetKeys.homeQuickAccessEZPointMenu);
          expect(homeQuickAccessEZPointMenu, findsNothing);
        },
      );

      group('MP payment', () {
        testWidgets('visible when user can access marketplace', (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              user: fakeClientUserAccessMarketPlace,
              customerCodeInfo: fakeMarketPlaceCustomerCode,
              shipToInfo: fakeShipToInfo,
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();

          final icon = find.byKey(WidgetKeys.homeQuickAccessMPPaymentsMenu);
          expect(icon, findsOneWidget);
          expect(
            find.descendant(of: icon, matching: find.text('MP Payments')),
            findsOneWidget,
          );

          await tester.tap(icon);
          await tester.pumpAndSettle();
          expect(
            autoRouterMock.current.name,
            PaymentPageRoute(isMarketPlace: true).routeName,
          );
        });

        testWidgets('not visible when user can not access marketplace',
            (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              user: fakeClient,
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();

          expect(
            find.byKey(WidgetKeys.homeQuickAccessMPPaymentsMenu),
            findsNothing,
          );
        });
      });

      group('Customer code config - disablePayments', () {
        testWidgets(
          ' -> show homeQuickAccessPaymentsMenu for disablePayments is false',
          (WidgetTester tester) async {
            when(() => eligibilityBlocMock.state).thenReturn(
              EligibilityState.initial().copyWith(
                salesOrganisation: fakeSGSalesOrganisation,
                salesOrgConfigs:
                    fakeSGSalesOrgConfigs.copyWith(disablePayment: false),
                customerCodeConfig: CustomerCodeConfig.empty().copyWith(
                  disablePayments: false,
                ),
                user: fakeClientUser.copyWith(disablePaymentAccess: false),
              ),
            );

            await tester.pumpWidget(getWidget());
            await tester.pump();
            final homeQuickAccessPaymentsMenu =
                find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
            expect(homeQuickAccessPaymentsMenu, findsOneWidget);
          },
        );
        testWidgets(
          ' -> hide homeQuickAccessPaymentsMenu for disablePayments is true',
          (WidgetTester tester) async {
            when(() => eligibilityBlocMock.state).thenReturn(
              EligibilityState.initial().copyWith(
                salesOrganisation: fakeSGSalesOrganisation,
                salesOrgConfigs:
                    fakeSGSalesOrgConfigs.copyWith(disablePayment: false),
                customerCodeConfig: CustomerCodeConfig.empty().copyWith(
                  disablePayments: true,
                ),
                user: fakeClientUser,
              ),
            );

            await tester.pumpWidget(getWidget());
            await tester.pump();
            final homeQuickAccessPaymentsMenu =
                find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
            expect(homeQuickAccessPaymentsMenu, findsNothing);
          },
        );
      });
    });

    group('Product accessright false', () {
      setUp(() {
        final fakeUser = User.empty().copyWith(
          accessRight: AccessRight.empty().copyWith(products: false),
          role: Role.empty().copyWith(type: RoleType('client_user')),
        );
        when(
          () => userBlocMock.state,
        ).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );
      });

      testWidgets('Product SearchBar Hidden when product accessright is false',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productSearchBar = find.byKey(WidgetKeys.homeProductSearchBar);
        expect(productSearchBar, findsNothing);
      });

      testWidgets('ProductsOnOffer Hidden when product accessright is false',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productsOnOffer = find.byType(ProductsOnOffer);
        expect(productsOnOffer, findsNothing);
      });

      testWidgets('BundleSection Hidden when product accessright is false',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bundleSection = find.byType(BundleSection);
        expect(bundleSection, findsNothing);
      });

      testWidgets('BrowseProduct Hidden when product accessright is false',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final browseProduct = find.byType(BrowseProduct);
        expect(browseProduct, findsNothing);
      });

      testWidgets('ProductTab Hidden when product accessright is false',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productTab = find.byKey(WidgetKeys.productsTab);
        expect(productTab, findsNothing);
      });
    });

    group('Product access right is true', () {
      setUp(() {
        final fakeUser = User.empty().copyWith(
          accessRight: AccessRight.empty().copyWith(products: true),
          role: Role.empty().copyWith(type: RoleType('client_user')),
          acceptPrivacyPolicy: true,
        );
        when(
          () => userBlocMock.state,
        ).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );
        when(
          () => eligibilityBlocMock.state,
        ).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeUser,
            shipToInfo: fakeShipToInfo,
          ),
        );
      });
      testWidgets('Product SearchBar Visible when product accessright is true',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productSearchBar = find.byKey(WidgetKeys.homeProductSearchBar);
        expect(productSearchBar, findsOneWidget);
      });

      testWidgets('ProductsOnOffer Visible when product accessright is true',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productsOnOffer = find.byType(ProductsOnOffer);
        expect(productsOnOffer, findsOneWidget);
      });

      testWidgets('BundleSection Visible when product accessright is true',
          (tester) async {
        final materialListBloc = locator<MaterialListBloc>();
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeRootAdminUser,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
          ),
        );
        whenListen(
          eligibilityBlocMock,
          Stream.fromIterable([
            EligibilityState.initial().copyWith(isLoadingCustomerCode: true),
            EligibilityState.initial().copyWith(isLoadingCustomerCode: false),
          ]),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bundleSection = find.byType(BundleSection);
        expect(bundleSection, findsOneWidget);
        verify(
          () => materialListBloc.add(
            MaterialListEvent.initialized(
              user: fakeRootAdminUser,
              configs: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
              shipToInfo: fakeShipToInfo,
              selectedMaterialFilter: MaterialFilter.empty().copyWith(
                bundleOffers: true,
              ),
            ),
          ),
        ).called(1);
      });

      testWidgets('BrowseProduct Visible when product accessright is true',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final browseProduct = find.byType(BrowseProduct);
        expect(browseProduct, findsOneWidget);
      });

      testWidgets('ProductTab Visible when product accessright is true',
          (tester) async {
        await tester.pumpWidget(
          getWidget(widget: const HomeNavigationTabbar()),
        );
        await tester.pump();

        final productTab = find.byKey(WidgetKeys.productsTab);
        expect(productTab, findsOneWidget);
      });
    });

    group('AdminOrderAccess', () {
      setUp(() {
        final fakeUser = User.empty().copyWith(
          accessRight: AccessRight.empty().copyWith(products: false),
          role: Role.empty().copyWith(type: RoleType('root_admin')),
          acceptPrivacyPolicy: true,
        );
        when(
          () => eligibilityBlocMock.state,
        ).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeUser,
            shipToInfo: fakeShipToInfo,
          ),
        );
      });

      testWidgets(
          'Product SearchBar Visible when user role has AdminOrderAccess',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productSearchBar = find.byKey(WidgetKeys.homeProductSearchBar);
        expect(productSearchBar, findsOneWidget);
      });

      testWidgets('ProductsOnOffer Visible when user role has AdminOrderAccess',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productsOnOffer = find.byType(ProductsOnOffer);
        expect(productsOnOffer, findsOneWidget);
      });

      testWidgets('BundleSection Visible when user role has AdminOrderAccess',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bundleSection = find.byType(BundleSection);
        expect(bundleSection, findsOneWidget);
      });

      testWidgets('BrowseProduct Visible when user role has AdminOrderAccess',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final browseProduct = find.byType(BrowseProduct);
        expect(browseProduct, findsOneWidget);
      });

      testWidgets('ProductTab Visible when user role has AdminOrderAccess',
          (tester) async {
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );
        await tester.pumpWidget(
          getWidget(widget: const HomeNavigationTabbar()),
        );
        await tester.pump();

        final productTab = find.byKey(WidgetKeys.productsTab);
        expect(productTab, findsOneWidget);
      });
    });

    group('ReturnRole', () {
      setUp(() {
        final fakeUser = User.empty().copyWith(
          accessRight: AccessRight.empty().copyWith(products: true),
          role: Role.empty().copyWith(type: RoleType('return_admin')),
          acceptPrivacyPolicy: true,
        );
        when(
          () => userBlocMock.state,
        ).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );
      });

      testWidgets(
          'Product SearchBar Hidden when product accessright is true and user role is return',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productSearchBar = find.byKey(WidgetKeys.homeProductSearchBar);
        expect(productSearchBar, findsNothing);
      });

      testWidgets(
          'ProductsOnOffer Hidden when product accessright is true and user role is return',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productsOnOffer = find.byType(ProductsOnOffer);
        expect(productsOnOffer, findsNothing);
      });

      testWidgets(
          'BundleSection Hidden when product accessright is true and user role is return',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bundleSection = find.byType(BundleSection);
        expect(bundleSection, findsNothing);
      });

      testWidgets(
          'BrowseProduct Hidden when product accessright is true and user role is return',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final browseProduct = find.byType(BrowseProduct);
        expect(browseProduct, findsNothing);
      });

      testWidgets(
          'ProductTab Hidden when product accessright is true and user role is return',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productTab = find.byKey(WidgetKeys.productsTab);
        expect(productTab, findsNothing);
      });

      testWidgets(
          'Find notification with badge icon when there is unread notification present',
          (tester) async {
        when(() => notificationBlocMock.state).thenReturn(
          NotificationState.initial().copyWith(
            notificationList: notifications,
          ),
        );
        await tester
            .pumpWidget(getWidget(widget: const HomeNavigationTabbar()));
        await tester.pump();

        final notificationWithBadgeIcon =
            find.byKey(WidgetKeys.notificationBadge);

        expect(notificationWithBadgeIcon, findsOneWidget);
      });

      testWidgets(
          'notification with badge icon not visible when there is no unread notification present',
          (tester) async {
        when(() => notificationBlocMock.state).thenReturn(
          NotificationState.initial().copyWith(
            notificationList: notifications.copyWith(
              notificationData: [
                notifications.notificationData.first.copyWith(
                  isRead: true,
                ),
              ],
            ),
          ),
        );
        await tester
            .pumpWidget(getWidget(widget: const HomeNavigationTabbar()));
        await tester.pump();

        final notificationWithBadgeIcon =
            find.byKey(WidgetKeys.notificationBadge);

        expect(notificationWithBadgeIcon, findsNothing);
      });
    });

    group(
      'Explore marketplace banner -',
      () {
        testWidgets('Visible when can access marketplace', (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              user: fakeClientUserAccessMarketPlace,
              salesOrgConfigs: fakeMYSalesOrgConfigs,
              customerCodeInfo: fakeMarketPlaceCustomerCode,
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();

          expect(find.byType(ExploreMarketPlaceBanner), findsOneWidget);
        });

        testWidgets(
            'Find Account suspended banner when CustomerCodeInfo is blocked',
            (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              customerCodeInfo: fakeBlockedCustomerCodeInfo,
            ),
          );
          await tester.pumpWidget(getWidget());

          await tester.pump();
          final accountSuspendedBanner =
              find.byKey(WidgetKeys.customerBlockedBanner);
          expect(accountSuspendedBanner, findsOneWidget);
        });

        testWidgets('Not visible when can not access marketplace',
            (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              user: fakeClientUser,
              salesOrgConfigs: fakeMYSalesOrgConfigs,
              customerCodeInfo: fakeMarketPlaceCustomerCode,
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();

          expect(find.byType(ExploreMarketPlaceBanner), findsNothing);
        });
        testWidgets('DeepLinkingBloc & salesOrgBloc initializes correctly',
            (WidgetTester tester) async {
          whenListen(
            eligibilityBlocMock,
            Stream.fromIterable([
              EligibilityState.initial().copyWith(
                isLoadingCustomerCode: true,
              ),
              EligibilityState.initial().copyWith(
                isLoadingCustomerCode: false,
              ),
            ]),
          );

          await tester.pumpWidget(
            getWidget(widget: const HomeNavigationTabbar()),
          );
          await tester.pump();

          verify(
            () => deepLinkingBlocMock.add(const DeepLinkingEvent.initialize()),
          ).called(1);
        });
      },
    );

    testWidgets('Home page Ships To Code AccountSuspendedBanner ',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          shipToInfo: fakeBlockedShipToInfo,
        ),
      );
      await tester.pumpWidget(getWidget());

      await tester.pump();
      final accountSuspendedBanner =
          find.byKey(WidgetKeys.customerBlockedBanner);
      expect(accountSuspendedBanner, findsOneWidget);

      expect(
        find.descendant(
          of: accountSuspendedBanner,
          matching: find.text(
            'Your account is blocked.'.tr(),
          ),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: accountSuspendedBanner,
          matching: find.text(
            'To continue using eZRx+, please contact your system administrator.'
                .tr(),
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets(
      ' -> Find edi if customer info status is edi',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeEDICustomerCodeInfo,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final homeScreen = find.byKey(
          WidgetKeys.homeScreen,
        );
        final ediBanner = find.byKey(WidgetKeys.ediUserBanner);
        final ediBannerTitle = find.text('You are an EDI customer.');
        final ediBannerSubTitle = find.text(
          'Ordering is disabled on eZRx+, please place your orders through the EDI system only.',
        );
        expect(homeScreen, findsOneWidget);
        expect(ediBanner, findsOneWidget);
        expect(ediBannerTitle, findsOneWidget);
        expect(ediBannerSubTitle, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Not Find edi if customer info status is not edi',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final homeScreen = find.byKey(
          WidgetKeys.homeScreen,
        );
        final ediBanner = find.byKey(WidgetKeys.ediUserBanner);
        final ediBannerTitle = find.text('You are an EDI customer.');
        final ediBannerSubTitle = find.text(
          'Ordering is disabled on eZRx+, please place your orders through the EDI system only.',
        );
        expect(homeScreen, findsOneWidget);
        expect(ediBanner, findsNothing);
        expect(ediBannerTitle, findsNothing);
        expect(ediBannerSubTitle, findsNothing);
      },
    );

    testWidgets(
      ' -> License expired banner not visible in home tab',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        when(() => customerLicenseBlocMock.state).thenReturn(
          CustomerLicenseState.initial().copyWith(customerLicenses: []),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final licenseExpiredBanner =
            find.byKey(WidgetKeys.licenseExpiredBanner);
        final licenseExpiredBannerTitle = find
            .text('You have licenses that are about to expire or has expired.');
        final licenseExpiredBannerSubTitle = find.text(
          'To continue using eZRx+, please renew your license.',
        );

        expect(licenseExpiredBanner, findsNothing);
        expect(licenseExpiredBannerTitle, findsNothing);
        expect(licenseExpiredBannerSubTitle, findsNothing);
      },
    );

    testWidgets(
      ' -> Find License expired banner in home tab',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            shipToInfo: fakeShipToInfo,
          ),
        );

        final expectedStates = [
          CustomerLicenseState.initial().copyWith(
            salesOrganization: fakeIDSalesOrganisation,
          ),
          CustomerLicenseState.initial().copyWith(
            customerLicenses: customerLicense,
            salesOrganization: fakeIDSalesOrganisation,
          ),
        ];
        whenListen(
          customerLicenseBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final licenseExpiredBanner =
            find.byKey(WidgetKeys.licenseExpiredBanner);

        final licenseExpiredBannerTitle = find
            .text('You have licenses that are about to expire or has expired.');
        final licenseExpiredBannerSubTitle = find.text(
          'To continue using eZRx+, please renew your license.',
        );

        expect(licenseExpiredBanner, findsOneWidget);
        expect(licenseExpiredBannerTitle, findsOneWidget);
        expect(licenseExpiredBannerSubTitle, findsOneWidget);

        await tester.pumpAndSettle();
      },
    );

    testWidgets(
      ' -> License expired banner not visible in home tab',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        when(() => customerLicenseBlocMock.state).thenReturn(
          CustomerLicenseState.initial().copyWith(customerLicenses: []),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final licenseExpiredBanner =
            find.byKey(WidgetKeys.licenseExpiredBanner);
        final licenseExpiredBannerTitle = find
            .text('You have licenses that are about to expire or has expired.');
        final licenseExpiredBannerSubTitle = find.text(
          'To continue using eZRx+, please renew your license.',
        );

        expect(licenseExpiredBanner, findsNothing);
        expect(licenseExpiredBannerTitle, findsNothing);
        expect(licenseExpiredBannerSubTitle, findsNothing);
      },
    );

    testWidgets(
      ' -> Stock Info banner visible in home tab',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            isStockInfoNotAvailable: true,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final stockInfoBanner = find.byKey(WidgetKeys.stockInfoBanner);
        final stockInfoBannerTitle = find.text('Stock status not available:');
        final stockInfoBannerSubTitle = find.text(
          'Please note that stock information is not available at the moment. While you can still place orders, fulfilment will be subjected to available stock levels.',
        );

        expect(stockInfoBanner, findsOneWidget);
        expect(stockInfoBannerTitle, findsOneWidget);
        expect(stockInfoBannerSubTitle, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Stock Info banner not visible in home tab',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            isStockInfoNotAvailable: false,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final stockInfoBanner = find.byKey(WidgetKeys.stockInfoBanner);
        final stockInfoBannerTitle = find.text('Stock status not available:');
        final stockInfoBannerSubTitle = find.text(
          'Please note that stock information is not available at the moment. While you can still place orders, fulfilment will be subjected to available stock levels.',
        );

        expect(stockInfoBanner, findsNothing);
        expect(stockInfoBannerTitle, findsNothing);
        expect(stockInfoBannerSubTitle, findsNothing);
      },
    );

    // testWidgets(
    //   'Hide paymentsExpansionTile when enablePayments is false',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => remoteConfigServiceMock.getPaymentsConfig())
    //         .thenReturn(false);
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('root_admin'),
    //           ),
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final paymentsExpansionTile =
    //         find.byKey(const Key('paymentsExpansionTile'));
    //     expect(paymentsExpansionTile, findsNothing);
    //   },
    // );

    // testWidgets(
    //   'Show paymentsExpansionTile when enablePayments is true',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => remoteConfigServiceMock.getPaymentsConfig())
    //         .thenReturn(true);
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('client_admin'),
    //           ),
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final paymentsExpansionTile =
    //         find.byKey(const Key('paymentsExpansionTile'));
    //     expect(paymentsExpansionTile, findsNothing);
    //   },
    // );

    // testWidgets(
    //   'Home Screen orders is disabled, history is enabled when user is client admin/user, accessRight->orders is true and disableCreateOrder is true',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('client_admin'),
    //           ),
    //           accessRight: AccessRight.empty().copyWith(
    //             orders: true,
    //           ),
    //           disableCreateOrder: true,
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final orderExpansionTile =
    //         find.byKey(const Key('orderExpansionTile'));
    //     expect(orderExpansionTile, findsNothing);
    //   },
    // );

    // testWidgets(
    //   'Show payment when user is client admin/user, accessRight->orders is true and disableCreateOrder is true',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('client_admin'),
    //           ),
    //           accessRight: AccessRight.empty().copyWith(
    //             orders: true,
    //           ),
    //           disableCreateOrder: true,
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final orderExpansionTile =
    //         find.byKey(const Key('orderExpansionTile'));
    //     expect(orderExpansionTile, findsNothing);
    //   },
    // );

    // testWidgets(
    //   'Home Screen orders is enable, when user is client admin/user, accessRight->orders is true and disableCreateOrder is false',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('client_admin'),
    //           ),
    //           accessRight: AccessRight.empty().copyWith(
    //             orders: true,
    //           ),
    //           disableCreateOrder: false,
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final orderExpansionTile =
    //         find.byKey(const Key('orderExpansionTile'));
    //     expect(orderExpansionTile, findsOneWidget);
    //   },
    // );

    // testWidgets(
    //   'Home Screen orders is disable, when user is client admin/user, accessRight->orders is false and disableCreateOrder is false',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('client_admin'),
    //           ),
    //           accessRight: AccessRight.empty().copyWith(
    //             orders: false,
    //           ),
    //           disableCreateOrder: false,
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final orderExpansionTile =
    //         find.byKey(const Key('orderExpansionTile'));
    //     expect(orderExpansionTile, findsNothing);
    //   },
    // );

    // testWidgets(
    //   'Home Screen orders is enable, when user is not client admin/user, accessRight->orders is true and disableCreateOrder is false',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('fake_type'),
    //           ),
    //           accessRight: AccessRight.empty().copyWith(
    //             orders: true,
    //           ),
    //           disableCreateOrder: false,
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final orderExpansionTile =
    //         find.byKey(const Key('orderExpansionTile'));
    //     expect(orderExpansionTile, findsOneWidget);
    //   },
    // );

    // testWidgets(
    //   'Home Screen orders is enable, when user is not client admin/user, accessRight->orders is true and disableCreateOrder is false',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('fake_type'),
    //           ),
    //           accessRight: AccessRight.empty().copyWith(
    //             orders: true,
    //           ),
    //           disableCreateOrder: true,
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final orderExpansionTile =
    //         find.byKey(const Key('orderExpansionTile'));
    //     expect(orderExpansionTile, findsOneWidget);
    //   },
    // );

    // testWidgets(
    //   'Home Screen orders is disable, when user is not client admin/user, accessRight->orders is false and disableCreateOrder is true',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('fake_type'),
    //           ),
    //           accessRight: AccessRight.empty().copyWith(
    //             orders: false,
    //           ),
    //           disableCreateOrder: true,
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final orderExpansionTile =
    //         find.byKey(const Key('orderExpansionTile'));
    //     expect(orderExpansionTile, findsNothing);
    //   },
    // );

    // testWidgets(
    //   'Home Screen orders is disable, when user is not client admin/user, accessRight->orders is false and disableCreateOrder is false',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('fake_type'),
    //           ),
    //           accessRight: AccessRight.empty().copyWith(
    //             orders: false,
    //           ),
    //           disableCreateOrder: false,
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final orderExpansionTile =
    //         find.byKey(const Key('orderExpansionTile'));
    //     expect(orderExpansionTile, findsNothing);
    //   },
    // );

    // testWidgets('Home Tab disableCreateOrder test',
    //     (WidgetTester tester) async {
    //   when(() => userBlocMock.state).thenReturn(
    //     UserState.initial()
    //         .copyWith(user: User.empty().copyWith(disableCreateOrder: true)),
    //   );

    //   await getWidget(tester);
    // });

    // testWidgets(
    //   'Home Screen userCanCreateOrder test - History Disabled',
    //   (WidgetTester tester) async {
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           disableCreateOrder: true,
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);

    //     final historyTab = find.byKey(const Key('historyTab'));
    //     expect(historyTab, findsNothing);
    //   },
    // );
  });
}
