import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_list_bloc.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/presentation/orders/cart/override/request_counter_offer_bottom_sheet.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../utils/widget_utils.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';

void main() {
  late CartBloc cartBloc;
  late MaterialPriceBloc materialPriceBloc;
  late EligibilityBloc eligibilityBloc;
  late UserBloc userBloc;
  late SalesOrgBloc salesOrgBloc;
  late CustomerCodeBloc customerCodeBloc;
  late Map<MaterialNumber, Price> mockPriceList;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late PriceOverrideBloc priceOverrideBloc;
  late AppRouter autoRouter;
  late OrderSummaryBloc orderSummaryBlocMock;
  late List<PriceAggregate> cartItems;
  late OrderEligibilityBloc orderEligibilityBloc;
  late CustomerLicenseBloc customerLicenseBlocMock;
  late TenderContractListBloc tenderContractListBlocMock;
  final cartPageFinder = find.byKey(WidgetKeys.cartPage);

  setUpAll(() async {
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerFactory(() => AppRouter());
    locator.registerSingleton<PriceOverrideBloc>(PriceOverrideBlocMock());
    priceOverrideBloc = locator.get<PriceOverrideBloc>();
    autoRouter = locator<AppRouter>();
    cartItems = (await CartLocalDataSource().upsertCart())
        .where((e) => e.materialInfo.type.typeMaterial)
        .take(1)
        .toList();
  });

  group('Request Counter Offer Sheet Test', () {
    setUp(
      () {
        WidgetsFlutterBinding.ensureInitialized();
        cartItems = cartItems
            .map(
              (e) => e.copyWith(
                materialInfo: e.materialInfo.copyWith(
                  type: MaterialInfoType('material'),
                ),
              ),
            )
            .toList();
        cartBloc = CartBlocMock();
        materialPriceBloc = MaterialPriceBlocMock();
        salesOrgBloc = SalesOrgBlocMock();
        customerCodeBloc = CustomerCodeBlocMock();
        eligibilityBloc = EligibilityBlocMock();
        userBloc = UserBlocMock();
        customerLicenseBlocMock = CustomerLicenseBlocMock();
        orderEligibilityBloc = OrderEligibilityBlocMock();

        orderSummaryBlocMock = OrderSummaryBlocMock();
        authBlocMock = AuthBlocMock();
        announcementBlocMock = AnnouncementBlocMock();
        tenderContractListBlocMock = TenderContractListBlocMock();

        mockPriceList = {};
        mockPriceList.putIfAbsent(
          MaterialNumber('000000000023168451'),
          () => Price.empty().copyWith(
            finalPrice: MaterialPrice(4.5),
          ),
        );

        when(() => materialPriceBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            isFetching: false,
            materialPrice: mockPriceList,
          ),
        );
        when(() => userBloc.state).thenReturn(UserState.initial());
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(),
        );
        when(() => customerLicenseBlocMock.state)
            .thenReturn(CustomerLicenseState.initial());
        when(() => orderEligibilityBloc.state).thenReturn(
          OrderEligibilityState.initial(),
        );
        when(() => salesOrgBloc.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: fakePHSalesOrgConfigs,
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
          ),
        );
        when(() => userBloc.state).thenReturn(
          UserState.initial()
              .copyWith(user: User.empty().copyWith(hasBonusOverride: false)),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: '1234',
            ),
            user: User.empty().copyWith(hasBonusOverride: false),
          ),
        );
        when(() => priceOverrideBloc.state)
            .thenReturn(PriceOverrideState.initial());

        when(() => cartBloc.state).thenReturn(CartState.initial());

        when(() => announcementBlocMock.state)
            .thenReturn(AnnouncementState.initial());
        when(() => authBlocMock.state).thenReturn(const AuthState.initial());
        when(() => tenderContractListBlocMock.state)
            .thenReturn(TenderContractListState.initial());
      },
    );

    Widget getWidget({required Widget child}) {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouter,
        usingLocalization: true,
        providers: [
          BlocProvider<UserBloc>(create: (context) => userBloc),
          BlocProvider<CartBloc>(create: (context) => cartBloc),
          BlocProvider<MaterialPriceBloc>(
            create: (context) => materialPriceBloc,
          ),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBloc),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBloc,
          ),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
          BlocProvider<OrderEligibilityBloc>(
            create: (context) => orderEligibilityBloc,
          ),
          BlocProvider<PriceOverrideBloc>(
            create: (context) => priceOverrideBloc,
          ),
          BlocProvider<OrderSummaryBloc>(
            create: (context) => orderSummaryBlocMock,
          ),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<CustomerLicenseBloc>(
            create: (context) => customerLicenseBlocMock,
          ),
          BlocProvider<TenderContractListBloc>(
            create: (context) => tenderContractListBlocMock,
          ),
        ],
        child: child,
      );
    }

    testWidgets('Open counter offer sheet from cart', (tester) async {
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          cartProducts: cartItems,
        ),
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(
        getWidget(
          child: const CartPage(),
        ),
      );
      await tester.pump();

      final cartItemFinder = find.byKey(
        WidgetKeys.cartItemProductTile(
          cartItems.first.materialInfo.materialNumber.displayMatNo,
        ),
      );
      final counterOfferPriceButtonFinder =
          find.byKey(WidgetKeys.counterOfferPriceButtonKey);
      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(cartPageFinder, findsOneWidget);
      expect(cartItemFinder, findsNWidgets(1));
      expect(counterOfferPriceButtonFinder.first, findsOneWidget);

      await tester.tap(counterOfferPriceButtonFinder.first);
      await tester.pump();
      expect(counterOfferBottomSheetFinder, findsOneWidget);
    });

    testWidgets('Find and Test Counter Offer Price Field', (tester) async {
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          cartProducts: cartItems,
        ),
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(
        getWidget(
          child: const CartPage(),
        ),
      );
      await tester.pump();

      final cartItemFinder = find.byKey(
        WidgetKeys.cartItemProductTile(
          cartItems.first.materialInfo.materialNumber.displayMatNo,
        ),
      );
      final counterOfferPriceButtonFinder =
          find.byKey(WidgetKeys.counterOfferPriceButtonKey);
      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(cartPageFinder, findsOneWidget);
      expect(cartItemFinder, findsNWidgets(1));
      expect(counterOfferPriceButtonFinder.first, findsOneWidget);

      await tester.tap(counterOfferPriceButtonFinder.first);
      await tester.pump();
      final counterOfferPriceFieldFinder =
          find.byKey(WidgetKeys.counterOfferPriceField);
      final counterOfferDiscountFieldFinder =
          find.byKey(WidgetKeys.counterOfferDiscountField);
      final discountedPriceWidgetFinder =
          find.byKey(WidgetKeys.counterOfferDiscountedPriceWidget);
      final counterOfferRemarksFieldFinder =
          find.byKey(WidgetKeys.counterOfferRemarksField);

      expect(counterOfferBottomSheetFinder, findsOneWidget);
      expect(counterOfferPriceFieldFinder, findsOneWidget);
      expect(counterOfferDiscountFieldFinder, findsNothing);
      expect(discountedPriceWidgetFinder, findsNothing);
      expect(counterOfferRemarksFieldFinder, findsOneWidget);

      await tester.enterText(counterOfferPriceFieldFinder, '100');
      await tester.pump();
      verify(
        () => priceOverrideBloc.add(
          const PriceOverrideEvent.onPriceValueChange(newPrice: '100'),
        ),
      ).called(1);
      await tester.enterText(counterOfferRemarksFieldFinder, 'Comments');
      await tester.pump();

      verify(
        () => priceOverrideBloc.add(
          const PriceOverrideEvent.onRemarksValueChange(newRemarks: 'Comments'),
        ),
      ).called(1);
    });

    testWidgets('Find and Test Counter Offer Discount Field', (tester) async {
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          cartProducts: cartItems,
        ),
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: fakeInternalSalesRepUser,
          salesOrgConfigs: fakePHSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(
        getWidget(
          child: const CartPage(),
        ),
      );
      await tester.pump();

      final cartItemFinder = find.byKey(
        WidgetKeys.cartItemProductTile(
          cartItems.first.materialInfo.materialNumber.displayMatNo,
        ),
      );
      final counterOfferPriceButtonFinder =
          find.byKey(WidgetKeys.counterOfferPriceButtonKey);
      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(cartPageFinder, findsOneWidget);
      expect(cartItemFinder, findsNWidgets(1));
      expect(counterOfferPriceButtonFinder.first, findsOneWidget);

      await tester.tap(counterOfferPriceButtonFinder.first);
      await tester.pump();

      final counterOfferPriceFieldFinder =
          find.byKey(WidgetKeys.counterOfferPriceField);
      final counterOfferDiscountFieldFinder =
          find.byKey(WidgetKeys.counterOfferDiscountField);
      final discountedPriceWidgetFinder =
          find.byKey(WidgetKeys.counterOfferDiscountedPriceWidget);
      final counterOfferRemarksFieldFinder =
          find.byKey(WidgetKeys.counterOfferRemarksField);

      expect(counterOfferBottomSheetFinder, findsOneWidget);
      expect(counterOfferPriceFieldFinder, findsNothing);
      expect(counterOfferDiscountFieldFinder, findsOneWidget);
      expect(discountedPriceWidgetFinder, findsOneWidget);
      expect(counterOfferRemarksFieldFinder, findsOneWidget);

      await tester.enterText(counterOfferDiscountFieldFinder, '10');
      await tester.pump();
      verify(
        () => priceOverrideBloc.add(
          const PriceOverrideEvent.onDiscountValueChanged(newValue: '10'),
        ),
      ).called(1);

      await tester.enterText(counterOfferRemarksFieldFinder, 'Comments');
      await tester.pump();

      verify(
        () => priceOverrideBloc.add(
          const PriceOverrideEvent.onRemarksValueChange(newRemarks: 'Comments'),
        ),
      ).called(1);
    });

    testWidgets(
        'Test Counter Offer Discount Field when enableZDP8Override is false',
        (tester) async {
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          cartProducts: cartItems,
        ),
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
            hasPriceOverride: true,
          ),
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(
        getWidget(child: const CartPage()),
      );
      await tester.pump();

      final counterOfferPriceButtonFinder =
          find.byKey(WidgetKeys.counterOfferPriceButtonKey);
      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(cartPageFinder, findsOneWidget);
      expect(counterOfferPriceButtonFinder.first, findsOneWidget);

      await tester.tap(counterOfferPriceButtonFinder.first);
      await tester.pump();

      final counterOfferDiscountFieldFinder =
          find.byKey(WidgetKeys.counterOfferDiscountField);
      final discountedPriceWidgetFinder =
          find.byKey(WidgetKeys.counterOfferDiscountedPriceWidget);

      expect(counterOfferBottomSheetFinder, findsOneWidget);
      expect(counterOfferDiscountFieldFinder, findsNothing);
      expect(discountedPriceWidgetFinder, findsNothing);
    });

    testWidgets(
        'Test Counter Offer Discount Field when enableZDP8Override is true but user role is not sales_rep',
        (tester) async {
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          cartProducts: cartItems,
        ),
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: fakeRootAdminUser,
          salesOrgConfigs: fakePHSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(
        getWidget(child: const CartPage()),
      );
      await tester.pump();

      final counterOfferPriceButtonFinder =
          find.byKey(WidgetKeys.counterOfferPriceButtonKey);
      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(cartPageFinder, findsOneWidget);
      expect(counterOfferPriceButtonFinder.first, findsOneWidget);

      await tester.tap(counterOfferPriceButtonFinder.first);
      await tester.pump();

      final counterOfferDiscountFieldFinder =
          find.byKey(WidgetKeys.counterOfferDiscountField);
      final discountedPriceWidgetFinder =
          find.byKey(WidgetKeys.counterOfferDiscountedPriceWidget);

      expect(counterOfferBottomSheetFinder, findsOneWidget);
      expect(counterOfferDiscountFieldFinder, findsNothing);
      expect(discountedPriceWidgetFinder, findsNothing);
    });

    testWidgets('Submit Counter Offer Price', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeMYSalesOrganisation,
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: '1234',
          ),
          user: User.empty().copyWith(hasBonusOverride: false),
        ),
      );

      final initialPriceOverrideState = PriceOverrideState.initial();

      final confirmedPriceOverrideState = initialPriceOverrideState.copyWith(
        item: cartItems.first.copyWith(
          materialInfo: cartItems.first.materialInfo.copyWith(
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              counterOfferPrice: CounterOfferValue('100'),
            ),
          ),
          price: Price.empty().copyWith(
            finalPrice: MaterialPrice(100),
            lastPrice: MaterialPrice(200),
          ),
        ),
      );

      final item = confirmedPriceOverrideState.item.copyWith(
        price: Price.empty().copyWith(
          finalPrice: MaterialPrice(100),
          lastPrice: MaterialPrice(200),
        ),
      );

      final expectedPriceOverrideState =
          Stream<PriceOverrideState>.fromIterable([
        confirmedPriceOverrideState.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        confirmedPriceOverrideState.copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: optionOf(Right(item)),
          item: item,
        ),
      ]);

      final expectedCartState = Stream<CartState>.fromIterable([
        CartState.initial().copyWith(
          isUpserting: true,
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          isUpserting: false,
          apiFailureOrSuccessOption: none(),
          cartProducts: [confirmedPriceOverrideState.item],
        ),
      ]);
      whenListen(
        cartBloc,
        expectedCartState,
        initialState: CartState.initial().copyWith(
          isUpserting: false,
          isFetching: false,
          apiFailureOrSuccessOption: none(),
          cartProducts: cartItems,
        ),
      );
      whenListen(
        priceOverrideBloc,
        expectedPriceOverrideState,
        initialState: confirmedPriceOverrideState,
      );
      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItems.first,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);

      expect(counterOfferBottomSheetFinder, findsOneWidget);
      final counterOfferTextFinder = find.text('Request counter offer'.tr());
      expect(counterOfferTextFinder, findsOneWidget);
      final confirmButtonFinder =
          find.byKey(WidgetKeys.counterOfferConfirmButton);

      expect(confirmButtonFinder, findsOneWidget);

      await tester.tap(confirmButtonFinder);
      await tester.pumpAndSettle();

      verify(
        () => priceOverrideBloc.add(
          const PriceOverrideEvent.validateInputFields(),
        ),
      ).called(1);

      verify(
        () => cartBloc.add(
          CartEvent.upsertCart(
            priceAggregate: confirmedPriceOverrideState.item.copyWith(
              quantity: confirmedPriceOverrideState.item.quantity,
            ),
          ),
        ),
      ).called(1);

      verify(
        () => priceOverrideBloc.add(
          PriceOverrideEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: '1234',
            ),
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ),
      ).called(1);

      verify(
        () => cartBloc.add(
          CartEvent.updateCartProductWithCounterOffer(
            overriddenProductPrice: item.price,
          ),
        ),
      ).called(1);
    });

    testWidgets('Submit Counter Offer Discount', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakePHSalesOrgConfigs,
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: '1234',
          ),
          user: User.empty().copyWith(
            hasPriceOverride: true,
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
        ),
      );

      final initialPriceOverrideState = PriceOverrideState.initial();

      final confirmedPriceOverrideState = initialPriceOverrideState.copyWith(
        item: cartItems.first.copyWith(
          materialInfo: cartItems.first.materialInfo.copyWith(
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              discountOverridePercentage: CounterOfferDiscountValue('10'),
            ),
          ),
          price: Price.empty().copyWith(
            finalPrice: MaterialPrice(100),
            lastPrice: MaterialPrice(200),
          ),
        ),
      );

      final item = confirmedPriceOverrideState.item.copyWith(
        price: Price.empty().copyWith(
          finalPrice: MaterialPrice(100),
          lastPrice: MaterialPrice(200),
        ),
      );

      final expectedPriceOverrideState =
          Stream<PriceOverrideState>.fromIterable([
        confirmedPriceOverrideState.copyWith(
          isFetching: true,
        ),
        confirmedPriceOverrideState.copyWith(
          apiFailureOrSuccessOption: optionOf(Right(item)),
          item: item,
        ),
      ]);

      final expectedCartState = Stream<CartState>.fromIterable([
        CartState.initial().copyWith(
          isUpserting: true,
        ),
        CartState.initial().copyWith(
          cartProducts: [confirmedPriceOverrideState.item],
        ),
      ]);
      whenListen(
        cartBloc,
        expectedCartState,
        initialState: CartState.initial().copyWith(
          cartProducts: cartItems,
        ),
      );
      whenListen(
        priceOverrideBloc,
        expectedPriceOverrideState,
        initialState: confirmedPriceOverrideState,
      );

      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItems.first,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);

      expect(counterOfferBottomSheetFinder, findsOneWidget);
      final counterOfferTextFinder = find.text('Request counter offer'.tr());
      expect(counterOfferTextFinder, findsOneWidget);
      final confirmButtonFinder =
          find.byKey(WidgetKeys.counterOfferConfirmButton);

      expect(confirmButtonFinder, findsOneWidget);

      await tester.tap(confirmButtonFinder);
      await tester.pumpAndSettle();

      verify(
        () => priceOverrideBloc.add(
          const PriceOverrideEvent.validateInputFields(),
        ),
      ).called(1);

      verify(
        () => cartBloc.add(
          CartEvent.upsertCart(
            priceAggregate: confirmedPriceOverrideState.item.copyWith(
              quantity: confirmedPriceOverrideState.item.quantity,
            ),
          ),
        ),
      ).called(1);

      verify(
        () => priceOverrideBloc.add(
          PriceOverrideEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: '1234',
            ),
            salesOrganisation: fakePHSalesOrganisation,
          ),
        ),
      ).called(1);

      verify(
        () => cartBloc.add(
          CartEvent.updateCartProductWithCounterOffer(
            overriddenProductPrice: item.price,
          ),
        ),
      ).called(1);
    });

    testWidgets('Test Counter Offer Empty Field Error Message', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            hasPriceOverride: true,
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
          salesOrgConfigs: fakePHSalesOrgConfigs,
        ),
      );

      final initialPriceOverrideState = PriceOverrideState.initial();

      final confirmedPriceOverrideState = initialPriceOverrideState.copyWith(
        item: cartItems.first.copyWith(
          materialInfo: cartItems.first.materialInfo.copyWith(
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              discountOverridePercentage: CounterOfferDiscountValue(''),
              counterOfferPrice: CounterOfferValue(''),
            ),
          ),
          price: Price.empty().copyWith(
            finalPrice: MaterialPrice(100),
            lastPrice: MaterialPrice(200),
          ),
        ),
      );

      final expectedPriceOverrideState =
          Stream<PriceOverrideState>.fromIterable([
        confirmedPriceOverrideState,
        confirmedPriceOverrideState.copyWith(
          showErrorMessages: true,
          item: confirmedPriceOverrideState.item,
        ),
      ]);

      whenListen(
        priceOverrideBloc,
        expectedPriceOverrideState,
        initialState: confirmedPriceOverrideState,
      );
      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItems.first,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);

      expect(counterOfferBottomSheetFinder, findsOneWidget);
      final counterOfferTextFinder = find.text('Request counter offer'.tr());
      expect(counterOfferTextFinder, findsOneWidget);
      final confirmButtonFinder =
          find.byKey(WidgetKeys.counterOfferConfirmButton);

      expect(confirmButtonFinder, findsOneWidget);

      await tester.tap(confirmButtonFinder);
      await tester.pumpAndSettle();

      verify(
        () => priceOverrideBloc.add(
          const PriceOverrideEvent.validateInputFields(),
        ),
      ).called(1);

      final emptyFieldsErrorMessageFinder =
          find.byKey(WidgetKeys.counterOfferEmptyFieldErrorMessage);
      expect(emptyFieldsErrorMessageFinder, findsOneWidget);
    });

    testWidgets('Submit Counter Offer Error While Upserting Failed',
        (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );

      final initialPriceOverrideState = PriceOverrideState.initial();

      final confirmedPriceOverrideState = initialPriceOverrideState.copyWith(
        item: cartItems.first.copyWith(
          materialInfo: cartItems.first.materialInfo.copyWith(
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              counterOfferPrice: CounterOfferValue('100'),
            ),
          ),
          price: Price.empty().copyWith(
            finalPrice: MaterialPrice(100),
            lastPrice: MaterialPrice(200),
          ),
        ),
      );

      final item = confirmedPriceOverrideState.item.copyWith(
        price: Price.empty().copyWith(
          finalPrice: MaterialPrice(100),
          lastPrice: MaterialPrice(200),
        ),
      );

      final expectedPriceOverrideState =
          Stream<PriceOverrideState>.fromIterable([
        confirmedPriceOverrideState.copyWith(
          isFetching: true,
        ),
        confirmedPriceOverrideState.copyWith(
          apiFailureOrSuccessOption: optionOf(Right(item)),
          item: item,
        ),
      ]);

      final expectedCartState = Stream<CartState>.fromIterable([
        CartState.initial().copyWith(
          isUpserting: true,
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error Message'))),
          cartProducts: [confirmedPriceOverrideState.item],
        ),
      ]);
      whenListen(
        cartBloc,
        expectedCartState,
        initialState: CartState.initial().copyWith(
          cartProducts: cartItems,
        ),
      );
      whenListen(
        priceOverrideBloc,
        expectedPriceOverrideState,
        initialState: confirmedPriceOverrideState,
      );
      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItems.first,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);

      expect(counterOfferBottomSheetFinder, findsOneWidget);
      final counterOfferTextFinder = find.text('Request counter offer'.tr());
      expect(counterOfferTextFinder, findsOneWidget);
      final confirmButtonFinder =
          find.byKey(WidgetKeys.counterOfferConfirmButton);

      expect(confirmButtonFinder, findsOneWidget);

      await tester.tap(confirmButtonFinder);
      await tester.pumpAndSettle();

      verify(
        () => priceOverrideBloc.add(
          const PriceOverrideEvent.validateInputFields(),
        ),
      ).called(1);

      verify(
        () => cartBloc.add(
          CartEvent.upsertCart(
            priceAggregate: confirmedPriceOverrideState.item.copyWith(
              quantity: confirmedPriceOverrideState.item.quantity,
            ),
          ),
        ),
      ).called(1);

      final errorSnackBarFinder = find.byType(CustomSnackBar);
      expect(errorSnackBarFinder, findsOneWidget);
    });

    testWidgets('Submit Counter Offer Error While Price Fail', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakePHSalesOrgConfigs,
          salesOrganisation: fakePHSalesOrganisation,
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: '1234',
          ),
          user: User.empty().copyWith(
            hasPriceOverride: true,
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
        ),
      );

      final initialPriceOverrideState = PriceOverrideState.initial();

      final confirmedPriceOverrideState = initialPriceOverrideState.copyWith(
        item: cartItems.first.copyWith(
          materialInfo: cartItems.first.materialInfo.copyWith(
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              discountOverridePercentage: CounterOfferDiscountValue('10'),
            ),
          ),
          price: Price.empty().copyWith(
            finalPrice: MaterialPrice(100),
            lastPrice: MaterialPrice(200),
          ),
        ),
      );

      final expectedCartState = Stream<CartState>.fromIterable([
        CartState.initial().copyWith(
          isUpserting: true,
        ),
        CartState.initial().copyWith(
          cartProducts: [confirmedPriceOverrideState.item],
        ),
      ]);

      final expectedPriceOverrideState =
          Stream<PriceOverrideState>.fromIterable([
        confirmedPriceOverrideState.copyWith(
          isFetching: true,
        ),
        confirmedPriceOverrideState.copyWith(
          showErrorMessages: true,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error Message'))),
        ),
      ]);
      whenListen(
        cartBloc,
        expectedCartState,
        initialState: CartState.initial().copyWith(
          cartProducts: cartItems,
        ),
      );
      whenListen(
        priceOverrideBloc,
        expectedPriceOverrideState,
        initialState: confirmedPriceOverrideState,
      );
      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItems.first,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);

      expect(counterOfferBottomSheetFinder, findsOneWidget);
      final counterOfferTextFinder = find.text('Request counter offer'.tr());
      expect(counterOfferTextFinder, findsOneWidget);
      final confirmButtonFinder =
          find.byKey(WidgetKeys.counterOfferConfirmButton);

      expect(confirmButtonFinder, findsOneWidget);

      await tester.tap(confirmButtonFinder);
      await tester.pumpAndSettle();

      verify(
        () => priceOverrideBloc.add(
          const PriceOverrideEvent.validateInputFields(),
        ),
      ).called(1);

      verify(
        () => cartBloc.add(
          CartEvent.upsertCart(
            priceAggregate: confirmedPriceOverrideState.item.copyWith(
              quantity: confirmedPriceOverrideState.item.quantity,
            ),
          ),
        ),
      ).called(1);

      verify(
        () => priceOverrideBloc.add(
          PriceOverrideEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: '1234',
            ),
            salesOrganisation: fakePHSalesOrganisation,
          ),
        ),
      ).called(1);

      final errorSnackBarFinder = find.byType(CustomSnackBar);
      expect(errorSnackBarFinder, findsOneWidget);
    });

    testWidgets('Test Counter Offer Price Fields Validations', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            hasPriceOverride: true,
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
          salesOrgConfigs: fakePHSalesOrgConfigs,
        ),
      );

      final initialPriceOverrideState = PriceOverrideState.initial().copyWith(
        item: cartItems.first.copyWith(
          materialInfo: cartItems.first.materialInfo.copyWith(
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              discountOverridePercentage: CounterOfferDiscountValue(''),
            ),
          ),
        ),
      );

      when(() => priceOverrideBloc.state).thenReturn(
        initialPriceOverrideState,
      );

      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItems.first,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(counterOfferBottomSheetFinder, findsOneWidget);

      final counterOfferPriceTextFieldFinder =
          find.byKey(WidgetKeys.counterOfferPriceField);
      expect(counterOfferPriceTextFieldFinder, findsOneWidget);

      await tester.enterText(counterOfferPriceTextFieldFinder, '11');
      await tester.pump();

      await tester.enterText(counterOfferPriceTextFieldFinder, '');
      await tester.pump();

      final emptyErrorTextFinder =
          find.text('Please enter counter offer price'.tr());
      expect(emptyErrorTextFinder, findsOneWidget);
    });

    testWidgets('Test Counter Offer Discount Fields Validations',
        (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            hasPriceOverride: true,
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
          salesOrgConfigs: fakePHSalesOrgConfigs,
        ),
      );

      final initialPriceOverrideState = PriceOverrideState.initial().copyWith(
        item: cartItems.first.copyWith(
          materialInfo: cartItems.first.materialInfo.copyWith(
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              discountOverridePercentage: CounterOfferDiscountValue(''),
            ),
          ),
        ),
      );

      when(() => priceOverrideBloc.state).thenReturn(
        initialPriceOverrideState,
      );

      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItems.first,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(counterOfferBottomSheetFinder, findsOneWidget);

      final counterOfferDiscountTextFieldFinder =
          find.byKey(WidgetKeys.counterOfferDiscountField);
      expect(counterOfferDiscountTextFieldFinder, findsOneWidget);

      await tester.enterText(counterOfferDiscountTextFieldFinder, '100');
      await tester.pump();

      final maxValueEnteredErrorTextFinder = find.text(
        'Please input counter offer percentage discount of less than 100%'.tr(),
      );
      expect(maxValueEnteredErrorTextFinder, findsOneWidget);

      await tester.enterText(counterOfferDiscountTextFieldFinder, '');
      await tester.pump();

      final emptyErrorTextFinder =
          find.text('Please enter discount counter offer'.tr());
      expect(emptyErrorTextFinder, findsOneWidget);
    });

    testWidgets('Test Close Counter Offer BottomSheet', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            hasPriceOverride: true,
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
          salesOrgConfigs: fakePHSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItems.first,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(counterOfferBottomSheetFinder, findsOneWidget);

      final counterOfferCancelButton =
          find.byKey(WidgetKeys.counterOfferCancelButton);
      expect(counterOfferCancelButton, findsOneWidget);

      await tester.tap(counterOfferCancelButton);
      expect(autoRouter.current.route.name, 'Root');
    });

    testWidgets(
        'Offer Price Price Displayed Price Not Available for PnG material ',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(700, 1200));

      final cartItem = cartItems.first.copyWith(
        materialInfo: cartItems.first.materialInfo.copyWith(
          hidePrice: true,
          principalData: PrincipalData.empty().copyWith(
            principalName: PrincipalName('Procter And Gamble'),
            principalCode: PrincipalCode('000000105307'),
          ),
        ),
      );

      when(() => priceOverrideBloc.state).thenReturn(
        PriceOverrideState.initial().copyWith(
          item: cartItem,
        ),
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            hasPriceOverride: true,
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
          salesOrgConfigs: fakePHSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItem,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(counterOfferBottomSheetFinder, findsOneWidget);

      final counterOfferPriceWidgetFinder =
          find.byKey(WidgetKeys.counterOfferPriceWidget);
      expect(counterOfferPriceWidgetFinder, findsNothing);

      final counterOfferPriceTextFinder = find.text(
        '${'Offer price'.tr()} : Price Not Available',
        findRichText: true,
      );
      expect(counterOfferPriceTextFinder, findsNothing);
    });

    testWidgets('Check list price for counter offer bottom sheet.',
        (tester) async {
      final cartItem = cartItems.first.copyWith(
        price: cartItems.first.price.copyWith(
          lastPrice: MaterialPrice(20),
          finalPrice: MaterialPrice(10),
          discountedValue: MaterialPrice(10),
        ),
        salesOrgConfig: fakeVNSalesOrgConfigs,
      );
      when(() => priceOverrideBloc.state).thenReturn(
        PriceOverrideState.initial().copyWith(
          item: cartItem,
        ),
      );
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeVNSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItem,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(counterOfferBottomSheetFinder, findsOneWidget);
      final listPriceStrikeThroughComponent =
          find.byKey(WidgetKeys.counterOfferListPriceWidget);
      expect(listPriceStrikeThroughComponent, findsOneWidget);
      expect(
        find.descendant(
          of: listPriceStrikeThroughComponent,
          matching: find.text('List price: VND 20.00', findRichText: true),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Hide Offer price for price Not Available product',
        (tester) async {
      final cartItem = cartItems.first.copyWith(
        materialInfo: cartItems.first.materialInfo.copyWith(
          isFOCMaterial: true,
        ),
        salesOrgConfig: fakeSGSalesOrgConfigs,
      );
      when(() => priceOverrideBloc.state).thenReturn(
        PriceOverrideState.initial().copyWith(
          item: cartItem,
        ),
      );
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItem,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(counterOfferBottomSheetFinder, findsOneWidget);

      final counterOfferPriceWidgetFinder =
          find.byKey(WidgetKeys.counterOfferPriceWidget);
      expect(counterOfferPriceWidgetFinder, findsNothing);
    });

    testWidgets(
        'Show List price without strike for price Not Available product',
        (tester) async {
      final cartItem = cartItems.first.copyWith(
        materialInfo: cartItems.first.materialInfo.copyWith(
          isFOCMaterial: true,
        ),
        salesOrgConfig: fakeSGSalesOrgConfigs,
      );
      when(() => priceOverrideBloc.state).thenReturn(
        PriceOverrideState.initial().copyWith(
          item: cartItem,
        ),
      );
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItem,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferListPriceWithoutStrikeFinder =
          find.byKey(WidgetKeys.counterOfferListPriceWithoutStrikeWidget);
      expect(counterOfferListPriceWithoutStrikeFinder, findsOneWidget);
      expect(
        find.descendant(
          of: counterOfferListPriceWithoutStrikeFinder,
          matching:
              find.text('List price : Price Not Available', findRichText: true),
        ),
        findsOneWidget,
      );
    });
  });
}
