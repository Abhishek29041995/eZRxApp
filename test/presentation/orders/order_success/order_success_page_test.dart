import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_payment_term.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';

import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/govt_list_price_component.dart';
import 'package:ezrxmobile/presentation/core/list_price_strike_through_component.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/market_place_delivery_tile.dart';
import 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';
import 'package:ezrxmobile/presentation/orders/order_success/widgets/order_success_attachment_section.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../integration_test/robots/common/extension.dart';
import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_variant_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/common_methods.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late AppRouter autoRouterMock;
  late SalesOrgBloc mockSalesOrgBloc;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late OrderSummaryBloc orderSummaryBlocMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late OrderEligibilityBloc orderEligibilityBlocMock;
  late ViewByOrderDetailsBloc viewByOrderDetailsBlocMock;
  late CartBloc cartBlocMock;
  late ViewByItemDetailsBloc viewByItemDetailsBlocMock;
  late ProductImageBloc productImageBlocMock;
  late PoAttachmentBloc poAttachmentBlocMock;
  late ViewByOrderBloc viewByOrderBlocMock;
  late ViewByItemsBloc viewByItemsBlocMock;
  final fakeOrderNumber = OrderNumber('fake-order-number');
  late OrderHistoryDetailsOrderItem fakeBundleItem;
  late OrderHistoryDetailsOrderItem fakeMaterialItem;
  late OrderHistoryDetails fakeOrderHistoryDetails;
  late List<OrderHistoryDetails> fakeOrderHistoryDetailsListWithStock;
  late OrderHistory fakeOrderHistory;
  late PaymentCustomerInformationBloc paymentCustomerInformationBlocMock;
  late List<OrderHistoryDetails> fakeOrderHistoryList;
  late AplSimulatorOrder aplSimulatorOrderMock;

  setUpAll(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
      locator.registerLazySingleton(() => AutoRouteMock());
      locator
          .registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());

      locator.registerSingleton<ClevertapService>(ClevertapServiceMock());

      fakeOrderHistoryDetails =
          await ViewByOrderDetailsLocalDataSource().getOrderHistoryDetails();
      fakeOrderHistoryDetailsListWithStock = [
        fakeOrderHistoryDetails.copyWith(
          orderHistoryDetailsOrderItem: [
            fakeOrderHistoryDetails.orderHistoryDetailsOrderItem.first.copyWith(
              materialStockInfo: MaterialStockInfo.empty().copyWith(
                materialNumber: fakeOrderHistoryDetails
                    .orderHistoryDetailsOrderItem.first.materialNumber,
                stockInfos: [
                  StockInfo.empty().copyWith(inStock: MaterialInStock('Yes')),
                ],
              ),
            ),
          ],
        ),
      ];
      fakeOrderHistory = await ViewByItemLocalDataSource().getViewByItems();
      fakeBundleItem = fakeOrderHistoryDetails.orderHistoryDetailsOrderItem
          .firstWhere((e) => e.productType.typeBundle);
      fakeMaterialItem =
          fakeOrderHistoryDetails.orderHistoryDetailsOrderItem.firstWhere(
        (e) => e.productType.typeMaterial && e.type.isMaterialTypeComm,
      );
      fakeOrderHistoryList = await ViewByOrderDetailsLocalDataSource()
          .getOrderHistoryDetailsList();
      aplSimulatorOrderMock = await CartLocalDataSource().aplSimulateOrder();
    },
  );

  setUp(
    () {
      autoRouterMock = locator<AutoRouteMock>();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      orderSummaryBlocMock = OrderSummaryBlocMock();
      viewByOrderBlocMock = ViewByOrderBlocMock();
      viewByItemsBlocMock = ViewByItemsBlocMock();
      additionalDetailsBlocMock = AdditionalDetailsBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      orderEligibilityBlocMock = OrderEligibilityBlocMock();
      viewByOrderDetailsBlocMock = ViewByOrderDetailsBlocMock();
      cartBlocMock = CartBlocMock();
      viewByItemDetailsBlocMock = ViewByItemDetailsBlocMock();
      productImageBlocMock = ProductImageBlocMock();
      poAttachmentBlocMock = PoAttachmentBlocMock();
      mockSalesOrgBloc = SalesOrgBlocMock();
      paymentCustomerInformationBlocMock = PaymentCustomerInformationBlocMock();
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => orderEligibilityBlocMock.state)
          .thenReturn(OrderEligibilityState.initial());
      when(() => additionalDetailsBlocMock.state)
          .thenReturn(AdditionalDetailsState.initial());
      when(() => orderSummaryBlocMock.state).thenReturn(
        OrderSummaryState.initial(),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial(),
      );
      when(() => cartBlocMock.state).thenReturn(
        CartState.initial(),
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistory: fakeOrderHistory,
        ),
      );
      when(() => productImageBlocMock.state).thenReturn(
        ProductImageState.initial(),
      );
      when(() => poAttachmentBlocMock.state).thenReturn(
        PoAttachmentState.initial(),
      );
      when(() => viewByOrderBlocMock.state).thenReturn(
        ViewByOrderState.initial(),
      );
      when(() => viewByItemsBlocMock.state).thenReturn(
        ViewByItemsState.initial(),
      );
      when(() => autoRouterMock.currentPath).thenReturn('fake-path');
      when(() => paymentCustomerInformationBlocMock.state).thenReturn(
        PaymentCustomerInformationState.initial(),
      );
    },
  );

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      child: const OrderSuccessPage(),
      providers: [
        BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
        BlocProvider<AuthBloc>(create: (context) => authBlocMock),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<AdditionalDetailsBloc>(
          create: (context) => additionalDetailsBlocMock,
        ),
        BlocProvider<OrderSummaryBloc>(
          create: (context) => orderSummaryBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<OrderEligibilityBloc>(
          create: (context) => orderEligibilityBlocMock,
        ),
        BlocProvider<ViewByOrderDetailsBloc>(
          create: (context) => viewByOrderDetailsBlocMock,
        ),
        BlocProvider<CartBloc>(
          create: (context) => cartBlocMock,
        ),
        BlocProvider<ViewByItemDetailsBloc>(
          create: (context) => viewByItemDetailsBlocMock,
        ),
        BlocProvider<ProductImageBloc>(
          create: (context) => productImageBlocMock,
        ),
        BlocProvider<ViewByOrderBloc>(
          create: (context) => viewByOrderBlocMock,
        ),
        BlocProvider<ViewByItemsBloc>(
          create: (context) => viewByItemsBlocMock,
        ),
        BlocProvider<PoAttachmentBloc>(
          create: (context) => poAttachmentBlocMock,
        ),
        BlocProvider<PaymentCustomerInformationBloc>(
          create: ((context) => paymentCustomerInformationBlocMock),
        ),
      ],
    );
  }

  group('Test Order Success Page', () {
    group('Order header -', () {
      testWidgets(
        'Show Payment Term when disablePaymentTermsDisplay is false',
        (tester) async {
          VisibilityDetectorController.instance.updateInterval = Duration.zero;
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeSGSalesOrgConfigs,
            ),
          );
          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderHistoryDetailsPaymentTerm:
                      OrderHistoryDetailsPaymentTerm.empty(),
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final orderSuccessPage = find.byKey(WidgetKeys.orderSuccess);
          expect(orderSuccessPage, findsOneWidget);
          final paymentTermWidget =
              find.byKey(WidgetKeys.balanceTextRow('Payment term', 'NA'));
          expect(paymentTermWidget, findsOneWidget);
        },
      );

      testWidgets(
        'Hide Payment Term when disablePaymentTermsDisplay is true and the user is customer',
        (tester) async {
          VisibilityDetectorController.instance.updateInterval = Duration.zero;
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeTWSalesOrgConfigs,
              user: fakeClientUser,
            ),
          );
          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderHistoryDetailsPaymentTerm:
                      OrderHistoryDetailsPaymentTerm.empty(),
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final orderSuccessPage = find.byKey(WidgetKeys.orderSuccess);
          expect(orderSuccessPage, findsOneWidget);
          final paymentTermWidget =
              find.byKey(WidgetKeys.balanceTextRow('Payment term', 'NA'));
          expect(paymentTermWidget, findsNothing);
        },
      );

      testWidgets(
        'Find NA if Po Reference is left empty',
        (tester) async {
          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  poReference: StringValue(''),
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final poReference =
              find.byKey(WidgetKeys.balanceTextRow('PO reference', 'NA'));
          expect(poReference, findsOneWidget);
        },
      );

      testWidgets('Order Detail Header', (tester) async {
        final fakeRequestedDeliveryDate = DateTimeStringValue('2023-09-11');
        final fakeReferenceNotes = StringValue('fake-ref-note');
        final fakeOrderHistoryDetailsPaymentTerm =
            OrderHistoryDetailsPaymentTerm.empty();
        final fakeInstruction = StringValue('fake-instruction');
        when(() => eligibilityBlocMock.state).thenAnswer(
          (invocation) => EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenAnswer(
          (invocation) => OrderSummaryState.initial().copyWith(
            orderHistoryDetailsList: [
              OrderHistoryDetails.empty().copyWith(
                requestedDeliveryDate: fakeRequestedDeliveryDate,
                referenceNotes: fakeReferenceNotes,
                orderHistoryDetailsPaymentTerm:
                    fakeOrderHistoryDetailsPaymentTerm,
                orderHistoryDetailsSpecialInstructions: fakeInstruction,
              ),
            ],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(
          find.byKey(
            WidgetKeys.balanceTextRow(
              'Request delivery date'.tr(),
              fakeRequestedDeliveryDate.dateString,
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.balanceTextRow(
              'Reference note'.tr(),
              fakeReferenceNotes.getOrCrash(),
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.balanceTextRow(
              'Payment term'.tr(),
              fakeOrderHistoryDetailsPaymentTerm.displayPaymentTerm,
            ),
          ),
          findsOneWidget,
        );

        expect(
          find.byKey(
            WidgetKeys.balanceTextRow(
              'Delivery instructions'.tr(),
              fakeInstruction.displayNAIfEmpty,
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.byType(OrderSuccessAttachmentSection),
          findsOneWidget,
        );
      });

      testWidgets('Show Contact Detail In Order Detail Header', (tester) async {
        final fakeOrderBy = StringValue('fake-contact-person');
        final fakePhoneNumber = PhoneNumber('fake-phone-number');
        when(() => eligibilityBlocMock.state).thenAnswer(
          (invocation) => EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeVNSalesOrgConfigs,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenAnswer(
          (invocation) => OrderSummaryState.initial().copyWith(
            orderHistoryDetailsList: [
              OrderHistoryDetails.empty().copyWith(
                orderBy: fakeOrderBy,
                telephoneNumber: fakePhoneNumber,
              ),
            ],
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(
          find.byKey(
            WidgetKeys.balanceTextRow(
              'Contact person'.tr(),
              fakeOrderBy.displayNAIfEmpty,
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.balanceTextRow(
              'Contact number'.tr(),
              fakePhoneNumber.displayTelephoneNumber,
            ),
          ),
          findsOneWidget,
        );
      });
    });

    testWidgets(
      'Order History navigation check',
      (tester) async {
        when(() => autoRouterMock.navigateNamed('/main/orders_tab'))
            .thenAnswer((invocation) => Future(() => null));
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            orderHistoryDetailsList: [OrderHistoryDetails.empty()],
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        final finder = find.byWidgetPredicate(
          (widget) => widget is RichText && tapTextSpan(widget, 'Orders.'),
        );
        await tester.pumpAndSettle();
        expect(finder, findsOneWidget);
        verify(() => autoRouterMock.navigateNamed('/main/orders_tab'))
            .called(1);
        await tester.pumpAndSettle();
      },
    );

    group('Order summary check -', () {
      testWidgets(
        'subTotal excl./incl. tax & grandTotal price',
        (tester) async {
          final currentSalesOrgConfigVariant =
              salesOrgConfigVariant.currentValue ?? fakeIDSalesOrgConfigs;

          final currentSalesOrg = currentSalesOrgConfigVariant.salesOrg;

          final currentSalesOrganisation = fakeEmptySalesOrganisation.copyWith(
            salesOrg: currentSalesOrg,
          );

          final currency = currentSalesOrgConfigVariant.currency.code;

          const finalPrice = 88.0;
          const quantity = 2;
          const subTotalValueWithoutTax = finalPrice * quantity;
          final totalTax = subTotalValueWithoutTax *
              currentSalesOrgConfigVariant.vatValue *
              0.01;
          final grandTotalValue = subTotalValueWithoutTax + totalTax;
          final grandTotalValueForID =
              subTotalValueWithoutTax + totalTax.roundToDouble();

          final orderValue =
              currentSalesOrgConfigVariant.displaySubtotalTaxBreakdown
                  ? subTotalValueWithoutTax
                  : grandTotalValue;

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: currentSalesOrgConfigVariant,
              salesOrganisation: currentSalesOrganisation,
            ),
          );
          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderHistoryDetailsOrderItem: [
                    OrderHistoryDetailsOrderItem.empty().copyWith(
                      qty: quantity,
                    ),
                  ],
                  totalValue: grandTotalValue,
                  orderValue: orderValue,
                  totalTax: totalTax,
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final orderSummarySection =
              find.byKey(WidgetKeys.orderSuccessOrderSummarySection);
          final scrollList = find.byKey(WidgetKeys.scrollList);

          final orderSuccessSubTotal =
              find.byKey(WidgetKeys.orderSuccessSubTotal);

          final orderSuccessGrandTotal =
              find.byKey(WidgetKeys.orderSuccessGrandTotal);
          await tester.dragUntilVisible(
            orderSummarySection,
            scrollList,
            const Offset(0, -300),
          );
          await tester.pump(Durations.long2);

          //subtotal price
          expect(
            find.descendant(
              of: orderSuccessSubTotal,
              matching: find.text(
                'Subtotal (${currentSalesOrgConfigVariant.displayPrefixTax}.tax):',
              ),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: orderSuccessSubTotal,
              matching: priceComponent(
                currentSalesOrg.isID
                    ? orderValue.priceDisplayForID(currency)
                    : orderValue.priceDisplay(currency),
              ),
            ),
            findsOneWidget,
          );
          await tester.dragUntilVisible(
            orderSuccessGrandTotal,
            scrollList,
            const Offset(0, -300),
          );
          await tester.pump(Durations.long2);

          //grand total price
          expect(
            find.descendant(
              of: orderSuccessGrandTotal,
              matching: find.text('Grand total:'),
            ),
            findsOneWidget,
          );

          expect(
            find.descendant(
              of: orderSuccessGrandTotal,
              matching: priceComponent(
                currentSalesOrg.isID
                    ? grandTotalValueForID.priceDisplayForID(currency)
                    : grandTotalValue.priceDisplay(currency),
              ),
            ),
            findsWidgets,
          );
        },
        variant: salesOrgConfigVariant,
      );

      testWidgets(
        'Tax rate display for other market & hide for VN & MM',
        (tester) async {
          final currentSalesOrgConfigVariant =
              salesOrgConfigVariant.currentValue ?? fakeIDSalesOrgConfigs;
          final currentSalesOrg = currentSalesOrgConfigVariant.salesOrg;

          final currentSalesOrganisation = fakeEmptySalesOrganisation.copyWith(
            salesOrg: currentSalesOrg,
          );
          final currency = currentSalesOrgConfigVariant.currency.code;

          const finalPrice = 100.0;
          const quantity = 2;
          const subTotalValueWithoutTax = finalPrice * quantity;

          final totalTax = subTotalValueWithoutTax *
              currentSalesOrgConfigVariant.vatValue *
              0.01;

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: currentSalesOrgConfigVariant,
              salesOrganisation: currentSalesOrganisation,
            ),
          );
          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  taxRate: currentSalesOrgConfigVariant.vatValue.toDouble(),
                  totalTax: totalTax,
                  orderHistoryDetailsOrderItem: [
                    OrderHistoryDetailsOrderItem.empty().copyWith(
                      taxRate: currentSalesOrgConfigVariant.vatValue.toDouble(),
                    ),
                  ],
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final orderSummarySection =
              find.byKey(WidgetKeys.orderSuccessOrderSummarySection);
          final scrollList = find.byKey(WidgetKeys.scrollList);
          await tester.dragUntilVisible(
            orderSummarySection,
            scrollList,
            const Offset(0, -300),
          );
          await tester.pump(Durations.long2);

          final taxRateVisible = find.text(
            'Tax at ${currentSalesOrgConfigVariant.vatValue.toDouble()}%:',
          );
          final hideTaxRate = find.text(
            'Tax:',
          );
          final taxSection = find.byKey(WidgetKeys.orderSummaryTax);

          expect(
            find.descendant(
              of: taxSection,
              matching:
                  currentSalesOrg.isMaterialTax ? hideTaxRate : taxRateVisible,
            ),
            currentSalesOrgConfigVariant.displaySubtotalTaxBreakdown
                ? findsOneWidget
                : findsNothing,
          );
          expect(
            find.descendant(
              of: taxSection,
              matching: priceComponent(
                currentSalesOrg.isID
                    ? totalTax.priceDisplayForID(currency)
                    : totalTax.priceDisplay(currency),
              ),
            ),
            currentSalesOrgConfigVariant.displaySubtotalTaxBreakdown
                ? findsOneWidget
                : findsNothing,
          );
        },
        variant: salesOrgConfigVariant,
      );

      testWidgets(
        'subTotal include exclude tax & grandTotal price & tax',
        (tester) async {
          const finalPrice = 88.0;
          const vatValue = 9;
          const quantity = 2;
          const subTotalValueWithoutTax = finalPrice * quantity;
          const totalTax = subTotalValueWithoutTax * vatValue * 0.01;
          const grandTotalValue = subTotalValueWithoutTax + totalTax;
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeSGSalesOrgConfigs,
            ),
          );
          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              isConfirming: false,
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderHistoryDetailsOrderItem: [
                    OrderHistoryDetailsOrderItem.empty().copyWith(
                      qty: quantity,
                    ),
                  ],
                  totalValue: grandTotalValue,
                  orderValue: subTotalValueWithoutTax,
                  totalTax: totalTax,
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final orderSummarySection =
              find.byKey(WidgetKeys.orderSuccessOrderSummarySection);
          //sub total (excl. tax)
          expect(
            find.descendant(
              of: orderSummarySection,
              matching: find.text('Subtotal (excl.tax):'),
            ),
            findsOneWidget,
          );
          expect(
            find.byWidgetPredicate(
              (widget) =>
                  widget is RichText &&
                  widget.key == WidgetKeys.priceComponent &&
                  widget.text
                      .toPlainText()
                      .contains(subTotalValueWithoutTax.toStringAsFixed(2)),
            ),
            findsOneWidget,
          );
          //grand total
          expect(
            find.descendant(
              of: orderSummarySection,
              matching: find.text('${'Grand total'.tr()}:'),
            ),
            findsOneWidget,
          );
          expect(
            find.byKey(WidgetKeys.orderSummaryTax),
            findsOneWidget,
          );
          expect(
            find.byWidgetPredicate(
              (widget) =>
                  widget is RichText &&
                  widget.key == WidgetKeys.priceComponent &&
                  widget.text
                      .toPlainText()
                      .contains(grandTotalValue.toStringAsFixed(2)),
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Should not show total saving on SG',
        (tester) async {
          final currentSalesOrgVariant =
              salesOrgVariant.currentValue ?? fakeSalesOrg;
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeEmptySalesOrganisation.copyWith(
                salesOrg: currentSalesOrgVariant,
              ),
            ),
          );
          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderHistoryDetailsOrderItem: [
                    OrderHistoryDetailsOrderItem.empty().copyWith(
                      qty: 2,
                    ),
                  ],
                  totalDiscount: 21.39,
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          expect(
            find.byKey(WidgetKeys.orderSummaryTotalSaving),
            currentSalesOrgVariant.isID ? findsOneWidget : findsNothing,
          );

          expect(
            find.textContaining('21.39', findRichText: true),
            currentSalesOrgVariant.isID ? findsOneWidget : findsNothing,
          );
        },
        variant: salesOrgVariant,
      );

      testWidgets(
        'Test Bundle Order, Grand total and Sub total only with displaySubtotalTaxBreakdown is enabled ',
        (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeSGSalesOrgConfigs,
            ),
          );
          final bundleList = [
            OrderHistoryDetailsOrderItem.empty().copyWith(
              productType: MaterialInfoType.bundle(),
              material: MaterialInfo.empty().copyWith(
                bundle: Bundle.empty().copyWith(bundleCode: 'fake-code'),
              ),
            ),
          ];
          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderNumber: OrderNumber('Fake-Order-Number'),
                  orderValue: 990.0,
                  totalTax: 99.0,
                  totalValue: 1089.00,
                  orderHistoryDetailsOrderItem: bundleList,
                ),
              ],
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          expect(
            find.descendant(
              of: find.byKey(WidgetKeys.orderSuccessSubTotal),
              matching: find.textContaining(
                'Subtotal (${fakeSGSalesOrgConfigs.displayPrefixTax}.tax)',
              ),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byKey(WidgetKeys.orderSuccessSubTotal),
              matching: find.text(
                'SGD 990.00',
                findRichText: true,
              ),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byKey(WidgetKeys.orderSummaryTax),
              matching: find.text(
                'SGD 99.00',
                findRichText: true,
              ),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byKey(WidgetKeys.orderSuccessGrandTotal),
              matching: find.textContaining('Grand total:'),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byKey(WidgetKeys.orderSuccessGrandTotal),
              matching: find.text(
                'SGD 1,089.00',
                findRichText: true,
              ),
            ),
            findsOneWidget,
          );
          expect(
            find.byKey(WidgetKeys.viewByOrderDetailItemsSection),
            findsOneWidget,
          );
        },
      );

      testWidgets(
          'Test Bundle Order, Test Grand total and Sub total only with displaySubtotalTaxBreakdown is disabled ',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        final bundleList = [
          OrderHistoryDetailsOrderItem.empty().copyWith(
            productType: MaterialInfoType.bundle(),
            material: MaterialInfo.empty().copyWith(
              bundle: Bundle.empty().copyWith(bundleCode: 'fake-code'),
            ),
          ),
        ];
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            orderHistoryDetailsList: [
              OrderHistoryDetails.empty().copyWith(
                orderNumber: OrderNumber('Fake-Order-Number'),
                orderValue: 1089.0,
                totalTax: 99.0,
                totalValue: 1089.00,
                orderHistoryDetailsOrderItem: bundleList,
              ),
            ],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.orderSuccessSubTotal),
            matching: find.textContaining(
              'Subtotal (${fakeMYSalesOrgConfigs.displayPrefixTax}.tax)',
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.orderSuccessSubTotal),
            matching: find.text(
              'MYR 1,089.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.orderSummaryTax),
            matching: find.textContaining('Tax at 10%'),
          ),
          findsNothing,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.orderSummaryTax),
            matching: find.text(
              'MYR 99.00',
              findRichText: true,
            ),
          ),
          findsNothing,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.orderSuccessGrandTotal),
            matching: find.textContaining('Grand total:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.orderSuccessGrandTotal),
            matching: find.text(
              'MYR 1,089.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.byKey(WidgetKeys.viewByOrderDetailItemsSection),
          findsOneWidget,
        );
      });

      testWidgets('Show Small Order Fee For ID Market', (tester) async {
        const smallOrderFee = 12499;
        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('1234'),
                  materialGroup4: MaterialGroup('6A1'),
                  isMarketPlace: true,
                ),
              ),
            ],
            configs: fakeIDSalesOrgConfigs,
            salesOrg: fakeIDSalesOrganisation,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenAnswer(
          (invocation) => OrderSummaryState.initial().copyWith(
            orderHistoryDetailsList: [
              fakeOrderHistoryDetailsListWithStock.first
                  .copyWith(deliveryFee: smallOrderFee.toDouble()),
            ],
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final smallFeeSection = find.byKey(WidgetKeys.smallOrderFeeSection);
        final scrollList = find.byKey(WidgetKeys.scrollList);
        await tester.dragUntilVisible(
          smallFeeSection,
          scrollList,
          const Offset(0, -300),
        );
        expect(smallFeeSection, findsOneWidget);
        expect(
          find.descendant(
            of: smallFeeSection,
            matching: find.text(
              '${'Small order fee'}:'.tr(),
            ),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: smallFeeSection,
            matching: priceComponent(smallOrderFee.priceFormattedForID),
          ),
          findsOneWidget,
        );
      });
    });

    testWidgets('Tap back button', (tester) async {
      when(() => autoRouterMock.popUntil(any()))
          .thenAnswer((_) => Future(() => null));
      await tester.pumpWidget(getWidget());
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.closeButton));
      await tester.pumpAndSettle();
      verify(() => autoRouterMock.popUntil(any())).called(1);
    });

    group('Confirm order -', () {
      testWidgets('Order Confirm Done', (tester) async {
        final fakeOrderDetail = OrderHistoryDetails.empty().copyWith(
          orderNumber: fakeOrderNumber,
          orderHistoryDetailsOrderItem: [
            fakeBundleItem,
          ],
        );
        whenListen(
          orderSummaryBlocMock,
          Stream.fromIterable(
            [
              OrderSummaryState.initial().copyWith(
                isConfirming: true,
              ),
              OrderSummaryState.initial().copyWith(
                orderHistoryDetailsList: [fakeOrderDetail],
              ),
            ],
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        verify(
          () => viewByOrderBlocMock.add(
            ViewByOrderEvent.fetch(
              filter: ViewByOrdersFilter.empty(),
              searchKey: SearchKey.empty(),
              isDetailsPage: false,
            ),
          ),
        ).called(1);

        verify(
          () => viewByItemsBlocMock.add(
            ViewByItemsEvent.fetch(
              viewByItemFilter: ViewByItemFilter.empty(),
              searchKey: SearchKey.empty(),
            ),
          ),
        ).called(1);

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.customSnackBar),
            matching: find.text(
              'Order submitted'.tr(),
            ),
          ),
          findsOneWidget,
        );
        verify(
          () => cartBlocMock.add(
            const CartEvent.fetchProductsAddedToCart(),
          ),
        ).called(1);
      });

      testWidgets('Show Shimmer When Confirming', (tester) async {
        when(() => orderSummaryBlocMock.state).thenAnswer(
          (invocation) => OrderSummaryState.initial().copyWith(
            isConfirming: true,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.byKey(WidgetKeys.loaderImage), findsOneWidget);
      });
    });

    group('Bundle -', () {
      setUp(() {
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            orderHistoryDetailsList: [
              OrderHistoryDetails.empty().copyWith(
                orderHistoryDetailsOrderItem: [fakeBundleItem],
              ),
            ],
          ),
        );
      });
      testWidgets('Show section when have data', (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.viewByOrderDetailItemsSection),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.orderHistoryBundleItemMaterial(
              fakeBundleItem.materialNumber.displayMatNo,
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
        'Find pre-order tag for bundle items in order success page',
        (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeMYSalesOrgConfigs,
            ),
          );
          final bundleList = [
            fakeMaterialItem.copyWith(
              parentId: 'fake-parent-id',
              productType: MaterialInfoType.bundle(),
              materialNumber: MaterialNumber('fake-mat1'),
              materialStockInfo: MaterialStockInfo.empty().copyWith(
                stockInfos: [
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('Yes'),
                    materialNumber: MaterialNumber('fake-mat1'),
                  ),
                ],
              ),
            ),
            fakeMaterialItem.copyWith(
              parentId: 'fake-parent-id',
              productType: MaterialInfoType.bundle(),
              materialNumber: MaterialNumber('fake-mat2'),
              materialStockInfo: MaterialStockInfo.empty().copyWith(
                stockInfos: [
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('No'),
                    materialNumber: MaterialNumber('fake-mat2'),
                  ),
                ],
              ),
            ),
          ];
          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderHistoryDetailsOrderItem: bundleList,
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final bundleItem =
              find.byKey(WidgetKeys.cartItemBundleTile('fake-parent-id'));
          final orderItemsScrollList = find.byKey(WidgetKeys.scrollList);

          await tester.dragUntilVisible(
            bundleItem,
            orderItemsScrollList,
            const Offset(0.0, -500.0),
          );
          await tester.pumpAndSettle();

          final preOrderText = find.text('OOS-Preorder');

          expect(preOrderText, findsOneWidget);
        },
      );

      testWidgets('Show marketplace logo when is MP bundle', (tester) async {
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            orderHistoryDetailsList: [
              OrderHistoryDetails.empty().copyWith(
                orderHistoryDetailsOrderItem: [
                  fakeBundleItem.copyWith.material(
                    isMarketPlace: true,
                    bundle: Bundle.empty().copyWith(bundleCode: 'fake-code'),
                  ),
                ],
              ),
            ],
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(
          find.byKey(WidgetKeys.viewByOrderDetailItemsSection),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(
              WidgetKeys.cartItemBundleTile(fakeBundleItem.parentId),
            ),
            matching: find.byType(MarketPlaceLogo),
          ),
          findsOne,
        );
      });
    });

    group('Material -', () {
      setUp(() {
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            orderHistoryDetailsList: [
              OrderHistoryDetails.empty().copyWith(
                orderHistoryDetailsOrderItem: [fakeMaterialItem],
              ),
            ],
          ),
        );
      });

      testWidgets(
        ' -> Can navigate to product detail page when tap on OrderHistoryDetailsOrderItem',
        (WidgetTester tester) async {
          when(
            () => autoRouterMock.push(
              ProductDetailsPageRoute(
                materialInfo: fakeMaterialItem.priceAggregate.materialInfo,
              ),
            ),
          ).thenAnswer((_) async => true);

          when(() => orderSummaryBlocMock.state).thenAnswer(
            (invocation) => OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderHistoryDetailsOrderItem: [
                    fakeMaterialItem,
                  ],
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final orderItemCommonTile = find.byType(CommonTileItem).first;
          await tester.ensureVisible(orderItemCommonTile);
          await tester.pumpAndSettle();

          await tester.tap(orderItemCommonTile);
          await tester.pump();

          verify(
            () => autoRouterMock.push(
              ProductDetailsPageRoute(
                materialInfo: fakeMaterialItem.priceAggregate.materialInfo,
              ),
            ),
          ).called(1);
        },
      );

      testWidgets('Show section when have data', (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.orderSuccessZPItemsSection),
          findsOneWidget,
        );
      });

      testWidgets('Show offer tag when material have offer', (tester) async {
        when(() => orderSummaryBlocMock.state).thenAnswer(
          (invocation) => OrderSummaryState.initial().copyWith(
            orderHistoryDetailsList: [
              OrderHistoryDetails.empty().copyWith(
                orderHistoryDetailsOrderItem: [
                  fakeMaterialItem.copyWith(promoStatus: true),
                ],
              ),
            ],
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.byKey(WidgetKeys.offerTag), findsOneWidget);
      });

      testWidgets('Show covid tag when material is covid material',
          (tester) async {
        when(() => orderSummaryBlocMock.state).thenAnswer(
          (invocation) => OrderSummaryState.initial().copyWith(
            orderHistoryDetailsList: [
              OrderHistoryDetails.empty().copyWith(
                orderHistoryDetailsOrderItem: [
                  fakeMaterialItem.copyWith(isCovid: true),
                ],
              ),
            ],
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.byKey(WidgetKeys.covidLabel), findsOneWidget);
      });

      testWidgets(
        'Display Price Not Available Message for hide price materials',
        (tester) async {
          when(() => orderSummaryBlocMock.state).thenAnswer(
            (invocation) => OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderValue: 516.0,
                  orderHistoryDetailsOrderItem: <OrderHistoryDetailsOrderItem>[
                    OrderHistoryDetailsOrderItem.empty().copyWith(
                      principalData: PrincipalData.empty().copyWith(
                        principalCode: PrincipalCode('0000101308'),
                        principalName: PrincipalName('PROCTER AND GAMBLE'),
                      ),
                      materialNumber: MaterialNumber(''),
                      unitPrice: 17.2,
                      totalPrice: 516,
                      type: OrderItemType('Comm'),
                      productType: MaterialInfoType('material'),
                      hidePrice: true,
                    ),
                  ],
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final priceMessageWidgetFinder =
              find.byKey(WidgetKeys.priceNotAvailableMessageWidget);
          final priceMessageFinder = find.text(
            'Price is not available for at least one item. Grand total reflected may not be accurate.'
                .tr(),
          );
          expect(priceMessageWidgetFinder, findsOneWidget);
          expect(priceMessageFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Show GovtListPriceComponent For Material Item',
        (tester) async {
          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderHistoryDetailsOrderItem: [fakeMaterialItem],
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pump();

          expect(
            find.byType(GovtListPriceComponent),
            findsNothing,
          );
        },
      );

      testWidgets(
        'Find Material tax Breakdown',
        (tester) async {
          final currentSalesOrgConfigVariant =
              salesOrgConfigVariant.currentValue ?? fakeKHSalesOrgConfigs;

          final hideItemTax =
              !currentSalesOrgConfigVariant.displayItemTaxBreakdown;

          final currentSalesOrg = currentSalesOrgConfigVariant.salesOrg;

          final currentSalesOrganisation = fakeEmptySalesOrganisation.copyWith(
            salesOrg: currentSalesOrg,
          );
          final currency = currentSalesOrgConfigVariant.currency.code;

          const unitPrice = 100.0;
          const quantity = 2;
          const taxRate = 5.0;
          const totalTax = 10.0;
          const totalPrice = unitPrice * quantity + totalTax;
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: currentSalesOrganisation,
              salesOrgConfigs: currentSalesOrgConfigVariant,
            ),
          );
          when(() => orderSummaryBlocMock.state).thenAnswer(
            (invocation) => OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                fakeOrderHistoryDetails.copyWith(
                  taxRate: taxRate,
                  orderHistoryDetailsOrderItem: [
                    fakeMaterialItem.copyWith(
                      taxRate: taxRate,
                      totalTax: totalTax,
                      totalPrice: totalPrice,
                      priceAggregate: PriceAggregate.empty().copyWith(
                        salesOrgConfig: currentSalesOrgConfigVariant,
                        materialInfo: MaterialInfo.empty().copyWith(tax: 5),
                        price: Price.empty().copyWith(
                          finalPrice: MaterialPrice(unitPrice),
                        ),
                        quantity: quantity,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final orderItemsSection =
              find.byKey(WidgetKeys.orderSuccessZPItemsSection);
          await tester.scrollUntilVisible(orderItemsSection, -500);
          expect(orderItemsSection, findsOneWidget);
          final itemTaxFinder = find.byKey(WidgetKeys.itemTax);

          if (hideItemTax) {
            expect(itemTaxFinder, findsNothing);
            return;
          }

          await tester.scrollUntilVisible(itemTaxFinder, -500);

          expect(itemTaxFinder, findsOneWidget);
          expect(
            find.descendant(
              of: itemTaxFinder,
              matching: priceComponent(
                currentSalesOrg.isID
                    ? totalTax.priceDisplayForID(currency)
                    : totalTax.priceDisplay(currency),
              ),
            ),
            findsOneWidget,
          );
          final itemTaxPercentage = find.byKey(WidgetKeys.itemTaxPercentage);
          expect(
            find.descendant(
              of: itemTaxFinder,
              matching: itemTaxPercentage,
            ),
            findsOneWidget,
          );
          expect(
            tester.widget<Text>(itemTaxPercentage).data,
            ' ($taxRate% ${'tax'.tr()})',
          );

          find.descendant(
            of: itemTaxFinder,
            matching: find.descendant(
              of: find.byKey(WidgetKeys.finalTotalPriceWithTax),
              matching: priceComponent(
                currentSalesOrg.isID
                    ? totalPrice.priceDisplayForID(currency)
                    : totalPrice.priceDisplay(currency),
              ),
            ),
          );
        },
        variant: salesOrgConfigVariant,
      );

      testWidgets(
        'Find Price is not available warning if any item has invalid price',
        (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeSGSalesOrgConfigs,
            ),
          );
          final materialList = [
            fakeMaterialItem,
            fakeMaterialItem.copyWith(hidePrice: false, unitPrice: 0),
          ];
          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderHistoryDetailsOrderItem: materialList,
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final priceNotAvailableWarning =
              find.byKey(WidgetKeys.priceNotAvailableMessageWidget);

          expect(priceNotAvailableWarning, findsOneWidget);
        },
      );

      testWidgets('Bonus Stock tag', (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeVNSalesOrgConfigs,
            salesOrganisation: fakeTWSalesOrganisation,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenAnswer(
          (invocation) => OrderSummaryState.initial().copyWith(
            orderHistoryDetailsList: [
              fakeOrderHistoryDetails.copyWith(
                orderHistoryDetailsOrderItem: [
                  fakeOrderHistoryDetails.orderHistoryDetailsOrderItem.first
                      .copyWith(
                    isMarketPlace: false,
                    unitPrice: 0,
                    type: OrderItemType('Bonus'),
                    productType: MaterialInfoType.material(),
                    materialStockInfo: MaterialStockInfo.empty().copyWith(
                      materialNumber: fakeOrderHistoryDetails
                          .orderHistoryDetailsOrderItem.first.materialNumber,
                      stockInfos: [
                        StockInfo.empty()
                            .copyWith(inStock: MaterialInStock('No')),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        await tester.fling(
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -10000),
          100,
        );
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.orderSuccessMaterialItem(0)),
          findsWidgets,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.orderSuccessMaterialItem(0)).first,
            matching: find.widgetWithText(StatusLabel, 'Bonus'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.orderSuccessMaterialItem(0)).first,
            matching: find.widgetWithText(StatusLabel, 'OOS-Preorder'),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
        'Display counter offer requested for PnG materials with price not available',
        (tester) async {
          when(() => orderSummaryBlocMock.state).thenAnswer(
            (invocation) => OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderValue: 516.0,
                  orderHistoryDetailsOrderItem: <OrderHistoryDetailsOrderItem>[
                    OrderHistoryDetailsOrderItem.empty().copyWith(
                      principalData: PrincipalData.empty().copyWith(
                        principalCode: PrincipalCode('0000101308'),
                        principalName: PrincipalName('PROCTER AND GAMBLE'),
                      ),
                      materialNumber: MaterialNumber(''),
                      originPrice: 15.0,
                      unitPrice: 17.2,
                      totalPrice: 516,
                      type: OrderItemType('Comm'),
                      productType: MaterialInfoType('material'),
                      hidePrice: true,
                      isCounterOffer: true,
                    ),
                  ],
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final priceNotAvailableFinder =
              find.text('Price Not Available', findRichText: true);
          expect(priceNotAvailableFinder, findsNWidgets(2));

          final requestedCounterOfferKey =
              find.text('Requested counter offer'.tr());
          expect(requestedCounterOfferKey, findsOneWidget);
        },
      );

      testWidgets('Find Material total value', (tester) async {
        const unitPrice = 17.2;
        const quantity = 5;
        const totalMaterialPrice = unitPrice * quantity;

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeVNSalesOrgConfigs,
            salesOrganisation: fakeVNSalesOrganisation,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenAnswer(
          (invocation) => OrderSummaryState.initial().copyWith(
            salesOrgConfig: fakeVNSalesOrgConfigs,
            salesOrganisation: fakeVNSalesOrganisation,
            orderHistoryDetailsList: [
              OrderHistoryDetails.empty().copyWith(
                totalValue: totalMaterialPrice,
                orderHistoryDetailsOrderItem: <OrderHistoryDetailsOrderItem>[
                  OrderHistoryDetailsOrderItem.empty().copyWith(
                    principalData: PrincipalData.empty().copyWith(
                      principalCode: PrincipalCode('0000101308'),
                      principalName: PrincipalName('PROCTER AND GAMBLE'),
                    ),
                    materialNumber: MaterialNumber(''),
                    qty: quantity,
                    unitPrice: unitPrice,
                    type: OrderItemType('Comm'),
                    productType: MaterialInfoType('material'),
                  ),
                ],
              ),
            ],
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        final orderItemsSection =
            find.byKey(WidgetKeys.orderSuccessZPItemsSection);
        await tester.scrollUntilVisible(orderItemsSection, -500);
        await tester.pump(const Duration(seconds: 1));
        expect(orderItemsSection, findsOneWidget);
        final totalMaterialPriceText = find.textContaining(
          totalMaterialPrice.toString(),
          findRichText: true,
        );
        expect(totalMaterialPriceText, findsOneWidget);
      });

      testWidgets(
        'Test list price not visible for bonus items',
        (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeTWSalesOrgConfigs,
            ),
          );
          final materialList = [
            fakeMaterialItem.copyWith(
              isMarketPlace: false,
              productType: MaterialInfoType.material(),
              materialStockInfo: MaterialStockInfo.empty().copyWith(
                materialNumber: fakeOrderHistoryDetails
                    .orderHistoryDetailsOrderItem.first.materialNumber,
                stockInfos: [
                  StockInfo.empty().copyWith(inStock: MaterialInStock('Yes')),
                ],
              ),
            ),
            fakeMaterialItem.copyWith(
              isMarketPlace: false,
              productType: MaterialInfoType.material(),
              materialStockInfo: MaterialStockInfo.empty().copyWith(
                materialNumber: fakeOrderHistoryDetails
                    .orderHistoryDetailsOrderItem.first.materialNumber,
                stockInfos: [
                  StockInfo.empty().copyWith(inStock: MaterialInStock('Yes')),
                ],
              ),
            ),
          ];
          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderHistoryDetailsOrderItem: materialList,
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final material = find.byKey(WidgetKeys.orderSuccessZPItemsSection);
          final orderItemsScrollList = find.byKey(WidgetKeys.scrollList);

          await tester.dragUntilVisible(
            material,
            orderItemsScrollList,
            const Offset(0.0, -500.0),
          );
          await tester.pumpAndSettle();

          final govtListPriceComponent = find.byType(GovtListPriceComponent);

          expect(govtListPriceComponent, findsNothing);
        },
      );

      testWidgets('Show marketplace materials', (tester) async {
        final scrollList = find.byKey(WidgetKeys.scrollList);
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            orderHistoryDetailsList:
                fakeOrderHistoryList.mpOrderOnly.take(1).toList(),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final marketplaceDeliveryInfo =
            find.byType(MarketPlaceDeliveryExpansionTile);
        await tester.dragUntilVisible(
          marketplaceDeliveryInfo,
          scrollList,
          const Offset(0, -300),
        );
        expect(marketplaceDeliveryInfo, findsOneWidget);
        final marketplaceSectionTitle =
            find.byKey(WidgetKeys.cartMPProductSectionLabel);
        await tester.dragUntilVisible(
          marketplaceSectionTitle,
          scrollList,
          const Offset(0, -300),
        );
        expect(marketplaceSectionTitle, findsOneWidget);
        final section = find.byKey(WidgetKeys.orderSuccessMPItemsSection);
        expect(section, findsOneWidget);
        expect(
          find.descendant(
            of: section,
            matching: find.byKey(WidgetKeys.marketplaceSellerIcon),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
        'Not show marketplace section when order contains ZP items',
        (tester) async {
          final scrollList = find.byKey(WidgetKeys.scrollList);

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          await tester.dragUntilVisible(
            find.byKey(WidgetKeys.orderSuccessMaterialItem(0)),
            scrollList,
            const Offset(0, -300),
          );
          expect(
            find.byKey(WidgetKeys.cartMPProductSectionLabel),
            findsNothing,
          );
          expect(find.byKey(WidgetKeys.marketplaceSellerIcon), findsNothing);
        },
      );

      testWidgets(
        'Show IRN when enableIRN is true',
        (tester) async {
          const iRNNumber = '12C 234/11';

          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderHistoryDetailsOrderItem: [
                    fakeMaterialItem.copyWith(
                      itemRegistrationNumber: ItemRegistrationNumber(iRNNumber),
                    ),
                  ],
                ),
              ],
            ),
          );

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeTHSalesOrganisation,
              salesOrgConfigs: fakeTHSalesOrgConfigs.copyWith(
                enableIRN: true,
              ),
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();

          expect(find.textContaining(iRNNumber), findsOneWidget);
        },
      );

      testWidgets(
        'Do not show IRN when enableIRN is false',
        (tester) async {
          const iRNNumber = '12C 234/11';

          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderHistoryDetailsOrderItem: [
                    fakeMaterialItem.copyWith(
                      itemRegistrationNumber: ItemRegistrationNumber(iRNNumber),
                    ),
                  ],
                ),
              ],
            ),
          );

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeTHSalesOrganisation,
              salesOrgConfigs: fakeTHSalesOrgConfigs.copyWith(
                enableIRN: false,
              ),
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();

          expect(find.textContaining(iRNNumber), findsNothing);
        },
      );
    });

    group('List price strike through -', () {
      testWidgets(
        'List price strike through price visible, if final price is less than list price && enableListPrice = true',
        (tester) async {
          final finalPrice = MaterialPrice(80);
          final listPrice = MaterialPrice(100);
          when(() => orderSummaryBlocMock.state).thenAnswer(
            (invocation) => OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderHistoryDetailsOrderItem: [
                    fakeMaterialItem.copyWith(
                      originPrice: listPrice.getValue(),
                      unitPrice: finalPrice.getValue(),
                      material: MaterialInfo.empty().copyWith(
                        materialNumber: MaterialNumber('fake-material-1'),
                      ),
                      priceAggregate: PriceAggregate.empty().copyWith(
                        salesOrgConfig: fakeIDSalesOrgConfigs,
                        price: Price.empty().copyWith(
                          lastPrice: listPrice,
                          finalPrice: finalPrice,
                          materialNumber: MaterialNumber('fake-material-1'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pump();
          expect(
            find.byKey(WidgetKeys.orderSuccessZPItemsSection),
            findsOneWidget,
          );
          final listPriceStrikeThroughComponent =
              find.byType(ListPriceStrikeThroughComponent);
          final listPriceFinder = find.byWidgetPredicate(
            (widget) =>
                widget is RichText &&
                widget.key == WidgetKeys.priceComponent &&
                widget.text
                    .toPlainText()
                    .contains(listPrice.getOrCrash().toString()),
          );
          expect(
            find.descendant(
              of: listPriceStrikeThroughComponent,
              matching: listPriceFinder,
            ),
            findsNothing,
          );
        },
      );

      testWidgets(
        'List price strike through price not visible, if final price is less than list price && enableListPrice = false',
        (tester) async {
          final finalPrice = MaterialPrice(80);
          final listPrice = MaterialPrice(100);
          when(() => orderSummaryBlocMock.state).thenAnswer(
            (invocation) => OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderHistoryDetailsOrderItem: [
                    fakeMaterialItem.copyWith(
                      material: MaterialInfo.empty().copyWith(
                        materialNumber: MaterialNumber('fake-material-1'),
                      ),
                      priceAggregate: PriceAggregate.empty().copyWith(
                        salesOrgConfig: fakeMYSalesOrgConfigs,
                        price: Price.empty().copyWith(
                          lastPrice: listPrice,
                          finalPrice: finalPrice,
                          materialNumber: MaterialNumber('fake-material-1'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pump();
          expect(
            find.byKey(WidgetKeys.orderSuccessZPItemsSection),
            findsOneWidget,
          );
          final listPriceStrikeThroughComponent =
              find.byType(ListPriceStrikeThroughComponent);
          final listPriceFinder = find.byWidgetPredicate(
            (widget) =>
                widget is RichText &&
                widget.key == WidgetKeys.priceComponent &&
                widget.text
                    .toPlainText()
                    .contains(listPrice.getOrCrash().toString()),
          );
          expect(
            find.descendant(
              of: listPriceStrikeThroughComponent,
              matching: listPriceFinder,
            ),
            findsNothing,
          );
        },
      );

      testWidgets(
        'List price strike through price not visible, if final price is greater than and equal to list price && enableListPrice = true',
        (tester) async {
          final finalPrice = MaterialPrice(200);
          final listPrice = MaterialPrice(100);
          when(() => orderSummaryBlocMock.state).thenAnswer(
            (invocation) => OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderHistoryDetailsOrderItem: [
                    fakeMaterialItem.copyWith(
                      material: MaterialInfo.empty().copyWith(
                        materialNumber: MaterialNumber('fake-material-1'),
                      ),
                      priceAggregate: PriceAggregate.empty().copyWith(
                        salesOrgConfig: fakeIDSalesOrgConfigs,
                        price: Price.empty().copyWith(
                          lastPrice: listPrice,
                          finalPrice: finalPrice,
                          materialNumber: MaterialNumber('fake-material-1'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pump();
          expect(
            find.byKey(WidgetKeys.orderSuccessZPItemsSection),
            findsOneWidget,
          );
          final listPriceStrikeThroughComponent =
              find.byType(ListPriceStrikeThroughComponent);
          final listPriceFinder = find.byWidgetPredicate(
            (widget) =>
                widget is RichText &&
                widget.key == WidgetKeys.priceComponent &&
                widget.text
                    .toPlainText()
                    .contains(listPrice.getOrCrash().toString()),
          );
          expect(
            find.descendant(
              of: listPriceStrikeThroughComponent,
              matching: listPriceFinder,
            ),
            findsNothing,
          );
        },
      );

      testWidgets(
        'Show Counter offer price when price has isValid false and isPriceOverride is true',
        (tester) async {
          when(() => orderSummaryBlocMock.state).thenAnswer(
            (invocation) => OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderHistoryDetailsOrderItem: [
                    fakeMaterialItem.copyWith(
                      material: MaterialInfo.empty().copyWith(
                        materialNumber: MaterialNumber('fake-material-1'),
                      ),
                      isCounterOffer: true,
                      priceAggregate: PriceAggregate.empty().copyWith(
                        salesOrgConfig: fakeSGSalesOrgConfigs,
                        price: Price.empty().copyWith(
                          finalPrice: MaterialPrice(200),
                          isPriceOverride: true,
                          isValid: false,
                          materialNumber: MaterialNumber('fake-material-1'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pump();

          expect(
            find.byKey(WidgetKeys.orderSuccessZPItemsSection),
            findsOneWidget,
          );

          final orderItemPriceStrikeThrough =
              find.byKey(WidgetKeys.orderItemPriceStrikeThrough);

          final listPriceFinder = find.byWidgetPredicate(
            (widget) =>
                widget is RichText &&
                widget.key == WidgetKeys.priceComponent &&
                widget.text.toPlainText().contains('Price Not Available'),
          );

          expect(
            find.descendant(
              of: orderItemPriceStrikeThrough,
              matching: listPriceFinder,
            ),
            findsOneWidget,
          );
        },
      );
    });

    group('Attachment section -', () {
      testWidgets('Show Attachment Document Showing Less', (tester) async {
        when(() => orderSummaryBlocMock.state).thenAnswer(
          (invocation) => OrderSummaryState.initial().copyWith(
            orderHistoryDetailsList: [
              OrderHistoryDetails.empty().copyWith(
                orderHistoryDetailsPoDocuments: [
                  PoDocuments.empty(),
                  PoDocuments.empty(),
                ],
              ),
            ],
          ),
        );
        when(() => eligibilityBlocMock.state).thenAnswer(
          (invocation) => EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.byKey(WidgetKeys.orderSuccessAttachment), findsOneWidget);
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.orderSuccessAttachmentShowButton),
            matching: find.text(
              'Show more'.tr(),
            ),
          ),
          findsOneWidget,
        );
        await tester.tap(
          find.byKey(WidgetKeys.orderSuccessAttachmentShowButton),
        );
        verify(
          () => orderSummaryBlocMock.add(
            const OrderSummaryEvent.updateIsExpanded(
              isExpanded: true,
            ),
          ),
        ).called(1);
      });

      testWidgets('Show Attachment Document Showing All', (tester) async {
        final fakeFiles = [
          PoDocuments.empty(),
          PoDocuments.empty(),
        ];
        when(
          () => orderSummaryBlocMock.state,
        ).thenAnswer(
          (invocation) => OrderSummaryState.initial().copyWith(
            orderHistoryDetailsList: [
              OrderHistoryDetails.empty().copyWith(
                orderHistoryDetailsPoDocuments: fakeFiles,
              ),
            ],
            isExpanded: true,
          ),
        );

        when(() => eligibilityBlocMock.state).thenAnswer(
          (invocation) => EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.orderSuccessAttachmentShowButton),
            matching: find.text(
              'Show less'.tr(),
            ),
          ),
          findsOneWidget,
        );
        final downloadButtonFinder = find.byIcon(Icons.cloud_download_outlined);
        expect(
          downloadButtonFinder,
          findsNWidgets(fakeFiles.length),
        );
        await tester.tap(downloadButtonFinder.first);
        verify(
          () => poAttachmentBlocMock.add(
            PoAttachmentEvent.downloadFile(
              files: [fakeFiles.first],
            ),
          ),
        ).called(1);
      });

      testWidgets('Show Toast When Download Success', (tester) async {
        final fakeFiles = [
          PoDocuments.empty(),
          PoDocuments.empty(),
        ];
        when(
          () => orderSummaryBlocMock.state,
        ).thenAnswer(
          (invocation) => OrderSummaryState.initial().copyWith(
            orderHistoryDetailsList: [
              OrderHistoryDetails.empty().copyWith(
                orderHistoryDetailsPoDocuments: fakeFiles,
              ),
            ],
          ),
        );

        when(() => eligibilityBlocMock.state).thenAnswer(
          (invocation) => EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );
        whenListen(
          poAttachmentBlocMock,
          Stream.fromIterable(
            [
              PoAttachmentState.initial().copyWith(
                fileOperationMode: FileOperationMode.download,
                isFetching: false,
                failureOrSuccessOption: optionOf(
                  const Right(''),
                ),
              ),
            ],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.customSnackBar),
            matching: find.text(
              'Attachments downloaded successfully.'.tr(),
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets('Show Toast When Download Failure', (tester) async {
        final fakeFiles = [
          PoDocuments.empty(),
          PoDocuments.empty(),
        ];
        when(
          () => orderSummaryBlocMock.state,
        ).thenAnswer(
          (invocation) => OrderSummaryState.initial().copyWith(
            orderHistoryDetailsList: [
              OrderHistoryDetails.empty().copyWith(
                orderHistoryDetailsPoDocuments: fakeFiles,
              ),
            ],
          ),
        );

        when(() => eligibilityBlocMock.state).thenAnswer(
          (invocation) => EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );
        whenListen(
          poAttachmentBlocMock,
          Stream.fromIterable(
            [
              PoAttachmentState.initial().copyWith(
                fileOperationMode: FileOperationMode.download,
                isFetching: false,
                failureOrSuccessOption: optionOf(
                  const Left(ApiFailure.other('fake-error')),
                ),
              ),
            ],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.customSnackBar),
            matching: find.text(
              'fake-error'.tr(),
            ),
          ),
          findsOneWidget,
        );
      });
    });

    group('Bill to info -', () {
      testWidgets('When enable bill to true', (tester) async {
        when(() => eligibilityBlocMock.state).thenAnswer(
          (invocation) => EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfigs: fakeKHSalesOrgConfigs,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenAnswer(
          (invocation) => OrderSummaryState.initial().copyWith(
            orderHistoryDetailsList: [
              OrderHistoryDetails.empty().copyWith(
                referenceNotes: StringValue('fake-reference-notes'),
              ),
            ],
          ),
        );

        when(() => paymentCustomerInformationBlocMock.state).thenReturn(
          PaymentCustomerInformationState.initial().copyWith(
            paymentCustomerInformation:
                await PaymentCustomerInformationLocalDataSource()
                    .getPaymentCustomerInformation(),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.byKey(WidgetKeys.payerInformation), findsOneWidget);
      });

      testWidgets(
        'When enable bill to true and billToInfo is empty',
        (tester) async {
          when(() => paymentCustomerInformationBlocMock.state).thenAnswer(
            (invocation) => PaymentCustomerInformationState.initial().copyWith(
              paymentCustomerInformation: PaymentCustomerInformation.empty(),
            ),
          );

          when(() => eligibilityBlocMock.state).thenAnswer(
            (invocation) => EligibilityState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfigs: fakeKHSalesOrgConfigs,
            ),
          );
          when(() => orderSummaryBlocMock.state).thenAnswer(
            (invocation) => OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  referenceNotes: StringValue('fake-reference-notes'),
                ),
              ],
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();
          expect(find.byKey(WidgetKeys.payerInformation), findsNothing);
        },
      );

      testWidgets('When enable bill to false', (tester) async {
        when(() => eligibilityBlocMock.state).thenAnswer(
          (invocation) => EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfigs: fakeTWSalesOrgConfigs,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenAnswer(
          (invocation) => OrderSummaryState.initial().copyWith(
            orderHistoryDetailsList: [
              OrderHistoryDetails.empty().copyWith(
                referenceNotes: StringValue('fake-reference-notes'),
              ),
            ],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.byKey(WidgetKeys.payerInformation), findsNothing);
      });
    });

    group('Order number -', () {
      final orderId = find.byKey(WidgetKeys.orderSuccessOrderId);
      final zpOrderNumbers = find.byKey(WidgetKeys.orderSuccessZPOrderNumbers);
      final mpOrderNumbers = find.byKey(WidgetKeys.orderSuccessMPOrderNumbers);

      testWidgets(
        'Tap on order number',
        (tester) async {
          when(
            () => autoRouterMock.push(const ViewByOrderDetailsPageRoute()),
          ).thenAnswer((invocation) => Future(() => null));
          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderNumber: fakeOrderNumber,
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pump();

          expect(orderId, findsOneWidget);
          await tester.tap(orderId);
          await tester.pumpAndSettle();
          verify(
            () => viewByOrderDetailsBlocMock.add(
              ViewByOrderDetailsEvent.fetch(
                orderNumber: fakeOrderNumber,
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Display ZP and MP order number when order contains MP items',
        (tester) async {
          final fakeOrderHistoryDetailsListWithStockWithMPData = [
            fakeOrderHistoryDetails.copyWith(
              isMarketPlace: true,
              orderHistoryDetailsOrderItem: [
                fakeOrderHistoryDetails.orderHistoryDetailsOrderItem.first
                    .copyWith(
                  isMarketPlace: true,
                  materialStockInfo: MaterialStockInfo.empty().copyWith(
                    materialNumber: fakeOrderHistoryDetails
                        .orderHistoryDetailsOrderItem.first.materialNumber,
                    stockInfos: [
                      StockInfo.empty()
                          .copyWith(inStock: MaterialInStock('Yes')),
                    ],
                  ),
                ),
                fakeOrderHistoryDetails.orderHistoryDetailsOrderItem.first
                    .copyWith(
                  isMarketPlace: false,
                  productType: MaterialInfoType.material(),
                  materialStockInfo: MaterialStockInfo.empty().copyWith(
                    materialNumber: fakeOrderHistoryDetails
                        .orderHistoryDetailsOrderItem.first.materialNumber,
                    stockInfos: [
                      StockInfo.empty()
                          .copyWith(inStock: MaterialInStock('Yes')),
                    ],
                  ),
                ),
              ],
            ),
            fakeOrderHistoryDetails.copyWith(
              orderHistoryDetailsOrderItem: [
                fakeOrderHistoryDetails.orderHistoryDetailsOrderItem.first
                    .copyWith(
                  isMarketPlace: false,
                  productType: MaterialInfoType.material(),
                  materialStockInfo: MaterialStockInfo.empty().copyWith(
                    materialNumber: fakeOrderHistoryDetails
                        .orderHistoryDetailsOrderItem.first.materialNumber,
                    stockInfos: [
                      StockInfo.empty()
                          .copyWith(inStock: MaterialInStock('Yes')),
                    ],
                  ),
                ),
              ],
            ),
          ];
          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList:
                  fakeOrderHistoryDetailsListWithStockWithMPData,
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          expect(zpOrderNumbers, findsOneWidget);
          expect(
            find.descendant(
              of: zpOrderNumbers,
              matching: find.textContaining('ZP Order', findRichText: true),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(of: zpOrderNumbers, matching: orderId),
            findsNWidgets(
              fakeOrderHistoryDetailsListWithStockWithMPData.zpOrderOnly.length,
            ),
          );

          expect(mpOrderNumbers, findsOneWidget);
          expect(
            find.descendant(
              of: mpOrderNumbers,
              matching: find.textContaining('MP Order', findRichText: true),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(of: mpOrderNumbers, matching: orderId),
            findsNWidgets(
              fakeOrderHistoryDetailsListWithStockWithMPData.mpOrderOnly.length,
            ),
          );
        },
      );

      testWidgets(
        'Display MP order number when order only contains MP items',
        (tester) async {
          final zpOrderHistoryList = fakeOrderHistoryList.mpOrderOnly;
          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: zpOrderHistoryList,
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          expect(zpOrderNumbers, findsNothing);
          expect(mpOrderNumbers, findsOneWidget);
          expect(
            find.descendant(
              of: mpOrderNumbers,
              matching: find.textContaining('MP Queue', findRichText: true),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(of: mpOrderNumbers, matching: orderId),
            findsNWidgets(zpOrderHistoryList.length),
          );
        },
      );

      testWidgets(
        'Show Promotional label for ID market if promotional data is notEmpty',
        (tester) async {
          final scrollList = find.byKey(WidgetKeys.scrollList);

          final cartItem = PriceAggregate.empty().copyWith(
            salesOrgConfig: fakeIDSalesOrgConfigs,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000003353621001'),
              type: MaterialInfoType.material(),
            ),
          );

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeIDSalesOrgConfigs,
            ),
          );

          when(() => cartBlocMock.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: [cartItem],
              aplSimulatorOrder: aplSimulatorOrderMock,
            ),
          );
          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderNumber: OrderNumber('Fake-Order-Number'),
                  orderHistoryDetailsOrderItem: [
                    fakeMaterialItem.copyWith(
                      material: MaterialInfo.empty().copyWith(
                        materialNumber: MaterialNumber('000000003353621001'),
                      ),
                      priceAggregate: cartItem,
                    ),
                  ],
                ),
              ],
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final promotionTextFinder = find.byKey(
            WidgetKeys.promotionLabel(cartItem.getMaterialNumber.getValue()),
          );
          await tester.dragUntilVisible(
            promotionTextFinder,
            scrollList,
            const Offset(0, -300),
          );

          expect(promotionTextFinder, findsOneWidget);

          expect(
            find.text(
              '5.0% discount,IDR 10.0 offer applied',
              findRichText: true,
            ),
            findsOneWidget,
          );
        },
      );
      testWidgets(
        'Hide Promotional label for ID market if promotional data is empty',
        (tester) async {
          final cartItem = PriceAggregate.empty().copyWith(
            salesOrgConfig: fakeIDSalesOrgConfigs,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000003353621001'),
              type: MaterialInfoType.material(),
            ),
          );

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeIDSalesOrgConfigs,
            ),
          );

          when(() => cartBlocMock.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: [cartItem],
              aplSimulatorOrder: AplSimulatorOrder.empty(),
            ),
          );
          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              orderHistoryDetailsList: [
                OrderHistoryDetails.empty().copyWith(
                  orderNumber: OrderNumber('Fake-Order-Number'),
                  orderHistoryDetailsOrderItem: [
                    fakeMaterialItem.copyWith(
                      material: MaterialInfo.empty().copyWith(
                        materialNumber: MaterialNumber('000000003353621001'),
                      ),
                      priceAggregate: cartItem,
                    ),
                  ],
                ),
              ],
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final promotionTextFinder = find.byKey(
            WidgetKeys.promotionLabel(cartItem.getMaterialNumber.getValue()),
          );

          expect(promotionTextFinder, findsNothing);
        },
      );
    });

    testWidgets('Shoud display refresh banner when order is in queue',
        (tester) async {
      when(() => orderSummaryBlocMock.state).thenReturn(
        OrderSummaryState.initial().copyWith(
          orderHistoryDetailsList: [
            fakeOrderHistoryList
                .firstWhere((e) => e.processingStatus.isInQueue),
          ],
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessRefreshWarning),
          matching: find.text(
            'Please refresh the screen or tap on queue number to get the Order ID.',
            findRichText: true,
          ),
        ),
        findsOne,
      );
      await tester.dragUntilVisible(
        find.byKey(WidgetKeys.scrollList),
        find.byKey(WidgetKeys.orderSuccessItemTotalQty),
        const Offset(0, -200),
      );
      await tester.pump();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessRefreshWarning),
          matching: find.text(
            'Please refresh the screen to get accurate value.',
            findRichText: true,
          ),
        ),
        findsOne,
      );
      final widget = find.byWidgetPredicate(
        (w) =>
            w is RichText &&
            w.text.toPlainText() ==
                'Please refresh the screen to get accurate value.' &&
            tapTextSpan(w, 'refresh the screen'),
      );
      expect(widget, findsOne);
      await tester.pumpAndSettle();
      verify(
        () => orderSummaryBlocMock.add(
          const OrderSummaryEvent.orderConfirmationDetail(
            priceAggregate: <PriceAggregate>[],
          ),
        ),
      ).called(1);
    });
  });
}

bool _findTextAndTap(InlineSpan visitor, String text) {
  if (visitor is TextSpan && visitor.text == text) {
    (visitor.recognizer as TapGestureRecognizer).onTap!();

    return false;
  }

  return true;
}

bool tapTextSpan(RichText richText, String text) {
  return !richText.text.visitChildren(
    (visitor) => _findTextAndTap(visitor, text),
  );
}
