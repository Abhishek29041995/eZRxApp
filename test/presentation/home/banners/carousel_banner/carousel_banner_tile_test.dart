import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/banner/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/home/banners/carousel_banner/carousel_banner_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';

import '../../../../common_mock_data/mock_bloc.dart';
import '../../../../common_mock_data/mock_other.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  late MixpanelService mixpanelServiceMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AuthBloc authBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late MaterialListBloc materialListBloc;
  late EligibilityBloc eligibilityBlocMock;
  late MaterialFilterBloc materialFilterBlocMock;
  late ProductSearchBloc productSearchBlocMock;
  late DeepLinkingBloc deepLinkingBloc;
  late AppRouter autoRouterMock;
  const fakeKeyword = 'Test Keyword';
  final bannerTile = find.byType(CarouselBannerTile);

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();
    locator = GetIt.instance;
    locator.registerLazySingleton<MixpanelService>(
      () => MixpanelServiceMock(),
    );
    locator.registerLazySingleton(() => AutoRouteMock());

    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    mixpanelServiceMock = locator<MixpanelService>();
    userBlocMock = UserBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    materialListBloc = MaterialListBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    materialFilterBlocMock = MaterialFilterBlocMock();
    productSearchBlocMock = ProductSearchBlocMock();
    autoRouterMock = locator<AutoRouteMock>();
    deepLinkingBloc = DeepLinkingBlocMock();

    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => materialListBloc.state).thenReturn(MaterialListState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => materialFilterBlocMock.state)
        .thenReturn(MaterialFilterState.initial());

    when(() => productSearchBlocMock.state)
        .thenReturn(ProductSearchState.initial());
    when(() => deepLinkingBloc.state)
        .thenReturn(const DeepLinkingState.initial());
  });

  group('Banner Tile', () {
    Widget getWUT(EZReachBanner banner, {isMobile = true}) {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<ProductSearchBloc>(
            create: (context) => productSearchBlocMock,
          ),
          BlocProvider<MaterialFilterBloc>(
            create: (context) => materialFilterBlocMock,
          ),
          BlocProvider<MaterialListBloc>(
            create: (context) => materialListBloc,
          ),
          BlocProvider<DeepLinkingBloc>(
            create: (context) => deepLinkingBloc,
          ),
        ],
        child: MediaQuery(
          data: MediaQueryData(size: Size(isMobile ? 480 : 500, 900)),
          child: Material(
            child: CarouselBannerTile(
              bannerPosition: 1,
              banner: banner,
            ),
          ),
        ),
      );
    }

    testWidgets('Banner test', (tester) async {
      await tester.pumpWidget(getWUT(EZReachBanner.empty()));
      await tester.pump();

      final bannerTile = find.byType(CarouselBannerTile);
      expect(
        bannerTile,
        findsOneWidget,
      );
    });

    testWidgets('Tap on banner and search keyword', (tester) async {
      when(() => autoRouterMock.navigate(const ProductsTabRoute())).thenAnswer(
        (_) => Future.value(),
      );
      final banner =
          EZReachBanner.empty().copyWith(keyword: StringValue(fakeKeyword));
      await tester.pumpWidget(
        getWUT(
          banner,
        ),
      );
      await tester.pump();

      await tester.tap(bannerTile);
      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: TrackingEvents.bannerClick,
          properties: {
            TrackingProps.bannerId: banner.id,
            TrackingProps.bannerTitle: banner.title,
            TrackingProps.bannerOrder: 1,
            TrackingProps.bannerRedirected: banner.navigationalURL.type,
          },
        ),
      ).called(1);

      verify(
        () => materialListBloc.add(
          const MaterialListEvent.updateSearchKey(searchKey: fakeKeyword),
        ),
      ).called(1);
      verify(
        () => materialListBloc.add(
          MaterialListEvent.fetch(
            selectedMaterialFilter: materialFilterBlocMock.state.materialFilter,
          ),
        ),
      ).called(1);
      verify(
        () => autoRouterMock.navigate(const ProductsTabRoute()),
      ).called(1);
    });

    testWidgets('tap on banner has external link', (tester) async {
      final banner = EZReachBanner.empty().copyWith(
        navigationalURL: EZReachBannerLink('https://www.google.com/'),
      );

      when(
        () => autoRouterMock.push(
          WebViewPageRoute(
            url: banner.navigationalURL.getOrDefaultValue(''),
          ),
        ),
      ).thenAnswer((_) => Future.value());
      await tester.pumpWidget(
        getWUT(
          EZReachBanner.empty().copyWith(
            navigationalURL: EZReachBannerLink('https://www.google.com/'),
          ),
        ),
      );

      await tester.pump();
      expect(bannerTile, findsOneWidget);
      await tester.tap(bannerTile);

      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: TrackingEvents.bannerClick,
          properties: {
            TrackingProps.bannerId: banner.id,
            TrackingProps.bannerTitle: banner.title,
            TrackingProps.bannerOrder: 1,
            TrackingProps.bannerRedirected: banner.navigationalURL.type,
          },
        ),
      ).called(1);

      verify(
        () => autoRouterMock.push(
          WebViewPageRoute(
            url: banner.navigationalURL.getOrDefaultValue(''),
          ),
        ),
      ).called(1);
    });

    testWidgets('tap on banner has internal link', (tester) async {
      final banner = EZReachBanner.empty().copyWith(
        navigationalURL: EZReachBannerLink('https://uat-my.ezrxplus.com/'),
      );
      await tester.pumpWidget(
        getWUT(banner, isMobile: false),
      );
      await tester.pump();
      expect(bannerTile, findsOneWidget);
      await tester.tap(bannerTile);

      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: TrackingEvents.bannerClick,
          properties: {
            TrackingProps.bannerId: banner.id,
            TrackingProps.bannerTitle: banner.title,
            TrackingProps.bannerOrder: 1,
            TrackingProps.bannerRedirected: banner.navigationalURL.type,
          },
        ),
      ).called(1);

      verify(
        () => deepLinkingBloc.add(
          DeepLinkingEvent.addPendingLink(
            EzrxLink(banner.navigationalURL.getOrDefaultValue('')),
            banner: banner,
          ),
        ),
      ).called(1);
    });
  });
}
