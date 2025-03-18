import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/covid_tag.dart';
import 'package:ezrxmobile/presentation/core/govt_list_price_component.dart';
import 'package:ezrxmobile/presentation/core/list_price_strike_through_component.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_info.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../utils/widget_utils.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late CartBloc cartBloc;
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBloc;
  late ProductImageBloc productImageBloc;
  late MaterialPriceBloc materialPriceBlocMock;
  final fakeCart =
      (await CartLocalDataSource().getAddedToCartProductList()).cartProducts;
  final fakeCartProduct = <PriceAggregate>[
    PriceAggregate.empty().copyWith(
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('123456789'),
        quantity: MaterialQty(1),
        tax: 10,
        type: MaterialInfoType.material(),
      ),
      price: Price.empty().copyWith(
        finalPrice: MaterialPrice(234.50),
      ),
      salesOrgConfig: fakeIDSalesOrgConfigs,
      bonusSampleItems: [
        BonusSampleItem.empty().copyWith(
          materialNumber: MaterialNumber('fake-bonus-1'),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
          ),
          qty: MaterialQty(5),
        ),
        BonusSampleItem.empty().copyWith(
          materialNumber: MaterialNumber('fake-bonus-2'),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('No'),
          ),
          type: MaterialInfoType('Bonus'),
          qty: MaterialQty(10),
        ),
        BonusSampleItem.empty().copyWith(
          materialNumber: MaterialNumber('fake-bonus-3'),
          type: MaterialInfoType('Deals'),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('No'),
          ),
          qty: MaterialQty(15),
        ),
        BonusSampleItem.empty().copyWith(
          materialNumber: MaterialNumber('123456789'),
          type: MaterialInfoType('Deals'),
        ),
      ],
    ),
  ];

  setUpAll(() async {
    locator.registerFactory(() => AppRouter());
    locator.registerSingleton<MixpanelService>(MixpanelServiceMock());
    autoRouterMock = locator<AppRouter>();
  });
  group('Pre Order Modal Test', () {
    setUp(() {
      eligibilityBloc = EligibilityBlocMock();
      cartBloc = CartBlocMock();
      autoRouterMock = locator<AppRouter>();
      productImageBloc = ProductImageBlocMock();
      materialPriceBlocMock = MaterialPriceBlocMock();
      when(() => cartBloc.state).thenReturn(CartState.initial());
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
      when(() => productImageBloc.state)
          .thenReturn(ProductImageState.initial());
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
    });
    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
          BlocProvider<CartBloc>(create: (context) => cartBloc),
          BlocProvider<ProductImageBloc>(create: (context) => productImageBloc),
          BlocProvider<MaterialPriceBloc>(
            create: (context) => materialPriceBlocMock,
          ),
        ],
        child: const Material(
          child: PreOrderModal(),
        ),
      );
    }

    testWidgets(
      '=> test Pre Order Modal App Bar ',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final preOrderModelFinder = find.byKey(WidgetKeys.preOrderModel);
        expect(preOrderModelFinder, findsOneWidget);
        final appBarTitle = find.text('OOS-Preorder items in cart');
        expect(appBarTitle, findsOneWidget);
        final appBarSubTitle = find
            .text('These item will only be delivered when stock is available.');
        expect(appBarSubTitle, findsOneWidget);
      },
    );
    testWidgets(
      '=> test Pre Order Modal Body ',
      (tester) async {
        await tester.binding.setSurfaceSize(const Size(600, 900));
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final preOrderModelFinder = find.byKey(WidgetKeys.preOrderModel);
        expect(preOrderModelFinder, findsOneWidget);
        final preOrderModalItemListFinder =
            find.byKey(WidgetKeys.preOrderModalItemList);
        expect(preOrderModalItemListFinder, findsOneWidget);
        final preOrderMaterialFinder = find.byKey(
          WidgetKeys.preOrderMaterial(
            fakeCartProduct.first.getMaterialNumber.displayMatNo,
          ),
        );
        expect(preOrderMaterialFinder, findsOneWidget);
        expect(
          find.byKey(
            WidgetKeys.preOrderMaterial(
              fakeCartProduct.first.getMaterialNumber.displayMatNo,
            ),
          ),
          findsOneWidget,
        );
        final preOrderModalItemFinalPrice = find.byKey(
          WidgetKeys.preOrderModalItemFinalPrice,
        );
        expect(preOrderModalItemFinalPrice, findsOneWidget);
      },
    );
    testWidgets(
      '=> test Pre Order Modal Body item image section for covid material',
      (tester) async {
        await tester.binding.setSurfaceSize(const Size(600, 900));
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              fakeCartProduct.first.copyWith(
                materialInfo: fakeCartProduct.first.materialInfo.copyWith(
                  isFOCMaterial: true,
                ),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final preOrderModelFinder = find.byKey(WidgetKeys.preOrderModel);
        expect(preOrderModelFinder, findsOneWidget);
        final preOrderModalItemListFinder =
            find.byKey(WidgetKeys.preOrderModalItemList);
        expect(preOrderModalItemListFinder, findsOneWidget);
        final preOrderMaterialFinder = find.byKey(
          WidgetKeys.preOrderMaterial(
            fakeCartProduct.first.getMaterialNumber.displayMatNo,
          ),
        );
        expect(preOrderMaterialFinder, findsOneWidget);
        expect(
          find.byKey(
            WidgetKeys.preOrderMaterial(
              fakeCartProduct.first.getMaterialNumber.displayMatNo,
            ),
          ),
          findsOneWidget,
        );
        expect(find.byType(CovidTag), findsOneWidget);
        expect(
          find.byType(GovtListPriceComponent),
          findsOneWidget,
        );
      },
    );
    testWidgets(
      '=> test Pre Order Modal Body Manufacturer Name',
      (tester) async {
        await tester.binding.setSurfaceSize(const Size(600, 900));
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              fakeCartProduct.first.copyWith(
                materialInfo: fakeCartProduct.first.materialInfo.copyWith(
                  principalData: PrincipalData(
                    principalCode: PrincipalCode(
                      'fake_principalCode',
                    ),
                    principalName: PrincipalName('fake_principalName-1'),
                  ),
                ),
              ),
              fakeCartProduct.first.copyWith(
                materialInfo: fakeCartProduct.first.materialInfo.copyWith(
                  materialNumber: MaterialNumber('1234567'),
                  principalData: PrincipalData(
                    principalCode: PrincipalCode(
                      'fake_principalCode1',
                    ),
                    principalName: PrincipalName('fake_principalName-2'),
                  ),
                ),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final preOrderModelFinder = find.byKey(WidgetKeys.preOrderModel);
        expect(preOrderModelFinder, findsOneWidget);
        final preOrderModalItemListFinder =
            find.byKey(WidgetKeys.preOrderModalItemList);
        expect(preOrderModalItemListFinder, findsOneWidget);
        final preOrderMaterialFinder = find.byKey(
          WidgetKeys.preOrderMaterial(
            fakeCartProduct.first.getMaterialNumber.displayMatNo,
          ),
        );
        expect(preOrderMaterialFinder, findsOneWidget);
        expect(
          find.byKey(
            WidgetKeys.preOrderMaterial(
              fakeCartProduct.first.getMaterialNumber.displayMatNo,
            ),
          ),
          findsOneWidget,
        );
        final preOrderModalItemFinalPrice = find.byKey(
          WidgetKeys.preOrderModalItemFinalPrice,
        );
        expect(preOrderModalItemFinalPrice, findsWidgets);
      },
    );

    testWidgets(
      '=> test Pre Order Modal Bottom section',
      (tester) async {
        await tester.binding.setSurfaceSize(const Size(600, 900));
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              fakeCartProduct.first.copyWith(
                materialInfo: fakeCartProduct.first.materialInfo.copyWith(
                  isFOCMaterial: true,
                ),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final preOrderModelFinder = find.byKey(WidgetKeys.preOrderModel);
        expect(preOrderModelFinder, findsOneWidget);
        final preOrderModalCancelButton =
            find.byKey(WidgetKeys.preOrderModalCancelButton);
        expect(preOrderModalCancelButton, findsOneWidget);
        final preOrderModalContinueButton =
            find.byKey(WidgetKeys.preOrderModalContinueButton);
        expect(preOrderModalContinueButton, findsOneWidget);
      },
    );

    testWidgets(
      '=> List price strike through price visible, if final price is less than list price && enableListPrice = true',
      (tester) async {
        final finalPrice = MaterialPrice(80);
        final listPrice = MaterialPrice(100);
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              fakeCartProduct.first.copyWith(
                salesOrgConfig: fakeIDSalesOrgConfigs,
                price: Price.empty().copyWith(
                  lastPrice: listPrice,
                  finalPrice: finalPrice,
                  materialNumber:
                      fakeCartProduct.first.materialInfo.materialNumber,
                ),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

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
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '=> List price strike through price not visible, if final price is less than list price && enableListPrice = false',
      (tester) async {
        final finalPrice = MaterialPrice(80);
        final listPrice = MaterialPrice(100);
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              fakeCartProduct.first.copyWith(
                salesOrgConfig: fakeMYSalesOrgConfigs,
                price: Price.empty().copyWith(
                  lastPrice: listPrice,
                  finalPrice: finalPrice,
                  materialNumber:
                      fakeCartProduct.first.materialInfo.materialNumber,
                ),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

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
      '=> List price strike through price not visible, if final price is greater than and equal to list price && enableListPrice = true',
      (tester) async {
        final finalPrice = MaterialPrice(200);
        final listPrice = MaterialPrice(100);
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              fakeCartProduct.first.copyWith(
                salesOrgConfig: fakeIDSalesOrgConfigs,
                price: Price.empty().copyWith(
                  lastPrice: listPrice,
                  finalPrice: finalPrice,
                  materialNumber:
                      fakeCartProduct.first.materialInfo.materialNumber,
                ),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

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
      'Find out of stock bonus items in pre order items list',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
            config: fakeIDSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final preOrderList = find.byKey(WidgetKeys.preOrderModalItemList);
        final preOrderBonus = find.text('fake-bonus-2');
        expect(preOrderList, findsOneWidget);
        expect(preOrderBonus, findsOneWidget);
      },
    );

    testWidgets(
      '=> Find Offer Tag',
      (tester) async {
        await tester.binding.setSurfaceSize(const Size(600, 900));
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              fakeCartProduct.first.copyWith(
                price: Price.empty().copyWith(
                  tiers: [
                    PriceTierItem.empty().copyWith(
                      rate: 41,
                      quantity: 5,
                    ),
                    PriceTierItem.empty().copyWith(
                      rate: 20,
                      quantity: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final offerTag = find.byType(OfferLabel);
        expect(offerTag, findsWidgets);
      },
    );
    testWidgets(
      'Find Bonus Tag for deal bonus',
      (tester) async {
        await tester.binding.setSurfaceSize(const Size(480, 900));

        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final dealBonusItem = find.text('fake-bonus-3');
        expect(dealBonusItem, findsOneWidget);
        final bonusTag = find.byType(BonusTag);
        expect(bonusTag, findsNWidgets(3));
        // verify the fontSize of Bonus is 12
        final bonusTextFinders = find.text('Bonus');
        expect(bonusTextFinders, findsNWidgets(3));
        bonusTextFinders.evaluate().forEach((element) {
          final textWidget = element.widget as Text;
          expect(textWidget.style?.fontSize, 12);
        });
      },
    );

    testWidgets(
      'Find Correct Quantity for added bonus item in pre-order model',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final dealBonusItem = find.text('fake-bonus-3');
        expect(dealBonusItem, findsOneWidget);
        final bonusQuantity = find.text('Qty: 15');
        expect(bonusQuantity, findsOneWidget);
      },
    );

    testWidgets(
      'Test Offer Tag Not visible for bonus items',
      (tester) async {
        when(() => materialPriceBlocMock.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {
              MaterialNumber('123456789'): Price.empty().copyWith(
                tiers: [
                  PriceTierItem.empty().copyWith(
                    rate: 41,
                    quantity: 5,
                  ),
                  PriceTierItem.empty().copyWith(
                    rate: 20,
                    quantity: 10,
                  ),
                ],
              ),
            },
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final offerTag = find.byType(OfferLabel);
        expect(offerTag, findsOneWidget);
      },
    );
    testWidgets(
      '=> Display MarketPlace Logo when item is MarketPlace',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct
                .map(
                  (e) => e.copyWith(
                    materialInfo: e.materialInfo.copyWith(isMarketPlace: true),
                  ),
                )
                .toList(),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(find.byType(MarketPlaceLogo), findsWidgets);
      },
    );

    testWidgets(
      '=> Should not display MarketPlace Logo when item is non-MarketPlace',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct
                .map(
                  (e) => e.copyWith(
                    materialInfo: e.materialInfo.copyWith(isMarketPlace: false),
                  ),
                )
                .toList(),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(find.byType(MarketPlaceLogo), findsNothing);
      },
    );

    testWidgets(
      'Find Stock Info if config enable',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct
                .map((e) => e.copyWith(bonusSampleItems: []))
                .toList(),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.materialDetailsStock),
          findsOneWidget,
        );
      },
    );

    testWidgets(
        'Display default material description when material description is empty',
        (tester) async {
      final mockItem = fakeCartProduct.first.copyWith(
        salesOrgConfig: fakeIDSalesOrgConfigs,
        materialInfo: fakeCartProduct.first.materialInfo.copyWith(
          materialDescription: '',
          data: [
            MaterialData.empty().copyWith(
              defaultMaterialDescription: 'fake-material-description',
            ),
          ],
        ),
      );
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          cartProducts: [mockItem],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.text('fake-material-description'),
        findsOneWidget,
      );
    });

    group('Bundle', () {
      testWidgets('Display bundle', (tester) async {
        final bundle = fakeCart
            .firstWhere(
              (e) =>
                  e.materialInfo.type.typeBundle &&
                  !e.materialInfo.isMarketPlace,
            )
            .copyWith(salesOrgConfig: fakeMYSalesOrgConfigs);
        final bundleMaterial = bundle.bundle.materials.first;
        when(() => cartBloc.state)
            .thenReturn(CartState.initial().copyWith(cartProducts: [bundle]));
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial()
              .copyWith(salesOrgConfigs: fakeMYSalesOrgConfigs),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final bundleTile =
            find.byKey(WidgetKeys.preOrderBundle(bundle.bundle.bundleCode));
        expect(bundleTile, findsOne);
        expect(
          find.descendant(
            of: bundleTile,
            matching: find.byKey(WidgetKeys.bundleTag),
          ),
          findsOne,
        );
        expect(
          tester
              .widget<Text>(
                find.descendant(
                  of: bundleTile,
                  matching: find.byKey(WidgetKeys.cartItemBundleNumber),
                ),
              )
              .data,
          equals(bundle.bundle.bundleCode),
        );
        expect(
          tester
              .widget<Text>(
                find.descendant(
                  of: bundleTile,
                  matching: find.byKey(WidgetKeys.cartItemBundleQty),
                ),
              )
              .data,
          equals('Total quantity: ${bundle.bundle.totalQty}'),
        );
        expect(
          tester
              .widget<RichText>(
                find.descendant(
                  of: bundleTile,
                  matching: find.byKey(WidgetKeys.cartItemBundleName),
                ),
              )
              .text
              .toPlainText(),
          contains(bundle.bundle.bundleName.name),
        );
        final materialTile = find.byKey(
          WidgetKeys.cartItemProductTile(
            bundleMaterial.materialNumber.displayMatNo,
          ),
        );
        expect(
          find.descendant(of: bundleTile, matching: materialTile),
          findsOne,
        );
        expect(
          tester
              .widget<Text>(
                find.descendant(
                  of: materialTile,
                  matching:
                      find.byKey(WidgetKeys.cartItemProductMaterialNumber),
                ),
              )
              .data,
          equals(bundleMaterial.materialNumber.displayMatNo),
        );
        expect(
          find.descendant(
            of: materialTile,
            matching: find.descendant(
              of: find.byType(StatusLabel),
              matching: find.text('OOS-Preorder'),
            ),
          ),
          findsOne,
        );
        expect(
          tester
              .widget<Text>(
                find.descendant(
                  of: materialTile,
                  matching:
                      find.byKey(WidgetKeys.cartItemProductMaterialDescription),
                ),
              )
              .data,
          equals(bundleMaterial.defaultMaterialDescription),
        );
        expect(
          tester
              .widget<Text>(
                find.descendant(
                  of: materialTile,
                  matching: find.byKey(WidgetKeys.cartItemProductPrincipalName),
                ),
              )
              .data,
          equals(bundleMaterial.getManufactured),
        );
        expect(
          find.descendant(
            of: materialTile,
            matching: find.byType(StockInfoWidget),
          ),
          findsOne,
        );
        expect(
          tester
              .widget<Text>(
                find.descendant(
                  of: materialTile,
                  matching: find.byKey(WidgetKeys.cartItemProductQty),
                ),
              )
              .data,
          equals('Qty: ${bundleMaterial.quantity.intValue}'),
        );
      });

      testWidgets(
          'Display marketplace logo + Batch & expiry date as NA for MP bundle',
          (tester) async {
        final mpBundle = fakeCart
            .firstWhere(
              (e) =>
                  e.materialInfo.type.typeBundle &&
                  e.materialInfo.isMarketPlace,
            )
            .copyWith(salesOrgConfig: fakeMYSalesOrgConfigs);
        final bundleMaterial = mpBundle.bundle.materials.first;
        when(() => cartBloc.state)
            .thenReturn(CartState.initial().copyWith(cartProducts: [mpBundle]));
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs:
                fakeMYSalesOrgConfigs.copyWith(enableBatchNumber: true),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final bundleTile =
            find.byKey(WidgetKeys.preOrderBundle(mpBundle.bundle.bundleCode));
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
            bundleMaterial.materialNumber.displayMatNo,
          ),
        );
        expect(
          find.descendant(of: bundleTile, matching: materialTile),
          findsOne,
        );
        expect(
          find.descendant(
            of: materialTile,
            matching: find.descendant(
              of: find.byType(StockInfoWidget),
              matching: find.textContaining(
                'Batch: NA - Expires: NA',
                findRichText: true,
              ),
            ),
          ),
          findsOne,
        );
      });
    });
  });
}
