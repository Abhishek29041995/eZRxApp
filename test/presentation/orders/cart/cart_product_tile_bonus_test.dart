import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile_bonus.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late CartBloc cartBloc;
  late MaterialPriceBloc materialPriceBloc;
  late EligibilityBloc eligibilityBloc;
  late CustomerLicenseBloc customerLicenseBlocMock;
  late UserBloc userBloc;
  late PriceAggregate cartItem;
  late SalesOrgBloc salesOrgBloc;
  late CustomerCodeBloc customerCodeBloc;
  late OrderEligibilityBloc orderEligibilityBloc;
  late TenderContractListBloc tenderContractListBlocMock;
  late Map<MaterialNumber, Price> mockPriceList;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late PriceOverrideBloc priceOverrideBloc;
  late AppRouter autoRouter;
  late OrderSummaryBloc orderSummaryBlocMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late BonusMaterialBloc bonusMaterialBlocMock;

  setUpAll(() async {
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerFactory(() => AppRouter());
    autoRouter = locator<AppRouter>();
    WidgetsFlutterBinding.ensureInitialized();
    additionalDetailsBlocMock = AdditionalDetailsBlocMock();
    cartBloc = CartBlocMock();
    customerLicenseBlocMock = CustomerLicenseBlocMock();
    materialPriceBloc = MaterialPriceBlocMock();
    salesOrgBloc = SalesOrgBlocMock();
    customerCodeBloc = CustomerCodeBlocMock();
    eligibilityBloc = EligibilityBlocMock();
    userBloc = UserBlocMock();
    orderEligibilityBloc = OrderEligibilityBlocMock();
    priceOverrideBloc = PriceOverrideBlocMock();
    orderSummaryBlocMock = OrderSummaryBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    bonusMaterialBlocMock = BonusMaterialBlocMock();
    tenderContractListBlocMock = TenderContractListBlocMock();

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
      bonusSampleItems: [
        BonusSampleItem.empty().copyWith(
          qty: MaterialQty(1),
          materialNumber: MaterialNumber('12345'),
        ),
      ],
    );
  });
  setUp(
    () {
      when(() => materialPriceBloc.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          materialPrice: mockPriceList,
        ),
      );
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
      when(() => userBloc.state).thenReturn(UserState.initial());
      when(() => orderSummaryBlocMock.state).thenReturn(
        OrderSummaryState.initial().copyWith(),
      );
      when(() => customerLicenseBlocMock.state)
          .thenReturn(CustomerLicenseState.initial());
      when(() => salesOrgBloc.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: fakeSGSalesOrgConfigs,
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2601'),
          ),
        ),
      );
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: '1234',
          ),
        ),
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
            BlocProvider<CustomerLicenseBloc>(
              create: (context) => customerLicenseBlocMock,
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
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock,
            ),
            BlocProvider<BonusMaterialBloc>(
              create: (context) => bonusMaterialBlocMock,
            ),
            BlocProvider<TenderContractListBloc>(
              create: (context) => tenderContractListBlocMock,
            ),
          ],
          child: const CartPage(),
        );
      }

      testWidgets('Bonus sample item test', (tester) async {
        await tester.binding.setSurfaceSize(const Size(600, 900));
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

        final accountSuspendedBanner = find.byType(
          CartProductTile,
        );
        expect(accountSuspendedBanner, findsOneWidget);
        await tester.drag(accountSuspendedBanner, const Offset(0, -500));
        await tester.pump();
        final bonusSampleItemButton = find.byKey(
          WidgetKeys.cartItemBonus(
            cartItem.materialInfo.materialNumber.displayMatNo,
            cartItem.bonusSampleItems.first.materialNumber.displayMatNo,
          ),
        );
        expect(bonusSampleItemButton, findsOneWidget);
        final customSlidableAction = find.byKey(
          WidgetKeys.cartItemSwipeDeleteButtonForBonus,
        );
        await tester.dragUntilVisible(
          customSlidableAction,
          bonusSampleItemButton,
          const Offset(-1000, 0),
        );
        await tester.pump();
        expect(customSlidableAction, findsOneWidget);
        await tester.tap(customSlidableAction);
        await tester.pump();
        verify(
          () => cartBloc.add(
            CartEvent.addBonusToCartItem(
              bonusMaterial: MaterialInfo.empty().copyWith(
                materialNumber: cartItem.bonusSampleItems.first.materialNumber,
                parentID:
                    cartItem.materialInfo.materialNumber.getOrDefaultValue(''),
                quantity: MaterialQty(0),
              ),
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              bonusItemId: cartItem.bonusSampleItems.first.itemId,
            ),
          ),
        ).called(1);
      });

      testWidgets('cart Bonus Item Quantity Input test', (tester) async {
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
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              cartItem.copyWith(
                bonusSampleItems: cartItem.bonusSampleItems
                    .map(
                      (e) => e.copyWith(
                        stockInfo: StockInfo.empty().copyWith(
                          inStock: MaterialInStock('Yes'),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(
          find.descendant(
            of: find.byType(CartProductTileBonus),
            matching: find.byType(StatusLabel),
          ),
          findsNothing,
        );
        final bonusSampleItemButton = find.byKey(
          WidgetKeys.cartItemBonus(
            cartItem.materialInfo.materialNumber.displayMatNo,
            cartItem.bonusSampleItems.first.materialNumber.displayMatNo,
          ),
        );
        expect(bonusSampleItemButton, findsOneWidget);
        final cartItemQuantityInputKey = find.byType(CartItemQuantityInput);
        expect(cartItemQuantityInputKey, findsWidgets);
        final cartItemAddKey = find.byKey(WidgetKeys.bonusOfferItemAddKey);
        expect(cartItemAddKey, findsWidgets);
        final cartItemDeleteKey =
            find.byKey(WidgetKeys.bonusOfferItemDeleteKey);
        expect(cartItemDeleteKey, findsWidgets);
        final quantityInputTextKey =
            find.byKey(WidgetKeys.bonusOfferItemInputKey);
        expect(quantityInputTextKey, findsWidgets);
        await tester.tap(cartItemAddKey.last);
        await tester.pump();
        verify(
          () => cartBloc.add(
            CartEvent.addBonusToCartItem(
              bonusMaterial: MaterialInfo.empty().copyWith(
                materialNumber: cartItem.bonusSampleItems.first.materialNumber,
                parentID:
                    cartItem.materialInfo.materialNumber.getOrDefaultValue(''),
                quantity: MaterialQty(2),
              ),
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              bonusItemId: cartItem.bonusSampleItems.first.itemId,
            ),
          ),
        ).called(1);
        await tester.tap(cartItemDeleteKey.last);
        await tester.pump();
        verify(
          () => cartBloc.add(
            CartEvent.addBonusToCartItem(
              bonusMaterial: MaterialInfo.empty().copyWith(
                materialNumber: cartItem.bonusSampleItems.first.materialNumber,
                parentID:
                    cartItem.materialInfo.materialNumber.getOrDefaultValue(''),
                quantity: MaterialQty(1),
              ),
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              bonusItemId: cartItem.bonusSampleItems.first.itemId,
            ),
          ),
        ).called(1);
        await tester.enterText(quantityInputTextKey.last, '2');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        verify(
          () => cartBloc.add(
            CartEvent.addBonusToCartItem(
              bonusMaterial: MaterialInfo.empty().copyWith(
                materialNumber: cartItem.bonusSampleItems.first.materialNumber,
                parentID:
                    cartItem.materialInfo.materialNumber.getOrDefaultValue(''),
                quantity: MaterialQty(2),
              ),
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              bonusItemId: cartItem.bonusSampleItems.first.itemId,
            ),
          ),
        ).called(1);
      });

      testWidgets('cart Loading Item Quantity Input test', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            isUpserting: true,
            cartProducts: [
              cartItem.copyWith(
                bonusSampleItems: cartItem.bonusSampleItems
                    .map(
                      (e) => e.copyWith(
                        stockInfo: StockInfo.empty().copyWith(
                          inStock: MaterialInStock('Yes'),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(
          find.descendant(
            of: find.byType(CartProductTileBonus),
            matching: find.byType(CartItemQuantityInputShimmer),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Deal Bonus cannot be deleted if bonusOverride is disable from config',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItem],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bonusItem = WidgetKeys.cartItemBonus(
          cartItem.materialInfo.materialNumber.displayMatNo,
          cartItem.bonusSampleItems.first.materialNumber.displayMatNo,
        );

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget.key == bonusItem &&
                widget is CustomSlidable &&
                widget.endActionPaneActions.isNotEmpty,
          ),
          findsNothing,
        );
      });

      testWidgets(
          'Deal bonus cannot be deleted and update if item is marketplace',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItem.copyWith.materialInfo(isMarketPlace: true)],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial()
              .copyWith(salesOrgConfigs: fakeMYSalesOrgConfigs),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bonusItem = WidgetKeys.cartItemBonus(
          cartItem.materialInfo.materialNumber.displayMatNo,
          cartItem.bonusSampleItems.first.materialNumber.displayMatNo,
        );
        await tester.dragUntilVisible(
          find.byKey(bonusItem),
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -200),
        );
        await tester.pump();
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget.key == bonusItem &&
                widget is CustomSlidable &&
                widget.endActionPaneActions.isNotEmpty,
          ),
          findsNothing,
        );
        await tester.tap(
          find.descendant(
            of: find.byKey(bonusItem),
            matching: find.byKey(WidgetKeys.bonusOfferItemAddKey),
          ),
        );
        await tester.pump();

        verifyNever(
          () => cartBloc.add(
            CartEvent.addBonusToCartItem(
              bonusMaterial: MaterialInfo.empty().copyWith(
                materialNumber: cartItem.bonusSampleItems.first.materialNumber,
                parentID:
                    cartItem.materialInfo.materialNumber.getOrDefaultValue(''),
                quantity: MaterialQty(2),
              ),
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              bonusItemId: cartItem.bonusSampleItems.first.itemId,
            ),
          ),
        );
      });
    },
  );
}
