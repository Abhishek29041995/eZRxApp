import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/sales_org_search.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../common_mock_data/mock_bloc.dart';
import '../../common_mock_data/mock_other.dart';
import '../../utils/widget_utils.dart';

void main() {
  final availableSalesOrgList = [
    SalesOrganisation.empty().copyWith(
      salesOrg: SalesOrg('2501'),
    ),
    SalesOrganisation.empty().copyWith(
      salesOrg: SalesOrg('2504'),
    ),
  ];
  final salesOrgState = SalesOrgState.initial().copyWith(
    searchKey: SearchKey.empty(),
    availableSalesOrg: availableSalesOrgList,
  );
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late AppRouter autoRouterMock;
  late CartBloc cartBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late EligibilityBloc eligibilityBlocMock;

  setUpAll(() {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    locator.registerLazySingleton(() => AppRouter());
  });

  group('Test "Sales Org Search"', () {
    setUp(() async {
      userBlocMock = UserBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      cartBlocMock = CartBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();

      autoRouterMock = locator<AppRouter>();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial(),
      );
    });
    tearDownAll(() {
      locator.unregister<AppRouter>();
    });

    RouteDataScope getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<CartBloc>(create: (context) => cartBlocMock),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: SalesOrgSearch(
          key: const Key('salesOrgSearchPage'),
          avialableSalesOrgList: availableSalesOrgList,
        ),
      );
    }

    testWidgets('Content Display When User Can Search Sales Org',
        (tester) async {
      when(() => salesOrgBlocMock.state).thenReturn(
        salesOrgState,
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final salesOrgSearchPage = find.byKey(const Key('salesOrgSearchPage'));
      expect(salesOrgSearchPage, findsOneWidget);

      final salesOrgSearchField = find.byType(TextFormField);
      expect(salesOrgSearchField, findsOneWidget);

      final salesOrgSearchListView = find.byType(ListView);
      expect(salesOrgSearchListView, findsOneWidget);
    });

    testWidgets('User Search Sales Org', (tester) async {
      when(() => salesOrgBlocMock.state).thenReturn(
        salesOrgState,
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField), '2501');
      await tester.pumpAndSettle(const Duration(seconds: 2));
      verify(
        () => salesOrgBlocMock.add(
          SalesOrgEvent.searchSalesOrg(
            searchKey: SearchKey.search('2501'),
            salesOrgList: availableSalesOrgList,
          ),
        ),
      ).called(1);

      final firstSaleOrgItem = find.byType(ListView).first;
      expect(firstSaleOrgItem, findsOneWidget);
    });

    testWidgets('User Search Error Sales Org', (tester) async {
      when(() => salesOrgBlocMock.state).thenReturn(
        salesOrgState,
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField), '2502');
      await tester.pumpAndSettle(const Duration(seconds: 2));

      verify(
        () => salesOrgBlocMock.add(
          SalesOrgEvent.searchSalesOrg(
            searchKey: SearchKey.search('2502'),
            salesOrgList: availableSalesOrgList,
          ),
        ),
      ).called(1);

      final firstSaleOrgItem = find.widgetWithText(Text, '2502');
      expect(firstSaleOrgItem, findsNothing);
    });

    testWidgets('Test when user submit Search Sales Org', (tester) async {
      when(() => salesOrgBlocMock.state).thenReturn(
        salesOrgState,
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField), '2501');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      final firstSaleOrgItem = find.widgetWithText(ListTile, '2501');
      expect(firstSaleOrgItem, findsOneWidget);
    });

    testWidgets('Test when user clear Search Sales Org', (tester) async {
      when(() => salesOrgBlocMock.state).thenReturn(
        salesOrgState,
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField), '2501');
      await tester.pumpAndSettle(
        Duration(milliseconds: locator<Config>().autoSearchTimeout),
      );

      await tester.tap(find.byKey(const Key('clearIconKey')));
      await tester.pumpAndSettle();

      final firstSaleOrgItem = find.widgetWithText(TextFormField, '2501');
      expect(firstSaleOrgItem, findsNothing);
    });

    testWidgets('Test when SalesOrgState is changed and re-build', (tester) async {
      final expectedState = [
        SalesOrgState.initial().copyWith(
          salesOrgFailureOrSuccessOption: none(),
          searchKey: SearchKey.empty(),
          isLoading: false,
        ),
        SalesOrgState.initial().copyWith(
          salesOrgFailureOrSuccessOption: some(right(true)),
          searchKey: SearchKey.search('2501'),
          isLoading: true,
        ),
      ];
      whenListen(salesOrgBlocMock, Stream.fromIterable(expectedState));

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final firstSaleOrgItem = find.byType(ListView).first;
      expect(firstSaleOrgItem, findsOneWidget);
    });

    testWidgets('Tap on SaleOrgItem', (tester) async {
      when(() => salesOrgBlocMock.state).thenReturn(
        salesOrgState,
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField), '2501');
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final firstSaleOrgItem = find.byType(ListTile).first;
      expect(firstSaleOrgItem, findsOneWidget);

      await tester.tap(firstSaleOrgItem);
      verify(
        () => salesOrgBlocMock.add(
          SalesOrgEvent.selected(
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2501')),
          ),
        ),
      ).called(1);
    });
  });
}
