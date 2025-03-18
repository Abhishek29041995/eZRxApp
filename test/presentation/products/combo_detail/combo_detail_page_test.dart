import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_name.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_group_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_qty_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_sku_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_tier_rule.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_combo.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MaterialListMockBloc
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class ProductDetailsMockBloc
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

class CartMockBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class ProductImageMockBloc
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MaterialPriceMockBloc
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class ComboDealMaterialDetailMockBloc
    extends MockBloc<ComboDealMaterialDetailEvent, ComboDealMaterialDetailState>
    implements ComboDealMaterialDetailBloc {}

class MockAppRouter extends Mock implements AppRouter {}

class MaterialPageXMock extends Mock implements AutoRoutePage {}

class MixpanelMock extends Mock implements Mixpanel {}

final locator = GetIt.instance;
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  final mockSalesOrgBloc = SalesOrgMockBloc();
  final userBlocMock = UserMockBloc();
  final materialListMockBloc = MaterialListMockBloc();
  final productDetailMockBloc = ProductDetailsMockBloc();
  final mockProductImageBloc = ProductImageMockBloc();
  final materialPriceMockBloc = MaterialPriceMockBloc();
  final comboDetailMockBloc = ComboDealMaterialDetailMockBloc();
  late EligibilityBlocMock eligibilityBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late CartBloc cartMockBloc;
  late AppRouter autoRouterMock;
  var comboMaterialsMock = <MaterialNumber, PriceAggregate>{};
  var comboMaterialsSeletedMock = <MaterialNumber, bool>{};
  const fakeCustomerName = 'fake-customer-name';

  final requiredMaterial = ComboDealMaterial.empty().copyWith(
    minQty: 4,
    materialNumber: MaterialNumber('fake-material'),
    rate: -10,
    mandatory: true,
  );
  final requiredMaterial2 = ComboDealMaterial.empty().copyWith(
    minQty: 2,
    materialNumber: MaterialNumber('fake-material2'),
    rate: -5,
    mandatory: true,
  );
  final optionalMaterial = ComboDealMaterial.empty().copyWith(
    minQty: 0,
    materialNumber: MaterialNumber('fake-optional-material'),
    rate: -5,
    mandatory: false,
  );
  final optionalMaterial2 = ComboDealMaterial.empty().copyWith(
    minQty: 0,
    materialNumber: MaterialNumber('fake-second-optional-material'),
    rate: -8,
    mandatory: false,
  );

  final comboDetailRouteData = RouteData(
    stackKey: const Key(''),
    type: const RouteType.adaptive(),
    route: RouteMatch(
      segments: const [],
      config: AutoRoute(
        page: const PageInfo(ComboDetailPageRoute.name),
        path: '/combo_detail',
      ),
      stringMatch: 'combo_detail',
      key: const ValueKey('ComboDetailPageRoute'),
    ),
    router: MockAppRouter(),
    pendingChildren: [],
  );

  final cartRouteData = RouteData(
    stackKey: const Key(''),
    type: const RouteType.adaptive(),
    route: RouteMatch(
      segments: const [],
      config: AutoRoute(
        page: const PageInfo(CartPageRoute.name),
      ),
      stringMatch: 'orders/cart',
      key: const ValueKey('CartPageRoute'),
    ),
    router: MockAppRouter(),
    pendingChildren: [],
  );

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    customerCodeBlocMock = CustomerCodeBlocMock();
    cartMockBloc = CartMockBloc();
    eligibilityBlocMock = EligibilityBlocMock();
    autoRouterMock = MockAppRouter();

    when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
    when(() => userBlocMock.state).thenReturn(
      UserState.initial().copyWith(),
    );
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial().copyWith(
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          customerName: CustomerName.empty().copyWith(name1: fakeCustomerName),
        ),
      ),
    );
    when(() => materialListMockBloc.state)
        .thenReturn(MaterialListState.initial());
    when(() => productDetailMockBloc.state)
        .thenReturn(ProductDetailState.initial());
    when(() => materialPriceMockBloc.state)
        .thenReturn(MaterialPriceState.initial());
    when(() => cartMockBloc.state).thenReturn(CartState.initial());
    when(() => comboDetailMockBloc.state)
        .thenReturn(ComboDealMaterialDetailState.initial());
    when(() => autoRouterMock.stack).thenReturn([MaterialPageXMock()]);
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      useMediaQuery: false,
      providers: [
        BlocProvider<UserBloc>(create: (context) => userBlocMock),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => customerCodeBlocMock,
        ),
        BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
        BlocProvider<EligibilityBloc>(
          create: ((context) => eligibilityBlocMock),
        ),
        BlocProvider<MaterialListBloc>(
          create: ((context) => materialListMockBloc),
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
          create: ((context) => comboDetailMockBloc),
        ),
        BlocProvider<ProductDetailBloc>(
          create: (context) => productDetailMockBloc,
        ),
      ],
      child: const ComboDetailPage(),
    );
  }

  Widget getBottomSheetScopeWidget(PriceAggregate cartItem) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      useMediaQuery: false,
      providers: [
        BlocProvider<UserBloc>(create: (context) => userBlocMock),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => customerCodeBlocMock,
        ),
        BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
        BlocProvider<EligibilityBloc>(
          create: ((context) => eligibilityBlocMock),
        ),
        BlocProvider<MaterialListBloc>(
          create: ((context) => materialListMockBloc),
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
          create: ((context) => comboDetailMockBloc),
        ),
      ],
      child: Material(
        child: DeleteComboDealBottomSheet(
          cartItem: cartItem,
        ),
      ),
    );
  }

  group(
    'Combo Details Page',
    () {
      testWidgets(
        'Load Combo Detail Page Initialize',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final comboDetailPage = find.byKey(WidgetKeys.comboDealDetailPage);
          expect(comboDetailPage, findsOneWidget);
        },
      );

      testWidgets(
        'Fetching combo detail info',
        (tester) async {
          when(() => comboDetailMockBloc.state).thenReturn(
            comboDetailMockBloc.state.copyWith(isFetchingComboInfo: true),
          );
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final appbarTitle = find.text('Combo K1');
          expect(appbarTitle, findsNothing);

          final appbarLoading = find.byKey(WidgetKeys.comboDetailTitleLoading);
          expect(appbarLoading, findsOneWidget);

          final comboRequirementLoading =
              find.byKey(WidgetKeys.comboRequirementTitleLoading);
          expect(comboRequirementLoading, findsOneWidget);

          final comboRequirementSubTitleLoading =
              find.byKey(WidgetKeys.comboRequirementSubTitleLoading);
          expect(comboRequirementSubTitleLoading, findsOneWidget);
        },
      );

      testWidgets(
        'Fetched combo detail info',
        (tester) async {
          final expectedComboDetailStates = Stream.fromIterable(
            [
              comboDetailMockBloc.state.copyWith(isFetchingComboInfo: true),
              comboDetailMockBloc.state.copyWith(isFetchingComboInfo: false),
            ],
          );

          final priceMap = {
            MaterialNumber('fake-material'): Price.empty(),
            MaterialNumber('fake-material2'): Price.empty(),
          };

          whenListen(comboDetailMockBloc, expectedComboDetailStates);

          final expectedMaterialPriceStates = Stream.fromIterable(
            [
              materialPriceMockBloc.state.copyWith(isFetching: true),
              materialPriceMockBloc.state
                  .copyWith(isFetching: false, materialPrice: priceMap),
            ],
          );

          whenListen(materialPriceMockBloc, expectedMaterialPriceStates);

          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final appbarTitle = find.text('Combo K1');

          final appbarLoading = find.byKey(WidgetKeys.comboDetailTitleLoading);

          final comboRequirementLoading =
              find.byKey(WidgetKeys.comboRequirementTitleLoading);

          final comboRequirementSubTitleLoading =
              find.byKey(WidgetKeys.comboRequirementSubTitleLoading);

          final backButton = find.byKey(WidgetKeys.backButton);

          final confirmBottomSheet = find.byType(ConfirmBottomSheet);

          final confirmButton =
              find.byKey(WidgetKeys.confirmBottomSheetConfirmButton);

          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          expect(appbarTitle, findsOneWidget);

          expect(appbarLoading, findsNothing);

          expect(comboRequirementLoading, findsNothing);

          expect(comboRequirementSubTitleLoading, findsNothing);

          verify(
            () => comboDetailMockBloc.add(
              ComboDealMaterialDetailEvent.setPriceInfo(
                priceMap: {
                  MaterialNumber('fake-material'): MaterialPriceDetail.empty(),
                  MaterialNumber('fake-material2'): MaterialPriceDetail.empty(),
                },
              ),
            ),
          ).called(1);

          await tester.tap(backButton);
          await tester.pumpAndSettle();
          expect(confirmBottomSheet, findsOneWidget);

          expect(confirmButton, findsOneWidget);

          when(() => autoRouterMock.maybePop())
              .thenAnswer((invocation) async => true);

          when(() => autoRouterMock.currentPath).thenReturn('fake-path');

          await tester.tap(confirmButton);
          await tester.pump();

          expect(autoRouterMock.currentPath != 'combo_detail', true);
        },
      );

      testWidgets(
        'Load Edit Combo Detail Page',
        (tester) async {
          final comboDeal = ComboDeal.empty().copyWith(
            materialComboDeals: [
              ComboDealMaterialSet(
                materials: [requiredMaterial, requiredMaterial2],
                setNo: 'fake-set',
              ),
            ],
          );
          final fakeCartCombo = PriceAggregate.empty().copyWith(
            quantity: 3,
            comboDeal: comboDeal,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: requiredMaterial.materialNumber,
            ),
          );

          when(() => comboDetailMockBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              isUpdateCart: true,
              isFetchingComboInfo: false,
              items: {requiredMaterial.materialNumber: fakeCartCombo},
              selectedItems: {
                requiredMaterial.materialNumber: true,
              },
            ),
          );
          when(() => mockProductImageBloc.state).thenReturn(
            ProductImageState.initial().copyWith(
              productImageMap: <MaterialNumber, ProductImages>{
                requiredMaterial.materialNumber: ProductImages.empty().copyWith(
                  materialNumber: requiredMaterial.materialNumber,
                  image: [
                    'fake-image-1',
                    'fake-image-2',
                  ],
                ),
              },
            ),
          );
          when(() => cartMockBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: [fakeCartCombo],
            ),
          );

          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final comboDetailPage = find.byKey(WidgetKeys.comboDealDetailPage);
          expect(comboDetailPage, findsOneWidget);

          final deleteButton = find.byKey(WidgetKeys.comboDeteleButton);
          expect(deleteButton, findsOneWidget);

          await tester.tap(deleteButton);
          await tester.pump();

          final deleteBottomSheet = find.byType(DeleteComboDealBottomSheet);
          expect(deleteBottomSheet, findsOneWidget);
        },
      );

      testWidgets(
        'Load Edit Combo Detail Page - Search bar',
        (tester) async {
          final comboDeal = ComboDeal.empty().copyWith(
            materialComboDeals: [
              ComboDealMaterialSet(
                materials: [requiredMaterial, requiredMaterial2],
                setNo: 'fake-set',
              ),
            ],
          );
          final fakeCartCombo = PriceAggregate.empty().copyWith(
            quantity: 3,
            comboDeal: comboDeal,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: requiredMaterial.materialNumber,
            ),
          );

          when(() => comboDetailMockBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              isUpdateCart: true,
              isFetchingComboInfo: false,
              items: {requiredMaterial.materialNumber: fakeCartCombo},
              selectedItems: {
                requiredMaterial.materialNumber: true,
              },
              searchKey: SearchKey.search('fake'),
            ),
          );
          when(() => mockProductImageBloc.state).thenReturn(
            ProductImageState.initial().copyWith(
              productImageMap: <MaterialNumber, ProductImages>{
                requiredMaterial.materialNumber: ProductImages.empty().copyWith(
                  materialNumber: requiredMaterial.materialNumber,
                  image: [
                    'fake-image-1',
                    'fake-image-2',
                  ],
                ),
              },
            ),
          );
          when(() => cartMockBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: [fakeCartCombo],
            ),
          );

          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final comboDetailPage = find.byKey(WidgetKeys.comboDealDetailPage);
          expect(comboDetailPage, findsOneWidget);

          final searchBar = find.byType(CustomSearchBar);
          expect(searchBar, findsOneWidget);

          await tester.enterText(searchBar, 'fake-material');
          await tester.pump(const Duration(microseconds: 200));
          await tester.testTextInput.receiveAction(TextInputAction.done);

          verify(
            () => comboDetailMockBloc.add(
              ComboDealMaterialDetailEvent.search(
                searchKey: SearchKey.search('fake-material'),
              ),
            ),
          ).called(1);

          final clearIcon = find.byKey(WidgetKeys.clearIconKey);
          expect(clearIcon, findsOneWidget);
          await tester.tap(clearIcon);
          await tester.pump();
          verify(
            () => comboDetailMockBloc.add(
              const ComboDealMaterialDetailEvent.clearSearch(),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Load Edit Combo Detail Page - Material detail section',
        (tester) async {
          final comboDeal = ComboDeal.empty().copyWith(
            materialComboDeals: [
              ComboDealMaterialSet(
                materials: [requiredMaterial, requiredMaterial2],
                setNo: 'fake-set',
              ),
            ],
          );
          final fakeCartCombo = PriceAggregate.empty().copyWith(
            quantity: 3,
            comboDeal: comboDeal,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: requiredMaterial.materialNumber,
            ),
          );

          when(() => comboDetailMockBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              isUpdateCart: true,
              isFetchingComboInfo: false,
              items: {requiredMaterial.materialNumber: fakeCartCombo},
              selectedItems: {
                requiredMaterial.materialNumber: true,
              },
            ),
          );
          when(() => mockProductImageBloc.state).thenReturn(
            ProductImageState.initial().copyWith(
              productImageMap: <MaterialNumber, ProductImages>{
                requiredMaterial.materialNumber: ProductImages.empty().copyWith(
                  materialNumber: requiredMaterial.materialNumber,
                  image: [
                    'fake-image-1',
                    'fake-image-2',
                  ],
                ),
              },
            ),
          );
          when(
            () => autoRouterMock.push(
              ProductDetailsPageRoute(
                materialInfo: fakeCartCombo.materialInfo,
              ),
            ),
          ).thenAnswer((invocation) => Future(() => null));

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
                enableComboDeals: true,
                enableZDP5: true,
                salesOrg: SalesOrg('3070'),
                comboDealsUserRole: ComboDealUserRole(1),
              ),
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                salesDeals: [SalesDealNumber('fake-sale-deal')],
                customerName:
                    CustomerName.empty().copyWith(name1: fakeCustomerName),
              ),
            ),
          );

          when(
            () => autoRouterMock.push(
              ProductDetailsPageRoute(materialInfo: MaterialInfo.empty()),
            ),
          ).thenAnswer((invocation) async => true);

          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final searchBar = find.byType(CustomSearchBar);
          expect(searchBar, findsOneWidget);

          final totalMaterials = find.byKey(WidgetKeys.totalMaterialItemCount);
          expect(totalMaterials, findsOneWidget);

          final comboMaterialList =
              find.byKey(WidgetKeys.comboDetailMaterialList);
          expect(comboMaterialList, findsOneWidget);

          final materialImage = find.byKey(
            WidgetKeys.comboItemImageDetail(
              fakeCartCombo.getMaterialNumber.displayMatNo,
            ),
          );
          expect(materialImage, findsOneWidget);

          await tester.tap(materialImage);
          await tester.pump();
          verify(
            () => autoRouterMock.push(
              ProductDetailsPageRoute(
                materialInfo: fakeCartCombo.materialInfo,
              ),
            ),
          ).called(1);

          await tester.pump();
        },
      );

      testWidgets(
        'Delete bottomsheet combo detail',
        (tester) async {
          final comboDeal = ComboDeal.empty().copyWith(
            materialComboDeals: [
              ComboDealMaterialSet(
                materials: [requiredMaterial, requiredMaterial2],
                setNo: 'fake-set',
              ),
            ],
          );
          final fakeCartCombo = PriceAggregate.empty().copyWith(
            quantity: 3,
            comboDeal: comboDeal,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: requiredMaterial.materialNumber,
            ),
          );

          when(() => comboDetailMockBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              isUpdateCart: true,
              isFetchingComboInfo: false,
              items: {requiredMaterial.materialNumber: fakeCartCombo},
              selectedItems: {
                requiredMaterial.materialNumber: true,
              },
            ),
          );

          when(() => cartMockBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: [fakeCartCombo],
            ),
          );

          when(() => autoRouterMock.maybePop())
              .thenAnswer((invocation) async => true);

          final expectedCartStates = Stream.fromIterable(
            [
              cartMockBloc.state.copyWith(isDeleteCombo: false),
              cartMockBloc.state.copyWith(isDeleteCombo: true),
            ],
          );

          whenListen(cartMockBloc, expectedCartStates);

          when(() => autoRouterMock.current).thenReturn(comboDetailRouteData);

          await tester.pumpWidget(getBottomSheetScopeWidget(fakeCartCombo));
          await tester.pump();

          final deleteConfirmButton =
              find.byKey(WidgetKeys.comboDeteleConfirmButton);
          expect(deleteConfirmButton, findsOneWidget);

          await tester.tap(deleteConfirmButton);
          await tester.pump();

          verify(
            () => cartMockBloc.add(
              CartEvent.upsertCartItemsWithComboOffers(
                priceAggregates:
                    fakeCartCombo.convertComboItemToPriceAggregateList
                        .map(
                          (e) => e.copyWith(
                            quantity: 0,
                            price: e.price.copyWith(
                              comboDeal: e.price.comboDeal.copyWith(
                                isEligible: false,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                isDeleteCombo: true,
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Delete cart button listener trigger from combo detail',
        (tester) async {
          final comboDeal = ComboDeal.empty().copyWith(
            materialComboDeals: [
              ComboDealMaterialSet(
                materials: [requiredMaterial, requiredMaterial2],
                setNo: 'fake-set',
              ),
            ],
          );
          final fakeCartCombo = PriceAggregate.empty().copyWith(
            quantity: 3,
            comboDeal: comboDeal,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: requiredMaterial.materialNumber,
            ),
          );

          when(() => comboDetailMockBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              isUpdateCart: true,
              isFetchingComboInfo: false,
              items: {requiredMaterial.materialNumber: fakeCartCombo},
              selectedItems: {
                requiredMaterial.materialNumber: true,
              },
            ),
          );
          when(() => mockProductImageBloc.state).thenReturn(
            ProductImageState.initial().copyWith(
              productImageMap: <MaterialNumber, ProductImages>{
                requiredMaterial.materialNumber: ProductImages.empty().copyWith(
                  materialNumber: requiredMaterial.materialNumber,
                  image: [
                    'fake-image-1',
                    'fake-image-2',
                  ],
                ),
              },
            ),
          );

          when(() => cartMockBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: [fakeCartCombo],
            ),
          );

          when(() => autoRouterMock.current).thenReturn(comboDetailRouteData);

          final expectedCartStates = Stream.fromIterable(
            [
              cartMockBloc.state.copyWith(isDeleteCombo: false),
              cartMockBloc.state.copyWith(isDeleteCombo: true),
            ],
          );

          whenListen(cartMockBloc, expectedCartStates);

          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final deleteButton = find.byKey(WidgetKeys.comboDeteleButton);
          expect(deleteButton, findsOneWidget);

          verify(
            () => comboDetailMockBloc.add(
              const ComboDealMaterialDetailEvent.clearSelectedItem(),
            ),
          ).called(1);

          verify(
            () => comboDetailMockBloc.add(
              const ComboDealMaterialDetailEvent.cartContainsCurrentCombo(
                contain: false,
              ),
            ),
          ).called(1);

          await tester.pump(const Duration(milliseconds: 500));

          final snackbar = find.byType(CustomSnackBar);
          expect(snackbar, findsOneWidget);
        },
      );

      testWidgets(
        'Delete cart button listener trigger from cart',
        (tester) async {
          final comboDeal = ComboDeal.empty().copyWith(
            materialComboDeals: [
              ComboDealMaterialSet(
                materials: [requiredMaterial, requiredMaterial2],
                setNo: 'fake-set',
              ),
            ],
          );
          final fakeCartCombo = PriceAggregate.empty().copyWith(
            quantity: 3,
            comboDeal: comboDeal,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: requiredMaterial.materialNumber,
            ),
          );

          when(() => comboDetailMockBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              isUpdateCart: true,
              isFetchingComboInfo: false,
              items: {requiredMaterial.materialNumber: fakeCartCombo},
              selectedItems: {
                requiredMaterial.materialNumber: true,
              },
            ),
          );
          when(() => mockProductImageBloc.state).thenReturn(
            ProductImageState.initial().copyWith(
              productImageMap: <MaterialNumber, ProductImages>{
                requiredMaterial.materialNumber: ProductImages.empty().copyWith(
                  materialNumber: requiredMaterial.materialNumber,
                  image: [
                    'fake-image-1',
                    'fake-image-2',
                  ],
                ),
              },
            ),
          );

          when(() => cartMockBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: [fakeCartCombo],
            ),
          );

          when(() => autoRouterMock.stack).thenReturn([
            AutoRoutePage(
              routeData: cartRouteData,
              child: const CartPage(),
            ),
            AutoRoutePage(
              routeData: cartRouteData,
              child: const CartPage(),
            ),
            AutoRoutePage(
              routeData: comboDetailRouteData,
              child: const ComboDetailPage(),
            ),
          ]);

          when(() => autoRouterMock.current).thenReturn(comboDetailRouteData);

          when(() => autoRouterMock.maybePop())
              .thenAnswer((invocation) async => true);

          final expectedCartStates = Stream.fromIterable(
            [
              cartMockBloc.state.copyWith(isDeleteCombo: false),
              cartMockBloc.state.copyWith(isDeleteCombo: true),
            ],
          );

          whenListen(cartMockBloc, expectedCartStates);

          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final deleteButton = find.byKey(WidgetKeys.comboDeteleButton);
          expect(deleteButton, findsOneWidget);

          verify(
            () => comboDetailMockBloc.add(
              const ComboDealMaterialDetailEvent.clearSelectedItem(),
            ),
          ).called(1);

          verify(
            () => comboDetailMockBloc.add(
              const ComboDealMaterialDetailEvent.cartContainsCurrentCombo(
                contain: false,
              ),
            ),
          ).called(1);
        },
      );
    },
  );

  group(
    'Combo Details K1',
    () {
      setUp(() {
        final comboDeal = ComboDeal.empty().copyWith(
          materialComboDeals: [
            ComboDealMaterialSet(
              materials: [requiredMaterial, requiredMaterial2],
              setNo: 'fake-set',
            ),
          ],
        );
        comboMaterialsMock = {
          MaterialNumber('fake-material'): PriceAggregate.empty().copyWith(
            quantity: 4,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-material'),
            ),
            comboDeal: comboDeal,
          ),
          MaterialNumber('fake-material2'): PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-material2'),
            ),
            comboDeal: comboDeal,
          ),
        };
        comboMaterialsSeletedMock = {
          MaterialNumber('fake-material'): true,
          MaterialNumber('fake-material2'): true,
        };
        when(() => comboDetailMockBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: comboMaterialsMock,
            materialCount: comboMaterialsMock.length,
            selectedItems: comboMaterialsSeletedMock,
          ),
        );
        when(() => mockProductImageBloc.state).thenReturn(
          ProductImageState.initial().copyWith(
            productImageMap: <MaterialNumber, ProductImages>{
              requiredMaterial.materialNumber: ProductImages.empty().copyWith(
                materialNumber: requiredMaterial.materialNumber,
                image: [
                  'fake-image-1',
                  'fake-image-2',
                ],
              ),
            },
          ),
        );
      });

      testWidgets(
        'Appbar title',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final appbarTitle = find.text('Combo K1');
          expect(appbarTitle, findsOneWidget);
        },
      );

      testWidgets(
        'Requirement section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final requirementMessage =
              find.text('Purchase all items with min. of its quantity.');
          expect(requirementMessage, findsOneWidget);

          final discountOnMessage = find.text('Per item');
          expect(discountOnMessage, findsOneWidget);
        },
      );

      testWidgets(
        'Body section',
        (tester) async {
          tester.view.physicalSize = const Size(1080, 1920);
          tester.view.devicePixelRatio = 1.0;
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final comboFixedList = find.byKey(WidgetKeys.comboDetailFixedList);
          expect(comboFixedList, findsNothing);

          final selectAtLeastMessage = find.text(
            'Select at least one product from the below section to receive offered price',
          );
          expect(selectAtLeastMessage, findsNothing);

          final searchBar = find.byType(CustomSearchBar);
          expect(searchBar, findsOneWidget);

          final totalMaterials = find.byKey(WidgetKeys.totalMaterialItemCount);
          expect(totalMaterials, findsOneWidget);

          final comboMaterialList =
              find.byKey(WidgetKeys.comboDetailMaterialList);
          expect(comboMaterialList, findsOneWidget);

          final cartItemQuantityInputKey =
              find.byType(CartItemQuantityInput).first;
          expect(cartItemQuantityInputKey, findsOneWidget);
          final cartItemAddKey =
              find.byKey(WidgetKeys.increaseQuantityKey).first;
          expect(cartItemAddKey, findsOneWidget);
          final cartItemDeleteKey =
              find.byKey(WidgetKeys.decreaseQuantityKey).first;
          expect(cartItemDeleteKey, findsOneWidget);
          final quantityInputTextKey =
              find.byKey(WidgetKeys.quantityInputTextKey).first;
          expect(quantityInputTextKey, findsOneWidget);
          await tester.tap(cartItemAddKey, warnIfMissed: false);
          await tester.pump();
          verify(
            () => comboDetailMockBloc.add(
              ComboDealMaterialDetailEvent.updateItemQuantity(
                item: MaterialNumber('fake-material'),
                qty: 5,
              ),
            ),
          ).called(1);
          await tester.tap(cartItemDeleteKey, warnIfMissed: false);
          await tester.pump();
          verify(
            () => comboDetailMockBloc.add(
              ComboDealMaterialDetailEvent.updateItemQuantity(
                item: MaterialNumber('fake-material'),
                qty: 4,
              ),
            ),
          ).called(1);
          await tester.enterText(quantityInputTextKey, '6');
          await tester.pump();
          verify(
            () => comboDetailMockBloc.add(
              ComboDealMaterialDetailEvent.updateItemQuantity(
                item: MaterialNumber('fake-material'),
                qty: 6,
              ),
            ),
          ).called(1);

          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          verify(
            () => comboDetailMockBloc.add(
              ComboDealMaterialDetailEvent.updateItemQuantity(
                item: MaterialNumber('fake-material'),
                qty: 6,
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Add to cart section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsNothing);

          final notEligibleMessageContent = find.text(
            'You must select at least ${comboMaterialsMock.values.first.comboDeal.minPurchaseQty} items',
          );
          expect(notEligibleMessageContent, findsNothing);

          final totalUnitMessage =
              find.text('${comboMaterialsSeletedMock.length} items');
          expect(totalUnitMessage, findsOneWidget);

          final comboRateDiscounted =
              find.byKey(WidgetKeys.comboRateDiscounted);
          expect(comboRateDiscounted, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsOneWidget);

          final checkoutButton =
              find.byKey(WidgetKeys.comboDealAddOrEditComboButton);
          expect(checkoutButton, findsOneWidget);

          await tester.tap(checkoutButton);
          await tester.pump();

          verify(
            () => cartMockBloc.add(
              CartEvent.upsertCartItemsWithComboOffers(
                priceAggregates: comboMaterialsMock.values.toList(),
                isDeleteCombo: false,
              ),
            ),
          ).called(1);
        },
      );
    },
  );

  group(
    'Combo Details K2.1',
    () {
      setUp(() {
        final comboDeal = ComboDeal.empty().copyWith(
          groupDeal: ComboDealGroupDeal.empty().copyWith(
            rate: -15,
          ),
          materialComboDeals: [
            ComboDealMaterialSet(
              materials: [requiredMaterial],
              setNo: 'fake-set',
            ),
            ComboDealMaterialSet(
              materials: [optionalMaterial],
              setNo: 'fake-set-optional',
            ),
          ],
        );

        comboMaterialsMock = {
          MaterialNumber('fake-material'): PriceAggregate.empty().copyWith(
            quantity: 4,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-material'),
            ),
            comboDeal: comboDeal,
          ),
          MaterialNumber('fake-optional-material'):
              PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-optional-material'),
            ),
            comboDeal: comboDeal,
          ),
        };

        comboMaterialsSeletedMock = {
          MaterialNumber('fake-material'): true,
          MaterialNumber('fake-optional-material'): false,
        };
        when(() => comboDetailMockBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: comboMaterialsMock,
            materialCount: comboMaterialsMock.length,
            selectedItems: comboMaterialsSeletedMock,
          ),
        );
        when(() => mockProductImageBloc.state).thenReturn(
          ProductImageState.initial().copyWith(
            productImageMap: <MaterialNumber, ProductImages>{
              requiredMaterial.materialNumber: ProductImages.empty().copyWith(
                materialNumber: requiredMaterial.materialNumber,
                image: [
                  'fake-image-1',
                  'fake-image-2',
                ],
              ),
            },
          ),
        );
      });

      testWidgets(
        'Appbar title',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final appbarTitle = find.text('Combo K2.1');
          expect(appbarTitle, findsOneWidget);
        },
      );

      testWidgets(
        'Requirement section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final requirementMessage = find.text(
            'Purchase FIXED product with min. of its quantity and any product in the list.',
          );
          expect(requirementMessage, findsOneWidget);

          final discountOnMessage = find.text('Per item');
          expect(discountOnMessage, findsOneWidget);
        },
      );

      testWidgets(
        'Body section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final comboFixedList = find.byKey(WidgetKeys.comboDetailFixedList);
          expect(comboFixedList, findsOneWidget);

          final selectAtLeastMessage = find.text(
            'Select at least one product from the below section to receive offered price',
          );
          expect(selectAtLeastMessage, findsOneWidget);

          final searchBar = find.byType(CustomSearchBar);
          expect(searchBar, findsOneWidget);

          final totalMaterials = find.byKey(WidgetKeys.totalMaterialItemCount);
          expect(totalMaterials, findsOneWidget);

          final comboMaterialList =
              find.byKey(WidgetKeys.comboDetailMaterialList);
          expect(comboMaterialList, findsOneWidget);

          final fixedItem =
              find.byKey(WidgetKeys.comboItemProductTile('fake-material'));
          expect(fixedItem, findsOneWidget);

          await tester.tap(fixedItem);
          await tester.pump();

          verifyNever(
            () => comboDetailMockBloc.add(
              ComboDealMaterialDetailEvent.updateItemSelection(
                item: MaterialNumber('fake-material'),
              ),
            ),
          );
        },
      );

      testWidgets(
        'Add to cart section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsOneWidget);

          final notEligibleMessageContent = find.text(
            'You must select at least ${comboMaterialsMock.values.first.comboDeal.minPurchaseQty} more product.',
          );
          expect(notEligibleMessageContent, findsOneWidget);

          final materialsSelected = comboMaterialsSeletedMock.entries
              .where((element) => element.value)
              .toList();

          final totalUnitMessage =
              find.text('${materialsSelected.length} items');
          expect(totalUnitMessage, findsOneWidget);

          final comboRateDiscounted =
              find.byKey(WidgetKeys.comboRateDiscounted);
          expect(comboRateDiscounted, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsNothing);

          final checkoutButton =
              find.byKey(WidgetKeys.comboDealAddOrEditComboButton);
          expect(checkoutButton, findsOneWidget);
        },
      );
    },
  );

  group(
    'Combo Details K2.2',
    () {
      setUp(() {
        final comboDeal = ComboDeal.empty().copyWith(
          flexiQtyTier: [
            ComboDealQtyTier.empty().copyWith(minQty: 3, rate: -12),
          ],
          materialComboDeals: [
            ComboDealMaterialSet(
              materials: [optionalMaterial, optionalMaterial2],
              setNo: 'fake-set',
            ),
          ],
        );

        comboMaterialsMock = {
          MaterialNumber('fake-optional-material'):
              PriceAggregate.empty().copyWith(
            quantity: 4,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-optional-material'),
            ),
            comboDeal: comboDeal,
          ),
          MaterialNumber('fake-second-optional-material'):
              PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-second-optional-material'),
            ),
            comboDeal: comboDeal,
          ),
        };

        comboMaterialsSeletedMock = {
          MaterialNumber('fake-optional-material'): false,
          MaterialNumber('fake-second-optional-material'): false,
        };
        when(() => comboDetailMockBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: comboMaterialsMock,
            materialCount: comboMaterialsMock.length,
            selectedItems: comboMaterialsSeletedMock,
          ),
        );
        when(() => mockProductImageBloc.state).thenReturn(
          ProductImageState.initial().copyWith(
            productImageMap: <MaterialNumber, ProductImages>{
              requiredMaterial.materialNumber: ProductImages.empty().copyWith(
                materialNumber: requiredMaterial.materialNumber,
                image: [
                  'fake-image-1',
                  'fake-image-2',
                ],
              ),
            },
          ),
        );
      });

      testWidgets(
        'Appbar title',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final appbarTitle = find.text('Combo K2.2');
          expect(appbarTitle, findsOneWidget);
        },
      );

      testWidgets(
        'Requirement section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final requirementMessage = find.text(
            'Purchase any products with min. ${comboMaterialsMock.values.first.comboDeal.minPurchaseQty} of total quantity.',
          );
          expect(requirementMessage, findsOneWidget);

          final discountOnMessage = find.text('Total Quantity');
          expect(discountOnMessage, findsOneWidget);
        },
      );

      testWidgets(
        'Body section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final comboFixedList = find.byKey(WidgetKeys.comboDetailFixedList);
          expect(comboFixedList, findsNothing);

          final selectAtLeastMessage = find.text(
            'Select at least one product from the below section to receive offered price',
          );
          expect(selectAtLeastMessage, findsNothing);

          final searchBar = find.byType(CustomSearchBar);
          expect(searchBar, findsOneWidget);

          final totalMaterials = find.byKey(WidgetKeys.totalMaterialItemCount);
          expect(totalMaterials, findsOneWidget);

          final comboMaterialList =
              find.byKey(WidgetKeys.comboDetailMaterialList);
          expect(comboMaterialList, findsOneWidget);
        },
      );

      testWidgets(
        'Add to cart section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsOneWidget);

          final notEligibleMessageContent = find.text(
            'You must select at least ${comboMaterialsMock.values.first.comboDeal.schemeMinimumQtyRequirement} items.'
                .tr(),
          );
          expect(notEligibleMessageContent, findsOneWidget);

          final materialsSelected = comboMaterialsSeletedMock.entries
              .where((element) => element.value)
              .toList();

          final totalUnitMessage =
              find.text('${'Total qty'.tr()}: ${materialsSelected.length}');
          expect(totalUnitMessage, findsOneWidget);

          final comboRateDiscounted =
              find.byKey(WidgetKeys.comboRateDiscounted);
          expect(comboRateDiscounted, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsNothing);

          final checkoutButton =
              find.byKey(WidgetKeys.comboDealAddOrEditComboButton);
          expect(checkoutButton, findsOneWidget);
        },
      );
    },
  );

  group(
    'Combo Details K3',
    () {
      setUp(() {
        final firstSKUTier =
            ComboDealSKUTier.empty().copyWith(minQty: 2, rate: -12);
        final secondSKUTier =
            ComboDealSKUTier.empty().copyWith(minQty: 3, rate: -20);
        final comboDeal = ComboDeal.empty().copyWith(
          flexiSKUTier: [
            firstSKUTier,
            secondSKUTier,
          ],
          materialComboDeals: [
            ComboDealMaterialSet(
              materials: [optionalMaterial, optionalMaterial2],
              setNo: 'fake-set',
            ),
          ],
        );

        comboMaterialsMock = {
          MaterialNumber('fake-material'): PriceAggregate.empty().copyWith(
            quantity: 1,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-material'),
            ),
            comboDeal: comboDeal,
          ),
          MaterialNumber('fake-optional-material'):
              PriceAggregate.empty().copyWith(
            quantity: 4,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-optional-material'),
            ),
            comboDeal: comboDeal,
          ),
          MaterialNumber('fake-second-optional-material'):
              PriceAggregate.empty().copyWith(
            quantity: 3,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-second-optional-material'),
            ),
            comboDeal: comboDeal,
          ),
        };

        comboMaterialsSeletedMock = {
          MaterialNumber('fake-material'): false,
          MaterialNumber('fake-optional-material'): false,
          MaterialNumber('fake-second-optional-material'): false,
        };
        when(() => comboDetailMockBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: comboMaterialsMock,
            materialCount: comboMaterialsMock.length,
            selectedItems: comboMaterialsSeletedMock,
          ),
        );
        when(() => mockProductImageBloc.state).thenReturn(
          ProductImageState.initial().copyWith(
            productImageMap: <MaterialNumber, ProductImages>{
              requiredMaterial.materialNumber: ProductImages.empty().copyWith(
                materialNumber: requiredMaterial.materialNumber,
                image: [
                  'fake-image-1',
                  'fake-image-2',
                ],
              ),
            },
          ),
        );
      });

      testWidgets(
        'Appbar title',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final appbarTitle = find.text('Combo K3');
          expect(appbarTitle, findsOneWidget);
        },
      );

      testWidgets(
        'Requirement section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final requirementMessage = find.text(
            'Purchase different products with min. of its quantity. Buy more save more.',
          );
          expect(requirementMessage, findsOneWidget);

          final discountOnMessage = find.text('Total SKUs');
          expect(discountOnMessage, findsOneWidget);
        },
      );

      testWidgets(
        'Body section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final comboFixedList = find.byKey(WidgetKeys.comboDetailFixedList);
          expect(comboFixedList, findsNothing);

          final selectAtLeastMessage = find.text(
            'Select at least one product from the below section to receive offered price',
          );
          expect(selectAtLeastMessage, findsNothing);

          final searchBar = find.byType(CustomSearchBar);
          expect(searchBar, findsOneWidget);

          final totalMaterials = find.byKey(WidgetKeys.totalMaterialItemCount);
          expect(totalMaterials, findsOneWidget);

          final comboMaterialList =
              find.byKey(WidgetKeys.comboDetailMaterialList);
          expect(comboMaterialList, findsOneWidget);
        },
      );

      testWidgets(
        'Add to cart section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsOneWidget);

          final notEligibleMessageContent = find.text(
            'You must select at least ${comboMaterialsMock.values.first.comboDeal.minPurchaseQty} more product.',
          );
          expect(notEligibleMessageContent, findsOneWidget);

          final materialsSelected = comboMaterialsSeletedMock.entries
              .where((element) => element.value)
              .toList();

          final totalUnitMessage =
              find.text('${materialsSelected.length} items');
          expect(totalUnitMessage, findsOneWidget);

          final comboRateDiscounted =
              find.byKey(WidgetKeys.comboRateDiscounted);
          expect(comboRateDiscounted, findsNothing);

          final checkoutButton =
              find.byKey(WidgetKeys.comboDealAddOrEditComboButton);
          expect(checkoutButton, findsOneWidget);
        },
      );

      testWidgets(
        'Next deal info - Next deal display',
        (tester) async {
          comboMaterialsSeletedMock = {
            MaterialNumber('fake-material'): true,
            MaterialNumber('fake-optional-material'): true,
            MaterialNumber('fake-second-optional-material'): false,
          };
          when(() => comboDetailMockBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              items: comboMaterialsMock,
              materialCount: comboMaterialsMock.length,
              selectedItems: comboMaterialsSeletedMock,
            ),
          );

          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsOneWidget);

          final nextDealIcon = find.byKey(WidgetKeys.comboNextDealIcon);
          expect(nextDealIcon, findsOneWidget);

          final bestDealIcon = find.byKey(WidgetKeys.comboBestDealIcon);
          expect(bestDealIcon, findsNothing);

          final nextDealText =
              find.text('Buy 1 more items to get 20% discount');
          expect(nextDealText, findsOneWidget);

          final bestDealText = find.text('Yay! You’ve got the best deal.');
          expect(bestDealText, findsNothing);
        },
      );

      testWidgets(
        'Next deal info - Best deal display',
        (tester) async {
          comboMaterialsSeletedMock = {
            MaterialNumber('fake-material'): true,
            MaterialNumber('fake-optional-material'): true,
            MaterialNumber('fake-second-optional-material'): true,
          };
          when(() => comboDetailMockBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              items: comboMaterialsMock,
              materialCount: comboMaterialsMock.length,
              selectedItems: comboMaterialsSeletedMock,
            ),
          );

          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsOneWidget);

          final nextDealIcon = find.byKey(WidgetKeys.comboNextDealIcon);
          expect(nextDealIcon, findsNothing);

          final bestDealIcon = find.byKey(WidgetKeys.comboBestDealIcon);
          expect(bestDealIcon, findsOneWidget);

          final nextDealText =
              find.text('Buy 1 more items to get 20% discount');
          expect(nextDealText, findsNothing);

          final bestDealText = find.text('Yay! You’ve got the best deal.');
          expect(bestDealText, findsOneWidget);
        },
      );
    },
  );

  group(
    'Combo Details K4',
    () {
      setUp(() {
        final firstQtyTier =
            ComboDealQtyTier.empty().copyWith(minQty: 3, rate: -12);
        final secondQtyTier =
            ComboDealQtyTier.empty().copyWith(minQty: 7, rate: -20);
        final comboDeal = ComboDeal.empty().copyWith(
          flexiQtyTier: [
            firstQtyTier,
            secondQtyTier,
          ],
          materialComboDeals: [
            ComboDealMaterialSet(
              materials: [optionalMaterial, optionalMaterial2],
              setNo: 'fake-set',
            ),
          ],
        );

        comboMaterialsMock = {
          MaterialNumber('fake-optional-material'):
              PriceAggregate.empty().copyWith(
            quantity: 4,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-optional-material'),
            ),
            comboDeal: comboDeal,
          ),
          MaterialNumber('fake-second-optional-material'):
              PriceAggregate.empty().copyWith(
            quantity: 4,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-second-optional-material'),
            ),
            comboDeal: comboDeal,
          ),
        };

        comboMaterialsSeletedMock = {
          MaterialNumber('fake-optional-material'): false,
          MaterialNumber('fake-second-optional-material'): false,
        };
        when(() => comboDetailMockBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: comboMaterialsMock,
            materialCount: comboMaterialsMock.length,
            selectedItems: comboMaterialsSeletedMock,
          ),
        );
        when(() => mockProductImageBloc.state).thenReturn(
          ProductImageState.initial().copyWith(
            productImageMap: <MaterialNumber, ProductImages>{
              requiredMaterial.materialNumber: ProductImages.empty().copyWith(
                materialNumber: requiredMaterial.materialNumber,
                image: [
                  'fake-image-1',
                  'fake-image-2',
                ],
              ),
            },
          ),
        );
      });

      testWidgets(
        'Appbar title',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final appbarTitle = find.text('Combo K4');
          expect(appbarTitle, findsOneWidget);
        },
      );

      testWidgets(
        'Requirement section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final requirementMessage = find.text(
            'Purchase min. ${comboMaterialsMock.values.first.comboDeal.minPurchaseQty} items from any of these products. Buy more save more.',
          );
          expect(requirementMessage, findsOneWidget);

          final discountOnMessage = find.text('Total Quantity');
          expect(discountOnMessage, findsOneWidget);
        },
      );

      testWidgets(
        'Body section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final comboFixedList = find.byKey(WidgetKeys.comboDetailFixedList);
          expect(comboFixedList, findsNothing);

          final selectAtLeastMessage = find.text(
            'Select at least one product from the below section to receive offered price',
          );
          expect(selectAtLeastMessage, findsNothing);

          final searchBar = find.byType(CustomSearchBar);
          expect(searchBar, findsOneWidget);

          final totalMaterials = find.byKey(WidgetKeys.totalMaterialItemCount);
          expect(totalMaterials, findsOneWidget);

          final comboMaterialList =
              find.byKey(WidgetKeys.comboDetailMaterialList);
          expect(comboMaterialList, findsOneWidget);
        },
      );

      testWidgets(
        'Add to cart section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsOneWidget);

          final notEligibleMessageContent = find.text(
            'You must select at least ${comboMaterialsMock.values.first.comboDeal.schemeMinimumQtyRequirement} items.'
                .tr(),
          );
          expect(notEligibleMessageContent, findsOneWidget);

          final materialsSelected = comboMaterialsSeletedMock.entries
              .where((element) => element.value)
              .toList();

          final totalUnitMessage =
              find.text('${'Total qty'.tr()}: ${materialsSelected.length}');
          expect(totalUnitMessage, findsOneWidget);

          final comboRateDiscounted =
              find.byKey(WidgetKeys.comboRateDiscounted);
          expect(comboRateDiscounted, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsNothing);

          final checkoutButton =
              find.byKey(WidgetKeys.comboDealAddOrEditComboButton);
          expect(checkoutButton, findsOneWidget);
        },
      );

      testWidgets(
        'Next deal info - Next deal display',
        (tester) async {
          comboMaterialsSeletedMock = {
            MaterialNumber('fake-optional-material'): true,
            MaterialNumber('fake-second-optional-material'): false,
          };
          when(() => comboDetailMockBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              items: comboMaterialsMock,
              materialCount: comboMaterialsMock.length,
              selectedItems: comboMaterialsSeletedMock,
            ),
          );

          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsOneWidget);

          final nextDealIcon = find.byKey(WidgetKeys.comboNextDealIcon);
          expect(nextDealIcon, findsOneWidget);

          final bestDealIcon = find.byKey(WidgetKeys.comboBestDealIcon);
          expect(bestDealIcon, findsNothing);

          final nextDealText = find.text('Buy 3 more to get 20% discount');
          expect(nextDealText, findsOneWidget);

          final bestDealText = find.text('Yay! You’ve got the best deal.');
          expect(bestDealText, findsNothing);
        },
      );

      testWidgets(
        'Next deal info - Best deal display',
        (tester) async {
          comboMaterialsSeletedMock = {
            MaterialNumber('fake-optional-material'): true,
            MaterialNumber('fake-second-optional-material'): true,
          };
          when(() => comboDetailMockBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              items: comboMaterialsMock,
              materialCount: comboMaterialsMock.length,
              selectedItems: comboMaterialsSeletedMock,
            ),
          );

          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsOneWidget);

          final nextDealIcon = find.byKey(WidgetKeys.comboNextDealIcon);
          expect(nextDealIcon, findsNothing);

          final bestDealIcon = find.byKey(WidgetKeys.comboBestDealIcon);
          expect(bestDealIcon, findsOneWidget);

          final nextDealText = find.text('Buy 3 more to get 20% discount');
          expect(nextDealText, findsNothing);

          final bestDealText = find.text('Yay! You’ve got the best deal.');
          expect(bestDealText, findsOneWidget);
        },
      );
    },
  );

  group(
    'Combo Details K5',
    () {
      setUp(() {
        final firstAmountTier =
            ComboDealTierRule.empty().copyWith(minTotalAmount: 50, rate: -12);
        final secondAmountTier =
            ComboDealTierRule.empty().copyWith(minTotalAmount: 160, rate: -20);
        final comboDeal = ComboDeal.empty().copyWith(
          flexiTierRule: [
            firstAmountTier,
            secondAmountTier,
          ],
        );

        comboMaterialsMock = {
          MaterialNumber('fake-optional-material'):
              PriceAggregate.empty().copyWith(
            quantity: 4,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-optional-material'),
            ),
            price: Price.empty().copyWith(lastPrice: MaterialPrice(18)),
            comboDeal: comboDeal,
          ),
          MaterialNumber('fake-second-optional-material'):
              PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-second-optional-material'),
            ),
            price: Price.empty().copyWith(lastPrice: MaterialPrice(100)),
            comboDeal: comboDeal,
          ),
        };

        comboMaterialsSeletedMock = {
          MaterialNumber('fake-optional-material'): false,
          MaterialNumber('fake-second-optional-material'): false,
        };
        when(() => comboDetailMockBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: comboMaterialsMock,
            materialCount: comboMaterialsMock.length,
            selectedItems: comboMaterialsSeletedMock,
          ),
        );
        when(() => mockProductImageBloc.state).thenReturn(
          ProductImageState.initial().copyWith(
            productImageMap: <MaterialNumber, ProductImages>{
              requiredMaterial.materialNumber: ProductImages.empty().copyWith(
                materialNumber: requiredMaterial.materialNumber,
                image: [
                  'fake-image-1',
                  'fake-image-2',
                ],
              ),
            },
          ),
        );
      });

      testWidgets(
        'Appbar title',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final appbarTitle = find.text('Combo K5');
          expect(appbarTitle, findsOneWidget);
        },
      );

      testWidgets(
        'Requirement section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final requirementMessage = find.text(
            'Purchase min. \$${comboMaterialsMock.values.first.comboDeal.sortedMinTotalAmountTiers.firstOrNull?.minTotalAmount ?? 0} from these products. Buy more save more.',
          );
          expect(requirementMessage, findsOneWidget);

          final discountOnMessage = find.text('Total Order Amount');
          expect(discountOnMessage, findsOneWidget);
        },
      );

      testWidgets(
        'Body section',
        (tester) async {
          tester.view.physicalSize = const Size(600, 800);
          tester.view.devicePixelRatio = 1.0;
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final comboFixedList = find.byKey(WidgetKeys.comboDetailFixedList);
          expect(comboFixedList, findsNothing);

          final selectAtLeastMessage = find.text(
            'Select at least one product from the below section to receive offered price',
          );
          expect(selectAtLeastMessage, findsNothing);

          final searchBar = find.byType(CustomSearchBar);
          expect(searchBar, findsOneWidget);

          final totalMaterials = find.byKey(WidgetKeys.totalMaterialItemCount);
          expect(totalMaterials, findsOneWidget);

          final comboMaterialList =
              find.byKey(WidgetKeys.comboDetailMaterialList);
          expect(comboMaterialList, findsOneWidget);

          await tester.fling(
            find.byKey(WidgetKeys.comboDetailMaterialList),
            const Offset(0.0, -5000.0),
            800.0,
          );
          verify(
            () => comboDetailMockBloc.add(
              ComboDealMaterialDetailEvent.loadMoreComboDealPrincipal(
                comboDeal: comboMaterialsMock.values.first.comboDeal,
                principles: [
                  comboMaterialsMock.values
                          .toList()
                          .comboMaterialItemList
                          .firstOrNull
                          ?.materialInfo
                          .principalData
                          .principalCode
                          .getOrDefaultValue('') ??
                      '',
                ],
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Add to cart section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsOneWidget);
          final firstDiscount = comboMaterialsMock
              .values.first.comboDeal.sortedMinTotalAmountTiers.firstOrNull;
          final notEligibleMessageContent = find.text(
            'Buy within \$${firstDiscount?.minTotalAmount} and \$${firstDiscount?.maxTotalAmount} to get ${firstDiscount?.discountInfo.rateDisplay}% Discount'
                .tr(),
          );
          expect(notEligibleMessageContent, findsOneWidget);

          final materialsSelected = comboMaterialsSeletedMock.entries
              .where((element) => element.value)
              .toList();

          final totalUnitMessage =
              find.text('${materialsSelected.length} items');
          expect(totalUnitMessage, findsOneWidget);

          final comboRateDiscounted =
              find.byKey(WidgetKeys.comboRateDiscounted);
          expect(comboRateDiscounted, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsNothing);

          final checkoutButton =
              find.byKey(WidgetKeys.comboDealAddOrEditComboButton);
          expect(checkoutButton, findsOneWidget);
        },
      );

      testWidgets(
        'Next deal info - Next deal display',
        (tester) async {
          comboMaterialsSeletedMock = {
            MaterialNumber('fake-optional-material'): true,
            MaterialNumber('fake-second-optional-material'): false,
          };
          when(() => comboDetailMockBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              items: comboMaterialsMock,
              materialCount: comboMaterialsMock.length,
              selectedItems: comboMaterialsSeletedMock,
            ),
          );

          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsOneWidget);

          final nextDealIcon = find.byKey(WidgetKeys.comboNextDealIcon);
          expect(nextDealIcon, findsOneWidget);

          final bestDealIcon = find.byKey(WidgetKeys.comboBestDealIcon);
          expect(bestDealIcon, findsNothing);

          final nextDealText = find.text('Buy \$88.0 more to get 20% discount');
          expect(nextDealText, findsOneWidget);

          final bestDealText = find.text('Yay! You’ve got the best deal.');
          expect(bestDealText, findsNothing);
        },
      );

      testWidgets(
        'Next deal info - Best deal display',
        (tester) async {
          comboMaterialsSeletedMock = {
            MaterialNumber('fake-optional-material'): true,
            MaterialNumber('fake-second-optional-material'): true,
          };
          when(() => comboDetailMockBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              items: comboMaterialsMock,
              materialCount: comboMaterialsMock.length,
              selectedItems: comboMaterialsSeletedMock,
            ),
          );

          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsOneWidget);

          final nextDealIcon = find.byKey(WidgetKeys.comboNextDealIcon);
          expect(nextDealIcon, findsNothing);

          final bestDealIcon = find.byKey(WidgetKeys.comboBestDealIcon);
          expect(bestDealIcon, findsOneWidget);

          final nextDealText = find.text('Buy \$88.0 more to get 20% discount');
          expect(nextDealText, findsNothing);

          final bestDealText = find.text('Yay! You’ve got the best deal.');
          expect(bestDealText, findsOneWidget);
        },
      );
    },
  );

  group(
    'Combo Details K4.2',
    () {
      setUp(() {
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

        comboMaterialsMock = {
          MaterialNumber('fake-optional-material'):
              PriceAggregate.empty().copyWith(
            quantity: 4,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-optional-material'),
            ),
            comboDeal: comboDeal,
          ),
        };

        comboMaterialsSeletedMock = {
          MaterialNumber('fake-optional-material'): false,
        };
        when(() => comboDetailMockBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: comboMaterialsMock,
            materialCount: comboMaterialsMock.length,
            selectedItems: comboMaterialsSeletedMock,
          ),
        );
        when(() => mockProductImageBloc.state).thenReturn(
          ProductImageState.initial().copyWith(
            productImageMap: <MaterialNumber, ProductImages>{
              requiredMaterial.materialNumber: ProductImages.empty().copyWith(
                materialNumber: requiredMaterial.materialNumber,
                image: [
                  'fake-image-1',
                  'fake-image-2',
                ],
              ),
            },
          ),
        );
      });

      testWidgets(
        'Appbar title',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final appbarTitle = find.text('Combo K4.2');
          expect(appbarTitle, findsOneWidget);
        },
      );

      testWidgets(
        'Requirement section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final requirementMessage = find.text(
            'Purchase min. ${comboMaterialsMock.values.first.comboDeal.minPurchaseQty} QTYs from any of these products. Buy more save more.',
          );
          expect(requirementMessage, findsOneWidget);

          final discountOnMessage = find.text('Per item');
          expect(discountOnMessage, findsOneWidget);
        },
      );

      testWidgets(
        'Body section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final comboFixedList = find.byKey(WidgetKeys.comboDetailFixedList);
          expect(comboFixedList, findsNothing);

          final selectAtLeastMessage = find.text(
            'Select at least one product from the below section to receive offered price',
          );
          expect(selectAtLeastMessage, findsNothing);

          final searchBar = find.byType(CustomSearchBar);
          expect(searchBar, findsOneWidget);

          final totalMaterials = find.byKey(WidgetKeys.totalMaterialItemCount);
          expect(totalMaterials, findsOneWidget);

          final comboMaterialList =
              find.byKey(WidgetKeys.comboDetailMaterialList);
          expect(comboMaterialList, findsOneWidget);
        },
      );

      testWidgets(
        'Add to cart section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsOneWidget);
          final notEligibleMessageContent = find.text(
            'You must select minimum ${comboMaterialsMock.values.first.comboDeal.schemeMinimumQtyRequirement} QTYs.'
                .tr(),
          );
          expect(notEligibleMessageContent, findsOneWidget);

          final materialsSelected = comboMaterialsSeletedMock.entries
              .where((element) => element.value)
              .toList();

          final totalUnitMessage =
              find.text('${'Total qty'.tr()}: ${materialsSelected.length}');
          expect(totalUnitMessage, findsOneWidget);

          final comboRateDiscounted =
              find.byKey(WidgetKeys.comboRateDiscounted);
          expect(comboRateDiscounted, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsNothing);

          final checkoutButton =
              find.byKey(WidgetKeys.comboDealAddOrEditComboButton);
          expect(checkoutButton, findsOneWidget);
        },
      );

      testWidgets(
        'Next deal info - Next deal display',
        (tester) async {
          comboMaterialsSeletedMock = {
            MaterialNumber('fake-optional-material'): true,
          };
          when(() => comboDetailMockBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              items: comboMaterialsMock,
              materialCount: comboMaterialsMock.length,
              selectedItems: comboMaterialsSeletedMock,
            ),
          );

          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsNothing);

          final itemNextTierDealFinder = find.text('Next tier 8% discount');
          expect(itemNextTierDealFinder, findsOneWidget);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsOneWidget);

          final nextDealIcon = find.byKey(WidgetKeys.comboNextDealIcon);
          expect(nextDealIcon, findsOneWidget);

          final bestDealIcon = find.byKey(WidgetKeys.comboBestDealIcon);
          expect(bestDealIcon, findsNothing);

          final nextDealText =
              find.text('Buy 3 more quantity to achieve next tier discount');
          expect(nextDealText, findsOneWidget);

          final bestDealText = find.text('Yay! You’ve got the best deal.');
          expect(bestDealText, findsNothing);
        },
      );

      testWidgets(
        'Next deal info - Best deal display',
        (tester) async {
          comboMaterialsSeletedMock = {
            MaterialNumber('fake-optional-material'): true,
          };
          when(() => comboDetailMockBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              items: comboMaterialsMock.map(
                (key, value) => MapEntry(
                  key,
                  value.copyWith(quantity: 7),
                ),
              ),
              materialCount: comboMaterialsMock.length,
              selectedItems: comboMaterialsSeletedMock,
            ),
          );

          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsNothing);

          final itemNextTierDealFinder = find.text('Next tier 8% discount');
          expect(itemNextTierDealFinder, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsOneWidget);

          final nextDealIcon = find.byKey(WidgetKeys.comboNextDealIcon);
          expect(nextDealIcon, findsNothing);

          final bestDealIcon = find.byKey(WidgetKeys.comboBestDealIcon);
          expect(bestDealIcon, findsOneWidget);

          final nextDealText =
              find.text('Buy 3 more quantity to achieve next tier discount');
          expect(nextDealText, findsNothing);

          final bestDealText = find.text('Yay! You’ve got the best deal.');
          expect(bestDealText, findsOneWidget);
        },
      );
      testWidgets('Search bar should display keyword same as searchKey state',
          (tester) async {
        const searchKey = 'fake-search-key';
        whenListen(
          comboDetailMockBloc,
          Stream.fromIterable([
            ComboDealMaterialDetailState.initial().copyWith(
              searchKey: SearchKey.search(searchKey),
            ),
          ]),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        final searchField =
            tester.widget<TextFormField>(find.byKey(WidgetKeys.searchBar));
        expect(searchField.controller?.text, searchKey);
      });
    },
  );
}
