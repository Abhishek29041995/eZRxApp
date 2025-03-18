import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/browse_products/browse_products.dart';
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
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late MaterialListBloc materialListBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late MaterialPriceBloc materialPriceBlocMock;
  late ProductDetailBloc productDetailBlocMock;
  late ProductImageBloc productImageBlocMock;
  late UserBloc userBlocMock;
  late AppRouter autoRouterMock;
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

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    registerFallbackValue(const PageRouteInfo('HomeTabRoute'));
    locator.registerSingleton<MixpanelService>(MixpanelServiceMock());
    locator.registerSingleton<ClevertapService>(ClevertapServiceMock());
    locator.registerFactory<MaterialListBloc>(() => materialListBlocMock);
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    autoRouterMock = AutoRouteMock();
    materialPriceBlocMock = MaterialPriceBlocMock();
    productDetailBlocMock = ProductDetailBlocMock();
    materialListBlocMock = MaterialListBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    productImageBlocMock = ProductImageBlocMock();
    userBlocMock = UserBlocMock();
    when(() => autoRouterMock.currentPath).thenReturn('home');
    when(() => autoRouterMock.current).thenReturn(routeData);
    when(() => autoRouterMock.current).thenReturn(routeData);
    when(() => materialListBlocMock.state)
        .thenReturn(MaterialListState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => productImageBlocMock.state)
        .thenReturn(ProductImageState.initial());
    when(() => materialPriceBlocMock.state)
        .thenReturn(MaterialPriceState.initial());
    when(() => productDetailBlocMock.state)
        .thenReturn(ProductDetailState.initial());
    when(() => userBlocMock.state).thenReturn(
      UserState.initial(),
    );
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
          BlocProvider<MaterialListBloc>(
            create: (context) => materialListBlocMock,
          ),
          BlocProvider<ProductImageBloc>(
            create: (context) => productImageBlocMock,
          ),
          BlocProvider<MaterialPriceBloc>(
            create: (context) => materialPriceBlocMock,
          ),
          BlocProvider<ProductDetailBloc>(
            create: (context) => productDetailBlocMock,
          ),
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
        ],
        child: const Scaffold(body: BrowseProduct()),
      ),
    );
  }

  group('Browse Product Test', () {
    testWidgets(
      ' -> Find Browse Product',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        await getWidget(tester);
        await tester.pump();
        final browseProductFinder = find.byType(BrowseProduct);
        expect(browseProductFinder, findsOneWidget);
      },
    );
    testWidgets(
      ' -> Find Browse Product body loading test',
      (tester) async {
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            isFetching: true,
          ),
        );
        await getWidget(tester);
        await tester.pump();
        final browseProductLoadingShimmerFinder =
            find.byKey(WidgetKeys.browseProductLoadingShimmer);
        expect(browseProductLoadingShimmerFinder, findsOneWidget);
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

    testWidgets(
        'Do not call the initialized event when the EligibilityState is the EligibilityState.initial()',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          user: fakeClientUser.copyWith(preferredLanguage: Language('ZH')),
          isLoadingCustomerCode: true,
        ),
      );
      final expectedState = [
        EligibilityState.initial(),
      ];
      whenListen(
        eligibilityBlocMock,
        Stream.fromIterable(expectedState),
      );
      await getWidget(tester);
      await tester.pump();
      verifyNever(
        () => materialListBlocMock.add(
          MaterialListEvent.initialized(
            user: User.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            configs: SalesOrganisationConfigs.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            shipToInfo: ShipToInfo.empty(),
            selectedMaterialFilter: MaterialFilter.empty().copyWith(
              isProductOffer: true,
            ),
          ),
        ),
      );
    });

    testWidgets('tap browse product icon', (tester) async {
      final materialList = [MaterialInfo.empty()];
      final browseProductIcon =
          find.byKey(WidgetKeys.sectionTileIcon('Browse products'.tr()));
      whenListen(
        materialListBlocMock,
        Stream.fromIterable([
          MaterialListState.initial().copyWith(
            materialList: materialList,
            selectedMaterialFilter:
                MaterialFilter.empty().copyWith(isFavourite: true),
            apiFailureOrSuccessOption: optionOf(const Right('')),
          ),
        ]),
      );

      when(() => autoRouterMock.navigate(const ProductsTabRoute()))
          .thenAnswer((_) => Future.value());
      await getWidget(tester);
      await tester.pumpAndSettle();
      verify(
        () => materialPriceBlocMock.add(
          MaterialPriceEvent.fetch(
            comboDealEligible: false,
            materials: materialList,
          ),
        ),
      ).called(1);
      expect(browseProductIcon, findsOneWidget);
      await tester.tap(browseProductIcon);
      verify(
        () => materialListBlocMock.add(
          MaterialListEvent.fetch(
            selectedMaterialFilter: MaterialFilter.empty(),
          ),
        ),
      ).called(1);
      verify(() => autoRouterMock.navigate(const ProductsTabRoute())).called(1);
    });

    testWidgets('tap product favorite icon', (tester) async {
      final materialList = [MaterialInfo.empty()];
      final favoriteIcon = find.byKey(WidgetKeys.favoritesIcon).first;
      whenListen(
        materialListBlocMock,
        Stream.fromIterable([
          MaterialListState.initial().copyWith(
            materialList: materialList,
          ),
        ]),
        initialState: MaterialListState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(const Right('')),
        ),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();

      await tester.tap(favoriteIcon);
      verify(
        () => materialListBlocMock.add(
          MaterialListEvent.addFavourite(
            item: materialList.first,
          ),
        ),
      ).called(1);
    });

    testWidgets('tap product unfavorite icon', (tester) async {
      final materialList = [MaterialInfo.empty().copyWith(isFavourite: true)];
      final favoriteIcon = find.byKey(WidgetKeys.favoritesIcon).first;
      whenListen(
        materialListBlocMock,
        Stream.fromIterable([
          MaterialListState.initial().copyWith(
            materialList: materialList,
          ),
        ]),
        initialState: MaterialListState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(const Right('')),
        ),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();

      await tester.tap(favoriteIcon);
      verify(
        () => materialListBlocMock.add(
          MaterialListEvent.deleteFavourite(
            item: materialList.first,
          ),
        ),
      ).called(1);
    });
  });
}
