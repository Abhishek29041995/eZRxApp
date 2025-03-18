import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_filter/view_by_item_filter_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_filter/view_by_order_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_license_local.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/orders_tab.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/filter/view_by_order_filter.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/view_by_item_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/view_by_item_filter_sheet.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

class ViewByItemsBlocMock extends MockBloc<ViewByItemsEvent, ViewByItemsState>
    implements ViewByItemsBloc {}

class ViewByOrderBlocMock extends MockBloc<ViewByOrderEvent, ViewByOrderState>
    implements ViewByOrderBloc {}

class ViewByOrderFilterBlocMock
    extends MockBloc<ViewByOrderFilterEvent, ViewByOrderFilterState>
    implements ViewByOrderFilterBloc {}

class MockAppRouter extends Mock implements AppRouter {}

class ViewByItemFilterBlocMock
    extends MockBloc<ViewByItemFilterEvent, ViewByItemFilterState>
    implements ViewByItemFilterBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class MixpanelServiceMock extends Mock implements MixpanelService {}

class CustomerLicenseBlocMock
    extends MockBloc<CustomerLicenseEvent, CustomerLicenseState>
    implements CustomerLicenseBloc {}

class ConfigMock extends Mock implements Config {}

class OrdersTabRouter extends AppRouter {
  @override
  RouteCollection get routeCollection => super.routeCollection.subCollectionOf(
        HomeNavigationTabbarRoute.name,
      );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ViewByItemsBloc viewByItemsBlocMock;
  late ViewByOrderBloc viewByOrderBlocMock;
  late ViewByOrderFilterBloc viewByOrderFilterBlocMock;
  late ViewByItemFilterBloc viewByItemFilterBlocMock;
  late MixpanelService mixpanelServiceMock;
  late Config config;
  late CustomerLicenseBloc customerLicenseBlocMock;
  late List<CustomerLicense> customerLicense;

