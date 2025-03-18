import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/bundle/add_to_cart/bundle_add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_rectangle_logo.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/bundle_details/bundle_detail_page.dart';
import 'package:ezrxmobile/presentation/products/bundle_details/widget/bundle_material_descriptions_sheet.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common_mock_data/customer_code_mock.dart';
import '../../common_mock_data/mock_bloc.dart';
import '../../common_mock_data/mock_other.dart';
import '../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  final materialListMockBloc = MaterialListBlocMock();
  late ProductDetailBloc productDetailMockBloc;
  final mockProductImageBloc = ProductImageBlocMock();
  final materialPriceMockBloc = MaterialPriceBlocMock();
  late EligibilityBlocMock eligibilityBlocMock;
  late CartBloc cartMockBloc;
  late AppRouter autoRouterMock;
  late MaterialInfo bundle;
  late BundleAddToCartBloc bundleAddToCartBloc;
  late MaterialResponse materialResponseMock;
  //////////////////////Finder//////////////////////////////////////////////////
  final bundleImage = find.byKey(WidgetKeys.bundleImage);
  final bundleDetailsCarousel = find.byKey(WidgetKeys.bundleDetailsCarousel);
  final materialDetailsImageCounterFinder =
      find.byKey(WidgetKeys.materialDetailsImageCounter);
  final bundleOfferMaterialInfo =
      find.byKey(WidgetKeys.bundleOfferMaterialInfo);
  final bundleMaterialDescriptionBottomSheet =
      find.byKey(WidgetKeys.bundleMaterialDescriptionBottomSheet);
  final favoritesIcon = find.byKey(WidgetKeys.favoritesIcon);
  final materialDetailsAddToCartButton =
      find.byKey(WidgetKeys.materialDetailsAddToCartButton);
  final bundleAddToCartSheet = find.byKey(WidgetKeys.bundleAddToCartSheet);
  final bundleInputAddKey = find.byKey(WidgetKeys.bundleInputAddKey);
  final bundleInputDeleteKey = find.byKey(WidgetKeys.bundleInputDeleteKey);
  final bundleQuantityTextKey = find.byKey(WidgetKeys.bundleQuantityTextKey);
  final bundleAddToCartSheetSubmitButton =
      find.byKey(WidgetKeys.bundleAddToCartSheetSubmitButton);
  final materialDetailsFloatingButton =
      find.byKey(WidgetKeys.scrollToTopFloatingButton);

  /////////////////////////////////////////////////////////////////////////////

  setUpAll(() async {
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    locator.registerSingleton<ClevertapService>(ClevertapServiceMock());
    locator.registerFactory<ProductDetailBloc>(() => productDetailMockBloc);
    materialResponseMock = await MaterialListLocalDataSource().getProductList();
    bundle = MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('fake-bundle'),
      type: MaterialInfoType('bundle'),
      bundle: Bundle.empty().copyWith(
        materials: <MaterialInfo>[
          MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('bundle-material-1'),
          ),
          MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('bundle-material-2'),
          ),
        ],
        bundleInformation: [
          BundleInfo.empty().copyWith(
            quantity: 5,
            rate: 200,
            sequence: 1,
          ),
          BundleInfo.empty().copyWith(
            quantity: 15,
            rate: 120,
            sequence: 7,
          ),
          BundleInfo.empty().copyWith(
            quantity: 10,
            rate: 180,
            sequence: 4,
          ),
        ],
      ),
    );
  });

  group(
    'Bundle Details Page',
    () {
      setUp(() {
        cartMockBloc = CartBlocMock();
        eligibilityBlocMock = EligibilityBlocMock();
        autoRouterMock = AutoRouteMock();
        productDetailMockBloc = ProductDetailBlocMock();
        bundleAddToCartBloc = BundleAddToCartBlocMock();
        when(() => eligibilityBlocMock.state)
            .thenReturn(EligibilityState.initial().copyWith());
        when(() => materialListMockBloc.state)
            .thenReturn(MaterialListState.initial());
        when(() => productDetailMockBloc.state)
            .thenReturn(ProductDetailState.initial());
        when(() => mockProductImageBloc.state)
            .thenReturn(ProductImageState.initial());
        when(() => materialPriceMockBloc.state)
            .thenReturn(MaterialPriceState.initial());
        when(() => cartMockBloc.state).thenReturn(CartState.initial());
        when(() => autoRouterMock.stack).thenReturn([MaterialPageXMock()]);
        when(() => productDetailMockBloc.state)
            .thenReturn(ProductDetailState.initial());
        when(() => bundleAddToCartBloc.state)
            .thenReturn(BundleAddToCartState.initial());
        when(() => autoRouterMock.maybePop())
            .thenAnswer((invocation) async => true);
        when(() => autoRouterMock.popForced())
            .thenAnswer((invocation) async => true);
      });

      Widget getScopedWidget() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          usingLocalization: true,
          useMediaQuery: false,
          providers: [
            BlocProvider<EligibilityBloc>(
              create: ((context) => eligibilityBlocMock),
            ),
            BlocProvider<MaterialListBloc>(
              create: ((context) => materialListMockBloc),
            ),
            BlocProvider<ProductDetailBloc>(
              create: ((context) => productDetailMockBloc),
            ),
            BlocProvider<ProductImageBloc>(
              create: (context) => mockProductImageBloc,
            ),
            BlocProvider<MaterialPriceBloc>(
              create: ((context) => materialPriceMockBloc),
            ),
            BlocProvider<CartBloc>(
              create: ((context) => cartMockBloc),
            ),
            BlocProvider<ProductDetailBloc>(
              create: (context) => productDetailMockBloc,
            ),
            BlocProvider<BundleAddToCartBloc>(
              create: ((context) => bundleAddToCartBloc),
            ),
          ],
          child: BundleDetailPage(materialInfo: bundle),
        );
      }

      testWidgets('Bundle is Empty Image  not available', (tester) async {
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              isDetailFetching: true,
              productDetailAggregate: ProductDetailAggregate.empty(),
            ),
            ProductDetailState.initial().copyWith(
              isDetailFetching: false,
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  type: MaterialInfoType('bundle'),
                ),
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(bundleImage, findsOneWidget);
        expect(bundleDetailsCarousel, findsNothing);
        expect(materialDetailsImageCounterFinder, findsNothing);
      });

      testWidgets('Product Image available', (tester) async {
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              isDetailFetching: true,
              productDetailAggregate: ProductDetailAggregate.empty(),
            ),
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: bundle,
              ),
            ),
          ],
        );
        when(() => mockProductImageBloc.state).thenReturn(
          ProductImageState.initial().copyWith(
            productImageMap: <MaterialNumber, ProductImages>{
              for (final material in bundle.bundle.materials)
                material.materialNumber: ProductImages.empty()
                    .copyWith(materialNumber: material.materialNumber),
            },
          ),
        );
        whenListen(productDetailMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(bundleImage, findsOneWidget);
        expect(bundleDetailsCarousel, findsOneWidget);
        expect(materialDetailsImageCounterFinder, findsOneWidget);
        final selectedCarouselImageKeyFinder =
            find.byKey(const ValueKey('selectedbundle-material-1true'));
        expect(selectedCarouselImageKeyFinder, findsOneWidget);
      });

      testWidgets('Wrong currency visible in bundle details page',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              currency: Currency('SGD'),
            ),
          ),
        );

        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: bundle,
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.bundleOfferPrice),
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -500),
        );
        await tester.pumpAndSettle();
        final price = find.text('SGD 200.00 per item', findRichText: true);
        expect(price, findsOneWidget);
      });

      testWidgets(
          'Test Bundle maximum discount value displayed in last sequence',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              currency: Currency('SGD'),
            ),
          ),
        );

        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: bundle,
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.bundleOfferPrice),
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -500),
        );
        final balanceTextRowFinder = find.byType(BalanceTextRow);
        expect(balanceTextRowFinder, findsNWidgets(3));
        expect(
          find.descendant(
            of: find.byType(BalanceTextRow).last,
            matching:
                find.textContaining('SGD 120.00 per item', findRichText: true),
          ),
          findsOneWidget,
        );
      });

      testWidgets('display material Name with respect to Material Number',
          (tester) async {
        when(() => mockProductImageBloc.state).thenReturn(
          ProductImageState.initial().copyWith(
            productImageMap: <MaterialNumber, ProductImages>{
              for (final material in bundle.bundle.materials)
                material.materialNumber: ProductImages.empty()
                    .copyWith(materialNumber: material.materialNumber),
            },
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: bundle,
            ),
            selectedImageIndex: 0,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(bundleImage, findsOneWidget);
        expect(bundleDetailsCarousel, findsOneWidget);
        expect(materialDetailsImageCounterFinder, findsOneWidget);
        final carouselImageKeyFinder1 =
            find.byKey(const ValueKey('selectedbundle-material-1true'));
        expect(carouselImageKeyFinder1, findsOneWidget);
        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.bundleOfferPrice),
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -500),
        );
        await tester.tap(carouselImageKeyFinder1);
        verify(
          () => productDetailMockBloc.add(
            ProductDetailEvent.changeImage(0),
          ),
        ).called(1);
        expect(
          find.byKey(
            WidgetKeys.bundleMaterialItemDescription(
              bundle.bundle.materials.first.displayDescription,
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets('scroll test', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: bundle,
            ),
            selectedImageIndex: 0,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.fling(
          find.byKey(WidgetKeys.bundleDetailPage),
          const Offset(0.0, -1000.0),
          1000.0,
        );
        expect(materialDetailsFloatingButton, findsOneWidget);
        await tester.tap(materialDetailsFloatingButton);
        await tester.pumpAndSettle();
        expect(materialDetailsFloatingButton, findsNothing);
      });
      testWidgets('check Material information', (tester) async {
        await tester.binding.setSurfaceSize(const Size(480, 900));
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: bundle,
            ),
            selectedImageIndex: 0,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.bundleOfferPrice),
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -500),
        );
        expect(bundleOfferMaterialInfo, findsOneWidget);
        await tester.tap(bundleOfferMaterialInfo.first);
        await tester.pumpAndSettle();
        expect(bundleMaterialDescriptionBottomSheet, findsOneWidget);
        expect(
          find.descendant(
            of: find.byType(BundleMaterialDescription),
            matching: find.text('Material information'),
          ),
          findsOneWidget,
        );
        final bundleCode =
            find.byKey(WidgetKeys.balanceTextRow('Bundle Code', 'fake-bundle'));
        expect(bundleCode, findsOneWidget);
        final manufacturer =
            find.byKey(WidgetKeys.balanceTextRow('Manufacturer', ''));
        expect(manufacturer, findsOneWidget);
        final closeButton = find.descendant(
          of: find.byType(ElevatedButton),
          matching: find.text(
            'Close',
          ),
        );
        expect(closeButton, findsOneWidget);
        await tester.tap(closeButton);
        verify(() => autoRouterMock.maybePop()).called(1);
      });

      testWidgets('test favourite', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: bundle,
            ),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.bundleOfferPrice),
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -500),
        );
        expect(favoritesIcon, findsOneWidget);
        await tester.tap(favoritesIcon);
        verify(
          () => productDetailMockBloc.add(
            ProductDetailEvent.addFavourite(
              isForSimilarProduct: false,
              materialNumber: bundle.materialNumber,
            ),
          ),
        ).called(1);
      });

      testWidgets('test unfavourite', (tester) async {
        when(
          () => autoRouterMock.currentPath,
        ).thenAnswer((invocation) => 'orders/bundle_detail');
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: bundle.copyWith(
                isFavourite: true,
              ),
            ),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.bundleOfferPrice),
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -500),
        );
        expect(favoritesIcon, findsOneWidget);
        await tester.tap(favoritesIcon);
        await tester.pumpWidget(getScopedWidget());
        verify(
          () => productDetailMockBloc.add(
            ProductDetailEvent.deleteFavourite(
              isForSimilarProduct: false,
              materialNumber: bundle.materialNumber,
            ),
          ),
        ).called(1);
      });

      testWidgets('remove bundle item quantity test', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: bundle,
            ),
          ),
        );
        when(() => bundleAddToCartBloc.state).thenReturn(
          BundleAddToCartState.initial().copyWith.materialInfo.bundle(
                materials: bundle.bundle.materials
                    .map(
                      (e) => e.copyWith(
                        quantity: MaterialQty(2),
                        stockInfos: [
                          StockInfo.empty().copyWith(
                            inStock: MaterialInStock('Yes'),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(materialDetailsAddToCartButton, findsOneWidget);
        await tester.tap(materialDetailsAddToCartButton);
        await tester.pumpAndSettle();
        verify(
          () => bundleAddToCartBloc.add(
            BundleAddToCartEvent.set(bundle: bundle),
          ),
        ).called(1);
        expect(bundleAddToCartSheet, findsOneWidget);
        for (final i in bundle.bundle.materials) {
          expect(
            find.byKey(
              WidgetKeys.bundleMaterialItem(
                i.materialNumber.displayMatNo,
              ),
            ),
            findsWidgets,
          );
        }
        expect(bundleQuantityTextKey, findsWidgets);
        await tester.enterText(bundleQuantityTextKey.first, '2');
        expect(bundleInputAddKey, findsWidgets);
        expect(bundleInputDeleteKey, findsWidgets);
        await tester.tap(bundleInputDeleteKey.first);
        await tester.pumpAndSettle();
        verify(
          () => bundleAddToCartBloc.add(
            BundleAddToCartEvent.updateQuantity(
              materialNumber: bundle.bundle.materials.first.materialNumber,
              quantity: 1,
            ),
          ),
        ).called(1);
        expect(bundleAddToCartSheetSubmitButton, findsOneWidget);
        await tester.tap(bundleAddToCartSheetSubmitButton);
        verify(
          () => bundleAddToCartBloc.add(
            const BundleAddToCartEvent.validateQuantity(
              showErrorMessage: false,
            ),
          ),
        ).called(2);
      });

      testWidgets('add bundle item quantity test', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: bundle,
            ),
          ),
        );
        when(() => bundleAddToCartBloc.state).thenReturn(
          BundleAddToCartState.initial().copyWith.materialInfo.bundle(
                materials: bundle.bundle.materials
                    .map(
                      (e) => e.copyWith(
                        stockInfos: [
                          StockInfo.empty().copyWith(
                            inStock: MaterialInStock('Yes'),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(materialDetailsAddToCartButton, findsOneWidget);
        await tester.tap(materialDetailsAddToCartButton);
        await tester.pumpAndSettle();
        verify(
          () => bundleAddToCartBloc.add(
            BundleAddToCartEvent.set(
              bundle: bundle,
            ),
          ),
        ).called(1);
        expect(bundleAddToCartSheet, findsOneWidget);
        for (final i in bundle.bundle.materials) {
          expect(
            find.byKey(
              WidgetKeys.bundleMaterialItem(
                i.materialNumber.displayMatNo,
              ),
            ),
            findsWidgets,
          );
        }
        expect(bundleInputAddKey, findsWidgets);
        expect(bundleInputDeleteKey, findsWidgets);
        await tester.tap(bundleInputAddKey.first);
        await tester.pumpAndSettle();
        verify(
          () => bundleAddToCartBloc.add(
            BundleAddToCartEvent.updateQuantity(
              materialNumber: bundle.bundle.materials.first.materialNumber,
              quantity: 1,
            ),
          ),
        ).called(1);
        final cancelButton = find.descendant(
          of: find.byType(OutlinedButton),
          matching: find.text('Cancel'),
        );
        expect(cancelButton, findsOneWidget);
        await tester.tap(cancelButton);
        verify(() => autoRouterMock.maybePop()).called(1);
      });

      testWidgets('on cart existing bundle item quantity test', (tester) async {
        await tester.binding.setSurfaceSize(const Size(480, 900));

        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: bundle,
            ),
          ),
        );
        when(() => cartMockBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(bundle: bundle.bundle),
            ],
          ),
        );
        when(() => bundleAddToCartBloc.state).thenReturn(
          BundleAddToCartState.initial().copyWith.materialInfo.bundle(
                materials: bundle.bundle.materials
                    .map(
                      (e) => e.copyWith(
                        quantity: MaterialQty(2),
                        stockInfos: [
                          StockInfo.empty().copyWith(
                            inStock: MaterialInStock('Yes'),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(materialDetailsAddToCartButton, findsOneWidget);
        await tester.tap(materialDetailsAddToCartButton);
        await tester.pumpAndSettle();
        verify(
          () => bundleAddToCartBloc.add(
            BundleAddToCartEvent.set(
              bundle: bundle,
            ),
          ),
        ).called(1);
        expect(bundleAddToCartSheet, findsOneWidget);
        for (final i in bundle.bundle.materials) {
          expect(
            find.byKey(
              WidgetKeys.bundleMaterialItem(
                i.materialNumber.displayMatNo,
              ),
            ),
            findsWidgets,
          );
        }

        expect(bundleQuantityTextKey, findsWidgets);
        await tester.enterText(bundleQuantityTextKey.first, '2');
        expect(bundleInputAddKey, findsWidgets);
        expect(bundleInputDeleteKey, findsWidgets);

        await tester.tap(bundleInputDeleteKey.first);
        await tester.pumpAndSettle();
        verify(
          () => bundleAddToCartBloc.add(
            BundleAddToCartEvent.updateQuantity(
              materialNumber: bundle.bundle.materials.first.materialNumber,
              quantity: 1,
            ),
          ),
        ).called(1);
        // test on insert empty text input
        await tester.enterText(bundleQuantityTextKey.first, '');
        verifyNever(
          () => bundleAddToCartBloc.add(
            BundleAddToCartEvent.updateQuantity(
              materialNumber: bundle.bundle.materials.first.materialNumber,
              quantity: 1,
            ),
          ),
        );
        expect(bundleAddToCartSheetSubmitButton, findsOneWidget);
        await tester.tap(bundleAddToCartSheetSubmitButton);
      });

      testWidgets('upsertcart with bundle item test', (tester) async {
        when(
          () => autoRouterMock.currentPath,
        ).thenAnswer((invocation) => 'orders/bundle_detail');

        final expectedStates = Stream.fromIterable(
          [
            CartState.initial().copyWith(
              isUpserting: true,
              cartProducts: [
                PriceAggregate.empty().copyWith(bundle: bundle.bundle),
              ],
            ),
            CartState.initial().copyWith(
              cartProducts: [
                PriceAggregate.empty().copyWith(bundle: bundle.bundle),
              ],
            ),
          ],
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(materialDetailsAddToCartButton, findsOneWidget);
        whenListen(cartMockBloc, expectedStates);
        await tester.tap(materialDetailsAddToCartButton);
        await tester.pumpAndSettle();
        verify(() => autoRouterMock.popForced()).called(1);
        expect(
          find.descendant(
            of: find.byType(CustomSnackBar),
            matching: find.text('Bundle has been added to cart.'),
          ),
          findsOneWidget,
        );
      });

      testWidgets('upsertcart with bundle item fail test', (tester) async {
        when(
          () => autoRouterMock.currentPath,
        ).thenAnswer((invocation) => 'orders/bundle_detail');

        final expectedStates = Stream.fromIterable(
          [
            CartState.initial().copyWith(
              isUpserting: true,
              cartProducts: [
                PriceAggregate.empty().copyWith(bundle: bundle.bundle),
              ],
            ),
            CartState.initial().copyWith(
              cartProducts: [
                PriceAggregate.empty().copyWith(bundle: bundle.bundle),
              ],
              apiFailureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('fake-error'),
                ),
              ),
            ),
          ],
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(materialDetailsAddToCartButton, findsOneWidget);
        whenListen(cartMockBloc, expectedStates);
        await tester.tap(materialDetailsAddToCartButton);
        await tester.pumpAndSettle();
        verify(() => autoRouterMock.maybePop()).called(1);
      });

      testWidgets('Test full bundle code displayed in bundle details page',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialResponseMock.products[12],
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        final price =
            find.text(materialResponseMock.products[12].bundle.bundleCode);
        expect(price, findsOneWidget);
      });

      testWidgets('Find marketplace logo and seller name MP bundle detail',
          (tester) async {
        final mpBundle = materialResponseMock.products
            .firstWhere((e) => e.type.typeBundle && e.isMarketPlace)
            .copyWith
            .bundle(
          materials: [MaterialInfo.empty()],
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mpBundle,
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(find.byType(MarketPlaceRectangleLogo), findsOne);
        final materialInformationTile =
            find.byKey(WidgetKeys.bundleOfferMaterialInfo);
        await tester.dragUntilVisible(
          materialInformationTile,
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -300),
        );
        await tester.pump();
        expect(
          find.descendant(
            of: materialInformationTile,
            matching: find.text('Bundle code, Sold by'),
          ),
          findsOne,
        );
        await tester.tap(materialInformationTile);
        await tester.pump();
        expect(
          find.byKey(
            WidgetKeys.balanceTextRow('Sold by', mpBundle.getManufactured),
          ),
          findsOne,
        );
      });

      testWidgets(
        ' -> Find edi if customer info status is edi',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              customerCodeInfo: fakeEDICustomerCodeInfo,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final ediBanner = find.byKey(WidgetKeys.ediUserBanner);
          final ediBannerTitle = find.text('You are an EDI customer.');
          final ediBannerSubTitle = find.text(
            'Ordering is disabled on eZRx+, please place your orders through the EDI system only.',
          );
          expect(ediBanner, findsOneWidget);
          expect(ediBannerTitle, findsOneWidget);
          expect(ediBannerSubTitle, findsOneWidget);
          expect(materialDetailsAddToCartButton, findsOneWidget);
          await tester.tap(materialDetailsAddToCartButton);

          expect(
            tester
                .widget<ElevatedButton>(materialDetailsAddToCartButton)
                .enabled,
            isFalse,
          );
        },
      );

      testWidgets(
        ' -> Not Find edi if customer info status is not edi',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final ediBanner = find.byKey(WidgetKeys.ediUserBanner);
          final ediBannerTitle = find.text('You are an EDI customer.');
          final ediBannerSubTitle = find.text(
            'Ordering is disabled on eZRx+, please place your orders through the EDI system only.',
          );
          expect(ediBanner, findsNothing);
          expect(ediBannerTitle, findsNothing);
          expect(ediBannerSubTitle, findsNothing);

          expect(materialDetailsAddToCartButton, findsOneWidget);
          await tester.tap(materialDetailsAddToCartButton);

          expect(
            tester
                .widget<ElevatedButton>(materialDetailsAddToCartButton)
                .enabled,
            isTrue,
          );
        },
      );
    },
  );
}
