// ignore_for_file: unused_local_variable
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/apl_get_total_price.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_title.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/market_place_delivery_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_local.dart';
import 'package:ezrxmobile/presentation/core/covid_tag.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile.dart';

import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/discount_override/discount_override_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late CartBloc cartBloc;
  late MaterialPriceBloc materialPriceBloc;
  late EligibilityBloc eligibilityBloc;
  late PaymentCustomerInformationBloc paymentCustomerInformationBloc;
  late ProductImageBloc productImageBloc;
  late List<PriceAggregate> mockCartItemWithDataList;
  late List<PriceAggregate> mockCartItemWithDataList2;
  late List<PriceAggregate> mockCartItemBundles;
  late List<PriceAggregate> mockCartItemBundles2;
  late List<PriceAggregate> mockCartItemBundlesWithValidStock;
  late List<PriceAggregate> mockCartItemComboWithOOS;
  late List<PriceAggregate> mockCartItemComboWithValidStock;
  late List<PriceAggregate> mockCartItemDiscountBundles;
  late MaterialListBloc materialListBlocMock;
  late TenderContractBloc tenderContractBlocMock;
  late TenderContractListBloc tenderContractListBlocMock;
  late CustomerLicenseBloc customerLicenseBlocMock;
  late DiscountOverrideBloc discountOverrideBlocMock;
  late List<PriceAggregate> mockCartItemWithDataListOverride;
  late List<PriceAggregate> mockCartItemOOS;
  late Map<MaterialNumber, Price> mockPriceList;
  late OrderEligibilityBloc orderEligibilityBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late PriceOverrideBloc priceOverrideBloc;
  late AppRouter autoRouterMock;
  late OrderSummaryBloc orderSummaryBlocMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late ComboDealListBloc comboDealListBlocMock;
  late PoAttachmentBloc poAttachmentBlocMock;

  late List<StockInfo> batchStockInfoMock;
  late List<PriceAggregate> mockCartItems;
  late List<PriceAggregate> mockCartBundleItems;
  late List<ComboMaterialItem> fakeComboMaterialItems;
  late AplGetTotalPrice aplGetTotalPrice;
  late PaymentCustomerInformationBloc paymentCustomerInformationMock;
  late List<PriceAggregate> mockCartItemWithAllType;
  late Config config;
  final routeData = RouteData(
    stackKey: const Key(''),
    type: const RouteType.adaptive(),
    route: RouteMatch(
      segments: const ['orders', 'cart'],
      stringMatch: 'orders/cart',
      config: AutoRoute(
        page: const PageInfo(CartPageRoute.name),
        path: '/orders/cart',
      ),
      key: const ValueKey('CartsPageRoute'),
    ),
    router: AutoRouteMock(),
    pendingChildren: [],
  );
  late MixpanelService mixpanelService;

  final checkoutPageRouteData = RouteData(
    stackKey: const Key(''),
    type: const RouteType.adaptive(),
    route: RouteMatch(
      segments: const ['orders', 'cart', 'checkout'],
      stringMatch: 'orders/cart/checkout',
      config: AutoRoute(
        page: const PageInfo(CheckoutPageRoute.name),
        path: 'orders/cart/checkout',
      ),
      key: const ValueKey('CheckoutPageRoute'),
    ),
    router: AutoRouteMock(),
    pendingChildren: [],
  );

  setUpAll(() async {
    mixpanelService = MixpanelServiceMock();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton<MixpanelService>(() => mixpanelService);
    locator.registerFactory(() => AppRouter());
    locator.registerFactory<TenderContractBloc>(() => tenderContractBlocMock);
    autoRouterMock = AutoRouteMock();
    mockCartItemWithAllType =
        (await CartLocalDataSource().getAddedToCartProductList()).cartProducts;
    mockCartBundleItems = await CartLocalDataSource().upsertCart(
      type: UpsertCartLocalType.upsertCartItems,
    );
    mockCartItems = (await CartLocalDataSource().upsertCart());
    fakeComboMaterialItems = (await CartLocalDataSource().upsertCart(
      type: UpsertCartLocalType.upsertCartItemsComboOffer,
    ))
        .comboMaterialItemList;
    aplGetTotalPrice = await CartLocalDataSource().aplGetTotalPrice();
    config = locator<Config>();
  });
  setUp(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      reset(mixpanelService);
      materialListBlocMock = MaterialListBlocMock();
      additionalDetailsBlocMock = AdditionalDetailsBlocMock();
      comboDealListBlocMock = ComboDealListBlocMock();
      cartBloc = CartBlocMock();
      materialPriceBloc = MaterialPriceBlocMock();
      eligibilityBloc = EligibilityBlocMock();
      tenderContractBlocMock = TenderContractBlocMock();
      tenderContractListBlocMock = TenderContractListBlocMock();
      discountOverrideBlocMock = DiscountOverrideBlocMock();
      orderEligibilityBlocMock = OrderEligibilityBlocMock();
      priceOverrideBloc = PriceOverrideBlocMock();
      orderSummaryBlocMock = OrderSummaryBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      autoRouterMock = AutoRouteMock();
      productImageBloc = ProductImageBlocMock();
      customerLicenseBlocMock = CustomerLicenseBlocMock();
      paymentCustomerInformationMock = PaymentCustomerInformationBlocMock();
      poAttachmentBlocMock = PoAttachmentBlocMock();

      mockPriceList = {};
      mockPriceList.putIfAbsent(
        MaterialNumber('000000000023168451'),
        () => Price.empty().copyWith(
          finalPrice: MaterialPrice(4.5),
        ),
      );

      mockCartItemBundles2 = [
        PriceAggregate.empty().copyWith(
          bundle: Bundle.empty().copyWith(
            materials: <MaterialInfo>[
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-1'),
                quantity: MaterialQty(10),
                stockInfos: <StockInfo>[
                  StockInfo.empty().copyWith(
                    materialNumber: MaterialNumber('fake-material-1'),
                    inStock: MaterialInStock('No'),
                  ),
                ],
              ),
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-2'),
                quantity: MaterialQty(10),
                stockInfos: <StockInfo>[
                  StockInfo.empty().copyWith(
                    materialNumber: MaterialNumber('fake-material-2'),
                    inStock: MaterialInStock('Yes'),
                  ),
                ],
              ),
            ],
            bundleInformation: [],
            bundleCode: 'fake-bundle-code',
            bundleName: BundleName('test'),
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-bundle'),
            type: MaterialInfoType('bundle'),
          ),
          salesOrgConfig: fakeMYSalesOrgConfigs,
        ),
      ];

      mockCartItemBundlesWithValidStock = [
        PriceAggregate.empty().copyWith(
          bundle: Bundle.empty().copyWith(
            materials: <MaterialInfo>[
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-1'),
                quantity: MaterialQty(10),
                stockInfos: <StockInfo>[
                  StockInfo.empty().copyWith(
                    materialNumber: MaterialNumber('fake-material-1'),
                    inStock: MaterialInStock('Yes'),
                  ),
                ],
              ),
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-2'),
                quantity: MaterialQty(10),
                stockInfos: <StockInfo>[
                  StockInfo.empty().copyWith(
                    materialNumber: MaterialNumber('fake-material-2'),
                    inStock: MaterialInStock('Yes'),
                  ),
                ],
              ),
            ],
            bundleInformation: [],
            bundleCode: 'fake-bundle-code',
            bundleName: BundleName('test'),
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-bundle'),
            type: MaterialInfoType('bundle'),
          ),
          salesOrgConfig: fakeMYSalesOrgConfigs,
        ),
      ];

      mockCartItemComboWithOOS = [
        PriceAggregate.empty().copyWith(
          comboMaterials: [
            fakeComboMaterialItems.first.copyWith(
              comboDeals: PriceComboDeal.empty().copyWith(
                flexibleGroup: FlexibleGroup('fake-combo'),
                salesDeal: SalesDealNumber('code'),
              ),
              materialInfo: MaterialInfo.empty().copyWithStock(
                stockInfos: <StockInfo>[
                  StockInfo.empty().copyWith(
                    materialNumber: MaterialNumber('fake-material-1'),
                    inStock: MaterialInStock('No'),
                  ),
                ],
              ),
            ),
          ],
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-combo'),
            type: MaterialInfoType('combo'),
          ),
          salesOrgConfig: fakeMYSalesOrgConfigs,
        ),
      ];

      mockCartItemComboWithValidStock = [
        PriceAggregate.empty().copyWith(
          comboMaterials: [
            fakeComboMaterialItems.first.copyWith(
              comboDeals: PriceComboDeal.empty().copyWith(
                flexibleGroup: FlexibleGroup('fake-combo'),
                salesDeal: SalesDealNumber('code'),
              ),
              materialInfo: MaterialInfo.empty().copyWithStock(
                stockInfos: <StockInfo>[
                  StockInfo.empty().copyWith(
                    materialNumber: MaterialNumber('fake-material-1'),
                    inStock: MaterialInStock('Yes'),
                  ),
                ],
              ),
            ),
          ],
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-combo'),
            type: MaterialInfoType('combo'),
          ),
          salesOrgConfig: fakeMYSalesOrgConfigs,
        ),
      ];

      mockCartItemBundles = [
        PriceAggregate.empty().copyWith(
          quantity: 10,
          bundle: Bundle.empty().copyWith(
            materials: <MaterialInfo>[
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-1'),
                stockInfos: <StockInfo>[
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('Yes'),
                  ),
                ],
              ),
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-2'),
                stockInfos: <StockInfo>[
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('Yes'),
                  ),
                ],
              ),
            ],
            bundleInformation: [],
            bundleCode: '',
            bundleName: BundleName('test'),
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-bundle'),
            type: MaterialInfoType('bundle'),
          ),
        ),
      ];

      mockCartItemDiscountBundles = [
        PriceAggregate.empty().copyWith(
          bonusSampleItems: [
            BonusSampleItem.empty().copyWith(
              materialNumber: MaterialNumber('0000000000111111'),
              materialDescription: ' Mosys D',
              principalData: PrincipalData.empty().copyWith(
                principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
              ),
            ),
          ],
          quantity: 1,
          price: Price.empty().copyWith(
            finalPrice: MaterialPrice(
              100.0,
            ),
          ),
          bundle: Bundle.empty().copyWith(
            materials: <MaterialInfo>[],
            bundleInformation: [],
            bundleCode: '123',
            bundleName: BundleName('test'),
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023168451'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
            ),
            remarks: '',
          ),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
          ),
        ),
        PriceAggregate.empty().copyWith(
          bonusSampleItems: [
            BonusSampleItem.empty().copyWith(
              materialNumber: MaterialNumber('0000000000111111'),
              materialDescription: ' Mosys D',
              principalData: PrincipalData.empty().copyWith(
                principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
              ),
            ),
          ],
          quantity: 1,
          bundle: Bundle.empty().copyWith(
            bundleCode: '124',
            bundleInformation: [
              BundleInfo.empty().copyWith(
                rate: -10,
              ),
            ],
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023168441'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
            ),
          ),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
          ),
        ),
      ];

      mockCartItemWithDataList = [
        PriceAggregate.empty().copyWith(
          bonusSampleItems: [
            BonusSampleItem.empty().copyWith(
              materialNumber: MaterialNumber('0000000000111111'),
              materialDescription: ' Mosys D',
              qty: MaterialQty(1),
            ),
          ],
          quantity: 1,
          materialInfo: MaterialInfo.empty().copyWith(
            type: MaterialInfoType('material'),
            materialNumber: MaterialNumber('000000000023168451'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
            ),
            remarks: '',
            data: <MaterialData>[
              MaterialData.empty().copyWith(
                materialNumber: MaterialNumber('000000000023168451'),
                governmentMaterialCode: StringValue('fake-code'),
              ),
            ],
          ),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
          ),
        ),
      ];

      mockCartItemWithDataList2 = [
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            type: MaterialInfoType('material'),
            materialNumber: MaterialNumber('000000000023168451'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
            ),
          ),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
          ),
        ),
      ];
      mockCartItemWithDataListOverride = [
        PriceAggregate.empty().copyWith(
          price: Price.empty().copyWith(
            isPriceOverride: true,
          ),
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023168451'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
            ),
          ),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
          ),
        ),
      ];

      mockCartItemOOS = [
        PriceAggregate.empty().copyWith(
          materialInfo: MaterialInfo.empty().copyWith(
            type: MaterialInfoType('material'),
            materialNumber: MaterialNumber('123456789'),
            stockInfos: <StockInfo>[],
            quantity: MaterialQty(1),
            taxClassification: MaterialTaxClassification('Product : Full Tax'),
          ),
          stockInfoList: <StockInfo>[
            StockInfo.empty().copyWith(
              inStock: MaterialInStock('No'),
            ),
          ],
          price: Price.empty().copyWith(
            finalPrice: MaterialPrice(234.50),
          ),
          salesOrgConfig: fakeKHSalesOrgConfigs,
        ),
      ];
      // mockCartItemWithOutBatch = CartItem(
      //   materials: [
      //     PriceAggregate.empty().copyWith(
      //       quantity: 1,
      //       materialInfo: MaterialInfo.empty().copyWith(
      //         materialNumber: MaterialNumber('000000000023168451'),
      //       ),
      //     ),
      //   ],
      //   itemType: CartItemType.material,
      // );

      batchStockInfoMock = [
        StockInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000000023168451'),
          inStock: MaterialInStock('Yes'),
          expiryDate: DateTimeStringValue('NA'),
          salesDistrict: '',
          batch: StringValue('fake-batch'),
        ),
      ];
      // mockCartItemWithBatch = CartItem(
      //   materials: [
      //     PriceAggregate.empty().copyWith(
      //       quantity: 1,
      //       materialInfo: MaterialInfo.empty().copyWith(
      //         materialNumber: MaterialNumber('000000000023168451'),
      //       ),
      //       stockInfo: batchStockInfoMock.first,
      //       stockInfoList: batchStockInfoMock,
      //     ),
      //   ],
      //   itemType: CartItemType.material,
      // );
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ),
      );
      when(() => materialPriceBloc.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          isFetching: false,
          materialPrice: mockPriceList,
        ),
      );
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => discountOverrideBlocMock.state)
          .thenReturn(DiscountOverrideState.initial());
      when(
        () => orderEligibilityBlocMock.state,
      ).thenReturn(OrderEligibilityState.initial());
      when(() => orderSummaryBlocMock.state).thenReturn(
        OrderSummaryState.initial().copyWith(),
      );
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: '1234',
          ),
        ),
      );
      when(() => tenderContractBlocMock.state)
          .thenReturn(TenderContractState.initial());
      when(() => tenderContractListBlocMock.state)
          .thenReturn(TenderContractListState.initial());
      when(() => priceOverrideBloc.state)
          .thenReturn(PriceOverrideState.initial());
      when(() => customerLicenseBlocMock.state)
          .thenReturn(CustomerLicenseState.initial());
      when(() => additionalDetailsBlocMock.state)
          .thenReturn(AdditionalDetailsState.initial());
      when(() => comboDealListBlocMock.state)
          .thenReturn(ComboDealListState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => autoRouterMock.currentPath).thenReturn('orders/cart');
      when(() => autoRouterMock.current).thenReturn(routeData);
      when(() => autoRouterMock.stack).thenReturn([MaterialPageXMock()]);
      when(() => productImageBloc.state).thenReturn(
        ProductImageState.initial(),
      );
      when(() => autoRouterMock.maybePop())
          .thenAnswer((invocation) async => true);
      when(() => paymentCustomerInformationMock.state).thenReturn(
        PaymentCustomerInformationState.initial(),
      );
      when(() => poAttachmentBlocMock.state)
          .thenReturn(PoAttachmentState.initial());
    },
  );

  ///////////////////////////////Finder///////////////////////////////////////
  final checkoutSummaryTotalSaving =
      find.byKey(WidgetKeys.checkoutSummaryTotalSaving);
  final checkoutSummaryTax = find.byKey(WidgetKeys.checkoutSummaryTax);
  /////////////////////////////////////////////////////////////////////////
  group(
    'Test Cart_Page',
    () {
      Widget getWidget({bool isReOrder = false}) {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          usingLocalization: true,
          routeName: CartPageRoute.name,
          providers: [
            BlocProvider<CartBloc>(create: (context) => cartBloc),
            BlocProvider<MaterialPriceBloc>(
              create: (context) => materialPriceBloc,
            ),
            BlocProvider<ComboDealListBloc>(
              create: (context) => comboDealListBlocMock,
            ),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<MaterialListBloc>(
              create: ((context) => materialListBlocMock),
            ),
            BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
            BlocProvider<TenderContractBloc>(
              create: (context) => tenderContractBlocMock,
            ),
            BlocProvider<TenderContractListBloc>(
              create: (context) => tenderContractListBlocMock,
            ),
            BlocProvider<OrderEligibilityBloc>(
              create: (context) => orderEligibilityBlocMock,
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
            BlocProvider<ProductImageBloc>(
              create: (context) => productImageBloc,
            ),
            BlocProvider<PaymentCustomerInformationBloc>(
              create: (context) => paymentCustomerInformationMock,
            ),
            BlocProvider<CustomerLicenseBloc>(
              create: (context) => customerLicenseBlocMock,
            ),
            BlocProvider<PoAttachmentBloc>(
              create: (context) => poAttachmentBlocMock,
            ),
          ],
          child: CartPage(isReOrder: isReOrder),
        );
      }

      testWidgets(
        'Load Cart Page',
        (tester) async {
          await tester.pumpWidget(getWidget());

          await tester.pump();
          final cartPage = find.byKey(const Key('cartpage'));
          expect(cartPage, findsOneWidget);
        },
      );
      testWidgets('Test fetch fail Dynamic', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            isFetching: false,
            apiFailureOrSuccessOption: none(),
          ),
        );

        final expectedStates = [
          CartState.initial().copyWith(
            isFetching: false,
            apiFailureOrSuccessOption: optionOf(
              const Right(
                'No Error',
              ),
            ),
          ),
        ];

        whenListen(cartBloc, Stream.fromIterable(expectedStates));

        await tester.pumpWidget(getWidget());

        // verify(() => authBlocMock.add(const AuthEvent.authCheck()));
      });

      testWidgets(
          'Show material combination code with GMC part when Government material code is enabled',
          (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTWSalesOrgConfigs,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: mockCartItemWithDataList,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final materialInfo = mockCartItemWithDataList.first.materialInfo;
        final combinationCode = find.text(
          '${materialInfo.materialNumber.displayMatNo} | ${materialInfo.data.first.governmentMaterialCode.getOrDefaultValue('')}',
        );
        expect(combinationCode, findsOneWidget);
      });

      testWidgets(
          'Show material combination code without GMC part when Government material code is disabled',
          (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: mockCartItemWithDataList,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final materialInfo = mockCartItemWithDataList.first.materialInfo;
        final materialNumber =
            find.text(materialInfo.materialNumber.displayMatNo);
        expect(materialNumber, findsOneWidget);
        final combinationCode = find.text(
          '${materialInfo.materialNumber.displayMatNo} | ${materialInfo.data.first.governmentMaterialCode}',
        );
        expect(combinationCode, findsNothing);
      });

      testWidgets('Delete item from cart by swapping', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: mockCartItemWithDataList2,
            isFetching: true,
            isClearing: false,
            isUpserting: false,
          ),
        );

        await tester.pumpWidget(getWidget());

        await tester.pump();
        final startOffset = tester.getCenter(find.byType(CartProductTile));
        final gesture = await tester.startGesture(startOffset);
        await gesture.moveBy(const Offset(-500, 0)); // Swipe to the left
        await tester.pump(); // Rebuild the widget
        final materialItem = find.byKey(
          WidgetKeys.cartItemProductTile(
            mockCartItemWithDataList2
                .first.materialInfo.materialNumber.displayMatNo,
          ),
        );
        expect(materialItem, findsOneWidget);
        final customSlidableAction = find.byKey(
          WidgetKeys.cartItemSwipeDeleteButton,
        );
        await tester.dragUntilVisible(
          customSlidableAction,
          materialItem,
          const Offset(-500, 0),
        );
        await tester.pump();
        expect(customSlidableAction, findsOneWidget);
        await tester.tap(customSlidableAction);
        await tester.pump();

        verify(
          () => cartBloc.add(
            CartEvent.upsertCart(
              priceAggregate: mockCartItemWithDataList2.first.copyWith(
                quantity: 0,
              ),
            ),
          ),
        ).called(1);
      });
      testWidgets('Display snackbar when delete item', (tester) async {
        when(() => autoRouterMock.isRouteActive(CartPageRoute.name))
            .thenReturn(true);
        final currentState = CartState.initial().copyWith(
          cartProducts: [...mockCartItemWithDataList2]..removeLast(),
        );
        final previousState = CartState.initial().copyWith(
          cartProducts: [...mockCartItemWithDataList2],
          isUpserting: true,
        );
        when(() => cartBloc.state).thenReturn(currentState);

        whenListen(
          cartBloc,
          Stream.fromIterable([previousState, currentState]),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();
        await tester.pumpAndSettle();
        final msg =
            tester.widget<Text>(find.byKey(WidgetKeys.customSnackBarMessage));
        expect(
          msg.data,
          equals(currentState.deleteSuccessMessage(previousState)),
        );
      });

      testWidgets(
          'Display snackbar and clear additional info and po attachment bloc when clear cart',
          (tester) async {
        when(() => autoRouterMock.isRouteActive(CartPageRoute.name))
            .thenReturn(true);
        final currentState = CartState.initial().copyWith(
          cartProducts: [],
        );
        final previousState = CartState.initial().copyWith(
          cartProducts: [...mockCartItemWithDataList2],
          isClearing: true,
        );
        when(() => cartBloc.state).thenReturn(currentState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        );

        whenListen(
          cartBloc,
          Stream.fromIterable([previousState, currentState]),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();
        await tester.pumpAndSettle();
        final msg =
            tester.widget<Text>(find.byKey(WidgetKeys.customSnackBarMessage));
        expect(
          msg.data,
          equals(currentState.deleteSuccessMessage(previousState)),
        );

        verify(
          () => additionalDetailsBlocMock.add(
            AdditionalDetailsEvent.initialized(
              config: fakeMYSalesOrgConfigs,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ),
        ).called(1);
        verify(
          () => poAttachmentBlocMock.add(
            const PoAttachmentEvent.initialized(),
          ),
        ).called(1);
      });

      testWidgets('Bundle item allowed out of stock material', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: mockCartItemBundles2,
            config: fakeMYSalesOrgConfigs,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();
        expect(find.byType(StatusLabel), findsOneWidget);
        expect(find.byKey(WidgetKeys.checkoutButton), findsOneWidget);
        await tester.tap(find.byKey(WidgetKeys.checkoutButton));
        await tester.pump();
        expect(find.byKey(WidgetKeys.preOrderModel), findsOneWidget);
        expect(
          find.byKey(WidgetKeys.preOrderBundle('fake-bundle-code')),
          findsOneWidget,
        );
      });

      testWidgets(
          'Bundle item allowed to place order and dose not display the preorder model bottomsheet',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: mockCartItemBundlesWithValidStock,
            config: fakeMYSalesOrgConfigs,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        when(() => autoRouterMock.push(const CheckoutPageRoute()))
            .thenAnswer((invocation) => Future(() => checkoutPageRouteData));
        await tester.pumpWidget(getWidget());

        await tester.pump();
        expect(find.byType(StatusLabel), findsNothing);
        expect(find.byKey(WidgetKeys.checkoutButton), findsOneWidget);
        await tester.tap(find.byKey(WidgetKeys.checkoutButton));
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.preOrderModel), findsNothing);
        expect(
          find.byKey(WidgetKeys.preOrderBundle('fake-bundle-code')),
          findsNothing,
        );
      });

      testWidgets('Combo item with OOS need to show preorder modal',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: mockCartItemComboWithOOS,
            config: fakeMYSalesOrgConfigs,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();
        expect(find.byType(StatusLabel), findsOneWidget);
        expect(find.byKey(WidgetKeys.checkoutButton), findsOneWidget);
        await tester.tap(find.byKey(WidgetKeys.checkoutButton));
        await tester.pump();
        expect(find.byKey(WidgetKeys.preOrderModel), findsOneWidget);
        expect(
          find.byKey(WidgetKeys.preOrderCombo('fake-combo-code')),
          findsOneWidget,
        );
      });

      testWidgets('Combo item with valid item does not display preorder modal',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: mockCartItemComboWithValidStock,
            config: fakeMYSalesOrgConfigs,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        when(() => autoRouterMock.push(const CheckoutPageRoute()))
            .thenAnswer((invocation) => Future(() => checkoutPageRouteData));
        await tester.pumpWidget(getWidget());

        await tester.pump();
        expect(find.byType(StatusLabel), findsNothing);
        expect(find.byKey(WidgetKeys.checkoutButton), findsOneWidget);
        await tester.tap(find.byKey(WidgetKeys.checkoutButton));
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.preOrderModel), findsNothing);
        expect(
          find.byKey(WidgetKeys.preOrderCombo('fake-combo-code')),
          findsNothing,
        );
      });

      testWidgets('Test Start browsing onTap', (tester) async {
        await tester.pumpWidget(getWidget());

        await tester.pump();

        final startBrowsingButton =
            find.byKey(WidgetKeys.startBrowsingProducts);

        when(() => autoRouterMock.navigateNamed('/main/products'))
            .thenAnswer((invocation) => Future(() => null));

        expect(startBrowsingButton, findsOneWidget);

        await tester.tap(
          startBrowsingButton,
        );

        await tester.pumpAndSettle();

        verify(() => autoRouterMock.navigateNamed('/main/products')).called(1);
      });

      testWidgets('cart page Customer Code AccountSuspendedBanner ',
          (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              status: Status('01'),
            ),
          ),
        );
        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: mockCartItems,
            customerCodeInfo: fakeBlockedCustomerCodeInfo,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: mockCartItems,
          ),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();
        final accountSuspendedBanner = find.byKey(
          WidgetKeys.customerBlockedBanner,
        );
        expect(accountSuspendedBanner, findsOneWidget);
        expect(
          find.descendant(
            of: accountSuspendedBanner,
            matching: find.text(
              'Your account is blocked.'.tr(),
            ),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: accountSuspendedBanner,
            matching: find.text(
              'To continue using eZRx+, please contact your system administrator.',
            ),
          ),
          findsOneWidget,
        );
        final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
        expect(checkoutButton, findsOneWidget);
        await tester.tap(checkoutButton);
        verifyNever(
          () => orderEligibilityBlocMock.add(
            const OrderEligibilityEvent.validateOrderEligibility(),
          ),
        );
      });

      testWidgets('cart page Ships To Code AccountSuspendedBanner ',
          (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              status: Status('01'),
            ),
          ),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();
        final accountSuspendedBanner = find.byKey(
          WidgetKeys.customerBlockedBanner,
        );
        expect(accountSuspendedBanner, findsOneWidget);
        expect(
          find.descendant(
            of: accountSuspendedBanner,
            matching: find.text(
              'Your account is blocked.'.tr(),
            ),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: accountSuspendedBanner,
            matching: find.text(
              'To continue using eZRx+, please contact your system administrator.'
                  .tr(),
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
        'Do not Show tax details on material level when displayItemTaxBreakdown is disabled for vn',
        (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: <PriceAggregate>[
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123456789'),
                    quantity: MaterialQty(1),
                    taxClassification:
                        MaterialTaxClassification('Product : Full Tax'),
                    tax: 10,
                  ),
                  price: Price.empty().copyWith(
                    lastPrice: MaterialPrice(234.50),
                  ),
                ),
              ],
            ),
          );

          await tester.pumpWidget(getWidget());

          await tester.pump();

          final taxLevelFinder = find.text('Total with tax:');
          expect(taxLevelFinder, findsNothing);
        },
      );

      testWidgets(
        'Do not Show tax details on Subtotal level when displaySubtotalTaxBreakdown is enabled for tw',
        (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: <PriceAggregate>[
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123456789'),
                    quantity: MaterialQty(1),
                    taxClassification:
                        MaterialTaxClassification('Product : Full Tax'),
                  ),
                  price: Price.empty().copyWith(
                    finalPrice: MaterialPrice(234.50),
                  ),
                ),
              ],
              config: fakeKHSalesOrgConfigs,
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();

          final taxLevelFinder = find.text('Total with tax:');
          expect(taxLevelFinder, findsNothing);
          expect(cartBloc.state.totalPriceWithTaxExcludeSmallOrderFees, 257.95);
        },
      );

      testWidgets(
        'Show tax details on material level when displayItemTaxBreakdown is enabled for vn with material level tax',
        (tester) async {
          final cartState = CartState.initial().copyWith(
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  type: MaterialInfoType('material'),
                  materialNumber: MaterialNumber('123456789'),
                  quantity: MaterialQty(1),
                  taxClassification:
                      MaterialTaxClassification('Product : Full Tax'),
                  tax: 10,
                ),
                price: Price.empty().copyWith(
                  finalPrice: MaterialPrice(234.50),
                ),
                salesOrgConfig: fakeVNSalesOrgConfigs,
              ),
            ],
          );

          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );
          when(() => cartBloc.state).thenReturn(
            cartState,
          );

          await tester.pumpWidget(getWidget());

          await tester.pumpAndSettle();

          final taxLevelFinder = find.text('Total with tax:');
          expect(taxLevelFinder, findsOneWidget);
          final taxPercentageFinder = find.text(' (10.0% tax)');
          expect(taxPercentageFinder, findsOneWidget);
          final vatPercentageFinder = find.text(' (5.0% tax)');
          expect(vatPercentageFinder, findsNothing);
          final listPriceWithTax = cartState
              .cartProducts.first.finalPriceTotalWithTax
              .toStringAsFixed(2);
          expect(
            find.text(
              'VND $listPriceWithTax',
              findRichText: true,
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Show tax details on material level when displayItemTaxBreakdown is enabled for TH with material level tax',
        (tester) async {
          final cartState = CartState.initial().copyWith(
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  type: MaterialInfoType('material'),
                  materialNumber: MaterialNumber('123456789'),
                  quantity: MaterialQty(1),
                  taxClassification:
                      MaterialTaxClassification('Product : Full Tax'),
                  tax: 10,
                ),
                price: Price.empty().copyWith(
                  finalPrice: MaterialPrice(234.50),
                ),
                salesOrgConfig: fakeTHSalesOrgConfigs,
              ),
            ],
          );
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeTHSalesOrgConfigs,
              salesOrganisation: fakeTHSalesOrganisation,
            ),
          );
          when(() => cartBloc.state).thenReturn(
            cartState,
          );

          await tester.pumpWidget(getWidget());

          await tester.pumpAndSettle();

          final taxLevelFinder = find.text('Total with tax:');
          expect(taxLevelFinder, findsOneWidget);
          final taxPercentageFinder = find.text(' (5% tax)');
          expect(taxPercentageFinder, findsNothing);
          final vatPercentageFinder =
              find.text(' (${fakeTHSalesOrgConfigs.vatValue.toDouble()}% tax)');
          expect(vatPercentageFinder, findsOneWidget);
          final listPriceWithTax = cartState
              .cartProducts.first.finalPriceTotalWithTax
              .toStringAsFixed(2);
          expect(
            find.text(
              '${fakeTHSalesOrgConfigs.currency.code} $listPriceWithTax',
              findRichText: true,
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Show tax details on material level when displayItemTaxBreakdown is enabled for VN with material level tax on pre-Ordermodel',
        (tester) async {
          final cartState = CartState.initial().copyWith(
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  type: MaterialInfoType('material'),
                  materialNumber: MaterialNumber('123456789'),
                  quantity: MaterialQty(1),
                  taxClassification:
                      MaterialTaxClassification('Product : Full Tax'),
                  tax: 10,
                ),
                stockInfoList: <StockInfo>[
                  StockInfo.empty().copyWith(
                    batch: StringValue('ABCD'),
                    inStock: MaterialInStock('No'),
                  ),
                ],
                price: Price.empty().copyWith(
                  finalPrice: MaterialPrice(234.50),
                ),
                salesOrgConfig: fakeVNSalesOrgConfigs,
              ),
            ],
          );

          when(() => cartBloc.state).thenReturn(
            cartState,
          );

          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final taxLevelFinder = find.text('Total with tax:');
          expect(taxLevelFinder, findsOneWidget);
          final taxPercentageFinder = find.text(' (0.0% tax)');
          expect(taxPercentageFinder, findsNothing);
          final vatPercentageFinder = find.text(' (10.0% tax)');
          expect(vatPercentageFinder, findsOneWidget);
          final listPriceWithTax = cartState
              .cartProducts.first.finalPriceTotalWithTax
              .toStringAsFixed(2);
          expect(
            find.text(
              '${fakeVNSalesOrgConfigs.currency.code} $listPriceWithTax',
              findRichText: true,
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Show out of stock tag when oos is enabled for salesrep but user is a client',
        (tester) async {
          final cartState = CartState.initial().copyWith(
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  type: MaterialInfoType('material'),
                  materialNumber: MaterialNumber('123456789'),
                  stockInfos: <StockInfo>[],
                  quantity: MaterialQty(1),
                  taxClassification:
                      MaterialTaxClassification('Product : Full Tax'),
                ),
                stockInfoList: <StockInfo>[
                  StockInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123456789'),
                    inStock: MaterialInStock('No'),
                  ),
                ],
                price: Price.empty().copyWith(
                  finalPrice: MaterialPrice(234.50),
                ),
                salesOrgConfig: fakeKHSalesOrgConfigs,
              ),
            ],
          );

          final eligibilityState = EligibilityState.initial().copyWith(
            user: fakeClient,
            salesOrgConfigs: fakeKHSalesOrgConfigs,
          );

          when(() => cartBloc.state).thenReturn(
            cartState,
          );

          when(() => eligibilityBloc.state).thenReturn(
            eligibilityState,
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final preOrderTag = find.text('Preorder');
          expect(preOrderTag, findsNothing);
          final oosTag = find.text('Out of stock');
          expect(oosTag, findsOneWidget);
          final checkoutButton =
              find.widgetWithText(ElevatedButton, 'Check out');

          expect(
            checkoutButton,
            findsOneWidget,
          );
          await tester.pump();
          expect(
            (tester.widget(checkoutButton) as ElevatedButton).enabled,
            true,
          );
        },
      );

      testWidgets(
        'Check out button is disable when allow Materials Out of Stock is OFF and there are OOS items in cart',
        (tester) async {
          final cartState = CartState.initial().copyWith(
            cartProducts: mockCartItemOOS,
          );

          when(() => cartBloc.state).thenReturn(cartState);

          when(() => orderEligibilityBlocMock.state).thenReturn(
            OrderEligibilityState.initial().copyWith(
              configs: SalesOrganisationConfigs.empty().copyWith(
                addOosMaterials: OosMaterial(false),
              ),
              cartItems: cartState.cartProducts,
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final checkoutButton =
              find.widgetWithText(ElevatedButton, 'Check out');
          expect(checkoutButton, findsOneWidget);
          await tester.tap(checkoutButton);
          await tester.pump();
          verify(
            () => mixpanelService.trackEvent(
              eventName: TrackingEvents.checkoutFailure,
              properties: any(named: 'properties'),
            ),
          ).called(1);
        },
      );

      testWidgets('Grand total check', (tester) async {
        final mockCartProductList = [
          PriceAggregate.empty().copyWith(
            quantity: 1,
            price: Price.empty().copyWith(finalPrice: MaterialPrice(100.00)),
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('material'),
              materialNumber: MaterialNumber('000000000023168451'),
              materialDescription: ' Triglyceride Mosys D',
              principalData: PrincipalData.empty().copyWith(
                principalName: PrincipalName('台灣拜耳股份有限公司'),
              ),
              remarks: '',
            ),
            stockInfo: StockInfo.empty().copyWith(
              inStock: MaterialInStock('Yes'),
            ),
          ),
          PriceAggregate.empty().copyWith(
            bundle: Bundle.empty().copyWith(
              materials: <MaterialInfo>[
                MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('fake-material-1'),
                  quantity: MaterialQty(10),
                  stockInfos: <StockInfo>[
                    StockInfo.empty().copyWith(
                      inStock: MaterialInStock('yes'),
                    ),
                  ],
                ),
                MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('fake-material-2'),
                  quantity: MaterialQty(10),
                  stockInfos: <StockInfo>[
                    StockInfo.empty().copyWith(
                      inStock: MaterialInStock('Yes'),
                    ),
                  ],
                ),
              ],
              bundleInformation: [BundleInfo.empty().copyWith(rate: 10)],
              bundleCode: '1234',
              bundleName: BundleName('test'),
            ),
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-bundle'),
              type: MaterialInfoType('bundle'),
            ),
            salesOrgConfig: fakeMYSalesOrgConfigs,
          ),
        ];

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );

        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: mockCartProductList,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        final grandTotal = find.byKey(WidgetKeys.priceSummaryGrandTotal);
        expect(grandTotal, findsOneWidget);
        expect(
          find.text(
            'Grand total: MYR 300.00',
            findRichText: true,
          ),
          findsOneWidget,
        );
      });

      testWidgets(
        'Display cart page price message when material price is zero',
        (tester) async {
          final cartProducts = <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('123456789'),
                quantity: MaterialQty(1),
                taxClassification:
                    MaterialTaxClassification('Product : Full Tax'),
                type: MaterialInfoType('material'),
              ),
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(0),
              ),
            ),
          ];
          final cartState = CartState.initial().copyWith(
            cartProducts: cartProducts,
          );

          final orderEligibilityState =
              OrderEligibilityState.initial().copyWith(
            configs: fakeMYSalesOrgConfigs,
            cartItems: cartProducts,
          );

          when(() => cartBloc.state).thenReturn(
            cartState,
          );

          when(() => orderEligibilityBlocMock.state).thenReturn(
            orderEligibilityState,
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final checkoutButton =
              find.widgetWithText(ElevatedButton, 'Check out');

          final priceMessageWidgetFinder =
              find.byKey(WidgetKeys.priceNotAvailableMessageWidget);
          final priceMessageFinder = find.text(
            'Price is not available for at least one item. Grand total reflected may not be accurate.'
                .tr(),
          );
          expect(priceMessageWidgetFinder, findsOneWidget);
          expect(priceMessageFinder, findsOneWidget);
          expect(checkoutButton, findsOneWidget);
        },
      );

      testWidgets(
        'Display cart page price message for hide price material',
        (tester) async {
          final cartProducts = <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('123456789'),
                quantity: MaterialQty(1),
                taxClassification:
                    MaterialTaxClassification('Product : Full Tax'),
                type: MaterialInfoType('material'),
                hidePrice: true,
              ),
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(354.60),
              ),
            ),
          ];
          final cartState = CartState.initial().copyWith(
            cartProducts: cartProducts,
          );

          final orderEligibilityState =
              OrderEligibilityState.initial().copyWith(
            configs: fakeMYSalesOrgConfigs,
            cartItems: cartProducts,
          );

          when(() => cartBloc.state).thenReturn(
            cartState,
          );

          when(() => orderEligibilityBlocMock.state).thenReturn(
            orderEligibilityState,
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final checkoutButton =
              find.widgetWithText(ElevatedButton, 'Check out');

          final priceMessageWidgetFinder =
              find.byKey(WidgetKeys.priceNotAvailableMessageWidget);
          final priceMessageFinder = find.text(
            'Price is not available for at least one item. Grand total reflected may not be accurate.'
                .tr(),
          );
          expect(priceMessageWidgetFinder, findsOneWidget);
          expect(priceMessageFinder, findsOneWidget);
          expect(checkoutButton, findsOneWidget);
        },
      );

      testWidgets(
        'Display cart page price message for isFoc material',
        (tester) async {
          final cartProducts = <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('123456789'),
                quantity: MaterialQty(1),
                type: MaterialInfoType('material'),
                isFOCMaterial: true,
              ),
            ),
          ];
          final cartState = CartState.initial().copyWith(
            cartProducts: cartProducts,
          );

          final orderEligibilityState =
              OrderEligibilityState.initial().copyWith(
            configs: fakeMYSalesOrgConfigs,
            cartItems: cartProducts,
          );

          when(() => cartBloc.state).thenReturn(
            cartState,
          );

          when(() => orderEligibilityBlocMock.state).thenReturn(
            orderEligibilityState,
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final checkoutButton =
              find.widgetWithText(ElevatedButton, 'Check out');

          final priceMessageWidgetFinder =
              find.byKey(WidgetKeys.priceNotAvailableMessageWidget);
          final priceMessageFinder = find.text(
            'Price is not available for at least one item. Grand total reflected may not be accurate.'
                .tr(),
          );
          expect(priceMessageWidgetFinder, findsOneWidget);
          expect(priceMessageFinder, findsOneWidget);
          expect(checkoutButton, findsOneWidget);
        },
      );

      testWidgets('Checkout button on pressed when shimmer is visible',
          (tester) async {
        when(() => materialPriceBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            isFetching: true,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('1234'),
                  materialGroup4: MaterialGroup('6A1'),
                ),
              ),
            ],
            isUpserting: true,
            isUpdatingStock: true,
            isFetchingCartProductDetail: true,
            isMappingPrice: true,
          ),
        );
        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('1234'),
                  materialGroup4: MaterialGroup('6A1'),
                ),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();

        final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
        expect(checkoutButton, findsOneWidget);
        await tester.tap(checkoutButton);
        verifyNever(
          () => orderEligibilityBlocMock.add(
            const OrderEligibilityEvent.validateOrderEligibility(),
          ),
        );
      });

      testWidgets('Test invalid banner when cart consist suspended material',
          (tester) async {
        final suspendedMaterial = mockCartItems.firstWhere(
          (e) => e.materialInfo.type.typeMaterial && e.materialInfo.isSuspended,
        );

        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: <PriceAggregate>[suspendedMaterial],
          ),
        );

        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: <PriceAggregate>[suspendedMaterial],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final invalidItemBannerFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBanner);
        final invalidMessageFinder = find.text('Suspended material');
        final invalidItemBannerButtonFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBannerButton);
        final invalidItemMessageFinder = find.text('Material Suspended');
        expect(invalidItemMessageFinder, findsNWidgets(1));
        expect(invalidItemBannerFinder, findsOneWidget);
        expect(invalidMessageFinder, findsOneWidget);
        expect(invalidItemBannerButtonFinder, findsOneWidget);
        await tester.tap(invalidItemBannerButtonFinder);
        verify(
          () => cartBloc.add(
            CartEvent.removeInvalidProducts(
              invalidCartItems: <MaterialInfo>[
                suspendedMaterial.materialInfo
                    .copyWith(quantity: MaterialQty(0)),
              ],
            ),
          ),
        ).called(1);
      });

      testWidgets(
          'Test invalid banner when cart consist material without price',
          (tester) async {
        final materialWithoutPrice = mockCartItems
            .firstWhere((e) => e.materialInfo.type.typeMaterial)
            .copyWith(
              price: mockCartItems.first.price.copyWith(
                finalPrice: MaterialPrice(0),
                lastPrice: MaterialPrice(0),
              ),
            );

        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: <PriceAggregate>[materialWithoutPrice],
          ),
        );

        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: <PriceAggregate>[materialWithoutPrice],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final invalidItemBannerFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBanner);
        final invalidMessageFinder = find.text('Material without price');
        final invalidItemBannerButtonFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBannerButton);
        expect(invalidItemBannerFinder, findsOneWidget);
        await tester.tap(invalidItemBannerButtonFinder);
        verify(
          () => cartBloc.add(
            CartEvent.removeInvalidProducts(
              invalidCartItems: <MaterialInfo>[
                materialWithoutPrice.materialInfo
                    .copyWith(quantity: MaterialQty(0)),
              ],
            ),
          ),
        ).called(1);
      });

      testWidgets('Test invalid banner when cart consist out of stock material',
          (tester) async {
        final oosMaterial =
            mockCartItems.firstWhere((e) => e.materialInfo.type.typeMaterial);

        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: <PriceAggregate>[oosMaterial],
          ),
        );

        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            configs: fakeKHSalesOrgConfigs.copyWith(hideStockDisplay: true),
            cartItems: <PriceAggregate>[oosMaterial],
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final invalidItemBannerFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBanner);
        final invalidMessageFinder = find.text('Out of stock material');
        final invalidItemBannerButtonFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBannerButton);
        final invalidItemMessageFinder = find.text('Material out of stock');
        expect(invalidItemMessageFinder, findsOneWidget);
        expect(invalidItemBannerFinder, findsOneWidget);
        await tester.tap(invalidItemBannerButtonFinder);
        verify(
          () => cartBloc.add(
            CartEvent.removeInvalidProducts(
              invalidCartItems: <MaterialInfo>[
                oosMaterial.materialInfo.copyWith(quantity: MaterialQty(0)),
              ],
            ),
          ),
        ).called(1);
      });

      testWidgets(
          'Test invalid banner when cart consist out of stock bundle materials',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartBundleItems,
          isClearing: false,
        );

        final invalidBundleList = mockCartBundleItems.first.bundle.materials
            .map(
              (e) => e.copyWith(
                quantity: MaterialQty(0),
                parentID: mockCartBundleItems.first.bundle.bundleCode,
              ),
            )
            .toList();

        final expectedStates = [
          OrderEligibilityState.initial(),
          OrderEligibilityState.initial().copyWith(
            cartItems: mockCartBundleItems,
          ),
        ];

        whenListen(
          orderEligibilityBlocMock,
          Stream.fromIterable(expectedStates),
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        await tester.pumpWidget(getWidget());

        await tester.pumpAndSettle();

        final invalidItemBannerFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBanner);
        final invalidOosMessageFinder = find.text('Out of stock material');

        final invalidItemBannerButtonFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBannerButton);
        expect(invalidItemBannerFinder, findsOneWidget);
        expect(invalidOosMessageFinder, findsOneWidget);
        expect(invalidItemBannerButtonFinder, findsOneWidget);
        await tester.tap(invalidItemBannerButtonFinder);
        verify(
          () => cartBloc.add(
            CartEvent.removeInvalidProducts(
              invalidCartItems: invalidBundleList,
            ),
          ),
        ).called(1);
      });

      testWidgets(
          'Cart Bundle disable when any bundle not Satisfying Minimum value ',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartBundleItems,
          isClearing: false,
        );

        final invalidBundleList = mockCartBundleItems.first.bundle.materials
            .map(
              (e) => e.copyWith(
                quantity: MaterialQty(0),
                parentID: mockCartBundleItems.first.bundle.bundleCode,
              ),
            )
            .toList();

        final expectedStates = [
          OrderEligibilityState.initial(),
          OrderEligibilityState.initial().copyWith(
            cartItems: mockCartBundleItems,
          ),
        ];

        whenListen(
          orderEligibilityBlocMock,
          Stream.fromIterable(expectedStates),
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        await tester.pumpWidget(getWidget());

        await tester.pumpAndSettle();

        final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
        expect(checkoutButton, findsOneWidget);
        await tester.tap(checkoutButton);
        await tester.pump();
      });

      testWidgets('Test MOV warning visibility when account is suspended',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('1234'),
                ),
              ),
            ],
          ),
        );
        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('1234'),
                ),
              ),
            ],
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              status: Status('01'),
            ),
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );

        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('1234'),
                ),
              ),
            ],
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              status: Status('01'),
            ),
            showErrorMessage: true,
          ),
        );
        await tester.pumpAndSettle();

        await tester.pumpWidget(getWidget());

        await tester.pump();

        final movWarning = find.text(
          'Please ensure that minimum order value is at least {mov}'
              .tr(namedArgs: {'mov': 'MYR 100.00'}),
        );

        expect(movWarning, findsNothing);
      });

      testWidgets(
          'Test invalid banner when cart consist suspended principal material',
          (tester) async {
        final suspendedPrincipalMaterial = mockCartItems.firstWhere(
          (e) =>
              e.materialInfo.type.typeMaterial &&
              e.materialInfo.isPrincipalSuspended,
        );

        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: <PriceAggregate>[suspendedPrincipalMaterial],
            isClearing: false,
          ),
        );

        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: <PriceAggregate>[suspendedPrincipalMaterial],
          ),
        );

        await tester.pumpWidget(getWidget());

        await tester.pumpAndSettle();

        final invalidItemBannerFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBanner);
        final invalidMessageFinder = find.text('Principle suspended material');
        final invalidItemMessageFinder =
            find.text('Temporarily suspended by principle');
        final invalidItemBannerButtonFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBannerButton);

        expect(invalidItemBannerFinder, findsOneWidget);
        expect(invalidItemMessageFinder, findsOneWidget);
        expect(invalidMessageFinder, findsOneWidget);
        expect(invalidItemBannerButtonFinder, findsOneWidget);
        await tester.tap(invalidItemBannerButtonFinder);
        verify(
          () => cartBloc.add(
            CartEvent.removeInvalidProducts(
              invalidCartItems: <MaterialInfo>[
                suspendedPrincipalMaterial.materialInfo
                    .copyWith(quantity: MaterialQty(0)),
              ],
            ),
          ),
        ).called(1);
      });

      testWidgets('Test invalid banner remove button', (tester) async {
        final suspendedPrincipalMaterial = mockCartItems.firstWhere(
          (e) =>
              e.materialInfo.type.typeMaterial &&
              e.materialInfo.isPrincipalSuspended,
        );

        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[suspendedPrincipalMaterial],
          isClearing: false,
        );

        final expectedCartStates = [
          cartState,
          cartState.copyWith(
            isClearing: true,
          ),
        ];

        whenListen(
          cartBloc,
          Stream.fromIterable(expectedCartStates),
        );

        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: <PriceAggregate>[suspendedPrincipalMaterial],
          ),
        );

        await tester.pumpWidget(getWidget());

        await tester.pump();

        final invalidItemBannerButtonFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBannerButton);
        expect(invalidItemBannerButtonFinder, findsOneWidget);
        await tester.tap(invalidItemBannerButtonFinder);
        verify(
          () => cartBloc.add(
            CartEvent.removeInvalidProducts(
              invalidCartItems: <MaterialInfo>[
                suspendedPrincipalMaterial.materialInfo
                    .copyWith(quantity: MaterialQty(0)),
              ],
            ),
          ),
        ).called(1);
      });

      testWidgets(
          'Should fetch material deal for the first time if at least 1 products is belonged to a combo',
          (tester) async {
        final priceComboDeal = PriceComboDeal.empty().copyWith(
          category: PriceComboDealCategory.empty()
              .copyWith(type: ComboDealCategoryType('MATNR')),
        );
        final cartItems = mockCartItems.last.copyWith(
          materialInfo: mockCartItems.last.materialInfo.copyWith(
            type: MaterialInfoType('combo'),
          ),
          comboMaterials: [
            fakeComboMaterialItems.first.copyWith(
              comboDeals: priceComboDeal,
            ),
          ],
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[cartItems],
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: EligibilityState.initial().customerCodeInfo,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        verify(
          () => comboDealListBlocMock.add(
            ComboDealListEvent.fetchMaterialDeal(
              salesOrganisation: EligibilityState.initial().salesOrganisation,
              customerCodeInfo: EligibilityState.initial().customerCodeInfo,
              priceComboDeal: priceComboDeal,
            ),
          ),
        ).called(1);
      });
      testWidgets(
          'Should fetch principle group deal for the first time if at least 1 products is Principle',
          (tester) async {
        final priceComboDeal = PriceComboDeal.empty().copyWith(
          category: PriceComboDealCategory.empty()
              .copyWith(type: ComboDealCategoryType('ZPRINC')),
        );
        final cartItems = mockCartItems.last.copyWith(
          materialInfo: mockCartItems.last.materialInfo.copyWith(
            type: MaterialInfoType('combo'),
          ),
          comboMaterials: [
            fakeComboMaterialItems.first.copyWith(
              comboDeals: priceComboDeal,
            ),
          ],
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[cartItems],
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: EligibilityState.initial().customerCodeInfo,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        verify(
          () => comboDealListBlocMock.add(
            ComboDealListEvent.fetchPrincipleGroupDeal(
              salesOrganisation: EligibilityState.initial().salesOrganisation,
              customerCodeInfo: EligibilityState.initial().customerCodeInfo,
              priceComboDeal: priceComboDeal,
            ),
          ),
        ).called(1);
      });

      testWidgets(
        'Init OrderEligibilityBloc and Fetch detail when cart has items in initState',
        (tester) async {
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfigs: fakeSGSalesOrgConfigs,
              salesOrganisation: fakeSGSalesOrganisation,
              shipToInfo: fakeShipToInfo,
              user: fakeClientUser,
            ),
          );
          final cartItem = mockCartItems.last.copyWith
              .materialInfo(type: MaterialInfoType.material());

          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: <PriceAggregate>[cartItem],
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          verify(
            () => cartBloc.add(
              CartEvent.getDetailsProductsAddedToCart(
                cartProducts: [cartItem],
              ),
            ),
          ).called(1);

          verify(
            () => orderEligibilityBlocMock.add(
              OrderEligibilityEvent.initialized(
                customerCodeInfo: fakeCustomerCodeInfo,
                configs: fakeSGSalesOrgConfigs,
                salesOrg: fakeSGSalesOrganisation,
                shipInfo: fakeShipToInfo,
                user: fakeClientUser,
              ),
            ),
          ).called(1);

          verifyNever(
            () => materialPriceBloc.add(
              MaterialPriceEvent.fetchPriceCartProduct(
                products: [cartItem.materialInfo],
                comboDealEligible: false,
              ),
            ),
          );
        },
      );

      testWidgets('Should fetch Price', (tester) async {
        final cartItem = mockCartItems.last.copyWith
            .materialInfo(type: MaterialInfoType.material());

        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[cartItem],
        );
        whenListen(
          cartBloc,
          Stream.fromIterable([
            cartState.copyWith(isUpdatingStock: true),
            cartState,
          ]),
        );
        when(() => cartBloc.state).thenReturn(cartState);

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        verify(
          () => materialPriceBloc.add(
            MaterialPriceEvent.fetchPriceCartProduct(
              products: [cartItem.materialInfo],
              comboDealEligible: false,
            ),
          ),
        ).called(1);
      });

      testWidgets(
          'Should fetch Price For ZDP5Materials if at least 1 product has Zdp5Validation',
          (tester) async {
        final cartItem = mockCartItems.last.copyWith(
          materialInfo: mockCartItems.last.materialInfo,
          price: Price.empty().copyWith(
            zdp5MaxQuota: ZDP5Info('1'),
            zdp5RemainingQuota: ZDP5Info('1'),
          ),
          quantity: 2,
          salesOrgConfig: fakeVNSalesOrgConfigs,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeVNSalesOrgConfigs,
          ),
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[cartItem],
        );
        whenListen(
          cartBloc,
          Stream.fromIterable([
            cartState.copyWith(isUpdatingStock: true),
            cartState,
          ]),
        );
        when(() => cartBloc.state).thenReturn(cartState);

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        verify(
          () => materialPriceBloc.add(
            MaterialPriceEvent.fetchPriceForZDP5Materials(
              materialInfo: mockCartItems.last.materialInfo,
            ),
          ),
        ).called(1);
      });
      testWidgets('Should update price product when material price is fetched',
          (tester) async {
        final cartItem = mockCartItems.last.copyWith(
          materialInfo: mockCartItems.last.materialInfo,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[cartItem],
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );
        whenListen(
          materialPriceBloc,
          Stream.fromIterable([
            MaterialPriceState.initial().copyWith(isFetching: true),
            MaterialPriceState.initial(),
          ]),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        verify(
          () => cartBloc.add(
            const CartEvent.updatePriceProduct(
              priceProducts: {},
            ),
          ),
        ).called(1);
      });
      testWidgets('Should show snackbar when buy again', (tester) async {
        await tester.pumpWidget(getWidget(isReOrder: true));
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.materialDetailsAddToCartSnackBar),
          findsOneWidget,
        );

        verify(
          () => poAttachmentBlocMock.add(const PoAttachmentEvent.initialized()),
        ).called(1);
        verify(
          () => additionalDetailsBlocMock.add(
            AdditionalDetailsEvent.initiateFromHistory(
              config: SalesOrganisationConfigs.empty(),
              data: DeliveryInfoData.empty(),
            ),
          ),
        ).called(1);
      });
      //TODO: Re-check unit test

      // testWidgets(
      //     'Should re-initialize AdditionalDetailsBloc when update cart or clear cart',
      //     (tester) async {
      //   final cartItem = mockCartItems.last.copyWith(
      //     materialInfo: mockCartItems.last.materialInfo,
      //   );
      //   final cartState = CartState.initial().copyWith(
      //     cartProducts: <PriceAggregate>[cartItem],
      //     isClearing: true,
      //   );
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial(),
      //   );
      //   when(() => eligibilityBloc.state).thenReturn(
      //     EligibilityState.initial().copyWith(
      //       customerCodeInfo: EligibilityState.initial().customerCodeInfo,
      //     ),
      //   );
      //   whenListen(
      //     materialPriceBloc,
      //     Stream.fromIterable([
      //       MaterialPriceState.initial().copyWith(isFetching: true),
      //       MaterialPriceState.initial()
      //     ]),
      //   );
      //   whenListen(
      //     cartBloc,
      //     Stream.fromIterable([
      //       cartState,
      //       CartState.initial(),
      //     ]),
      //   );
      //   await tester.pumpWidget(getWidget());
      //   await tester.pumpAndSettle();

      //   verify(
      //     () => additionalDetailsBlocMock.add(
      //       AdditionalDetailsEvent.initialized(
      //         config: fakeMYSalesOrgConfigs,
      //         customerCodeInfo: fakeEmptyCustomerCodeInfo,
      //       ),
      //     ),
      //   ).called(1);
      // });

      testWidgets(
          'Should show price summary bottom sheet when tap on grand total',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            isAplProductLoading: false,
            cartProducts: mockCartItems,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final grandTotal = find.byKey(WidgetKeys.priceSummaryGrandTotal);
        expect(grandTotal, findsOneWidget);
        await tester.tap(grandTotal);
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.priceSummarySheet), findsOneWidget);
      });

      testWidgets('Covid material test', (tester) async {
        final cartProduct = [
          mockCartItems.first.copyWith(
            materialInfo: mockCartItems.first.materialInfo.copyWith(
              isFOCMaterial: true,
              type: MaterialInfoType.material(),
            ),
            price: Price.empty(),
          ),
        ];
        final orderEligibilityState = OrderEligibilityState.initial().copyWith(
          configs: fakeMYSalesOrgConfigs,
          cartItems: cartProduct,
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: cartProduct,
          ),
        );
        when(() => orderEligibilityBlocMock.state).thenReturn(
          orderEligibilityState,
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final covidTag = find.byType(CovidTag);
        expect(covidTag, findsOneWidget);
        final priceText = find.byKey(WidgetKeys.cartItemProductTotalPrice);
        expect(priceText, findsOneWidget);
        final cartPagePriceMessageWidget =
            find.byKey(WidgetKeys.priceNotAvailableMessageWidget);
        expect(cartPagePriceMessageWidget, findsOneWidget);
        final cartPagePriceMessage = find.text(
          'Price is not available for at least one item. Grand total reflected may not be accurate.',
        );
        expect(cartPagePriceMessage, findsOneWidget);
      });

      testWidgets(
          'Should show price summary bottom sheet when tap on grand total test small order fee',
          (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            configs: fakeIDSalesOrgConfigs,
            user: fakeClientUser,
            cartItems: mockCartItems,
            salesOrg: fakeIDSalesOrganisation,
          ),
        );

        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            cartProducts: mockCartItems,
            aplGetTotalPrice: aplGetTotalPrice,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final grandTotal = find.byKey(WidgetKeys.priceSummaryGrandTotal);
        expect(grandTotal, findsOneWidget);
        await tester.tap(grandTotal);
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.priceSummarySheet), findsOneWidget);
        expect(find.byKey(WidgetKeys.checkoutSummarySubTotal), findsOneWidget);
        expect(
          find.byKey(WidgetKeys.smallOrderFeeSection),
          findsOneWidget,
        );
        expect(
          checkoutSummaryTax,
          findsOneWidget,
        );
        final checkoutSummaryTaxPrice =
            find.byKey(WidgetKeys.checkoutSummaryTaxPrice);
        final checkoutSummaryGrandTotalPrice =
            find.byKey(WidgetKeys.checkoutSummaryGrandTotalPrice);
        final checkoutSummarySmallOrderFeePrice =
            find.byKey(WidgetKeys.smallOrderFeePrice);
        expect(
          (tester.widget(checkoutSummarySmallOrderFeePrice) as PriceComponent)
              .price,
          aplGetTotalPrice.smallOrderFee.toDouble().toString(),
        );
        expect(
          (tester.widget(checkoutSummaryTaxPrice) as PriceComponent).price,
          aplGetTotalPrice.totalTax.toString(),
        );
        expect(
          (tester.widget(checkoutSummaryGrandTotalPrice) as PriceComponent)
              .price,
          aplGetTotalPrice.grandTotal.toString(),
        );
      });
      testWidgets(
          'Test invalid banner when cart consist combo suspended and disable combo deal on saleorg',
          (tester) async {
        final priceComboDeal = PriceComboDeal.empty().copyWith(
          category: PriceComboDealCategory.empty()
              .copyWith(type: ComboDealCategoryType('MATNR')),
        );
        final cartComboItem = mockCartItems.last.copyWith(
          materialInfo: mockCartItems.last.materialInfo.copyWith(
            type: MaterialInfoType('combo'),
          ),
          comboMaterials: [
            fakeComboMaterialItems.first.copyWith(
              comboDeals: priceComboDeal,
            ),
          ],
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[cartComboItem],
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        final expectedStates = [
          OrderEligibilityState.initial(),
          OrderEligibilityState.initial().copyWith(
            cartItems: [cartComboItem],
            configs: fakeKHSalesOrgConfigs,
          ),
        ];

        whenListen(
          orderEligibilityBlocMock,
          Stream.fromIterable(expectedStates),
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        await tester.pumpWidget(getWidget());

        await tester.pumpAndSettle();

        final invalidItemBannerFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBanner);
        final invalidComboMessageFinder = find.text('Suspended combo');

        final invalidItemBannerButtonFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBannerButton);
        expect(invalidItemBannerFinder, findsOneWidget);
        expect(invalidComboMessageFinder, findsOneWidget);
        expect(invalidItemBannerButtonFinder, findsOneWidget);
        final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
        expect(checkoutButton, findsOneWidget);
        await tester.tap(checkoutButton);
        await tester.pump();
        verify(
          () => mixpanelService.trackEvent(
            eventName: TrackingEvents.checkoutFailure,
            properties: any(named: 'properties'),
          ),
        ).called(1);

        await tester.tap(invalidItemBannerButtonFinder);
        verify(
          () => cartBloc.add(
            CartEvent.upsertCartItemsWithComboOffers(
              priceAggregates:
                  cartComboItem.convertComboItemToPriceAggregateList
                      .map(
                        (priceAggregate) => priceAggregate.copyWith(
                          quantity: 0,
                          price: priceAggregate.price.copyWith(
                            comboDeal: priceAggregate.price.comboDeal
                                .copyWith(isEligible: false),
                          ),
                        ),
                      )
                      .toList(),
              isDeleteCombo: true,
            ),
          ),
        ).called(1);
      });

      testWidgets(
        '=> test Pre Order Modal Bottom section Cancel Button',
        (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: <PriceAggregate>[
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
                  stockInfoList: [
                    StockInfo.empty().copyWith(
                      materialNumber: MaterialNumber('fake-material'),
                    ),
                  ],
                ),
              ],
            ),
          );
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeIDSalesOrgConfigs,
            ),
          );
          await tester.pumpWidget(getWidget());

          await tester.pump();
          expect(find.byType(StatusLabel), findsOneWidget);
          expect(find.byKey(WidgetKeys.checkoutButton), findsOneWidget);
          await tester.tap(find.byKey(WidgetKeys.checkoutButton));
          await tester.pump();
          expect(find.byKey(WidgetKeys.preOrderModel), findsOneWidget);
          final preOrderModalCancelButton =
              find.byKey(WidgetKeys.preOrderModalCancelButton);
          expect(preOrderModalCancelButton, findsOneWidget);
          await tester.tap(preOrderModalCancelButton);
          await tester.pumpAndSettle();
        },
      );
      testWidgets(
        '=> test Pre Order Modal Bottom section Continue Button',
        (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: <PriceAggregate>[
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
                  stockInfoList: [
                    StockInfo.empty().copyWith(
                      materialNumber: MaterialNumber('fake-material'),
                    ),
                  ],
                ),
              ],
            ),
          );
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeIDSalesOrgConfigs,
            ),
          );
          await tester.pumpWidget(getWidget());

          await tester.pump();
          expect(find.byType(StatusLabel), findsOneWidget);
          expect(find.byKey(WidgetKeys.checkoutButton), findsOneWidget);
          await tester.tap(find.byKey(WidgetKeys.checkoutButton));
          await tester.pump();
          expect(find.byKey(WidgetKeys.preOrderModel), findsOneWidget);
          final preOrderModalContinueButton =
              find.byKey(WidgetKeys.preOrderModalContinueButton);
          expect(preOrderModalContinueButton, findsOneWidget);
          await tester.tap(preOrderModalContinueButton);
          await tester.pumpAndSettle();
        },
      );
      testWidgets(
        'Test Pre Order Modal Bottom not displayed when hideStockDisplay is enabled',
        (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: <PriceAggregate>[
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
                  salesOrgConfig: fakeTWSalesOrgConfigs,
                ),
              ],
            ),
          );

          when(() => autoRouterMock.push(const CheckoutPageRoute()))
              .thenAnswer((invocation) => Future(() => checkoutPageRouteData));

          await tester.pumpWidget(getWidget());

          await tester.pump();
          expect(find.byKey(WidgetKeys.checkoutButton), findsOneWidget);
          await tester.tap(find.byKey(WidgetKeys.checkoutButton));
          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.preOrderModel), findsNothing);

          verify(() => autoRouterMock.push(const CheckoutPageRoute()))
              .called(1);
        },
      );

      testWidgets(
          ' Test Material Out Stock not displayed on item when hideStockDisplay is enabled for invalid cart',
          (tester) async {
        final oosMaterial =
            mockCartItems.firstWhere((e) => e.materialInfo.type.typeMaterial);

        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[oosMaterial],
          isClearing: false,
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: <PriceAggregate>[oosMaterial],
            configs: fakePHSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getWidget());

        await tester.pumpAndSettle();

        final invalidItemBannerFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBanner);
        final invalidItemMessageFinder = find.text('Material out of stock');
        final invalidItemBannerButtonFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBannerButton);

        expect(invalidItemBannerFinder, findsOneWidget);

        expect(invalidItemMessageFinder, findsNothing);

        await tester.tap(invalidItemBannerButtonFinder);
        verify(
          () => cartBloc.add(
            CartEvent.removeInvalidProducts(
              invalidCartItems: <MaterialInfo>[
                oosMaterial.materialInfo.copyWith(quantity: MaterialQty(0)),
              ],
            ),
          ),
        ).called(1);
      });
      testWidgets(
        ' -> Find customer blocked banner',
        (WidgetTester tester) async {
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              shipToInfo: ShipToInfo.empty()
                  .copyWith(customerBlock: CustomerBlock('blocked')),
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pump();

          final customerBlockedBanner =
              find.byKey(WidgetKeys.customerBlockedBanner);

          expect(customerBlockedBanner, findsOneWidget);
        },
      );

      testWidgets(
          'List price strike through price visible, if final price is less than list price && enableListPrice = true',
          (tester) async {
        final finalPrice = MaterialPrice(80);
        final listPrice = MaterialPrice(100);
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(
                price: Price.empty().copyWith(
                  lastPrice: listPrice,
                  finalPrice: finalPrice,
                ),
                salesOrgConfig: fakeIDSalesOrgConfigs,
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('fake-material'),
                  type: MaterialInfoType('material'),
                ),
              ),
            ],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        final cartItem = find.byType(CartProductTile);
        expect(cartItem, findsOneWidget);
        final cartItemCutOffListPriceFinder = find.byKey(
          WidgetKeys.cartItemCutOffListPrice,
        );
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
            of: cartItemCutOffListPriceFinder,
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
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(
                price: Price.empty().copyWith(
                  lastPrice: listPrice,
                  finalPrice: finalPrice,
                ),
                salesOrgConfig: fakeMYSalesOrgConfigs,
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('fake-material'),
                  type: MaterialInfoType('material'),
                ),
              ),
            ],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        final cartItem = find.byType(CartProductTile);
        expect(cartItem, findsOneWidget);
        final cartItemCutOffListPriceFinder = find.byKey(
          WidgetKeys.cartItemCutOffListPrice,
        );
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
            of: cartItemCutOffListPriceFinder,
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
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(
                price: Price.empty().copyWith(
                  lastPrice: listPrice,
                  finalPrice: finalPrice,
                ),
                salesOrgConfig: fakeIDSalesOrgConfigs,
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('fake-material'),
                  type: MaterialInfoType('material'),
                ),
              ),
            ],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        final cartItem = find.byType(CartProductTile);
        expect(cartItem, findsOneWidget);
        final cartItemCutOffListPriceFinder = find.byKey(
          WidgetKeys.cartItemCutOffListPrice,
        );
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
            of: cartItemCutOffListPriceFinder,
            matching: listPriceFinder,
          ),
          findsNothing,
        );
      });

      testWidgets(
          'Test MOV message not displayed when cart has PNG materials with eligible quantity',
          (tester) async {
        final pnGCartItem = PriceAggregate.empty().copyWith(
          quantity: 2,
          price: Price.empty().copyWith(
            finalPrice: MaterialPrice(364.80),
            lastPrice: MaterialPrice(364.80),
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            type: MaterialInfoType('material'),
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('Procter And Gamble'),
              principalCode: PrincipalCode('000000105307'),
            ),
            hidePrice: true,
          ),
        );
        final cartStateInitial = CartState.initial().copyWith(
          cartProducts: [pnGCartItem],
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            user: User.empty().copyWith(
              role: Role.empty().copyWith(
                type: RoleType('external_sales_rep'),
              ),
            ),
          ),
        );

        when(() => cartBloc.state).thenReturn(
          cartStateInitial,
        );

        final expectedStates = [
          OrderEligibilityState.initial().copyWith(
            cartItems: [pnGCartItem],
            grandTotal: cartStateInitial.grandTotal,
            subTotal: cartStateInitial.subTotal,
            configs: fakeMYSalesOrgConfigs,
          ),
          OrderEligibilityState.initial().copyWith(
            cartItems: [pnGCartItem],
            grandTotal: cartStateInitial.grandTotal,
            subTotal: cartStateInitial.subTotal,
            configs: fakeMYSalesOrgConfigs,
            showErrorMessage: true,
          ),
        ];

        whenListen(
          orderEligibilityBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final movWarning = find.text(
          'Please ensure that minimum order value is at least {mov}'
              .tr(namedArgs: {'mov': 'MYR 100.00'}),
        );

        expect(movWarning, findsNothing);
      });

      testWidgets('Test Navigate back while snackbar appear for delete cart',
          (tester) async {
        when(() => autoRouterMock.isRouteActive(CartPageRoute.name))
            .thenReturn(true);

        final currentState = CartState.initial().copyWith(
          cartProducts: [],
        );
        final previousState = CartState.initial().copyWith(
          cartProducts: [...mockCartItemWithDataList2],
          isClearing: true,
        );
        when(() => cartBloc.state).thenReturn(currentState);

        whenListen(
          cartBloc,
          Stream.fromIterable([previousState, currentState]),
        );
        await tester.pumpWidget(getWidget());

        await tester.pumpAndSettle();

        final msg = find.textContaining('Cart has been emptied.'.tr());
        expect(msg, findsOneWidget);
        final cartCloseButtonFinder = find.byKey(WidgetKeys.closeButton);
        expect(cartCloseButtonFinder, findsOneWidget);
      });

      testWidgets(
        'Should not show total saving on SG',
        (tester) async {
          final currentSalesOrgVariant =
              salesOrgVariant.currentValue ?? fakeSalesOrg;
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              salesOrganisation: fakeSalesOrganisation.copyWith(
                salesOrg: currentSalesOrgVariant,
              ),
              cartProducts: mockCartItems,
              aplGetTotalPrice: aplGetTotalPrice,
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final grandTotal = find.byKey(WidgetKeys.priceSummaryGrandTotal);
          expect(grandTotal, findsOneWidget);
          await tester.tap(grandTotal);
          await tester.pumpAndSettle();
          expect(
            checkoutSummaryTotalSaving,
            currentSalesOrgVariant.isID ? findsOneWidget : findsNothing,
          );
        },
        variant: salesOrgVariant,
      );

      testWidgets(
        ' -> Find Cart Count With Bonus Included',
        (WidgetTester tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: mockCartItemWithDataList,
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final cartCountFinder = find.text('Cart (2)');

          expect(cartCountFinder, findsOneWidget);
        },
      );

      testWidgets(
          'Test Grand Total value for bundles with displaySubtotalTaxBreakdown disabled',
          (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            config: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            cartProducts: mockCartBundleItems,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final grandTotal = find.byKey(WidgetKeys.priceSummaryGrandTotal);
        expect(grandTotal, findsOneWidget);
        expect(
          find.text(
            'Grand total: MYR 990.00',
            findRichText: true,
          ),
          findsOneWidget,
        );
        await tester.tap(grandTotal);
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.priceSummarySheet), findsOneWidget);
      });

      testWidgets('Test Strike through price not visible for bundles',
          (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            config: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            cartProducts: [
              mockCartBundleItems.first.copyWith(
                bundle: Bundle.empty().copyWith(
                  bundleCode: 'fake-bundle',
                  bundleInformation: [
                    BundleInfo.empty().copyWith(
                      quantity: 10,
                      rate: 90,
                      sequence: 3,
                    ),
                  ],
                  materials: [
                    MaterialInfo.empty().copyWith(quantity: MaterialQty(9)),
                  ],
                ),
              ),
            ],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final bundleProduct = find.byKey(
          WidgetKeys.cartItemBundleTile('fake-bundle'),
        );

        final strikeThroughPrice =
            find.textContaining('MYR 90.0 per item', findRichText: true);
        expect(bundleProduct, findsOneWidget);
        expect(strikeThroughPrice, findsNothing);
      });

      testWidgets(
          'Test Grand Total value for bundles with displaySubtotalTaxBreakdown enabled',
          (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            salesOrganisation: fakePHSalesOrganisation,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            config: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            cartProducts: [
              mockCartBundleItems.first
                  .copyWith(salesOrgConfig: fakeMYSalesOrgConfigs),
            ],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final grandTotal = find.byKey(WidgetKeys.priceSummaryGrandTotal);
        expect(grandTotal, findsOneWidget);
        expect(
          find.text(
            'Grand total: ${fakeMYSalesOrgConfigs.currency.code} 990.00',
            findRichText: true,
          ),
          findsOneWidget,
        );
        await tester.tap(grandTotal);
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.priceSummarySheet), findsOneWidget);
      });

      testWidgets(
        'Show tax details on material level when displayItemTaxBreakdown is enabled and Product have Special Scheme tax classification',
        (tester) async {
          final cartState = CartState.initial().copyWith(
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  type: MaterialInfoType('material'),
                  materialNumber: MaterialNumber('123456789'),
                  quantity: MaterialQty(1),
                  taxClassification:
                      MaterialTaxClassification('Special Scheme'),
                  tax: 10,
                ),
                price: Price.empty().copyWith(
                  finalPrice: MaterialPrice(234.50),
                ),
                salesOrgConfig: fakeVNSalesOrgConfigs,
              ),
            ],
          );

          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );
          when(() => cartBloc.state).thenReturn(
            cartState,
          );

          await tester.pumpWidget(getWidget());

          await tester.pumpAndSettle();

          final taxLevelFinder = find.text('Total with tax:');
          expect(taxLevelFinder, findsOneWidget);
          final taxPercentageFinder = find.text('(10% tax)');

          final listPriceWithTax = cartState
              .cartProducts.first.finalPriceTotalWithTax
              .toStringAsFixed(2);
          expect(
            find.text(
              'VND $listPriceWithTax',
              findRichText: true,
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'pop to cart page if updateProductDetermination fail',
        (tester) async {
          whenListen(
            cartBloc,
            Stream.fromIterable([
              CartState.initial().copyWith(
                isUpdateProductDetermination: true,
              ),
              CartState.initial().copyWith(
                isUpdateProductDetermination: false,
                updateFailureOrSuccessOption:
                    optionOf(const Left(ApiFailure.other('fake-error'))),
              ),
            ]),
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final snackBarError = find.byKey(WidgetKeys.customSnackBar);
          expect(snackBarError, findsOneWidget);
          expect(
            find.descendant(
              of: snackBarError,
              matching: find.text('fake-error'),
            ),
            findsOneWidget,
          );
          verify(() => autoRouterMock.popUntilRouteWithName(CartPageRoute.name))
              .called(1);
        },
      );

      testWidgets(
          'Order Eligibility Bloc should be initialized every time EligibilityState change',
          (tester) async {
        whenListen(
          eligibilityBloc,
          Stream.fromIterable([
            EligibilityState.initial(),
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
              shipToInfo: fakeShipToInfo,
              user: fakeClientUser,
            ),
          ]),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        verify(
          () => orderEligibilityBlocMock.add(
            OrderEligibilityEvent.initialized(
              configs: fakeMYSalesOrgConfigs,
              salesOrg: fakeMYSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
              shipInfo: fakeShipToInfo,
              user: fakeClientUser,
            ),
          ),
        ).called(1);
      });

      testWidgets(
        'do not Show Mov Check Message when cart contain covid material',
        (tester) async {
          final cartState = CartState.initial().copyWith(
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  type: MaterialInfoType('material'),
                  materialNumber: MaterialNumber('123456789'),
                  quantity: MaterialQty(1),
                  isFOCMaterial: true,
                ),
                price: Price.empty().copyWith(
                  finalPrice: MaterialPrice(234.50),
                ),
                salesOrgConfig: fakePHSalesOrgConfigs,
              ),
            ],
          );

          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
              salesOrganisation: fakeVNSalesOrganisation,
            ),
          );
          when(() => cartBloc.state).thenReturn(
            cartState,
          );
          when(() => orderEligibilityBlocMock.state).thenReturn(
            OrderEligibilityState.initial().copyWith(
              cartItems: cartState.cartProducts,
            ),
          );

          await tester.pumpWidget(getWidget());

          await tester.pumpAndSettle();

          expect(
            find.byType(InfoLabel),
            findsNothing,
          );
        },
      );

      testWidgets('BillToInfo test when enablebillto is true', (tester) async {
        final salesOrgConfig = SalesOrganisationConfigs.empty().copyWith(
          displayItemTaxBreakdown: true,
          currency: Currency('usd'),
          salesOrg: fakeVNSalesOrg,
          enableBillTo: true,
        );

        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                type: MaterialInfoType('material'),
                materialNumber: MaterialNumber('123456789'),
                quantity: MaterialQty(1),
              ),
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
          ],
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeKHSalesOrgConfigs,
            salesOrganisation: fakeKHSalesOrganisation,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        when(() => paymentCustomerInformationMock.state).thenReturn(
          PaymentCustomerInformationState.initial().copyWith(
            paymentCustomerInformation:
                await PaymentCustomerInformationLocalDataSource()
                    .getPaymentCustomerInformation(),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final summaryInfoButton = find.byKey(WidgetKeys.summaryInfoButton);
        await tester.tap(summaryInfoButton);

        await tester.pumpAndSettle();

        final payerInformation = find.byKey(WidgetKeys.payerInformation);
        expect(payerInformation, findsOneWidget);
      });
      testWidgets(
          'BillToInfo test when enablebillto is true and billToInfo is empty',
          (tester) async {
        when(() => paymentCustomerInformationMock.state).thenReturn(
          PaymentCustomerInformationState.initial().copyWith(
            paymentCustomerInformation: PaymentCustomerInformation.empty(),
          ),
        );

        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                type: MaterialInfoType('material'),
                materialNumber: MaterialNumber('123456789'),
                quantity: MaterialQty(1),
              ),
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
          ],
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeKHSalesOrgConfigs,
            salesOrganisation: fakeKHSalesOrganisation,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final summaryInfoButton = find.byKey(WidgetKeys.summaryInfoButton);
        await tester.tap(summaryInfoButton);

        await tester.pumpAndSettle();

        final payerInformation = find.byKey(WidgetKeys.payerInformation);
        expect(payerInformation, findsNothing);
      });

      testWidgets(
          'Find MOV check message if subtotal is less than minOrderAmount for SG market',
          (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
          ),
        );
        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: mockCartItems,
            salesOrg: fakeSGSalesOrganisation,
            configs: fakeSGSalesOrgConfigs,
            subTotal: 90,
            grandTotal: 110,
            showErrorMessage: true,
          ),
        );

        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: mockCartItems,
          ),
        );
      });

      testWidgets(
          'Skip MOV check if cart contains any product with principal Ministry Of Health for SG market',
          (tester) async {
        when(() => autoRouterMock.push(const CheckoutPageRoute()))
            .thenAnswer((invocation) => Future(() => checkoutPageRouteData));
        final mockMinistryOfHealthCartItem = mockCartItems.first.copyWith(
          materialInfo: MaterialInfo.empty().copyWith(
            principalData: PrincipalData.empty().copyWith(
              principalCode: PrincipalCode('100777'),
            ),
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
          ),
        );
        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: [mockMinistryOfHealthCartItem, mockCartItems.first],
            salesOrg: fakeSGSalesOrganisation,
            configs: fakeSGSalesOrgConfigs,
            subTotal: 10,
            grandTotal: 20,
            showErrorMessage: true,
          ),
        );

        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [mockMinistryOfHealthCartItem, mockCartItems.first],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        final movWarning = find.text(
          'Please ensure that minimum order value is at least {mov}'
              .tr(namedArgs: {'mov': 'SGD 100.00'}),
        );

        expect(movWarning, findsNothing);

        final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
        expect(checkoutButton, findsOneWidget);
        await tester.tap(checkoutButton);
        await tester.pumpAndSettle();
        verify(() => autoRouterMock.push(const CheckoutPageRoute())).called(1);
      });

      testWidgets(
          'MOV check if cart does not contains any product with principal Ministry Of Health for SG market',
          (tester) async {
        final cartProduct = [
          mockCartItems.first.copyWith(
            tenderContract: TenderContract.empty(),
          ),
        ];
        when(() => autoRouterMock.pushNamed('/orders/cart/checkout'))
            .thenAnswer((invocation) => Future(() => checkoutPageRouteData));

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
          ),
        );
        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: cartProduct,
            salesOrg: fakeSGSalesOrganisation,
            configs: fakeSGSalesOrgConfigs,
            subTotal: 10,
            grandTotal: 20,
            showErrorMessage: true,
          ),
        );

        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: cartProduct,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        final movWarning = find.text(
          'Please ensure that minimum order value is at least {mov}'
              .tr(namedArgs: {'mov': 'SGD 100.00'}),
        );

        expect(movWarning, findsOneWidget);

        final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
        expect(checkoutButton, findsOneWidget);
        await tester.tap(checkoutButton);
        await tester.pumpAndSettle();
        verifyNever(() => autoRouterMock.pushNamed('/orders/cart/checkout'));
      });

      testWidgets(
          'Do not show MOV check error if cart contain only OOS item and enableSmallOrderFee is ON',
          (tester) async {
        final cartProduct = [
          mockCartItems.first.copyWith(
            tenderContract: TenderContract.empty(),
            stockInfoList: [
              StockInfo.empty().copyWith(
                inStock: MaterialInStock('No'),
              ),
            ],
          ),
        ];

        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: cartProduct,
            salesOrg: fakeSGSalesOrganisation,
            configs: fakeSGSalesOrgConfigs.copyWith(
              enableSmallOrderFee: true,
              smallOrderFee: 10,
              sapMinOrderAmount: 10,
              smallOrderFeeUserRoles: [
                RoleType.clientUser().smallOrderFeeRole,
                RoleType.clientAdmin().smallOrderFeeRole,
              ],
            ),
            showErrorMessage: true,
            user: User.empty().copyWith(
              role: Role.empty().copyWith(
                type: RoleType('internal_sales_rep'),
              ),
            ),
          ),
        );

        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: cartProduct,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        final movWarning = find.text(
          'Please ensure that minimum order value is at least {mov}'
              .tr(namedArgs: {'mov': 'SGD 10.00'}),
        );

        expect(movWarning, findsNothing);
      });

      testWidgets('BillToInfo test when enablebillto is false', (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                type: MaterialInfoType('material'),
                materialNumber: MaterialNumber('123456789'),
                quantity: MaterialQty(1),
              ),
              salesOrgConfig: fakeTWSalesOrgConfigs,
            ),
          ],
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTWSalesOrgConfigs,
            salesOrganisation: fakeKHSalesOrganisation,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final summaryInfoButton = find.byKey(WidgetKeys.summaryInfoButton);
        await tester.tap(summaryInfoButton);

        await tester.pumpAndSettle();

        final payerInformation = find.byKey(WidgetKeys.payerInformation);
        expect(payerInformation, findsNothing);
      });

      testWidgets(
          'Check if isProductDeterminationFailed is true then page is not redirecting from cart page to product details page',
          (tester) async {
        final cartStates = [
          CartState.initial().copyWith(
            isUpdatingStock: true,
          ),
          CartState.initial().copyWith(
            isUpdatingStock: false,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                maximumQty: 150,
                quantity: 170,
                stockInfoList: [
                  StockInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123456789'),
                    stockQuantity: 100,
                    inStock: MaterialInStock('No'),
                  ),
                ],
                materialInfo: MaterialInfo.empty().copyWith(
                  type: MaterialInfoType('material'),
                  materialNumber: MaterialNumber('123456789'),
                  quantity: MaterialQty(170),
                ),
                salesOrgConfig: fakeIDSalesOrgConfigs,
              ),
            ],
          ),
        ];

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );

        whenListen(cartBloc, Stream.fromIterable(cartStates));

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        verifyNever(
          () => autoRouterMock.maybePop(),
        );
      });

      testWidgets(
          'Display 26 series message when cart contain only 26 series material on SG market',
          (tester) async {
        final mockItem = mockCartItems.first.copyWith(
          quantity: 2,
          is26SeriesMaterial: true,
          stockInfoList: [
            StockInfo.empty().copyWith(
              materialNumber: mockCartItems.first.getMaterialNumber,
              stockQuantity: 10,
            ),
          ],
          salesOrgConfig: fakeSGSalesOrgConfigs,
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [mockItem],
          ),
        );
        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: [mockItem],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(
          find.text(
            'Your cart must contain other commercial material to proceed checkout.'
                .tr(),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Check checkout button disable when cart contain only 26 series material on SG market',
          (tester) async {
        final mockItem = mockCartItems.first.copyWith(
          quantity: 5,
          is26SeriesMaterial: true,
          price: Price.empty().copyWith(
            finalPrice: MaterialPrice(400),
          ),
          stockInfoList: [
            StockInfo.empty().copyWith(
              materialNumber: mockCartItems.first.getMaterialNumber,
              stockQuantity: 10,
              inStock: MaterialInStock('Yes'),
            ),
          ],
          salesOrgConfig: fakeSGSalesOrgConfigs,
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [mockItem],
          ),
        );
        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: [mockItem],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        final checkoutButton = find.widgetWithText(ElevatedButton, 'Check out');
        expect(checkoutButton, findsOneWidget);
        await tester.tap(checkoutButton);
        await tester.pump();
        verify(
          () => mixpanelService.trackEvent(
            eventName: TrackingEvents.checkoutFailure,
            properties: any(named: 'properties'),
          ),
        ).called(1);
      });

      testWidgets(
          'Display Cart must include Commercial material message when cart contain only Gimmick material',
          (tester) async {
        final mockItem = mockCartItems.first.copyWith(
          quantity: 1,
          materialInfo:
              mockCartItems.first.materialInfo.copyWith(isGimmick: true),
          salesOrgConfig: fakeTWSalesOrgConfigs,
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [mockItem],
          ),
        );
        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: [mockItem],
            configs: fakeTWSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(
          find.text(
            'Your cart must contain other commercial material to proceed checkout.'
                .tr(),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Check checkout button disable when cart contain only Gimmick material',
          (tester) async {
        final mockItem = mockCartItems.first.copyWith(
          quantity: 1,
          materialInfo:
              mockCartItems.first.materialInfo.copyWith(isGimmick: true),
          salesOrgConfig: fakeTWSalesOrgConfigs,
        );

        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [mockItem],
          ),
        );
        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: [mockItem],
            configs: fakeTWSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        final checkoutButton = find.widgetWithText(ElevatedButton, 'Check out');
        expect(checkoutButton, findsOneWidget);
        await tester.tap(checkoutButton);
        await tester.pump();
        verify(
          () => mixpanelService.trackEvent(
            eventName: TrackingEvents.checkoutFailure,
            properties: any(named: 'properties'),
          ),
        ).called(1);
      });

      testWidgets(
          'Display Gimmick material [Material code] is not allowed message when cart contain Gimmick material and Enable Gimmick Materials toggle is Off in Sale Org Configuration',
          (tester) async {
        final mockItem = mockCartItems.first.copyWith(
          quantity: 1,
          materialInfo:
              mockCartItems.first.materialInfo.copyWith(isGimmick: true),
          salesOrgConfig: fakeTWSalesOrgConfigs.copyWith(
            enableGimmickMaterial: false,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [mockItem],
          ),
        );
        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: [mockItem],
            configs: fakeTWSalesOrgConfigs.copyWith(
              enableGimmickMaterial: false,
            ),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(
          find.text(
            'Gimmick material ${mockCartItems.first.getMaterialNumber.displayMatNo} is not allowed'
                .tr(),
          ),
          findsOneWidget,
        );
      });

      group('Small order fee -', () {
        late final oosMaterial = mockCartItemWithAllType
            .firstWhere((e) => e.materialInfo.type.typeMaterial)
            .copyWith(
              bonusSampleItems: [],
              salesOrgConfig: fakeMYSalesOrgConfigs,
              stockInfoList: [],
            );
        late final inStockMaterial = oosMaterial.copyWith(
          stockInfoList: [
            StockInfo.empty().copyWith(inStock: MaterialInStock('Yes')),
          ],
        );
        late final smallOrderAppliedState =
            OrderEligibilityState.initial().copyWith(
          user: fakeClientUser,
          cartItems: [inStockMaterial],
          configs: fakeMYSalesOrgConfigsWithSmallOrderFee,
        );

        group('Agree small order fee bottom sheet', () {
          final bottomSheet = find.byKey(WidgetKeys.smallOrderFeeModal);

          testWidgets('Visible when small order fee is applied',
              (tester) async {
            when(() => autoRouterMock.push(const SmallOrderFeePageRoute()))
                .thenAnswer((invocation) => Future.value());
            when(() => cartBloc.state).thenReturn(
              CartState.initial().copyWith(cartProducts: [inStockMaterial]),
            );
            when(() => orderEligibilityBlocMock.state)
                .thenReturn(smallOrderAppliedState);

            await tester.pumpWidget(getWidget());
            await tester.pumpAndSettle();
            await tester.tap(find.byKey(WidgetKeys.checkoutButton));
            await tester.pumpAndSettle();

            verify(
              () => autoRouterMock.push(const SmallOrderFeePageRoute()),
            ).called(1);
          });

          testWidgets(
              'Should dismiss and show pre-order when tap on agree button and cart has OOS items',
              (tester) async {
            when(() => autoRouterMock.push(const SmallOrderFeePageRoute()))
                .thenAnswer((invocation) => Future.value(true));
            when(() => cartBloc.state).thenReturn(
              CartState.initial().copyWith(cartProducts: [oosMaterial]),
            );
            when(() => orderEligibilityBlocMock.state)
                .thenReturn(smallOrderAppliedState);

            await tester.pumpWidget(getWidget());
            await tester.pumpAndSettle();
            await tester.tap(find.byKey(WidgetKeys.checkoutButton));
            await tester.pumpAndSettle();
            verify(
              () => autoRouterMock.push(const SmallOrderFeePageRoute()),
            ).called(1);
            expect(find.byKey(WidgetKeys.preOrderModel), findsOneWidget);
          });

          testWidgets(
              'Should dismiss and go checkout when tap on agree button and cart has no OOS items',
              (tester) async {
            when(() => autoRouterMock.push(const SmallOrderFeePageRoute()))
                .thenAnswer((invocation) => Future.value(true));
            when(() => autoRouterMock.push(const CheckoutPageRoute()))
                .thenAnswer((_) => Future.value(true));
            when(() => cartBloc.state).thenReturn(
              CartState.initial().copyWith(cartProducts: [inStockMaterial]),
            );
            when(() => orderEligibilityBlocMock.state)
                .thenReturn(smallOrderAppliedState);

            await tester.pumpWidget(getWidget());
            await tester.pumpAndSettle();
            await tester.tap(find.byKey(WidgetKeys.checkoutButton));
            await tester.pumpAndSettle();
            verify(
              () => autoRouterMock.push(const SmallOrderFeePageRoute()),
            ).called(1);
            verify(() => autoRouterMock..push(const CheckoutPageRoute()))
                .called(1);
          });
        });

        group('Small order fee validation -', () {
          testWidgets(
              'Warning message not visible when cart contains at least 1 in-stock',
              (tester) async {
            when(() => cartBloc.state).thenReturn(
              CartState.initial()
                  .copyWith(cartProducts: [oosMaterial, inStockMaterial]),
            );
            when(() => orderEligibilityBlocMock.state).thenReturn(
              smallOrderAppliedState
                  .copyWith(cartItems: [oosMaterial, inStockMaterial]),
            );

            await tester.pumpWidget(getWidget());
            await tester.pumpAndSettle();
            expect(
              find.text(
                'To proceed, at least one (1) item must be in stock.',
              ),
              findsNothing,
            );
          });

          testWidgets('Warning message visible when cart contains all OOS',
              (tester) async {
            when(() => cartBloc.state).thenReturn(
              CartState.initial().copyWith(cartProducts: [oosMaterial]),
            );
            when(() => orderEligibilityBlocMock.state).thenReturn(
              smallOrderAppliedState.copyWith(cartItems: [oosMaterial]),
            );

            await tester.pumpWidget(getWidget());
            await tester.pumpAndSettle();
            expect(
              find.text(
                'To proceed, at least one (1) item must be in stock.',
              ),
              findsOneWidget,
            );
          });

          testWidgets(
              'Warning message for both MP and ZP visible when cart contains all OOS',
              (tester) async {
            when(() => eligibilityBloc.state).thenReturn(
              EligibilityState.initial().copyWith(
                user: fakeClientUserAccessMarketPlace,
                salesOrgConfigs: fakeMYSalesOrgConfigs,
                customerCodeInfo: fakeMarketPlaceCustomerCode,
              ),
            );
            when(() => cartBloc.state).thenReturn(
              CartState.initial().copyWith(cartProducts: [oosMaterial]),
            );
            when(() => orderEligibilityBlocMock.state).thenReturn(
              smallOrderAppliedState.copyWith(cartItems: [oosMaterial]),
            );

            await tester.pumpWidget(getWidget());
            await tester.pumpAndSettle();
            expect(
              find.text(
                'To proceed, at least one (1) ZP or MP item must be in stock.',
              ),
              findsOneWidget,
            );
          });
        });

        group('APL small order fee in ID market', () {
          testWidgets(
            ' -> show small order fee bottom sheet when small order fee greater than 0, then click cancel',
            (WidgetTester tester) async {
              when(() => cartBloc.state).thenReturn(
                CartState.initial().copyWith(
                  cartProducts: [
                    PriceAggregate.empty(),
                  ],
                  aplGetTotalPrice:
                      aplGetTotalPrice.copyWith(smallOrderFee: 2000),
                  salesOrganisation: fakeIDSalesOrganisation,
                ),
              );
              when(() => autoRouterMock.push(const SmallOrderFeePageRoute()))
                  .thenAnswer((invocation) => Future.value());
              await tester.pumpWidget(getWidget());
              await tester.pump();
              await tester.tap(find.byKey(WidgetKeys.checkoutButton));
              await tester.pumpAndSettle();
              verify(
                () => autoRouterMock.push(const SmallOrderFeePageRoute()),
              ).called(1);
              verifyNever(
                () => autoRouterMock.pushNamed('/orders/cart/checkout'),
              );
            },
          );

          testWidgets(
            ' -> click checkout then show small order fee modal, click agree to checkout page',
            (WidgetTester tester) async {
              when(() => autoRouterMock.push(const CheckoutPageRoute()))
                  .thenAnswer((invocation) => Future.value());
              when(() => autoRouterMock.push(const SmallOrderFeePageRoute()))
                  .thenAnswer((invocation) => Future.value(true));
              when(() => cartBloc.state).thenReturn(
                CartState.initial().copyWith(
                  cartProducts: [
                    PriceAggregate.empty(),
                  ],
                  aplGetTotalPrice:
                      aplGetTotalPrice.copyWith(smallOrderFee: 2000),
                  salesOrganisation: fakeIDSalesOrganisation,
                ),
              );

              await tester.pumpWidget(getWidget());
              await tester.pump();
              await tester.tap(find.byKey(WidgetKeys.checkoutButton));
              await tester.pumpAndSettle();
              verify(
                () => autoRouterMock.push(const SmallOrderFeePageRoute()),
              ).called(1);

              verify(() => autoRouterMock.push(const CheckoutPageRoute()))
                  .called(1);
            },
          );
        });

        group('External Sales Rep small order fee in SG market', () {
          testWidgets(
            ' -> isPPATriggerMaintained is True then click checkout; click agree to checkout page',
            (WidgetTester tester) async {
              final fakeExtSalesRep = fakeExternalSalesRepUser.copyWith(
                isPPATriggerMaintained: true,
              );
              final mockItem = mockCartItems.first.copyWith(
                tenderContract: TenderContract.empty(),
                quantity: 1,
                stockInfoList: [
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('Yes'),
                    materialNumber: mockCartItems.first.getMaterialNumber,
                    stockQuantity: 10,
                  ),
                ],
                salesOrgConfig: fakeSGSalesOrgConfigs,
              );
              when(() => autoRouterMock.push(const CheckoutPageRoute()))
                  .thenAnswer((invocation) => Future.value());
              final orderEligibilityState =
                  OrderEligibilityState.initial().copyWith(
                user: fakeExtSalesRep,
                salesOrg: fakeSGSalesOrganisation,
                configs: fakeSGSalesOrgConfigsWithSmallOrderFee,
                cartItems: [
                  mockItem,
                ],
              );
              when(() => cartBloc.state).thenReturn(
                CartState.initial().copyWith(
                  user: fakeExtSalesRep,
                  cartProducts: [
                    mockItem,
                  ],
                  salesOrganisation: fakeSGSalesOrganisation,
                  config: fakeSGSalesOrgConfigsWithSmallOrderFee,
                ),
              );
              when(() => orderEligibilityBlocMock.state).thenReturn(
                orderEligibilityState,
              );
              await tester.pumpWidget(getWidget());
              await tester.pump();
              final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
              expect(checkoutButton, findsOneWidget);
              expect(orderEligibilityState.isCheckoutDisabled, false);
              await tester.tap(checkoutButton);
              await tester.pumpAndSettle();
              verify(() => autoRouterMock.push(const CheckoutPageRoute()))
                  .called(1);
            },
          );
        });
      });
      testWidgets(
        ' -> Stock Info banner visible in cart',
        (WidgetTester tester) async {
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfigs: fakeIDSalesOrgConfigs,
              isStockInfoNotAvailable: true,
            ),
          );

          await tester.pumpWidget(getWidget());
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
        ' -> Stock Info banner not visible in cart',
        (WidgetTester tester) async {
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfigs: fakeIDSalesOrgConfigs,
              isStockInfoNotAvailable: false,
            ),
          );

          await tester.pumpWidget(getWidget());
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

      group('Marketplace MOV validation -', () {
        testWidgets('When both zp MOV and mp MOV is not eligible',
            (tester) async {
          final cartProducts = mockCartItemWithAllType
              .where(
                (element) => element.tenderContract == TenderContract.empty(),
              )
              .toList();
          final salesOrgConfig = fakeMYSalesOrgConfigs;
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(cartProducts: cartProducts),
          );
          when(() => orderEligibilityBlocMock.state).thenReturn(
            OrderEligibilityState.initial().copyWith(
              cartItems: cartProducts,
              configs: salesOrgConfig,
              mpSubtotal: salesOrgConfig.mpMinOrderAmount - 1,
              zpSubtotal: salesOrgConfig.minOrderAmount - 1,
              showErrorMessage: true,
            ),
          );
          await tester.binding.setSurfaceSize(const Size(600, 900));
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final classicMOVErrorMessage =
              'Please ensure that minimum order value is at least {mov}'.tr(
            namedArgs: {
              'mov': StringUtils.displayPrice(
                salesOrgConfig,
                salesOrgConfig.minOrderAmount,
              ),
            },
          );
          final errorMessage =
              'Please ensure that minimum order value is at least ${StringUtils.displayPrice(salesOrgConfig, salesOrgConfig.minOrderAmount)} for ZP subtotal & ${StringUtils.displayPrice(salesOrgConfig, salesOrgConfig.mpMinOrderAmount)} for MP subtotal.';
          expect(find.text(errorMessage), findsOneWidget);
          expect(find.text(classicMOVErrorMessage), findsNothing);
        });

        testWidgets('When zp MOV is eligible and mp MOV is not eligible',
            (tester) async {
          final cartProducts = mockCartItemWithAllType
              .where(
                (element) => element.tenderContract == TenderContract.empty(),
              )
              .toList();
          final salesOrgConfig = fakeMYSalesOrgConfigs;
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(cartProducts: cartProducts),
          );
          when(() => orderEligibilityBlocMock.state).thenReturn(
            OrderEligibilityState.initial().copyWith(
              cartItems: cartProducts,
              configs: salesOrgConfig,
              mpSubtotal: salesOrgConfig.mpMinOrderAmount - 1,
              zpSubtotal: salesOrgConfig.minOrderAmount,
              showErrorMessage: true,
            ),
          );

          await tester.binding.setSurfaceSize(const Size(600, 900));
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final errorMessage =
              'Please ensure that minimum order value is at least ${StringUtils.displayPrice(salesOrgConfig, salesOrgConfig.mpMinOrderAmount)} for MP subtotal.';
          expect(find.text(errorMessage), findsOneWidget);
        });

        testWidgets('When mp MOV is not eligible and no zp material in cart',
            (tester) async {
          final salesOrgConfig = fakeMYSalesOrgConfigs;
          when(() => cartBloc.state).thenReturn(
            CartState.initial()
                .copyWith(cartProducts: mockCartItemWithAllType.mpMaterialOnly),
          );
          when(() => orderEligibilityBlocMock.state).thenReturn(
            OrderEligibilityState.initial().copyWith(
              cartItems: mockCartItemWithAllType.mpMaterialOnly,
              configs: salesOrgConfig,
              mpSubtotal: salesOrgConfig.mpMinOrderAmount - 1,
              zpSubtotal: salesOrgConfig.minOrderAmount - 1,
              showErrorMessage: true,
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final errorMessage =
              'Please ensure that minimum order value is at least ${StringUtils.displayPrice(salesOrgConfig, salesOrgConfig.mpMinOrderAmount)} for MP subtotal.';
          expect(find.text(errorMessage), findsOneWidget);
        });

        testWidgets('When zp MOV is not eligible and mp MOV is eligible',
            (tester) async {
          final cartProducts = mockCartItemWithAllType
              .where(
                (element) => element.tenderContract == TenderContract.empty(),
              )
              .toList();
          final salesOrgConfig = fakeMYSalesOrgConfigs;
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(cartProducts: cartProducts),
          );
          when(() => orderEligibilityBlocMock.state).thenReturn(
            OrderEligibilityState.initial().copyWith(
              cartItems: cartProducts,
              configs: salesOrgConfig,
              mpSubtotal: salesOrgConfig.mpMinOrderAmount,
              zpSubtotal: salesOrgConfig.minOrderAmount - 1,
              showErrorMessage: true,
            ),
          );

          await tester.binding.setSurfaceSize(const Size(600, 900));
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final errorMessage =
              'Please ensure that minimum order value is at least ${StringUtils.displayPrice(salesOrgConfig, salesOrgConfig.minOrderAmount)} for ZP subtotal.';
          expect(find.text(errorMessage), findsOneWidget);
        });
      });

      group('Scroll list section -', () {
        late List<PriceAggregate> cartItems;
        late final zpItems = cartItems.zpMaterialOnly;
        late final mpItems = cartItems.mpMaterialOnly;
        final zpSection = find.byKey(WidgetKeys.cartZPProductSection);
        final mpSection = find.byKey(WidgetKeys.cartMPProductSection);

        setUpAll(() async {
          cartItems = (await CartLocalDataSource().getAddedToCartProductList())
              .cartProducts;
        });

        Future<void> scroll(WidgetTester tester, Finder finder) =>
            tester.dragUntilVisible(
              finder,
              find.byKey(WidgetKeys.scrollList),
              const Offset(0, -200),
            );

        testWidgets('MP and ZP section visible', (tester) async {
          await tester.binding.setSurfaceSize(const Size(600, 900));
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(cartProducts: cartItems),
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          expect(zpSection, findsOneWidget);
          final lastZPItem = find.descendant(
            of: zpSection,
            matching: find.byKey(WidgetKeys.cartItemTile(zpItems.length - 1)),
          );
          await scroll(tester, lastZPItem);
          expect(lastZPItem, findsOneWidget);
          await scroll(tester, mpSection);
          expect(mpSection, findsOneWidget);
          expect(
            find.descendant(
              of: mpSection,
              matching: find.byKey(WidgetKeys.cartMPProductSectionLabel),
            ),
            findsOneWidget,
          );
          final mpDeliveryTile = find.descendant(
            of: mpSection,
            matching: find.byType(MarketPlaceDeliveryTile),
          );
          await scroll(tester, mpDeliveryTile);
          await tester.pumpAndSettle();
          expect(mpDeliveryTile, findsOne);
          await tester.tap(mpDeliveryTile);
          await tester.pumpAndSettle();
          final bottomSheet =
              find.byKey(WidgetKeys.marketplaceDeliveryInfoSheet);
          expect(bottomSheet, findsOne);
          expect(
            find.descendant(
              of: bottomSheet,
              matching: find.textContaining(
                'Marketplace item(s) delivery',
                findRichText: true,
              ),
            ),
            findsOne,
          );
          expect(
            find.descendant(
              of: bottomSheet,
              matching: find.text(
                'The delivery times for Marketplace items are based on sellers\' response times and may exceed the usual delivery times for ZP orders. Sellers will dispatch the items to the ZP warehouse, and we will handle the delivery to you.',
              ),
            ),
            findsOne,
          );
          expect(
            find.descendant(
              of: bottomSheet,
              matching: find.text('Delivery by'),
            ),
            findsOne,
          );
          expect(
            find.descendant(
              of: bottomSheet,
              matching: find.byType(MarketPlaceSellerTitle),
            ),
            findsNWidgets(cartItems.mpMaterialOnly.manufacturers.length),
          );
          final closeButton = find.descendant(
            of: bottomSheet,
            matching: find.byKey(WidgetKeys.closeButton),
          );
          expect(closeButton, findsOne);
          await tester.tap(closeButton);
          await tester.pumpAndSettle();
          expect(bottomSheet, findsNothing);

          final lastMPItem = find.descendant(
            of: mpSection,
            matching: find.byKey(WidgetKeys.cartItemTile(mpItems.length - 1)),
          );
          await scroll(tester, lastMPItem);
          expect(lastMPItem, findsOneWidget);
        });

        testWidgets('MP section not visible when there is no MP items',
            (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(cartProducts: zpItems),
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          expect(zpSection, findsOneWidget);
          final lastZPItem = find.descendant(
            of: zpSection,
            matching: find.byKey(WidgetKeys.cartItemTile(zpItems.length - 1)),
          );
          await scroll(tester, lastZPItem);
          expect(lastZPItem, findsOneWidget);
          await tester.drag(
            find.byKey(WidgetKeys.scrollList),
            const Offset(0, -1000),
          );
          expect(mpSection, findsNothing);
          expect(
            find.descendant(
              of: mpSection,
              matching: find.byKey(WidgetKeys.cartItemTile(0)),
            ),
            findsNothing,
          );
        });

        testWidgets('ZP section not visible when there is no ZP items',
            (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(cartProducts: mpItems),
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          expect(zpSection, findsNothing);
          expect(
            find.descendant(
              of: zpSection,
              matching: find.byKey(WidgetKeys.cartItemTile(0)),
            ),
            findsNothing,
          );
          expect(mpSection, findsOneWidget);
          expect(
            find.descendant(
              of: mpSection,
              matching: find.byKey(WidgetKeys.cartMPProductSectionLabel),
            ),
            findsOneWidget,
          );
          final lastMPItem = find.descendant(
            of: mpSection,
            matching: find.byKey(WidgetKeys.cartItemTile(mpItems.length - 1)),
          );
          await scroll(tester, lastMPItem);
          expect(lastMPItem, findsOneWidget);
        });

        testWidgets('Display no record when list is empty', (tester) async {
          when(() => autoRouterMock.navigateNamed('/main/products'))
              .thenAnswer((async) => Future.value());
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(cartProducts: <PriceAggregate>[]),
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final noRecord = find.byType(NoRecordFound);
          expect(noRecord, findsOneWidget);
          expect(mpSection, findsNothing);
          expect(zpSection, findsNothing);
          expect(
            find.descendant(
              of: noRecord,
              matching: find.text('Your cart is empty'),
            ),
            findsOneWidget,
          );

          expect(
            find.descendant(
              of: noRecord,
              matching: find.text(
                'Looks like you haven’t added anything to your cart yet.',
              ),
            ),
            findsOneWidget,
          );
          final browseButton = find.byKey(WidgetKeys.startBrowsingProducts);
          expect(browseButton, findsOneWidget);
          await tester.tap(browseButton);
          await tester.pumpAndSettle();

          verify(() => autoRouterMock.navigateNamed('/main/products'))
              .called(1);
        });

        testWidgets('Display exceed quantity message on ID market',
            (tester) async {
          final mockItem = mockCartItems.first.copyWith(
            quantity: 11,
            stockInfoList: [
              StockInfo.empty().copyWith(
                materialNumber: mockCartItems.first.getMaterialNumber,
                stockQuantity: 10,
              ),
            ],
            salesOrgConfig: fakeIDSalesOrgConfigs,
          );
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: [mockItem],
            ),
          );
          when(() => orderEligibilityBlocMock.state).thenReturn(
            OrderEligibilityState.initial().copyWith(
              cartItems: [mockItem],
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          expect(
            find.text(
              'You have exceeded the available quantity for this item.'.tr(),
            ),
            findsOneWidget,
          );
        });

        testWidgets(
          'Test OOS-PreOrder tag not visible when stockInfoList is empty',
          (tester) async {
            final cartState = CartState.initial().copyWith(
              cartProducts: <PriceAggregate>[
                mockCartItems.first.copyWith(stockInfoList: []),
              ],
            );

            final eligibilityState = EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
            );

            when(() => cartBloc.state).thenReturn(
              cartState,
            );

            when(() => eligibilityBloc.state).thenReturn(
              eligibilityState,
            );

            await tester.pumpWidget(getWidget());
            await tester.pumpAndSettle();

            final preOrderText = find.text('OOS-Preorder');
            expect(preOrderText, findsNothing);
          },
        );

        testWidgets(
            'Display default material description when material description is empty',
            (tester) async {
          final mockItem = mockCartItems.first.copyWith(
            salesOrgConfig: fakeIDSalesOrgConfigs,
            materialInfo: mockCartItems.first.materialInfo.copyWith(
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

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          expect(
            find.text('fake-material-description'),
            findsOneWidget,
          );
        });
        testWidgets(
          ' -> Find edi if customer info status is edi',
          (WidgetTester tester) async {
            when(() => eligibilityBloc.state).thenReturn(
              EligibilityState.initial().copyWith(
                customerCodeInfo: fakeEDICustomerCodeInfo,
              ),
            );
            await tester.pumpWidget(getWidget());
            await tester.pump();

            final ediBanner = find.byKey(WidgetKeys.ediUserBanner);
            final ediBannerTitle = find.text('You are an EDI customer.');
            final ediBannerSubTitle = find.text(
              'Ordering is disabled on eZRx+, please place your orders through the EDI system only.',
            );
            expect(ediBanner, findsOneWidget);
            expect(ediBannerTitle, findsOneWidget);
            expect(ediBannerSubTitle, findsOneWidget);
          },
        );

        testWidgets(
          ' -> Not Find edi if customer info status is not edi',
          (WidgetTester tester) async {
            when(() => eligibilityBloc.state).thenReturn(
              EligibilityState.initial().copyWith(
                customerCodeInfo: fakeCustomerCodeInfo,
              ),
            );
            await tester.pumpWidget(getWidget());
            await tester.pump();

            final ediBanner = find.byKey(WidgetKeys.ediUserBanner);
            final ediBannerTitle = find.text('You are an EDI customer.');
            final ediBannerSubTitle = find.text(
              'Ordering is disabled on eZRx+, please place your orders through the EDI system only.',
            );
            expect(ediBanner, findsNothing);
            expect(ediBannerTitle, findsNothing);
            expect(ediBannerSubTitle, findsNothing);
          },
        );
      });

      group('Tender Contract MOV validation For VN Market - ', () {
        testWidgets(
            'When tender contract add to cart, then no MOV validation on checkout',
            (tester) async {
          final salesOrgConfig = fakeVNSalesOrgConfigs;
          //the first element of mockCartItems is Tender Contract material
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(cartProducts: [mockCartItems.first]),
          );
          when(() => orderEligibilityBlocMock.state).thenReturn(
            OrderEligibilityState.initial().copyWith(
              cartItems: [mockCartItems.first],
              configs: salesOrgConfig,
              mpSubtotal: salesOrgConfig.mpMinOrderAmount - 1,
              zpSubtotal: salesOrgConfig.minOrderAmount - 1,
              showErrorMessage: true,
            ),
          );
          await tester.binding.setSurfaceSize(const Size(600, 900));
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final classicMOVErrorMessage =
              'Please ensure that minimum order value is at least {mov}'.tr(
            namedArgs: {
              'mov': StringUtils.displayPrice(
                salesOrgConfig,
                salesOrgConfig.minOrderAmount,
              ),
            },
          );
          expect(find.text(classicMOVErrorMessage), findsNothing);
        });

        testWidgets(
            'When non tender contract add to cart, then MOV validation on checkout',
            (tester) async {
          final salesOrgConfig = fakeVNSalesOrgConfigs;
          //overriding the first element of mockCartItems as non-Tender Contract material
          final cartProducts = [
            mockCartItemWithAllType.firstWhere(
              (element) => element.tenderContract == TenderContract.empty(),
              orElse: () => PriceAggregate.empty(),
            ),
          ];
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(cartProducts: cartProducts),
          );
          when(() => orderEligibilityBlocMock.state).thenReturn(
            OrderEligibilityState.initial().copyWith(
              cartItems: cartProducts,
              configs: salesOrgConfig,
              showErrorMessage: true,
            ),
          );
          await tester.binding.setSurfaceSize(const Size(600, 900));
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final classicMOVErrorMessage =
              'Please ensure that minimum order value is at least {mov}'.tr(
            namedArgs: {
              'mov': StringUtils.displayPrice(
                salesOrgConfig,
                salesOrgConfig.minOrderAmount,
              ),
            },
          );
          expect(find.text(classicMOVErrorMessage), findsOneWidget);
        });
      });

      group('Tender Contract - ', () {
        testWidgets(
            'Show error message Tender Contract is no longer available for one or few item(s). Please remove to continue.',
            (tester) async {
          final mockItem = mockCartItems.first.copyWith(
            tenderContract: TenderContract.empty().copyWith(
              tenderOrderReason: TenderContractReason('730'),
              contractNumber: TenderContractNumber('fake-Number'),
              tenderPrice: 11832000.0,
              contractReference: StringValue('fake-Reference'),
              isTenderExpired: true,
            ),
            quantity: 11,
            stockInfoList: [
              StockInfo.empty().copyWith(
                materialNumber: mockCartItems.first.getMaterialNumber,
                stockQuantity: 10,
              ),
            ],
            salesOrgConfig: fakeVNSalesOrgConfigs,
          );
          final orderEligibilityState =
              OrderEligibilityState.initial().copyWith(
            cartItems: [mockItem],
          );
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: [
                mockItem,
              ],
            ),
          );
          when(() => orderEligibilityBlocMock.state).thenReturn(
            orderEligibilityState,
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          expect(
            find.text(
              'Tender Contract is no longer available for one or few item(s). Please remove to continue.',
            ),
            findsOneWidget,
          );
          final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
          expect(checkoutButton, findsOneWidget);
          expect(orderEligibilityState.isCheckoutDisabled, true);
        });

        testWidgets(
            'Show error message Product [material_name] need to use tender contract. when hasMandatoryTenderContract is true and tender data is not available',
            (tester) async {
          final mockItem = mockCartItems.first.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('material'),
              defaultMaterialDescription: 'material_name',
              materialNumber: MaterialNumber('123456789'),
              quantity: MaterialQty(170),
              hasMandatoryTenderContract: true,
            ),
            tenderContract: TenderContract.empty(),
            quantity: 11,
            stockInfoList: [
              StockInfo.empty().copyWith(
                materialNumber: mockCartItems.first.getMaterialNumber,
                stockQuantity: 10,
              ),
            ],
            salesOrgConfig: fakeVNSalesOrgConfigs,
          );
          final orderEligibilityState =
              OrderEligibilityState.initial().copyWith(
            cartItems: [mockItem],
          );
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: [
                mockItem,
              ],
            ),
          );
          when(() => orderEligibilityBlocMock.state).thenReturn(
            orderEligibilityState,
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          expect(
            find.text(
              'Product material_name need to use tender contract.',
            ),
            findsOneWidget,
          );
          final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
          expect(checkoutButton, findsOneWidget);
          expect(orderEligibilityState.isCheckoutDisabled, true);
        });

        testWidgets(
            'Show error message One or few item(s) order qty exceed the maximum available tender quantity.',
            (tester) async {
          final mockItem = mockCartItems.first.copyWith(
            tenderContract: TenderContract.empty().copyWith(
              tenderOrderReason: TenderContractReason('730'),
              contractNumber: TenderContractNumber('fake-Number'),
              tenderPrice: 11832000.0,
              contractReference: StringValue('fake-Reference'),
              remainingTenderQuantity: 1,
            ),
            quantity: 11,
            stockInfoList: [
              StockInfo.empty().copyWith(
                materialNumber: mockCartItems.first.getMaterialNumber,
                stockQuantity: 10,
              ),
            ],
            salesOrgConfig: fakeVNSalesOrgConfigs,
          );
          final orderEligibilityState =
              OrderEligibilityState.initial().copyWith(
            cartItems: [mockItem],
          );
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: [
                mockItem,
              ],
            ),
          );
          when(() => orderEligibilityBlocMock.state).thenReturn(
            orderEligibilityState,
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          expect(
            find.text(
              'One or few item(s) order qty exceed the maximum available tender quantity.',
            ),
            findsOneWidget,
          );
          final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
          expect(checkoutButton, findsOneWidget);
          expect(orderEligibilityState.isCheckoutDisabled, true);
        });
      });

      group('Delivery options', () {
        final section = find.byKey(WidgetKeys.cartDeliveryOptionsSection);

        testWidgets('Should hide if market is not HK', (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(cartProducts: mockCartItems),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          expect(section, findsNothing);
        });

        testWidgets(
            'Should show in HK market and select standard delivery by default when enableDeliveryOptions is true, and all deliveryOptions check are true',
            (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: mockCartItems,
            ),
          );
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeHKSalesOrganisation,
              salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
                enableDeliveryOptions: true,
                disclaimer: 'Delivery times are estimates and may vary.',
                standardDeliveryDays: 5,
                enableStandardDelivery: true,
              ),
            ),
          );
          when(() => orderEligibilityBlocMock.state).thenReturn(
            OrderEligibilityState.initial().copyWith(
              salesOrg: fakeMYSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
              shipInfo: fakeShipToInfo,
              user: fakeClientUser,
              configs: SalesOrganisationConfigs.empty().copyWith(
                enableDeliveryOptions: true,
                disclaimer: 'Delivery times are estimates and may vary.',
                standardDeliveryDays: 5,
                enableStandardDelivery: true,
                enableRequestDeliveryDate: true,
                enableUrgentDelivery: true,
              ),
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          expect(section, findsOne);
          expect(
            find.descendant(
              of: section,
              matching: find.text('Delivery Options'),
            ),
            findsOne,
          );
          expect(
            find.descendant(
              of: section,
              matching: find.text(
                'Delivery times are estimates and may vary.',
              ),
            ),
            findsOne,
          );
          final standardDeliveryCard = find.byKey(
            WidgetKeys.cartDeliveryOptionCard('Standard delivery', true),
          );
          final requestDeliveryDateCard = find.byKey(
            WidgetKeys.cartDeliveryOptionCard(
              'Request delivery date',
              false,
            ),
          );
          final urgentDeliveryCard = find.byKey(
            WidgetKeys.cartDeliveryOptionCard('Urgent delivery', false),
          );
          expect(
            find.descendant(of: section, matching: standardDeliveryCard),
            findsOne,
          );
          expect(
            find.descendant(
              of: section,
              matching: find.text('Standard delivery'),
            ),
            findsOne,
          );
          expect(
            find.descendant(
              of: section,
              matching: find.text('Receive your order in 5 business days.'),
            ),
            findsOne,
          );
          await tester.tap(standardDeliveryCard);
          await tester.pumpAndSettle();
          verify(
            () => orderEligibilityBlocMock.add(
              OrderEligibilityEvent.selectDeliveryOption(
                DeliveryOption.standardDelivery(),
              ),
            ),
          ).called(1);
          expect(
            find.descendant(of: section, matching: requestDeliveryDateCard),
            findsOne,
          );
          expect(
            find.descendant(
              of: section,
              matching: find.text('Request delivery date'),
            ),
            findsOne,
          );
          await tester.dragUntilVisible(
            requestDeliveryDateCard,
            find.byKey(WidgetKeys.scrollList),
            const Offset(0, -200),
          );
          await tester.pumpAndSettle();
          await tester.tap(requestDeliveryDateCard);
          await tester.pumpAndSettle();
          verify(
            () => orderEligibilityBlocMock.add(
              OrderEligibilityEvent.selectDeliveryOption(
                DeliveryOption.requestDeliveryDate(),
              ),
            ),
          ).called(1);
          expect(
            find.descendant(of: section, matching: urgentDeliveryCard),
            findsOne,
          );
          expect(
            find.descendant(
              of: section,
              matching: find.text('Urgent delivery'),
            ),
            findsOne,
          );
          await tester.dragUntilVisible(
            urgentDeliveryCard,
            find.byKey(WidgetKeys.scrollList),
            const Offset(0, -200),
          );
          await tester.pumpAndSettle();
          await tester.tap(urgentDeliveryCard);
          await tester.pumpAndSettle();
          verify(
            () => orderEligibilityBlocMock.add(
              OrderEligibilityEvent.selectDeliveryOption(
                DeliveryOption.urgentDelivery(),
              ),
            ),
          ).called(1);
        });

        testWidgets('Should show date picker when select request delivery date',
            (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(cartProducts: mockCartItems),
          );
          when(() => orderEligibilityBlocMock.state).thenReturn(
            OrderEligibilityState.initial().copyWith(
              deliveryOption: DeliveryOption.requestDeliveryDate(),
              configs: SalesOrganisationConfigs.empty().copyWith(
                enableDeliveryOptions: true,
                enableRequestDeliveryDate: true,
              ),
            ),
          );
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeHKSalesOrganisation,
              salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
                enableDeliveryOptions: true,
                enableRequestDeliveryDate: true,
              ),
            ),
          );
          final requestDeliveryDateCard = find.byKey(
            WidgetKeys.cartDeliveryOptionCard(
              'Request delivery date',
              true,
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          expect(requestDeliveryDateCard, findsOne);
          expect(
            find.descendant(
              of: section,
              matching: find.byKey(WidgetKeys.deliveryDate),
            ),
            findsOne,
          );
          await tester.tap(find.byKey(WidgetKeys.deliveryDate));
          await tester.pumpAndSettle();
          expect(find.byType(DatePickerDialog), findsOne);
        });

        testWidgets('Should show bottom sheet when select urgent delivery',
            (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(cartProducts: mockCartItems),
          );
          when(() => orderEligibilityBlocMock.state).thenReturn(
            OrderEligibilityState.initial().copyWith(
              deliveryOption: DeliveryOption.urgentDelivery(),
              configs: SalesOrganisationConfigs.empty().copyWith(
                enableDeliveryOptions: true,
                enableUrgentDelivery: true,
                enableTodayUrgentDelivery: true,
                enableTomorrowUrgentDelivery: true,
                enableSaturdayUrgentDelivery: true,
              ),
            ),
          );
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeHKSalesOrganisation,
              salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
                enableDeliveryOptions: true,
                enableUrgentDelivery: true,
              ),
            ),
          );
          final urgentDelivery = find.byKey(
            WidgetKeys.cartDeliveryOptionCard(
              'Urgent delivery',
              true,
            ),
          );
          final dropdown = find.byKey(WidgetKeys.cartUrgentDeliveryTimePicker);

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          await tester.dragUntilVisible(
            urgentDelivery,
            find.byKey(WidgetKeys.scrollList),
            const Offset(0, -100),
          );
          expect(urgentDelivery, findsOne);
          expect(
            find.descendant(of: section, matching: dropdown),
            findsOne,
          );
          await tester.pumpAndSettle();
          await tester.tap(dropdown);
          await tester.pumpAndSettle();
          for (final option in [
            'Today, 1PM - 6PM (order before 10:30 AM)',
            'Tomorrow, 9AM - 12AM (order before 4PM)',
            'Saturday, 9AM - 1PM (order before 4PM)',
          ]) {
            expect(
              find.descendant(
                of: find.byType(RadioListTile<UrgentDeliveryTimePickerOption>),
                matching: find.text(option),
              ),
              findsOne,
            );
          }
        });

        testWidgets(
            'Test invalid banner when cart consist suspended material with combo material',
            (tester) async {
          final suspendedMaterialItem = mockCartItems.firstWhere(
            (e) =>
                e.materialInfo.type.typeMaterial && e.materialInfo.isSuspended,
          );
          final fakeMaterialInfo =
              fakeComboMaterialItems.first.materialInfo.copyWith(
            stockInfos: [
              StockInfo.empty().copyWith(
                inStock: MaterialInStock('No'),
                materialNumber:
                    fakeComboMaterialItems.first.materialInfo.materialNumber,
              ),
            ],
          );
          final comboItem = mockCartItems.last.copyWith(
            materialInfo: mockCartItems.last.materialInfo.copyWith(
              type: MaterialInfoType('combo'),
            ),
            comboMaterials: [
              fakeComboMaterialItems.first
                  .copyWith(materialInfo: fakeMaterialInfo),
            ],
          );

          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial()
                .copyWith(salesOrgConfigs: fakeIDSalesOrgConfigs),
          );

          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: <PriceAggregate>[
                suspendedMaterialItem,
                comboItem,
              ],
            ),
          );

          when(() => orderEligibilityBlocMock.state).thenReturn(
            OrderEligibilityState.initial().copyWith(
              cartItems: <PriceAggregate>[
                suspendedMaterialItem,
                comboItem,
              ],
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final invalidItemBannerFinder =
              find.byKey(WidgetKeys.cartPageInvalidItemsBanner);
          final invalidMessageFinder = find.text('Suspended material');
          final invalidItemBannerButtonFinder =
              find.byKey(WidgetKeys.cartPageInvalidItemsBannerButton);

          expect(invalidItemBannerFinder, findsOneWidget);
          expect(invalidMessageFinder, findsOneWidget);
          expect(invalidItemBannerButtonFinder, findsOneWidget);

          final comboMaterialFinder = find.byKey(
            WidgetKeys.cartItemProductTile(
              comboItem.comboMaterials.first.materialInfo.materialNumber
                  .displayMatNo,
            ),
          );

          expect(
            find.descendant(
              of: comboMaterialFinder,
              matching: find.text('OOS-Preorder'),
            ),
            findsOne,
          );
          final suspendedMaterialFinder = find.byKey(
            WidgetKeys.cartItemProductTile(
              suspendedMaterialItem.materialInfo.materialNumber.displayMatNo,
            ),
          );

          await tester.tap(invalidItemBannerButtonFinder);
          verify(
            () => cartBloc.add(
              CartEvent.removeInvalidProducts(
                invalidCartItems: <MaterialInfo>[
                  suspendedMaterialItem.materialInfo
                      .copyWith(quantity: MaterialQty(0)),
                ],
              ),
            ),
          ).called(1);
          await tester.pumpAndSettle();
          expect(comboMaterialFinder, findsOneWidget);
          expect(suspendedMaterialFinder, findsNothing);
        });
      });
    },
  );
}
