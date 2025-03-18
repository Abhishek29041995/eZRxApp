import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/govt_list_price_component.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/recent_order/recent_order_section.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

class ViewByItemsBlocMock extends MockBloc<ViewByItemsEvent, ViewByItemsState>
    implements ViewByItemsBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ViewByItemDetailsBlocMock
    extends MockBloc<ViewByItemDetailsEvent, ViewByItemDetailsState>
    implements ViewByItemDetailsBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MockAppRouter extends Mock implements AppRouter {}

void main() {
  late ViewByItemsBloc viewByItemsBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late ProductImageBloc productImageBlocMock;
  late ViewByItemDetailsBloc viewByItemDetailsBlocMock;
  late AppRouter autoRouterMock;
  late OrderHistory fakeOrderHistory;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => MockAppRouter());
    eligibilityBlocMock = EligibilityBlocMock();
    viewByItemsBlocMock = ViewByItemsBlocMock();
    productImageBlocMock = ProductImageBlocMock();
    viewByItemDetailsBlocMock = ViewByItemDetailsBlocMock();
    locator.registerLazySingleton(() => viewByItemsBlocMock);
    autoRouterMock = locator<MockAppRouter>();
    fakeOrderHistory = await ViewByItemLocalDataSource().getViewByItems();
  });

  setUp(() {
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => viewByItemsBlocMock.state)
        .thenReturn(ViewByItemsState.initial());
    when(() => productImageBlocMock.state)
        .thenReturn(ProductImageState.initial());
    when(() => viewByItemDetailsBlocMock.state)
        .thenReturn(ViewByItemDetailsState.initial());
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<ViewByItemsBloc>(
          create: (context) => viewByItemsBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<ProductImageBloc>(
          create: (context) => productImageBlocMock,
        ),
        BlocProvider<ViewByItemDetailsBloc>(
          create: (context) => viewByItemDetailsBlocMock,
        ),
      ],
      child: const Material(
        child: RecentOrdersSection(),
      ),
    );
  }

  group('RecentOrderSection test - ', () {
    testWidgets('Calling initialize when fetching eligibility done',
        (tester) async {
      whenListen(
        eligibilityBlocMock,
        Stream.fromIterable(
          [
            EligibilityState.initial().copyWith(isLoadingCustomerCode: true),
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeMYSalesOrgConfigs,
              customerCodeInfo: fakeCustomerCodeInfo,
              shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
              user: fakeClientUser,
              salesOrganisation: fakeSalesOrganisation,
            ),
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      verify(
        () => viewByItemsBlocMock.add(
          ViewByItemsEvent.initialized(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClientUser,
            salesOrganisation: fakeSalesOrganisation,
          ),
        ),
      ).called(1);
    });

    testWidgets('View By Order Fetching', (tester) async {
      when(
        () => viewByItemsBlocMock.state,
      ).thenAnswer(
        (invocation) => ViewByItemsState.initial().copyWith(
          isFetching: true,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [
              OrderHistoryItem.empty(),
            ],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(
        find.byKey(WidgetKeys.recentOrderSectionLoaderImage),
        findsOneWidget,
      );
      final recentOrderButtonFinder = find
          .byKey(WidgetKeys.sectionTileIcon('Your recent order items'.tr()));
      expect(recentOrderButtonFinder, findsOneWidget);
      await tester.tap(recentOrderButtonFinder);
      verifyNever(() => autoRouterMock.navigate(const OrdersTabRoute()));
    });

    testWidgets('View By Order Show Items', (tester) async {
      whenListen(
        viewByItemsBlocMock,
        Stream.fromIterable([
          ViewByItemsState.initial().copyWith(
            isFetching: true,
          ),
          ViewByItemsState.initial().copyWith(
            orderHistory: OrderHistory.empty().copyWith(
              orderHistoryItems: [
                OrderHistoryItem.empty(),
              ],
            ),
          ),
        ]),
      );
      when(() => autoRouterMock.navigate(const OrdersTabRoute()))
          .thenAnswer((invocation) => Future.value());
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final recentOrderButtonFinder = find
          .byKey(WidgetKeys.sectionTileIcon('Your recent order items'.tr()));
      expect(recentOrderButtonFinder, findsOneWidget);
      await tester.tap(recentOrderButtonFinder);
      verify(() => autoRouterMock.navigate(const OrdersTabRoute())).called(1);
    });

    testWidgets('Tap on Item', (tester) async {
      final fakeOrderHistory = OrderHistory.empty().copyWith(
        orderHistoryItems: [
          OrderHistoryItem.empty(),
        ],
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
      when(
        () => viewByItemsBlocMock.state,
      ).thenAnswer(
        (invocation) => ViewByItemsState.initial().copyWith(
          orderHistory: fakeOrderHistory,
        ),
      );

      when(() => autoRouterMock.push(const ViewByItemDetailsPageRoute()))
          .thenAnswer((invocation) => Future.value());

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(WidgetKeys.listRecentlyOrdered).first);
      verify(
        () => viewByItemDetailsBlocMock.add(
          ViewByItemDetailsEvent.fetchOrderHistoryDetails(
            orderNumber: fakeOrderHistory.orderHistoryItems.first.orderNumber,
            lineNumber: fakeOrderHistory.orderHistoryItems.first.lineNumber,
          ),
        ),
      ).called(1);
      verify(
        () => autoRouterMock.push(
          const ViewByItemDetailsPageRoute(),
        ),
      ).called(1);
    });

    testWidgets('Show GovtListPriceComponent for material item',
        (tester) async {
      when(
        () => viewByItemsBlocMock.state,
      ).thenAnswer(
        (invocation) => ViewByItemsState.initial().copyWith(
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [
              fakeOrderHistory.orderHistoryItems.first,
            ],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byType(GovtListPriceComponent), findsNothing);
    });
  });

  testWidgets('Find Offer tag for offer items', (tester) async {
    final fakeOrderHistory = OrderHistory.empty().copyWith(
      orderHistoryItems: [
        OrderHistoryItem.empty().copyWith(
          promoStatus: true,
          isBonusMaterial: false,
        ),
        OrderHistoryItem.empty().copyWith(
          isBonusMaterial: true,
          promoStatus: false,
        ),
      ],
    );
    when(
      () => viewByItemsBlocMock.state,
    ).thenAnswer(
      (invocation) => ViewByItemsState.initial().copyWith(
        orderHistory: fakeOrderHistory,
      ),
    );

    await tester.pumpWidget(getScopedWidget());
    await tester.pumpAndSettle();

    final offerTagProduct = find.byKey(WidgetKeys.offerTag);

    expect(offerTagProduct, findsOneWidget);
  });

  testWidgets('Ezrx Number should not be displayed along with material number',
      (tester) async {
    when(
      () => viewByItemsBlocMock.state,
    ).thenAnswer(
      (invocation) => ViewByItemsState.initial().copyWith(
        orderHistory: OrderHistory.empty().copyWith(
          orderHistoryItems: [
            fakeOrderHistory.orderHistoryItems.first,
          ],
        ),
      ),
    );

    await tester.pumpWidget(getScopedWidget());
    await tester.pump();
    final recentOrderProductLabelFinder = find.text('23008138 | EZRX-1720e3e');
    expect(recentOrderProductLabelFinder, findsNothing);
  });
  testWidgets('Find MarketPlace tag for MarketPlace items', (tester) async {
    when(
      () => viewByItemsBlocMock.state,
    ).thenAnswer(
      (invocation) => ViewByItemsState.initial().copyWith(
        orderHistory: fakeOrderHistory,
      ),
    );

    final mpItemsCount = fakeOrderHistory.orderHistoryItems
        .where((element) => element.isMarketPlace)
        .length;
    await tester.pumpWidget(getScopedWidget());
    await tester.pumpAndSettle();
    final marketPlaceLogo = find.byType(MarketPlaceLogo, skipOffstage: false);
    expect(
      marketPlaceLogo,
      findsNWidgets(mpItemsCount),
    );
  });

  testWidgets('Hide List Price section for bonus materials', (tester) async {
    when(
      () => eligibilityBlocMock.state,
    ).thenAnswer(
      (invocation) => EligibilityState.initial().copyWith(
        salesOrgConfigs: fakeTWSalesOrgConfigs,
      ),
    );
    when(
      () => viewByItemsBlocMock.state,
    ).thenAnswer(
      (invocation) => ViewByItemsState.initial().copyWith(
        orderHistory: fakeOrderHistory.copyWith(
          orderHistoryItems: [
            fakeOrderHistory.orderHistoryItems.first,
            fakeOrderHistory.orderHistoryItems.first
                .copyWith(isBonusMaterial: true),
          ],
        ),
      ),
    );

    await tester.pumpWidget(getScopedWidget());
    await tester.pumpAndSettle();

    final freeText = find.text('List price: FREE', findRichText: true);
    expect(freeText, findsNothing);
  });

  testWidgets('Show covid tag for covid materials', (tester) async {
    final fakeOrderHistory = OrderHistory.empty().copyWith(
      orderHistoryItems: [
        OrderHistoryItem.empty().copyWith(
          isCovid: true,
        ),
      ],
    );
    when(
      () => viewByItemsBlocMock.state,
    ).thenAnswer(
      (invocation) => ViewByItemsState.initial().copyWith(
        orderHistory: fakeOrderHistory,
      ),
    );

    await tester.pumpWidget(getScopedWidget());
    await tester.pumpAndSettle();

    expect(find.byKey(WidgetKeys.covidLabel), findsOneWidget);
  });
}
