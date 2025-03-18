import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/apl_get_total_price.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/cart.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/material_banner_storage.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/config.dart';
import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/domain/order/entities/cart_product_request.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_product_request_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_product_request_dto.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class StockInfoRemoteDataSourceMock extends Mock
    implements StockInfoRemoteDataSource {}

class CartLocalDataSourceMock extends Mock implements CartLocalDataSource {}

class CartRemoteDataSourceMock extends Mock implements CartRemoteDataSource {}

class StockInfoLocalDataSourceMock extends Mock
    implements StockInfoLocalDataSource {}

class MaterialBannerStorageMock extends Mock implements MaterialBannerStorage {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late Config mockConfig;
  late StockInfoLocalDataSourceMock stockInfoLocalDataSource;
  late StockInfoRemoteDataSourceMock stockInfoRemoteDataSource;
  late CartLocalDataSourceMock cartLocalDataSourceMock;
  late CartRepository cartRepository;
  late MixpanelService mixpanelService;
  late CartRemoteDataSource cartRemoteDataSource;
  late AplSimulatorOrder aplSimulatorOrder;
  late AplGetTotalPrice aplGetTotalPrice;
  late DeviceStorage deviceStorageMock;
  late MaterialBannerStorage materialBannerStorageMock;
  const mockMarket = 'mockMarket';

