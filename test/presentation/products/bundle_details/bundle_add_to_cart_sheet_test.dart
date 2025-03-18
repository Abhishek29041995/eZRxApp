import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/bundle/add_to_cart/bundle_add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_rectangle_logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/bundle_details/widget/bundle_add_to_cart_sheet.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late ProductDetailBlocMock productDetailMockBloc;
  late ProductImageBlocMock mockProductImageBloc;
  late EligibilityBlocMock eligibilityBlocMock;
  late BundleAddToCartBloc bundleAddToCartBloc;
  late CartBloc cartMockBloc;
  late AppRouter autoRouterMock;
  final fakeData = await MaterialListLocalDataSource().getProductDetails();
  final fakeBundleMaterials =
      fakeData.data.map((e) => e.toMaterialInfo).toList();
  final fakeBundle = fakeData.copyWith.bundle(materials: fakeBundleMaterials);

  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() {
    bundleAddToCartBloc = BundleAddToCartBlocMock();
    productDetailMockBloc = ProductDetailBlocMock();
    mockProductImageBloc = ProductImageBlocMock();
    cartMockBloc = CartBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial().copyWith(
        user: fakeRootAdminUser,
        salesOrganisation: fakeMYSalesOrganisation,
      ),
    );
    when(() => productDetailMockBloc.state)
        .thenReturn(ProductDetailState.initial());
    when(() => mockProductImageBloc.state)
        .thenReturn(ProductImageState.initial());
    when(() => cartMockBloc.state).thenReturn(CartState.initial());
    when(() => bundleAddToCartBloc.state)
        .thenReturn(BundleAddToCartState.initial());
  });

  RouteDataScope getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<EligibilityBloc>(
          create: ((context) => eligibilityBlocMock),
        ),
        BlocProvider<ProductDetailBloc>(
          create: ((context) => productDetailMockBloc),
        ),
        BlocProvider<ProductImageBloc>(
          create: (context) => mockProductImageBloc,
        ),
        BlocProvider<CartBloc>(
          create: ((context) => cartMockBloc),
        ),
        BlocProvider<BundleAddToCartBloc>(
          create: ((context) => bundleAddToCartBloc),
        ),
      ],
      child: const Material(child: BundlesAddToCartSheet()),
    );
  }

  group('Bundle Add To cart', () {
    testWidgets('Out of stock material deactivate', (tester) async {
      when(() => bundleAddToCartBloc.state).thenReturn(
        BundleAddToCartState.initial().copyWith(materialInfo: fakeBundle),
      );
      final expectedStates = Stream.fromIterable(
        [
          BundleAddToCartState.initial().copyWith(
            materialInfo: fakeBundle.copyWith.bundle(
              materials: fakeBundleMaterials
                  .map(
                    (e) => e.copyWith(
                      stockInfos: [
                        StockInfo.empty()
                            .copyWith(inStock: MaterialInStock('No')),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );

      whenListen(bundleAddToCartBloc, expectedStates);
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final bundleAddToCartSheet = find.byKey(
        WidgetKeys.bundleAddToCartSheet,
      );
      final bundleInputAddKey = find.byKey(
        WidgetKeys.bundleInputAddKey,
      );
      final bundleQuantity = find.byKey(
        ValueKey(
          'bundle${fakeBundleMaterials.first.materialNumber.displayMatNo}1quantity',
        ),
      );
      expect(bundleAddToCartSheet, findsOneWidget);
      expect(bundleInputAddKey, findsWidgets);
      await tester.tap(bundleInputAddKey.first);
      await tester.pumpAndSettle();
      expect(bundleQuantity, findsNothing);
    });

    testWidgets('Out of stock material active', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );
      when(() => bundleAddToCartBloc.state).thenReturn(
        BundleAddToCartState.initial().copyWith(materialInfo: fakeBundle),
      );
      final expectedStates = Stream.fromIterable(
        [
          BundleAddToCartState.initial().copyWith(
            materialInfo: fakeBundle.copyWith.bundle(
              materials: fakeBundleMaterials
                  .map(
                    (e) => e.copyWith(
                      stockInfos: [
                        StockInfo.empty()
                            .copyWith(inStock: MaterialInStock('No')),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );

      whenListen(bundleAddToCartBloc, expectedStates);
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final bundleAddToCartSheet = find.byKey(
        WidgetKeys.bundleAddToCartSheet,
      );
      final bundleQuantityTextKey = find.byKey(
        WidgetKeys.bundleQuantityTextKey,
      );

      expect(bundleAddToCartSheet, findsOneWidget);
      expect(bundleQuantityTextKey, findsWidgets);
      await tester.tap(bundleQuantityTextKey.first);
      await tester.pumpAndSettle();
      await tester.enterText(bundleQuantityTextKey.first, '1');
      await tester.pumpAndSettle();
      verify(
        () => bundleAddToCartBloc.add(
          BundleAddToCartEvent.updateQuantity(
            materialNumber: fakeBundleMaterials.first.materialNumber,
            quantity: 1,
          ),
        ),
      ).called(1);
    });

    testWidgets('Wrong currency visible in bundle add to cart sheet',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );
      when(() => bundleAddToCartBloc.state).thenReturn(
        BundleAddToCartState.initial().copyWith(materialInfo: fakeBundle),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final price = find.text('SGD 100.00 per item', findRichText: true);

      expect(price, findsOneWidget);
    });

    testWidgets('Error message - Minimum quantity does not satisfy',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );
      when(() => bundleAddToCartBloc.state).thenReturn(
        BundleAddToCartState.initial().copyWith(materialInfo: fakeBundle),
      );

      whenListen(
        bundleAddToCartBloc,
        Stream.fromIterable([
          bundleAddToCartBloc.state.copyWith(
            showErrorMessage: true,
          ),
        ]),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final textField = find.descendant(
        of: find.byKey(
          WidgetKeys.bundleMaterialItem(
            fakeBundleMaterials.first.materialNumber.displayMatNo,
          ),
        ),
        matching: find.byKey(WidgetKeys.bundleQuantityTextKey),
      );
      await tester.tap(textField);
      await tester.enterText(textField, '5');
      expect(textField, findsWidgets);
      final sheetAddToCartButton =
          find.byKey(WidgetKeys.bundleAddToCartSheetSubmitButton);
      await tester.tap(sheetAddToCartButton);
      await tester.pumpAndSettle();
      expect(
        find.textContaining('Minimum total purchase qty'),
        findsOneWidget,
      );
    });

    testWidgets(
        'Test CovidWarningMessageBottomSheet appeared when cart contains FOC materials',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );
      when(() => bundleAddToCartBloc.state).thenReturn(
        BundleAddToCartState.initial().copyWith(
          materialInfo: fakeBundle.copyWith.bundle(
            materials: [
              fakeBundleMaterials.first.copyWith(quantity: MaterialQty(10)),
              fakeBundleMaterials.last,
            ],
          ),
        ),
      );

      when(() => cartMockBloc.state).thenReturn(
        CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(isFOCMaterial: true),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final textField = find.descendant(
        of: find.byKey(
          WidgetKeys.bundleMaterialItem(
            fakeBundleMaterials.first.materialNumber.displayMatNo,
          ),
        ),
        matching: find.byKey(WidgetKeys.bundleQuantityTextKey),
      );
      await tester.tap(textField);
      await tester.enterText(textField, '15');
      expect(textField, findsWidgets);
      final sheetAddToCartButton =
          find.byKey(WidgetKeys.bundleAddToCartSheetSubmitButton);
      await tester.tap(sheetAddToCartButton);
      await tester.pumpAndSettle();
      final addToCartErrorSection =
          find.byKey(WidgetKeys.addToCartErrorSection);
      expect(addToCartErrorSection, findsOneWidget);
    });

    testWidgets(
        'expiry date displayed on bundle materials when enabled from config',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );
      when(() => bundleAddToCartBloc.state).thenReturn(
        BundleAddToCartState.initial().copyWith(
          materialInfo: fakeBundle.copyWith.bundle(
            materials: [
              fakeBundleMaterials.first.copyWith(
                stockInfos: <StockInfo>[
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('Yes'),
                    expiryDate: DateTimeStringValue('20240603'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byKey(WidgetKeys.materialDetailsStock), findsOneWidget);
    });

    testWidgets(
        'expiry date displayed on bundle materials when disabled from config',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTHSalesOrgConfigs,
        ),
      );
      when(() => bundleAddToCartBloc.state).thenReturn(
        BundleAddToCartState.initial().copyWith(
          materialInfo: fakeBundle.copyWith.bundle(
            materials: [
              fakeBundleMaterials.first.copyWith(
                stockInfos: <StockInfo>[
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('Yes'),
                    expiryDate: DateTimeStringValue('20240603'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final bundleAddToCartSheet = find.byKey(
        WidgetKeys.bundleAddToCartSheet,
      );
      final bundleMaterialExpiryDateFinder =
          find.byKey(WidgetKeys.bundleMaterialExpiryDate);

      expect(bundleAddToCartSheet, findsOneWidget);
      expect(bundleMaterialExpiryDateFinder, findsNothing);
    });

    testWidgets('expiry date displayed on bundle materials Na if empty',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => bundleAddToCartBloc.state).thenReturn(
        BundleAddToCartState.initial().copyWith(
          materialInfo: fakeBundle.copyWith.bundle(
            materials: [
              fakeBundleMaterials.first.copyWith(
                stockInfos: <StockInfo>[
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('Yes'),
                    expiryDate: DateTimeStringValue(''),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      expect(
        find.textContaining(
          '${'Expires'.tr()}: NA',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });
    testWidgets(
        'Test CovidWarningMessageBottomSheet processed button tap appeared when cart contains FOC materials',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );
      when(() => bundleAddToCartBloc.state).thenReturn(
        BundleAddToCartState.initial().copyWith(
          materialInfo: fakeBundle.copyWith.bundle(
            materials: [
              fakeBundleMaterials.first.copyWith(quantity: MaterialQty(10)),
              fakeBundleMaterials.last,
            ],
          ),
        ),
      );

      when(() => cartMockBloc.state).thenReturn(
        CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(isFOCMaterial: true),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final textField = find.descendant(
        of: find.byKey(
          WidgetKeys.bundleMaterialItem(
            fakeBundleMaterials.first.materialNumber.displayMatNo,
          ),
        ),
        matching: find.byKey(WidgetKeys.bundleQuantityTextKey),
      );
      await tester.tap(textField);
      await tester.enterText(textField, '15');
      expect(textField, findsWidgets);
      final sheetAddToCartButton =
          find.byKey(WidgetKeys.bundleAddToCartSheetSubmitButton);
      final addToCartErrorSectionProceed =
          find.byKey(WidgetKeys.addToCartErrorSectionProceed);
      await tester.tap(sheetAddToCartButton);
      await tester.pumpAndSettle();
      final addToCartErrorSection =
          find.byKey(WidgetKeys.addToCartErrorSection);
      expect(addToCartErrorSection, findsOneWidget);
      expect(addToCartErrorSectionProceed, findsOneWidget);
      await tester.tap(addToCartErrorSectionProceed);
      await tester.pumpAndSettle();
      verify(
        () => cartMockBloc.add(
          const CartEvent.clearCart(),
        ),
      ).called(1);
    });
    testWidgets(
        'Test CovidWarningMessageBottomSheet upsert cart call after processed button tap appeared when cart contains FOC materials',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );
      when(() => bundleAddToCartBloc.state).thenReturn(
        BundleAddToCartState.initial().copyWith(
          materialInfo: fakeBundle.copyWith.bundle(
            materials: [
              fakeBundleMaterials.first.copyWith(quantity: MaterialQty(10)),
              fakeBundleMaterials.last,
            ],
          ),
        ),
      );

      when(() => cartMockBloc.state).thenReturn(
        CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(isFOCMaterial: true),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final textField = find.descendant(
        of: find.byKey(
          WidgetKeys.bundleMaterialItem(
            fakeBundleMaterials.first.materialNumber.displayMatNo,
          ),
        ),
        matching: find.byKey(WidgetKeys.bundleQuantityTextKey),
      );
      await tester.tap(textField);
      await tester.enterText(textField, '15');
      expect(textField, findsWidgets);
      final sheetAddToCartButton =
          find.byKey(WidgetKeys.bundleAddToCartSheetSubmitButton);
      whenListen(
        cartMockBloc,
        Stream.fromIterable([
          CartState.initial().copyWith(
            isClearing: true,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo:
                    MaterialInfo.empty().copyWith(isFOCMaterial: true),
              ),
            ],
          ),
          CartState.initial(),
        ]),
      );
      await tester.tap(sheetAddToCartButton);
      await tester.pumpAndSettle();
      verify(
        () => cartMockBloc.add(
          CartEvent.upsertCartItems(
            priceAggregate: PriceAggregate.empty().copyWith(
              bundle: Bundle.empty().copyWith(
                materials: [
                  fakeBundleMaterials.first.copyWith(quantity: MaterialQty(10)),
                ],
                bundleCode: fakeBundle.materialNumber.getValue(),
                bundleName: BundleName(fakeBundle.defaultMaterialDescription),
              ),
            ),
          ),
        ),
      ).called(1);
    });

    testWidgets('Disable add to cart button when error message is showing',
        (tester) async {
      when(() => bundleAddToCartBloc.state).thenReturn(
        BundleAddToCartState.initial().copyWith(
          materialInfo: fakeBundle,
          showErrorMessage: true,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.byKey(WidgetKeys.addBundleInvalidQtyWarning),
        findsOneWidget,
      );
      final submitButton =
          find.byKey(WidgetKeys.bundleAddToCartSheetSubmitButton).first;
      expect(
        tester.widget<ElevatedButton>(submitButton).onPressed,
        null,
      );
      await tester.tap(submitButton);
      await tester.pump();
      verifyNever(
        () => bundleAddToCartBloc.add(
          const BundleAddToCartEvent.validateQuantity(showErrorMessage: true),
        ),
      );
    });

    testWidgets(
        'Show marketplace logo && Batch + Expriy date as NA when adding MP bundle to cart',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs:
              fakeMYSalesOrgConfigs.copyWith(enableBatchNumber: true),
        ),
      );
      when(() => bundleAddToCartBloc.state).thenReturn(
        BundleAddToCartState.initial().copyWith(
          materialInfo:
              fakeBundle.copyWith(isMarketPlace: true).copyWith.bundle(
            materials: [
              fakeBundleMaterials.first.copyWith(
                isMarketPlace: true,
                stockInfos: [
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('Yes'),
                    expiryDate: DateTimeStringValue('20240603'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.byType(MarketPlaceRectangleLogo),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(
            WidgetKeys.bundleMaterialItem(
              fakeBundleMaterials.first.materialNumber.displayMatNo,
            ),
          ),
          matching: find.textContaining(
            'Batch: NA - Expires: NA',
            findRichText: true,
          ),
        ),
        findsOne,
      );
    });
  });
}
