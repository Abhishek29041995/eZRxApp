import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/apl_get_total_price.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/num_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/price_summary/price_summary_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';

import '../../../../common_mock_data/customer_code_mock.dart';
import '../../../../common_mock_data/mock_bloc.dart';
import '../../../../common_mock_data/mock_other.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_mm_sales_org_config.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../../common_mock_data/user_mock.dart';
import '../../../../utils/widget_utils.dart';

class MaterialPageXMock extends Mock implements AutoRoutePage {}

class CartStateMock extends Mock implements CartState {}

void main() {
  late EligibilityBloc eligibilityBloc;
  late CartBloc cartBloc;
  late OrderEligibilityBloc orderEligibilityBloc;
  late AppRouter autoRouter;
  const listPrice = 123.0;
  const finalPrice = 99.32;
  const qty = 2;
  late AplSimulatorOrder aplSimulatorOrder;
  final item = PriceAggregate.empty().copyWith(
    price: Price.empty().copyWith(
      finalPrice: MaterialPrice(finalPrice),
      lastPrice: MaterialPrice(listPrice),
      finalTotalPrice: MaterialPrice(finalPrice * qty),
    ),
    quantity: qty,
  );

  late List<PriceAggregate> mockCartBundleItems;
  late List<PriceAggregate> cartItemMock;
  late List<ComboMaterialItem> fakeComboMaterialItems;
  late CartState cartStateMock;
  late final inStockMaterial = cartItemMock
      .firstWhere(
    (e) => e.materialInfo.type.typeMaterial && !e.materialInfo.isMarketPlace,
  )
      .copyWith(
    stockInfoList: [
      StockInfo.empty().copyWith(inStock: MaterialInStock('Yes')),
    ],
    bonusSampleItems: [],
  );

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerFactory<AppRouter>(() => AutoRouteMock());
    autoRouter = locator<AppRouter>();
    mockCartBundleItems = await CartLocalDataSource().upsertCart(
      type: UpsertCartLocalType.upsertCartItems,
    );
    aplSimulatorOrder = await CartLocalDataSource().aplSimulateOrder();
    cartItemMock =
        (await CartLocalDataSource().getAddedToCartProductList()).cartProducts;
    fakeComboMaterialItems = (await CartLocalDataSource().upsertCart(
      type: UpsertCartLocalType.upsertCartItemsComboOffer,
    ))
        .comboMaterialItemList;
  });

  RouteData fakeRouteData(String name) => RouteData(
        stackKey: const Key(''),
        type: const RouteType.adaptive(),
        route: RouteMatch(
          segments: const [],
          stringMatch: '',
          key: ValueKey(name),
          config: AutoRoute(
            page: PageInfo(name),
          ),
        ),
        router: autoRouter,
        pendingChildren: [],
      );

  setUp(
    () {
      cartBloc = CartBlocMock();
      eligibilityBloc = EligibilityBlocMock();
      orderEligibilityBloc = OrderEligibilityBlocMock();
      cartStateMock = CartStateMock();
      when(() => cartBloc.state).thenReturn(CartState.initial());
      when(() => orderEligibilityBloc.state)
          .thenReturn(OrderEligibilityState.initial());
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
      when(() => autoRouter.current).thenReturn(fakeRouteData(''));
      when(() => cartStateMock.cartProducts).thenReturn([]);
      // when(() => cartStateMock.checkoutSubTotalHidePriceMaterial).thenReturn(0);
      when(() => cartStateMock.subTotalHidePriceMaterial).thenReturn(0);
      when(() => cartStateMock.grandTotalPriceDisplayed()).thenReturn(0);
      when(() => cartStateMock.totalSavingDisplayed()).thenReturn('0');
      when(() => cartStateMock.subTotalPriceDisplay()).thenReturn('0');
      when(() => cartStateMock.salesOrganisation)
          .thenReturn(fakeMYSalesOrganisation);
    },
  );

  Widget getWidget(CartState state) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouter,
      usingLocalization: true,
      providers: [
        BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
        BlocProvider<CartBloc>(create: (context) => cartBloc),
        BlocProvider<OrderEligibilityBloc>(
          create: (context) => orderEligibilityBloc,
        ),
      ],
      child: PriceSummarySection(cartState: state),
    );
  }

  group('Test Price summary section', () {
    group('Total saving', () {
      final widget = find.byKey(WidgetKeys.checkoutSummaryTotalSaving);
      final totalSaving =
          NumUtils.roundToPlaces((listPrice - finalPrice) * qty, 0);

      testWidgets('Show calculated value in cart page in ID market',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [item],
          salesOrganisation: fakeIDSalesOrganisation,
        );
        final totalSavingText = StringUtils.priceComponentDisplayPrice(
          fakeIDSalesOrgConfigs,
          totalSaving,
          false,
        );
        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();
        expect(widget, findsOneWidget);
        expect(
          find.descendant(
            of: widget,
            matching: find.textContaining(totalSavingText, findRichText: true),
          ),
          findsOneWidget,
        );
      });

      testWidgets('Show value from API in checkout page in ID market',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [item],
          salesOrganisation: fakeIDSalesOrganisation,
          aplSimulatorOrder: aplSimulatorOrder,
        );
        final totalSavingText = StringUtils.priceComponentDisplayPrice(
          fakeIDSalesOrgConfigs,
          aplSimulatorOrder.totalDiscountValue,
          false,
        );
        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CheckoutPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();
        expect(widget, findsOneWidget);
        expect(
          find.descendant(
            of: widget,
            matching: find.textContaining(totalSavingText, findRichText: true),
          ),
          findsOneWidget,
        );
      });

      testWidgets('Not displayed in cart page', (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [item],
          salesOrganisation: fakeMYSalesOrganisation,
        );
        final totalSavingText = StringUtils.priceComponentDisplayPrice(
          fakeMYSalesOrgConfigs,
          0,
          false,
        );
        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();
        expect(widget, findsNothing);
        expect(
          find.descendant(
            of: widget,
            matching: find.textContaining(totalSavingText, findRichText: true),
          ),
          findsNothing,
        );
      });

      testWidgets('Not displayed in checkout page', (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [item],
          salesOrganisation: fakeMYSalesOrganisation,
        );
        final totalSavingText = StringUtils.priceComponentDisplayPrice(
          fakeMYSalesOrgConfigs,
          0,
          false,
        );
        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CheckoutPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();
        expect(widget, findsNothing);
        expect(
          find.descendant(
            of: widget,
            matching: find.textContaining(totalSavingText, findRichText: true),
          ),
          findsNothing,
        );
      });
    });

    group('Subtotal for marketplace', () {
      final zpSubTotalSection =
          find.byKey(WidgetKeys.checkoutSummaryZPSubTotal);
      final mpSubTotalSection =
          find.byKey(WidgetKeys.checkoutSummaryMPSubTotal);

      testWidgets('ZP & MP subtotal visible when cart has MP items',
          (tester) async {
        const mpSubTotal = 200.5;
        const zpSubTotal = 100.2;
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial()
              .copyWith(salesOrgConfigs: fakeMYSalesOrgConfigs),
        );
        when(() => cartStateMock.cartProducts).thenReturn(cartItemMock);
        when(() => cartStateMock.mpSubTotalHidePriceMaterial)
            .thenReturn(mpSubTotal);
        when(() => cartStateMock.zpSubTotalHidePriceMaterial)
            .thenReturn(zpSubTotal);

        await tester.pumpWidget(getWidget(cartStateMock));
        await tester.pumpAndSettle();

        expect(mpSubTotalSection, findsOneWidget);
        expect(
          find.descendant(
            of: mpSubTotalSection,
            matching: find.text('MP Subtotal (incl.tax):'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: mpSubTotalSection,
            matching: find.text(
              StringUtils.priceComponentDisplayPrice(
                fakeMYSalesOrgConfigs,
                mpSubTotal,
                false,
              ),
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
        expect(zpSubTotalSection, findsOneWidget);
        expect(
          find.descendant(
            of: zpSubTotalSection,
            matching: find.textContaining('ZP Subtotal (incl.tax):'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: zpSubTotalSection,
            matching: find.textContaining(
              StringUtils.priceComponentDisplayPrice(
                fakeMYSalesOrgConfigs,
                zpSubTotal,
                false,
              ),
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets('ZP & MP subtotal not visible when cart has MP items',
          (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial()
              .copyWith(salesOrgConfigs: fakeMYSalesOrgConfigs),
        );
        when(() => cartStateMock.cartProducts).thenReturn([]);

        await tester.pumpWidget(getWidget(cartStateMock));
        await tester.pumpAndSettle();

        expect(mpSubTotalSection, findsNothing);
        expect(zpSubTotalSection, findsNothing);
      });
    });

    group('Test SubTotal', () {
      testWidgets('Test Sub total Cart page for bundles ', (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartBundleItems,
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummarySubTotal),
            matching: find.textContaining(
              'Subtotal (${fakeMYSalesOrgConfigs.displayPrefixTax}.tax)',
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummarySubTotal),
            matching: find.text(
              'MYR 990.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets('Test Sub total in Checkout page for bundles',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [
            mockCartBundleItems.first
                .copyWith(salesOrgConfig: fakeMYSalesOrgConfigs),
          ],
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CheckoutPageRoute.name));
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        when(() => cartBloc.state).thenReturn(cartState);

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummarySubTotal),
            matching: find.textContaining(
              'Subtotal (${fakeMYSalesOrgConfigs.displayPrefixTax}.tax)',
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummarySubTotal),
            matching: find.text(
              'MYR 990.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });
    });
    group('Test Tax', () {
      testWidgets(
          'Test Tax value in Cart page for bundles with displaySubtotalTaxBreakdown disabled',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartBundleItems,
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.checkoutSummaryTax), findsNothing);
      });

      testWidgets(
          'Test Tax value in Cart page for bundles with displaySubtotalTaxBreakdown enabled',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [
            mockCartBundleItems.first.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
          ],
          salesOrganisation: fakeKHSalesOrganisation,
          config: fakeKHSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeKHSalesOrganisation,
            salesOrgConfigs: fakeKHSalesOrgConfigs,
          ),
        );
        when(() => cartBloc.state).thenReturn(cartState);

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.checkoutSummaryTax), findsOneWidget);
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryTax),
            matching: find.textContaining('Tax at 10%'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryTax),
            matching: find.text(
              '${fakeKHSalesOrgConfigs.currency.code} 99.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });
      testWidgets(
          'Test Tax value in Checkout page for bundles with displaySubtotalTaxBreakdown disabled',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartBundleItems,
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(find.byKey(WidgetKeys.checkoutSummaryTax), findsNothing);
      });

      testWidgets(
          'Test Tax value in Checkout page for bundles with displaySubtotalTaxBreakdown enabled',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [
            mockCartBundleItems.first.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
          ],
          salesOrganisation: fakeKHSalesOrganisation,
          config: fakeKHSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeKHSalesOrganisation,
            salesOrgConfigs: fakeKHSalesOrgConfigs,
          ),
        );
        when(() => cartBloc.state).thenReturn(cartState);

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.checkoutSummaryTax), findsOneWidget);
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryTax),
            matching: find.textContaining('Tax at 10%'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryTax),
            matching: find.text(
              '${fakeKHSalesOrgConfigs.currency.code} 99.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Test Tax value in Checkout page for MM with displaySubtotalTaxBreakdown enabled',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [
            cartItemMock.first.copyWith(
              salesOrgConfig: fakeMMSalesOrgConfigs,
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(100),
              ),
              materialInfo: cartItemMock.first.materialInfo.copyWith(
                taxClassification:
                    MaterialTaxClassification('Product : Full Tax'),
                tax: 5,
              ),
            ),
          ],
          salesOrganisation: fakeMMSalesOrganisation,
          config: fakeMMSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMMSalesOrganisation,
            salesOrgConfigs: fakeMMSalesOrgConfigs,
          ),
        );
        when(() => cartBloc.state).thenReturn(cartState);

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.checkoutSummaryTax), findsOneWidget);
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryTax),
            matching: find.textContaining('Tax:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryTax),
            matching: find.text(
              '${fakeMMSalesOrgConfigs.currency.code} 95.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });
    });

    group('Test Grand Total', () {
      testWidgets(
          'Test Grand Total value in Cart page for bundles with displaySubtotalTaxBreakdown disabled',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartBundleItems,
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
            matching: find.textContaining('Grand total:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
            matching: find.text(
              'MYR 990.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Test Grand Total value in Cart page for bundle with displaySubtotalTaxBreakdown enabled',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [
            mockCartBundleItems.first.copyWith(
              salesOrgConfig: fakeMYSalesOrgConfigs,
            ),
          ],
          salesOrganisation: fakeKHSalesOrganisation,
          config: fakeKHSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeKHSalesOrganisation,
            salesOrgConfigs: fakeKHSalesOrgConfigs,
          ),
        );
        when(() => cartBloc.state).thenReturn(cartState);

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
            matching: find.textContaining('Grand total:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
            matching: find.text(
              '${fakeKHSalesOrgConfigs.currency.code} 990.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Test Grand Total value in Checkout page for bundles with displaySubtotalTaxBreakdown disabled',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartBundleItems,
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CheckoutPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
            matching: find.textContaining('Grand total:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
            matching: find.text(
              'MYR 990.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Test Grand Total value in Checkout page for bundle with displaySubtotalTaxBreakdown enabled',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [
            mockCartBundleItems.first
                .copyWith(salesOrgConfig: fakeKHSalesOrgConfigs),
          ],
          salesOrganisation: fakeKHSalesOrganisation,
          config: fakeKHSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CheckoutPageRoute.name));
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeKHSalesOrganisation,
            salesOrgConfigs: fakeKHSalesOrgConfigs,
          ),
        );
        when(() => cartBloc.state).thenReturn(cartState);

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
            matching: find.textContaining('Grand total:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
            matching: find.text(
              '${fakeKHSalesOrgConfigs.currency.code} 1,089.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Test Total Tax when displayItemTaxBreakdown is disabled and displaySubtotalTaxBreakdown is enabled',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [
            cartItemMock.last.copyWith(
              materialInfo: cartItemMock.last.materialInfo.copyWith(
                type: MaterialInfoType('combo'),
              ),
              comboMaterials: [
                fakeComboMaterialItems.first.copyWith(
                  salesOrgConfig: fakeKHSalesOrgConfigs,
                  finalIndividualPrice: 1930.86,
                ),
              ],
            ),
          ],
          salesOrganisation: fakeKHSalesOrganisation,
          config: fakeKHSalesOrgConfigs,
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeKHSalesOrganisation,
            salesOrgConfigs: fakeKHSalesOrgConfigs,
          ),
        );
        when(() => cartBloc.state).thenReturn(cartState);

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryTax),
            matching: find.textContaining('Tax at 10%:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryTaxPrice),
            matching: find.text(
              '${fakeKHSalesOrgConfigs.currency.code} 193.09',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets('- When small order fee is applied', (tester) async {
        when(
          () => cartStateMock.grandTotalPriceDisplayed(
            smallOrderFee: fakeMYSalesOrgConfigsWithSmallOrderFee.smallOrderFee,
          ),
        ).thenReturn(900);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial()
              .copyWith(salesOrgConfigs: fakeMYSalesOrgConfigs),
        );
        when(() => orderEligibilityBloc.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            configs: fakeMYSalesOrgConfigsWithSmallOrderFee,
            user: fakeClientUser,
            cartItems: [inStockMaterial],
          ),
        );

        await tester.pumpWidget(getWidget(cartStateMock));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
            matching: find.textContaining(900.toString(), findRichText: true),
          ),
          findsOneWidget,
        );
      });
    });

    group('Small order fee -', () {
      testWidgets('Not visible when small order fee is not applied',
          (tester) async {
        when(() => orderEligibilityBloc.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            configs: fakeMYSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getWidget(cartStateMock));
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.smallOrderFeeSection),
          findsNothing,
        );
      });

      testWidgets('Visible when small order fee is applied', (tester) async {
        final smallOrderFee =
            fakeMYSalesOrgConfigsWithSmallOrderFee.smallOrderFee;
        when(
          () => cartStateMock.grandTotalPriceDisplayed(
            smallOrderFee: smallOrderFee,
            displayIDPriceOnCheckout: false,
          ),
        ).thenReturn(900);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigsWithSmallOrderFee,
          ),
        );
        when(() => orderEligibilityBloc.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            configs: fakeMYSalesOrgConfigsWithSmallOrderFee,
            user: fakeClientUser,
            cartItems: [inStockMaterial],
          ),
        );

        await tester.pumpWidget(getWidget(cartStateMock));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.smallOrderFeeSection),
            matching: find.text(
              'MYR ${smallOrderFee.toStringAsFixed(2)}',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );

        expect(
          find.text(
            'A small order fee applies to orders with ZP in-stock items that are under the minimum order value of MYR ${fakeMYSalesOrgConfigsWithSmallOrderFee.sapMinOrderAmount.toStringAsFixed(2)} for ZP subtotal.',
            findRichText: true,
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Visible with message for marketplace when small order fee is applied',
          (tester) async {
        final smallOrderFee =
            fakeMYSalesOrgConfigsWithSmallOrderFee.smallOrderFee +
                fakeMYSalesOrgConfigsWithSmallOrderFee.mpSmallOrderFee;
        when(
          () => cartStateMock.grandTotalPriceDisplayed(
            smallOrderFee: smallOrderFee,
          ),
        ).thenReturn(900);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeClientUserAccessMarketPlace,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            customerCodeInfo: fakeMarketPlaceCustomerCode,
          ),
        );
        when(() => orderEligibilityBloc.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            configs: fakeMYSalesOrgConfigsWithSmallOrderFee,
            user: fakeClientUser,
            cartItems: [
              inStockMaterial,
              inStockMaterial.copyWith.materialInfo(isMarketPlace: true),
            ],
          ),
        );

        await tester.pumpWidget(getWidget(cartStateMock));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.smallOrderFeeSection),
            matching: find.text(
              'MYR ${smallOrderFee.toStringAsFixed(2)}',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );

        expect(
          find.text(
            'A small order fee applies to orders with ZP and MP in-stock items separately that are under the minimum order value of MYR ${fakeMYSalesOrgConfigsWithSmallOrderFee.sapMinOrderAmount.toStringAsFixed(2)} ZP subtotal & MYR ${fakeMYSalesOrgConfigsWithSmallOrderFee.mpSAPMinOrderAmount.toStringAsFixed(2)} for MP subtotal.',
            findRichText: true,
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Show warning block if small order fee is greater than 0 in ID market',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [item],
          salesOrganisation: fakeIDSalesOrganisation,
          aplGetTotalPrice:
              AplGetTotalPrice.empty().copyWith(smallOrderFee: 2000),
        );

        when(() => cartBloc.state).thenReturn(cartState);
        when(() => orderEligibilityBloc.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            configs: fakeIDSalesOrgConfigs,
            salesOrg: fakeIDSalesOrganisation,
            user: fakeClientUser,
            cartItems: [
              inStockMaterial,
            ],
          ),
        );

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();
        expect(
          find.text(
            'A small order fee applies to orders with ZP in-stock items that are under the minimum order value of {smallOrderFee} for ZP subtotal.'
                .tr(namedArgs: {'smallOrderFee': 'IDR 300,000'}),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Hide warning block if small order fee is equal to 0 in ID market',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [item],
          salesOrganisation: fakeIDSalesOrganisation,
        );

        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();
        expect(
          find.text(
            'A small order fee applies to orders with ZP in-stock items that are under the minimum order value of {smallOrderFee} for ZP subtotal.'
                .tr(namedArgs: {'smallOrderFee': 'IDR 300,000'}),
          ),
          findsNothing,
        );
      });
    });
  });
}
