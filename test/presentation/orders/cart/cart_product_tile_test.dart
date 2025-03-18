import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/presentation/core/error_text_with_icon.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/bonus/bonus_items_sheet.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile_widgets/cart_product_tender_contract_section.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late CartBloc cartBloc;
  late MaterialPriceBloc materialPriceBloc;
  late EligibilityBloc eligibilityBloc;
  late PriceAggregate cartItem;
  late OrderEligibilityBloc orderEligibilityBloc;
  late Map<MaterialNumber, Price> mockPriceList;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late PriceOverrideBloc priceOverrideBloc;
  late AppRouter autoRouter;
  late OrderSummaryBloc orderSummaryBlocMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late BonusMaterialBloc bonusMaterialBlocMock;
  late CustomerLicenseBloc customerLicenseBlocMock;
  late TenderContractListBloc tenderContractListBlocMock;
  late List<Price> mockMaterialPriceLocal;

  setUpAll(() async {
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    locator.registerFactory(
      () => bonusMaterialBlocMock,
    );
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerFactory(() => AppRouter());
    autoRouter = locator<AppRouter>();
  });
  setUp(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      additionalDetailsBlocMock = AdditionalDetailsBlocMock();
      cartBloc = CartBlocMock();
      materialPriceBloc = MaterialPriceBlocMock();
      eligibilityBloc = EligibilityBlocMock();
      orderEligibilityBloc = OrderEligibilityBlocMock();
      priceOverrideBloc = PriceOverrideBlocMock();
      orderSummaryBlocMock = OrderSummaryBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      bonusMaterialBlocMock = BonusMaterialBlocMock();
      customerLicenseBlocMock = CustomerLicenseBlocMock();
      tenderContractListBlocMock = TenderContractListBlocMock();

      mockMaterialPriceLocal =
          await MaterialPriceLocalDataSource().getPriceList();
      mockPriceList = {};
      mockPriceList.putIfAbsent(
        MaterialNumber('000000000023168451'),
        () => Price.empty().copyWith(
          finalPrice: MaterialPrice(4.5),
        ),
      );

      cartItem = PriceAggregate.empty().copyWith(
        quantity: 2,
        materialInfo: MaterialInfo.empty().copyWith(
          type: MaterialInfoType('material'),
          materialNumber: MaterialNumber('000000000023168451'),
          materialDescription: ' Triglyceride Mosys D',
          principalData: PrincipalData.empty().copyWith(
            principalName: PrincipalName('台灣拜耳股份有限公司'),
          ),
          quantity: MaterialQty(2),
        ),
      );

      when(() => materialPriceBloc.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          materialPrice: mockPriceList,
        ),
      );
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());

      when(() => orderSummaryBlocMock.state).thenReturn(
        OrderSummaryState.initial().copyWith(),
      );
      when(() => orderEligibilityBloc.state).thenReturn(
        OrderEligibilityState.initial(),
      );
      when(() => priceOverrideBloc.state)
          .thenReturn(PriceOverrideState.initial());
      when(() => additionalDetailsBlocMock.state)
          .thenReturn(AdditionalDetailsState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => customerLicenseBlocMock.state)
          .thenReturn(CustomerLicenseState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => bonusMaterialBlocMock.state)
          .thenReturn(BonusMaterialState.initial());
      when(() => tenderContractListBlocMock.state)
          .thenReturn(TenderContractListState.initial());
    },
  );
  group(
    'Test Cart_Page',
    () {
      Widget getWidget() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouter,
          useMediaQuery: false,
          usingLocalization: true,
          providers: [
            BlocProvider<CartBloc>(create: (context) => cartBloc),
            BlocProvider<MaterialPriceBloc>(
              create: (context) => materialPriceBloc,
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
            BlocProvider<AdditionalDetailsBloc>(
              create: (context) => additionalDetailsBlocMock,
            ),
            BlocProvider<CustomerLicenseBloc>(
              create: (context) => customerLicenseBlocMock,
            ),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock,
            ),
            BlocProvider<TenderContractListBloc>(
              create: (context) => tenderContractListBlocMock,
            ),
          ],
          child: const CartPage(),
        );
      }

      testWidgets(
          'Bonus sample item button visible when priceOverride from config is true',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              cartItem.copyWith(
                price: Price.empty().copyWith(
                  additionalBonusEligible: true,
                ),
              ),
            ],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeKHSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();

        final bonusSampleItemButton =
            find.byKey(WidgetKeys.bonusSampleItemButtonKey);
        expect(bonusSampleItemButton, findsOneWidget);
      });

      testWidgets(
          'Bonus sample item button not visible when priceOverride from config is false',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItem],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bonusSampleItemButton =
            find.byKey(WidgetKeys.bonusSampleItemButtonKey);
        expect(bonusSampleItemButton, findsNothing);
      });

      testWidgets(
          'Bonus sample item with 0.00 price value and no bonus tag when material is bonus deal for ID Market',
          (tester) async {
        const materialNumber = '23168451';
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              cartItem.copyWith(
                bonusSampleItems: [
                  BonusSampleItem.empty().copyWith(
                    materialNumber: MaterialNumber(materialNumber),
                    qty: MaterialQty(1),
                  ),
                ],
              ),
            ],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bonusSampleItem = find.byKey(
          WidgetKeys.cartItemBonus(materialNumber, materialNumber),
        );
        expect(bonusSampleItem, findsOneWidget);
        expect(
          find.descendant(of: bonusSampleItem, matching: find.text('Bonus')),
          findsNothing,
        );
        expect(
          find.descendant(of: bonusSampleItem, matching: find.text('FREE')),
          findsNothing,
        );
        final price = find.byWidgetPredicate(
          (widget) =>
              widget is RichText &&
              widget.key == WidgetKeys.priceComponent &&
              widget.text.toPlainText().contains('0'),
        );
        expect(
          find.descendant(of: bonusSampleItem, matching: price),
          findsOneWidget,
        );
      });

      testWidgets(
          'Bonus sample item button visible when user is a sales rep user and has bonus override',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              cartItem.copyWith(
                price: Price.empty().copyWith(
                  additionalBonusEligible: true,
                ),
              ),
            ],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: User.empty().copyWith(
              role: Role.empty().copyWith(
                type: RoleType('internal_sales_rep'),
              ),
              hasBonusOverride: true,
            ),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bonusSampleItemButton =
            find.byKey(WidgetKeys.bonusSampleItemButtonKey);
        expect(bonusSampleItemButton, findsOneWidget);
      });

      testWidgets(
          'Bonus sample item button not visible when user is a sales rep user and does not have bonus override',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItem],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: User.empty().copyWith(
              role: Role.empty().copyWith(
                type: RoleType('internal_sales_rep'),
              ),
              hasBonusOverride: false,
            ),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bonusSampleItemButton =
            find.byKey(WidgetKeys.bonusSampleItemButtonKey);
        expect(bonusSampleItemButton, findsNothing);
      });

      testWidgets('Counter offer button not visible for special order type',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItem],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            user: User.empty().copyWith(
              role: Role.empty().copyWith(
                type: RoleType('internal_sales_rep'),
              ),
              hasPriceOverride: true,
              selectedOrderType: DocumentType('zpfc'),
            ),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final counterOfferButton =
            find.byKey(WidgetKeys.counterOfferPriceButtonKey);
        expect(counterOfferButton, findsNothing);
      });

      testWidgets('Counter offer button visible for regular orders',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItem],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            user: User.empty().copyWith(
              role: Role.empty().copyWith(
                type: RoleType('internal_sales_rep'),
              ),
              hasPriceOverride: true,
              selectedOrderType: DocumentType('ZPOR'),
            ),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final counterOfferButton =
            find.byKey(WidgetKeys.counterOfferPriceButtonKey);
        expect(counterOfferButton, findsOneWidget);
        await tester.tap(counterOfferButton);
      });

      testWidgets(
          'Counter offer button visible for MY External sales rep having PnG material(Hide Price ----> true)',
          (tester) async {
        final pnGCartItem = cartItem.copyWith(
          quantity: 2,
          price: Price.empty().copyWith(
            finalPrice: MaterialPrice(364.80),
            lastPrice: MaterialPrice(364.80),
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            type: MaterialInfoType('material'),
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('Procter And Gamble'),
              principalCode: PrincipalCode('000000105307'),
            ),
            hidePrice: true,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [pnGCartItem],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeSGSalesOrganisation,
            salesOrgConfigs: fakeSGSalesOrgConfigs,
            user: User.empty().copyWith(
              role: Role.empty().copyWith(
                type: RoleType('external_sales_rep'),
              ),
              hasPriceOverride: true,
            ),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final counterOfferButton =
            find.byKey(WidgetKeys.counterOfferPriceButtonKey);
        expect(counterOfferButton, findsOneWidget);
      });

      testWidgets(
          'Bonus Price Counter Section for MY External sales rep having PnG material(Hide Price ----> false)',
          (tester) async {
        final pnGCartItem = cartItem.copyWith(
          quantity: 2,
          price: Price.empty().copyWith(
            finalPrice: MaterialPrice(364.80),
            lastPrice: MaterialPrice(364.80),
            additionalBonusEligible: true,
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            type: MaterialInfoType('material'),
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('Procter And Gamble'),
              principalCode: PrincipalCode('000000105307'),
            ),
            hidePrice: false,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [pnGCartItem],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeSGSalesOrganisation,
            salesOrgConfigs: fakeSGSalesOrgConfigs,
            user: User.empty().copyWith(
              role: Role.empty().copyWith(
                type: RoleType('external_sales_rep'),
              ),
              hasBonusOverride: true,
              hasPriceOverride: true,
              selectedOrderType: DocumentType('ZPOR'),
            ),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bonusSampleItemButtonKey =
            find.byKey(WidgetKeys.bonusSampleItemButtonKey);
        expect(bonusSampleItemButtonKey, findsOneWidget);
        await tester.tap(bonusSampleItemButtonKey);
        await tester.pump();
        expect(find.byType(BonusItemsSheet), findsOneWidget);
      });

      testWidgets('Display CutOff List Price', (tester) async {
        final pnGCartItem = cartItem.copyWith(
          quantity: 2,
          price: Price.empty().copyWith(
            isPriceOverride: true,
            finalPrice: MaterialPrice(364.80),
            lastPrice: MaterialPrice(364.80),
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            type: MaterialInfoType('material'),
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [pnGCartItem],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final materialKey =
            find.byKey(WidgetKeys.cartItemProductMaterialNumber);
        expect(materialKey, findsOneWidget);
        final cartItemCutOffListPriceKey =
            find.byKey(WidgetKeys.cartItemCutOffListPrice);
        expect(cartItemCutOffListPriceKey, findsOneWidget);
      });

      testWidgets('Do not display CutOff List Price while in ID',
          (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItem],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final materialKey =
            find.byKey(WidgetKeys.cartItemProductMaterialNumber);
        expect(materialKey, findsOneWidget);
        final cartItemCutOffListPriceKey =
            find.byKey(WidgetKeys.cartItemCutOffListPrice);
        expect(cartItemCutOffListPriceKey, findsNothing);
      });

      testWidgets('Counter offer Requested', (tester) async {
        final pnGCartItem = cartItem.copyWith(
          quantity: 2,
          price: Price.empty().copyWith(
            isPriceOverride: true,
            finalPrice: MaterialPrice(364.80),
            lastPrice: MaterialPrice(364.80),
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            type: MaterialInfoType('material'),
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [pnGCartItem],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final materialKey =
            find.byKey(WidgetKeys.cartItemProductMaterialNumber);
        expect(materialKey, findsOneWidget);
        final requestedCounterOfferKey =
            find.text('Requested counter offer'.tr());
        expect(requestedCounterOfferKey, findsOneWidget);
      });

      testWidgets('Show Stock Error', (tester) async {
        final cartItemWithStock = cartItem.copyWith(
          salesOrgConfig: fakeIDSalesOrgConfigs,
          quantity: 2,
          stockInfoList: [
            StockInfo.empty().copyWith(
              materialNumber: cartItem.materialInfo.materialNumber,
              stockQuantity: 1,
            ),
          ],
        );

        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItemWithStock],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final materialKey =
            find.byKey(WidgetKeys.cartItemProductMaterialNumber);
        expect(materialKey, findsOneWidget);
        final stockAvailableKey = find.textContaining('Remaining stock'.tr());
        expect(stockAvailableKey, findsOneWidget);
      });

      testWidgets('cart Item Quantity Input test', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItem],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final materialKey =
            find.byKey(WidgetKeys.cartItemProductMaterialNumber);
        expect(materialKey, findsOneWidget);
        final cartItemQuantityInputKey = find.byType(CartItemQuantityInput);
        expect(cartItemQuantityInputKey, findsOneWidget);
        final cartItemAddKey = find.byKey(WidgetKeys.increaseQuantityKey);
        expect(cartItemAddKey, findsOneWidget);
        final cartItemDeleteKey = find.byKey(WidgetKeys.decreaseQuantityKey);
        expect(cartItemDeleteKey, findsOneWidget);
        final quantityInputTextKey =
            find.byKey(WidgetKeys.quantityInputTextKey);
        expect(quantityInputTextKey, findsOneWidget);
        await tester.tap(cartItemAddKey);
        await tester.pump();
        verify(
          () => cartBloc.add(
            CartEvent.upsertCart(
              priceAggregate: cartItem.copyWith(
                quantity: 3,
              ),
            ),
          ),
        ).called(1);
        await tester.tap(cartItemDeleteKey);
        await tester.pump();
        verify(
          () => cartBloc.add(
            CartEvent.upsertCart(
              priceAggregate: cartItem.copyWith(
                quantity: 2,
              ),
            ),
          ),
        ).called(1);
        await tester.enterText(quantityInputTextKey, '2');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        verify(
          () => cartBloc.add(
            CartEvent.upsertCart(
              priceAggregate: cartItem.copyWith(
                quantity: 2,
              ),
            ),
          ),
        ).called(1);
      });

      testWidgets('cart Item Quantity change and update after 1.5 second',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItem],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final materialKey =
            find.byKey(WidgetKeys.cartItemProductMaterialNumber);
        expect(materialKey, findsOneWidget);
        final cartItemQuantityInputKey = find.byType(CartItemQuantityInput);
        expect(cartItemQuantityInputKey, findsOneWidget);
        final cartItemAddKey = find.byKey(WidgetKeys.increaseQuantityKey);
        expect(cartItemAddKey, findsOneWidget);
        final cartItemDeleteKey = find.byKey(WidgetKeys.decreaseQuantityKey);
        expect(cartItemDeleteKey, findsOneWidget);
        final quantityInputTextKey =
            find.byKey(WidgetKeys.quantityInputTextKey);
        expect(quantityInputTextKey, findsOneWidget);
        await tester.tap(cartItemAddKey);
        await tester.pump();
        verify(
          () => cartBloc.add(
            CartEvent.upsertCart(
              priceAggregate: cartItem.copyWith(
                quantity: 3,
              ),
            ),
          ),
        ).called(1);
        await tester.enterText(quantityInputTextKey, '2');
        await tester.pump(const Duration(seconds: 2, microseconds: 700));
        verify(
          () => cartBloc.add(
            CartEvent.upsertCart(
              priceAggregate: cartItem.copyWith(
                quantity: 2,
              ),
            ),
          ),
        ).called(1);
      });

      testWidgets('Should have offer label widget', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItem],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final material = find.byKey(
          WidgetKeys.cartItemProductTile(
            cartItem.getMaterialNumber.displayMatNo,
          ),
        );
        expect(material, findsOneWidget);
        expect(
          find.descendant(of: material, matching: find.byType(OfferLabel)),
          findsOneWidget,
        );
      });

      testWidgets(
          'Bonus sample item button not visible when AdditionalBonusEligible is false',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              cartItem.copyWith(
                price: Price.empty().copyWith(
                  additionalBonusEligible: false,
                ),
              ),
            ],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bonusSampleItemButton =
            find.byKey(WidgetKeys.bonusSampleItemButtonKey);
        expect(bonusSampleItemButton, findsNothing);
      });

      testWidgets(
          'Bonus sample item button not visible when user is a sales rep user and AdditionalBonusEligible is false',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              cartItem.copyWith(
                price: Price.empty().copyWith(
                  additionalBonusEligible: false,
                ),
              ),
            ],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: User.empty().copyWith(
              role: Role.empty().copyWith(
                type: RoleType('internal_sales_rep'),
              ),
              hasBonusOverride: true,
            ),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bonusSampleItemButton =
            find.byKey(WidgetKeys.bonusSampleItemButtonKey);
        expect(bonusSampleItemButton, findsNothing);
      });

      testWidgets(
          'Bonus sample item button visible when AdditionalBonusEligible is false and NetPriceOverride is true',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              cartItem.copyWith(
                salesOrgConfig: fakeSGSalesOrgConfigs,
              ),
            ],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bonusSampleItemButton =
            find.byKey(WidgetKeys.bonusSampleItemButtonKey);
        expect(bonusSampleItemButton, findsOneWidget);
      });

      testWidgets('Counter offer Requested for png material', (tester) async {
        final pnGCartItem = cartItem.copyWith(
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

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final materialKey =
            find.byKey(WidgetKeys.cartItemProductMaterialNumber);
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

      testWidgets(
          'Marketplace material display seller instead of manufacturer and hide bonus/price override section',
          (tester) async {
        final mpMaterial = cartItem.copyWith.materialInfo(isMarketPlace: true);
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(cartProducts: [mpMaterial]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        final mpSection = find.byKey(WidgetKeys.cartMPProductSection);
        expect(mpSection, findsOneWidget);
        expect(
          find.descendant(
            of: mpSection,
            matching: find.byKey(WidgetKeys.marketplaceSellerIcon),
          ),
          findsOneWidget,
        );
        final material = find.descendant(
          of: mpSection,
          matching: find.byKey(
            WidgetKeys.cartItemProductTile(
              cartItem.getMaterialNumber.displayMatNo,
            ),
          ),
        );
        expect(material, findsOneWidget);
        expect(
          find.descendant(
            of: material,
            matching: find.byKey(WidgetKeys.bonusPriceOverrideSection),
          ),
          findsNothing,
        );
      });

      testWidgets(
          'Marketplace material show Material Suspended when salesOrg turn off marketplace',
          (tester) async {
        final mpMaterial = cartItem.copyWith.materialInfo(isMarketPlace: true);
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              mpMaterial.copyWith(
                salesOrgConfig: fakeSGSalesOrgConfigs,
              ),
            ],
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final material = find.byKey(
          WidgetKeys.cartItemProductTile(
            cartItem.getMaterialNumber.displayMatNo,
          ),
        );

        expect(material, findsOneWidget);
        expect(
          find.descendant(
            of: material,
            matching: find.descendant(
              of: find.byType(ErrorTextWithIcon),
              matching: find.text('Material Suspended'),
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
        'Do not Show tax details on material level when price is zero and displayItemTaxBreakdown is enable',
        (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: <PriceAggregate>[
                cartItem.copyWith(
                  salesOrgConfig: fakeIDSalesOrgConfigs,
                ),
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123456789'),
                    quantity: MaterialQty(1),
                    taxClassification:
                        MaterialTaxClassification('Product : Full Tax'),
                    tax: 10,
                  ),
                  price: Price.empty().copyWith(
                    lastPrice: MaterialPrice(0.00),
                  ),
                ),
              ],
            ),
          );

          await tester.pumpWidget(getWidget());

          await tester.pump();

          final taxLevelFinder = find.text('Total with tax:');
          expect(taxLevelFinder, findsNothing);
        },
      );

      testWidgets(
        'Show promotion in cart item for id market if promotion is not empty',
        (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: <PriceAggregate>[
                cartItem.copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('21038302'),
                    quantity: MaterialQty(1),
                  ),
                  price: mockMaterialPriceLocal.elementAt(1),
                  salesOrgConfig: fakeIDSalesOrgConfigs,
                ),
              ],
            ),
          );

          await tester.pumpWidget(getWidget());

          await tester.pumpAndSettle();

          final promotionFinder =
              find.byKey(WidgetKeys.cartPromotions('21038302'));
          expect(promotionFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Hide promotion in cart item for id market if promotion is empty',
        (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: <PriceAggregate>[
                cartItem.copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('21038305'),
                    quantity: MaterialQty(1),
                  ),
                  price: mockMaterialPriceLocal.first,
                  salesOrgConfig: fakeIDSalesOrgConfigs,
                ),
              ],
            ),
          );

          await tester.pumpWidget(getWidget());

          await tester.pumpAndSettle();

          final promotionFinder =
              find.byKey(WidgetKeys.cartPromotions('21038305'));
          expect(promotionFinder, findsNothing);
        },
      );

      testWidgets(
          'Show Counter offer price when price has isValid false and isPriceOverride is true',
          (tester) async {
        const finalPrice = 500.00;

        final cartItems = cartItem.copyWith(
          quantity: 2,
          price: Price.empty().copyWith(
            isPriceOverride: true,
            isValid: false,
            finalPrice: MaterialPrice(finalPrice),
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItems],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final priceNotAvailableFinder = find.descendant(
          of: find.byKey(WidgetKeys.cartItemProductUnitPrice),
          matching: find.text(
            'SGD ${finalPrice.toStringAsFixed(2)}',
            findRichText: true,
          ),
        );
        expect(priceNotAvailableFinder, findsOneWidget);
      });

      testWidgets('Counter offer button not visible for covid material',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItem.copyWith(isCovid: true)],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final counterOfferButton =
            find.byKey(WidgetKeys.counterOfferPriceButtonKey);
        expect(counterOfferButton, findsNothing);
      });

      testWidgets('Bonus override button not visible for covid material',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(
                quantity: 2,
                materialInfo: MaterialInfo.empty().copyWith(
                  type: MaterialInfoType('material'),
                  materialNumber: MaterialNumber('000000000023168451'),
                  materialDescription: ' Triglyceride Mosys D',
                  principalData: PrincipalData.empty().copyWith(
                    principalName: PrincipalName('台灣拜耳股份有限公司'),
                  ),
                  quantity: MaterialQty(2),
                  hidePrice: false,
                  isFOCMaterial: false,
                ),
                price: Price.empty().copyWith(
                  additionalBonusEligible: true,
                ),
                isCovid: true,
              ),
            ],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
            user: fakeExternalSalesRepUser.copyWith(
              selectedOrderType: DocumentType('ZPOR'),
            ),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bonusOverrideButton =
            find.byKey(WidgetKeys.bonusSampleItemButtonKey);
        expect(bonusOverrideButton, findsNothing);
      });

      testWidgets(
        'Round down tax value for ID market',
        (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: <PriceAggregate>[
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123456789'),
                    quantity: MaterialQty(1),
                    taxClassification:
                        MaterialTaxClassification('Product : Full Tax'),
                    tax: 11,
                    hidePrice: false,
                    isFOCMaterial: false,
                  ),
                  price: Price.empty().copyWith(
                    lastPrice: MaterialPrice(180880),
                    finalPrice: MaterialPrice(180880),
                  ),
                  salesOrgConfig: fakeIDSalesOrgConfigs.copyWith(
                    vatValue: 11,
                  ),
                ),
              ],
            ),
          );

          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeIDSalesOrgConfigs.copyWith(
                vatValue: 11,
              ),
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();

          final taxValueFinder = find.text('IDR 19,896', findRichText: true);
          expect(taxValueFinder, findsOneWidget);

          final itemPriceWithTaxFinder =
              find.text('IDR 200,776', findRichText: true);
          expect(itemPriceWithTaxFinder, findsOneWidget);
        },
      );

      testWidgets(
          'Show cutoff List price as Price Not Available when list price is zero and counter offer price is applied',
          (tester) async {
        final cartItems = cartItem.copyWith(
          quantity: 2,
          price: Price.empty().copyWith(
            isPriceOverride: true,
            finalPrice: MaterialPrice(10.00),
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            type: MaterialInfoType('material'),
            hidePrice: false,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItems],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final cartItemCutOffListPriceKey =
            find.byKey(WidgetKeys.cartItemCutOffListPrice);
        expect(cartItemCutOffListPriceKey, findsOneWidget);

        final priceNotAvailableFinder = find.descendant(
          of: cartItemCutOffListPriceKey,
          matching: find.text('Price Not Available', findRichText: true),
        );
        expect(priceNotAvailableFinder, findsOneWidget);
      });

      testWidgets('Show IRN when enableIRN is true', (tester) async {
        const iRNNumber = '12C 234/11';

        final cartItems = cartItem.copyWith(
          materialInfo: MaterialInfo.empty().copyWith(
            type: MaterialInfoType('material'),
            itemRegistrationNumber: ItemRegistrationNumber(iRNNumber),
          ),
        );

        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItems],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
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
      });

      testWidgets('Do not show IRN when enableIRN is false', (tester) async {
        const iRNNumber = '12C 234/11';

        final cartItems = cartItem.copyWith(
          materialInfo: MaterialInfo.empty().copyWith(
            type: MaterialInfoType('material'),
            itemRegistrationNumber: ItemRegistrationNumber(iRNNumber),
          ),
        );

        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItems],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
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
      });

      group('Tender Contract - ', () {
        testWidgets('Show message Tender Contract is no longer available',
            (tester) async {
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );

          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: [
                cartItem.copyWith(
                  salesOrgConfig: fakeVNSalesOrgConfigs,
                  tenderContract: TenderContract.empty().copyWith(
                    tenderOrderReason: TenderContractReason('730'),
                    contractNumber: TenderContractNumber(
                      'fake-Number',
                    ),
                    tenderPrice: 11832000.0,
                    contractReference: StringValue('fake-Reference'),
                    isTenderExpired: true,
                  ),
                ),
              ],
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();

          final errorText = find.byType(ErrorTextWithIcon);
          expect(errorText, findsOneWidget);
          expect(
            find.text('Tender Contract is no longer available.'),
            findsOneWidget,
          );
        });

        testWidgets('Show message Maximum tender qty', (tester) async {
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );

          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: [
                cartItem.copyWith(
                  salesOrgConfig: fakeVNSalesOrgConfigs,
                  tenderContract: TenderContract.empty().copyWith(
                    tenderOrderReason: TenderContractReason('730'),
                    contractNumber: TenderContractNumber(
                      'fake-Number',
                    ),
                    tenderPrice: 11832000.0,
                    contractReference: StringValue('fake-Reference'),
                    remainingTenderQuantity: 1,
                  ),
                  quantity: 10,
                ),
              ],
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();

          final errorText = find.byType(ErrorTextWithIcon);
          expect(errorText, findsOneWidget);
          expect(
            find.textContaining('Maximum tender qty'),
            findsOneWidget,
          );
        });

        testWidgets('Tender Contract Section is Expanded ', (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: [
                cartItem.copyWith(
                  tenderContract: TenderContract.empty().copyWith(
                    tenderOrderReason: TenderContractReason('730'),
                    contractNumber: TenderContractNumber(
                      'fake-Number',
                    ),
                    tenderPrice: 11832000.0,
                    tenderUnitPrice: 118320.0,
                    pricingUnit: 100,
                    contractReference: StringValue('fake-Reference'),
                    salesDistrict: StringValue('fake-SalesDistrict'),
                    announcementLetterNumber: TenderContractNumber(
                      'fake-AnnouncementLetterNumber',
                    ),
                  ),
                ),
              ],
            ),
          );

          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();

          final tenderContractSection =
              find.byType(CartProductTenderContractSection);
          expect(tenderContractSection, findsOneWidget);
          final tenderContractExpansion =
              find.byKey(WidgetKeys.tenderExpandableSection);
          expect(
            tenderContractExpansion,
            findsOneWidget,
          );
          await tester.tap(tenderContractExpansion);
          await tester.pumpAndSettle(const Duration(seconds: 1));

          await tester.dragUntilVisible(
            tenderContractSection,
            find.byKey(WidgetKeys.scrollList),
            const Offset(0.0, -200),
          );
          await tester.pumpAndSettle();

          expect(
            find.descendant(
              of: tenderContractSection,
              matching: find.text('Price'.tr()),
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
              matching: find.text('0/0'),
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
              matching: find.text('Material Visa No.'.tr()),
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
              matching: find.text('Sale District'.tr()),
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
              matching: find.text('fake-AnnouncementLetterNumber'),
            ),
            findsOneWidget,
          );
        });

        testWidgets('Do not display List price strike through for tender order',
            (tester) async {
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: [
                cartItem.copyWith(
                  salesOrgConfig: fakeVNSalesOrgConfigs,
                  tenderContract: TenderContract.empty().copyWith(
                    tenderOrderReason: TenderContractReason('730'),
                    contractNumber: TenderContractNumber(
                      'fake-Number',
                    ),
                    tenderPrice: 11832000.0,
                    contractReference: StringValue('fake-Reference'),
                  ),
                  price: Price.empty().copyWith(
                    finalPrice: MaterialPrice(11832000),
                    lastPrice: MaterialPrice(11833000),
                  ),
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final cartItemCutOffListPrice =
              find.byKey(WidgetKeys.cartItemCutOffListPrice);
          expect(cartItemCutOffListPrice, findsNothing);
        });
        testWidgets(
            'Display Tender tag and offer tag if material has offer and ordered with tender',
            (tester) async {
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: [
                cartItem.copyWith(
                  salesOrgConfig: fakeVNSalesOrgConfigs,
                  tenderContract: TenderContract.empty().copyWith(
                    tenderOrderReason: TenderContractReason('730'),
                    contractNumber: TenderContractNumber(
                      'fake-Number',
                    ),
                    tenderPrice: 11832000.0,
                    contractReference: StringValue('fake-Reference'),
                  ),
                  price: Price.empty().copyWith(
                    finalPrice: MaterialPrice(11832000),
                    lastPrice: MaterialPrice(11833000),
                  ),
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final offerTag = find.byKey(WidgetKeys.offerTag);
          expect(offerTag, findsOneWidget);
          final tenderTag = find.byKey(WidgetKeys.tenderTagForProductTile);
          expect(tenderTag, findsOneWidget);
        });

        testWidgets('Display Tender tag if material is ordered with tender',
            (tester) async {
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: [
                cartItem.copyWith(
                  salesOrgConfig: fakeVNSalesOrgConfigs,
                  tenderContract: TenderContract.empty().copyWith(
                    contractNumber: TenderContractNumber(
                      'fake-Number',
                    ),
                  ),
                ),
              ],
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final tenderTag = find.byKey(WidgetKeys.tenderTagForProductTile);
          expect(tenderTag, findsOneWidget);
        });
      });
    },
  );
}
