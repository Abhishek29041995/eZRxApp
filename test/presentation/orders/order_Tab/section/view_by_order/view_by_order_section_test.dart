import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/queue_number_info_icon.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../common_mock_data/customer_code_mock.dart';
import '../../../../../common_mock_data/mock_bloc.dart';
import '../../../../../common_mock_data/mock_other.dart';
import '../../../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../../../common_mock_data/user_mock.dart';
import '../../../../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late ViewByOrderBloc mockViewByOrderBloc;
  late ViewByOrderDetailsBloc mockViewByOrderDetailsBloc;
  late CartBloc cartBlocMock;
  late ReOrderPermissionBloc reOrderPermissionBlocMock;
  late AppRouter autoRouterMock;
  late ViewByOrder viewByOrder;
  late EligibilityBlocMock eligibilityBlocMock;
  late ViewByItemDetailsBloc mockViewByItemDetailsBloc;
  late MaterialPriceBloc materialPriceBlocMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late PoAttachmentBloc poAttachmentBlocMock;

  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    locator.registerFactory(() => reOrderPermissionBlocMock);
    locator.registerSingleton<MixpanelService>(MixpanelServiceMock());
    locator.registerSingleton<ClevertapService>(ClevertapServiceMock());
    viewByOrder = await ViewByOrderLocalDataSource().getViewByOrders();
    locator.registerLazySingleton(() => AutoRouteMock());
    autoRouterMock = locator<AutoRouteMock>();
    cartBlocMock = CartBlocMock();
    materialPriceBlocMock = MaterialPriceBlocMock();
    additionalDetailsBlocMock = AdditionalDetailsBlocMock();
    poAttachmentBlocMock = PoAttachmentBlocMock();
  });

  setUp(() {
    mockViewByOrderBloc = ViewByOrderBlocMock();
    mockViewByOrderDetailsBloc = ViewByOrderDetailsBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    cartBlocMock = CartBlocMock();
    reOrderPermissionBlocMock = ReOrderPermissionBlocMock();
    mockViewByItemDetailsBloc = ViewByItemDetailsBlocMock();
    when(() => mockViewByOrderBloc.state)
        .thenReturn(ViewByOrderState.initial());
    when(() => cartBlocMock.state).thenReturn(CartState.initial());
    when(() => reOrderPermissionBlocMock.state)
        .thenReturn(ReOrderPermissionState.initial());
    when(() => mockViewByOrderDetailsBloc.state)
        .thenReturn(ViewByOrderDetailsState.initial());
    when(() => mockViewByItemDetailsBloc.state)
        .thenReturn(ViewByItemDetailsState.initial());
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial().copyWith(
        user: fakeClientUser.copyWith(
          enableOrderType: true,
          acceptMPTC: MarketPlaceTnCAcceptance.accept(),
          acceptPrivacyPolicy: true,
        ),
        salesOrganisation: fakeSGSalesOrganisation,
        salesOrgConfigs: fakeMYSalesOrgConfigs,
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          customerAttr7: CustomerAttr7('ZEV'),
          customerGrp4: CustomerGrp4('VR'),
          isMarketPlace: true,
        ),
      ),
    );
    when(() => materialPriceBlocMock.state).thenReturn(
      MaterialPriceState.initial(),
    );
    when(() => additionalDetailsBlocMock.state).thenReturn(
      AdditionalDetailsState.initial(),
    );
    when(() => poAttachmentBlocMock.state)
        .thenReturn(PoAttachmentState.initial());
  });

  //////////////////Finder////////////////////////////////////////////////////
  final viewByOrdersItemKey = find.byKey(WidgetKeys.viewByOrdersItemKey);
  final viewByOrdersGroupKey = find.byKey(WidgetKeys.viewByOrdersGroupKey);

  ////////////////////////////////////////////////////////////////////////////

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      routeName: ViewByOrdersPageRoute.name,
      providers: [
        BlocProvider<ViewByOrderBloc>(
          create: (context) => mockViewByOrderBloc,
        ),
        BlocProvider<ViewByOrderDetailsBloc>(
          create: (context) => mockViewByOrderDetailsBloc,
        ),
        BlocProvider<EligibilityBloc>(
          create: ((context) => eligibilityBlocMock),
        ),
        BlocProvider<CartBloc>(
          create: ((context) => cartBlocMock),
        ),
        BlocProvider<ReOrderPermissionBloc>(
          create: ((context) => reOrderPermissionBlocMock),
        ),
        BlocProvider<ViewByItemDetailsBloc>(
          create: ((context) => mockViewByItemDetailsBloc),
        ),
        BlocProvider<MaterialPriceBloc>(
          create: ((context) => materialPriceBlocMock),
        ),
        BlocProvider<AdditionalDetailsBloc>(
          create: (context) => additionalDetailsBlocMock,
        ),
        BlocProvider<PoAttachmentBloc>(
          create: (context) => poAttachmentBlocMock,
        ),
      ],
      child: const Material(
        child: ViewByOrdersPage(),
      ),
    );
  }

  group('Order History ViewByOrdersPage -', () {
    testWidgets('loaderImage  test ', (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          isFetching: true,
          viewByOrderList:
              viewByOrder.copyWith(orderHeaders: <OrderHistoryDetails>[]),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final loaderImage = find.byKey(
        WidgetKeys.loaderImage,
      );
      expect(loaderImage, findsOneWidget);
    });

    testWidgets('no record section test when viewByOrderList is empty',
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
        'no record section test when viewByOrderList is empty after search',
        (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
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
    testWidgets("Displaying 'items' text test ", (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder.copyWith(
            orderHeaders: [OrderHistoryDetails.empty().copyWith(itemCount: 2)],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final materials = find.text(
        '{qty} items'.tr(namedArgs: {'qty': '2'}),
      );
      expect(materials, findsOneWidget);
    });

    testWidgets('Displaying order total value', (tester) async {
      const totalValue = 500.0;
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder.copyWith(
            orderHeaders: [
              viewByOrder.orderHeaders.first.copyWith(
                totalValue: totalValue,
              ),
            ],
          ),
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final totalOrderPriceFinder = find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text.toPlainText().contains(totalValue.toString()),
      );
      expect(totalOrderPriceFinder, findsOneWidget);
    });

    testWidgets(
        'Buy again button not visible when disable create order flag true',
        (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder.copyWith(
            orderHeaders: [OrderHistoryDetails.empty().copyWith(itemCount: 2)],
          ),
          user: User.empty().copyWith(
            disableCreateOrder: true,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final buyAgainButton =
          find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);

      expect(buyAgainButton, findsNothing);
    });

    testWidgets('Buy again button visible when disable create order flag false',
        (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final buyAgainButton =
          find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);

      expect(buyAgainButton, findsWidgets);
      await tester.tap(buyAgainButton.first);
      await tester.pumpAndSettle();
      verify(
        () => reOrderPermissionBlocMock.add(
          ReOrderPermissionEvent.fetchOrder(
            orderHistoryDetailsOrderItems:
                viewByOrder.orderHeaders.first.orderHistoryDetailsOrderItem,
            orderNumberWillUpsert: viewByOrder.orderHeaders.first.orderNumber,
          ),
        ),
      ).called(1);
    });

    testWidgets('view by order multiple groupe', (tester) async {
      final expectedStatue = [
        ViewByOrderState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-exception'))),
        ),
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder.copyWith(
            orderHeaders: [
              viewByOrder.orderHeaders.first,
              viewByOrder.orderHeaders.last.copyWith(
                createdDate: DateTimeStringValue(
                  viewByOrder.orderHeaders.last.createdDate.dateTime
                      .add(const Duration(days: 3))
                      .toString(),
                ),
              ),
            ],
          ),
        ),
      ];
      whenListen(mockViewByOrderBloc, Stream.fromIterable(expectedStatue));

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final divider = find.byType(Divider);
      expect(divider, findsOneWidget);
      expect(viewByOrdersGroupKey, findsNWidgets(2));
    });

    testWidgets('Buy again button go to cart page', (tester) async {
      final deliveryInfo = DeliveryInfoData.empty();
      when(() => autoRouterMock.isRouteActive(ViewByOrdersPageRoute.name))
          .thenReturn(true);
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder
              .copyWith(orderHeaders: [viewByOrder.orderHeaders.first]),
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      whenListen(
        reOrderPermissionBlocMock,
        Stream.fromIterable(
          [
            ReOrderPermissionState.initial().copyWith(
              isFetching: true,
              orderNumberWillUpsert: viewByOrder.orderHeaders.first.orderNumber,
            ),
            ReOrderPermissionState.initial().copyWith(
              orderNumberWillUpsert: viewByOrder.orderHeaders.first.orderNumber,
            ),
          ],
        ),
      );

      whenListen(
        cartBlocMock,
        Stream.fromIterable(
          [
            CartState.initial().copyWith(
              isFetching: true,
              isBuyAgain: true,
            ),
            CartState.initial().copyWith(
              isBuyAgain: false,
              cartProducts: [],
            ),
          ],
        ),
      );
      when(
        () => autoRouterMock.currentPath,
      ).thenAnswer((invocation) => 'orders/view_by_order_details');
      when(
        () => autoRouterMock.push(
          CartPageRoute(
            isReOrder: true,
            deliveryInfo: deliveryInfo,
          ),
        ),
      ).thenAnswer((invocation) => Future(() => null));
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final buyAgainButton =
          find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);

      expect(buyAgainButton, findsOneWidget);
      verify(
        () => cartBlocMock.add(
          CartEvent.addHistoryItemsToCart(
            items: [],
            counterOfferDetails: RequestCounterOfferDetails.empty(),
            tenderContractList: {},
          ),
        ),
      ).called(1);
      verify(
        () => reOrderPermissionBlocMock.add(
          ReOrderPermissionEvent.resetOrderNumberWillUpsert(
            orderNumberWillUpsert: OrderNumber(''),
          ),
        ),
      ).called(1);
      verify(
        () => autoRouterMock.push(
          CartPageRoute(
            isReOrder: true,
            deliveryInfo: deliveryInfo,
          ),
        ),
      ).called(1);
    });

    testWidgets('Show snackbar when add reorder items to cart failure',
        (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder
              .copyWith(orderHeaders: [viewByOrder.orderHeaders.first]),
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => reOrderPermissionBlocMock.state).thenReturn(
        ReOrderPermissionState.initial().copyWith(
          orderNumberWillUpsert: viewByOrder.orderHeaders.first.orderNumber,
        ),
      );

      whenListen(
        cartBlocMock,
        Stream.fromIterable(
          [
            CartState.initial().copyWith(isBuyAgain: true),
            CartState.initial().copyWith(
              apiFailureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other('test'))),
            ),
          ],
        ),
      );
      when(
        () => autoRouterMock.currentPath,
      ).thenAnswer((invocation) => 'orders/view_by_order_details');

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      expect(
        find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey),
        findsOneWidget,
      );

      verify(
        () => reOrderPermissionBlocMock.add(
          ReOrderPermissionEvent.resetOrderNumberWillUpsert(
            orderNumberWillUpsert: OrderNumber(''),
          ),
        ),
      ).called(1);
    });

    testWidgets('Show snackbar when get reorder permission failure',
        (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder
              .copyWith(orderHeaders: [viewByOrder.orderHeaders.first]),
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      whenListen(
        reOrderPermissionBlocMock,
        Stream.fromIterable(
          [
            ReOrderPermissionState.initial().copyWith(
              isFetching: true,
              orderNumberWillUpsert: viewByOrder.orderHeaders.first.orderNumber,
            ),
            ReOrderPermissionState.initial().copyWith(
              orderNumberWillUpsert: viewByOrder.orderHeaders.first.orderNumber,
              failureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other('test'))),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      expect(
        find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.customSnackBarMessage),
        findsOneWidget,
      );
    });

    testWidgets('Test order total price visibility with tax', (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder.copyWith(
            orderHeaders: [
              viewByOrder.orderHeaders.first.copyWith(
                orderValue: 364.80,
                totalTax: 20,
                totalValue: 384.80,
              ),
            ],
          ),
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final totalOrderValue =
          find.text('Order total : SGD 384.80', findRichText: true);

      expect(totalOrderValue, findsOneWidget);
    });

    testWidgets(
      'view by order reload',
      (tester) async {
        when(() => mockViewByOrderBloc.state).thenReturn(
          ViewByOrderState.initial().copyWith(
            viewByOrderList: viewByOrder,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        await tester.fling(
          find.byKey(WidgetKeys.viewByOrdersGroupList),
          const Offset(0.0, 200.0),
          800.0,
        );
        expect(
          find.byType(RefreshProgressIndicator),
          findsOneWidget,
        );
        await tester.pumpAndSettle();
        verify(
          () => mockViewByOrderBloc.add(
            ViewByOrderEvent.fetch(
              filter: ViewByOrdersFilter.empty(),
              searchKey: SearchKey.empty(),
              isDetailsPage: false,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'view by order load more',
      (tester) async {
        when(() => mockViewByOrderBloc.state).thenReturn(
          ViewByOrderState.initial().copyWith(
            viewByOrderList: viewByOrder,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        await tester.fling(
          find.byKey(WidgetKeys.viewByOrdersGroupList),
          const Offset(0.0, -1500.0),
          800.0,
        );
        await tester.pumpAndSettle();
        verify(
          () => mockViewByOrderBloc.add(
            const ViewByOrderEvent.loadMore(),
          ),
        ).called(1);
      },
    );
    testWidgets(
      'view by order error',
      (tester) async {
        whenListen(
          mockViewByOrderBloc,
          Stream.fromIterable([
            ViewByOrderState.initial().copyWith(
              failureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('fake-exception'),
                ),
              ),
            ),
          ]),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.fling(
          find.byKey(WidgetKeys.viewByOrdersGroupList),
          const Offset(0.0, 150.0),
          800.0,
        );
        await tester.pumpAndSettle();
        final snackBar = find.widgetWithText(
          CustomSnackBar,
          'fake-exception',
        );
        expect(snackBar, findsOneWidget);
      },
    );

    testWidgets(
      'view by order details page',
      (tester) async {
        when(() => mockViewByOrderBloc.state).thenReturn(
          ViewByOrderState.initial().copyWith(
            viewByOrderList: viewByOrder,
            user: User.empty().copyWith(
              disableCreateOrder: true,
            ),
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: User.empty().copyWith(
              disableCreateOrder: true,
            ),
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
          ),
        );
        when(
          () => autoRouterMock.push(const ViewByOrderDetailsPageRoute()),
        ).thenAnswer((invocation) => Future(() => null));
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(viewByOrdersGroupKey, findsWidgets);
        expect(viewByOrdersItemKey, findsWidgets);
        await tester.tap(viewByOrdersItemKey.first);
        await tester.pumpAndSettle();
        verify(
          () => mockViewByOrderDetailsBloc.add(
            ViewByOrderDetailsEvent.fetch(
              orderNumber: viewByOrder.orderHeaders.first.orderNumber,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
        'Find Add To Cart Error Section when buy again button pressed for covid material when cart have commercial material',
        (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder.copyWith(
            orderHeaders: [
              viewByOrder.orderHeaders.first.copyWith(
                isMarketPlace: false,
                orderHistoryDetailsOrderItem: [
                  viewByOrder
                      .orderHeaders.first.orderHistoryDetailsOrderItem.first
                      .copyWith(
                    isCovid: true,
                  ),
                ],
              ),
            ],
          ),
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );

      when(() => cartBlocMock.state).thenReturn(
        CartState.initial().copyWith(
          isUpserting: false,
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              isCovid: false,
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final buyAgainButton =
          find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);

      expect(buyAgainButton, findsWidgets);
      final addToCartErrorSection =
          find.byKey(WidgetKeys.addToCartErrorSection);
      await tester.tap(buyAgainButton.first);
      await tester.pump(const Duration(seconds: 2));
      expect(addToCartErrorSection, findsOneWidget);
    });

    testWidgets(
        'Find Add To Cart Error Section when buy again button pressed for commercial material when cart have covid material',
        (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder.copyWith(
            orderHeaders: [
              viewByOrder.orderHeaders.first.copyWith(
                isMarketPlace: false,
                orderHistoryDetailsOrderItem: [
                  viewByOrder
                      .orderHeaders.first.orderHistoryDetailsOrderItem.first
                      .copyWith(
                    isCovid: false,
                  ),
                ],
              ),
            ],
          ),
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );

      when(() => cartBlocMock.state).thenReturn(
        CartState.initial().copyWith(
          isUpserting: false,
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              isCovid: true,
              materialInfo: MaterialInfo.empty().copyWith(
                isFOCMaterial: true,
              ),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final buyAgainButton =
          find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);

      expect(buyAgainButton, findsWidgets);
      final addToCartErrorSection =
          find.byKey(WidgetKeys.addToCartErrorSection);
      await tester.tap(buyAgainButton.first);
      await tester.pump(const Duration(seconds: 2));
      expect(addToCartErrorSection, findsOneWidget);
    });

    group('Order status label -', () {
      setUp(() {
        when(() => mockViewByOrderBloc.state).thenReturn(
          ViewByOrderState.initial().copyWith(
            viewByOrderList: viewByOrder,
          ),
        );
      });

      testWidgets('not displayed by default', (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final orderItems = find.byKey(WidgetKeys.viewByOrdersItemKey);
        final orderCount = viewByOrder.orderHeaders.length;
        expect(
          orderItems,
          findsNWidgets(orderCount),
        );
        expect(
          find.descendant(of: orderItems, matching: find.byType(StatusLabel)),
          findsNothing,
        );
      });
      testWidgets('displayed in ID market', (tester) async {
        when(() => mockViewByOrderBloc.state).thenReturn(
          ViewByOrderState.initial().copyWith(
            viewByOrderList: viewByOrder,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final orderItems = find.byKey(WidgetKeys.viewByOrdersItemKey);
        final orderCount = viewByOrder.orderHeaders.length;
        expect(
          orderItems,
          findsNWidgets(orderCount),
        );
        expect(
          find.descendant(of: orderItems, matching: find.byType(StatusLabel)),
          findsNWidgets(orderCount),
        );
      });
      testWidgets('Display MarketPlace logo on MP order ', (tester) async {
        when(() => mockViewByOrderBloc.state).thenReturn(
          ViewByOrderState.initial().copyWith(
            viewByOrderList: viewByOrder,
          ),
        );
        final mpItemsCount = viewByOrder.orderHeaders
            .where((order) => order.isMarketPlace)
            .length;
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(
          find.byType(MarketPlaceLogo),
          findsNWidgets(mpItemsCount),
        );
      });

      testWidgets('Display queue number and tooltip when order is on hold',
          (tester) async {
        final fakeOrderHistory = viewByOrder.orderHeaders.first
            .copyWith(processingStatus: OrderStepValue('OnHold'));
        when(() => mockViewByOrderBloc.state).thenReturn(
          ViewByOrderState.initial().copyWith.viewByOrderList(
            orderHeaders: [fakeOrderHistory],
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        final orderItems = find.byKey(WidgetKeys.viewByOrdersItemKey);
        expect(orderItems, findsOneWidget);
        expect(
          find.descendant(
            of: orderItems,
            matching: find.byType(QueueNumberInfoIcon),
          ),
          findsOneWidget,
        );
        expect(
          tester
              .widget<RichText>(find.byKey(WidgetKeys.viewByOrdersCodeLabelKey))
              .text
              .toPlainText(),
          contains('Queue #${fakeOrderHistory.orderNumber.getValue()}'),
        );
      });

      testWidgets(
          'Buy Again Button not shown for MP orders when marketPlace is not enabled',
          (tester) async {
        when(() => mockViewByOrderBloc.state).thenReturn(
          ViewByOrderState.initial().copyWith(
            viewByOrderList: viewByOrder.copyWith(
              orderHeaders: [
                OrderHistoryDetails.empty().copyWith(
                  isMarketPlace: true,
                ),
              ],
            ),
            salesOrgConfigs: fakeSGSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final buyAgainButton =
            find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);

        expect(buyAgainButton, findsNothing);
      });

      testWidgets(
          'Buy Again Button shown for MP orders when marketPlace is enabled',
          (tester) async {
        when(() => mockViewByOrderBloc.state).thenReturn(
          ViewByOrderState.initial().copyWith(
            viewByOrderList: viewByOrder.copyWith(
              orderHeaders: [
                OrderHistoryDetails.empty().copyWith(
                  isMarketPlace: true,
                ),
              ],
            ),
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final buyAgainButton =
            find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);

        expect(buyAgainButton, findsOneWidget);
      });
    });

    testWidgets('view by order with created date grouping', (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder.copyWith(
            orderHeaders: [
              viewByOrder.orderHeaders.first.copyWith(
                createdDate: DateTimeStringValue(
                  DateTime.parse('2023-08-11')
                      .add(const Duration(hours: 1))
                      .toString(),
                ),
              ),
              viewByOrder.orderHeaders.first.copyWith(
                createdDate: DateTimeStringValue(
                  DateTime.parse('2023-08-11')
                      .add(const Duration(hours: 3))
                      .toString(),
                ),
              ),
              viewByOrder.orderHeaders.first.copyWith(
                createdDate: DateTimeStringValue(
                  DateTime.parse('2023-08-12').toString(),
                ),
              ),
            ],
          ),
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final divider = find.byType(Divider);
      expect(divider, findsOneWidget);
      expect(viewByOrdersGroupKey, findsNWidgets(2));
    });
  });
}
