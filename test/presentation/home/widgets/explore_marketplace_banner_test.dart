import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/home/widgets/explore_marketplace_banner.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late EligibilityBlocMock eligibilityBlocMock;
  late MaterialListBloc materialListBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
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
    locator.registerLazySingleton(() => PackageInfoService());
    locator.registerLazySingleton(() => materialListBlocMock);
    registerFallbackValue(const PageRouteInfo('HomeTabRoute'));
    materialListBlocMock = MaterialListBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    autoRouterMock = AutoRouteMock();
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => autoRouterMock.currentPath).thenReturn('home');
    when(() => autoRouterMock.current).thenReturn(routeData);
    when(() => autoRouterMock.current).thenReturn(routeData);
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => materialListBlocMock.state)
        .thenReturn(MaterialListState.initial());
  });

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<MaterialListBloc>(
          create: (context) => materialListBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<SalesOrgBloc>(
          create: (context) => salesOrgBlocMock,
        ),
      ],
      child: const ExploreMarketPlaceBanner(),
    );
  }

  testWidgets(
    'Explore Market Place Banner Test',
    (tester) async {
      when(
        () => autoRouterMock.navigate(
          const ProductsTabRoute(),
        ),
      ).thenAnswer(
        (_) => Future.value(),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();

      final exploreMPButton = find.byType(ElevatedButton);
      expect(exploreMPButton, findsOneWidget);

      await tester.tap(exploreMPButton);
      await tester.pump();

      verify(
        () => materialListBlocMock.add(
          MaterialListEvent.fetch(
            selectedMaterialFilter: MaterialFilter.empty().copyWith(
              isMarketPlace: true,
            ),
          ),
        ),
      ).called(1);

      verify(
        () => autoRouterMock.navigate(
          const ProductsTabRoute(),
        ),
      ).called(1);
    },
  );
}
