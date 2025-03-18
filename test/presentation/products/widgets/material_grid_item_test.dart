import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/favorite_icon.dart';
import 'package:ezrxmobile/presentation/core/list_price_strike_through_component.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/product_price_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/widgets/covid_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/material_grid_item.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_label.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late ProductImageBlocMock productImageBlocMock;
  late MaterialPriceBlocMock materialPriceBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late CartBlocMock cartBlocMock;
  late AppRouter autoRouterMock;
  late MaterialInfo zpMaterialInfoMock;
  late List<MaterialInfo> listMaterialInfo;
  setUpAll(() async {
    locator.registerFactory(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    listMaterialInfo =
        (await MaterialListLocalDataSource().getProductList()).products;
    zpMaterialInfoMock = listMaterialInfo.firstWhere((e) => !e.isMarketPlace);
    HttpOverrides.global = null;
  });

  group('Test "Material Grid Item"', () {
    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      productImageBlocMock = ProductImageBlocMock();
      materialPriceBlocMock = MaterialPriceBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      cartBlocMock = CartBlocMock();
      when(() => productImageBlocMock.state)
          .thenReturn(ProductImageState.initial());
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
    });

    Widget getScopedWidget({MaterialInfo? materialInfo}) {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<ProductImageBloc>(
            create: (context) => productImageBlocMock,
          ),
          BlocProvider<CartBloc>(
            create: (context) => cartBlocMock,
          ),
          BlocProvider<MaterialPriceBloc>(
            create: (context) => materialPriceBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: Material(
          child: MaterialGridItem(
            materialInfo: materialInfo ?? zpMaterialInfoMock,
            onFavouriteTap: () {},
            onTap: () {},
          ),
        ),
      );
    }

    testWidgets(
      '=> Test display',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(find.byType(ProductImage), findsOneWidget);
        expect(find.byType(OfferLabel), findsOneWidget);
        expect(find.byType(StockLabel), findsOneWidget);
        expect(find.byType(CovidLabel), findsOneWidget);
        expect(find.byType(FavouriteIcon), findsOneWidget);
        expect(
          find.text(zpMaterialInfoMock.materialNumber.displayMatNo),
          findsOneWidget,
        );
        expect(
          find.text(zpMaterialInfoMock.displayDescription),
          findsOneWidget,
        );
        expect(find.text(zpMaterialInfoMock.getManufactured), findsOneWidget);
        expect(find.byType(ProductPriceLabel), findsOneWidget);
      },
    );

    testWidgets(
        'List price strike through price visible, if final price is less than list price && enableListPrice = true',
        (tester) async {
      final finalPrice = MaterialPrice(80);
      final listPrice = MaterialPrice(100);
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeVNSalesOrgConfigs,
        ),
      );
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          materialPrice: {
            zpMaterialInfoMock.materialNumber: Price.empty().copyWith(
              lastPrice: listPrice,
              finalPrice: finalPrice,
              materialNumber: zpMaterialInfoMock.materialNumber,
            ),
          },
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
    });

    testWidgets(
        'List price strike through price not visible, if final price is less than list price && enableListPrice = false',
        (tester) async {
      final finalPrice = MaterialPrice(80);
      final listPrice = MaterialPrice(100);
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          materialPrice: {
            zpMaterialInfoMock.materialNumber: Price.empty().copyWith(
              lastPrice: listPrice,
              finalPrice: finalPrice,
              materialNumber: zpMaterialInfoMock.materialNumber,
            ),
          },
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
    });

    testWidgets(
      'List price strike through price not visible, if final price is greater than and equal to list price && enableListPrice = true',
      (tester) async {
          final finalPrice = MaterialPrice(200);
          final listPrice = MaterialPrice(100);
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeIDSalesOrgConfigs,
            ),
          );
          when(() => materialPriceBlocMock.state).thenReturn(
            MaterialPriceState.initial().copyWith(
              materialPrice: {
                zpMaterialInfoMock.materialNumber: Price.empty().copyWith(
                  lastPrice: listPrice,
                  finalPrice: finalPrice,
                  materialNumber: zpMaterialInfoMock.materialNumber,
                ),
              },
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
        });

    testWidgets(
      'Show tender tender tag',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeVNSalesOrganisation,
            salesOrgConfigs: fakeVNSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(
          getScopedWidget(
            materialInfo: MaterialInfo.empty().copyWith(
              hasValidTenderContract: true,
            ),
          ),
        );
        await tester.pump();

        expect(
          find.text(
            'Tender Available'.tr(),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Show IRN when enableIRN is true',
      (tester) async {
        const iRNNumber = '12C 234/11';

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeTHSalesOrganisation,
            salesOrgConfigs: fakeTHSalesOrgConfigs.copyWith(
              enableIRN: true,
            ),
          ),
        );
        await tester.pumpWidget(
          getScopedWidget(
            materialInfo: MaterialInfo.empty().copyWith(
              itemRegistrationNumber: ItemRegistrationNumber(iRNNumber),
            ),
          ),
        );
        await tester.pump();

        expect(find.byKey(WidgetKeys.itemRegistrationNumber), findsOneWidget);

        expect(find.text(iRNNumber), findsOneWidget);
      },
    );

    testWidgets(
      'Do not show IRN when enableIRN is false',
      (tester) async {
        const iRNNumber = '12C 234/11';

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeTHSalesOrganisation,
            salesOrgConfigs: fakeTHSalesOrgConfigs.copyWith(
              enableIRN: false,
            ),
          ),
        );
        await tester.pumpWidget(
          getScopedWidget(
            materialInfo: MaterialInfo.empty().copyWith(
              itemRegistrationNumber: ItemRegistrationNumber(iRNNumber),
            ),
          ),
        );
        await tester.pump();

        expect(find.byKey(WidgetKeys.itemRegistrationNumber), findsNothing);

        expect(find.text(iRNNumber), findsNothing);
      },
    );
    group('MarketPlace', () {
      testWidgets(
          'should display MarketPlaceLogo + sold to as prefix to manufacturer when isMarketPlace is true',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          getScopedWidget(
            materialInfo:
                listMaterialInfo.firstWhere((element) => element.isMarketPlace),
          ),
        );
        await tester.pump();
        expect(find.byType(MarketPlaceLogo), findsOneWidget);
        final manufacturerText = tester
                .widget<Text>(find.byKey(WidgetKeys.manufacturerMaterials))
                .data ??
            '';

        expect(manufacturerText.startsWith('Sold by: '), true);
      });
      testWidgets(
          'should not display MarketPlaceLogo + sold to as prefix to manufacturer when isMarketPlace is false',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          getScopedWidget(
            materialInfo: listMaterialInfo
                .firstWhere((element) => !element.isMarketPlace),
          ),
        );
        await tester.pump();
        expect(find.byType(MarketPlaceLogo), findsNothing);
        final manufacturerText = tester
                .widget<Text>(find.byKey(WidgetKeys.manufacturerMaterials))
                .data ??
            '';

        expect(manufacturerText.startsWith('Sold by: '), false);
      });
    });

    testWidgets('Show gimmick tag when is gimmick material', (tester) async {
      await tester.pumpWidget(
        getScopedWidget(
          materialInfo:
              listMaterialInfo.firstWhere((element) => element.isGimmick),
        ),
      );
      await tester.pump();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.gimmickTag),
          matching: find.text('Gimmick'),
        ),
        findsOne,
      );
    });

    testWidgets('Show sample tag when is sample material', (tester) async {
      await tester.pumpWidget(
        getScopedWidget(
          materialInfo: listMaterialInfo
              .firstWhere((element) => element.isSampleMaterial),
        ),
      );
      await tester.pump();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.sampleTag),
          matching: find.text('Sample'),
        ),
        findsOne,
      );
    });

    testWidgets('Show poison tag when is poison material', (tester) async {
      await tester.pumpWidget(
        getScopedWidget(
          materialInfo:
              listMaterialInfo.firstWhere((element) => element.isPoison),
        ),
      );
      await tester.pump();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.poisonTag),
          matching: find.text('Poison'),
        ),
        findsOne,
      );
    });
  });
}
