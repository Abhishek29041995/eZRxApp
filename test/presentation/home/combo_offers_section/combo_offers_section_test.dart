import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/combo_offers_section/combo_offers_section.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late CustomerCodeBloc customerCodeBlocMock;
  late AuthBloc authBlocMock;
  late MaterialListBloc materialListBlocMock;
  late UserBloc userBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late MaterialFilterBloc materialFilterBlocMock;
  late AppRouter autoRouterMock;
  final routeData = RouteData(
    stackKey: const Key(''),
    type: const RouteType.adaptive(),
    route: RouteMatch(
      segments: const [],
      config: AutoRoute(
        page: const PageInfo(HomeTabRoute.name),
      ),
      stringMatch: 'home',
      key: const ValueKey('HomeTabRoute'),
    ),
    router: AutoRouteMock(),
    pendingChildren: [],
  );

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    registerFallbackValue(const PageRouteInfo('HomeTabRoute'));
    locator.registerFactory<MaterialListBloc>(() => materialListBlocMock);
    locator.registerLazySingleton(() => PackageInfoService());
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    salesOrgBlocMock = SalesOrgBlocMock();
    autoRouterMock = AutoRouteMock();
    materialFilterBlocMock = MaterialFilterBlocMock();
    when(() => autoRouterMock.currentPath).thenReturn('home');
    when(() => autoRouterMock.current).thenReturn(routeData);
    when(() => autoRouterMock.current).thenReturn(routeData);

    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    customerCodeBlocMock = CustomerCodeBlocMock();
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    authBlocMock = AuthBlocMock();
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    materialListBlocMock = MaterialListBlocMock();
    when(() => materialListBlocMock.state)
        .thenReturn(MaterialListState.initial());
    userBlocMock = UserBlocMock();
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => materialFilterBlocMock.state)
        .thenReturn(MaterialFilterState.initial());
  });

  Future getWidget(tester) async {
    return await tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<UserBloc>(
            create: (context) => userBlocMock,
          ),
          BlocProvider<AuthBloc>(
            create: (context) => authBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<MaterialListBloc>(
            create: (context) => materialListBlocMock,
          ),
          BlocProvider<MaterialFilterBloc>(
            create: (context) => materialFilterBlocMock,
          ),
        ],
        child: const Scaffold(body: ComboOffersSection()),
      ),
    );
  }

  group('Combo Offers Section Test', () {
    testWidgets(
      ' -> Find Combo Offers Section',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        await getWidget(tester);
        await tester.pump();
        final comboOffersSectionFinder = find.byType(ComboOffersSection);
        expect(comboOffersSectionFinder, findsOneWidget);
      },
    );

    testWidgets('On tap combo deal button', (tester) async {
      when(() => autoRouterMock.navigate(const ProductsTabRoute()))
          .thenAnswer((_) => Future.value());
      final exploreComboDealsButtton =
          find.byKey(WidgetKeys.exploreComboDealsButtton);
      await getWidget(tester);
      await tester.pump();
      await tester.tap(exploreComboDealsButtton);
      verify(
        () => materialFilterBlocMock.add(
          MaterialFilterEvent.initSelectedMaterialFilter(
            MaterialFilter.empty().copyWith(comboOffers: true),
          ),
        ),
      ).called(1);

      verify(
        () => materialListBlocMock.add(
          MaterialListEvent.fetch(
            selectedMaterialFilter:
                MaterialFilter.empty().copyWith(comboOffers: true),
          ),
        ),
      ).called(1);

      verify(() => autoRouterMock.navigate(const ProductsTabRoute())).called(1);
    });
  });
}