  setUpAll(() async {
    locator.registerLazySingleton(() => config);
    registerFallbackValue(<String, dynamic>{});
    registerFallbackValue(const ViewByOrderEvent.loadMore());
    registerFallbackValue(const ViewByItemsEvent.loadMore());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    locator.registerFactory<AppRouter>(() => OrdersTabRouter());
    autoRouterMock = locator<AppRouter>();
    mixpanelServiceMock = locator<MixpanelService>();
    customerLicenseBlocMock = CustomerLicenseBlocMock();
    customerLicense =
        await CustomerLicenseLocalDataSource().getCustomerLicense();
    config = ConfigMock();
  });
  setUp(() {
    authBlocMock = AuthBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    viewByItemsBlocMock = ViewByItemsBlocMock();
    viewByOrderBlocMock = ViewByOrderBlocMock();
    viewByOrderFilterBlocMock = ViewByOrderFilterBlocMock();
    viewByItemFilterBlocMock = ViewByItemFilterBlocMock();

    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial().copyWith(isFetching: false));
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => viewByItemsBlocMock.state)
        .thenReturn(ViewByItemsState.initial());
    when(() => viewByOrderBlocMock.state)
        .thenReturn(ViewByOrderState.initial());
    when(() => viewByOrderFilterBlocMock.state)
        .thenReturn(ViewByOrderFilterState.initial());
    when(() => viewByItemFilterBlocMock.state)
        .thenReturn(ViewByItemFilterState.initial());
    when(() => customerLicenseBlocMock.state)
        .thenReturn(CustomerLicenseState.initial());
  });

  Widget testWidget(Widget widget) {
    return WidgetUtils.getScopedWidget(
      routeName: OrdersTabRoute.name,
      autoRouterMock: autoRouterMock,
      useMediaQuery: true,
      usingLocalization: true,
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => customerCodeBlocMock,
        ),
        BlocProvider<ViewByItemsBloc>(
          create: (context) => viewByItemsBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: ((context) => eligibilityBlocMock),
        ),
        BlocProvider<ViewByOrderBloc>(
          create: (context) => viewByOrderBlocMock,
        ),
        BlocProvider<ViewByOrderFilterBloc>(
          create: (context) => viewByOrderFilterBlocMock,
        ),
        BlocProvider<ViewByItemFilterBloc>(
          create: (context) => viewByItemFilterBlocMock,
        ),
        BlocProvider<CustomerLicenseBloc>(
          create: (context) => customerLicenseBlocMock,
        ),
      ],
      child: Material(child: widget),
    );
  }

  group('Orders tab -', () {
    testWidgets('by default', (tester) async {
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();

      expect(find.byKey(WidgetKeys.ordersTab), findsOneWidget);
      expect(find.byKey(WidgetKeys.viewByItemsTabKey), findsOneWidget);
      expect(find.byKey(WidgetKeys.viewByOrdersTabKey), findsOneWidget);
      expect(find.byKey(WidgetKeys.customerCodeSelector), findsOneWidget);
      expect(find.byKey(WidgetKeys.ordersTabSearchBarKey), findsOneWidget);
      expect(find.byKey(WidgetKeys.ordersTabFilterButtonKey), findsOneWidget);
      expect(find.byType(ViewByItemsPage), findsOneWidget);
    });
    testWidgets('customer Code Selector', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
        ),
      );
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();

      expect(find.byKey(WidgetKeys.ordersTab), findsOneWidget);
      expect(find.byKey(WidgetKeys.customerCodeSelector), findsOneWidget);
      expect(find.byKey(WidgetKeys.customerCodeSelect), findsOneWidget);
      expect(find.byIcon(Icons.location_on_outlined), findsOneWidget);
      expect(find.text(fakeShipToInfo.shipToCustomerCode), findsOneWidget);
      expect(
        find.text(fakeShipToInfo.fullDeliveryAddress),
        findsOneWidget,
      );
    });
    testWidgets('customer Code Selector loading', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          isLoadingCustomerCode: true,
        ),
      );
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();

      expect(find.byKey(WidgetKeys.ordersTab), findsOneWidget);
      expect(find.byKey(WidgetKeys.customerCodeSelector), findsOneWidget);
      expect(find.byKey(WidgetKeys.customerCodeSelect), findsOneWidget);
      expect(find.byIcon(Icons.location_on_outlined), findsOneWidget);
      expect(find.text(fakeShipToInfo.shipToCustomerCode), findsNothing);
      expect(
        find.text(fakeShipToInfo.fullDeliveryAddress),
        findsNothing,
      );
      expect(
        find.byType(LoadingShimmer),
        findsWidgets,
      );
    });
    testWidgets('Show view by item filter when tap filter icon',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      expect(find.byType(ViewByItemsPage), findsOneWidget);
      await tester.tap(find.byKey(WidgetKeys.ordersTabFilterButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByItemFilterSheet), findsOneWidget);
    });
  });

  group('View Filter', () {
    testWidgets('displayed when tap filter icon', (tester) async {
      final fakeFilter = ViewByOrdersFilter.empty()
          .copyWith(orderStatusList: [StatusType('test')]);
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
        ),
      );
      when(() => viewByOrderBlocMock.state).thenReturn(
        ViewByOrderState.initial().copyWith(appliedFilter: fakeFilter),
      );

      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByOrdersTabKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByOrdersPage), findsOneWidget);
      await tester.tap(find.byKey(WidgetKeys.ordersTabFilterButtonKey));
      await tester.pump();
      expect(find.byType(ViewByOrderFilterBottomSheet), findsOneWidget);
      verify(
        () => viewByOrderFilterBlocMock.add(
          ViewByOrderFilterEvent.updateCurrentFilter(
            currentFilter: fakeFilter,
          ),
        ),
      ).called(1);
    });

    testWidgets('in default state', (tester) async {
      await tester.pumpWidget(testWidget(const ViewByOrderFilterBottomSheet()));
      await tester.pump();
      expect(find.byType(ViewByOrderFilterBottomSheet), findsOneWidget);
      expect(find.byKey(WidgetKeys.closeButton), findsOneWidget);
      expect(find.widgetWithText(AppBar, 'Filter'), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.viewByOrdersFilterFromDateKey),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.viewByOrdersFilterToDateKey),
        findsOneWidget,
      );
      expect(find.byType(CheckboxListTile), findsNothing);
      expect(
        find.byKey(WidgetKeys.filterApplyButton),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.filterResetButton),
        findsOneWidget,
      );
    });

    testWidgets('show status picker in ID market', (tester) async {
      final statusList = [
        'Order received',
        'Order created',
        'Picking in progress',
        'Out for delivery',
        'Delivered',
        'Cancelled',
      ];
      when(() => viewByOrderFilterBlocMock.state).thenReturn(
        ViewByOrderFilterState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
        ),
      );
      await tester.pumpWidget(testWidget(const ViewByOrderFilterBottomSheet()));
      await tester.pump();
      expect(find.byType(ViewByOrderFilterBottomSheet), findsOneWidget);
      expect(find.byType(CheckboxListTile), findsNWidgets(statusList.length));
      for (final status in statusList) {
        expect(
          find.byKey(WidgetKeys.statusFilter(status, false)),
          findsOneWidget,
        );
      }
      await tester
          .tap(find.byKey(WidgetKeys.statusFilter(statusList.first, false)));
      await tester.pumpAndSettle();
      verify(
        () => viewByOrderFilterBlocMock.add(
          ViewByOrderFilterEvent.setOrderStatus(
            status: StatusType(statusList.first),
            value: true,
          ),
        ),
      ).called(1);
    });

    testWidgets('close button view by orders filter', (tester) async {
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByOrdersTabKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.ordersTabFilterButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByOrderFilterBottomSheet), findsOneWidget);
      await tester.tap(find.byKey(WidgetKeys.closeButton));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByOrderFilterBottomSheet), findsNothing);

      verifyNever(
        () => mixpanelServiceMock.trackEvent(
          eventName: TrackingEvents.orderDetailFiltered,
          properties: any(named: 'properties'),
        ),
      );
      verifyNever(
        () => viewByOrderBlocMock.add(any()),
      );
    });

    testWidgets('close button view by items filter', (tester) async {
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByItemsTabKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.ordersTabFilterButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByItemFilterSheet), findsOneWidget);
      await tester.tap(find.byKey(WidgetKeys.closeButton));
      await tester.pumpAndSettle();
      verify(
        () => viewByItemFilterBlocMock.add(
          ViewByItemFilterEvent.resetFiltersToLastApplied(
            lastAppliedFilter: ViewByItemFilter.empty(),
          ),
        ),
      );
    });
    testWidgets('reset filter by order', (tester) async {
      final fakeSearchKey = SearchKey.search('test');
      when(() => viewByOrderBlocMock.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          appliedFilter: ViewByOrdersFilter.empty()
              .copyWith(orderStatusList: [StatusType('test')]),
          searchKey: fakeSearchKey,
        ),
      );
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByOrdersTabKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.ordersTabFilterButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByOrderFilterBottomSheet), findsOneWidget);
      await tester.tap(find.byKey(WidgetKeys.filterResetButton));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByOrderFilterBottomSheet), findsNothing);

      verify(
        () => viewByOrderBlocMock.add(
          ViewByOrderEvent.fetch(
            filter: ViewByOrdersFilter.empty(),
            searchKey: fakeSearchKey,
            isDetailsPage: false,
          ),
        ),
      );

      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: TrackingEvents.orderDetailFiltered,
          properties: any(named: 'properties'),
        ),
      );
    });

    testWidgets('reset filter by items', (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));
      final fakeSearchKey = SearchKey.search('test');
      when(() => viewByItemsBlocMock.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          appliedFilter: ViewByItemFilter.empty()
              .copyWith(orderStatusList: [StatusType('test')]),
          searchKey: fakeSearchKey,
        ),
      );
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByItemsTabKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.ordersTabFilterButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByItemFilterSheet), findsOneWidget);
      await tester.tap(find.byKey(WidgetKeys.filterResetButton));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByItemFilterSheet), findsNothing);

      verify(
        () => viewByItemsBlocMock.add(
          ViewByItemsEvent.fetch(
            viewByItemFilter: ViewByItemFilter.empty(),
            searchKey: fakeSearchKey,
          ),
        ),
      );

      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: TrackingEvents.orderDetailFiltered,
          properties: any(named: 'properties'),
        ),
      );
    });

    testWidgets('apply filter view by order filter', (tester) async {
      final fakeFilter = ViewByOrdersFilter.empty()
          .copyWith(orderStatusList: [StatusType('test')]);
      when(() => viewByOrderFilterBlocMock.state).thenReturn(
        ViewByOrderFilterState.initial().copyWith(filter: fakeFilter),
      );
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByOrdersTabKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.ordersTabFilterButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByOrderFilterBottomSheet), findsOneWidget);
      await tester.tap(find.byKey(WidgetKeys.filterApplyButton));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByOrderFilterBottomSheet), findsNothing);

      verify(
        () => viewByOrderBlocMock.add(
          ViewByOrderEvent.fetch(
            filter: fakeFilter,
            searchKey: SearchKey.empty(),
            isDetailsPage: false,
          ),
        ),
      );

      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: TrackingEvents.orderDetailFiltered,
          properties: any(named: 'properties'),
        ),
      );
    });
    testWidgets('apply filter view by items filter', (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));
      final fakeFilter = ViewByItemFilter.empty()
          .copyWith(orderStatusList: [StatusType('test')]);
      when(() => viewByItemFilterBlocMock.state).thenReturn(
        ViewByItemFilterState.initial().copyWith(filter: fakeFilter),
      );
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByItemsTabKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.ordersTabFilterButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByItemFilterSheet), findsOneWidget);
      await tester.tap(find.byKey(WidgetKeys.filterApplyButton));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByItemFilterSheet), findsNothing);

      verify(
        () => viewByItemsBlocMock.add(
          ViewByItemsEvent.fetch(
            viewByItemFilter: fakeFilter,
            searchKey: SearchKey.empty(),
          ),
        ),
      );

      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: TrackingEvents.orderDetailFiltered,
          properties: any(named: 'properties'),
        ),
      );
    });

    testWidgets('apply from/to date view by orders filter', (tester) async {
      final fakeStartDate = DateTime.now().subtract(const Duration(days: 2));
      final fakeEndDate = DateTime.now().subtract(const Duration(days: 1));
      final fromDateString =
          '${fakeStartDate.month}/${fakeStartDate.day}/${fakeStartDate.year}';
      final toDateString =
          '${fakeEndDate.month}/${fakeEndDate.day}/${fakeEndDate.year}';

      await tester.pumpWidget(testWidget(const ViewByOrderFilterBottomSheet()));
      await tester.pump();

      await tester.tap(find.byKey(WidgetKeys.viewByOrdersFilterFromDateKey));
      await tester.pumpAndSettle();
      final dialog = find.byType(DateRangePickerDialog);
      final editIcon = find.descendant(
        of: dialog,
        matching: find.widgetWithIcon(IconButton, Icons.edit_outlined),
      );

      await tester.tap(editIcon);
      await tester.pump();
      final submitButton =
          find.descendant(of: dialog, matching: find.byType(TextButton));
      final dateRangeFields =
          find.descendant(of: dialog, matching: find.byType(TextField));
      await tester.enterText(dateRangeFields.first, fromDateString);
      await tester.enterText(dateRangeFields.last, toDateString);
      await tester.tap(submitButton.last);
      await tester.pump();

      await tester.tap(find.byKey(WidgetKeys.viewByOrdersFilterToDateKey));
      await tester.pumpAndSettle();
      await tester.tap(editIcon);
      await tester.pump();
      await tester.enterText(dateRangeFields.first, fromDateString);
      await tester.enterText(dateRangeFields.last, toDateString);
      await tester.pump();
      await tester.tap(submitButton.last);
      await tester.pump();

      verify(
        () => viewByOrderFilterBlocMock.add(
          ViewByOrderFilterEvent.setDateRange(
            DateUtils.datesOnly(
              DateTimeRange(start: fakeStartDate, end: fakeEndDate),
            ),
          ),
        ),
      ).called(2);
    });

    testWidgets('apply from/to date view by items filter', (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));
      final fakeStartDate = DateTime.now().subtract(const Duration(days: 2));
      final fakeEndDate = DateTime.now().subtract(const Duration(days: 1));
      final fromDateString =
          '${fakeStartDate.month}/${fakeStartDate.day}/${fakeStartDate.year}';
      final toDateString =
          '${fakeEndDate.month}/${fakeEndDate.day}/${fakeEndDate.year}';

      await tester.pumpWidget(testWidget(const ViewByItemFilterSheet()));
      await tester.pump();

      await tester.tap(find.byKey(WidgetKeys.viewByItemsFilterFromDateKey));
      await tester.pumpAndSettle();
      final dialog = find.byType(DateRangePickerDialog);
      final editIcon = find.descendant(
        of: dialog,
        matching: find.widgetWithIcon(IconButton, Icons.edit_outlined),
      );

      await tester.tap(editIcon);
      await tester.pump();
      final submitButton =
          find.descendant(of: dialog, matching: find.byType(TextButton));
      final dateRangeFields =
          find.descendant(of: dialog, matching: find.byType(TextField));
      await tester.enterText(dateRangeFields.first, fromDateString);
      await tester.enterText(dateRangeFields.last, toDateString);
      await tester.tap(submitButton.last);
      await tester.pump();

      await tester.tap(find.byKey(WidgetKeys.viewByItemsFilterToDateKey));
      await tester.pumpAndSettle();
      await tester.tap(editIcon);
      await tester.pump();
      await tester.enterText(dateRangeFields.first, fromDateString);
      await tester.enterText(dateRangeFields.last, toDateString);
      await tester.pump();
      await tester.tap(submitButton.last);
      await tester.pump();

      verify(
        () => viewByItemFilterBlocMock.add(
          ViewByItemFilterEvent.setOrderDate(
            dateRange: DateUtils.datesOnly(
              DateTimeRange(start: fakeStartDate, end: fakeEndDate),
            ),
          ),
        ),
      ).called(2);
    });

    testWidgets('apply status view by items filter', (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));
      await tester.pumpWidget(testWidget(const ViewByItemFilterSheet()));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Order created'));
      await tester.pump();

      verify(
        () => viewByItemFilterBlocMock.add(
          ViewByItemFilterEvent.setOrderStatus(
            status: StatusType('Order created'),
            value: true,
          ),
        ),
      ).called(1);
    });

    testWidgets('should rebuild the filter date range when order date changed',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));
      final fakeStartDate = DateTime.now().subtract(const Duration(days: 2));
      final fakeEndDate = DateTime.now().subtract(const Duration(days: 1));
      whenListen(
        viewByItemFilterBlocMock,
        Stream.fromIterable([
          ViewByItemFilterState.initial(),
          ViewByItemFilterState.initial().copyWith(
            filter: ViewByItemFilter.empty().copyWith(
              orderDateFrom: DateTimeStringValue(
                fakeStartDate.toIso8601String(),
              ),
              orderDateTo: DateTimeStringValue(
                fakeEndDate.toIso8601String(),
              ),
            ),
          ),
        ]),
      );
      await tester.pumpWidget(testWidget(const ViewByItemFilterSheet()));
      await tester.pump();

      expect(
        find.byKey(WidgetKeys.viewByItemsFilterFromDateKey),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.viewByItemsFilterToDateKey),
        findsOneWidget,
      );
    });

    testWidgets(
        'Should hide order history type when user can not access marketplace view by item filter',
        (tester) async {
      await tester.pumpWidget(testWidget(const ViewByItemFilterSheet()));
      await tester.pumpAndSettle();
      expect(find.text('Show history'), findsNothing);
      expect(
        find.byKey(WidgetKeys.filterRadioTile('All', true)),
        findsNothing,
      );
      expect(
        find.byKey(WidgetKeys.filterRadioTile('ZP items', false)),
        findsNothing,
      );
      expect(
        find.byKey(WidgetKeys.filterRadioTile('MP items', false)),
        findsNothing,
      );
    });

    testWidgets('apply order history type view by item filter', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeMarketPlaceCustomerCode,
          user: fakeClientUserAccessMarketPlace,
        ),
      );
      await tester.pumpWidget(testWidget(const ViewByItemFilterSheet()));
      await tester.pumpAndSettle();
      expect(find.text('Show history'), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.filterRadioTile('All', true)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.filterRadioTile('ZP items', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.filterRadioTile('MP items', false)),
        findsOneWidget,
      );

      await tester
          .tap(find.byKey(WidgetKeys.filterRadioTile('ZP items', false)));
      verify(
        () => viewByItemFilterBlocMock.add(
          ViewByItemFilterEvent.setOrderHistoryType(
            type: MaterialOriginFilter.zp(),
          ),
        ),
      ).called(1);
    });

    testWidgets(
        'rebuild view by order filter when fetch completed or appliedFilterCount changed',
        (tester) async {
      final fakeFilter = ViewByOrdersFilter.empty()
          .copyWith(orderStatusList: [StatusType('test')]);
      when(() => viewByOrderBlocMock.state).thenReturn(
        ViewByOrderState.initial().copyWith(appliedFilter: fakeFilter),
      );
      whenListen(
        viewByOrderBlocMock,
        Stream.fromIterable([
          ViewByOrderState.initial().copyWith(isFetching: true),
          ViewByOrderState.initial().copyWith(appliedFilter: fakeFilter),
        ]),
      );
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByOrdersTabKey));
      await tester.pumpAndSettle();

      expect(find.byType(ViewByOrdersPage), findsOneWidget);
    });
    testWidgets(
        'rebuild view by item filter when fetch completed or appliedFilterCount changed',
        (tester) async {
      final fakeFilter = ViewByItemFilter.empty()
          .copyWith(orderStatusList: [StatusType('test')]);
      when(() => viewByItemsBlocMock.state).thenReturn(
        ViewByItemsState.initial().copyWith(appliedFilter: fakeFilter),
      );
      whenListen(
        viewByItemsBlocMock,
        Stream.fromIterable([
          ViewByItemsState.initial().copyWith(isFetching: true),
          ViewByItemsState.initial().copyWith(appliedFilter: fakeFilter),
        ]),
      );
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByItemsTabKey));
      await tester.pumpAndSettle();

      expect(find.byType(ViewByItemsPage), findsOneWidget);
    });
    testWidgets(
        'Should hide order history type when user can not access marketplace view by orders filter',
        (tester) async {
      await tester.pumpWidget(testWidget(const ViewByOrderFilterBottomSheet()));
      await tester.pumpAndSettle();
      expect(find.text('Show history'), findsNothing);
      expect(
        find.byKey(WidgetKeys.filterRadioTile('All', true)),
        findsNothing,
      );
      expect(
        find.byKey(WidgetKeys.filterRadioTile('ZP orders', false)),
        findsNothing,
      );
      expect(
        find.byKey(WidgetKeys.filterRadioTile('MP orders', false)),
        findsNothing,
      );
    });

    testWidgets('apply order history type view by orders filter',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeMarketPlaceCustomerCode,
          user: fakeClientUserAccessMarketPlace,
        ),
      );
      await tester.pumpWidget(testWidget(const ViewByOrderFilterBottomSheet()));
      await tester.pumpAndSettle();
      expect(find.text('Show history'), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.filterRadioTile('All', true)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.filterRadioTile('ZP orders', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.filterRadioTile('MP orders', false)),
        findsOneWidget,
      );

      await tester.tap(
        find.byKey(WidgetKeys.filterRadioTile('MP orders', false)),
      );
      verify(
        () => viewByOrderFilterBlocMock.add(
          ViewByOrderFilterEvent.setOrderHistoryType(
            type: MaterialOriginFilter.mp(),
          ),
        ),
      ).called(1);
    });
  });

  group('Orders tab search bar', () {
    testWidgets('fetch item view by items tab when search', (tester) async {
      when(() => config.autoSearchTimeout).thenReturn(1500);
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByItemsTabKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByItemsPage), findsOneWidget);
      final searchBar = find.byKey(WidgetKeys.searchBar);
      await tester.enterText(searchBar, 'dummy');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      verify(
        () => viewByItemsBlocMock.add(
          ViewByItemsEvent.fetch(
            viewByItemFilter: ViewByItemFilter.empty(),
            searchKey: SearchKey.search('dummy'),
          ),
        ),
      );
    });
    testWidgets('fetch item view by orders tab when search', (tester) async {
      when(() => config.autoSearchTimeout).thenReturn(1500);
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByOrdersTabKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByOrdersPage), findsOneWidget);
      final searchBar = find.byKey(WidgetKeys.searchBar);
      await tester.enterText(searchBar, 'dummy');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      verify(
        () => viewByOrderBlocMock.add(
          ViewByOrderEvent.fetch(
            filter: ViewByOrdersFilter.empty(),
            searchKey: SearchKey.search('dummy'),
            isDetailsPage: false,
          ),
        ),
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
        await tester.pumpWidget(testWidget(const OrdersTab()));
        await tester.pump();

        final ediBanner = find.byKey(WidgetKeys.ediUserBanner);
        final ediBannerTitle = find.text('You are an EDI customer.');
        final ediBannerSubTitle = find.text(
          'Ordering is disabled on eZRx+, please place your orders through the EDI system only.',
        );
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
        await tester.pumpWidget(testWidget(const OrdersTab()));
        await tester.pump();

        final ediBanner = find.byKey(WidgetKeys.ediUserBanner);
        final ediBannerTitle = find.text('You are an EDI customer.');
        final ediBannerSubTitle = find.text(
          'Ordering is disabled on eZRx+, please place your orders through the EDI system only.',
        );
        expect(ediBanner, findsNothing);
        expect(ediBannerTitle, findsNothing);
        expect(ediBannerSubTitle, findsNothing);
      },
    );

    testWidgets(
      ' -> Find License expired banner in orders tab tab',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        when(() => customerLicenseBlocMock.state).thenReturn(
          CustomerLicenseState.initial().copyWith(
            customerLicenses: customerLicense,
            salesOrganization: fakeIDSalesOrganisation,
          ),
        );
        await tester.pumpWidget(testWidget(const OrdersTab()));
        await tester.pump();

        final licenseExpiredBanner =
            find.byKey(WidgetKeys.licenseExpiredBanner);

        final licenseExpiredBannerTitle = find.text(
          'You have licenses that are about to expire or has expired.',
        );
        final licenseExpiredBannerSubTitle = find.text(
          'To continue using eZRx+, please renew your license.',
        );

        expect(licenseExpiredBanner, findsOneWidget);
        expect(licenseExpiredBannerTitle, findsOneWidget);
        expect(licenseExpiredBannerSubTitle, findsOneWidget);
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
        await tester.pumpWidget(testWidget(const OrdersTab()));
        await tester.pump();

        final licenseExpiredBanner =
            find.byKey(WidgetKeys.licenseExpiredBanner);
        final licenseExpiredBannerTitle = find.text(
          'You have licenses that are about to expire or has expired.',
        );
        final licenseExpiredBannerSubTitle = find.text(
          'To continue using eZRx+, please renew your license.',
        );

        expect(licenseExpiredBanner, findsNothing);
        expect(licenseExpiredBannerTitle, findsNothing);
        expect(licenseExpiredBannerSubTitle, findsNothing);
      },
    );

    testWidgets(
        'View by item search bar should display keyword same as searchKey state',
        (tester) async {
      const searchKey = 'fake-search-key';

      whenListen(
        viewByItemsBlocMock,
        Stream.fromIterable([
          ViewByItemsState.initial()
              .copyWith(searchKey: SearchKey.search(searchKey)),
        ]),
      );
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.viewByItemsTabKey));
      await tester.pumpAndSettle();

      final searchField =
          tester.widget<TextFormField>(find.byKey(WidgetKeys.searchBar));
      expect(searchField.controller?.text, searchKey);
    });

    testWidgets(
        'View by order search bar should display keyword same as searchKey state',
        (tester) async {
      const searchKey = 'fake-search-key';

      whenListen(
        viewByOrderBlocMock,
        Stream.fromIterable([
          ViewByOrderState.initial()
              .copyWith(searchKey: SearchKey.search(searchKey)),
        ]),
      );
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.viewByOrdersTabKey));
      await tester.pumpAndSettle();

      final searchField =
          tester.widget<TextFormField>(find.byKey(WidgetKeys.searchBar));
      expect(searchField.controller?.text, searchKey);
    });
  });
}
