import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_group_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_license_local.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/list_price_strike_through_component.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_rectangle_logo.dart';
import 'package:ezrxmobile/presentation/core/product_price_label.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/switch_widget.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/add_to_cart_error_section.dart';
import 'package:ezrxmobile/presentation/products/product_details/product_details_page.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/material_info.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  late MaterialListBloc materialListMockBloc;
  late UserBloc userBlocMock;
  late ProductDetailBloc productDetailMockBloc;
  late ProductImageBloc mockProductImageBloc;
  late MaterialPriceBloc materialPriceMockBloc;
  late ComboDealListBloc comboDealListMockBloc;
  late ComboDealMaterialDetailBloc comboDealMaterialDetailBlocMock;
  late TenderContractDetailBloc tenderContractDetailBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late CartBloc cartMockBloc;
  late AppRouter autoRouterMock;
  late MaterialInfo materialInfo;
  late StockInfo stockInfo;
  late StockInfo emptyStockInfo;
  late CustomerLicenseBloc customerLicenseBlocMock;
  late Price materialPrice;
  late Price materialPriceForTireSection;
  late Price materialPriceForMultipleTirePrice;
  final user = fakeClientUser;
  final materialNumber = MaterialNumber('00000111111');
  late ProductImages productImage;
  late List<MaterialInfo> similarProducts;
  late ComboDeal mockComboDeal;
  late ProductDetailAggregate zpMaterialDetail;
  late List<CustomerLicense> customerLicense;
  late List<TenderContract> tenderContractList;

  final price = Price.empty().copyWith(
    comboDeal: PriceComboDeal.empty().copyWith(
      isEligible: true,
      flexibleGroup: FlexibleGroup('flex-group'),
    ),
  );
  final comboDeal = ComboDeal.empty().copyWith(
    groupDeal: ComboDealGroupDeal.empty().copyWith(
      conditionNumber: 'conditionNumber',
    ),
    materialComboDeals: [
      ComboDealMaterialSet.empty().copyWith(
        materials: [
          ComboDealMaterial.empty().copyWith(
            materialNumber: materialNumber,
          ),
        ],
      ),
    ],
  );

  final productItemWithProductItemXp = ProductItem.empty().copyWith(
    productItemXp: ProductItemXp.empty()
        .copyWith(howToUse: StringValue('fake-description')),
  );

  final routeData = RouteData(
    stackKey: const Key(''),
    type: const RouteType.adaptive(),
    route: RouteMatch(
      segments: const ['orders', 'material_details'],
      config: AutoRoute(
        page: const PageInfo(ProductDetailsPageRoute.name),
      ),
      stringMatch: 'orders/material_details',
      key: const ValueKey('ProductDetailsPageRoute'),
    ),
    router: AutoRouteMock(),
    pendingChildren: [],
  );

  //////////////////////Finder//////////////////////////////////////////////////
  final similarProductSectionFinder =
      find.byKey(WidgetKeys.materialDetailsSimilarProductsSection);
  final similarProductItemFinder =
      find.byKey(WidgetKeys.materialDetailsSimilarProductItem);
  final productImageFinder = find.byKey(WidgetKeys.productImage);
  final materialDetailsCarouselFinder =
      find.byKey(WidgetKeys.materialDetailsCarousel);
  final materialDetailsImageCounterFinder =
      find.byKey(WidgetKeys.materialDetailsImageCounter);
  final materialDetailsCarouselImageFinder =
      find.byKey(WidgetKeys.materialDetailsCarouselImage);
  /////////////////////////////////////////////////////////////////////////////

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    registerFallbackValue(CustomerCodeInfo.empty());
    registerFallbackValue(SalesOrganisation.empty());
    registerFallbackValue(ShipToInfo.empty());

    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    locator.registerSingleton<ClevertapService>(ClevertapServiceMock());
    locator.registerFactory<ProductDetailBloc>(() => productDetailMockBloc);
    locator.registerFactory<TenderContractDetailBloc>(
      () => tenderContractDetailBlocMock,
    );
    materialInfo = await ProductDetailLocalDataSource().getProductDetails();
    similarProducts = await ProductDetailLocalDataSource().getSimilarProduct();
    tenderContractList =
        await TenderContractLocalDataSource().getTenderContractDetails();
    materialPrice =
        (await MaterialPriceLocalDataSource().getPriceList()).firstWhere(
      (element) => element.materialNumber == materialInfo.materialNumber,
    );
    materialPriceForTireSection =
        (await MaterialPriceLocalDataSource().getPriceList()).firstWhere(
      (element) =>
          element.materialNumber == MaterialNumber('000000000021038302'),
    );
    materialPriceForMultipleTirePrice =
        (await MaterialPriceLocalDataSource().getPriceList()).firstWhere(
      (element) => element.materialNumber == MaterialNumber('TCW20'),
    );
    stockInfo = (await StockInfoLocalDataSource().getMaterialStockInfoList())
        .first
        .stockInfos
        .first
        .copyWith(
          inStock: MaterialInStock('Yes'),
        );
    emptyStockInfo = StockInfo.empty().copyWith(
      inStock: MaterialInStock('Yes'),
    );
    productImage =
        (await ProductDetailLocalDataSource().getItemProductMetaData())
            .productImages
            .first;
    mockComboDeal = (await ComboDealLocalDataSource().getComboDealList()).first;
    registerFallbackValue(
      const ComboDetailPageRoute(),
    );
    zpMaterialDetail = ProductDetailAggregate.empty().copyWith(
      materialInfo: materialInfo.copyWith(isMarketPlace: false),
      stockInfo: stockInfo,
    );
    customerLicense =
        await CustomerLicenseLocalDataSource().getCustomerLicense();
  });

  group(
    'Product Details Page',
    () {
      setUp(() {
        materialListMockBloc = MaterialListBlocMock();
        tenderContractDetailBlocMock = TenderContractDetailBlocMock();
        productDetailMockBloc = ProductDetailBlocMock();
        mockProductImageBloc = ProductImageBlocMock();
        materialPriceMockBloc = MaterialPriceBlocMock();
        comboDealListMockBloc = ComboDealListBlocMock();
        comboDealMaterialDetailBlocMock = ComboDealMaterialDetailBlocMock();
        cartMockBloc = CartBlocMock();
        eligibilityBlocMock = EligibilityBlocMock();
        autoRouterMock = AutoRouteMock();
        customerLicenseBlocMock = CustomerLicenseBlocMock();
        userBlocMock = UserBlocMock();

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeRootAdminUser,
            salesOrganisation: fakeSalesOrganisation,
          ),
        );
        when(() => materialListMockBloc.state)
            .thenReturn(MaterialListState.initial());
        when(() => productDetailMockBloc.state)
            .thenReturn(ProductDetailState.initial());
        when(() => mockProductImageBloc.state)
            .thenReturn(ProductImageState.initial());
        when(() => tenderContractDetailBlocMock.state)
            .thenReturn(TenderContractDetailState.initial());
        when(() => materialPriceMockBloc.state)
            .thenReturn(MaterialPriceState.initial());
        when(() => cartMockBloc.state).thenReturn(CartState.initial());
        when(() => autoRouterMock.currentPath)
            .thenReturn('orders/material_details');
        when(() => autoRouterMock.current).thenReturn(routeData);
        when(() => autoRouterMock.stack).thenReturn([MaterialPageXMock()]);
        when(() => autoRouterMock.navigate(any()))
            .thenAnswer((_) async => true);
        when(() => comboDealListMockBloc.state)
            .thenReturn(ComboDealListState.initial());
        when(() => comboDealMaterialDetailBlocMock.state)
            .thenReturn(ComboDealMaterialDetailState.initial());
        when(() => customerLicenseBlocMock.state)
            .thenReturn(CustomerLicenseState.initial());
        when(() => userBlocMock.state).thenReturn(UserState.initial());
      });

      RouteDataScope getScopedWidget() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          usingLocalization: true,
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
            BlocProvider<ComboDealMaterialDetailBloc>(
              create: ((context) => comboDealMaterialDetailBlocMock),
            ),
            BlocProvider<ComboDealListBloc>(
              create: (context) => comboDealListMockBloc,
            ),
            BlocProvider<CustomerLicenseBloc>(
              create: (context) => customerLicenseBlocMock,
            ),
            BlocProvider<UserBloc>(
              create: (context) => userBlocMock,
            ),
          ],
          child: ProductDetailsPage(materialInfo: materialInfo),
        );
      }

      testWidgets('Find SnackBar When Add To Cart Button Pressed',
          (tester) async {
        final expectedStates = Stream.fromIterable(
          [
            CartState.initial().copyWith(
              isUpserting: false,
              cartProducts: <PriceAggregate>[],
            ),
            CartState.initial().copyWith(
              isUpserting: true,
              cartProducts: <PriceAggregate>[],
            ),
            CartState.initial().copyWith(
              isUpserting: false,
              cartProducts: <PriceAggregate>[],
            ),
          ],
        );
        whenListen(cartMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cartButtonFinder =
            find.byKey(WidgetKeys.materialDetailsAddToCartButton);
        final addToCartButton = find.byType(ElevatedButton);

        expect(cartButtonFinder, findsOneWidget);
        expect(addToCartButton, findsOneWidget);
        await tester.tap(
          addToCartButton,
          warnIfMissed: false,
        );

        await tester.pump(const Duration(seconds: 1));
      });

      testWidgets(
          'Find Add To Cart Error Section When Add To Cart Button Pressed',
          (tester) async {
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {materialInfo.materialNumber: materialPrice},
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: true,
              addOosMaterials: OosMaterial(true),
              oosValue: OosValue(1),
            ),
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
                isFOCMaterial: true,
                hasMandatoryTenderContract: false,
              ),
              stockInfo: StockInfo.empty().copyWith(
                inStock: MaterialInStock('true'),
              ),
            ),
            inputQty: 2,
          ),
        );
        when(() => cartMockBloc.state).thenReturn(
          CartState.initial().copyWith(
            isUpserting: false,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(isFOCMaterial: false),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cartButtonFinder =
            find.byKey(WidgetKeys.materialDetailsAddToCartButton);
        final addToCartButton = find.byType(ElevatedButton);
        final addToCartErrorSection =
            find.byKey(WidgetKeys.addToCartErrorSection);
        expect(cartButtonFinder, findsOneWidget);
        expect(addToCartButton, findsOneWidget);
        await tester.tap(addToCartButton);
        await tester.pump(const Duration(seconds: 2));
        expect(addToCartErrorSection, findsOneWidget);
      });

      testWidgets(
          'Find Add To Cart Error Section When Add To Cart Button Pressed and tap to proceed button',
          (tester) async {
        when(
          () => autoRouterMock
              .push(ProductDetailsPageRoute(materialInfo: materialInfo)),
        ).thenAnswer((invocation) => Future(() => null));
        when(
          () => autoRouterMock.maybePop(),
        ).thenAnswer((invocation) => Future(() => true));

        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {materialInfo.materialNumber: materialPrice},
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial()
              .copyWith(salesOrgConfigs: fakeMYSalesOrgConfigs),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
                isFOCMaterial: true,
                hasMandatoryTenderContract: false,
              ),
              stockInfo: StockInfo.empty().copyWith(
                inStock: MaterialInStock('true'),
              ),
            ),
          ),
        );
        when(() => cartMockBloc.state).thenReturn(
          CartState.initial().copyWith(
            isUpserting: false,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(isFOCMaterial: false),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cartButtonFinder =
            find.byKey(WidgetKeys.materialDetailsAddToCartButton);
        final addToCartButton = find.byType(ElevatedButton);
        final addToCartErrorSection =
            find.byKey(WidgetKeys.addToCartErrorSection);
        final addToCartErrorSectionProceed =
            find.byKey(WidgetKeys.addToCartErrorSectionProceed);
        expect(cartButtonFinder, findsOneWidget);
        expect(addToCartButton, findsOneWidget);
        await tester.tap(addToCartButton);
        await tester.pumpAndSettle();
        expect(addToCartErrorSection, findsOneWidget);
        expect(addToCartErrorSectionProceed, findsOneWidget);

        await tester.tap(addToCartErrorSectionProceed);

        whenListen(
          cartMockBloc,
          Stream.fromIterable([
            CartState.initial().copyWith(
              isClearing: true,
              cartProducts: <PriceAggregate>[
                PriceAggregate.empty().copyWith(
                  materialInfo: materialInfo.copyWith(isFOCMaterial: false),
                ),
              ],
            ),
            CartState.initial(),
          ]),
        );
        await tester.pumpAndSettle();
        verify(
          () => cartMockBloc.add(
            const CartEvent.clearCart(),
          ),
        ).called(1);
      });
      testWidgets(
          'Find Add To Cart Error Section When Add To Cart Button Pressed upsertCart call',
          (tester) async {
        const cartQty = 2;
        const inputQty = 3;
        when(
          () => autoRouterMock
              .push(ProductDetailsPageRoute(materialInfo: materialInfo)),
        ).thenAnswer((invocation) => Future(() => null));
        when(
          () => autoRouterMock.maybePop(),
        ).thenAnswer((invocation) => Future(() => true));

        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {materialInfo.materialNumber: materialPrice},
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial()
              .copyWith(salesOrgConfigs: fakeMYSalesOrgConfigs),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
                isFOCMaterial: true,
                type: MaterialInfoType.material(),
                hasMandatoryTenderContract: false,
              ),
              stockInfo: StockInfo.empty().copyWith(
                inStock: MaterialInStock('true'),
              ),
            ),
            inputQty: 3,
          ),
        );
        when(() => cartMockBloc.state).thenReturn(
          CartState.initial().copyWith(
            isUpserting: false,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(isFOCMaterial: false),
                quantity: cartQty,
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cartButtonFinder =
            find.byKey(WidgetKeys.materialDetailsAddToCartButton);
        final addToCartButton = find.byType(ElevatedButton);
        expect(cartButtonFinder, findsOneWidget);
        expect(addToCartButton, findsOneWidget);
        whenListen(
          cartMockBloc,
          Stream.fromIterable([
            CartState.initial().copyWith(
              isClearing: true,
              cartProducts: <PriceAggregate>[
                PriceAggregate.empty().copyWith(
                  materialInfo: materialInfo.copyWith(isFOCMaterial: false),
                ),
              ],
            ),
            CartState.initial(),
          ]),
        );
        await tester.tap(addToCartButton);
        await tester.pumpAndSettle();

        verify(
          () => cartMockBloc.add(
            CartEvent.upsertCart(
              priceAggregate: PriceAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  quantity: MaterialQty(2),
                  isFOCMaterial: true,
                  type: MaterialInfoType.material(),
                  hasMandatoryTenderContract: false,
                ),
                price: materialPrice,
                quantity: inputQty,
                salesOrgConfig: fakeMYSalesOrgConfigs,
              ),
            ),
          ),
        ).called(1);
      });

      testWidgets('Should scroll to top when press FAB', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
                isFOCMaterial: true,
              ),
              stockInfo: StockInfo.empty().copyWith(
                inStock: MaterialInStock('true'),
              ),
              similarProduct: similarProducts,
            ),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {materialInfo.materialNumber: materialPrice},
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: true,
              addOosMaterials: OosMaterial(true),
              oosValue: OosValue(1),
            ),
          ),
        );
        when(() => cartMockBloc.state).thenReturn(
          CartState.initial().copyWith(
            isUpserting: false,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(isFOCMaterial: false),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.pump();

        final materialDetailsMaterialDescription = find.byKey(
          WidgetKeys.materialDetailsMaterialDescription,
        );
        expect(materialDetailsMaterialDescription, findsOneWidget);
        await tester.ensureVisible(materialDetailsMaterialDescription);
        await tester.pumpAndSettle();

        await tester.drag(
          materialDetailsMaterialDescription,
          const Offset(0.0, -1000),
        );
        await tester.pumpAndSettle();
        final materialDetailsFloatingButton =
            find.byKey(WidgetKeys.scrollToTopFloatingButton);
        expect(
          materialDetailsFloatingButton,
          findsOneWidget,
        );
        await tester.tap(materialDetailsFloatingButton);
        await tester.pumpAndSettle();
        expect(
          materialDetailsFloatingButton,
          findsNothing,
        );
      });

      testWidgets(
          'Find Add To Cart Error Section When Add To Cart Button Pressed case 2',
          (tester) async {
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {materialInfo.materialNumber: materialPrice},
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: true,
              addOosMaterials: OosMaterial(true),
              oosValue: OosValue(1),
            ),
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
                isFOCMaterial: false,
                hasMandatoryTenderContract: false,
              ),
              stockInfo: StockInfo.empty().copyWith(
                inStock: MaterialInStock('true'),
              ),
            ),
            inputQty: 2,
          ),
        );
        when(() => cartMockBloc.state).thenReturn(
          CartState.initial().copyWith(
            isUpserting: false,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(isFOCMaterial: true),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cartButtonFinder =
            find.byKey(WidgetKeys.materialDetailsAddToCartButton);
        final addToCartButton = find.byType(ElevatedButton);
        final addToCartErrorSection =
            find.byKey(WidgetKeys.addToCartErrorSection);
        expect(cartButtonFinder, findsOneWidget);
        expect(addToCartButton, findsOneWidget);
        await tester.tap(addToCartButton);
        await tester.pump(const Duration(seconds: 2));
        expect(addToCartErrorSection, findsOneWidget);
      });
      testWidgets('Add to cart success when every condition is valid',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
                isFOCMaterial: true,
              ),
            ),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {materialInfo.materialNumber: materialPrice},
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: true,
              addOosMaterials: OosMaterial(true),
              oosValue: OosValue(1),
            ),
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
                isFOCMaterial: true,
              ),
              stockInfo: StockInfo.empty().copyWith(
                inStock: MaterialInStock('true'),
              ),
            ),
          ),
        );
        when(() => cartMockBloc.state).thenReturn(
          CartState.initial().copyWith(
            isUpserting: false,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(isFOCMaterial: true),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cartButtonFinder =
            find.byKey(WidgetKeys.materialDetailsAddToCartButton);
        final addToCartButton = find.byType(ElevatedButton);
        final addToCartErrorSection =
            find.byKey(WidgetKeys.addToCartErrorSection);
        expect(cartButtonFinder, findsOneWidget);
        expect(addToCartButton, findsOneWidget);
        await tester.tap(addToCartButton);
        await tester.pump(const Duration(seconds: 2));
        expect(addToCartErrorSection, findsNothing);
      });

      testWidgets('Add to Cart is disabled when materialWithoutPrice is false',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
              ),
            ),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {materialInfo.materialNumber: materialPrice},
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cartButtonFinder =
            find.byKey(WidgetKeys.materialDetailsAddToCartButton);
        final addToCartButton = find.byType(ElevatedButton);
        expect(cartButtonFinder, findsOneWidget);
        expect(addToCartButton, findsOneWidget);
        await tester.tap(addToCartButton);
        expect(tester.widget<ElevatedButton>(addToCartButton).enabled, isFalse);
        await tester.pump(const Duration(seconds: 1));
      });

      testWidgets('Add to Cart is enabled when materialWithoutPrice is true',
          (tester) async {
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {materialInfo.materialNumber: materialPrice},
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: true,
              addOosMaterials: OosMaterial(true),
              oosValue: OosValue(1),
            ),
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
                hasMandatoryTenderContract: false,
              ),
              stockInfo: StockInfo.empty().copyWith(
                inStock: MaterialInStock('true'),
              ),
            ),
            inputQty: 2,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cartButtonFinder =
            find.byKey(WidgetKeys.materialDetailsAddToCartButton);
        final addToCartButton = find.byType(ElevatedButton);
        expect(cartButtonFinder, findsOneWidget);
        expect(addToCartButton, findsOneWidget);
        await tester.tap(addToCartButton);
        expect(tester.widget<ElevatedButton>(addToCartButton).enabled, isTrue);
        await tester.pump(const Duration(seconds: 1));
      });

      testWidgets('Product Details Related Products Visible', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            isRelatedProductsFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              similarProduct: similarProducts,
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        final materialDetailsMaterialDescription = find.byKey(
          WidgetKeys.materialDetailsMaterialDescription,
        );
        expect(materialDetailsMaterialDescription, findsOneWidget);
        await tester.drag(
          materialDetailsMaterialDescription,
          const Offset(0.0, -1000),
        );
        await tester.pumpAndSettle();
        final similarProductSectionFinder =
            find.byKey(WidgetKeys.materialDetailsSimilarProductsSection);
        final similarProductItemFinder =
            find.byKey(WidgetKeys.materialDetailsSimilarProductItem);
        await tester.dragUntilVisible(
          similarProductSectionFinder,
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -300),
        );
        expect(similarProductSectionFinder, findsOneWidget);
        expect(similarProductItemFinder, findsAtLeastNWidgets(1));

        await tester.pump(const Duration(seconds: 1));
      });

      testWidgets('Product Details Related Products NotVisible',
          (tester) async {
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              isRelatedProductsFetching: true,
              productDetailAggregate: ProductDetailAggregate.empty(),
            ),
            ProductDetailState.initial().copyWith(
              isRelatedProductsFetching: false,
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo,
                similarProduct: <MaterialInfo>[],
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(similarProductSectionFinder, findsNothing);
        expect(similarProductItemFinder, findsNothing);
        await tester.pump(const Duration(seconds: 1));
      });

      testWidgets('Product Image not available', (tester) async {
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              isDetailFetching: true,
              productDetailAggregate: ProductDetailAggregate.empty(),
            ),
            ProductDetailState.initial().copyWith(
              isDetailFetching: false,
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo:
                    materialInfo.copyWith(type: MaterialInfoType('bundle')),
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(similarProductSectionFinder, findsNothing);
        expect(similarProductItemFinder, findsNothing);
        expect(productImageFinder, findsOneWidget);
        expect(materialDetailsCarouselFinder, findsNothing);
        expect(materialDetailsImageCounterFinder, findsNothing);
      });

      testWidgets('Product Image available', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            isDetailFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              similarProduct: <MaterialInfo>[],
            ),
          ),
        );
        when(() => mockProductImageBloc.state).thenReturn(
          ProductImageState.initial().copyWith(
            productImageMap: <MaterialNumber, ProductImages>{
              materialInfo.materialNumber: ProductImages.empty().copyWith(
                materialNumber: materialInfo.materialNumber,
                image: [
                  'fake-image-1',
                  'fake-image-2',
                ],
              ),
            },
          ),
        );
        // whenListen(productDetailMockBloc, expectedStates);
        await tester
            .runAsync(() async => await tester.pumpWidget(getScopedWidget()));
        await tester.pump();
        expect(similarProductSectionFinder, findsNothing);
        expect(similarProductItemFinder, findsNothing);
        expect(productImageFinder, findsOneWidget);
        expect(materialDetailsCarouselFinder, findsOneWidget);
        expect(materialDetailsCarouselImageFinder, findsNWidgets(2));
        expect(materialDetailsImageCounterFinder, findsOneWidget);
        final selectedCarouselImageKeyFinder =
            find.byKey(const ValueKey('selected0true'));
        expect(selectedCarouselImageKeyFinder, findsOneWidget);
      });

      testWidgets('Add Product As Favourite Test', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                isFavourite: false,
              ),
            ),
          ),
        );
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  isFavourite: true,
                ),
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final favouriteIcon =
            find.byKey(WidgetKeys.materialDetailsFavoriteIcon);
        final updatedFavouriteIcon = find.byIcon(Icons.favorite);
        expect(favouriteIcon, findsOneWidget);
        await tester.tap(favouriteIcon);
        await tester.pumpAndSettle();
        expect(updatedFavouriteIcon, findsOneWidget);
      });

      testWidgets('Remove Product As Favourite Test', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                isFavourite: true,
              ),
            ),
          ),
        );
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  isFavourite: false,
                ),
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final favouriteIcon =
            find.byKey(WidgetKeys.materialDetailsFavoriteIcon);
        final updatedFavouriteIcon =
            find.byIcon(Icons.favorite_border_outlined);
        expect(favouriteIcon, findsOneWidget);
        await tester.tap(favouriteIcon);
        await tester.pumpAndSettle();
        expect(updatedFavouriteIcon, findsOneWidget);
      });

      testWidgets('Find product added as favourite message', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                isFavourite: false,
              ),
            ),
          ),
        );
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  isFavourite: true,
                ),
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final favouriteIcon =
            find.byKey(WidgetKeys.materialDetailsFavoriteIcon);
        final favouriteMessage = find.text('Product added as favorite');
        expect(favouriteIcon, findsOneWidget);
        await tester.tap(favouriteIcon);
        await tester.pumpAndSettle();
        expect(favouriteMessage, findsOneWidget);
      });

      testWidgets('Find product removed as favourite message', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('00000111111'),
                isFavourite: true,
              ),
            ),
          ),
        );
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  isFavourite: false,
                ),
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final favouriteIcon =
            find.byKey(WidgetKeys.materialDetailsFavoriteIcon);
        final favouriteMessage = find.text('Product removed as favorite');
        expect(favouriteIcon, findsOneWidget);
        await tester.tap(favouriteIcon);
        await tester.pumpAndSettle();
        expect(favouriteMessage, findsOneWidget);
      });

      testWidgets('Add to cart button pressed test when isFetching is true',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('00000111111'),
                isFavourite: true,
                isSuspended: false,
                isFOCMaterial: true,
              ),
              stockInfo: StockInfo.empty().copyWith(
                inStock: MaterialInStock('Yes'),
              ),
            ),
            isDetailFetching: true,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: User.empty().copyWith(
              username: Username('fake-user'),
            ),
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('MY')),
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: true,
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final addToCartButton =
            find.byKey(WidgetKeys.materialDetailsAddToCartButton);
        expect(addToCartButton, findsOneWidget);
        await tester.tap(addToCartButton);
        verifyNever(
          () => cartMockBloc.add(
            CartEvent.upsertCart(
              priceAggregate: PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('00000111111'),
                  isFavourite: true,
                  isSuspended: false,
                  isFOCMaterial: true,
                ),
                quantity: 1,
              ),
            ),
          ),
        );
      });

      testWidgets(
          'test add to cart button disabled when customerCode is blocked',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              stockInfo: StockInfo.empty().copyWith(
                inStock: MaterialInStock('Yes'),
              ),
            ),
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeBlockedCustomerCodeInfo,
            salesOrgConfigs: fakeVNSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final customerBlockedBanner =
            find.byKey(WidgetKeys.customerBlockedBanner);

        expect(customerBlockedBanner, findsOneWidget);
        final addToCartButton =
            find.byKey(WidgetKeys.materialDetailsAddToCartButton);
        expect(addToCartButton, findsOneWidget);
        await tester.tap(addToCartButton);
        verifyNever(
          () => cartMockBloc.add(
            CartEvent.upsertCart(
              priceAggregate: PriceAggregate.empty().copyWith(
                materialInfo: materialInfo,
                salesOrgConfig: fakeVNSalesOrgConfigs,
                quantity: 1,
              ),
            ),
          ),
        );
      });

      testWidgets(
          'test add to cart button disabled when ship to code is blocked',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              stockInfo: StockInfo.empty().copyWith(
                inStock: MaterialInStock('Yes'),
              ),
            ),
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            shipToInfo: fakeBlockedShipToInfo,
            salesOrgConfigs: fakeVNSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final customerBlockedBanner =
            find.byKey(WidgetKeys.customerBlockedBanner);

        expect(customerBlockedBanner, findsOneWidget);
        final addToCartButton =
            find.byKey(WidgetKeys.materialDetailsAddToCartButton);
        expect(addToCartButton, findsOneWidget);
        await tester.tap(addToCartButton);
        verifyNever(
          () => cartMockBloc.add(
            CartEvent.upsertCart(
              priceAggregate: PriceAggregate.empty().copyWith(
                materialInfo: materialInfo,
                salesOrgConfig: fakeVNSalesOrgConfigs,
                quantity: 1,
              ),
            ),
          ),
        );
      });
      testWidgets('MaterialDetailsToggle should be visible', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              stockInfo: stockInfo,
              productItem: productItemWithProductItemXp,
            ),
            isDetailFetching: true,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.materialDetailsPromoSeeMore),
          findsOneWidget,
        );
      });

      testWidgets('ComboOffersProduct should be visible', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                materialNumber: materialNumber,
                isSuspended: false,
                isFOCMaterial: true,
                productImages: productImage,
              ),
              stockInfo: emptyStockInfo,
              productItem: productItemWithProductItemXp,
            ),
            isDetailFetching: false,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeKHSalesOrgConfigs,
            customerCodeInfo: CustomerCodeInfo.empty()
                .copyWith(salesDeals: [SalesDealNumber('0000000000')]),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            isFetching: false,
            materialPrice: {materialNumber: price},
          ),
        );
        when(() => comboDealListMockBloc.state).thenReturn(
          ComboDealListState.initial().copyWith(
            isFetching: false,
            comboDeals: {
              '${price.comboDeal.flexibleGroup.getValue()}-': [comboDeal],
            },
          ),
        );
        whenListen(
          materialPriceMockBloc,
          Stream.fromIterable([
            MaterialPriceState.initial().copyWith(
              isFetching: true,
            ),
            MaterialPriceState.initial().copyWith(
              isFetching: false,
              materialPrice: {materialNumber: price},
            ),
          ]),
        );
        whenListen(
          comboDealListMockBloc,
          Stream.fromIterable([
            ComboDealListState.initial().copyWith(
              isFetching: true,
            ),
            ComboDealListState.initial().copyWith(
              isFetching: false,
              comboDeals: {
                '${price.comboDeal.flexibleGroup.getValue()}-': [comboDeal],
              },
            ),
          ]),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        await tester.tap(
          find.byKey(WidgetKeys.getComboDealButton),
        );
        await tester.pump();
        expect(
          find.text('Get combo deal'.tr()),
          findsOneWidget,
        );
      });

      group('Material info dialog -', () {
        testWidgets(
            'Display expiry date when market allows & product is not from marketplace',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: zpMaterialDetail,
            ),
          );

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              user: user,
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrgConfigs: fakeMYSalesOrgConfigs,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          await tester.dragUntilVisible(
            find.byKey(WidgetKeys.materialDetailsInfoTile),
            find.byKey(WidgetKeys.scrollList),
            const Offset(0, -200),
          );
          await tester.pumpAndSettle();
          expect(
            find.byKey(WidgetKeys.materialDetailsInfoTile),
            findsOneWidget,
          );
          await tester.tap(
            find.byKey(WidgetKeys.materialDetailsInfoTile),
          );
          await tester.pumpAndSettle();
          expect(
            find.byKey(WidgetKeys.materialInfoDialog),
            findsOneWidget,
          );
          expect(
            find.byKey(
              WidgetKeys.balanceTextRow('Expiry date'.tr(), '30 Nov 2025'),
            ),
            findsOneWidget,
          );
        });

        testWidgets('Hide expiry date when market is not allow',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: zpMaterialDetail,
            ),
          );

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              user: user,
              salesOrganisation: fakeSalesOrganisation,
              salesOrgConfigs: fakePHSalesOrgConfigs,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          await tester.dragUntilVisible(
            find.byKey(WidgetKeys.materialDetailsInfoTile),
            find.byKey(WidgetKeys.scrollList),
            const Offset(0, -200),
          );
          await tester.pumpAndSettle();
          expect(
            find.byKey(WidgetKeys.materialDetailsInfoTile),
            findsOneWidget,
          );
          await tester.tap(
            find.byKey(WidgetKeys.materialDetailsInfoTile),
          );
          await tester.pumpAndSettle();
          expect(
            find.byKey(WidgetKeys.materialInfoDialog),
            findsOneWidget,
          );

          expect(
            find.byKey(
              WidgetKeys.balanceTextRow('Expiry date'.tr(), 'NA'),
            ),
            findsNothing,
          );
        });

        testWidgets('Display batch for Other Market', (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: zpMaterialDetail,
            ),
          );

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrgConfigs:
                  fakeMYSalesOrgConfigs.copyWith(enableBatchNumber: true),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          await tester.dragUntilVisible(
            find.byKey(WidgetKeys.materialDetailsInfoTile),
            find.byKey(WidgetKeys.scrollList),
            const Offset(0, -200),
          );
          await tester.pumpAndSettle();
          expect(
            find.byKey(WidgetKeys.materialDetailsInfoTile),
            findsOneWidget,
          );
          await tester.tap(
            find.byKey(WidgetKeys.materialDetailsInfoTile),
          );
          await tester.pumpAndSettle();
          expect(
            find.byKey(WidgetKeys.materialInfoDialog),
            findsOneWidget,
          );
          expect(
            find.byKey(
              WidgetKeys.balanceTextRow('Batch'.tr(), '12S017'),
            ),
            findsOneWidget,
          );
        });

        testWidgets('Not display batch for SG Market', (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: zpMaterialDetail,
            ),
          );

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeSGSalesOrganisation,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          await tester.dragUntilVisible(
            find.byKey(WidgetKeys.materialDetailsInfoTile),
            find.byKey(WidgetKeys.scrollList),
            const Offset(0, -200),
          );
          await tester.pumpAndSettle();
          expect(
            find.byKey(WidgetKeys.materialDetailsInfoTile),
            findsOneWidget,
          );
          await tester.tap(
            find.byKey(WidgetKeys.materialDetailsInfoTile),
          );
          await tester.pumpAndSettle();
          expect(
            find.byKey(WidgetKeys.materialInfoDialog),
            findsOneWidget,
          );
          expect(
            find.byKey(
              WidgetKeys.balanceTextRow('Batch'.tr(), '12S017'),
            ),
            findsNothing,
          );
        });

        testWidgets('Not display batch for TW Market', (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: zpMaterialDetail,
            ),
          );

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeTWSalesOrganisation,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          await tester.dragUntilVisible(
            find.byKey(WidgetKeys.materialDetailsInfoTile),
            find.byKey(WidgetKeys.scrollList),
            const Offset(0, -200),
          );
          await tester.pumpAndSettle();
          expect(
            find.byKey(WidgetKeys.materialDetailsInfoTile),
            findsOneWidget,
          );
          await tester.tap(
            find.byKey(WidgetKeys.materialDetailsInfoTile),
          );
          await tester.pumpAndSettle();
          expect(
            find.byKey(WidgetKeys.materialInfoDialog),
            findsOneWidget,
          );
          expect(
            find.byKey(
              WidgetKeys.balanceTextRow('Batch'.tr(), '12S017'),
            ),
            findsNothing,
          );
        });

        testWidgets('Display material name', (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: zpMaterialDetail,
            ),
          );

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              user: user,
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrgConfigs: fakeMYSalesOrgConfigs,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          await tester.dragUntilVisible(
            find.byKey(WidgetKeys.materialDetailsInfoTile),
            find.byKey(WidgetKeys.scrollList),
            const Offset(0, -200),
          );
          await tester.pumpAndSettle();
          await tester.tap(
            find.byKey(WidgetKeys.materialDetailsInfoTile),
          );
          await tester.pumpAndSettle();
          expect(
            find.byKey(WidgetKeys.materialInfoDialog),
            findsOneWidget,
          );
          expect(
            find.byKey(
              WidgetKeys.balanceTextRow(
                'Material name'.tr(),
                zpMaterialDetail.materialInfo.defaultMaterialDescription,
              ),
            ),
            findsOneWidget,
          );
        });
      });

      testWidgets('Similar product should be display', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                materialNumber: materialNumber,
                isFavourite: true,
                isSuspended: false,
                isFOCMaterial: true,
                productImages: productImage,
              ),
              productItem: productItemWithProductItemXp,
              similarProduct: similarProducts,
            ),
          ),
        );
        when(
          () => autoRouterMock.push(
            ProductDetailsPageRoute(materialInfo: materialInfo),
          ),
        ).thenAnswer((invocation) => Future(() => null));
        whenListen(
          productDetailMockBloc,
          Stream.fromIterable([
            ProductDetailState.initial()
                .copyWith(isRelatedProductsFetching: true),
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  materialNumber: materialNumber,
                  isFavourite: true,
                  isSuspended: false,
                  isFOCMaterial: true,
                  productImages: productImage,
                ),
                productItem: productItemWithProductItemXp,
                similarProduct: similarProducts,
              ),
              isRelatedProductsFetching: false,
            ),
          ]),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.favoritesIcon).last,
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -200),
        );
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(WidgetKeys.materialDetailsSimilarProductItem).first,
        );
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.favoritesIcon), findsNWidgets(5));
      });
      testWidgets('Stock should be display', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              stockInfo: stockInfo,
              productItem: productItemWithProductItemXp,
              similarProduct: similarProducts,
            ),
          ),
        );
        whenListen(
          productDetailMockBloc,
          Stream.fromIterable([
            ProductDetailState.initial().copyWith(isStockFetching: true),
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo,
                stockInfo: stockInfo,
                productItem: productItemWithProductItemXp,
                similarProduct: similarProducts,
              ),
              isStockFetching: false,
            ),
          ]),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(find.byKey(WidgetKeys.materialDetailsStock), findsOneWidget);
      });

      testWidgets('product quantity update', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              stockInfo: stockInfo,
              productItem: productItemWithProductItemXp,
              similarProduct: similarProducts,
            ),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            isFetching: false,
            materialPrice: {materialNumber: price},
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            salesOrganisation: fakeVNSalesOrganisation,
            salesOrgConfigs: fakeVNSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final productDetailQuantityAddKey =
            find.byKey(WidgetKeys.productDetailQuantityAddKey);

        expect(
          find.byKey(WidgetKeys.materialDetailsQuantityInput),
          findsOneWidget,
        );
        expect(productDetailQuantityAddKey, findsOneWidget);
        await tester.tap(productDetailQuantityAddKey);
        verify(
          () => productDetailMockBloc.add(
            const ProductDetailEvent.fetchItemQuantityForZdp5Discount(
              quantity: 2,
            ),
          ),
        ).called(1);
      });

      testWidgets('product price call for zdp5 ', (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeVNSalesOrganisation,
            salesOrgConfigs: fakeVNSalesOrgConfigs,
          ),
        );

        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            isFetching: false,
            materialPrice: {
              materialNumber: price.copyWith(
                zdp5MaxQuota: ZDP5Info('2'),
                zdp5RemainingQuota: ZDP5Info('2'),
              ),
            },
          ),
        );

        whenListen(
          productDetailMockBloc,
          Stream.fromIterable([
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(quantity: MaterialQty(3)),
                stockInfo: stockInfo,
                productItem: productItemWithProductItemXp,
                similarProduct: similarProducts,
              ),
            ),
          ]),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.materialDetailsQuantityInput),
          findsOneWidget,
        );
        verify(
          () => materialPriceMockBloc.add(
            MaterialPriceEvent.fetchPriceForZDP5Materials(
              materialInfo: materialInfo.copyWith(quantity: MaterialQty(3)),
            ),
          ),
        ).called(1);
        verify(
          () => productDetailMockBloc.add(
            const ProductDetailEvent.setExceedQty(
              exceedQty: true,
            ),
          ),
        ).called(1);
      });

      testWidgets(
        'Test tap outside textField',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final inputFinder =
              find.byKey(WidgetKeys.productDetailQuantityTextKey);
          await tester.enterText(inputFinder, '');
          await tester.pump();

          // Simulate a tap outside the TextField
          await tester.tapAt(const Offset(10, 150));
          await tester.pump();
          expect(
            tester.widget<TextFormField>(inputFinder).controller?.text,
            '1',
          );
        },
      );

      testWidgets(
        'Test enter minimum quantity',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final inputFinder =
              find.byKey(WidgetKeys.productDetailQuantityTextKey);
          await tester.enterText(inputFinder, '0');
          await tester.pump();
          await tester.testTextInput.receiveAction(TextInputAction.done);
          expect(
            tester.widget<TextFormField>(inputFinder).controller?.text,
            '1',
          );
        },
      );

      testWidgets(
        'Test limit enter quantity input up to 5 digits',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final inputFinder =
              find.byKey(WidgetKeys.productDetailQuantityTextKey);
          await tester.enterText(inputFinder, '999999');
          await tester.pump();
          await tester.testTextInput.receiveAction(TextInputAction.done);
          expect(
            tester.widget<TextFormField>(inputFinder).controller?.text,
            '99999',
          );
        },
      );

      testWidgets(
          'Test the Covid tag on product item and the price of the product',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakePHSalesOrganisation,
            salesOrgConfigs: fakePHSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfoForCovid,
            user: fakeClientAdmin,
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(isFOCMaterial: true),
              stockInfo: stockInfo,
              productItem: productItemWithProductItemXp,
              similarProduct: similarProducts,
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final productDetailList = find.byType(ProductDetailsPage);
        expect(productDetailList, findsOneWidget);
        final covidLabel = find.byKey(
          WidgetKeys.covidLabel,
        );
        expect(covidLabel, findsOneWidget);
        final priceText = find.text(
          'Price Not Available',
        );
        expect(priceText, findsOneWidget);
      });

      testWidgets('Should reset input qty in state to 1 at initial',
          (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        verify(
          () => productDetailMockBloc.add(ProductDetailEvent.updateQty(qty: 1)),
        ).called(1);
      });

      testWidgets(
        ' -> Find customer blocked banner',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              shipToInfo: ShipToInfo.empty()
                  .copyWith(customerBlock: CustomerBlock('blocked')),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final customerBlockedBanner =
              find.byKey(WidgetKeys.customerBlockedBanner);

          expect(customerBlockedBanner, findsOneWidget);
        },
      );

      testWidgets(
        ' -> Find suspended message if product is suspended',
        (WidgetTester tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('00000111111'),
                  isFavourite: false,
                  isSuspended: true,
                  isFOCMaterial: false,
                ),
                stockInfo: StockInfo.empty().copyWith(
                  inStock: MaterialInStock('Yes'),
                ),
              ),
              isDetailFetching: true,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final suspendedMessage = find.text(
            "The product is currently suspended. You won't be able to add the product to the cart.",
          );
          expect(suspendedMessage, findsOneWidget);
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
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
            ),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {
              materialInfo.materialNumber: Price.empty().copyWith(
                lastPrice: listPrice,
                finalPrice: finalPrice,
                materialNumber: materialInfo.materialNumber,
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
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
            ),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {
              materialInfo.materialNumber: Price.empty().copyWith(
                lastPrice: listPrice,
                finalPrice: finalPrice,
                materialNumber: materialInfo.materialNumber,
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
        final finalPrice = MaterialPrice(100);
        final listPrice = MaterialPrice(80);
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
            ),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {
              materialInfo.materialNumber: Price.empty().copyWith(
                lastPrice: listPrice,
                finalPrice: finalPrice,
                materialNumber: materialInfo.materialNumber,
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

      group('Batch -', () {
        testWidgets('Should not display batch number for TW Market',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: zpMaterialDetail,
            ),
          );
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeTWSalesOrganisation,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(
            find.textContaining(
              'Batch: 12S017',
              findRichText: true,
            ),
            findsNothing,
          );
        });

        testWidgets('Should display batch number for Other Market',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: zpMaterialDetail,
            ),
          );
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrgConfigs:
                  fakeMYSalesOrgConfigs.copyWith(enableBatchNumber: true),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(
            find.textContaining(
              'Batch: 12S017',
              findRichText: true,
            ),
            findsOneWidget,
          );
        });

        testWidgets('Should not display batch number for SG Market',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: zpMaterialDetail,
            ),
          );
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeSGSalesOrganisation,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(
            find.textContaining(
              'Batch: 12S017',
              findRichText: true,
            ),
            findsNothing,
          );
        });
      });

      group('Expiry date -', () {
        testWidgets(
            'Visible for PH Mdi for materials with principal code 107381',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate:
                  zpMaterialDetail.copyWith.materialInfo.principalData(
                principalCode: PrincipalCode('107381'),
              ),
              salesOrganisation: fakePhMDISalesOrganisation,
            ),
          );

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeMYSalesOrgConfigs,
            ),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(
            find.textContaining('Expires: 30 Nov 2025', findRichText: true),
            findsOneWidget,
          );

          final materialDetailsInfoTileKey =
              find.byKey(WidgetKeys.materialDetailsInfoTile);
          await tester.ensureVisible(materialDetailsInfoTileKey);
          await tester.pumpAndSettle();

          await tester.tap(materialDetailsInfoTileKey);
          await tester.pumpAndSettle();
          expect(
            find.byKey(WidgetKeys.materialInfoDialog),
            findsOneWidget,
          );
          expect(
            find.byKey(
              WidgetKeys.balanceTextRow('Expiry date', '30 Nov 2025'),
            ),
            findsOneWidget,
          );
        });

        testWidgets(
            'Not visible for PH Mdi for materials with any principal code other than 107381',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: zpMaterialDetail,
              salesOrganisation: fakePhMDISalesOrganisation,
            ),
          );

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeMYSalesOrgConfigs,
              salesOrganisation: fakePhMDISalesOrganisation,
            ),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(
            find.textContaining('Expires: NA', findRichText: true),
            findsOneWidget,
          );

          final materialDetailsInfoTileKey =
              find.byKey(WidgetKeys.materialDetailsInfoTile);
          await tester.ensureVisible(materialDetailsInfoTileKey);
          await tester.pumpAndSettle();

          await tester.tap(materialDetailsInfoTileKey);
          await tester.pumpAndSettle();
          expect(
            find.byKey(WidgetKeys.materialInfoDialog),
            findsOneWidget,
          );
          expect(
            find.byKey(
              WidgetKeys.balanceTextRow('Expiry date', 'NA'),
            ),
            findsOneWidget,
          );
        });

        testWidgets(
            'Visible for all markets and all materials except PH Mdi for materials without principal code 107381',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: zpMaterialDetail,
              salesOrganisation: fakeMYSalesOrganisation,
            ),
          );

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeMYSalesOrgConfigs,
            ),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(
            find.textContaining('Expires: 30 Nov 2025', findRichText: true),
            findsOneWidget,
          );

          final materialDetailsInfoTileKey =
              find.byKey(WidgetKeys.materialDetailsInfoTile);
          await tester.ensureVisible(materialDetailsInfoTileKey);
          await tester.pumpAndSettle();

          await tester.tap(materialDetailsInfoTileKey);
          await tester.pumpAndSettle();
          expect(
            find.byKey(WidgetKeys.materialInfoDialog),
            findsOneWidget,
          );
          expect(
            find.byKey(
              WidgetKeys.balanceTextRow('Expiry date', '30 Nov 2025'),
            ),
            findsOneWidget,
          );
        });

        testWidgets(
            'Not visible for all markets if expiry date toggle is off from salesOrgConfig',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: zpMaterialDetail,
              salesOrganisation: fakeMYSalesOrganisation,
            ),
          );

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakePHSalesOrgConfigs,
            ),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(
            find.textContaining('Expires: 30 Nov 2025', findRichText: true),
            findsNothing,
          );

          final materialDetailsInfoTileKey =
              find.byKey(WidgetKeys.materialDetailsInfoTile);
          await tester.ensureVisible(materialDetailsInfoTileKey);
          await tester.pumpAndSettle();

          await tester.tap(materialDetailsInfoTileKey);
          await tester.pumpAndSettle();
          expect(
            find.byKey(WidgetKeys.materialInfoDialog),
            findsOneWidget,
          );
          expect(
            find.byKey(
              WidgetKeys.balanceTextRow('Expiry date', '30 Nov 2025'),
            ),
            findsNothing,
          );
        });

        testWidgets('Should display icon with tooltip along with expiry date',
            (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrgConfigs: fakeMYSalesOrgConfigs,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(
            find.textContaining('Expires: NA', findRichText: true),
            findsOneWidget,
          );
          final infoIcon = find.byKey(WidgetKeys.expiryDateInfoIcon);
          expect(infoIcon, findsOneWidget);
          await tester.tap(infoIcon);
          await tester.pumpAndSettle();
          final bottomSheet = find.byKey(WidgetKeys.expiryDateInstructionSheet);
          expect(bottomSheet, findsOneWidget);
          expect(
            find.text(
              'Expiry date displayed is for reference, actual product may vary.',
            ),
            findsOneWidget,
          );
          final closeButton = find.descendant(
            of: bottomSheet,
            matching: find.byKey(WidgetKeys.closeButton),
          );
          expect(closeButton, findsOneWidget);
          expect(
            find.descendant(of: closeButton, matching: find.text('Got it')),
            findsOneWidget,
          );
          await tester.tap(closeButton);
          await tester.pumpAndSettle();
          expect(bottomSheet, findsNothing);
        });
      });

      testWidgets(
          'Should display batch and expiry date for Other Market when no data',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs:
                fakeMYSalesOrgConfigs.copyWith(enableBatchNumber: true),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.materialDetailsStock), findsOneWidget);
        expect(
          find.textContaining('Batch: NA', findRichText: true),
          findsOneWidget,
        );
        expect(
          find.textContaining('Expires: NA', findRichText: true),
          findsOneWidget,
        );
      });

      testWidgets(
          'Test Material Quantity field reset when item from similar product is selected',
          (tester) async {
        when(
          () => autoRouterMock
              .push(ProductDetailsPageRoute(materialInfo: materialInfo)),
        ).thenAnswer((invocation) => Future(() => null));

        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              stockInfo: stockInfo,
              similarProduct: similarProducts,
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.materialDetailsSimilarProductsSection),
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -200),
        );
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.materialDetailsSimilarProductsSection),
          findsOneWidget,
        );

        final relatedProduct =
            find.byKey(WidgetKeys.materialDetailsSimilarProductItem).first;

        expect(relatedProduct, findsOneWidget);

        await tester.tap(relatedProduct);
        verify(
          () => autoRouterMock
              .push(ProductDetailsPageRoute(materialInfo: materialInfo)),
        ).called(1);

        await tester.pumpAndSettle();
      });
      testWidgets('ComboOffersProduct should display highest discount value ',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                materialNumber: MaterialNumber('000000000021222875'),
                isSuspended: false,
                isFOCMaterial: true,
                productImages: productImage,
              ),
              stockInfo: emptyStockInfo,
              productItem: productItemWithProductItemXp,
            ),
            isDetailFetching: false,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeKHSalesOrgConfigs,
            customerCodeInfo: CustomerCodeInfo.empty()
                .copyWith(salesDeals: [SalesDealNumber('0000000000')]),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            isFetching: false,
            materialPrice: {MaterialNumber('000000000021222875'): price},
          ),
        );
        when(() => comboDealListMockBloc.state).thenReturn(
          ComboDealListState.initial().copyWith(
            isFetching: false,
            comboDeals: {
              '${price.comboDeal.flexibleGroup.getValue()}-': [mockComboDeal],
            },
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        await tester.tap(
          find.byKey(WidgetKeys.getComboDealButton),
        );
        await tester.pump();
        expect(
          find.text(
            'Discount up to ${mockComboDeal.materialsMaximumDiscount}% on selected materials'
                .tr(),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'show strick through price for zdp5 (if list price > final price)',
          (tester) async {
        final materialNumber = MaterialNumber('000000000021038302');
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeVNSalesOrganisation,
            salesOrgConfigs: fakeVNSalesOrgConfigs,
          ),
        );

        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            isFetching: false,
            materialPrice: {materialNumber: materialPriceForTireSection},
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                materialNumber: materialNumber,
                quantity: MaterialQty(4),
              ),
            ),
            inputQty: 3,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.materialDetailsQuantityInput),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.listPriceStrikeThroughComponent,
          ),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.zdpDiscountListPrice,
          ),
          findsNothing,
        );
      });
      testWidgets(
          'show strick through price for zdp5 (if list price == final price)',
          (tester) async {
        final materialNumber = MaterialNumber('000000000021038302');
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeVNSalesOrganisation,
            salesOrgConfigs: fakeVNSalesOrgConfigs,
          ),
        );

        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            isFetching: false,
            materialPrice: {
              materialNumber: materialPriceForTireSection.copyWith(
                lastPrice: MaterialPrice(100),
                finalPrice: MaterialPrice(100),
              ),
            },
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                materialNumber: materialNumber,
                quantity: MaterialQty(4),
              ),
            ),
            inputQty: 3,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.materialDetailsQuantityInput),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.listPriceStrikeThroughComponent,
          ),
          findsNothing,
        );
        expect(
          find.byKey(
            WidgetKeys.zdpDiscountListPrice,
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Find promotion amount when discount percentage is not greater than zero',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                materialNumber: MaterialNumber('TCW20'),
                quantity: MaterialQty(1),
              ),
            ),
            inputQty: 1,
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {
              MaterialNumber('TCW20'): materialPriceForMultipleTirePrice,
            },
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final offerTitle =
            find.text('IDR 5,000 off total price', findRichText: true);
        expect(offerTitle, findsOneWidget);
      });

      testWidgets('Find promotion percentage title', (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                materialNumber: MaterialNumber('TCW20'),
                quantity: MaterialQty(1),
              ),
            ),
            inputQty: 1,
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {
              MaterialNumber('TCW20'): materialPriceForMultipleTirePrice,
            },
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final offerTitle = find.text('7.0% off total price');
        expect(offerTitle, findsOneWidget);
      });

      testWidgets(
          'show strick through price for tier price offers(Without zdp5) ',
          (tester) async {
        final materialNumber = MaterialNumber('000000000021038302');
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeVNSalesOrganisation,
            salesOrgConfigs: fakeVNSalesOrgConfigs,
          ),
        );

        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            isFetching: false,
            materialPrice: {
              materialNumber: materialPriceForTireSection.copyWith(
                zdp5MaxQuota: ZDP5Info(''),
                zdp5RemainingQuota: ZDP5Info(''),
              ),
            },
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                materialNumber: materialNumber,
                quantity: MaterialQty(4),
              ),
            ),
            inputQty: 3,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.materialDetailsQuantityInput),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.listPriceStrikeThroughComponent,
          ),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.zdpDiscountListPrice,
          ),
          findsNothing,
        );
      });

      testWidgets(
          'show strick through price for tier price offers(Without zdp5 and the list price is equal to final price) ',
          (tester) async {
        final materialNumber = MaterialNumber('000000000021038302');
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeVNSalesOrganisation,
            salesOrgConfigs: fakeVNSalesOrgConfigs,
          ),
        );

        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            isFetching: false,
            materialPrice: {
              materialNumber: materialPriceForTireSection.copyWith(
                zdp5MaxQuota: ZDP5Info(''),
                zdp5RemainingQuota: ZDP5Info(''),
                lastPrice: MaterialPrice(100),
                finalPrice: MaterialPrice(100),
              ),
            },
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                materialNumber: materialNumber,
                quantity: MaterialQty(4),
              ),
            ),
            inputQty: 3,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.materialDetailsQuantityInput),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.listPriceStrikeThroughComponent,
          ),
          findsNothing,
        );
        expect(
          find.byKey(
            WidgetKeys.zdpDiscountListPrice,
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'show strick through price for tier price offers(When enableListPrice is false in config) ',
          (tester) async {
        final materialNumber = MaterialNumber('000000000021038302');
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeVNSalesOrganisation,
            salesOrgConfigs: fakePHSalesOrgConfigs,
          ),
        );

        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            isFetching: false,
            materialPrice: {
              materialNumber: materialPriceForTireSection.copyWith(),
            },
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                materialNumber: materialNumber,
                quantity: MaterialQty(4),
              ),
            ),
            inputQty: 3,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.materialDetailsQuantityInput),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.listPriceStrikeThroughComponent,
          ),
          findsNothing,
        );
        expect(
          find.byKey(
            WidgetKeys.zdpDiscountListPrice,
          ),
          findsNothing,
        );
      });

      testWidgets(
        ' -> Stock Info banner visible in product details',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfigs: fakeIDSalesOrgConfigs,
              isStockInfoNotAvailable: true,
            ),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final stockInfoBanner = find.byKey(WidgetKeys.stockInfoBanner);
          final stockInfoBannerTitle = find.text('Stock status not available:');
          final stockInfoBannerSubTitle = find.text(
            'Please note that stock information is not available at the moment. While you can still place orders, fulfilment will be subjected to available stock levels.',
          );

          expect(stockInfoBanner, findsOneWidget);
          expect(stockInfoBannerTitle, findsOneWidget);
          expect(stockInfoBannerSubTitle, findsOneWidget);
        },
      );

      testWidgets(
        ' -> Stock Info banner not visible in product details',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfigs: fakeIDSalesOrgConfigs,
              isStockInfoNotAvailable: false,
            ),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final stockInfoBanner = find.byKey(WidgetKeys.stockInfoBanner);
          final stockInfoBannerTitle = find.text('Stock status not available:');
          final stockInfoBannerSubTitle = find.text(
            'Please note that stock information is not available at the moment. While you can still place orders, fulfilment will be subjected to available stock levels.',
          );

          expect(stockInfoBanner, findsNothing);
          expect(stockInfoBannerTitle, findsNothing);
          expect(stockInfoBannerSubTitle, findsNothing);
        },
      );

      group('Marketplace icon -', () {
        testWidgets('Visible when material is from MP', (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith.productDetailAggregate(
                  materialInfo:
                      similarProducts.firstWhere((e) => e.isMarketPlace),
                ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();

          expect(find.byType(MarketPlaceRectangleLogo), findsOneWidget);
        });
        testWidgets('Not visible when material is from ZP', (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith.productDetailAggregate(
                  materialInfo:
                      similarProducts.firstWhere((e) => !e.isMarketPlace),
                ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();

          expect(find.byType(MarketPlaceRectangleLogo), findsNothing);
        });
      });

      group('Marketplace seller -', () {
        testWidgets('Visible instead of manufacturer when material is from MP',
            (tester) async {
          final material = similarProducts.firstWhere((e) => e.isMarketPlace);
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith.productDetailAggregate(
                  materialInfo: material,
                ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();

          expect(
            find.descendant(
              of: find.byType(MaterialInformation),
              matching: find.textContaining('Sold by,'),
            ),
            findsOneWidget,
          );

          final materialInformationFinder = find.byType(MaterialInformation);
          await tester.ensureVisible(materialInformationFinder);
          await tester.pumpAndSettle();

          await tester.tap(materialInformationFinder);
          await tester.pumpAndSettle();
          expect(
            find.byKey(
              WidgetKeys.balanceTextRow(
                'Sold by seller',
                material.getManufactured,
              ),
            ),
            findsOneWidget,
          );
        });

        testWidgets('Not visible when material is from ZP', (tester) async {
          final material = similarProducts.firstWhere((e) => !e.isMarketPlace);
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith.productDetailAggregate(
                  materialInfo: material,
                ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();

          expect(
            find.descendant(
              of: find.byType(MaterialInformation),
              matching: find.textContaining('Sold by,'),
            ),
            findsNothing,
          );
          await tester.tap(find.byType(MaterialInformation));
          await tester.pumpAndSettle();
          expect(
            find.byKey(
              WidgetKeys.balanceTextRow(
                'Sold by seller',
                material.getManufactured,
              ),
            ),
            findsNothing,
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
            when(() => productDetailMockBloc.state).thenReturn(
              ProductDetailState.initial().copyWith(
                productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                  materialInfo: materialInfo,
                  stockInfo: StockInfo.empty().copyWith(
                    inStock: MaterialInStock('Yes'),
                  ),
                ),
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

            final addToCartButton = find.byType(ElevatedButton);
            expect(addToCartButton, findsOneWidget);
            await tester.tap(addToCartButton);
            expect(
              tester.widget<ElevatedButton>(addToCartButton).enabled,
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
                salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
                  materialWithoutPrice: true,
                  addOosMaterials: OosMaterial(true),
                  oosValue: OosValue(1),
                ),
              ),
            );
            when(() => materialPriceMockBloc.state).thenReturn(
              MaterialPriceState.initial().copyWith(
                materialPrice: {materialInfo.materialNumber: materialPrice},
              ),
            );
            when(() => productDetailMockBloc.state).thenReturn(
              ProductDetailState.initial().copyWith(
                productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                  materialInfo: materialInfo.copyWith(
                    quantity: MaterialQty(2),
                    hasMandatoryTenderContract: false,
                  ),
                  stockInfo: StockInfo.empty().copyWith(
                    inStock: MaterialInStock('true'),
                  ),
                ),
                inputQty: 2,
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

            final addToCartButton = find.byType(ElevatedButton);
            expect(addToCartButton, findsOneWidget);
            await tester.tap(addToCartButton);
            expect(
              tester.widget<ElevatedButton>(addToCartButton).enabled,
              isTrue,
            );
          },
        );

        testWidgets(
          ' -> Find License expired banner in home tab',
          (WidgetTester tester) async {
            when(
              () => autoRouterMock.push(const ProfilePageRoute()),
            ).thenAnswer((invocation) => Future(() => null));
            when(() => eligibilityBlocMock.state).thenReturn(
              EligibilityState.initial().copyWith(
                customerCodeInfo: fakeCustomerCodeInfo,
                salesOrgConfigs: fakeIDSalesOrgConfigs,
              ),
            );

            when(() => customerLicenseBlocMock.state).thenReturn(
              CustomerLicenseState.initial().copyWith(
                customerLicenses: customerLicense,
                salesOrganization: fakeIDSalesOrganisation,
              ),
            );
            await tester.pumpWidget(getScopedWidget());
            await tester.pump();

            final licenseExpiredBanner =
                find.byKey(WidgetKeys.licenseExpiredBanner);
            final viewLicenseButton = find.byKey(WidgetKeys.viewLicenseButton);
            final licenseExpiredBannerTitle = find.text(
              'You have licenses that are about to expire or has expired.',
            );
            final licenseExpiredBannerSubTitle = find.text(
              'To continue using eZRx+, please renew your license.',
            );

            expect(licenseExpiredBanner, findsOneWidget);
            expect(licenseExpiredBannerTitle, findsOneWidget);
            expect(licenseExpiredBannerSubTitle, findsOneWidget);
            await tester.tap(viewLicenseButton);

            verify(
              () => autoRouterMock.push(const ProfilePageRoute()),
            ).called(1);

            await tester.pumpAndSettle();
          },
        );

        testWidgets(
          ' -> License expired banner not visible in home tab',
          (WidgetTester tester) async {
            when(() => eligibilityBlocMock.state).thenReturn(
              EligibilityState.initial().copyWith(
                customerCodeInfo: fakeCustomerCodeInfo,
                salesOrgConfigs: fakeIDSalesOrgConfigs,
              ),
            );

            when(() => customerLicenseBlocMock.state).thenReturn(
              CustomerLicenseState.initial().copyWith(customerLicenses: []),
            );
            await tester.pumpWidget(getScopedWidget());
            await tester.pump();

            final licenseExpiredBanner =
                find.byKey(WidgetKeys.licenseExpiredBanner);
            final licenseExpiredBannerTitle = find.text(
              'You have licenses that are about to expire or has expired.',
            );
            final licenseExpiredBannerSubTitle = find.text(
              'To continue using eZRx+, please renew your license.',
            );

            expect(licenseExpiredBanner, findsNothing);
            expect(licenseExpiredBannerTitle, findsNothing);
            expect(licenseExpiredBannerSubTitle, findsNothing);
          },
        );
      });
      group('Tender Contract -', () {
        testWidgets(
            'Show Tender Tag And Tender Contracts when hasValidTenderContract is true',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  hasValidTenderContract: true,
                  hasMandatoryTenderContract: false,
                ),
              ),
            ),
          );

          when(() => tenderContractDetailBlocMock.state).thenReturn(
            TenderContractDetailState.initial().copyWith(
              tenderContractList: tenderContractList,
              tenderContractEnable: true,
            ),
          );

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeVNSalesOrganisation,
              salesOrgConfigs: fakeVNSalesOrgConfigs,
            ),
          );
          final expectedState = [
            TenderContractDetailState.initial().copyWith(isFetching: true),
            TenderContractDetailState.initial().copyWith(
              tenderContractList: tenderContractList,
              tenderContractEnable: true,
            ),
          ];
          whenListen(
            tenderContractDetailBlocMock,
            Stream.fromIterable(expectedState),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          verify(
            () => tenderContractDetailBlocMock.add(
              const TenderContractDetailEvent.toggleSwitch(
                enable: false,
              ),
            ),
          ).called(1);
          final tenderTag = find.byKey(WidgetKeys.tenderTag);
          final tenderContracts =
              find.byKey(WidgetKeys.materialUseTenderContract);
          final tenderSwitch = find.byType(SwitchWidget);
          final contracts = find.byKey(WidgetKeys.materialTenderContracts);
          expect(tenderTag, findsOneWidget);
          expect(
            find.descendant(
              of: tenderTag,
              matching: find.text('Tender Available'.tr()),
            ),
            findsOneWidget,
          );
          expect(tenderContracts, findsOneWidget);
          expect(
            find.descendant(
              of: tenderContracts,
              matching: find.text('Use Tender Contract'.tr()),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: tenderContracts,
              matching: tenderSwitch,
            ),
            findsOneWidget,
          );
          await tester.dragUntilVisible(
            find.byType(ProductPriceLabel),
            find.byKey(WidgetKeys.scrollList),
            const Offset(0, -500),
          );
          await tester.pumpAndSettle();
          await tester.tap(tenderSwitch);
          await tester.pumpAndSettle();
          verify(
            () => tenderContractDetailBlocMock.add(
              const TenderContractDetailEvent.toggleSwitch(
                enable: false,
              ),
            ),
          ).called(1);
          expect(contracts, findsOneWidget);
        });

        testWidgets('Hide Tender Contracts if tenderContractList empty',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  hasValidTenderContract: true,
                ),
              ),
            ),
          );

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final tenderContracts =
              find.byKey(WidgetKeys.materialUseTenderContract);

          expect(tenderContracts, findsNothing);
        });

        testWidgets(
          ' Tender tag should not display outside safe area',
          (tester) async {
            when(() => productDetailMockBloc.state).thenReturn(
              ProductDetailState.initial().copyWith(
                productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                  materialInfo: materialInfo.copyWith(
                    hasValidTenderContract: true,
                    hasMandatoryTenderContract: false,
                  ),
                ),
              ),
            );

            await tester.pumpWidget(getScopedWidget());
            await tester.pumpAndSettle();

            final titleTag = find.text('Tender Available'.tr());
            expect(titleTag, findsOneWidget);

            final center = tester.getCenter(titleTag);
            expect(center.dy, greaterThanOrEqualTo(kToolbarHeight));
          },
        );

        testWidgets('Tender Contract Item', (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  hasValidTenderContract: true,
                  hasMandatoryTenderContract: false,
                ),
              ),
            ),
          );
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );
          when(() => tenderContractDetailBlocMock.state).thenReturn(
            TenderContractDetailState.initial().copyWith(
              tenderContractList: tenderContractList,
              tenderContractEnable: true,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final contractSection =
              find.byKey(WidgetKeys.materialTenderContracts);

          final contractItem = find.byKey(
            WidgetKeys.materialTenderContractItem('0040005178', false),
          );

          await tester.dragUntilVisible(
            contractSection,
            find.byKey(WidgetKeys.scrollList),
            const Offset(0.0, -200),
          );
          await tester.pumpAndSettle();
          expect(
            find.descendant(
              of: contractItem,
              matching: find.text('0040005178'),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: contractItem,
              matching: find.text('735 - ${'Non-Contract Tender'.tr()}'),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: contractItem,
              matching: find.text('Price'.tr()),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: contractItem,
              matching: find.text(
                'VND 95,238.10',
                findRichText: true,
              ),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: contractItem,
              matching: find.text('Quantity Available'.tr()),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: contractItem,
              matching: find.text('259/1481'),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: contractItem,
              matching: find.text('Expiry Date'.tr()),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: contractItem,
              matching: find.text('259/1481'),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: contractItem,
              matching: find.text('Reference'.tr()),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: contractItem,
              matching: find.text('835348340324'),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: contractItem,
              matching: find.text('Material Visa No.'.tr()),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: contractItem,
              matching: find.text('NA'),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: contractItem,
              matching: find.text('Sale District'.tr()),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: contractItem,
              matching: find.text('HCM'),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: contractItem,
              matching: find.text('Announcement Letter No.'.tr()),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: contractItem,
              matching: find.text('VAT 10% - 8%'),
            ),
            findsOneWidget,
          );
          await tester.tap(contractItem);
          verify(
            () => tenderContractDetailBlocMock.add(
              TenderContractDetailEvent.select(
                tenderContract: tenderContractList.first,
              ),
            ),
          );
        });

        testWidgets(
            'Show Maximum tender qty message when order quantity is greater than qty available for tender',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  hasValidTenderContract: true,
                  hasMandatoryTenderContract: false,
                ),
              ),
            ),
          );
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );
          when(() => tenderContractDetailBlocMock.state).thenReturn(
            TenderContractDetailState.initial().copyWith(
              tenderContractList: tenderContractList,
              tenderContractEnable: true,
              selectedTenderContract: tenderContractList.first,
              inputQty: 300,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          expect(
            find.byKey(WidgetKeys.materialDetailsQuantityInput),
            findsOneWidget,
          );
          final inputFinder =
              find.byKey(WidgetKeys.productDetailQuantityTextKey);

          await tester.enterText(inputFinder, '300');
          await tester.pump();
          await tester.testTextInput.receiveAction(TextInputAction.done);

          expect(
            tester.widget<TextFormField>(inputFinder).controller?.text,
            '300',
          );

          await tester.dragUntilVisible(
            inputFinder,
            find.byKey(WidgetKeys.scrollList),
            const Offset(0.0, -200),
          );
          await tester.pumpAndSettle();

          expect(
            find.textContaining(
              'Maximum tender qty',
              findRichText: true,
            ),
            findsOneWidget,
          );
        });

        testWidgets('Show This is a mandatory contract message',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  hasValidTenderContract: true,
                  hasMandatoryTenderContract: true,
                ),
              ),
            ),
          );
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );
          when(() => tenderContractDetailBlocMock.state).thenReturn(
            TenderContractDetailState.initial().copyWith(
              tenderContractList: tenderContractList,
              tenderContractEnable: true,
            ),
          );
          final expectedState = [
            TenderContractDetailState.initial().copyWith(isFetching: true),
            TenderContractDetailState.initial().copyWith(
              tenderContractList: tenderContractList,
              tenderContractEnable: true,
            ),
          ];
          whenListen(
            tenderContractDetailBlocMock,
            Stream.fromIterable(expectedState),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          verify(
            () => tenderContractDetailBlocMock.add(
              const TenderContractDetailEvent.toggleSwitch(
                enable: true,
              ),
            ),
          ).called(1);

          final tenderContracts =
              find.byKey(WidgetKeys.materialUseTenderContract);
          final tenderSwitch = find.byType(SwitchWidget);
          final contracts = find.byKey(WidgetKeys.materialTenderContracts);

          expect(tenderContracts, findsOneWidget);
          expect(
            find.descendant(
              of: tenderContracts,
              matching: find.text('Use Tender Contract'.tr()),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: tenderContracts,
              matching: tenderSwitch,
            ),
            findsOneWidget,
          );
          await tester.dragUntilVisible(
            find.byType(ProductPriceLabel),
            find.byKey(WidgetKeys.scrollList),
            const Offset(0, -500),
          );
          await tester.pumpAndSettle();
          await tester.tap(tenderSwitch);
          await tester.pumpAndSettle();

          expect(contracts, findsOneWidget);
          expect(
            find.byType(CustomSnackBar),
            findsOneWidget,
          );
          expect(
            find.textContaining(
              'This is a mandatory contract',
            ),
            findsOneWidget,
          );
        });

        testWidgets(
            'Show message for Insufficient available quantity. Tender contract is no longer available',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  hasValidTenderContract: true,
                  hasMandatoryTenderContract: true,
                ),
              ),
            ),
          );
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );
          when(() => tenderContractDetailBlocMock.state).thenReturn(
            TenderContractDetailState.initial().copyWith(
              tenderContractList: tenderContractList,
              tenderContractEnable: true,
              selectedTenderContract: TenderContract.empty(),
            ),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final cartButtonFinder =
              find.byKey(WidgetKeys.materialDetailsAddToCartButton);
          final addToCartButton = find.byType(ElevatedButton);

          expect(cartButtonFinder, findsOneWidget);
          expect(addToCartButton, findsOneWidget);
          await tester.tap(
            addToCartButton,
            warnIfMissed: false,
          );

          await tester.pump(const Duration(seconds: 1));

          expect(
            find.byType(CustomSnackBar),
            findsOneWidget,
          );
          expect(
            find.textContaining(
              'Insufficient available quantity. Tender contract is no longer available',
            ),
            findsOneWidget,
          );
        });

        testWidgets(
            'Show message when adding tender contract materials while commercial materials exists in the cart',
            (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  quantity: MaterialQty(2),
                  isFOCMaterial: true,
                  hasMandatoryTenderContract: false,
                ),
                stockInfo: StockInfo.empty().copyWith(
                  inStock: MaterialInStock('true'),
                ),
              ),
            ),
          );
          when(() => cartMockBloc.state).thenReturn(
            CartState.initial().copyWith(
              isUpserting: false,
              cartProducts: <PriceAggregate>[
                PriceAggregate.empty().copyWith(
                  materialInfo: materialInfo.copyWith(isFOCMaterial: true),
                ),
              ],
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final cartButtonFinder =
              find.byKey(WidgetKeys.materialDetailsAddToCartButton);
          final addToCartButton = find.byType(ElevatedButton);
          expect(cartButtonFinder, findsOneWidget);
          expect(addToCartButton, findsOneWidget);
          await tester.tap(addToCartButton);
          await tester.pump(const Duration(seconds: 2));
          final selectedTenderContract = tenderContractList.first;
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  hasValidTenderContract: true,
                  hasMandatoryTenderContract: true,
                ),
              ),
            ),
          );
          when(() => tenderContractDetailBlocMock.state).thenReturn(
            TenderContractDetailState.initial().copyWith(
              tenderContractList: tenderContractList,
              tenderContractEnable: true,
              selectedTenderContract: selectedTenderContract,
            ),
          );
          await tester.tap(
            addToCartButton,
            warnIfMissed: false,
          );

          await tester.pump(const Duration(seconds: 1));

          expect(
            find.byType(AddToCartErrorSection),
            findsOneWidget,
          );
          expect(
            find.textContaining(
              'Materials from the ${selectedTenderContract.tenderOrderReason.displayTenderContractReason} tender contract cannot be added to your cart if you have other materials in your cart. By proceeding, your current cart will be cleared.',
            ),
            findsOneWidget,
          );
        });

        testWidgets(
            'Show message Materials from the 730 tender contract cannot be added to your cart if you have other materials in your cart.',
            (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  quantity: MaterialQty(2),
                  isFOCMaterial: true,
                  hasMandatoryTenderContract: false,
                ),
                stockInfo: StockInfo.empty().copyWith(
                  inStock: MaterialInStock('true'),
                ),
              ),
            ),
          );
          when(() => cartMockBloc.state).thenReturn(
            CartState.initial().copyWith(
              isUpserting: false,
              cartProducts: <PriceAggregate>[
                PriceAggregate.empty().copyWith(
                  materialInfo: materialInfo.copyWith(isFOCMaterial: true),
                ),
              ],
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final cartButtonFinder =
              find.byKey(WidgetKeys.materialDetailsAddToCartButton);
          final addToCartButton = find.byType(ElevatedButton);
          expect(cartButtonFinder, findsOneWidget);
          expect(addToCartButton, findsOneWidget);
          await tester.tap(addToCartButton);
          await tester.pump(const Duration(seconds: 2));
          final selectedTenderContract = tenderContractList.first
              .copyWith(tenderOrderReason: TenderContractReason('730'));
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  hasValidTenderContract: true,
                  hasMandatoryTenderContract: true,
                ),
              ),
            ),
          );
          when(() => tenderContractDetailBlocMock.state).thenReturn(
            TenderContractDetailState.initial().copyWith(
              tenderContractList: tenderContractList,
              tenderContractEnable: true,
              selectedTenderContract: selectedTenderContract,
            ),
          );
          await tester.tap(
            addToCartButton,
            warnIfMissed: false,
          );

          await tester.pump(const Duration(seconds: 1));

          expect(
            find.byType(AddToCartErrorSection),
            findsOneWidget,
          );
          expect(
            find.textContaining(
              'Materials from the 730 tender contract cannot be added to your cart if you have other materials in your cart. By proceeding, your current cart will be cleared.',
            ),
            findsOneWidget,
          );
        });

        testWidgets(
            'Show message Other materials cannot be ordered while materials from the 730 tender contract are in your cart. By proceeding, your current cart will be cleared.',
            (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  quantity: MaterialQty(2),
                  isFOCMaterial: true,
                  hasMandatoryTenderContract: false,
                ),
                stockInfo: StockInfo.empty().copyWith(
                  inStock: MaterialInStock('true'),
                ),
              ),
            ),
          );
          final existingTenderContract = tenderContractList.first
              .copyWith(tenderOrderReason: TenderContractReason('730'));
          final cartProduct = PriceAggregate.empty().copyWith(
            materialInfo: materialInfo.copyWith(isFOCMaterial: true),
            tenderContract: existingTenderContract,
          );
          when(() => cartMockBloc.state).thenReturn(
            CartState.initial().copyWith(
              isUpserting: false,
              cartProducts: <PriceAggregate>[
                cartProduct,
              ],
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final cartButtonFinder =
              find.byKey(WidgetKeys.materialDetailsAddToCartButton);
          final addToCartButton = find.byType(ElevatedButton);
          expect(cartButtonFinder, findsOneWidget);
          expect(addToCartButton, findsOneWidget);
          await tester.tap(addToCartButton);
          await tester.pumpAndSettle(const Duration(seconds: 2));

          expect(
            find.byType(AddToCartErrorSection),
            findsOneWidget,
          );
          final addToCartErrorSection =
              find.byKey(WidgetKeys.addToCartErrorSection);
          expect(addToCartErrorSection, findsOneWidget);

          expect(
            find.textContaining(
              'Other materials cannot be ordered while materials from the 730 tender contract are in your cart. By proceeding, your current cart will be cleared.',
            ),
            findsOneWidget,
          );

          final errorSectionProceed =
              find.byKey(WidgetKeys.addToCartErrorSectionProceed);
          final errorSectionCancel =
              find.byKey(WidgetKeys.cancelCovidMaterialAddToCart);
          expect(errorSectionProceed, findsOneWidget);
          expect(errorSectionCancel, findsOneWidget);
          await tester.tap(errorSectionProceed);
          await tester.pumpAndSettle(const Duration(seconds: 2));
          verify(
            () => cartMockBloc.add(
              const CartEvent.clearCart(),
            ),
          ).called(1);
        });

        testWidgets('Add material to and empty cart with valid tender',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  hasValidTenderContract: true,
                  hasMandatoryTenderContract: true,
                ),
              ),
            ),
          );
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );
          when(() => tenderContractDetailBlocMock.state).thenReturn(
            TenderContractDetailState.initial().copyWith(
              tenderContractList: tenderContractList,
              tenderContractEnable: true,
              selectedTenderContract: tenderContractList.first,
            ),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final cartButtonFinder =
              find.byKey(WidgetKeys.materialDetailsAddToCartButton);
          final addToCartButton = find.byType(ElevatedButton);

          expect(cartButtonFinder, findsOneWidget);
          expect(addToCartButton, findsOneWidget);
          await tester.tap(
            addToCartButton,
            warnIfMissed: false,
          );

          await tester.pump(const Duration(seconds: 1));

          final addToCartErrorSection =
              find.byKey(WidgetKeys.addToCartErrorSection);
          expect(addToCartErrorSection, findsNothing);
        });

        testWidgets(
            'Show notification if material is expiring soon once the expiry date is < = 365 days',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                stockInfo: stockInfo.copyWith(
                  expiryDate: DateTimeStringValue('2024-11-30'),
                ),
                materialInfo: materialInfo.copyWith(
                  hasValidTenderContract: true,
                  hasMandatoryTenderContract: true,
                  isMarketPlace: false,
                ),
              ),
            ),
          );
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs:
                  fakeVNSalesOrgConfigs.copyWith(expiryDateDisplay: true),
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );
          when(() => tenderContractDetailBlocMock.state).thenReturn(
            TenderContractDetailState.initial().copyWith(
              tenderContractList: tenderContractList,
              tenderContractEnable: true,
              selectedTenderContract: tenderContractList.first,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();

          expect(
            find.textContaining('Material expires soon', findRichText: true),
            findsOneWidget,
          );
        });

        testWidgets(
            'Do not show notification if material is not expiring soon once the expiry date is >= 365 days',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                stockInfo: stockInfo.copyWith(
                  expiryDate: DateTimeStringValue('2030-11-30'),
                ),
                materialInfo: materialInfo.copyWith(
                  hasValidTenderContract: true,
                  hasMandatoryTenderContract: true,
                  isMarketPlace: false,
                ),
              ),
            ),
          );
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs:
                  fakeVNSalesOrgConfigs.copyWith(expiryDateDisplay: true),
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );
          when(() => tenderContractDetailBlocMock.state).thenReturn(
            TenderContractDetailState.initial().copyWith(
              tenderContractList: tenderContractList,
              tenderContractEnable: true,
              selectedTenderContract: tenderContractList.first,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();

          expect(
            find.textContaining('Material expires soon', findRichText: true),
            findsNothing,
          );
        });

        testWidgets(
            'Add to Cart is disabled when hasMandatoryTenderContract is true and tender data is not available',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  quantity: MaterialQty(2),
                  hasMandatoryTenderContract: true,
                ),
              ),
            ),
          );
          when(() => tenderContractDetailBlocMock.state).thenReturn(
            TenderContractDetailState.initial().copyWith(
              tenderContractList: [],
            ),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final cartButtonFinder =
              find.byKey(WidgetKeys.materialDetailsAddToCartButton);
          final addToCartButton = find.byType(ElevatedButton);
          expect(cartButtonFinder, findsOneWidget);
          expect(addToCartButton, findsOneWidget);
          await tester.tap(addToCartButton);
          expect(
            tester.widget<ElevatedButton>(addToCartButton).enabled,
            isFalse,
          );
        });

        testWidgets(
            'Add to Cart is enabled when hasMandatoryTenderContract is true and tender data is available',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  quantity: MaterialQty(2),
                  hasMandatoryTenderContract: true,
                ),
              ),
            ),
          );
          when(() => tenderContractDetailBlocMock.state).thenReturn(
            TenderContractDetailState.initial().copyWith(
              tenderContractList: tenderContractList,
            ),
          );
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final cartButtonFinder =
              find.byKey(WidgetKeys.materialDetailsAddToCartButton);
          final addToCartButton = find.byType(ElevatedButton);
          expect(cartButtonFinder, findsOneWidget);
          expect(addToCartButton, findsOneWidget);
          await tester.tap(addToCartButton);
          expect(
            tester.widget<ElevatedButton>(addToCartButton).enabled,
            isTrue,
          );
        });

        testWidgets(
            'Add to cart button pressed test when isFetching is true for tender details',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  quantity: MaterialQty(2),
                  hasMandatoryTenderContract: true,
                ),
              ),
            ),
          );
          when(() => tenderContractDetailBlocMock.state).thenReturn(
            TenderContractDetailState.initial().copyWith(
              tenderContractList: [],
              isFetching: true,
            ),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final addToCartButton =
              find.byKey(WidgetKeys.materialDetailsAddToCartButton);
          expect(addToCartButton, findsOneWidget);
          await tester.tap(addToCartButton);
          verifyNever(
            () => cartMockBloc.add(
              CartEvent.upsertCart(
                priceAggregate: PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('00000111111'),
                    isFavourite: true,
                    isSuspended: false,
                    isFOCMaterial: true,
                  ),
                  quantity: 1,
                ),
              ),
            ),
          );
        });
      });

      group('Product tag -', () {
        testWidgets('Should show gimmick tag when is gimmick material',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial()
                .copyWith
                .productDetailAggregate
                .materialInfo(isGimmick: true),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();

          expect(
            find.descendant(
              of: find.byKey(WidgetKeys.gimmickTag),
              matching: find.text('Gimmick'),
            ),
            findsOne,
          );
        });

        testWidgets('Should show sample tag when is sample material',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial()
                .copyWith
                .productDetailAggregate
                .materialInfo(isSampleMaterial: true),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();

          expect(
            find.descendant(
              of: find.byKey(WidgetKeys.sampleTag),
              matching: find.text('Sample'),
            ),
            findsOne,
          );
        });

        testWidgets('Should show poison tag when is poison material',
            (tester) async {
          when(() => productDetailMockBloc.state).thenReturn(
            ProductDetailState.initial()
                .copyWith
                .productDetailAggregate
                .materialInfo(isPoison: true),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();

          expect(
            find.descendant(
              of: find.byKey(WidgetKeys.poisonTag),
              matching: find.text('Poison'),
            ),
            findsOne,
          );
        });
      });
    },
  );
}
