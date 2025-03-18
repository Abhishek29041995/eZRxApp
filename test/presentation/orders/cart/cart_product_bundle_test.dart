import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_list_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
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
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late CartBloc cartBloc;
  late MaterialPriceBloc materialPriceBloc;
  late EligibilityBloc eligibilityBloc;
  late UserBloc userBloc;
  late PriceAggregate cartItem;
  late SalesOrgBloc salesOrgBloc;
  late CustomerCodeBloc customerCodeBloc;
  late OrderEligibilityBloc orderEligibilityBloc;
  late CustomerLicenseBloc customerLicenseBlocMock;
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
    materialPriceBloc = MaterialPriceBlocMock();
    salesOrgBloc = SalesOrgBlocMock();
    customerLicenseBlocMock = CustomerLicenseBlocMock();
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
        type: MaterialInfoType('bundle'),
        materialNumber: MaterialNumber('000000000023168451'),
        materialDescription: ' Triglyceride Mosys D',
        principalData: PrincipalData.empty().copyWith(
          principalName: PrincipalName('台灣拜耳股份有限公司'),
        ),
        quantity: MaterialQty(2),
      ),
      bundle: Bundle.empty().copyWith(
        bundleCode: 'fake_bundleCode',
        materials: [MaterialInfo.empty().copyWith(quantity: MaterialQty(1))],
      ),
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
      when(() => salesOrgBloc.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: fakeSGSalesOrgConfigs,
          salesOrganisation: fakeSGSalesOrganisation,
        ),
      );
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
      );
      when(() => customerLicenseBlocMock.state)
          .thenReturn(CustomerLicenseState.initial());
      when(() => orderEligibilityBloc.state).thenReturn(
        OrderEligibilityState.initial(),
      );
      when(() => tenderContractListBlocMock.state)
          .thenReturn(TenderContractListState.initial());
      when(() => priceOverrideBloc.state)
          .thenReturn(PriceOverrideState.initial());
      when(() => additionalDetailsBlocMock.state)
          .thenReturn(AdditionalDetailsState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => bonusMaterialBlocMock.state)
          .thenReturn(BonusMaterialState.initial());
    },
  );
  group(
    'Test Cart_Page',
    () {
      Widget getWidget() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouter,
          usingLocalization: true,
          providers: [
            BlocProvider<UserBloc>(create: (context) => userBloc),
            BlocProvider<CartBloc>(create: (context) => cartBloc),
            BlocProvider<MaterialPriceBloc>(
              create: (context) => materialPriceBloc,
            ),
            BlocProvider<CustomerLicenseBloc>(
              create: (context) => customerLicenseBlocMock,
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
            BlocProvider<TenderContractListBloc>(
              create: (context) => tenderContractListBlocMock,
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
          ],
          child: const CartPage(),
        );
      }

      testWidgets('Bundle item test', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItem],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();
        final bundleItem = find.byKey(
          WidgetKeys.cartItemBundleTile(cartItem.bundle.bundleCode),
        );
        expect(bundleItem, findsOneWidget);
        final customSlidableAction = find.byKey(
          WidgetKeys.cartItemSwipeDeleteButton,
        );
        await tester.dragUntilVisible(
          customSlidableAction,
          bundleItem,
          const Offset(-500, 0),
        );
        await tester.pump();
        expect(customSlidableAction, findsOneWidget);
        await tester.tap(customSlidableAction);
        await tester.pump();
        verify(
          () => cartBloc.add(
            CartEvent.upsertCart(
              priceAggregate: cartItem.copyWith(
                quantity: 0,
              ),
            ),
          ),
        ).called(1);
      });

      testWidgets('cart Bundle Item Quantity Input test', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItem],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bundleItem = find.byKey(
          WidgetKeys.cartItemBundleTile(cartItem.bundle.bundleCode),
        );
        expect(bundleItem, findsOneWidget);
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
            CartEvent.upsertCartItems(
              priceAggregate: PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber(
                    cartItem.bundle.bundleCode,
                  ),
                ),
                bundle: Bundle.empty().copyWith(
                  materials: [
                    cartItem.bundle.materials.first
                        .copyWith(quantity: MaterialQty(2)),
                  ],
                  bundleCode: cartItem.bundle.bundleCode,
                ),
              ),
            ),
          ),
        ).called(1);
        await tester.tap(cartItemDeleteKey);
        await tester.pump();
        verify(
          () => cartBloc.add(
            CartEvent.upsertCartItems(
              priceAggregate: PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber(
                    cartItem.bundle.bundleCode,
                  ),
                ),
                bundle: Bundle.empty().copyWith(
                  materials: [
                    cartItem.bundle.materials.first
                        .copyWith(quantity: MaterialQty(1)),
                  ],
                  bundleCode: cartItem.bundle.bundleCode,
                ),
              ),
            ),
          ),
        ).called(1);
        await tester.enterText(quantityInputTextKey, '2');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        verify(
          () => cartBloc.add(
            CartEvent.upsertCartItems(
              priceAggregate: PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber(
                    cartItem.bundle.bundleCode,
                  ),
                ),
                bundle: Bundle.empty().copyWith(
                  materials: [
                    cartItem.bundle.materials.first
                        .copyWith(quantity: MaterialQty(2)),
                  ],
                  bundleCode: cartItem.bundle.bundleCode,
                ),
              ),
            ),
          ),
        ).called(1);
      });

      testWidgets('cart Bundle Item delete button test', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItem],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bundleItem = find.byKey(
          WidgetKeys.cartItemBundleTile(cartItem.bundle.bundleCode),
        );
        expect(bundleItem, findsOneWidget);
        final cartItemQuantityInputKey = find.byType(CartItemQuantityInput);
        expect(cartItemQuantityInputKey, findsOneWidget);
        final cartItemAddKey = find.byKey(WidgetKeys.increaseQuantityKey);
        expect(cartItemAddKey, findsOneWidget);
        final cartItemDeleteKey = find.byKey(WidgetKeys.decreaseQuantityKey);
        expect(cartItemDeleteKey, findsOneWidget);
        final quantityInputTextKey =
            find.byKey(WidgetKeys.quantityInputTextKey);
        expect(quantityInputTextKey, findsOneWidget);
        final cartItemProductDeleteButton =
            find.byKey(WidgetKeys.cartItemProductDeleteButton);
        expect(cartItemProductDeleteButton, findsOneWidget);
        await tester.tap(cartItemProductDeleteButton);
        await tester.pump();
        expect(
          find.textContaining('Remove item from bundle?'.tr()),
          findsOneWidget,
        );
        final removeButton = find.text('Remove'.tr());
        expect(
          removeButton,
          findsOneWidget,
        );
        final cancelButton = find.text('Cancel'.tr());
        expect(
          cancelButton,
          findsOneWidget,
        );
        await tester.tap(removeButton);
        await tester.pump();
      });

      testWidgets('cart bundle item did not satisfy minimum order quantity',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              cartItem.copyWith(
                bundle: cartItem.bundle.copyWith(
                  materials: [
                    cartItem.bundle.materials.first
                        .copyWith(quantity: MaterialQty(2)),
                  ],
                  bundleInformation: [
                    BundleInfo(
                      sequence: 1,
                      quantity: 3,
                      type: DiscountType('%'),
                      rate: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(
          find.textContaining('Minimum total purchase qty'),
          findsOneWidget,
        );
        // verify below minimum input text
        final quantityInputTextKey =
            find.byKey(WidgetKeys.quantityInputTextKey);
        expect(quantityInputTextKey, findsOneWidget);
        await tester.enterText(quantityInputTextKey, '1');
        await tester.pump();
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        expect(
          tester.widget<TextFormField>(quantityInputTextKey).controller?.text,
          '2',
        );
      });
    },
  );
}
