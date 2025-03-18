import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_list_local.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/bonus/bonus_items_sheet.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:universal_io/io.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class EligibilityBlockMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ConfigMock extends Mock implements Config {}

class BonusMaterialBlocMock
    extends MockBloc<BonusMaterialEvent, BonusMaterialState>
    implements BonusMaterialBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late Config config;
  late CartBloc cartBloc;
  late EligibilityBloc eligibilityBloc;
  late BonusMaterialBloc bonusMaterialBloc;
  late ProductImageBloc productImageBloc;
  final locator = GetIt.instance;
  late AppRouter appRouter;
  final eligibilityState = EligibilityState.initial().copyWith(
    salesOrganisation: fakeMYSalesOrganisation,
    salesOrgConfigs: fakeMYSalesOrgConfigs,
  );
  late List<MaterialInfo> bonusItemsList;
  late CartState cartState;
  late BonusMaterialState bonusMaterialState;
  late ProductImageState productImageState;
  late PriceAggregate priceAggregate;
  setUpAll(() async {
    HttpOverrides.global = null;
    locator.registerLazySingleton(() => config);
    config = ConfigMock();
    locator.registerLazySingleton(() => AppRouter());

    eligibilityBloc = EligibilityBlockMock();
    cartBloc = CartBlocMock();
    productImageBloc = ProductImageBlocMock();
    bonusMaterialBloc = BonusMaterialBlocMock();
    locator.registerFactory(() => bonusMaterialBloc);
    appRouter = locator<AppRouter>();
    cartState = CartState.initial();
    bonusMaterialState = BonusMaterialState.initial();
    productImageState = ProductImageState.initial();
    when(() => eligibilityBloc.state).thenReturn(
      eligibilityState,
    );
    when(() => cartBloc.state).thenReturn(
      cartState,
    );
    when(() => bonusMaterialBloc.state).thenReturn(
      bonusMaterialState,
    );
    when(() => productImageBloc.state).thenReturn(
      productImageState,
    );
    priceAggregate = (await CartLocalDataSource().getAddedToCartProductList())
        .cartProducts
        .first;
    bonusItemsList =
        await MaterialBundleListLocalDatasource().getMaterialBundleList();
  });
  Widget getWidgetToTest(PriceAggregate priceAggregate) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: appRouter,
      usingLocalization: true,
      providers: [
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBloc,
        ),
        BlocProvider<CartBloc>(
          create: (context) => cartBloc,
        ),
        BlocProvider<ProductImageBloc>(
          create: (context) => productImageBloc,
        ),
      ],
      child: Scaffold(
        body: BonusItemsSheet(
          cartProduct: priceAggregate,
        ),
      ),
    );
  }

  group('Test bonus items sheet', () {
    testWidgets('Should render successfully', (tester) async {
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pump();

      expect(find.byKey(WidgetKeys.bonusSampleSheet), findsOneWidget);
      expect(
        find.text(
          'Looks like you don’t have any bonus/sample items'.tr(),
        ),
        findsOneWidget,
      );
      expect(
        find.text(
          'Try adjusting the search or another product from cart.'.tr(),
        ),
        findsOneWidget,
      );
      await tester.pumpAndSettle();
    });
    testWidgets('Should show snackbar after add bonus to cart', (tester) async {
      whenListen(
        cartBloc,
        Stream.fromIterable(
          [
            cartState.copyWith(
              isUpserting: true,
            ),
            cartState,
          ],
        ),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pumpAndSettle();

      expect(
        find.byKey(
          WidgetKeys.customSnackBar,
        ),
        findsOneWidget,
      );
    });

    testWidgets('Should show bonus item list when fetch data successfully',
        (tester) async {
      when(() => cartBloc.state).thenReturn(
        cartState,
      );
      when(() => bonusMaterialBloc.state).thenReturn(
        bonusMaterialState.copyWith(
          isFetching: false,
          bonusItemList: bonusItemsList,
        ),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pumpAndSettle();

      expect(
        find.byKey(
          WidgetKeys.scrollList,
        ),
        findsOneWidget,
      );
    });
    testWidgets(
        'Should show error snackbar when bonusMaterialBloc fetch data failed',
        (tester) async {
      when(() => cartBloc.state).thenReturn(
        cartState,
      );
      when(() => bonusMaterialBloc.state).thenReturn(
        bonusMaterialState.copyWith(
          isFetching: false,
          bonusItemList: bonusItemsList,
        ),
      );
      whenListen(
        bonusMaterialBloc,
        Stream.fromIterable([
          bonusMaterialState.copyWith(failureOrSuccessOption: none()),
          bonusMaterialState.copyWith(
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fail'))),
          ),
        ]),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pumpAndSettle();

      expect(
        find.byKey(
          WidgetKeys.customSnackBar,
        ),
        findsOneWidget,
      );
    });
    testWidgets(
        'Should fetch product image bloc when bonusMaterialBloc fetch data success',
        (tester) async {
      when(() => cartBloc.state).thenReturn(
        cartState,
      );
      when(() => bonusMaterialBloc.state).thenReturn(
        bonusMaterialState.copyWith(
          isFetching: false,
          bonusItemList: bonusItemsList,
        ),
      );
      whenListen(
        bonusMaterialBloc,
        Stream.fromIterable([
          bonusMaterialState.copyWith(failureOrSuccessOption: none()),
          bonusMaterialState.copyWith(
            isFetching: false,
            bonusItemList: bonusItemsList,
            failureOrSuccessOption:
                optionOf(const Right(ApiFailure.accountExpired())),
          ),
        ]),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pumpAndSettle();

      verify(
        () => productImageBloc.add(
          ProductImageEvent.fetch(
            list: bonusItemsList,
          ),
        ),
      ).called(1);
    });
    testWidgets(
        'Should show loading animation when isFetching and bonusItemList empty',
        (tester) async {
      when(() => cartBloc.state).thenReturn(
        cartState,
      );
      when(() => bonusMaterialBloc.state).thenReturn(
        bonusMaterialState.copyWith(
          isFetching: true,
          bonusItemList: [],
        ),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pump();
      expect(
        find.byKey(
          WidgetKeys.loaderImage,
        ),
        findsOneWidget,
      );
    });
    testWidgets('Should fetch data again when pullToRefresh the scroll list',
        (tester) async {
      when(() => cartBloc.state).thenReturn(
        cartState,
      );
      when(() => bonusMaterialBloc.state).thenReturn(
        bonusMaterialState.copyWith(
          isFetching: false,
          bonusItemList: bonusItemsList,
        ),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pump();
      await tester.drag(
        find.byKey(WidgetKeys.scrollList),
        const Offset(0.0, 1000.0),
      );
      await tester.pumpAndSettle();

      verify(
        () => bonusMaterialBloc.add(
          BonusMaterialEvent.fetch(
            configs: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            principalData: cartState
                .findItemById(priceAggregate.id)
                .materialInfo
                .principalData,
            user: eligibilityState.user,
            isGimmickMaterialEnabled: false,
            searchKey: SearchKey.empty(),
          ),
        ),
      ).called(1);
    });
    testWidgets(
        'Should load more data again when scroll to the bot of the scroll list',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));

      when(() => cartBloc.state).thenReturn(
        cartState,
      );
      when(() => bonusMaterialBloc.state).thenReturn(
        bonusMaterialState.copyWith(
          isFetching: false,
          bonusItemList: bonusItemsList,
        ),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pump();
      await tester.fling(
        find.byKey(WidgetKeys.scrollList),
        const Offset(0.0, -3000.0),
        800.0,
      );
      await tester.pumpAndSettle();

      verify(
        () => bonusMaterialBloc.add(
          BonusMaterialEvent.loadMoreBonusItem(
            configs: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            principalData: cartState
                .findItemById(priceAggregate.id)
                .materialInfo
                .principalData,
            user: eligibilityState.user,
            isGimmickMaterialEnabled: false,
          ),
        ),
      ).called(1);
    });
    testWidgets(
        'Should show the bonus quantity empty warning if the qty is not validate',
        (tester) async {
      when(() => cartBloc.state).thenReturn(
        cartState,
      );
      when(() => bonusMaterialBloc.state).thenReturn(
        bonusMaterialState.copyWith(
          isFetching: false,
          bonusItemList: bonusItemsList,
          isBonusQtyValidated: false,
        ),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pump();
      await tester.drag(
        find.byKey(WidgetKeys.scrollList),
        const Offset(0.0, -2000.0),
      );
      await tester.pumpAndSettle();

      expect(
        find.byKey(
          WidgetKeys.bonusSampleSheetEmptyQtyWarning,
        ),
        findsOneWidget,
      );
    });
    testWidgets('Should fetch the data again when search', (tester) async {
      when(() => config.autoSearchTimeout).thenReturn(1500);
      when(() => cartBloc.state).thenReturn(
        cartState,
      );
      when(() => bonusMaterialBloc.state).thenReturn(
        bonusMaterialState.copyWith(
          isFetching: false,
          bonusItemList: bonusItemsList,
        ),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pump();
      final searchBar = find.byKey(
        WidgetKeys.searchBar,
      );
      expect(
        searchBar,
        findsOneWidget,
      );
      await tester.enterText(searchBar, 'dummy-text');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      verify(
        () => bonusMaterialBloc.add(
          BonusMaterialEvent.fetch(
            configs: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            principalData: priceAggregate.materialInfo.principalData,
            user: eligibilityState.user,
            isGimmickMaterialEnabled: false,
            searchKey: SearchKey.search('dummy-text'),
          ),
        ),
      ).called(1);
    });

    testWidgets('Should fetch the data again when autoSearch', (tester) async {
      when(() => config.autoSearchTimeout).thenReturn(1500);
      when(() => cartBloc.state).thenReturn(
        cartState,
      );
      when(() => bonusMaterialBloc.state).thenReturn(
        bonusMaterialState.copyWith(
          isFetching: false,
          bonusItemList: bonusItemsList,
        ),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pump();
      final searchBar = find.byKey(
        WidgetKeys.searchBar,
      );
      expect(
        searchBar,
        findsOneWidget,
      );
      await tester.enterText(searchBar, 'dummy-text');
      await tester.pumpAndSettle(
        Duration(milliseconds: locator<Config>().autoSearchTimeout),
      );
      verify(
        () => bonusMaterialBloc.add(
          BonusMaterialEvent.fetch(
            configs: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            principalData: priceAggregate.materialInfo.principalData,
            user: eligibilityState.user,
            isGimmickMaterialEnabled: false,
            searchKey: SearchKey.search('dummy-text'),
          ),
        ),
      ).called(1);
    });
    testWidgets(
        'Should rebuild the material image when productImageMap is change',
        (tester) async {
      whenListen(
        productImageBloc,
        Stream.fromIterable([
          productImageState,
          productImageState.copyWith(
            productImageMap: {
              priceAggregate.getMaterialNumber:
                  ProductImages.empty().copyWith(thumbNail: ''),
            },
          ),
        ]),
      );
      when(() => cartBloc.state).thenReturn(
        cartState,
      );
      when(() => bonusMaterialBloc.state).thenReturn(
        bonusMaterialState.copyWith(
          isFetching: false,
          bonusItemList: bonusItemsList,
        ),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pump();
      expect(find.byKey(WidgetKeys.productImage), findsAtLeastNWidgets(1));
    });
    testWidgets(
        'Should rebuild the quantity section upsertBonusItemInProgressHashCode is change',
        (tester) async {
      whenListen(
        productImageBloc,
        Stream.fromIterable([
          productImageState,
          productImageState.copyWith(
            productImageMap: {
              priceAggregate.getMaterialNumber:
                  ProductImages.empty().copyWith(thumbNail: ''),
            },
          ),
        ]),
      );
      whenListen(
        cartBloc,
        Stream.fromIterable([
          cartState,
          cartState.copyWith(
            upsertBonusItemInProgressHashCode: [1],
          ),
        ]),
      );
      when(() => cartBloc.state).thenReturn(
        cartState,
      );
      when(() => bonusMaterialBloc.state).thenReturn(
        bonusMaterialState.copyWith(
          isFetching: false,
          bonusItemList: bonusItemsList,
        ),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pump();
      expect(find.byType(CartItemQuantityInput), findsAtLeastNWidgets(1));
    });
    testWidgets('Should update bonus item quantity when field change',
        (tester) async {
      when(() => config.autoSearchTimeout).thenReturn(1500);
      whenListen(
        productImageBloc,
        Stream.fromIterable([
          productImageState,
          productImageState.copyWith(
            productImageMap: {
              priceAggregate.getMaterialNumber:
                  ProductImages.empty().copyWith(thumbNail: ''),
            },
          ),
        ]),
      );
      when(() => cartBloc.state).thenReturn(
        cartState,
      );
      when(() => bonusMaterialBloc.state).thenReturn(
        bonusMaterialState.copyWith(
          isFetching: false,
          bonusItemList: bonusItemsList,
        ),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pump();
      await tester.enterText(
        find.byKey(WidgetKeys.quantityInputTextKey).first,
        '1',
      );
      await tester.pumpAndSettle(
        Duration(milliseconds: locator<Config>().autoSearchTimeout),
      );
      verify(
        () => bonusMaterialBloc.add(
          BonusMaterialEvent.updateBonusItemQuantity(
            updatedBonusItem: bonusItemsList.first.copyWith(
              quantity: MaterialQty(1),
            ),
          ),
        ),
      ).called(1);
    });
    testWidgets('Should update bonus item quantity when press add quantity',
        (tester) async {
      when(() => config.autoSearchTimeout).thenReturn(1500);
      whenListen(
        productImageBloc,
        Stream.fromIterable([
          productImageState,
          productImageState.copyWith(
            productImageMap: {
              priceAggregate.getMaterialNumber:
                  ProductImages.empty().copyWith(thumbNail: ''),
            },
          ),
        ]),
      );
      when(() => cartBloc.state).thenReturn(
        cartState,
      );
      when(() => bonusMaterialBloc.state).thenReturn(
        bonusMaterialState.copyWith(
          isFetching: false,
          bonusItemList: bonusItemsList,
        ),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pump();
      await tester.tap(
        find.byKey(WidgetKeys.increaseQuantityKey).first,
      );
      await tester.pumpAndSettle();
      verify(
        () => bonusMaterialBloc.add(
          BonusMaterialEvent.updateBonusItemQuantity(
            updatedBonusItem: bonusItemsList.first.copyWith(
              quantity: MaterialQty(1),
            ),
          ),
        ),
      ).called(1);
    });
    testWidgets('Should update bonus item quantity when press delete quantity',
        (tester) async {
      when(() => config.autoSearchTimeout).thenReturn(1500);
      whenListen(
        productImageBloc,
        Stream.fromIterable([
          productImageState,
          productImageState.copyWith(
            productImageMap: {
              priceAggregate.getMaterialNumber:
                  ProductImages.empty().copyWith(thumbNail: ''),
            },
          ),
        ]),
      );
      when(() => cartBloc.state).thenReturn(
        cartState,
      );
      when(() => bonusMaterialBloc.state).thenReturn(
        bonusMaterialState.copyWith(
          isFetching: false,
          bonusItemList: bonusItemsList,
        ),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pump();
      await tester.enterText(
        find.byKey(WidgetKeys.quantityInputTextKey).first,
        '10',
      );
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(WidgetKeys.decreaseQuantityKey).first,
      );
      await tester.pumpAndSettle();
      verify(
        () => bonusMaterialBloc.add(
          BonusMaterialEvent.updateBonusItemQuantity(
            updatedBonusItem: bonusItemsList.first.copyWith(
              quantity: MaterialQty(9),
            ),
          ),
        ),
      ).called(1);
    });
    testWidgets('Should update bonus item quantity when press submit quantity',
        (tester) async {
      when(() => config.autoSearchTimeout).thenReturn(1500);
      whenListen(
        productImageBloc,
        Stream.fromIterable([
          productImageState,
          productImageState.copyWith(
            productImageMap: {
              priceAggregate.getMaterialNumber:
                  ProductImages.empty().copyWith(thumbNail: ''),
            },
          ),
        ]),
      );
      when(() => cartBloc.state).thenReturn(
        cartState,
      );
      when(() => bonusMaterialBloc.state).thenReturn(
        bonusMaterialState.copyWith(
          isFetching: false,
          bonusItemList: bonusItemsList,
        ),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pump();
      await tester.enterText(
        find.byKey(WidgetKeys.quantityInputTextKey).first,
        '10',
      );
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      verify(
            () => bonusMaterialBloc.add(
              BonusMaterialEvent.updateBonusItemQuantity(
                updatedBonusItem: bonusItemsList.first.copyWith(
                  quantity: MaterialQty(10),
                ),
              ),
            ),
          ).callCount >
          0;
    });

    testWidgets('max input limit 99999', (tester) async {
      const bonusMaxQuantity = 99999;
      when(() => cartBloc.state).thenReturn(
        cartState.copyWith(
          cartProducts: [priceAggregate],
        ),
      );

      final bonusMaterialBlocState = bonusMaterialState.copyWith(
        bonusItemList: bonusItemsList
            .map((e) => e.copyWith(quantity: MaterialQty(bonusMaxQuantity)))
            .toList(),
      );
      when(() => bonusMaterialBloc.state).thenReturn(
        bonusMaterialBlocState,
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.cartButton).first);
      await tester.pumpAndSettle();
      verify(
        () => cartBloc.add(
          CartEvent.addBonusToCartItem(
            bonusMaterial: bonusItemsList.first.copyWith(
              parentID: priceAggregate.materialInfo.materialNumber
                  .getOrDefaultValue(''),
              quantity: priceAggregate.totalCartProductBonusQty(
                StringValue(''),
                MaterialQty(99999),
              ),
              type: MaterialInfoType('Bonus'),
            ),
            counterOfferDetails: RequestCounterOfferDetails.empty(),
            bonusItemId: StringValue(''),
          ),
        ),
      ).called(1);
    });

    testWidgets('max input 5 digit', (tester) async {
      when(() => bonusMaterialBloc.state).thenReturn(
        bonusMaterialState.copyWith(
          bonusItemList: bonusItemsList,
        ),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pump();
      await tester.enterText(
        find.byKey(WidgetKeys.quantityInputTextKey).first,
        '9999999',
      );
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      verifyNever(
        () => bonusMaterialBloc.add(
          BonusMaterialEvent.updateBonusItemQuantity(
            updatedBonusItem: bonusItemsList.first.copyWith(
              quantity: MaterialQty(9999999),
            ),
          ),
        ),
      );
      verify(
            () => bonusMaterialBloc.add(
              BonusMaterialEvent.updateBonusItemQuantity(
                updatedBonusItem: bonusItemsList.first.copyWith(
                  quantity: MaterialQty(99999),
                ),
              ),
            ),
          ).callCount >
          0;
    });
    testWidgets('Should add bonus material when press cart icon button',
        (tester) async {
      when(() => cartBloc.state).thenReturn(
        cartState,
      );
      when(() => bonusMaterialBloc.state).thenReturn(
        bonusMaterialState.copyWith(
          isFetching: false,
          bonusItemList: [
            bonusItemsList.first.copyWith(quantity: MaterialQty(1)),
          ],
        ),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));

      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.cartButton).first);
      verify(
            () => bonusMaterialBloc.add(
              BonusMaterialEvent.validateBonusQuantity(
                bonusMaterial:
                    bonusItemsList.first.copyWith(quantity: MaterialQty(1)),
              ),
            ),
          ).callCount >
          0;
    });
    testWidgets('Search bar should display keyword same as searchKey state',
        (tester) async {
      const searchKey = 'fake-search-key';

      whenListen(
        bonusMaterialBloc,
        Stream.fromIterable([
          bonusMaterialState.copyWith(
            searchKey: SearchKey.search(searchKey),
          ),
        ]),
      );
      await tester.pumpWidget(getWidgetToTest(priceAggregate));
      await tester.pumpAndSettle();
      final searchField =
          tester.widget<TextFormField>(find.byKey(WidgetKeys.searchBar));
      expect(searchField.controller?.text, searchKey);
    });
  });
}
