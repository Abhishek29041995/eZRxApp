import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/core/upload_option_type.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_rep_authorized_details.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart'
    as payment_term;
import 'package:ezrxmobile/domain/utils/date_time_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_title.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_title_with_logo.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/checkout_page.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/po_upload_attachment_section.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_bundle_item/checkout_bundle_item.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_material_item/checkout_material_item.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile_widgets/cart_product_tender_contract_section.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/market_place_delivery_tile.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_info.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_variant_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late CartBloc cartBloc;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late PaymentTermBloc paymentTermBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBloc;
  late OrderSummaryBloc orderSummaryBlocMock;
  late PoAttachmentBloc poAttachmentBloc;
  late PriceOverrideBloc priceOverrideBloc;
  late ComboDealListBloc comboDealListBloc;
  late MaterialPriceBloc materialPriceBlocMock;
  late OrderEligibilityBloc orderEligibilityBlocMock;
  late List<PriceAggregate> mockCartItems;
  late List<PriceAggregate> mockCartBundleItems;
  late Bundle fakeBundleList;
  late AplSimulatorOrder aplSimulatorOrder;
  late CustomerLicenseBloc customerLicenseBlocMock;
  late PaymentCustomerInformationBloc paymentCustomerInformationBlocMock;
  final config = ConfigMock();
  final checkoutPageRouteRouteData = RouteData(
    stackKey: const Key(''),
    type: const RouteType.adaptive(),
    route: RouteMatch(
      segments: const [],
      config: AutoRoute(
        page: const PageInfo(CheckoutPageRoute.name),
        //path: '/orders/cart/checkout',
      ),
      stringMatch: 'orders/cart/checkout',
      key: const ValueKey('CheckoutPageRoute'),
    ),
    router: AutoRouteMock(),
    pendingChildren: [],
  );

  final fakeCartProduct = <PriceAggregate>[
    PriceAggregate.empty().copyWith(
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('123456789'),
        quantity: MaterialQty(1),
        taxClassification: MaterialTaxClassification('Product : Full Tax'),
        tax: 10,
      ),
      price: Price.empty().copyWith(
        finalPrice: MaterialPrice(234.50),
      ),
      salesOrgConfig: fakeVNSalesOrgConfigs,
    ),
  ];

  final fakeTenderContract = TenderContract.empty().copyWith(
    tenderOrderReason: TenderContractReason('730'),
    contractNumber: TenderContractNumber('fake-Number'),
    tenderPrice: 11832000.0,
    tenderUnitPrice: 118320.0,
    pricingUnit: 100,
    contractReference: StringValue('fake-Reference'),
    salesDistrict: StringValue('fake-SalesDistrict'),
    announcementLetterNumber: TenderContractNumber(
      'fake-AnnouncementLetterNo',
    ),
    remainingTenderQuantity: 10,
  );

  setUpAll(() async {
    locator.registerFactory<Config>(() => config);
    when(() => config.maximumUploadSize).thenReturn(20);

    locator.registerFactory(() => AutoRouteMock());
    locator.registerSingleton<MixpanelService>(MixpanelServiceMock());

    autoRouterMock = locator<AutoRouteMock>();
    mockCartBundleItems = await CartLocalDataSource().upsertCart(
      type: UpsertCartLocalType.upsertCartItems,
    );
    mockCartItems =
        (await CartLocalDataSource().getAddedToCartProductList()).cartProducts;
    aplSimulatorOrder = await CartLocalDataSource().aplSimulateOrder();
    fakeBundleList = Bundle.empty().copyWith(
      materials: [
        MaterialInfo.empty().copyWith(
          type: MaterialInfoType('bundle'),
          materialNumber: MaterialNumber('fake-mat1'),
          stockInfos: [
            StockInfo.empty().copyWith(
              inStock: MaterialInStock('Yes'),
              materialNumber: MaterialNumber('fake-mat1'),
            ),
          ],
        ),
        MaterialInfo.empty().copyWith(
          type: MaterialInfoType('bundle'),
          materialNumber: MaterialNumber('fake-mat2'),
          stockInfos: [
            StockInfo.empty().copyWith(
              inStock: MaterialInStock('No'),
              materialNumber: MaterialNumber('fake-mat2'),
            ),
          ],
        ),
      ],
    );
  });

  ///////////////////////////Finder//////////////////////////////////////////
  final checkoutSummaryTax = find.byKey(WidgetKeys.checkoutSummaryTax);
  final checkoutSummarySmallOrderFee =
      find.byKey(WidgetKeys.smallOrderFeeSection);
  final checkoutSummaryGrandTotalPrice =
      find.byKey(WidgetKeys.checkoutSummaryGrandTotalPrice);
  final checkoutSummaryTaxPrice =
      find.byKey(WidgetKeys.checkoutSummaryTaxPrice);
  final checkoutSummaryTotalSaving =
      find.byKey(WidgetKeys.checkoutSummaryTotalSaving);
  final checkoutDeliveryArrowButtonFinder =
      find.byKey(WidgetKeys.checkoutDeliveryArrowButton);

  //////////////////////////////////////////////////////////////////////////
  group('Checkout Page Test', () {
    setUp(() async {
      eligibilityBloc = EligibilityBlocMock();
      cartBloc = CartBlocMock();
      paymentTermBlocMock = PaymentTermBlocMock();
      additionalDetailsBlocMock = AdditionalDetailsBlocMock();
      orderSummaryBlocMock = OrderSummaryBlocMock();
      poAttachmentBloc = PoAttachmentBlocMock();
      priceOverrideBloc = PriceOverrideBlocMock();
      comboDealListBloc = ComboDealListBlocMock();
      materialPriceBlocMock = MaterialPriceBlocMock();
      orderEligibilityBlocMock = OrderEligibilityBlocMock();
      paymentCustomerInformationBlocMock = PaymentCustomerInformationBlocMock();
      customerLicenseBlocMock = CustomerLicenseBlocMock();
      when(() => orderSummaryBlocMock.state).thenReturn(
        OrderSummaryState.initial().copyWith(),
      );
      when(() => customerLicenseBlocMock.state)
          .thenReturn(CustomerLicenseState.initial());
      when(() => poAttachmentBloc.state).thenReturn(
        PoAttachmentState.initial(),
      );
      when(() => priceOverrideBloc.state).thenReturn(
        PriceOverrideState.initial(),
      );
      when(() => comboDealListBloc.state).thenReturn(
        ComboDealListState.initial(),
      );
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(isFetching: false),
      );
      when(() => paymentTermBlocMock.state)
          .thenReturn(PaymentTermState.initial());
      when(() => additionalDetailsBlocMock.state)
          .thenReturn(AdditionalDetailsState.initial());
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
      when(
        () => orderEligibilityBlocMock.state,
      ).thenReturn(OrderEligibilityState.initial());
      when(() => autoRouterMock.current).thenReturn(checkoutPageRouteRouteData);
      when(() => autoRouterMock.maybePop())
          .thenAnswer((invocation) async => true);
      when(() => autoRouterMock.pushNamed(any()))
          .thenAnswer((invocation) async => null);
      when(() => paymentCustomerInformationBlocMock.state).thenReturn(
        PaymentCustomerInformationState.initial().copyWith(
          paymentCustomerInformation:
              await PaymentCustomerInformationLocalDataSource()
                  .getPaymentCustomerInformation(),
        ),
      );
    });
    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<PaymentTermBloc>(
            create: (context) => paymentTermBlocMock,
          ),
          BlocProvider<AdditionalDetailsBloc>(
            create: (context) => additionalDetailsBlocMock,
          ),
          BlocProvider<PoAttachmentBloc>(
            create: (context) => poAttachmentBloc,
          ),
          BlocProvider<PriceOverrideBloc>(
            create: (context) => priceOverrideBloc,
          ),
          BlocProvider<OrderSummaryBloc>(
            create: (context) => orderSummaryBlocMock,
          ),
          BlocProvider<CustomerLicenseBloc>(
            create: (context) => customerLicenseBlocMock,
          ),
          BlocProvider<ComboDealListBloc>(
            create: (context) => comboDealListBloc,
          ),
          BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
          BlocProvider<CartBloc>(create: (context) => cartBloc),
          BlocProvider<MaterialPriceBloc>(
            create: (context) => materialPriceBlocMock,
          ),
          BlocProvider<OrderEligibilityBloc>(
            create: (context) => orderEligibilityBlocMock,
          ),
          BlocProvider<PaymentCustomerInformationBloc>(
            create: ((context) => paymentCustomerInformationBlocMock),
          ),
        ],
        child: const Material(
          child: CheckoutPage(),
        ),
      );
    }

    testWidgets(
      '=> test checkout page AppBar ',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final closeButtonFinder = find.byKey(WidgetKeys.closeButton);
        expect(closeButtonFinder, findsOneWidget);
        await tester.tap(closeButtonFinder);
        await tester.pump();
        verify(() => autoRouterMock.maybePop()).called(1);
      },
    );

    testWidgets(
      '=> test checkout page bottom Navigation Bar test ',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final showOrderSumaryListTileFinder =
            find.byKey(WidgetKeys.priceSummaryListTile);
        expect(showOrderSumaryListTileFinder, findsOneWidget);
        await tester.tap(showOrderSumaryListTileFinder);
        await tester.pumpAndSettle();
        final orderPriceSummarySheetFinder =
            find.byKey(WidgetKeys.priceSummarySheet);
        expect(orderPriceSummarySheetFinder, findsOneWidget);
        final orderPriceSummarySheetCloseButtonFinder = find.descendant(
          of: find.byKey(WidgetKeys.closeButton),
          matching: find.textContaining('Close'.tr()),
        );
        expect(orderPriceSummarySheetCloseButtonFinder, findsOneWidget);
        await tester.tap(orderPriceSummarySheetCloseButtonFinder);
        await tester.pumpAndSettle();
        verify(() => autoRouterMock.maybePop()).called(1);
      },
    );
    testWidgets(
      '=> test checkout page bottom Navigation Bar test with Additional Details',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
            salesOrganisation: fakeMYSalesOrganisation,
            aplSimulatorOrder:
                AplSimulatorOrder.empty().copyWith(smallOrderFee: 12500.0),
          ),
        );
        final expectedState = [
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
            focusTo: DeliveryInfoLabel.paymentTerm,
            deliveryInfoData: DeliveryInfoData.empty()
                .copyWith(contactPerson: StringValue('fakeInput')),
          ),
        ];
        whenListen(
          additionalDetailsBlocMock,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final showOrderSumaryListTileFinder =
            find.byKey(WidgetKeys.priceSummaryListTile);
        expect(showOrderSumaryListTileFinder, findsOneWidget);
        final checkoutStickyGrandTotalFinder =
            find.byKey(WidgetKeys.priceSummaryGrandTotal);
        expect(checkoutStickyGrandTotalFinder, findsOneWidget);
        verify(
          () => orderSummaryBlocMock.add(
            OrderSummaryEvent.submitOrder(
              cartProducts: fakeCartProduct,
              grandTotal: 234.5,
              orderValue: 234.5,
              totalTax: 0.0,
              aplSmallOrderFee: 12500.0,
              mpSmallOrderFee: 0,
              zpSmallOrderFee: 0,
              data: DeliveryInfoData.empty()
                  .copyWith(contactPerson: StringValue('fakeInput')),
              salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
              deliveryOption: '',
            ),
          ),
        ).called(1);
      },
    );
    testWidgets(
      '=> test AdditionalDetailsBloc Listener when isValidated is false',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        final expectedState = [
          AdditionalDetailsState.initial().copyWith(
            focusTo: DeliveryInfoLabel.contactPerson,
          ),
        ];
        whenListen(
          additionalDetailsBlocMock,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final showOrderSumaryListTileFinder =
            find.byKey(WidgetKeys.priceSummaryListTile);
        expect(showOrderSumaryListTileFinder, findsOneWidget);
        final checkoutStickyGrandTotalFinder =
            find.byKey(WidgetKeys.priceSummaryGrandTotal);
        expect(checkoutStickyGrandTotalFinder, findsOneWidget);
      },
    );
    testWidgets(
      '=> test OrderSummaryBloc Listener when isSubmitting is false',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        );

        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        when(
          () => autoRouterMock.pushAndPopUntil(
            const OrderSuccessPageRoute(),
            predicate: (any(named: 'predicate')),
          ),
        ).thenAnswer((invocation) => Future.value());

        final expectedState = [
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
          OrderSummaryState.initial(),
        ];
        whenListen(
          orderSummaryBlocMock,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        verify(
          () => orderSummaryBlocMock.add(
            OrderSummaryEvent.orderConfirmationDetail(
              priceAggregate: fakeCartProduct,
            ),
          ),
        ).called(1);

        verify(
          () => poAttachmentBloc.add(
            const PoAttachmentEvent.initialized(),
          ),
        ).called(1);

        verify(
          () => additionalDetailsBlocMock.add(
            AdditionalDetailsEvent.initialized(
              config: fakeMYSalesOrgConfigs,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ),
        ).called(1);

        verify(
          () => autoRouterMock
            ..pushAndPopUntil(
              const OrderSuccessPageRoute(),
              predicate: (any(named: 'predicate')),
            ),
        ).called(1);
      },
    );
    testWidgets(
      '=> test OrderSummaryBloc Listener when isSubmitting is true and api have successful response',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        final expectedState = [
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
            apiFailureOrSuccessOption:
                optionOf(Right(SubmitOrderResponse.empty())),
          ),
        ];
        whenListen(
          orderSummaryBlocMock,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
      },
    );
    testWidgets(
      '=> test OrderSummaryBloc Listener when isSubmitting is true and api have failure response',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        final expectedState = [
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-error'))),
          ),
        ];
        whenListen(
          orderSummaryBlocMock,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        verify(
          () => trackMixpanelEvent(
            TrackingEvents.placeOrderFailure,
            props: {
              TrackingProps.errorMessage: 'Fake-error'.tr(),
            },
          ),
        ).called(1);
      },
    );

    testWidgets(
      '=> test Checkout Body ',
      (tester) async {
        await tester.binding.setSurfaceSize(const Size(800, 1200));

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
            salesOrganisation: fakeTHSalesOrganisation,
          ),
        );
        final expectedState = [
          AdditionalDetailsState.initial().copyWith(
            isLoading: true,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              greenDeliveryEnabled: true,
              deliveryDate: DateTimeStringValue(''),
            ),
          ),
          AdditionalDetailsState.initial(),
        ];
        whenListen(
          additionalDetailsBlocMock,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final deliveryInformationTextFinder =
            find.textContaining('Delivery information'.tr());
        expect(deliveryInformationTextFinder, findsOneWidget);
        final checkoutScrollListFinder = find.byKey(WidgetKeys.scrollList);
        final checkoutDeliveryArrowButtonFinder =
            find.byKey(WidgetKeys.checkoutDeliveryArrowButton);
        expect(checkoutDeliveryArrowButtonFinder, findsOneWidget);
        final pOReferenceKeyFinder =
            find.byKey(WidgetKeys.genericKey(key: 'pOReferenceKey'));
        expect(pOReferenceKeyFinder, findsOneWidget);
        final deliveryDateFinder = find.byKey(WidgetKeys.deliveryDate);
        expect(deliveryDateFinder, findsOneWidget);
        expect(
          (tester.widget(deliveryDateFinder) as TextFormField)
              .validator
              ?.call('DeliveryDate field'),
          null,
        );
        await tester.dragUntilVisible(
          deliveryDateFinder,
          checkoutScrollListFinder,
          const Offset(0, -200),
        );
        if (DateTime.now().hour < fakeTHSalesOrgConfigs.salesOrg.cutOffTime) {
          await tester.tap(deliveryDateFinder);
          await tester.pumpAndSettle();
          expect(find.byType(CalendarDatePicker), findsOneWidget);
        }
      },
    );

    testWidgets(
      '=> test Max character length of po reference input field',
      (tester) async {
        const textOfLength35 = 'fake-text-fake-text-fake-----------';
        const textOfLengthGreaterThan35 =
            'fake-text-fake-text-fake------------------';
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final pOReferenceKeyFinder =
            find.byKey(WidgetKeys.genericKey(key: 'pOReferenceKey'));
        expect(pOReferenceKeyFinder, findsOneWidget);

        await tester.enterText(
          pOReferenceKeyFinder,
          textOfLength35,
        );
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();
        expect(
          find.text(textOfLength35),
          findsOneWidget,
        );
        await tester.enterText(
          pOReferenceKeyFinder,
          textOfLengthGreaterThan35,
        );
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();
        expect(
          find.text(textOfLengthGreaterThan35),
          findsNothing,
        );
      },
    );

    testWidgets(
      '=> Optional text not visible if po reference is a required field',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final pOReferenceKeyFinder =
            find.byKey(WidgetKeys.genericKey(key: 'pOReferenceKey'));

        expect(pOReferenceKeyFinder, findsOneWidget);

        expect(
          find.text('Enter your PO reference (Optional)'),
          findsNothing,
        );
        expect(
          find.text('Enter your PO reference'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '=> test Max character length of Delivery instructions input field',
      (tester) async {
        const textOfLength132 =
            'fake-text-fake-text-fake-text-fake-text-fake-text-fake-text-fake-text-fake-text-fake-text-fake-text-fake-text-fake-text-fake-ake----';
        const textOfLengthGreaterThan132 =
            'fake-text-fake-text-fake-text-fake-text-fake-text-fake-text-fake-text-fake-text-fake-text-fake-text-fake-text-fake-text-fake-ake---------';
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final deliveryInstructionField =
            find.byKey(WidgetKeys.genericKey(key: 'deliveryInstructionKey'));
        expect(deliveryInstructionField, findsOneWidget);

        await tester.enterText(
          deliveryInstructionField,
          textOfLength132,
        );
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();
        expect(
          find.text(textOfLength132),
          findsOneWidget,
        );
        await tester.enterText(
          deliveryInstructionField,
          textOfLengthGreaterThan132,
        );
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();
        expect(
          find.text(textOfLengthGreaterThan132),
          findsNothing,
        );
      },
    );
    testWidgets(
      '=> test Delivery Date ',
      (tester) async {
        await tester.binding.setSurfaceSize(const Size(800, 1200));

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
            salesOrganisation: fakeTHSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final deliveryInformationTextFinder =
            find.textContaining('Delivery information'.tr());
        expect(deliveryInformationTextFinder, findsOneWidget);
        final checkoutScrollListFinder = find.byKey(WidgetKeys.scrollList);
        final deliveryDateFinder = find.byKey(WidgetKeys.deliveryDate);
        expect(deliveryDateFinder, findsOneWidget);
        expect(
          (tester.widget(deliveryDateFinder) as TextFormField)
              .validator
              ?.call('DeliveryDate field'),
          null,
        );
        await tester.dragUntilVisible(
          deliveryDateFinder,
          checkoutScrollListFinder,
          const Offset(0, -100),
        );
        if (DateTime.now().hour < fakeTHSalesOrgConfigs.salesOrg.cutOffTime) {
          await tester.tap(deliveryDateFinder);
          await tester.pumpAndSettle();
          expect(find.byType(CalendarDatePicker), findsOneWidget);
        }
      },
    );

    testWidgets('=> test DeliveryInfo with reference note', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTHSalesOrgConfigs,
          salesOrganisation: fakeTHSalesOrganisation,
        ),
      );
      final expectedState = [
        AdditionalDetailsState.initial().copyWith(
          isLoading: true,
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            greenDeliveryEnabled: true,
            deliveryDate: DateTimeStringValue(''),
          ),
        ),
        AdditionalDetailsState.initial(),
      ];
      whenListen(
        additionalDetailsBlocMock,
        Stream.fromIterable(expectedState),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final referenceNoteKeyFinder =
          find.byKey(WidgetKeys.genericKey(key: 'referenceNoteKey'));
      expect(referenceNoteKeyFinder, findsOneWidget);
      final deliveryInstructionKeyFinder =
          find.byKey(WidgetKeys.genericKey(key: 'deliveryInstructionKey'));
      expect(deliveryInstructionKeyFinder, findsOneWidget);
    });

    testWidgets('=> test DeliveryInfo with payment Terms', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTWSalesOrgConfigs,
          salesOrganisation: fakeTWSalesOrganisation,
        ),
      );
      final expectedState = [
        AdditionalDetailsState.initial().copyWith(
          isLoading: true,
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            greenDeliveryEnabled: true,
            deliveryDate: DateTimeStringValue(''),
          ),
        ),
        AdditionalDetailsState.initial(),
      ];
      whenListen(
        additionalDetailsBlocMock,
        Stream.fromIterable(expectedState),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final paymentTermKeyFinder = find.byKey(WidgetKeys.paymentTermKey);
      expect(paymentTermKeyFinder, findsOneWidget);
      final deliveryInstructionKeyFinder =
          find.byKey(WidgetKeys.genericKey(key: 'deliveryInstructionKey'));
      expect(deliveryInstructionKeyFinder, findsOneWidget);
    });

    testWidgets('=> test DeliveryInfo with contact details', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeVNSalesOrgConfigs,
          salesOrganisation: fakeVNSalesOrganisation,
        ),
      );
      final expectedState = [
        AdditionalDetailsState.initial().copyWith(
          isLoading: true,
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            greenDeliveryEnabled: true,
            deliveryDate: DateTimeStringValue(''),
          ),
        ),
        AdditionalDetailsState.initial(),
      ];
      whenListen(
        additionalDetailsBlocMock,
        Stream.fromIterable(expectedState),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final contactPersonKeyFinder =
          find.byKey(WidgetKeys.genericKey(key: 'contactPersonKey'));
      expect(contactPersonKeyFinder, findsOneWidget);
      final mobileNumberFinder =
          find.byKey(WidgetKeys.genericKey(key: 'contactNumberKey'));
      expect(mobileNumberFinder, findsOneWidget);
      final deliveryInstructionKeyFinder =
          find.byKey(WidgetKeys.genericKey(key: 'deliveryInstructionKey'));
      expect(deliveryInstructionKeyFinder, findsOneWidget);
    });

    testWidgets('=> test TextEditingValue on change for Reference Note',
        (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTHSalesOrgConfigs,
          salesOrganisation: fakeTHSalesOrganisation,
        ),
      );
      final expectedState = [
        AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            referenceNote: StringValue('fake'),
          ),
        ),
        AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            referenceNote: StringValue(''),
          ),
        ),
      ];
      whenListen(
        additionalDetailsBlocMock,
        Stream.fromIterable(expectedState),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final referenceNoteKeyFinder =
          find.byKey(WidgetKeys.genericKey(key: 'referenceNoteKey'));
      expect(referenceNoteKeyFinder, findsOneWidget);
      await tester.enterText(referenceNoteKeyFinder, 'f');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      verify(
        () => additionalDetailsBlocMock.add(
          const AdditionalDetailsEvent.onTextChange(
            label: DeliveryInfoLabel.referenceNote,
            newValue: 'f',
          ),
        ),
      ).called(2);
    });
    testWidgets('=> test TextEditingValue on change for Payment Terms',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(800, 1200));

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTWSalesOrgConfigs,
          salesOrganisation: fakeTWSalesOrganisation,
        ),
      );
      when(() => additionalDetailsBlocMock.state).thenReturn(
        AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            paymentTerm: PaymentTerm(
              'fake_payment_term - fake_payment_term_description',
            ),
          ),
        ),
      );
      final expectedState = [
        PaymentTermState.initial().copyWith(
          isFetching: true,
        ),
        PaymentTermState.initial().copyWith(
          paymentTerms: [
            payment_term.PaymentTerm.empty().copyWith(
              paymentTermCode: 'fake_payment_term',
              paymentTermDescription: 'fake_payment_term_description',
            ),
          ],
        ),
      ];
      whenListen(
        paymentTermBlocMock,
        Stream.fromIterable(expectedState),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final paymentTermKeyFinder = find.byKey(WidgetKeys.paymentTermKey);
      expect(paymentTermKeyFinder, findsOneWidget);
      final paymentTermDropdownKeyFinder =
          find.byKey(WidgetKeys.paymentTermDropdownKey);
      expect(paymentTermDropdownKeyFinder, findsOneWidget);
      await tester.tap(paymentTermDropdownKeyFinder);
      await tester.pumpAndSettle();
      await tester.tap(
        find.text('fake_payment_term - fake_payment_term_description').last,
      );
      await tester.pumpAndSettle();
    });
    testWidgets(
      '=> test Checkout Body Product Scroll List for material type',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('12345'),
                  principalData: PrincipalData(
                    principalCode: PrincipalCode(
                      'fake_principalCode',
                    ),
                    principalName: PrincipalName('fake_principalName-1'),
                  ),
                  type: MaterialInfoType.material(),
                ),
                bonusSampleItems: [
                  BonusSampleItem.empty()
                      .copyWith(materialNumber: MaterialNumber('12345')),
                ],
              ),
            ],
            salesOrganisation: fakeTHSalesOrganisation,
            additionInfo: {
              MaterialNumber('12345'): ProductMetaData.empty().copyWith(
                productImages: [
                  ProductImages.empty()
                      .copyWith(thumbNail: 'fake_product_thumbNail'),
                ],
              ),
            },
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
            salesOrganisation: fakeTHSalesOrganisation,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial(),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final checkoutScrollListFinder = find.byKey(WidgetKeys.scrollList);
        final addressInfoSectionFinder = find.byType(AddressInfoSection);
        expect(checkoutScrollListFinder, findsOneWidget);
        expect(addressInfoSectionFinder, findsOneWidget);
      },
    );

    testWidgets(
      '=> test Checkout Body Product Scroll List for bundle type',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('12345'),
                  principalData: PrincipalData(
                    principalCode: PrincipalCode(
                      'fake_principalCode',
                    ),
                    principalName: PrincipalName('fake_principalName-1'),
                  ),
                  type: MaterialInfoType.bundle(),
                ),
                bundle: Bundle.empty().copyWith(
                  bundleCode: 'fake_bundle_code',
                  materials: [fakeCartProduct.first.materialInfo],
                ),
                bonusSampleItems: [
                  BonusSampleItem.empty()
                      .copyWith(materialNumber: MaterialNumber('12345')),
                ],
              ),
            ],
            salesOrganisation: fakeTHSalesOrganisation,
            additionInfo: {
              MaterialNumber('12345'): ProductMetaData.empty().copyWith(
                productImages: [
                  ProductImages.empty()
                      .copyWith(thumbNail: 'fake_product_thumbNail'),
                ],
              ),
            },
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
            salesOrganisation: fakeTHSalesOrganisation,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial(),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();
        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final checkoutScrollListFinder = find.byKey(WidgetKeys.scrollList);
        final addressInfoSectionFinder = find.byType(AddressInfoSection);
        expect(checkoutScrollListFinder, findsOneWidget);
        expect(addressInfoSectionFinder, findsOneWidget);
        final cartItemProductTileFinder = find.byKey(
          WidgetKeys.cartItemProductTile(
            fakeCartProduct.first.materialInfo.materialNumber.displayMatNo,
          ),
        );
        await tester.dragUntilVisible(
          cartItemProductTileFinder,
          checkoutScrollListFinder,
          const Offset(0, -100),
        );
        expect(cartItemProductTileFinder, findsOneWidget);
      },
    );
    testWidgets(
      '=> test Checkout Body Product Scroll List',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  principalData: PrincipalData(
                    principalCode: PrincipalCode(
                      'fake_principalCode',
                    ),
                    principalName: PrincipalName('fake_principalName-1'),
                  ),
                ),
              ),
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  principalData: PrincipalData(
                    principalCode: PrincipalCode(
                      'fake_principalCode',
                    ),
                    principalName: PrincipalName('fake_principalName-1'),
                  ),
                ),
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            additionInfo: {
              MaterialNumber('12345'): ProductMetaData.empty().copyWith(
                productImages: [
                  ProductImages.empty()
                      .copyWith(thumbNail: 'fake_product_thumbNail'),
                ],
              ),
            },
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
            salesOrganisation: fakeTHSalesOrganisation,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial(),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final checkoutScrollListFinder = find.byKey(WidgetKeys.scrollList);
        final addressInfoSectionFinder = find.byType(AddressInfoSection);
        expect(checkoutScrollListFinder, findsOneWidget);
        expect(addressInfoSectionFinder, findsOneWidget);
      },
    );
    testWidgets(
      '=> test Checkout Body Product Scroll List for combo type',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  principalData: PrincipalData(
                    principalCode: PrincipalCode(
                      'fake_principalCode',
                    ),
                    principalName: PrincipalName('principal_name_fake'),
                  ),
                  type: MaterialInfoType('combo'),
                  bundle:
                      Bundle.empty().copyWith(bundleCode: 'fake_bundleCode'),
                ),
                comboMaterials: [
                  ComboMaterialItem.empty().copyWith(
                    materialInfo: fakeCartProduct.first.materialInfo,
                  ),
                ],
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
            salesOrganisation: fakeTHSalesOrganisation,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial(),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final checkoutScrollListFinder = find.byKey(WidgetKeys.scrollList);
        final addressInfoSectionFinder = find.byType(AddressInfoSection);
        expect(addressInfoSectionFinder, findsOneWidget);
        expect(checkoutScrollListFinder, findsOneWidget);
      },
    );

    testWidgets(
      '=> test empty Po Reference in place Order when poNumberRequired is true',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              paymentTerm: PaymentTerm(
                'fake_payment_term - fake_payment_term_description',
              ),
              poReference: StringValue(''),
            ),
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        final customerPOReferenceKey = find.byKey(const Key('pOReferenceKey'));
        expect(customerPOReferenceKey, findsOneWidget);

        expect(
          (tester.widget(customerPOReferenceKey) as TextFormField)
              .validator
              ?.call(''),
          'PO reference is a required field.',
        );
      },
    );

    testWidgets(
      '=> test empty Po Reference with spaces in place Order when poNumberRequired is true',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              paymentTerm: PaymentTerm(
                'fake_payment_term - fake_payment_term_description',
              ),
              poReference: StringValue.trimmed('        '),
            ),
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        final customerPOReferenceKey = find.byKey(const Key('pOReferenceKey'));
        expect(customerPOReferenceKey, findsOneWidget);

        expect(
          (tester.widget(customerPOReferenceKey) as TextFormField)
              .validator
              ?.call(''),
          'PO reference is a required field.',
        );
      },
    );

    testWidgets(
      '=> test not empty Po Reference in place Order when poNumberRequired is true',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              paymentTerm: PaymentTerm(
                'fake_payment_term - fake_payment_term_description',
              ),
              poReference: StringValue('sample po reference'),
            ),
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        final customerPOReferenceKey = find.byKey(const Key('pOReferenceKey'));
        expect(customerPOReferenceKey, findsOneWidget);

        expect(
          (tester.widget(customerPOReferenceKey) as TextFormField)
              .validator
              ?.call(''),
          null,
        );
      },
    );

    testWidgets(
      '=> test contsct number in place Order when  enableMobileNumber is true',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: false,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeVNSalesOrgConfigs,
            salesOrganisation: fakeVNSalesOrganisation,
          ),
        );
        final phoneNumberInputKey =
            find.byKey(WidgetKeys.genericKey(key: 'contactNumberKey'));
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        expect(phoneNumberInputKey, findsOneWidget);

        expect(
          (tester.widget(phoneNumberInputKey) as TextFormField)
              .validator
              ?.call('MobileNumber field'),
          'Contact number is a required field',
        );
      },
    );

    testWidgets(
      '=> test format contact number with maximum 16 digit characters',
      (tester) async {
        const phoneNumberUserInput = 'abc+-193847293849503827344';

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeVNSalesOrgConfigs,
            salesOrganisation: fakeVNSalesOrganisation,
          ),
        );
        final phoneNumberInputKey =
            find.byKey(WidgetKeys.genericKey(key: 'contactNumberKey'));
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        await tester.enterText(phoneNumberInputKey, phoneNumberUserInput);
        await tester.pump();
        expect(
          (tester.widget(phoneNumberInputKey) as TextFormField)
              .controller
              ?.text,
          '1938472938495038',
        );
      },
    );

    testWidgets(
        '=> test update contact number field with the mobile number from state',
        (tester) async {
      const fakeMobileNumber = '0312123123';
      when(() => additionalDetailsBlocMock.state).thenReturn(
        AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty()
              .copyWith(mobileNumber: PhoneNumber(fakeMobileNumber)),
        ),
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeVNSalesOrgConfigs,
          salesOrganisation: fakeVNSalesOrganisation,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.tap(checkoutDeliveryArrowButtonFinder);
      await tester.pump();
      final phoneNumberInputKey =
          find.byKey(WidgetKeys.genericKey(key: 'contactNumberKey'));
      expect(
        (tester.widget(phoneNumberInputKey) as TextFormField).controller?.text,
        fakeMobileNumber,
      );
    });
    testWidgets(
      '=> test Reference Note in place Order when referenceNote is true ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
            salesOrganisation: fakeTHSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        final customerReferenceNoteKey =
            find.byKey(const Key('referenceNoteKey'));
        expect(customerReferenceNoteKey, findsOneWidget);

        expect(
          (tester.widget(customerReferenceNoteKey) as TextFormField)
              .validator
              ?.call('ReferenceNote field'),
          null,
        );
      },
    );
    testWidgets(
      '=> test Payment Terms in place Order when enablePaymentTerms is true ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTWSalesOrgConfigs,
            salesOrganisation: fakeTWSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        final customerPaymentTermDropdownKey =
            find.byKey(WidgetKeys.paymentTermDropdownKey);
        expect(customerPaymentTermDropdownKey, findsOneWidget);

        expect(
          (tester.widget(customerPaymentTermDropdownKey)
                  as DropdownButtonFormField<String>)
              .validator
              ?.call('PaymentTerm field'),
          'Please Select Payment Term',
        );
      },
    );
    testWidgets(
      '=> test International PhoneNumber Input in place Order when enablePaymentTerms is true ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeVNSalesOrgConfigs,
            salesOrganisation: fakeVNSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        final customerMobileNumberKey =
            find.byKey(WidgetKeys.genericKey(key: 'contactNumberKey'));
        expect(customerMobileNumberKey, findsOneWidget);

        expect(
          (tester.widget(customerMobileNumberKey) as TextFormField)
              .validator
              ?.call('MobileNumber field'),
          'Contact number is a required field',
        );
      },
    );
    testWidgets(
      '=> test Contact Person in place Order when EnableMobileNumber is true ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            showErrorMessages: true,
          ),
        );
        whenListen(
          additionalDetailsBlocMock,
          Stream.fromIterable([
            AdditionalDetailsState.initial().copyWith(
              showErrorMessages: false,
            ),
            AdditionalDetailsState.initial().copyWith(
              showErrorMessages: true,
            ),
          ]),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeVNSalesOrgConfigs,
            salesOrganisation: fakeVNSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final customerContactPersonKey =
            find.byKey(const Key('contactPersonKey'));
        final customerContactNumber =
            find.byKey(WidgetKeys.genericKey(key: 'contactNumberKey'));
        expect(customerContactPersonKey, findsOneWidget);
        expect(customerContactNumber, findsOneWidget);
        expect(
          find.descendant(
            of: customerContactPersonKey,
            matching: find.text('Contact person is a required field'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: customerContactNumber,
            matching: find.text('Contact number is a required field'),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '=> test Contact Person in place Order when EnableMobileNumber is false ',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTWSalesOrgConfigs,
            salesOrganisation: fakeTWSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final customerContactPersonKey =
            find.byKey(const Key('contactPersonKey'));
        final customerContactNumber =
            find.byKey(WidgetKeys.genericKey(key: 'contactNumberKey'));
        expect(customerContactPersonKey, findsNothing);
        expect(customerContactNumber, findsNothing);
      },
    );
    testWidgets(
      '=> test PoAttachment Upload in place Order when showPOAttachment is true ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poDocuments: [
                PoDocuments.empty().copyWith(
                  name: 'fake_file',
                  url: 'fake_url',
                ),
              ],
            ),
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
            user: fakeClientUser,
          ),
        );

        final expectedState = [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
          ),
          PoAttachmentState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Right(PermissionStatus)),
            fileOperationMode: FileOperationMode.upload,
            fileUrl: [
              PoDocuments.empty().copyWith(
                name: 'fake_file',
                url: 'fake_url',
              ),
            ],
          ),
        ];
        whenListen(
          poAttachmentBloc,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(WidgetKeys.snackBarDismissButton));
        await tester.pumpAndSettle();

        final poAttachmentUploadKey = find.byType(PoAttachmentUpload);
        await tester.dragUntilVisible(
          poAttachmentUploadKey,
          find.byKey(WidgetKeys.scrollList),
          const Offset(0.0, -200.0),
        );
        await tester.pump();
        expect(poAttachmentUploadKey, findsOneWidget);
        verify(
          () => additionalDetailsBlocMock.add(
            AdditionalDetailsEvent.addPoDocument(
              poDocuments: [
                PoDocuments.empty().copyWith(
                  name: 'fake_file',
                  url: 'fake_url',
                ),
              ],
            ),
          ),
        ).called(1);
        final uploadAttachmentKeyKey =
            find.byKey(WidgetKeys.uploadAttachmentKey);
        expect(uploadAttachmentKeyKey, findsOneWidget);
        await tester.tap(uploadAttachmentKeyKey);
        await tester.pumpAndSettle();

        final poAttachmentUploadBottomsheetKey =
            find.byKey(WidgetKeys.poAttachmentUploadBottomsheet);
        expect(poAttachmentUploadBottomsheetKey, findsOneWidget);
        final poAttachmentOptionGalleryKey = find.byKey(
          WidgetKeys.poAttachmentOption(UploadOptionType.gallery.name),
        );
        expect(poAttachmentOptionGalleryKey, findsOneWidget);
        await tester.tap(poAttachmentOptionGalleryKey);
        await tester.pump();
        verify(
          () => poAttachmentBloc.add(
            const PoAttachmentEvent.pickFile(
              uploadOptionType: UploadOptionType.gallery,
              submitTicketFileExtension: false,
            ),
          ),
        ).called(1);

        final poAttachmentOptionBrowserFileKey = find.byKey(
          WidgetKeys.poAttachmentOption(UploadOptionType.file.name),
        );
        expect(poAttachmentOptionBrowserFileKey, findsOneWidget);
        await tester.tap(poAttachmentOptionBrowserFileKey);
        await tester.pump();
        verify(
          () => poAttachmentBloc.add(
            const PoAttachmentEvent.pickFile(
              uploadOptionType: UploadOptionType.file,
              submitTicketFileExtension: false,
            ),
          ),
        ).called(1);

        final poAttachmentOptionTakePhotoKey = find.byKey(
          WidgetKeys.poAttachmentOption(UploadOptionType.takePhoto.name),
        );
        expect(poAttachmentOptionTakePhotoKey, findsOneWidget);
        await tester.tap(poAttachmentOptionTakePhotoKey);
        await tester.pump();
        verify(
          () => poAttachmentBloc.add(
            const PoAttachmentEvent.pickFile(
              uploadOptionType: UploadOptionType.takePhoto,
              submitTicketFileExtension: false,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      '=> test PoAttachment Upload in place Order check uploaded list',
      (tester) async {
        await tester.binding.setSurfaceSize(const Size(800, 1200));

        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poDocuments: [
                PoDocuments.empty().copyWith(
                  name: 'fake_file',
                  url: 'fake_url',
                ),
              ],
            ),
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );

        final expectedState = [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
          ),
          PoAttachmentState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Right(PermissionStatus)),
            fileOperationMode: FileOperationMode.upload,
            fileUrl: [
              PoDocuments.empty().copyWith(
                name: 'fake_file',
                url: 'fake_url',
              ),
            ],
          ),
        ];
        whenListen(
          poAttachmentBloc,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        final poAttachmentUploadKey = find.byType(PoAttachmentUpload);
        expect(poAttachmentUploadKey, findsOneWidget);
        verify(
          () => additionalDetailsBlocMock.add(
            AdditionalDetailsEvent.addPoDocument(
              poDocuments: [
                PoDocuments.empty().copyWith(
                  name: 'fake_file',
                  url: 'fake_url',
                ),
              ],
            ),
          ),
        ).called(1);
        final uploadAttachmentKeyKey =
            find.byKey(WidgetKeys.uploadAttachmentKey);
        expect(uploadAttachmentKeyKey, findsOneWidget);
        final itemDeleteButtonKey = find.byIcon(Icons.delete_outline_outlined);
        expect(itemDeleteButtonKey, findsOneWidget);
        final scrollListFinder = find.byKey(WidgetKeys.scrollList);
        expect(scrollListFinder, findsOneWidget);

        await tester.dragUntilVisible(
          itemDeleteButtonKey,
          scrollListFinder,
          const Offset(0.0, -200.0),
        );
        await tester.pumpAndSettle();
        await tester.tap(itemDeleteButtonKey);
        await tester.pump();
        verify(
          () => poAttachmentBloc.add(
            PoAttachmentEvent.deleteFile(
              file: PoDocuments.empty().copyWith(
                name: 'fake_file',
                url: 'fake_url',
              ),
            ),
          ),
        ).called(1);
      },
    );
    testWidgets(
      '=> test PoAttachment Upload in place Order when showPOAttachment is true  and the bloc return none  ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );

        final expectedState = [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
          ),
          PoAttachmentState.initial().copyWith(
            fileUrl: [
              PoDocuments.empty().copyWith(
                name: 'fake_file',
                url: 'fake_url',
              ),
            ],
          ),
        ];
        whenListen(
          poAttachmentBloc,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final poAttachmentUploadKey = find.byType(PoAttachmentUpload);
        expect(poAttachmentUploadKey, findsOneWidget);
      },
    );

    testWidgets(
      '=> test PO Reference in place Order when  poNumberRequired is false ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        final customerPOReferenceKey = find.byKey(const Key('pOReferenceKey'));
        expect(customerPOReferenceKey, findsOneWidget);

        expect(
          (tester.widget(customerPOReferenceKey) as TextFormField)
              .validator
              ?.call('PO reference is a required field.'),
          null,
        );
      },
    );

    testWidgets(
      '=> test PO Attachment in place Order when poAttachmentRequired is true ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isPoAttachmentValidated: false,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        expect(
          find.text(
            'Upload attachment',
          ),
          findsOneWidget,
        );

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        expect(
          find.text(
            'PO attachment is required',
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '=> test PO Attachment in place Order when poAttachmentRequired is false ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isPoAttachmentValidated: true,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        expect(
          find.text(
            'Upload attachment',
          ),
          findsOneWidget,
        );

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        expect(
          find.text(
            'PO attachment is required',
          ),
          findsNothing,
        );
      },
    );

    testWidgets(
      '=> test PO Attachment in place Order when showAttachment is false ',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        expect(
          find.text(
            'Upload attachment',
          ),
          findsNothing,
        );
      },
    );

    testWidgets(
      '=> test Payment Terms enabled',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTWSalesOrgConfigs,
            salesOrganisation: fakeTWSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPage = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPage, findsOneWidget);

        final paymentTermDropdown =
            find.byKey(WidgetKeys.paymentTermDropdownKey);
        expect(paymentTermDropdown, findsOneWidget);
      },
    );

    testWidgets(
      '=> test Payment Terms disabled',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPage = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPage, findsOneWidget);

        final paymentTermDropdown =
            find.byKey(WidgetKeys.paymentTermDropdownKey);
        expect(paymentTermDropdown, findsNothing);
      },
    );

    testWidgets(
      '=> Show tax details on material level when displaySubtotalTaxBreakdown && displayItemTaxBreakdown is enabled for vn with material level tax',
      (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('123456789'),
                quantity: MaterialQty(1),
                taxClassification:
                    MaterialTaxClassification('Product : Full Tax'),
                tax: 10,
              ),
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(234.50),
              ),
              salesOrgConfig: fakeVNSalesOrgConfigs,
            ),
          ],
          config: fakeVNSalesOrgConfigs,
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeVNSalesOrganisation,
            salesOrgConfigs: fakeVNSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.byWidgetPredicate((w) => w is SliverToBoxAdapter),
          findsAtLeastNWidgets(3),
        );
        final sliverFinder =
            find.byWidgetPredicate((w) => w is CustomScrollView);
        await tester.fling(sliverFinder, const Offset(0, -10000), 100);
        await tester.pump();

        final taxPercentageFinder = find.textContaining('Tax');
        expect(taxPercentageFinder, findsOneWidget);
        final vatPercentageFinder = find.text('Tax at 5%');
        expect(vatPercentageFinder, findsNothing);
        final listPriceWithTax = cartState
            .cartProducts.first.finalPriceTotalWithTax
            .toStringAsFixed(2);
        expect(
          find.text(
            'VND $listPriceWithTax',
            findRichText: true,
          ),
          findsAtLeastNWidgets(1),
        );
        expect(
          find.text('${'Subtotal (excl.tax)'.tr()}:'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '=> Do not Show tax details on total when displaySubtotalTaxBreakdown is disabled for ph',
      (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('123456789'),
                quantity: MaterialQty(1),
                taxClassification:
                    MaterialTaxClassification('Product : Full Tax'),
                tax: 10,
                type: MaterialInfoType.material(),
              ),
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(234.50),
              ),
              salesOrgConfig: fakePHSalesOrgConfigs,
            ),
          ],
          config: fakePHSalesOrgConfigs,
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakePHSalesOrganisation,
            salesOrgConfigs: fakePHSalesOrgConfigs,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.byWidgetPredicate((w) => w is SliverToBoxAdapter),
          findsAtLeastNWidgets(3),
        );
        final sliverFinder =
            find.byWidgetPredicate((w) => w is CustomScrollView);
        await tester.fling(sliverFinder, const Offset(0, -10000), 100);
        await tester.pump();

        final taxPercentageFinder = find.text('Tax at 10%');
        expect(taxPercentageFinder, findsNothing);
        final vatPercentageFinder = find.text('Tax at 5%');
        expect(vatPercentageFinder, findsNothing);
        final listPriceWithTax =
            cartState.cartProducts.first.finalPrice.toStringAsFixed(2);
        expect(
          find.text(
            'PHP $listPriceWithTax',
            findRichText: true,
          ),
          findsAtLeastNWidgets(1),
        );
        expect(find.text('Subtotal (incl.tax):'), findsOneWidget);
      },
    );

    testWidgets(
      '=> Hide tax rate on material level when displaySubtotalTaxBreakdown && displayItemTaxBreakdown is enabled for VN',
      (tester) async {
        final cartState = CartState.initial().copyWith(
          salesOrganisation: fakeVNSalesOrganisation,
          cartProducts: <PriceAggregate>[PriceAggregate.empty()],
          config: fakeVNSalesOrgConfigs,
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeVNSalesOrgConfigs,
            salesOrganisation: fakeVNSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        await tester.fling(
          find.byType(CustomScrollView),
          const Offset(0, -10000),
          100,
        );
        await tester.pump();

        //Hide the vat value
        final taxRateFinder = find.text('Tax:');
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryTax),
            matching: taxRateFinder,
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '=> Show tax rate on material level when displaySubtotalTaxBreakdown && displayItemTaxBreakdown is enabled for VN',
      (tester) async {
        final cartState = CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty(),
          ],
          config: fakeVNSalesOrgConfigs,
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeVNSalesOrgConfigs,
            salesOrganisation: fakeVNSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        await tester.fling(
          find.byType(CustomScrollView),
          const Offset(0, -10000),
          100,
        );
        await tester.pump();

        final taxRateFinder = find.text('Tax at:');
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryTax),
            matching: taxRateFinder,
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '=> Do not Show delivery Instruction textfield  when displaySubtotalTaxBreakdown is false',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.genericKey(key: 'deliveryInstructionKey')),
          findsNothing,
        );
      },
    );

    testWidgets(
      '=> Do not Show delivery Instruction textfield  when displaySubtotalTaxBreakdown is true',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeVNSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.genericKey(key: 'deliveryInstructionKey')),
          findsOneWidget,
        );
      },
    );

    testWidgets('=> Hide Request Delivery Date', (WidgetTester tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      // Verify that the initial delivery date is invisible
      expect(
        find.textContaining('Request delivery date'.tr(), findRichText: true),
        findsNothing,
      );
      expect(
        find.textContaining('Select date'.tr(), findRichText: true),
        findsNothing,
      );
    });

    testWidgets('=> Show Request Delivery Date', (WidgetTester tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeTHSalesOrganisation,
          salesOrgConfigs: fakeTHSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      // Verify that the initial delivery date is displayed correctly
      expect(
        find.textContaining('Request delivery date'.tr(), findRichText: true),
        findsOneWidget,
      );
      expect(
        find.textContaining('Select date'.tr(), findRichText: true),
        findsOneWidget,
      );
    });

    testWidgets('=> Test default request delivery date is empty',
        (WidgetTester tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeTHSalesOrganisation,
          salesOrgConfigs: fakeTHSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final rddFieldFinder = find.byKey(WidgetKeys.deliveryDate);
      expect(rddFieldFinder, findsOneWidget);
      final textField =
          rddFieldFinder.evaluate().single.widget as TextFormField;
      expect(textField.initialValue, '');
    });

    testWidgets('=> Selecting a date updates the delivery date text',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(800, 1200));

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeTHSalesOrganisation,
          salesOrgConfigs: fakeTHSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      // Verify that the initial delivery date is displayed correctly
      expect(
        find.textContaining('Request delivery date'.tr(), findRichText: true),
        findsOneWidget,
      );
      expect(
        find.textContaining('Select date'.tr(), findRichText: true),
        findsOneWidget,
      );
      var selectedDate = fakeTHSalesOrgConfigs.deliveryStartDate;

      expect(
        find.text(DateTimeUtils.getDeliveryDateString(selectedDate)),
        findsNothing,
      );

      // Simulate tapping the select date button
      await tester.tap(find.byKey(WidgetKeys.deliveryDate));
      await tester.pumpAndSettle();

      // Verify that the date picker is displayed
      final okButton = find.text('OK');
      expect(okButton, findsOneWidget);
      await tester.tap(find.widgetWithIcon(IconButton, Icons.edit_outlined));
      await tester.pump();
      selectedDate = DateTimeUtils.addWorkingDay(
        fakeTHSalesOrgConfigs.deliveryStartDate,
        fakeTHSalesOrgConfigs.futureDeliveryDay.intValue - 1,
      ).add(const Duration(days: 1));
      await tester.enterText(
        find.byType(InputDatePickerFormField),
        '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
      );
      await tester.pump();
      await tester.tap(okButton);
      await tester.pumpAndSettle();
      expect(find.text('Out of range.'), findsOneWidget);

      selectedDate = DateTimeUtils.addWorkingDay(
        fakeTHSalesOrgConfigs.deliveryStartDate,
        fakeTHSalesOrgConfigs.futureDeliveryDay.intValue - 1,
      );
      await tester.enterText(
        find.byType(InputDatePickerFormField),
        '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
      );
      await tester.pump();
      await tester.tap(okButton);
      await tester.pumpAndSettle();
      // Verify that the selected date is updated in the delivery date text field
      expect(
        find.text(DateTimeUtils.getDeliveryDateString(selectedDate)),
        findsOneWidget,
      );
    });

    testWidgets('Find Total Tax', (WidgetTester tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSGSalesOrganisation,
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );

      final cartState = CartState.initial().copyWith(
        cartProducts: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('123456789'),
              quantity: MaterialQty(1),
              tax: 10,
            ),
            price: Price.empty().copyWith(
              finalPrice: MaterialPrice(234.50),
            ),
            salesOrgConfig: fakeSGSalesOrgConfigs,
          ),
        ],
        config: fakeSGSalesOrgConfigs,
      );

      when(() => cartBloc.state).thenReturn(cartState);

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final scrollListFinder = find.byKey(WidgetKeys.scrollList);
      expect(scrollListFinder, findsOneWidget);

      final taxValue = find.textContaining(
        'Tax at 9%:',
      );
      await tester.dragUntilVisible(
        taxValue,
        scrollListFinder,
        const Offset(0.0, -200.0),
      );
    });

    testWidgets(
      'Display Price Not Available Message for hide price materials',
      (tester) async {
        final cartProducts = <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('123456789'),
              quantity: MaterialQty(1),
              taxClassification:
                  MaterialTaxClassification('Product : Full Tax'),
              type: MaterialInfoType('material'),
              hidePrice: true,
            ),
            price: Price.empty().copyWith(
              finalPrice: MaterialPrice(354.60),
            ),
          ),
        ];
        final cartState = CartState.initial().copyWith(
          cartProducts: cartProducts,
        );

        final orderEligibilityState = OrderEligibilityState.initial().copyWith(
          configs: fakeMYSalesOrgConfigs,
          cartItems: cartProducts,
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        when(() => orderEligibilityBlocMock.state).thenReturn(
          orderEligibilityState,
        );

        await tester.pumpWidget(getScopedWidget());
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
        'Test Grand Total value for bundles with displaySubtotalTaxBreakdown enabled',
        (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeKHSalesOrgConfigs,
          salesOrganisation: fakeKHSalesOrganisation,
        ),
      );
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          config: fakeKHSalesOrgConfigs,
          salesOrganisation: fakeKHSalesOrganisation,
          cartProducts: [
            mockCartBundleItems.first.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final scrollListFinder = find.byKey(WidgetKeys.scrollList);
      expect(scrollListFinder, findsOneWidget);

      final subTotalTextFinder = find.descendant(
        of: find.byKey(WidgetKeys.checkoutSummarySubTotal),
        matching: find.textContaining(
          'Subtotal (${fakeKHSalesOrgConfigs.displayPrefixTax}.tax)',
        ),
      );
      final subTotalValueFinder = find.descendant(
        of: find.byKey(WidgetKeys.checkoutSummarySubTotal),
        matching: find.text(
          '${fakeKHSalesOrgConfigs.currency.code} 990.00',
          findRichText: true,
        ),
      );
      final taxAtTextFinder = find.descendant(
        of: find.byKey(WidgetKeys.checkoutSummaryTax),
        matching: find.textContaining('Tax at 10%'),
      );
      final taxAtValueFinder = find.descendant(
        of: find.byKey(WidgetKeys.checkoutSummaryTax),
        matching: find.text(
          '${fakeKHSalesOrgConfigs.currency.code} 99.00',
          findRichText: true,
        ),
      );
      final grandTotalTextFinder = find.descendant(
        of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
        matching: find.textContaining('Grand total:'),
      );
      final grandTotalValueFinder = find.descendant(
        of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
        matching: find.text(
          '${fakeKHSalesOrgConfigs.currency.code} 1,089.00',
          findRichText: true,
        ),
      );

      await tester.dragUntilVisible(
        subTotalTextFinder,
        scrollListFinder,
        const Offset(0.0, -300.0),
      );

      await tester.dragUntilVisible(
        subTotalValueFinder,
        scrollListFinder,
        const Offset(0.0, -300.0),
      );

      await tester.dragUntilVisible(
        taxAtTextFinder,
        scrollListFinder,
        const Offset(0.0, -300.0),
      );

      await tester.dragUntilVisible(
        taxAtValueFinder,
        scrollListFinder,
        const Offset(0.0, -300.0),
      );

      await tester.dragUntilVisible(
        grandTotalTextFinder,
        scrollListFinder,
        const Offset(0.0, -300.0),
      );

      await tester.dragUntilVisible(
        grandTotalValueFinder,
        scrollListFinder,
        const Offset(0.0, -300.0),
      );
    });

    testWidgets(
      'Checkout page Price Breakdown for every market',
      (tester) async {
        final currentSalesOrgConfigVariant =
            salesOrgConfigVariant.currentValue ?? fakeIDSalesOrgConfigs;
        final currentSalesOrganisation = fakeEmptySalesOrganisation.copyWith(
          salesOrg: currentSalesOrgConfigVariant.salesOrg,
        );
        final aplOrder = aplSimulatorOrder.copyWith(smallOrderFee: 10);
        final cartProducts = [
          mockCartItems.first.copyWith(
            salesOrgConfig: currentSalesOrgConfigVariant,
            quantity: 1,
          ),
        ];
        final orderEligibilityState = OrderEligibilityState.initial().copyWith(
          configs: currentSalesOrgConfigVariant,
          cartItems: cartProducts,
          salesOrg: currentSalesOrganisation,
        );
        when(() => orderEligibilityBlocMock.state).thenReturn(
          orderEligibilityState,
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            config: currentSalesOrgConfigVariant,
            salesOrganisation: currentSalesOrganisation,
            cartProducts: cartProducts,
            aplSimulatorOrder: aplOrder,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: currentSalesOrgConfigVariant,
            salesOrganisation: currentSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final scrollListFinder = find.byKey(WidgetKeys.scrollList);
        expect(scrollListFinder, findsOneWidget);

        final subTotalTextFinder = find.descendant(
          of: find.byKey(WidgetKeys.checkoutSummarySubTotal),
          matching: find.textContaining(
            'Subtotal (${currentSalesOrgConfigVariant.displayPrefixTax}.tax)',
          ),
        );
        await tester.dragUntilVisible(
          subTotalTextFinder,
          scrollListFinder,
          const Offset(0.0, -300.0),
        );
        final subTotalValueFinder = find.descendant(
          of: find.byKey(WidgetKeys.checkoutSummarySubTotal),
          matching: find.text(
            StringUtils.priceComponentDisplayPrice(
              currentSalesOrgConfigVariant,
              currentSalesOrgConfigVariant.salesOrg.isID
                  ? aplOrder.totalPriceWithoutTax
                  : currentSalesOrgConfigVariant.displaySubtotalTaxBreakdown
                      ? mockCartItems.first.finalPrice
                      : mockCartItems.first.finalPriceTotalWithTax,
              false,
            ),
            findRichText: true,
          ),
        );
        expect(subTotalValueFinder, findsOneWidget);
        expect(
          checkoutSummaryTax,
          currentSalesOrgConfigVariant.displaySubtotalTaxBreakdown
              ? findsOneWidget
              : findsNothing,
        );
        expect(
          checkoutSummaryTaxPrice,
          currentSalesOrgConfigVariant.displaySubtotalTaxBreakdown
              ? findsOneWidget
              : findsNothing,
        );
        expect(
          checkoutSummarySmallOrderFee,
          orderEligibilityState.smallOrderFeeApplied
              ? findsOneWidget
              : findsNothing,
        );

        final checkoutSummarySmallOrderFeePriceFinder = find.descendant(
          of: find.byKey(WidgetKeys.smallOrderFeeSection),
          matching: find.text(
            StringUtils.priceComponentDisplayPrice(
              currentSalesOrgConfigVariant,
              aplOrder.smallOrderFee,
              false,
            ),
            findRichText: true,
          ),
        );
        expect(
          checkoutSummarySmallOrderFeePriceFinder,
          currentSalesOrgConfigVariant.salesOrg.showSmallOrderFee
              ? findsOneWidget
              : findsNothing,
        );
        expect(checkoutSummaryGrandTotalPrice, findsOneWidget);
        final totalSaving = find.descendant(
          of: checkoutSummaryTotalSaving,
          matching: find.text('Total savings:'),
        );
        expect(
          totalSaving,
          currentSalesOrgConfigVariant.salesOrg.showTotalSaving
              ? findsOneWidget
              : findsNothing,
        );
        final totalSavingValue = find.descendant(
          of: checkoutSummaryTotalSaving,
          matching: find.text(
            StringUtils.priceComponentDisplayPrice(
              currentSalesOrgConfigVariant,
              aplOrder.totalDiscountValue,
              false,
            ),
            findRichText: true,
          ),
        );
        expect(
          totalSavingValue,
          currentSalesOrgConfigVariant.salesOrg.showTotalSaving
              ? findsOneWidget
              : findsNothing,
        );
      },
      variant: salesOrgConfigVariant,
    );

    testWidgets(
      '=> test Checkout Bonus stock tag',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              mockCartItems.first.copyWith(
                materialInfo: mockCartItems.first.materialInfo.copyWith(
                  type: MaterialInfoType.material(),
                ),
                bonusSampleItems: [
                  BonusSampleItem.empty().copyWith(
                    materialNumber: mockCartItems.first.getMaterialNumber,
                    stockInfo: StockInfo.empty().copyWith(
                      inStock: MaterialInStock('No'),
                      materialNumber: mockCartItems.first.getMaterialNumber,
                    ),
                  ),
                ],
                stockInfoList: [
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('Yes'),
                    materialNumber: mockCartItems.first.getMaterialNumber,
                  ),
                ],
              ),
            ],
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        await tester.fling(
          find.byKey(WidgetKeys.scrollList),
          const Offset(0.0, -1000.0),
          1000.0,
        );
        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        expect(
          find.descendant(
            of: find.byType(StatusLabel),
            matching: find.text('Out of stock'),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '=> test Show Stock Info When Config Enable',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              mockCartItems.first.copyWith(
                materialInfo: mockCartItems.first.materialInfo.copyWith(
                  type: MaterialInfoType.material(),
                ),
                bonusSampleItems: [
                  BonusSampleItem.empty().copyWith(
                    materialNumber: mockCartItems.first.getMaterialNumber,
                  ),
                ],
                stockInfoList: [
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('Yes'),
                    materialNumber: mockCartItems.first.getMaterialNumber,
                  ),
                ],
              ),
            ],
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        await tester.fling(
          find.byKey(WidgetKeys.scrollList),
          const Offset(0.0, -1000.0),
          1000.0,
        );

        expect(
          find.descendant(
            of: find.byKey(
              WidgetKeys.cartItemBonus(
                mockCartItems.first.getMaterialNumber.displayMatNo,
                mockCartItems.first.getMaterialNumber.displayMatNo,
              ),
            ),
            matching: find.byKey(WidgetKeys.materialDetailsStock),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '=> test Do not Show OOS-Preorder tag when hideStock Config Enable for bonus material ',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTWSalesOrgConfigs,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              mockCartItems.first.copyWith(
                materialInfo: mockCartItems.first.materialInfo.copyWith(
                  type: MaterialInfoType.material(),
                ),
                bonusSampleItems: [
                  BonusSampleItem.empty().copyWith(
                    materialNumber: mockCartItems.first.getMaterialNumber,
                  ),
                ],
                stockInfoList: [
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('No'),
                    materialNumber: mockCartItems.first.getMaterialNumber,
                  ),
                ],
              ),
            ],
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        await tester.fling(
          find.byKey(WidgetKeys.scrollList),
          const Offset(0.0, -1000.0),
          1000.0,
        );

        expect(
          find.descendant(
            of: find.byKey(
              WidgetKeys.cartItemBonus(
                mockCartItems.first.getMaterialNumber.displayMatNo,
                mockCartItems.first.getMaterialNumber.displayMatNo,
              ),
            ),
            matching: find.byKey(WidgetKeys.paymentSummaryTextStatus),
          ),
          findsNothing,
        );
      },
    );

    testWidgets('BillToInfo test when enablebillto is true', (tester) async {
      final cartState = CartState.initial().copyWith(
        cartProducts: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('material'),
              materialNumber: MaterialNumber('123456789'),
              quantity: MaterialQty(1),
            ),
            salesOrgConfig: fakeKHSalesOrgConfigs,
          ),
        ],
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeKHSalesOrgConfigs,
          salesOrganisation: fakeKHSalesOrganisation,
        ),
      );
      when(() => cartBloc.state).thenReturn(
        cartState,
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final payerInformation = find.byKey(WidgetKeys.payerInformation);
      expect(payerInformation, findsOneWidget);
    });

    testWidgets(
        'BillToInfo test when enablebillto is true and billToInfo empty',
        (tester) async {
      final cartState = CartState.initial().copyWith(
        cartProducts: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('material'),
              materialNumber: MaterialNumber('123456789'),
              quantity: MaterialQty(1),
            ),
            salesOrgConfig: fakeKHSalesOrgConfigs,
          ),
        ],
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeKHSalesOrgConfigs,
          salesOrganisation: fakeKHSalesOrganisation,
        ),
      );
      when(() => cartBloc.state).thenReturn(
        cartState,
      );

      when(() => paymentCustomerInformationBlocMock.state).thenReturn(
        PaymentCustomerInformationState.initial().copyWith(
          paymentCustomerInformation: PaymentCustomerInformation.empty(),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final payerInformation = find.byKey(WidgetKeys.payerInformation);
      expect(payerInformation, findsNothing);
    });

    testWidgets('BillToInfo test when enablebillto is false', (tester) async {
      final cartState = CartState.initial().copyWith(
        cartProducts: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('material'),
              materialNumber: MaterialNumber('123456789'),
              quantity: MaterialQty(1),
            ),
            salesOrgConfig: fakeSGSalesOrgConfigs,
          ),
        ],
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
          salesOrganisation: fakeSGSalesOrganisation,
        ),
      );
      when(() => cartBloc.state).thenReturn(
        cartState,
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final payerInformation = find.byKey(WidgetKeys.payerInformation);
      expect(payerInformation, findsNothing);
    });

    testWidgets('Counter offer Requested for png material', (tester) async {
      final pnGCartItem = PriceAggregate.empty().copyWith(
        quantity: 2,
        price: Price.empty().copyWith(
          isPriceOverride: true,
          finalPrice: MaterialPrice(364.80),
          lastPrice: MaterialPrice(364.80),
        ),
        materialInfo: MaterialInfo.empty().copyWith(
          type: MaterialInfoType('material'),
          hidePrice: true,
          counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
            counterOfferPrice: CounterOfferValue('500'),
          ),
        ),
      );
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          cartProducts: [pnGCartItem],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final materialKey = find.byKey(WidgetKeys.cartItemProductMaterialNumber);

      final scrollListFinder = find.byKey(WidgetKeys.scrollList);
      expect(scrollListFinder, findsOneWidget);

      await tester.dragUntilVisible(
        materialKey,
        scrollListFinder,
        const Offset(0.0, -500.0),
      );
      await tester.pumpAndSettle();
      expect(materialKey, findsOneWidget);

      final priceNotAvailableFinder = find.descendant(
        of: find.byKey(WidgetKeys.cartItemProductUnitPrice),
        matching: find.text('Price Not Available', findRichText: true),
      );
      expect(priceNotAvailableFinder, findsOneWidget);

      final requestedCounterOfferKey =
          find.text('Requested counter offer'.tr());
      expect(requestedCounterOfferKey, findsOneWidget);
    });

    testWidgets('Find pre-order tag for bundle items in checkout page',
        (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          config: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeKHSalesOrganisation,
          cartProducts: [
            mockCartBundleItems.first.copyWith(
              bundle: fakeBundleList,
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final scrollListFinder = find.byKey(WidgetKeys.scrollList);
      expect(scrollListFinder, findsOneWidget);

      await tester.dragUntilVisible(
        find.byType(CheckoutBundleItem),
        scrollListFinder,
        const Offset(0.0, -500.0),
      );
      await tester.pumpAndSettle();

      final preOrderText = find.text('OOS-Preorder');

      expect(preOrderText, findsOneWidget);
    });
    testWidgets(
        'Find Marketplace Title, Marketplace Delivery info Marketplace Icon',
        (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          config: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeKHSalesOrganisation,
          cartProducts: mockCartItems,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final scrollListFinder = find.byKey(WidgetKeys.scrollList);
      expect(scrollListFinder, findsOneWidget);
      await tester.dragUntilVisible(
        find.byType(MarketPlaceDeliveryExpansionTile),
        scrollListFinder,
        const Offset(0.0, -500.0),
      );
      await tester.dragUntilVisible(
        find.byType(MarketPlaceTitleWithLogo),
        scrollListFinder,
        const Offset(0.0, -500.0),
      );
      await tester.dragUntilVisible(
        find.byType(MarketPlaceSellerTitle),
        scrollListFinder,
        const Offset(0.0, -500.0),
      );
      await tester.pumpAndSettle();
    });

    testWidgets(
        'Display marketplace icon and batch & expiry date as NA for MP bundle',
        (tester) async {
      final mpBundle = mockCartItems.firstWhere(
        (e) => e.materialInfo.type.typeBundle && e.materialInfo.isMarketPlace,
      );
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs:
              fakeMYSalesOrgConfigs.copyWith(enableBatchNumber: true),
        ),
      );
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          cartProducts: [mpBundle],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final scrollList = find.byKey(WidgetKeys.scrollList);
      final bundleTile =
          find.byKey(WidgetKeys.cartItemBundleTile(mpBundle.bundle.bundleCode));
      await tester.dragUntilVisible(
        bundleTile,
        scrollList,
        const Offset(0, -300),
      );
      await tester.pump();
      expect(
        find.descendant(
          of: bundleTile,
          matching: find.descendant(
            of: find.byKey(WidgetKeys.cartItemBundleName),
            matching: find.byType(MarketPlaceLogo),
          ),
        ),
        findsOne,
      );
      final materialTile = find.byKey(
        WidgetKeys.cartItemProductTile(
          mpBundle.bundle.materials.first.materialNumber.displayMatNo,
        ),
      );
      expect(find.descendant(of: bundleTile, matching: materialTile), findsOne);
      final stockWidget = find.descendant(
        of: materialTile,
        matching: find.byType(StockInfoWidget),
      );
      expect(
        find.descendant(
          of: stockWidget,
          matching: find.textContaining(
            'Batch: NA - Expires: NA',
            findRichText: true,
          ),
        ),
        findsOne,
      );
    });

    testWidgets('check Reference Note character limit',
        (WidgetTester tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTHSalesOrgConfigs,
          salesOrganisation: fakeTHSalesOrganisation,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final referenceNoteKeyFinder =
          find.byKey(WidgetKeys.genericKey(key: 'referenceNoteKey'));
      expect(referenceNoteKeyFinder, findsOneWidget);

      await tester.enterText(referenceNoteKeyFinder, 'a' * 132);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      expect(find.text('a' * 132), findsOneWidget);

      await tester.enterText(referenceNoteKeyFinder, 'a' * 133);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      expect(find.text('a' * 133), findsNothing);
    });
    testWidgets(
      ' -> Stock Info banner visible in checkout',
      (WidgetTester tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            isStockInfoNotAvailable: true,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final stockInfoBanner = find.byKey(WidgetKeys.stockInfoBanner);
        final stockInfoBannerTitle = find.text('Stock status not available:');
        final stockInfoBannerSubTitle = find.text(
          'Please note that stock information is not available at the moment. While you can still place orders, fulfilment will be subjected to available stock levels.',
        );

        expect(stockInfoBanner, findsOneWidget);
        expect(stockInfoBannerTitle, findsOneWidget);
        expect(stockInfoBannerSubTitle, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Stock Info banner not visible in checkout',
      (WidgetTester tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            isStockInfoNotAvailable: false,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final stockInfoBanner = find.byKey(WidgetKeys.stockInfoBanner);
        final stockInfoBannerTitle = find.text('Stock status not available:');
        final stockInfoBannerSubTitle = find.text(
          'Please note that stock information is not available at the moment. While you can still place orders, fulfilment will be subjected to available stock levels.',
        );

        expect(stockInfoBanner, findsNothing);
        expect(stockInfoBannerTitle, findsNothing);
        expect(stockInfoBannerSubTitle, findsNothing);
      },
    );

    group('Tender Contract - ', () {
      testWidgets('Show collapsed Tender Contract Section',
          (WidgetTester tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              tenderContract: fakeTenderContract,
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('123456789'),
                quantity: MaterialQty(1),
                type: MaterialInfoType.material(),
              ),
              salesOrgConfig: fakeVNSalesOrgConfigs,
            ),
          ],
          config: fakeVNSalesOrgConfigs,
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeVNSalesOrganisation,
            salesOrgConfigs: fakeVNSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        final checkOutItems = find.byType(CheckoutMaterialItem);
        final scrollList = find.byKey(WidgetKeys.scrollList);
        await tester.dragUntilVisible(
          checkOutItems,
          scrollList,
          const Offset(0, -450),
        );

        final tenderContractSection =
            find.byType(CartProductTenderContractSection);
        expect(tenderContractSection, findsOneWidget);

        final tenderContractExpansionTile = find.byKey(
          WidgetKeys.tenderExpandableSection,
        );
        expect(tenderContractExpansionTile, findsOneWidget);

        final isExpanded = tester
            .widget<ExpansionTile>(tenderContractExpansionTile)
            .initiallyExpanded;
        expect(isExpanded, isFalse);
      });

      testWidgets('Show expanded Tender Contract Section',
          (WidgetTester tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              tenderContract: fakeTenderContract,
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('123456789'),
                quantity: MaterialQty(1),
                type: MaterialInfoType.material(),
              ),
              salesOrgConfig: fakeVNSalesOrgConfigs,
            ),
          ],
          config: fakeVNSalesOrgConfigs,
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeVNSalesOrganisation,
            salesOrgConfigs: fakeVNSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final checkOutItems = find.byType(CheckoutMaterialItem);
        final scrollList = find.byKey(WidgetKeys.scrollList);
        await tester.dragUntilVisible(
          checkOutItems,
          scrollList,
          const Offset(0, -300),
        );
        await tester.pumpAndSettle();
        final tenderContractSection =
            find.byType(CartProductTenderContractSection);
        expect(tenderContractSection, findsOneWidget);

        final tenderContractExpansionTile = find.byKey(
          WidgetKeys.tenderExpandableSection,
        );
        expect(tenderContractExpansionTile, findsOneWidget);

        final isExpanded = tester
            .widget<ExpansionTile>(tenderContractExpansionTile)
            .initiallyExpanded;
        expect(isExpanded, isFalse);
        if (!isExpanded) {
          await tester.tap(tenderContractExpansionTile);
          await tester.pumpAndSettle(const Duration(seconds: 1));
        }
        await tester.dragUntilVisible(
          checkOutItems,
          scrollList,
          const Offset(0, -100),
        );
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: tenderContractSection,
            matching: find.text('Price'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: tenderContractSection,
            matching: find.text(
              'VND 118,320.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: tenderContractSection,
            matching: find.text('Quantity Available'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: tenderContractSection,
            matching: find.text('10/0'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: tenderContractSection,
            matching: find.text('Expiry Date'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: tenderContractSection,
            matching: find.text('-'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: tenderContractSection,
            matching: find.text('Reference'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: tenderContractSection,
            matching: find.text('fake-Reference'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: tenderContractSection,
            matching: find.text('Material Visa No.'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: tenderContractSection,
            matching: find.text('NA'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: tenderContractSection,
            matching: find.text('Sale District'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: tenderContractSection,
            matching: find.text('fake-SalesDistrict'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: tenderContractSection,
            matching: find.text('Announcement Letter No.'.tr()),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: tenderContractSection,
            matching: find.text('fake-AnnouncementLetterNo'),
          ),
          findsOneWidget,
        );
      });
    });
  });
}
