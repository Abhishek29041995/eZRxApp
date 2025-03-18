import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_filter/view_by_item_filter_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/batches.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/queue_number_info_icon.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/view_by_item_section.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../integration_test/robots/common/extension.dart';
import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_variant_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late CustomerCodeBloc customerCodeBlocMock;
  late AppRouter autoRouterMock;
  late OrderHistory orderHistory;
  late EligibilityBlocMock eligibilityBlocMock;
  late ViewByItemsBloc mockViewByItemsBloc;
  late ViewByOrderDetailsBloc mockViewByOrderDetailsBloc;
  late SalesOrgBloc mockSalesOrgBloc;
  late UserBlocMock userBlocMock;
  late ViewByItemFilterBlocMock mockViewByItemFilterBloc;
  late ProductImageBlocMock mockProductImageBloc;
  late ViewByItemDetailsBlocMock mockViewByItemDetailsBloc;
  final fakeOrderHistoryItems = [
    OrderHistoryItem.empty().copyWith(
      materialNumber: MaterialNumber('fakeMaterialNumber'),
      governmentMaterialCode: 'fakeGovernmentMaterialCode',
      principalData: PrincipalData.empty().copyWith(
        principalName: PrincipalName('fake_manufactureName_1'),
        principalCode: PrincipalCode('00000001231'),
      ),
      createdDate: DateTimeStringValue('2023041107'),
      batches: [
        Batches(
          batchNumber: StringValue('Batch1'),
          expiryDate: DateTimeStringValue('20240824'),
        ),
      ],
    ),
    OrderHistoryItem.empty().copyWith(
      principalData: PrincipalData.empty().copyWith(
        principalName: PrincipalName('fake_manufactureName_2'),
        principalCode: PrincipalCode('00000001232'),
      ),
      createdDate: DateTimeStringValue('2023041307'),
    ),
  ];

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    orderHistory = await ViewByItemLocalDataSource().getViewByItems();
    autoRouterMock = locator<AppRouter>();
    customerCodeBlocMock = CustomerCodeBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    mockViewByItemsBloc = ViewByItemsBlocMock();
    mockViewByOrderDetailsBloc = ViewByOrderDetailsBlocMock();
    mockSalesOrgBloc = SalesOrgMockBloc();
    userBlocMock = UserBlocMock();
    mockViewByItemFilterBloc = ViewByItemFilterBlocMock();
    mockProductImageBloc = ProductImageBlocMock();
    mockViewByItemDetailsBloc = ViewByItemDetailsBlocMock();
  });

  group('View by Item In Order section', () {
    setUp(() {
      when(() => userBlocMock.state).thenReturn(
        UserState.initial(),
      );
      when(() => mockViewByItemsBloc.state)
          .thenReturn(ViewByItemsState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => mockViewByOrderDetailsBloc.state)
          .thenReturn(ViewByOrderDetailsState.initial());
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial(),
      );
      when(() => mockViewByItemFilterBloc.state)
          .thenReturn(ViewByItemFilterState.initial());
      when(() => mockProductImageBloc.state)
          .thenReturn(ProductImageState.initial());
      when(() => mockViewByItemDetailsBloc.state)
          .thenReturn(ViewByItemDetailsState.initial());
    });
    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
          BlocProvider<ViewByItemsBloc>(
            create: (context) => mockViewByItemsBloc,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<ViewByOrderDetailsBloc>(
            create: (context) => mockViewByOrderDetailsBloc,
          ),
          BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
          BlocProvider<EligibilityBloc>(
            create: ((context) => eligibilityBlocMock),
          ),
          BlocProvider<ViewByItemFilterBloc>(
            create: (context) => mockViewByItemFilterBloc,
          ),
          BlocProvider<ProductImageBloc>(
            create: (context) => mockProductImageBloc,
          ),
          BlocProvider<ViewByItemDetailsBloc>(
            create: (context) => mockViewByItemDetailsBloc,
          ),
        ],
        child: const Material(
          child: ViewByItemsPage(),
        ),
      );
    }

    testWidgets('loaderImage  test ', (tester) async {
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetching: true,
          orderHistory: OrderHistory.empty(),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final loaderImage = find.byKey(
        WidgetKeys.loaderImage,
      );
      expect(loaderImage, findsOneWidget);
    });

    testWidgets('no record section test when orderHistory is empty',
        (tester) async {
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final noRecordFound = find.byType(
        NoRecordFound,
      );
      expect(noRecordFound, findsOneWidget);
      expect(
        (tester.widget(noRecordFound) as NoRecordFound).svgImage,
        SvgImage.emptyBox,
      );
      expect(
        (tester.widget(noRecordFound) as NoRecordFound).title,
        'Hmm, looks like you don’t have any orders here.',
      );
      expect(
        (tester.widget(noRecordFound) as NoRecordFound).subTitle,
        'Items ordered on eZRx will appear here',
      );
    });

    testWidgets(
        'no record section test when orderHistory is empty after search',
        (tester) async {
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          searchKey: SearchKey.search('fake_key'),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final noRecordFound = find.byType(
        NoRecordFound,
      );
      expect(noRecordFound, findsOneWidget);
      expect(
        (tester.widget(noRecordFound) as NoRecordFound).svgImage,
        SvgImage.searchLogo,
      );
      expect(
        (tester.widget(noRecordFound) as NoRecordFound).title,
        'Hmm, that didn’t match anything.',
      );
      expect(
        (tester.widget(noRecordFound) as NoRecordFound).subTitle,
        'Try adjusting your search or filter to find what you’re looking for',
      );
    });

    testWidgets(
        'Show material combination code with GMC part when Government material code is enabled',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTWSalesOrgConfigs,
        ),
      );
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetching: false,
          orderHistory: orderHistory.copyWith(
            orderHistoryItems: fakeOrderHistoryItems,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final materialInfo = fakeOrderHistoryItems.first;
      final combinationCode = find.text(
        '${materialInfo.materialNumber.displayMatNo} | ${materialInfo.governmentMaterialCode}',
      );
      expect(combinationCode, findsOneWidget);
    });

    testWidgets(
        'Show material combination code without GMC part when Government material code is disabled',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetching: false,
          orderHistory: orderHistory.copyWith(
            orderHistoryItems: fakeOrderHistoryItems,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final materialInfo = fakeOrderHistoryItems.first;
      final materialNumber =
          find.text(materialInfo.materialNumber.displayMatNo);
      expect(materialNumber, findsOneWidget);
      final combinationCode = find.text(
        '${materialInfo.materialNumber.displayMatNo} | ${materialInfo.governmentMaterialCode}',
      );
      expect(combinationCode, findsNothing);
    });

    testWidgets('Displaying manufactureName  test ', (tester) async {
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetching: false,
          orderHistory: orderHistory.copyWith(
            orderHistoryItems: fakeOrderHistoryItems,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.text('fake_manufactureName_1'), findsOneWidget);
      expect(find.text('fake_manufactureName_2'), findsOneWidget);
    });

    testWidgets('Items - On refresh Feature', (tester) async {
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetching: false,
          orderHistory: orderHistory.copyWith(
            orderHistoryItems: fakeOrderHistoryItems,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.drag(
        find.textContaining('fake_manufactureName_1'),
        const Offset(0.0, 1000.0),
      );
      await tester.pump(const Duration(seconds: 1));
      expect(
        tester.getSemantics(find.byType(RefreshProgressIndicator)),
        matchesSemantics(
          label: 'Refresh',
        ),
      );

      await tester.pump(const Duration(seconds: 1));
      verify(
        () => mockViewByItemFilterBloc
            .add(const ViewByItemFilterEvent.initialize()),
      ).called(1);
      verify(
        () => mockViewByItemsBloc.add(
          ViewByItemsEvent.fetch(
            viewByItemFilter: ViewByItemFilter.empty(),
            searchKey: SearchKey.empty(),
          ),
        ),
      ).called(1);
    });

    testWidgets('Items - On loadMore Feature', (tester) async {
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          orderHistory: orderHistory,
          canLoadMore: true,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.fling(
        find.byKey(WidgetKeys.scrollList),
        const Offset(0.0, -5000.0),
        800.0,
      );
      verify(
        () => mockViewByItemsBloc.add(
          const ViewByItemsEvent.loadMore(),
        ),
      ).called(1);
    });

    testWidgets('Tap on view by item Tile ', (tester) async {
      final orderHistoryList = orderHistory.copyWith(
        orderHistoryItems: fakeOrderHistoryItems,
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeSalesOrganisation,
          shipToInfo: fakeShipToInfo,
          user: fakeRootAdminUser,
        ),
      );
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetching: false,
          orderHistory: orderHistoryList,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.tap(
        find.text(
          orderHistoryList.orderHistoryItems.first.principalData.principalName
              .getOrDefaultValue(''),
        ),
      );
      verify(
        () => mockViewByItemDetailsBloc.add(
          ViewByItemDetailsEvent.fetchOrderHistoryDetails(
            orderNumber: orderHistoryList.orderHistoryItems.first.orderNumber,
            lineNumber: orderHistoryList.orderHistoryItems.first.lineNumber,
          ),
        ),
      ).called(1);
      expect(
        autoRouterMock.current.name,
        'ViewByItemDetailsPageRoute',
      );
    });

    testWidgets('Invoice Number Loading', (tester) async {
      final orderHistoryList = orderHistory.copyWith(
        orderHistoryItems: [
          fakeOrderHistoryItems.first.copyWith(
            invoiceNumber: StringValue('fake-Invoice'),
          ),
        ],
      );
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetchingInvoices: false,
          orderHistory: orderHistoryList,
        ),
      );
      final expectedState = [
        ViewByItemsState.initial().copyWith(
          isFetchingInvoices: true,
          orderHistory: orderHistoryList,
        ),
      ];
      whenListen(
        mockViewByItemsBloc,
        Stream.fromIterable(expectedState),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byType(LoadingShimmer), findsOneWidget);
    });

    testWidgets('Invoice Number Loaded', (tester) async {
      final fakeInvoice = StringValue('fake-Invoice');
      final orderHistoryList = orderHistory.copyWith(
        orderHistoryItems: [
          fakeOrderHistoryItems.first.copyWith(
            invoiceNumber: fakeInvoice,
          ),
        ],
      );
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetchingInvoices: true,
          orderHistory: orderHistoryList,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(
        find.textContaining('Invoice #${fakeInvoice.getOrCrash()}'),
        findsOneWidget,
      );
    });

    testWidgets('Display marketplace icon and seller when order is from MP',
        (tester) async {
      final orderHistoryList = orderHistory.copyWith(
        orderHistoryItems: [
          orderHistory.orderHistoryItems.firstWhere((e) => e.isMarketPlace),
        ],
      );
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(orderHistory: orderHistoryList),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final historyTile = find.byKey(WidgetKeys.viewByItemsOrderItemKey);
      expect(historyTile, findsOneWidget);
      expect(
        find.descendant(
          of: historyTile,
          matching: find.byType(MarketPlaceLogo),
        ),
        findsOneWidget,
      );

      final sellerText = tester
          .widget<Text>(
            find.byKey(WidgetKeys.viewOrderByItemTileSubTitle),
          )
          .data;

      expect(sellerText, startsWith('Sold by: '));
    });

    testWidgets('Display queue number and tooltip when order is on hold',
        (tester) async {
      final mockOrderHistory = orderHistory.orderHistoryItems.first
          .copyWith(status: OrderStepValue('OnHold'));
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial()
            .copyWith
            .orderHistory(orderHistoryItems: [mockOrderHistory]),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final historyTile = find.byKey(WidgetKeys.viewByItemsOrderItemKey);
      expect(historyTile, findsOneWidget);
      expect(
        find.descendant(
          of: historyTile,
          matching: find.byType(QueueNumberInfoIcon),
        ),
        findsOneWidget,
      );
      expect(
        tester
            .widget<RichText>(
              find.byKey(WidgetKeys.viewByItemsOrderDetailOrderOrQueueNumber),
            )
            .text
            .toPlainText(),
        contains('Queue #${mockOrderHistory.orderNumber.getValue()}'),
      );
    });

    testWidgets('Display tender information when collapsed', (tester) async {
      final fakeTenderOrderReason = TenderContractReason('fake-Reason');
      final fakeTenderContractNumber = TenderContractNumber('fake-Number');
      final fakeTenderContractReference =
          TenderContractNumber('fake-Reference');
      final orderHistoryList = orderHistory.copyWith(
        orderHistoryItems: [
          orderHistory.orderHistoryItems
              .firstWhere((e) => e.tenderOrderReason.isNotEmpty)
              .copyWith(
                tenderContractNumber: fakeTenderContractNumber,
                tenderOrderReason: fakeTenderOrderReason,
                tenderPrice: 11832000.0,
                tenderContractReference: fakeTenderContractReference,
              ),
        ],
      );
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(orderHistory: orderHistoryList),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final historyTile = find.byKey(WidgetKeys.viewByItemsOrderItemKey);
      expect(historyTile, findsOneWidget);
      expect(
        find.descendant(
          of: historyTile,
          matching: find.byType(ExpansionTile),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: historyTile,
          matching: find.byWidgetPredicate(
            (widget) =>
                widget.key == WidgetKeys.tenderOrderReason &&
                widget is Text &&
                widget.data!.contains(
                  '${fakeTenderOrderReason.getOrCrash()} - Contract Tender',
                ),
          ),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: historyTile,
          matching: find.byWidgetPredicate(
            (widget) =>
                widget.key == WidgetKeys.tenderContractNumber &&
                widget is Text &&
                widget.data == fakeTenderContractNumber.getOrCrash(),
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Display tender information when expanded', (tester) async {
      final fakeTenderOrderReason = TenderContractReason('fake-Reason');
      final fakeTenderContractNumber = TenderContractNumber('fake-Number');
      const fakeTenderPrice = 11832000.0;
      final fakeTenderContractReference =
          TenderContractNumber('fake-Reference');
      final orderHistoryList = orderHistory.copyWith(
        orderHistoryItems: [
          orderHistory.orderHistoryItems
              .firstWhere((e) => e.tenderOrderReason.isNotEmpty)
              .copyWith(
                tenderContractNumber: fakeTenderContractNumber,
                tenderOrderReason: fakeTenderOrderReason,
                tenderPrice: fakeTenderPrice,
                tenderContractReference: fakeTenderContractReference,
              ),
        ],
      );
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(orderHistory: orderHistoryList),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final historyTile = find.byKey(WidgetKeys.viewByItemsOrderItemKey);
      final tenderExpandableSection =
          find.byKey(WidgetKeys.tenderExpandableSection);

      expect(historyTile, findsOneWidget);
      expect(
        find.descendant(
          of: historyTile,
          matching: find.byType(ExpansionTile),
        ),
        findsOneWidget,
      );

      await tester.tap(find.byKey(WidgetKeys.tenderExpandableSection));
      await tester.pump();

      expect(
        find.descendant(
          of: tenderExpandableSection,
          matching: find.byWidgetPredicate(
            (widget) =>
                widget.key == WidgetKeys.tenderContractReference &&
                widget is Text &&
                widget.data == fakeTenderContractReference.getOrCrash(),
          ),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: tenderExpandableSection,
          matching: find.byWidgetPredicate(
            (widget) =>
                widget.key == WidgetKeys.tenderContractPrice &&
                widget is PriceComponent &&
                widget.price == fakeTenderPrice.toString(),
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'Do not display tender information when Tender Order Reason is empty',
        (tester) async {
      final orderHistoryList = orderHistory.copyWith(
        orderHistoryItems: [
          orderHistory.orderHistoryItems
              .firstWhere((e) => e.tenderOrderReason.isEmpty),
        ],
      );

      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(orderHistory: orderHistoryList),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final historyTile = find.byKey(WidgetKeys.viewByItemsOrderItemKey);
      expect(historyTile, findsOneWidget);
      expect(
        find.descendant(
          of: historyTile,
          matching: find.byType(ExpansionTile),
        ),
        findsNothing,
      );
    });

    testWidgets('Show IRN when enableIRN is true', (tester) async {
      const iRNNumber = '12C 234/11';

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeTHSalesOrganisation,
          salesOrgConfigs: fakeTHSalesOrgConfigs.copyWith(
            enableIRN: true,
          ),
        ),
      );

      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetching: false,
          orderHistory: orderHistory.copyWith(
            orderHistoryItems: [
              fakeOrderHistoryItems.first.copyWith(
                itemRegistrationNumber: ItemRegistrationNumber(iRNNumber),
              ),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      expect(find.textContaining(iRNNumber), findsOneWidget);
    });

    testWidgets('Do not show IRN when enableIRN is false', (tester) async {
      const iRNNumber = '12C 234/11';

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeTHSalesOrganisation,
          salesOrgConfigs: fakeTHSalesOrgConfigs.copyWith(
            enableIRN: false,
          ),
        ),
      );

      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetching: false,
          orderHistory: orderHistory.copyWith(
            orderHistoryItems: [
              fakeOrderHistoryItems.first.copyWith(
                itemRegistrationNumber: ItemRegistrationNumber(iRNNumber),
              ),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      expect(find.textContaining(iRNNumber), findsNothing);
    });

    testWidgets('Display "FREE" for zero price', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeTHSalesOrganisation.copyWith(
            salesOrg: fakeMYSalesOrg,
          ),
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );

      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetching: false,
          orderHistory: orderHistory.copyWith(
            orderHistoryItems: [
              fakeOrderHistoryItems.first.copyWith(isBonusMaterial: true),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      expect(find.text('FREE', findRichText: true), findsOneWidget);
    });

    testWidgets('Do not display "FREE" for zero price in Indo market',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeTHSalesOrganisation.copyWith(
            salesOrg: fakeIDSalesOrg,
          ),
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        ),
      );

      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetching: false,
          orderHistory: orderHistory.copyWith(
            orderHistoryItems: [
              fakeOrderHistoryItems.first.copyWith(
                isBonusMaterial: true,
              ),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      expect(find.text('IDR 0', findRichText: true), findsOneWidget);
    });

    testWidgets(
      'display totalPrice for view by order item tile',
      (tester) async {
        final currentSalesOrgConfigVariant =
            salesOrgConfigVariant.currentValue ?? fakeIDSalesOrgConfigs;

        final currentSalesOrg = currentSalesOrgConfigVariant.salesOrg;

        final currentSalesOrganisation = fakeEmptySalesOrganisation.copyWith(
          salesOrg: currentSalesOrg,
        );

        final currency = currentSalesOrgConfigVariant.currency.code;
        const totalPrice = 20.0;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: currentSalesOrganisation,
            salesOrgConfigs: currentSalesOrgConfigVariant,
          ),
        );

        when(() => mockViewByItemsBloc.state).thenReturn(
          ViewByItemsState.initial().copyWith(
            isFetching: false,
            orderHistory: orderHistory.copyWith(
              orderHistoryItems: [
                fakeOrderHistoryItems.first.copyWith(
                  totalPrice: totalPrice,
                ),
              ],
            ),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.viewByOrderGrandTotalKey),
            matching: find.textContaining(
              currentSalesOrg.isID
                  ? totalPrice.priceDisplayForID(currency)
                  : totalPrice.priceDisplay(currency),
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      },
      variant: salesOrgConfigVariant,
    );

    testWidgets('Display Ordered on text', (tester) async {
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetching: false,
          orderHistory: orderHistory.copyWith(
            orderHistoryItems: fakeOrderHistoryItems,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      expect(
        find.text(
          'Ordered on ${fakeOrderHistoryItems.first.createdDate.dateString}',
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'Display Tender tag and offer tag for tender material when offer is applied',
        (tester) async {
      final fakeTenderOrderReason = TenderContractReason('fake-Reason');
      final fakeTenderContractNumber = TenderContractNumber('fake-Number');
      final fakeTenderContractReference =
          TenderContractNumber('fake-Reference');
      final orderHistoryList = orderHistory.copyWith(
        orderHistoryItems: [
          orderHistory.orderHistoryItems
              .firstWhere((e) => e.tenderOrderReason.isNotEmpty)
              .copyWith(
                tenderContractNumber: fakeTenderContractNumber,
                tenderOrderReason: fakeTenderOrderReason,
                tenderPrice: 11832000.0,
                tenderContractReference: fakeTenderContractReference,
                promoStatus: true,
                isBundle: false,
              ),
        ],
      );
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(orderHistory: orderHistoryList),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final offerTag = find.byKey(WidgetKeys.offerTag);
      expect(offerTag, findsOneWidget);
      final tenderTag = find.byKey(WidgetKeys.tenderTagForProductTile);
      expect(tenderTag, findsOneWidget);
    });

    testWidgets('Display Tender tag if material is ordered with tender',
        (tester) async {
      final fakeTenderContractNumber = TenderContractNumber('fake-Number');
      final orderHistoryList = orderHistory.copyWith(
        orderHistoryItems: [
          orderHistory.orderHistoryItems
              .firstWhere((e) => e.tenderOrderReason.isNotEmpty)
              .copyWith(
                tenderContractNumber: fakeTenderContractNumber,
              ),
        ],
      );
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(orderHistory: orderHistoryList),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final tenderTag = find.byKey(WidgetKeys.tenderTagForProductTile);
      expect(tenderTag, findsOneWidget);
    });
  });
}
