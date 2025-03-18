import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_list_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_qty_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_combo.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_combo_item.dart';
import 'package:ezrxmobile/presentation/products/combo_detail/widgets/discount_tag_widget.dart';
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
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
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
  late TenderContractListBloc tenderContractListBlocMock;
  late Map<MaterialNumber, Price> mockPriceList;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late PriceOverrideBloc priceOverrideBloc;
  late AppRouter autoRouter;
  late OrderSummaryBloc orderSummaryBlocMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late ComboDealListBloc comboDealListBlocMock;
  late CustomerLicenseBloc customerLicenseBlocMock;
  late ComboDealMaterialDetailBloc comboDealMaterialDetailBlocMock;

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
    customerCodeBloc = CustomerCodeBlocMock();
    eligibilityBloc = EligibilityBlocMock();
    userBloc = UserBlocMock();
    orderEligibilityBloc = OrderEligibilityBlocMock();
    priceOverrideBloc = PriceOverrideBlocMock();
    orderSummaryBlocMock = OrderSummaryBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    comboDealListBlocMock = ComboDealListBlocMock();
    customerLicenseBlocMock = CustomerLicenseBlocMock();
    comboDealMaterialDetailBlocMock = ComboDealMaterialDetailBlocMock();
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
        type: MaterialInfoType('combo'),
        materialNumber: MaterialNumber('000000000023168451'),
        materialDescription: ' Triglyceride Mosys D',
        principalData: PrincipalData.empty().copyWith(
          principalName: PrincipalName('台灣拜耳股份有限公司'),
        ),
        quantity: MaterialQty(2),
      ),
      comboMaterials: [
        ComboMaterialItem.empty().copyWith(
          materialInfo: MaterialInfo.empty().copyWith(
            type: MaterialInfoType('combo'),
            materialNumber: MaterialNumber('000000000023168451'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('台灣拜耳股份有限公司'),
            ),
            quantity: MaterialQty(2),
          ),
          comboDeals: PriceComboDeal.empty().copyWith(
            category: PriceComboDealCategory.empty()
                .copyWith(type: ComboDealCategoryType('MATNR')),
          ),
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
      when(() => salesOrgBloc.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: fakeSGSalesOrgConfigs,
          salesOrganisation: fakeSGSalesOrganisation,
        ),
      );
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: '1234',
          ),
        ),
      );
      when(() => customerLicenseBlocMock.state)
          .thenReturn(CustomerLicenseState.initial());
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
      when(() => comboDealListBlocMock.state)
          .thenReturn(ComboDealListState.initial());
      when(() => comboDealMaterialDetailBlocMock.state)
          .thenReturn(ComboDealMaterialDetailState.initial());
      when(() => tenderContractListBlocMock.state)
          .thenReturn(TenderContractListState.initial());
    },
  );
  group(
    'Test Cart_Page',
    () {
      final firstQtyTier = ComboDealQtyTier.empty().copyWith(
        minQty: 3,
        suffix: ComboSuffix('1'),
      );
      final secondQtyTier = ComboDealQtyTier.empty().copyWith(
        minQty: 7,
        suffix: ComboSuffix('2'),
      );

      final fakeSuffixMaterial1 = ComboDealMaterial.empty().copyWith(
        minQty: 0,
        materialNumber: MaterialNumber('fake-optional-material'),
        rate: -4,
        mandatory: false,
        suffix: ComboSuffix('1'),
      );

      final fakeSuffixMaterial2 = ComboDealMaterial.empty().copyWith(
        minQty: 0,
        materialNumber: MaterialNumber('fake-optional-material'),
        rate: -8,
        mandatory: false,
        suffix: ComboSuffix('2'),
      );

      final comboDeal = ComboDeal.empty().copyWith(
        flexiQtyTier: [
          firstQtyTier,
          secondQtyTier,
        ],
        materialComboDeals: [
          ComboDealMaterialSet(
            materials: [fakeSuffixMaterial1, fakeSuffixMaterial2],
            setNo: 'fake-set',
          ),
        ],
      );

      final comboMaterialsMock = {
        MaterialNumber('fake-optional-material'):
            PriceAggregate.empty().copyWith(
          quantity: 4,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-optional-material'),
          ),
          comboDeal: comboDeal,
        ),
      };

      final comboMaterialsSeletedMock = {
        MaterialNumber('fake-optional-material'): false,
      };

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
            BlocProvider<ComboDealListBloc>(
              create: (context) => comboDealListBlocMock,
            ),
            BlocProvider<ComboDealMaterialDetailBloc>(
              create: (context) => comboDealMaterialDetailBlocMock,
            ),
            BlocProvider<TenderContractListBloc>(
              create: (context) => tenderContractListBlocMock,
            ),
          ],
          child: const CartPage(),
        );
      }

      testWidgets('Combo item test', (tester) async {
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
        final comboItem = find.byType(
          CartProductCombo,
        );
        expect(comboItem, findsOneWidget);
        final customSlidableAction = find.byKey(
          WidgetKeys.cartItemSwipeDeleteButton,
        );
        await tester.dragUntilVisible(
          customSlidableAction,
          comboItem,
          const Offset(-500, 0),
        );
        await tester.pump();
        expect(customSlidableAction, findsWidgets);
        await tester.tap(customSlidableAction);
        await tester.pump();
      });
      testWidgets('Combo item edit test when type is material', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItem],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeKHSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo
                .copyWith(salesDeals: [SalesDealNumber('12345')]),
          ),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();
        final comboItem = find.byType(
          CartProductCombo,
        );
        expect(comboItem, findsOneWidget);
        final editButton = find.text('Edit');
        expect(editButton, findsOneWidget);
        await tester.tap(editButton);
        await tester.pump();
        verify(
          () => comboDealMaterialDetailBlocMock.add(
            ComboDealMaterialDetailEvent.cartContainsCurrentCombo(
              contain: cartItem.comboMaterialsCurrentQuantity.isNotEmpty,
            ),
          ),
        ).called(1);
        verify(
          () => comboDealMaterialDetailBlocMock.add(
            ComboDealMaterialDetailEvent.fetchComboDealDetail(
              comboDeal: cartItem.comboDeal,
              parentMaterialNumber: MaterialNumber(
                '',
              ),
              comboMaterialsCurrentQuantity:
                  cartItem.comboMaterialsCurrentQuantity,
            ),
          ),
        ).called(1);
      });

      testWidgets('Combo item edit test when type is other', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              cartItem.copyWith(
                comboMaterials: [
                  cartItem.comboMaterials.first
                      .copyWith(comboDeals: PriceComboDeal.empty()),
                ],
              ),
            ],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeKHSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo
                .copyWith(salesDeals: [SalesDealNumber('12345')]),
          ),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();
        final comboItem = find.byType(
          CartProductCombo,
        );
        expect(comboItem, findsOneWidget);
        final editButton = find.text('Edit');
        expect(editButton, findsOneWidget);
        await tester.tap(editButton);
        await tester.pump();
        verify(
          () => comboDealMaterialDetailBlocMock.add(
            ComboDealMaterialDetailEvent.cartContainsCurrentCombo(
              contain: cartItem.comboMaterialsCurrentQuantity.isNotEmpty,
            ),
          ),
        ).called(1);
        verify(
          () => comboDealMaterialDetailBlocMock.add(
            ComboDealMaterialDetailEvent.fetchComboDealPrincipal(
              comboDeal: cartItem.comboDeal,
              principles: [''],
              comboMaterialsCurrentQuantity:
                  cartItem.comboMaterialsCurrentQuantity,
              parentMaterialNumber: cartItem.materialInfo.materialNumber,
            ),
          ),
        ).called(1);
      });

      testWidgets('cart Combo Item test', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              cartItem.copyWith(
                comboMaterials: [
                  cartItem.comboMaterials.first.copyWith(
                    comboDealType: 'K2',
                    mandatory: true,
                    comboDeals: PriceComboDeal.empty(),
                  ),
                ],
              ),
            ],
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeKHSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo
                .copyWith(salesDeals: [SalesDealNumber('12345')]),
          ),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();
        final comboItem = find.byType(
          CartProductCombo,
        );
        expect(comboItem, findsOneWidget);
        final cartProductComboItem = find.byType(
          CartProductComboItem,
        );
        expect(cartProductComboItem, findsWidgets);
        final discountTagWidget = find.byType(
          DiscountTagWidget,
        );
        expect(discountTagWidget, findsWidgets);
      });
      testWidgets('cart Combo Item Display Original Price test',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              cartItem.copyWith(
                comboMaterials: [
                  cartItem.comboMaterials.first.copyWith(
                    salesOrgConfig: fakeKHSalesOrgConfigs,
                    comboDealType: 'K2',
                    comboDeals: PriceComboDeal.empty(),
                  ),
                ],
              ),
            ],
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeKHSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo
                .copyWith(salesDeals: [SalesDealNumber('12345')]),
          ),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();
        final comboItem = find.byType(
          CartProductCombo,
        );
        expect(comboItem, findsOneWidget);
        final cartProductComboItem = find.byType(
          CartProductComboItem,
        );
        expect(cartProductComboItem, findsWidgets);
        final cartItemProductTotalPrice = find.byKey(
          WidgetKeys.cartItemProductTotalPrice,
        );
        expect(cartItemProductTotalPrice, findsWidgets);
      });
      testWidgets('cart Combo Item delete button test', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [cartItem],
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeKHSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo
                .copyWith(salesDeals: [SalesDealNumber('12345')]),
          ),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();
        final comboItem = find.byType(
          CartProductCombo,
        );
        expect(comboItem, findsOneWidget);
        final deleteButton = find.text('Delete');
        await tester.tap(deleteButton);
        await tester.pump();
      });

      testWidgets(
          'Cart Combo Item should display one total amount if tax is not applicable',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              cartItem.copyWith(
                comboMaterials: cartItem.comboMaterials
                    .map(
                      (e) => e.copyWith(
                        salesOrgConfig: fakeKHSalesOrgConfigs,
                        comboDealType: 'K1',
                        comboDeals: PriceComboDeal.empty().copyWith(
                          flexibleGroup: FlexibleGroup('123456'),
                          salesDeal: SalesDealNumber('654321'),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeKHSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo
                .copyWith(salesDeals: [SalesDealNumber('654321')]),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        final comboItem = find.byType(
          CartProductCombo,
        );
        expect(comboItem, findsOneWidget);
        final totalPriceWithTaxAmountFinder =
            find.byKey(WidgetKeys.cartItemProductTotalPriceWithTaxAmount);
        expect(totalPriceWithTaxAmountFinder, findsNothing);
      });

      testWidgets('Display best deal message for cart combo product K1',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              cartItem.copyWith(
                comboMaterials: cartItem.comboMaterials
                    .map(
                      (e) => e.copyWith(
                        salesOrgConfig: fakeKHSalesOrgConfigs,
                        comboDealType: 'K1',
                        comboDeals: PriceComboDeal.empty().copyWith(
                          flexibleGroup: FlexibleGroup('123456'),
                          salesDeal: SalesDealNumber('654321'),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeKHSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo
                .copyWith(salesDeals: [SalesDealNumber('654321')]),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        final comboItem = find.byType(
          CartProductCombo,
        );
        expect(comboItem, findsOneWidget);
        final bestDealMessageFinder =
            find.text('Yay! You’ve got the best deal.');
        expect(bestDealMessageFinder, findsOneWidget);
      });

      testWidgets('Display combo K4.2 title and requirement message ',
          (tester) async {
        when(() => comboDealListBlocMock.state).thenReturn(
          ComboDealListState.initial().copyWith(
            comboDeals: {
              '123456-654321': [comboDeal],
            },
            priceComboDeal: PriceComboDeal.empty().copyWith(
              flexibleGroup: FlexibleGroup('123456'),
              salesDeal: SalesDealNumber('654321'),
            ),
          ),
        );
        when(() => comboDealMaterialDetailBlocMock.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: comboMaterialsMock,
            materialCount: comboMaterialsMock.length,
            selectedItems: comboMaterialsSeletedMock,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              cartItem.copyWith(
                quantity: 7,
                comboMaterials: cartItem.comboMaterials
                    .map(
                      (e) => e.copyWith(
                        materialInfo: e.materialInfo.copyWith(
                          quantity: MaterialQty(7),
                        ),
                        salesOrgConfig: fakeKHSalesOrgConfigs,
                        comboDealType: 'K4.2',
                        comboDeals: PriceComboDeal.empty().copyWith(
                          flexibleGroup: FlexibleGroup('123456'),
                          salesDeal: SalesDealNumber('654321'),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeKHSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo
                .copyWith(salesDeals: [SalesDealNumber('654321')]),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        final comboItem = find.byType(
          CartProductCombo,
        );
        expect(comboItem, findsOneWidget);

        final cartComboTitleFinder = find.text('Combo K4.2');
        expect(cartComboTitleFinder, findsOneWidget);

        final cartComboRequirementFinder = find.text(
          'Buy 3 more quantity to achieve next tier discount',
        );

        expect(cartComboRequirementFinder, findsOneWidget);
      });
    },
  );
}
