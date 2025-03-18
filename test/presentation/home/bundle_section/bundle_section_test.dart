import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/bundle_section/bundle_section.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late MaterialListBloc materialListBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late ProductDetailBloc productDetailBlocMock;
  late AppRouter autoRouterMock;
  late MaterialResponse materialResponseMock;
  final routeData = RouteData(
    stackKey: const Key(''),
    type: const RouteType.adaptive(),
    route: RouteMatch(
      segments: const [],
      stringMatch: 'home',
      config: AutoRoute(
        page: const PageInfo(HomeTabRoute.name),
      ),
      key: const ValueKey('HomeTabRoute'),
    ),
    router: AutoRouteMock(),
    pendingChildren: [],
  );
  final fakeMaterialData = MaterialData(
    materialNumber: MaterialNumber('1234'),
    manufactured: 'manufactured',
    materialDescription: StringValue('materialDescription'),
    defaultMaterialDescription: 'defaultMaterialDescription',
    genericMaterialName: '1234567',
    governmentMaterialCode: StringValue('1234567'),
    isMarketPlace: false,
    itemRegistrationNumber: ItemRegistrationNumber(''),
  );

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    registerFallbackValue(const PageRouteInfo('HomeTabRoute'));
    locator.registerSingleton<MixpanelService>(MixpanelServiceMock());
    locator.registerSingleton<ClevertapService>(ClevertapServiceMock());
    locator
        .registerLazySingleton<MaterialListBloc>(() => MaterialListBlocMock());
    locator.registerLazySingleton(() => PackageInfoService());
    materialResponseMock = await MaterialListLocalDataSource().getProductList();
    materialListBlocMock = locator<MaterialListBloc>();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    autoRouterMock = AutoRouteMock();
    productDetailBlocMock = ProductDetailBlocMock();
    when(() => autoRouterMock.currentPath).thenReturn('home');
    when(() => autoRouterMock.current).thenReturn(routeData);

    when(() => materialListBlocMock.state)
        .thenReturn(MaterialListState.initial());
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => productDetailBlocMock.state)
        .thenReturn(ProductDetailState.initial());
  });

  Future getWidget(tester) async {
    return await tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<ProductDetailBloc>(
            create: (context) => productDetailBlocMock,
          ),
          BlocProvider<MaterialListBloc>(
            create: (context) => materialListBlocMock,
          ),
        ],
        child: const Scaffold(body: BundleSection()),
      ),
    );
  }

  group('Bundle Section Test', () {
    testWidgets(
        'Do not call the initialized event when the EligibilityState is the EligibilityState.initial()',
        (tester) async {
      whenListen(
        eligibilityBlocMock,
        Stream.fromIterable([
          EligibilityState.initial(),
        ]),
        initialState: EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          user: fakeClientUser.copyWith(preferredLanguage: Language('ZH')),
        ),
      );
      await getWidget(tester);
      await tester.pumpAndSettle();
      verifyNever(
        () => materialListBlocMock.add(
          MaterialListEvent.initialized(
            salesOrganisation: SalesOrganisation.empty(),
            configs: SalesOrganisationConfigs.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            shipToInfo: ShipToInfo.empty(),
            selectedMaterialFilter: MaterialFilter.empty().copyWith(
              bundleOffers: true,
            ),
            user: User.empty(),
          ),
        ),
      );
    });
    testWidgets(
      ' -> Find Bundle Section',
      (WidgetTester tester) async {
        whenListen(
          eligibilityBlocMock,
          Stream.fromIterable([
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeIDSalesOrganisation,
              salesOrgConfigs: fakeIDSalesOrgConfigs,
              user: fakeClientUser,
              shipToInfo: fakeShipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ]),
          initialState: EligibilityState.initial().copyWith(
            isLoadingCustomerCode: true,
          ),
        );
        await getWidget(tester);
        await tester.pumpAndSettle();
        final bundleSectionFinder = find.byType(BundleSection);
        expect(bundleSectionFinder, findsOneWidget);
        verify(
          () => materialListBlocMock.add(
            MaterialListEvent.initialized(
              salesOrganisation: fakeIDSalesOrganisation,
              configs: fakeIDSalesOrgConfigs,
              customerCodeInfo: fakeCustomerCodeInfo,
              shipToInfo: fakeShipToInfo,
              selectedMaterialFilter: MaterialFilter.empty().copyWith(
                bundleOffers: true,
              ),
              user: fakeClientUser,
            ),
          ),
        ).called(1);
      },
    );
    testWidgets(
      ' -> Find Bundle Section body loading test',
      (tester) async {
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            isFetching: true,
          ),
        );
        await getWidget(tester);
        await tester.pump();
        final bundleSectionLoaderImageFinder =
            find.byKey(WidgetKeys.bundleSectionLoaderImage);
        expect(bundleSectionLoaderImageFinder, findsOneWidget);
      },
    );
    testWidgets(
      ' -> Find Bundle Section body test for id market',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final bundlesFinder = find.byKey(WidgetKeys.bundlesBody);
        expect(bundlesFinder, findsNothing);
        final bundlesIconFinder = find.byKey(WidgetKeys.bundles);
        expect(bundlesIconFinder, findsNothing);
        final bundlesListFinder = find.byKey(
          WidgetKeys.bundlesList,
        );
        expect(bundlesListFinder, findsNothing);
        final bundlesListItemFinder = find.byKey(
          WidgetKeys.materialListBundleCard,
        );
        expect(bundlesListItemFinder, findsNothing);
      },
    );

    testWidgets(
      ' -> Bundle Section List item test regarding material data',
      (WidgetTester tester) async {
        when(() => autoRouterMock.navigate(const ProductsTabRoute()))
            .thenAnswer((_) => Future.value());
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: [
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('1234'),
                data: [
                  fakeMaterialData,
                  fakeMaterialData,
                  fakeMaterialData,
                  fakeMaterialData,
                ],
              ),
            ],
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final bundlesFinder = find.byKey(WidgetKeys.bundlesBody);
        expect(bundlesFinder, findsOneWidget);
        final bundlesListFinder = find.byKey(
          WidgetKeys.bundlesList,
        );
        expect(bundlesListFinder, findsOneWidget);
        final bundlesListItemFinder = find.byKey(
          WidgetKeys.materialListBundleCard,
        );
        expect(bundlesListItemFinder, findsOneWidget);
        await tester
            .tap(find.byKey(WidgetKeys.sectionTileIcon('Bundles'.tr())));
        verify(
          () => materialListBlocMock.add(
            MaterialListEvent.fetch(
              selectedMaterialFilter: MaterialFilter.empty().copyWith(
                bundleOffers: true,
              ),
            ),
          ),
        ).called(1);
        verify(() => autoRouterMock.navigate(const ProductsTabRoute()))
            .called(1);
      },
    );

    testWidgets(
      ' -> Find Bundle Code Inside Bundle Section',
      (WidgetTester tester) async {
        whenListen(
          materialListBlocMock,
          Stream.fromIterable([
            MaterialListState.initial().copyWith(
              materialList: [materialResponseMock.products[1]],
            ),
          ]),
          initialState: MaterialListState.initial().copyWith(
            materialList: [materialResponseMock.products[1]],
            apiFailureOrSuccessOption: optionOf(const Right('')),
          ),
        );

        await getWidget(tester);
        await tester.pumpAndSettle();
        final bundleCode = find.text(
          materialResponseMock.products[1].bundle.bundleCode,
        );
        expect(bundleCode, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Find marketplace icon & sellername in marketplace bundle',
      (WidgetTester tester) async {
        final bundle = materialResponseMock.products
            .firstWhere((e) => e.type.typeBundle && e.isMarketPlace);

        whenListen(
          materialListBlocMock,
          Stream.fromIterable([
            MaterialListState.initial().copyWith(
              materialList: [bundle],
              apiFailureOrSuccessOption: optionOf(const Right('')),
            ),
          ]),
          initialState: MaterialListState.initial().copyWith(
            materialList: [bundle],
          ),
        );

        await getWidget(tester);
        await tester.pumpAndSettle();
        expect(find.byType(MarketPlaceLogo), findsOneWidget);
        expect(find.text('Sold by: ${bundle.manufactured}'), findsOne);
      },
    );

    testWidgets(
      ' -> Bundle Section List item test regarding material count',
      (WidgetTester tester) async {
        when(() => autoRouterMock.pushNamed(any()))
            .thenAnswer((invocation) async => true);
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: [
              MaterialInfo.empty().copyWith(
                type: MaterialInfoType.bundle(),
                bundle: Bundle.empty().copyWith(
                  bundleCode: '1234',
                ),
                data: [
                  fakeMaterialData,
                  fakeMaterialData,
                  fakeMaterialData,
                  fakeMaterialData,
                  fakeMaterialData,
                  fakeMaterialData,
                  fakeMaterialData,
                  fakeMaterialData,
                ],
              ),
            ],
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final bundleMaterialCount =
            find.byKey(WidgetKeys.bundleMaterialCount('1234'));
        expect(bundleMaterialCount, findsOneWidget);

        expect(find.text('+ 6 materials'), findsOneWidget);
      },
    );

    testWidgets(
      '-> Test error text visible when there is error from BE',
      (WidgetTester tester) async {
        whenListen(
          materialListBlocMock,
          Stream.fromIterable([
            MaterialListState.initial().copyWith(isFetching: true),
            MaterialListState.initial().copyWith(
              apiFailureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other('fake-error'))),
            ),
          ]),
        );

        await getWidget(tester);
        await tester.pumpAndSettle();
        final customSnackBar = find.byType(CustomSnackBar);
        final errorText = find.text('fake-error');
        expect(customSnackBar, findsOneWidget);
        expect(errorText, findsOneWidget);
      },
    );
  });
}