  final fakeCartProducts = [
    PriceAggregate.empty().copyWith(
      salesOrgConfig: fakeMYSalesOrgConfigs,
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('1'),
        quantity: MaterialQty(5),
        counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
          comment: StringValue('fakeComment'),
          counterOfferCurrency: Currency('MYR'),
        ),
        sampleBonusItemId: 'fakeSampleBonusItemId',
        type: MaterialInfoType('material'),
        parentID: 'fakeSampleBonusItemId',
      ),
    ),
  ];
  final materialStockInfo = <MaterialStockInfo>[
    MaterialStockInfo.empty().copyWith(
      stockInfos: [
        StockInfo.empty().copyWith(
          materialNumber: MaterialNumber('12345'),
          inStock: MaterialInStock('Yes'),
        ),
      ],
    ),
  ];
  final fakeCartProductsWithCombo = <PriceAggregate>[];
  final fakeException = Exception('fake_error');

  setUpAll(() async {
    mockConfig = ConfigMock();
    when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
    stockInfoLocalDataSource = StockInfoLocalDataSourceMock();
    stockInfoRemoteDataSource = StockInfoRemoteDataSourceMock();
    cartLocalDataSourceMock = CartLocalDataSourceMock();
    mixpanelService = MixpanelServiceMock();
    cartRemoteDataSource = CartRemoteDataSourceMock();
    deviceStorageMock = DeviceStorageMock();
    materialBannerStorageMock = MaterialBannerStorageMock();

    cartRepository = CartRepository(
      mixpanelService: mixpanelService,
      cartLocalDataSource: cartLocalDataSourceMock,
      config: mockConfig,
      stockInfoLocalDataSource: stockInfoLocalDataSource,
      stockInfoRemoteDataSource: stockInfoRemoteDataSource,
      cartRemoteDataSource: cartRemoteDataSource,
      deviceStorage: deviceStorageMock,
      materialBannerStorage: materialBannerStorageMock,
    );

    fakeCartProductsWithCombo.addAll(
      await CartLocalDataSource()
          .upsertCart(type: UpsertCartLocalType.upsertCartItemsComboOffer),
    );
    aplSimulatorOrder = await CartLocalDataSource().aplSimulateOrder();
    aplGetTotalPrice = await CartLocalDataSource().aplGetTotalPrice();

    when(
      () => stockInfoLocalDataSource.getMaterialStockInfoList(),
    ).thenAnswer(
      (invocation) async => materialStockInfo,
    );

    when(
      () => stockInfoLocalDataSource.getStockInfoList(),
    ).thenAnswer(
      (invocation) async => [
        StockInfo.empty().copyWith(
          materialNumber: MaterialNumber('1234'),
          inStock: MaterialInStock('Yes'),
        ),
      ],
    );

    when(
      () => stockInfoRemoteDataSource.getMaterialStockInfoList(
        materialNumbers: [
          fakeCartProducts.first.getMaterialNumber.getOrDefaultValue(''),
        ],
        salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
        selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        selectedShipToCode: fakeShipToInfo.shipToCustomerCode,
      ),
    ).thenAnswer(
      (invocation) async => [MaterialStockInfo.empty()],
    );

    when(
      () => stockInfoRemoteDataSource.getMaterialStockInfoList(
        materialNumbers: [
          fakeCartProducts.first.getMaterialNumber.getOrDefaultValue(''),
        ],
        salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
        selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        selectedShipToCode: fakeShipToInfo.shipToCustomerCode,
      ),
    ).thenAnswer(
      (invocation) async => [MaterialStockInfo.empty()],
    );
    when(() => mockConfig.maximumCartQuantity).thenReturn(99999);
    when(() => deviceStorageMock.currentMarket()).thenReturn(mockMarket);
  });

  test('Test Clear Cart - Success', () async {
    final result = await cartRepository.clearCart();
    expect(result.isRight(), true);
  });

  test('Test Clear Cart remote - success', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    when(
      () => cartRemoteDataSource.deleteCart(),
    ).thenAnswer((invocation) async => unit);
    when(
      () => materialBannerStorageMock.clear(),
    ).thenAnswer((invocation) => Future.value());

    final result = await cartRepository.clearCart();
    expect(result.isRight(), true);
  });

  test('Test Clear Cart remote - failure', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    when(
      () => cartRemoteDataSource.deleteCart(),
    ).thenThrow(
      fakeException,
    );

    final result = await cartRepository.clearCart();
    expect(result, Left(FailureHandler.handleFailure(fakeException)));
  });

  // test('Test Update Discount Qty Material - Success', () async {
  //   final result = cartRepository.updateDiscountQty(
  //     items: [fakeCartItem],
  //   );
  //   expect(result, [fakeCartItem]);
  // });

  // test('Test Update Discount Qty Material - zmgDiscount - true - Success',
  //     () async {
  //   final result = cartRepository.updateDiscountQty(
  //     items: [
  //       fakeCartItem.copyWith(
  //         materials: [
  //           fakeCartItem.materials.first.copyWith(
  //             price: Price.empty().copyWith(
  //               zmgDiscount: true,
  //             ),
  //           ),
  //         ],
  //       )
  //     ],
  //   );
  //   expect(result, [
  //     fakeCartItem.copyWith(
  //       materials: [
  //         fakeCartItem.materials.first.copyWith(
  //           discountedMaterialCount: 1,
  //           price: Price.empty().copyWith(
  //             zmgDiscount: true,
  //           ),
  //         ),
  //       ],
  //     ),
  //   ]);
  // });

  // test(
  //     'Test Update Discount Qty Material - isTireDiscountEligible - true - Success',
  //     () async {
  //   final result = cartRepository.updateDiscountQty(
  //     items: [
  //       fakeCartItem.copyWith(
  //         materials: [
  //           fakeCartItem.materials.first.copyWith(
  //             price: Price.empty().copyWith(
  //               tiers: [
  //                 PriceTier.empty(),
  //               ],
  //             ),
  //           ),
  //         ],
  //       )
  //     ],
  //   );
  //   expect(result, [
  //     fakeCartItem.copyWith(
  //       materials: [
  //         fakeCartItem.materials.first.copyWith(
  //           discountedMaterialCount: 1,
  //           price: Price.empty().copyWith(
  //             tiers: [
  //               PriceTier.empty(),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   ]);
  // });

  // test('Test Update Discount Qty Bundle - Success', () async {
  //   final result = cartRepository.updateDiscountQty(
  //     items: [
  //       fakeCartItem.copyWith(
  //         itemType: CartItemType.bundle,
  //         materials: [
  //           fakeCartItem.materials.first.copyWith(
  //             bundle: Bundle.empty().copyWith(bundleCode: '1'),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  //   expect(result, [
  //     fakeCartItem.copyWith(
  //       itemType: CartItemType.bundle,
  //       materials: [
  //         fakeCartItem.materials.first.copyWith(
  //           bundle: Bundle.empty().copyWith(bundleCode: '1'),
  //         ),
  //       ],
  //     ),
  //   ]);
  // });

  // test('Test Update Discount Qty ComboDeal - Success', () async {
  //   final result = cartRepository.updateDiscountQty(
  //     items: [
  //       fakeCartItem.copyWith(
  //         itemType: CartItemType.comboDeal,
  //         materials: [
  //           fakeCartItem.materials.first.copyWith(
  //             bundle: Bundle.empty().copyWith(bundleCode: '1'),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  //   expect(result, [
  //     fakeCartItem.copyWith(
  //       itemType: CartItemType.comboDeal,
  //       materials: [
  //         fakeCartItem.materials.first.copyWith(
  //           bundle: Bundle.empty().copyWith(bundleCode: '1'),
  //         ),
  //       ],
  //     ),
  //   ]);
  // });

  group('addHistoryItemsToCart test', () {
    test('addHistoryItemsToCart test - Remote Success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      final productList = <MaterialInfo>[
        MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-material-number'),
          quantity: MaterialQty(1),
          type: MaterialInfoType('material'),
          parentID: 'fake-parent-Id',
        ),
      ];

      final materialTenderMap = {
        MaterialNumber('fake-material-number'): TenderContract.empty().copyWith(
          contractNumber: TenderContractNumber('fake-contract-number'),
        ),
      };
      when(
        () => cartRemoteDataSource.upsertCartItems(
          market: mockMarket,
          requestParams: productList.map((materialInfo) {
            final upsertCartRequest = CartProductRequest.toMaterialRequest(
              salesOrg: fakeSalesOrganisation.salesOrg,
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
              language: Language.english().languageCode,
              materialInfo: materialInfo,
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              itemId: 'fake-item-Id',
              quantity: materialInfo.quantity.intValue,
              tenderContractNumber: 'fake-contract-number',
            );

            return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
          }).toList(),
        ),
      ).thenAnswer(
        (invocation) async => <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            materialInfo: productList.first,
          ),
        ],
      );

      final result = await cartRepository.addHistoryItemsToCart(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        itemId: 'fake-item-Id',
        counterOfferDetails: RequestCounterOfferDetails.empty(),
        language: Language.english(),
        materialInfo: productList,
        salesOrganisationConfig: fakeMYSalesOrgConfigs,
        tenderContractDetails: materialTenderMap,
      );
      expect(result.isRight(), true);
    });

    test('addHistoryItemsToCart test - Remote Failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      final productList = <MaterialInfo>[
        MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-material-number'),
          quantity: MaterialQty(1),
          type: MaterialInfoType('material'),
          parentID: 'fake-parent-Id',
        ),
      ];
      when(
        () => cartRemoteDataSource.upsertCartItems(
          market: mockMarket,
          requestParams: productList.map((materialInfo) {
            final upsertCartRequest = CartProductRequest.toMaterialRequest(
              salesOrg: fakeSalesOrganisation.salesOrg,
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
              language: Language.english().languageCode,
              materialInfo: materialInfo,
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              itemId: 'fake-item-Id',
              quantity: materialInfo.quantity.intValue,
              tenderContractNumber: '',
            );

            return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
          }).toList(),
        ),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await cartRepository.addHistoryItemsToCart(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        itemId: 'fake-item-Id',
        counterOfferDetails: RequestCounterOfferDetails.empty(),
        language: Language.english(),
        materialInfo: productList,
        salesOrganisationConfig: fakeMYSalesOrgConfigs,
        tenderContractDetails: {},
      );
      expect(result.isLeft(), true);
    });

    test('addHistoryItemsToCart test - Local success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.upsertCart(
          type: UpsertCartLocalType.upsertCartItemsReorder,
        ),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );

      final result = await cartRepository.addHistoryItemsToCart(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        itemId: 'fake-item-Id',
        counterOfferDetails:
            fakeCartProducts.first.materialInfo.counterOfferDetails,
        language: fakeClientUser.settings.languagePreference,
        materialInfo: fakeCartProducts.materialInfos,
        salesOrganisationConfig: fakeMYSalesOrgConfigs,
        tenderContractDetails: {},
      );
      expect(result, Right(fakeCartProducts));
    });

    test('addHistoryItemsToCart test - Local Failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.upsertCart(
          type: UpsertCartLocalType.upsertCartItemsReorder,
        ),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.addHistoryItemsToCart(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        itemId: 'fake-item-Id',
        counterOfferDetails:
            fakeCartProducts.first.materialInfo.counterOfferDetails,
        language: fakeClientUser.settings.languagePreference,
        materialInfo: fakeCartProducts.materialInfos,
        salesOrganisationConfig: fakeMYSalesOrgConfigs,
        tenderContractDetails: {},
      );

      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('upsertCartItemsWithComboOffers test local success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.upsertCart(
          type: UpsertCartLocalType.upsertCartItemsComboOffer,
        ),
      ).thenAnswer(
        (invocation) async => fakeCartProductsWithCombo,
      );

      final result = await cartRepository.upsertCartItemsWithComboOffers(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        products: fakeCartProductsWithCombo,
      );
      expect(result.isRight(), true);
    });

    test('upsertCartItemsWithComboOffers test local failure', () async {
      when(
        () => cartLocalDataSourceMock.upsertCart(
          type: UpsertCartLocalType.upsertCartItemsComboOffer,
        ),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await cartRepository.upsertCartItemsWithComboOffers(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        products: [],
      );
      expect(result.isLeft(), true);
    });

    test('upsertCartItemsWithComboOffers test remote success', () async {
      final requestParams = fakeCartProductsWithCombo.comboMaterialItemList
          .map(
            (productUpsertRequest) => ComboProductRequestDto.fromDomain(
              comboProductRequest: productUpsertRequest,
              salesOrg: fakeSGSalesOrganisation.salesOrg.getOrDefaultValue(''),
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              shipToId: fakeShipToInfo.shipToCustomerCode,
            ).toMap(),
          )
          .toList();
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.upsertCartItems(
          market: mockMarket,
          requestParams: requestParams,
        ),
      ).thenAnswer(
        (invocation) async => fakeCartProductsWithCombo,
      );

      final result = await cartRepository.upsertCartItemsWithComboOffers(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSGSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        products: fakeCartProductsWithCombo,
      );
      expect(result.isRight(), true);
    });

    test('upsertCartItemsWithComboOffers remote test left', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.upsertCartItems(
          market: mockMarket,
          requestParams: [],
        ),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await cartRepository.upsertCartItemsWithComboOffers(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        products: [],
      );
      expect(result.isLeft(), true);
    });

    /////////////////////////////////-aplSimulatorOrder-////////////////////////
    test('aplSimulatorOrder test local success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.aplSimulateOrder(),
      ).thenAnswer(
        (invocation) async => aplSimulatorOrder,
      );

      final result = await cartRepository.aplSimulateOrder(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        product: fakeCartProducts.materialInfos,
      );
      expect(result, Right(aplSimulatorOrder));
    });

    test('aplSimulatorOrder test local failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.aplSimulateOrder(),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.aplSimulateOrder(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        product: fakeCartProducts.materialInfos,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('aplSimulatorOrder test remote success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.aplSimulateOrder(
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          materialQuantityPairList: [
            {
              'material': fakeCartProducts.materialInfos.first.materialNumber
                  .getOrCrash(),
              'quantity': fakeCartProducts.materialInfos.first.quantity.intValue
                  .toString(),
            },
          ],
          salesOrgCode: fakeSalesOrganisation.salesOrg.getOrCrash(),
        ),
      ).thenAnswer(
        (invocation) async => aplSimulatorOrder,
      );

      final result = await cartRepository.aplSimulateOrder(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        product: fakeCartProducts.materialInfos,
      );
      expect(result, Right(aplSimulatorOrder));
    });

    test('aplSimulatorOrder test remote failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.aplSimulateOrder(
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          materialQuantityPairList: [
            {
              'material': fakeCartProducts.materialInfos.first.materialNumber
                  .getOrCrash(),
              'quantity': fakeCartProducts.materialInfos.first.quantity.intValue
                  .toString(),
            },
          ],
          salesOrgCode: fakeSalesOrganisation.salesOrg.getOrCrash(),
        ),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.aplSimulateOrder(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        product: fakeCartProducts.materialInfos,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });
    /////////////////////////////////-aplSimulatorOrder-////////////////////////

    ////////////////////////////-fetchGrandTotalPriceForIdMarket-////////////////////////
    test('fetchGrandTotalPriceForIdMarket test local success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.aplGetTotalPrice(),
      ).thenAnswer(
        (invocation) async => aplGetTotalPrice,
      );

      final result = await cartRepository.fetchGrandTotalPriceForIdMarket(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        materialNumbers: fakeCartProducts.materialNumbers,
        totalPrice: 1000,
      );

      expect(result, Right(aplGetTotalPrice));
    });

    test('fetchGrandTotalPriceForIdMarket test local failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.aplGetTotalPrice(),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.fetchGrandTotalPriceForIdMarket(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        materialNumbers: fakeCartProducts.materialNumbers,
        totalPrice: 1000,
      );

      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('fetchGrandTotalPriceForIdMarket test remote success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.aplGetTotalPrice(
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          salesOrgCode: fakeSalesOrganisation.salesOrg.getOrCrash(),
          materialNumbers: fakeCartProducts.materialNumbers
              .map((item) => item.getOrCrash())
              .toList(),
          totalPrice: 1000,
        ),
      ).thenAnswer(
        (invocation) async => aplGetTotalPrice,
      );

      final result = await cartRepository.fetchGrandTotalPriceForIdMarket(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        materialNumbers: fakeCartProducts.materialNumbers,
        totalPrice: 1000,
      );

      expect(result, Right(aplGetTotalPrice));
    });

    test('fetchGrandTotalPriceForIdMarket test remote failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.aplGetTotalPrice(
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          salesOrgCode: fakeSalesOrganisation.salesOrg.getOrCrash(),
          materialNumbers: fakeCartProducts.materialNumbers
              .map((item) => item.getOrCrash())
              .toList(),
          totalPrice: 1000,
        ),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.fetchGrandTotalPriceForIdMarket(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        materialNumbers: fakeCartProducts.materialNumbers,
        totalPrice: 1000,
      );

      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });
    ////////////////////////////-fetchGrandTotalPriceForIdMarket-////////////////////////

    /////////////////////////////////-updateCartWithProductDetermination-////////////////////////
    test('updateCartWithProductDetermination test local success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.upsertCart(
          type: UpsertCartLocalType.upsertCartItemsReorder,
        ),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );

      final result = await cartRepository.updateCartWithProductDetermination(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        productDeterminationList: fakeCartProducts.materialInfos,
        salesOrganisationConfig: fakeMYSalesOrgConfigs,
        shipToInfo: fakeShipToInfo,
        updatedCartItems: fakeCartProducts,
        language: fakeClientUser.settings.languagePreference,
      );
      expect(result, Right(fakeCartProducts));
    });

    test('updateCartWithProductDetermination test local failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.upsertCart(
          type: UpsertCartLocalType.upsertCartItemsReorder,
        ),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.updateCartWithProductDetermination(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        productDeterminationList: fakeCartProducts.materialInfos,
        salesOrganisationConfig: fakeMYSalesOrgConfigs,
        shipToInfo: fakeShipToInfo,
        updatedCartItems: fakeCartProducts,
        language: fakeClientUser.settings.languagePreference,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    // test('updateCartWithProductDetermination test remote success', () async {
    //   when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    //       when(
    //     () => cartRemoteDataSource.deleteCart(),
    //   ).thenAnswer((invocation) async => unit);

    //   when(
    //     () => cartRemoteDataSource.upsertCartItems(
    //       requestParams: fakeCartProducts.materialInfos.map((materialInfo) {
    //         final upsertCartRequest = CartProductRequest.toMaterialRequest(
    //           salesOrg: fakeSGSalesOrganisation.salesOrg,
    //           customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
    //           shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
    //           language: fakeClientUser.settings.languagePreference.languageCode,
    //           materialInfo: materialInfo,
    //           itemId: materialInfo.sampleBonusItemId,
    //           quantity: materialInfo.quantity.intValue,
    //           counterOfferDetails: materialInfo.counterOfferDetails,
    //         );

    //         return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
    //       }).toList(),

    //     ),
    //   ).thenAnswer(
    //     (invocation) async => fakeCartProducts,
    //   );

    //   final result = await cartRepository.updateCartWithProductDetermination(
    //     customerCodeInfo: fakeCustomerCodeInfo,
    //     salesOrganisation: fakeSalesOrganisation,
    //     productDeterminationList: fakeCartProducts.materialInfos,
    //     salesOrganisationConfig: fakeMYSalesOrgConfigs,
    //     shipToInfo: fakeShipToInfo,
    //     updatedCartItems: fakeCartProducts,
    //     language: fakeClientUser.settings.languagePreference,
    //   );

    //   expect(result, Right(fakeCartProducts));
    // });

    test('updateCartWithProductDetermination test local failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.upsertCart(
          type: UpsertCartLocalType.upsertCartItemsReorder,
        ),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.updateCartWithProductDetermination(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        productDeterminationList: fakeCartProducts.materialInfos,
        salesOrganisationConfig: fakeMYSalesOrgConfigs,
        shipToInfo: fakeShipToInfo,
        updatedCartItems: fakeCartProducts,
        language: fakeClientUser.settings.languagePreference,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('updateCartWithProductDetermination test remote success', () async {
      final materialInfo = [
        ...fakeCartProducts.materialInfos,
        ...fakeCartProducts
            .map(
              (e) => [
                e.materialInfo.copyWith(quantity: MaterialQty(e.quantity)),
                ...e.existingProductDealBonus,
              ],
            )
            .flattened,
      ];

      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.deleteCart(),
      ).thenAnswer((invocation) async => unit);
      when(
        () => cartRemoteDataSource.upsertCartItems(
          market: mockMarket,
          requestParams: materialInfo.map((materialInfo) {
            final upsertCartRequest = CartProductRequest.toMaterialRequest(
              salesOrg: fakeSalesOrganisation.salesOrg,
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
              language: Language.english().languageCode,
              materialInfo: materialInfo,
              itemId: materialInfo.sampleBonusItemId,
              quantity: materialInfo.quantity.intValue,
              counterOfferDetails: materialInfo.counterOfferDetails,
              tenderContractNumber: '',
            );

            return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
          }).toList(),
        ),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );
      final result = await cartRepository.updateCartWithProductDetermination(
        language: Language.english(),
        shipToInfo: fakeShipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisationConfig: fakeMYSalesOrgConfigs,
        salesOrganisation: fakeSalesOrganisation,
        productDeterminationList: fakeCartProducts.materialInfos,
        updatedCartItems: fakeCartProducts,
      );
      expect(result.getOrElse(() => []), fakeCartProducts);
    });

    test('updateCartWithProductDetermination test remote failure', () async {
      final materialInfo = [
        ...fakeCartProducts.materialInfos,
        ...fakeCartProducts
            .map(
              (e) => [
                e.materialInfo.copyWith(quantity: MaterialQty(e.quantity)),
                ...e.existingProductDealBonus,
              ],
            )
            .flattened,
      ];

      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.deleteCart(),
      ).thenAnswer((invocation) async => unit);
      when(
        () => cartRemoteDataSource.upsertCartItems(
          market: mockMarket,
          requestParams: materialInfo.map((materialInfo) {
            final upsertCartRequest = CartProductRequest.toMaterialRequest(
              salesOrg: fakeSalesOrganisation.salesOrg,
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
              language: 'EN',
              materialInfo: materialInfo,
              itemId: materialInfo.sampleBonusItemId,
              quantity: materialInfo.quantity.intValue,
              counterOfferDetails: materialInfo.counterOfferDetails,
              tenderContractNumber: '',
            );

            return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
          }).toList(),
        ),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.updateCartWithProductDetermination(
        language: Language.english(),
        shipToInfo: fakeShipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisationConfig: fakeMYSalesOrgConfigs,
        salesOrganisation: fakeSalesOrganisation,
        productDeterminationList: fakeCartProducts.materialInfos,
        updatedCartItems: fakeCartProducts,
      );

      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('removeSelectedProducts local test success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.upsertCart(),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );

      final result = await cartRepository.removeSelectedProducts(
        salesOrganisationConfig: fakeSGSalesOrgConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        language: Language.english(),
        products: [
          MaterialInfo.empty()
              .copyWith(materialNumber: MaterialNumber('12345')),
        ],
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(result.isRight(), true);
    });

    test('removeSelectedProducts remote test success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      final upsertCartRequest = CartProductRequest.toMaterialRequest(
        salesOrg: fakeSalesOrganisation.salesOrg,
        customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
        language: Language.english().languageCode,
        materialInfo: fakeCartProducts.first.materialInfo,
        itemId: fakeCartProducts.first.materialInfo.parentID,
        quantity: fakeCartProducts.first.materialInfo.quantity.intValue,
        counterOfferDetails:
            fakeCartProducts.first.materialInfo.counterOfferDetails,
        tenderContractNumber: '',
      );

      when(
        () => cartRemoteDataSource.upsertCartItems(
          requestParams: [
            CartProductRequestDto.fromDomain(upsertCartRequest).toMap(),
          ],
          market: mockMarket,
        ),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );

      final result = await cartRepository.removeSelectedProducts(
        salesOrganisationConfig: fakeSGSalesOrgConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        language: Language.english(),
        products: fakeCartProducts.materialInfos,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(result, Right(fakeCartProducts));
    });

    test(
      'removeSelectedProducts remote test success - if upsert cart fails',
      () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        final upsertCartRequest = CartProductRequest.toMaterialRequest(
          salesOrg: fakeSalesOrganisation.salesOrg,
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
          language: 'EN',
          materialInfo: fakeCartProducts.first.materialInfo,
          itemId: fakeCartProducts.first.materialInfo.parentID,
          quantity: fakeCartProducts.first.materialInfo.quantity.intValue,
          counterOfferDetails:
              fakeCartProducts.first.materialInfo.counterOfferDetails,
          tenderContractNumber: '',
        );
        when(
          () => cartRemoteDataSource.upsertCartItems(
            requestParams: [
              CartProductRequestDto.fromDomain(upsertCartRequest).toMap(),
            ],
            market: mockMarket,
          ),
        ).thenThrow(fakeException);

        final result = await cartRepository.removeSelectedProducts(
          salesOrganisationConfig: fakeSGSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          language: Language.english(),
          products: fakeCartProducts.materialInfos,
          salesOrganisation: fakeSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        );

        expect(result, Left(FailureHandler.handleFailure(fakeException)));
      },
    );

    test('upsertCartItems local test failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.upsertCart(
          type: UpsertCartLocalType.upsertCartItems,
        ),
      ).thenThrow(fakeException);

      final result = await cartRepository.upsertCartItems(
        customerCodeInfo: fakeCustomerCodeInfo,
        language: Language.english(),
        product: fakeCartProducts.first,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('upsertCartItems local test success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.upsertCart(
          type: UpsertCartLocalType.upsertCartItems,
        ),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );

      final result = await cartRepository.upsertCartItems(
        customerCodeInfo: fakeCustomerCodeInfo,
        language: Language.english(),
        product: fakeCartProducts.first,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(result.isRight(), true);
    });

    test('upsertCartItems remote test success', () async {
      const bundleCode = 'fake-bundle-code';
      final banner = EZReachBanner.empty();
      final product = fakeCartProducts.first.copyWith(
        materialInfo:
            MaterialInfo.empty().copyWith(type: MaterialInfoType('bundle')),
        bundle: Bundle.empty().copyWith(
          bundleCode: bundleCode,
          materials: [
            MaterialInfo.empty().copyWith(
              quantity: MaterialQty(0),
              materialNumber: MaterialNumber('fake-material-number'),
            ),
          ],
        ),
      );
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => cartRemoteDataSource.upsertCartItems(
          market: mockMarket,
          requestParams: product.bundle.materials.map((materialInfo) {
            final upsertCartRequest = CartProductRequest.toBundlesRequest(
              salesOrg: fakeSalesOrganisation.salesOrg,
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
              language: Language.english(),
              materialInfo: materialInfo,
              bundleCode: bundleCode,
            );

            return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
          }).toList(),
        ),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );

      when(
        () => materialBannerStorageMock.delete(
          materialNumbers: ['${bundleCode}_fake-material-number'],
        ),
      ).thenAnswer(
        (invocation) => Future.value(),
      );

      when(
        () => materialBannerStorageMock.set(
          materialNumbers: ['${bundleCode}_fake-material-number'],
          banner: banner,
        ),
      ).thenAnswer(
        (invocation) => Future.value(),
      );

      final result = await cartRepository.upsertCartItems(
        customerCodeInfo: fakeCustomerCodeInfo,
        language: Language.english(),
        product: product,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        banner: banner,
      );
      expect(result, Right(fakeCartProducts));
    });

    test('upsertCartItems remote test failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => cartRemoteDataSource.upsertCartItems(
          market: mockMarket,
          requestParams:
              fakeCartProducts.first.bundle.materials.map((materialInfo) {
            final upsertCartRequest = CartProductRequest.toBundlesRequest(
              salesOrg: fakeSalesOrganisation.salesOrg,
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
              language: Language.english(),
              materialInfo: materialInfo,
              bundleCode: fakeCartProducts.first.bundle.bundleCode,
            );

            return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
          }).toList(),
        ),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await cartRepository.upsertCartItems(
        customerCodeInfo: fakeCustomerCodeInfo,
        language: Language.english(),
        product: fakeCartProducts.first,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(result.isLeft(), true);
    });

    // test('saveToCartWithUpdatedStockInfo remote test success', () async {
    //   when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    //   when(
    //     () => stockInfoRemoteDataSource.getStockInfo(
    //       materialNumber:
    //           fakeCartProducts.materialNumbers.first.getOrCrash(),
    //       salesOrg: mockSalesOrganisation.salesOrg.getOrCrash(),
    //       selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
    //     ),
    //   ).thenAnswer(
    //     (invocation) async => StockInfo.empty(),
    //   );

    //   final result = await cartRepository.saveToCartWithUpdatedStockInfo(
    //     customerCodeInfo: fakeCustomerCodeInfo,
    //     salesOrganisation: mockSalesOrganisation,
    //     shipToInfo: fakeShipToInfo,
    //     cartItem: [fakeCartItem],
    //     salesOrganisationConfigs: fakeEmptySalesConfigs,
    //   );
    //   expect(result.isRight(), true);
    // });

    // test('getMaterialPriceWithZdp5Discount remote test success', () async {
    //   when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    //   when(
    //     () => discountOverrideRemoteDataSourceMock.getMaterialOverridePriceList(
    //       salesOrgCode: mockSalesOrganisation.salesOrg.getOrCrash(),
    //       customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
    //       shipToCode: fakeShipToInfo.shipToCustomerCode,
    //       materialQuery: PriceDto.fromDomain(
    //         fakeCartItem.materials.first.price,
    //       ).materialQueryWithExceedQty(
    //         fakeCartItem.materials.first.hasZdp5Validation,
    //       ),
    //     ),
    //   ).thenAnswer(
    //     (invocation) async => [fakeCartItem.materials.first.price],
    //   );

    //   final result = await cartRepository.getMaterialPriceWithZdp5Discount(
    //     customerCodeInfo: fakeCustomerCodeInfo,
    //     salesOrganisation: mockSalesOrganisation,
    //     shipToInfo: fakeShipToInfo,
    //     item: fakeCartItem,
    //   );
    //   expect(result.isRight(), true);
    // });

    // test('getMaterialPriceWithZdp5Discount remote test failure', () async {
    //   when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    //   when(
    //     () => discountOverrideRemoteDataSourceMock.getMaterialOverridePriceList(
    //       salesOrgCode: mockSalesOrganisation.salesOrg.getOrCrash(),
    //       customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
    //       shipToCode: fakeShipToInfo.shipToCustomerCode,
    //       materialQuery: PriceDto.fromDomain(
    //         fakeCartItem.materials.first.price,
    //       ).materialQueryWithExceedQty(
    //         fakeCartItem.materials.first.hasZdp5Validation,
    //       ),
    //     ),
    //   ).thenThrow(
    //     (invocation) async => MockException(),
    //   );

    //   final result = await cartRepository.getMaterialPriceWithZdp5Discount(
    //     customerCodeInfo: fakeCustomerCodeInfo,
    //     salesOrganisation: mockSalesOrganisation,
    //     shipToInfo: fakeShipToInfo,
    //     item: fakeCartItem,
    //   );
    //   expect(result.isLeft(), true);
    // });

    test('getAddedToCartProductList remote test success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.getAddedToCartProductList(
          market: mockMarket,
          language: Language.english().languageCode,
        ),
      ).thenAnswer(
        (invocation) async => Cart.empty().copyWith(
          cartProducts: fakeCartProducts,
        ),
      );

      final result = await cartRepository.getAddedToCartProductList(
        language: Language.english(),
      );
      expect(result.isRight(), true);
    });

    test('getAddedToCartProductList remote test failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.getAddedToCartProductList(
          market: mockMarket,
          language: Language.english().languageCode,
        ),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await cartRepository.getAddedToCartProductList(
        language: Language.english(),
      );
      expect(result.isLeft(), true);
    });

    test('getAddedToCartProductList local test success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.getAddedToCartProductList(),
      ).thenAnswer(
        (invocation) async => Cart.empty().copyWith(
          cartProducts: fakeCartProducts,
        ),
      );

      final result = await cartRepository.getAddedToCartProductList(
        language: Language.english(),
      );
      expect(result.isRight(), true);
    });

    test('getAddedToCartProductList local test failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.getAddedToCartProductList(),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await cartRepository.getAddedToCartProductList(
        language: Language.english(),
      );
      expect(result.isLeft(), true);
    });

    group('upsertCart test - ', () {
      final upsertCartRequest = CartProductRequest.toMaterialRequest(
        salesOrg: fakeMYSalesOrganisation.salesOrg,
        customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
        language: Language('EN').languageCode,
        materialInfo: MaterialInfo.empty(),
        itemId: 'fake-id',
        quantity: 10,
        counterOfferDetails: RequestCounterOfferDetails.empty(),
        tenderContractNumber: 'fake-contract-number',
      );
      test('upsertCart Access maximum cart quantity', () async {
        when(() => mockConfig.maximumCartQuantity).thenReturn(10);
        final result = await cartRepository.upsertCart(
          materialInfo: MaterialInfo.empty(),
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrganisationConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          language: Language('en'),
          itemId: 'fake-id',
          quantity: 11,
          counterOfferDetails: RequestCounterOfferDetails.empty(),
          tenderContractNumber: 'fake-contract-number',
        );
        expect(result, const Left(ApiFailure.maximumCartQuantityExceed('10')));
      });

      test('upsertCart Local success', () async {
        when(() => mockConfig.maximumCartQuantity).thenReturn(100);
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(() => cartLocalDataSourceMock.upsertCart())
            .thenAnswer((_) => Future.value(fakeCartProducts));

        final result = await cartRepository.upsertCart(
          materialInfo: MaterialInfo.empty(),
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrganisationConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          language: Language('en'),
          itemId: 'fake-id',
          quantity: 10,
          counterOfferDetails: RequestCounterOfferDetails.empty(),
          tenderContractNumber: 'fake-contract-number',
        );
        expect(result, Right(fakeCartProducts));
      });

      test('upsertCart Local failure', () async {
        when(() => mockConfig.maximumCartQuantity).thenReturn(100);
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(() => cartLocalDataSourceMock.upsertCart())
            .thenThrow(fakeException);

        final result = await cartRepository.upsertCart(
          materialInfo: MaterialInfo.empty(),
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrganisationConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          language: Language('en'),
          itemId: 'fake-id',
          quantity: 10,
          counterOfferDetails: RequestCounterOfferDetails.empty(),
          tenderContractNumber: 'fake-contract-number',
        );
        expect(result, Left(FailureHandler.handleFailure(fakeException)));
      });

      test('upsertCart Remote success', () async {
        when(() => mockConfig.maximumCartQuantity).thenReturn(100);
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(() => deviceStorageMock.currentMarket()).thenReturn('MY');

        when(
          () => cartRemoteDataSource.upsertCart(
            requestParams:
                CartProductRequestDto.fromDomain(upsertCartRequest).toMap(),
            market: 'MY',
          ),
        ).thenAnswer((_) => Future.value(fakeCartProducts));

        final result = await cartRepository.upsertCart(
          materialInfo: MaterialInfo.empty(),
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrganisationConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          language: Language('EN'),
          itemId: 'fake-id',
          quantity: 10,
          counterOfferDetails: RequestCounterOfferDetails.empty(),
          tenderContractNumber: 'fake-contract-number',
        );
        expect(result, Right(fakeCartProducts));
      });

      test('upsertCart Remote failure', () async {
        when(() => mockConfig.maximumCartQuantity).thenReturn(100);
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(() => deviceStorageMock.currentMarket()).thenReturn('MY');

        when(
          () => cartRemoteDataSource.upsertCart(
            requestParams:
                CartProductRequestDto.fromDomain(upsertCartRequest).toMap(),
            market: 'MY',
          ),
        ).thenThrow(fakeException);

        final result = await cartRepository.upsertCart(
          materialInfo: MaterialInfo.empty(),
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrganisationConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          language: Language('EN'),
          itemId: 'fake-id',
          quantity: 10,
          counterOfferDetails: RequestCounterOfferDetails.empty(),
          tenderContractNumber: 'fake-contract-number',
        );
        expect(result, Left(FailureHandler.handleFailure(fakeException)));
      });
    });

    group('upsertCartWithBonus Test - ', () {
      test('upsertCartWithBonus failure', () async {
        final product = PriceAggregate.empty().copyWith(
          materialInfo: MaterialInfo.empty().copyWith(
            sampleBonusItemId: 'fake-id',
            counterOfferDetails: RequestCounterOfferDetails.empty(),
          ),
          quantity: 0,
          tenderContract: TenderContract.empty().copyWith(
            contractNumber: TenderContractNumber('fake-contract-number'),
          ),
        );

        final upsertCartRequest = CartProductRequest.toMaterialRequest(
          salesOrg: fakeMYSalesOrganisation.salesOrg,
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
          language: Language('EN').languageCode,
          materialInfo: product.materialInfo,
          itemId: 'fake-id',
          quantity: 0,
          counterOfferDetails: RequestCounterOfferDetails.empty(),
          tenderContractNumber: 'fake-contract-number',
        );

        when(() => mockConfig.maximumCartQuantity).thenReturn(100);
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(() => deviceStorageMock.currentMarket()).thenReturn('MY');

        when(
          () => cartRemoteDataSource.upsertCart(
            requestParams:
                CartProductRequestDto.fromDomain(upsertCartRequest).toMap(),
            market: 'MY',
          ),
        ).thenThrow(fakeException);

        final result = await cartRepository.upsertCartWithBonus(
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrganisationConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          language: Language('EN'),
          product: product,
          counterOfferDetails: RequestCounterOfferDetails.empty(),
        );
        expect(result, Left(FailureHandler.handleFailure(fakeException)));
      });

      test('upsertCartWithBonus success delete material', () async {
        final product = PriceAggregate.empty().copyWith(
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-material-number'),
            sampleBonusItemId: 'fake-id',
            counterOfferDetails: RequestCounterOfferDetails.empty(),
          ),
          quantity: 0,
          tenderContract: TenderContract.empty().copyWith(
            contractNumber: TenderContractNumber('fake-contract-number'),
          ),
        );

        final upsertCartRequest = CartProductRequest.toMaterialRequest(
          salesOrg: fakeMYSalesOrganisation.salesOrg,
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
          language: Language('EN').languageCode,
          materialInfo: product.materialInfo,
          itemId: 'fake-id',
          quantity: 0,
          counterOfferDetails: RequestCounterOfferDetails.empty(),
          tenderContractNumber: 'fake-contract-number',
        );

        when(() => mockConfig.maximumCartQuantity).thenReturn(100);
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(() => deviceStorageMock.currentMarket()).thenReturn('MY');

        when(
          () => cartRemoteDataSource.upsertCart(
            requestParams:
                CartProductRequestDto.fromDomain(upsertCartRequest).toMap(),
            market: 'MY',
          ),
        ).thenAnswer((_) => Future.value(fakeCartProducts));

        when(
          () => materialBannerStorageMock
              .delete(materialNumbers: ['fake-material-number']),
        ).thenAnswer((_) => Future.value());

        final result = await cartRepository.upsertCartWithBonus(
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrganisationConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          language: Language('EN'),
          product: product,
          counterOfferDetails: RequestCounterOfferDetails.empty(),
        );
        expect(result, Right(fakeCartProducts));
      });

      test('upsertCartWithBonus success delete bundle material', () async {
        const bundleCode = 'fake-bundle-code';
        final product = PriceAggregate.empty().copyWith(
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-material-number'),
            type: MaterialInfoType.bundle(),
            sampleBonusItemId: 'fake-id',
            counterOfferDetails: RequestCounterOfferDetails.empty(),
          ),
          bundle: Bundle.empty().copyWith(
            bundleCode: bundleCode,
            materials: [
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-number'),
                type: MaterialInfoType.bundle(),
                sampleBonusItemId: 'fake-id',
                counterOfferDetails: RequestCounterOfferDetails.empty(),
              ),
            ],
          ),
          quantity: 0,
          tenderContract: TenderContract.empty().copyWith(
            contractNumber: TenderContractNumber('fake-contract-number'),
          ),
        );

        final upsertCartRequest = CartProductRequest.toMaterialRequest(
          salesOrg: fakeMYSalesOrganisation.salesOrg,
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
          language: Language('EN').languageCode,
          materialInfo: product.materialInfo,
          itemId: 'fake-id',
          quantity: 0,
          counterOfferDetails: RequestCounterOfferDetails.empty(),
          tenderContractNumber: 'fake-contract-number',
        );

        when(() => mockConfig.maximumCartQuantity).thenReturn(100);
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(() => deviceStorageMock.currentMarket()).thenReturn('MY');

        when(
          () => cartRemoteDataSource.upsertCart(
            requestParams:
                CartProductRequestDto.fromDomain(upsertCartRequest).toMap(),
            market: 'MY',
          ),
        ).thenAnswer((_) => Future.value(fakeCartProducts));

        when(
          () => materialBannerStorageMock
              .delete(materialNumbers: ['${bundleCode}_fake-material-number']),
        ).thenAnswer((_) => Future.value());

        final result = await cartRepository.upsertCartWithBonus(
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrganisationConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          language: Language('EN'),
          product: product,
          counterOfferDetails: RequestCounterOfferDetails.empty(),
        );
        expect(result, Right(fakeCartProducts));
      });

      test('upsertCartWithBonus add failure', () async {
        final product = PriceAggregate.empty().copyWith(
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-material-number'),
            sampleBonusItemId: 'fake-id',
            counterOfferDetails: RequestCounterOfferDetails.empty(),
          ),
          quantity: 10,
          tenderContract: TenderContract.empty().copyWith(
            contractNumber: TenderContractNumber('fake-contract-number'),
          ),
        );

        final upsertCartRequest = CartProductRequest.toMaterialRequest(
          salesOrg: fakeMYSalesOrganisation.salesOrg,
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
          language: Language('EN').languageCode,
          materialInfo: product.materialInfo,
          itemId: 'fake-id',
          quantity: 10,
          counterOfferDetails: RequestCounterOfferDetails.empty(),
          tenderContractNumber: 'fake-contract-number',
        );

        when(() => mockConfig.maximumCartQuantity).thenReturn(100);
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(() => deviceStorageMock.currentMarket()).thenReturn('MY');

        when(
          () => cartRemoteDataSource.upsertCart(
            requestParams:
                CartProductRequestDto.fromDomain(upsertCartRequest).toMap(),
            market: 'MY',
          ),
        ).thenAnswer((_) => Future.value(fakeCartProducts));

        when(
          () => materialBannerStorageMock.set(
            materialNumbers: ['fake-material-number'],
            banner: EZReachBanner.empty(),
          ),
        ).thenThrow(fakeException);

        final result = await cartRepository.upsertCartWithBonus(
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrganisationConfig: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          language: Language('EN'),
          product: product,
          counterOfferDetails: RequestCounterOfferDetails.empty(),
          banner: EZReachBanner.empty(),
        );
        expect(result, Left(FailureHandler.handleFailure(fakeException)));
      });
    });
  });
}
