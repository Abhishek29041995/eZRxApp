import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/stock_info_repository.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_list_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/repository/product_details_repository.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';

import '../../../common_mock_data/user_mock.dart';
import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';

class ProductDetailRepositoryMock extends Mock
    implements ProductDetailRepository {}

class ConfigMock extends Mock implements Config {}

class MaterialListRepositoryMock extends Mock
    implements MaterialListRepository {}

class StockInfoRepositoryMock extends Mock implements StockInfoRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ProductDetailRepository productDetailRepository;
  late MaterialListRepository materialListRepository;
  late Config config;
  late List<PriceAggregate> productList;
  late ComboDealMaterialDetailEvent initialEvent;
  late ComboDealMaterialDetailState initialState;
  late Map<MaterialNumber, PriceAggregate> items;
  late Map<MaterialNumber, PriceAggregate> itemsAfterGetMaterials;
  late Map<MaterialNumber, bool> selectedItems;
  late ComboDeal comboDeal;
  late Map<MaterialNumber, bool> selectionStatus;
  late List<MaterialStockInfo> materialStockInfos;
  late MaterialResponse materialResponse;
  late StockInfoRepository stockInfoRepositoryMock;
  final mockLanguage = Language.english();
  var existedItemsInCart = <MaterialNumber, int>{};
  late final Map<MaterialNumber, Price> mockPriceMap;
  final materialsPrice = <MaterialNumber, MaterialPriceDetail>{};

  setUpAll(() async {
    productDetailRepository = ProductDetailRepositoryMock();
    materialListRepository = MaterialListRepositoryMock();
    stockInfoRepositoryMock = StockInfoRepositoryMock();
    config = ConfigMock();
    productList = (await CartLocalDataSource().getAddedToCartProductList())
        .cartProducts
        .where(
          (e) =>
              e.materialInfo.type.typeMaterial && !e.materialInfo.isMarketPlace,
        )
        .toList();
    initialEvent = ComboDealMaterialDetailEvent.initialize(
      salesOrganisation: fakeKHSalesOrganisation,
      customerCodeInfo: fakeCustomerCodeInfo,
      shipToInfo: fakeShipToInfo,
      salesConfigs: fakeKHSalesOrgConfigs,
      user: fakeClientUser,
    );
    initialState = ComboDealMaterialDetailState.initial().copyWith(
      salesOrganisation: fakeKHSalesOrganisation,
      customerCodeInfo: fakeCustomerCodeInfo,
      shipToInfo: fakeShipToInfo,
    );
    comboDeal = (await ComboDealLocalDataSource().getComboDealList()).first;

    materialStockInfos =
        await StockInfoLocalDataSource().getMaterialStockInfoList();

    for (var i = 0; i <= 2; i++) {
      productList[i] = productList[i].copyWith(
        materialInfo: productList[i]
            .materialInfo
            .copyWith(materialNumber: comboDeal.allMaterialNumbers[i]),
      );
      materialStockInfos[i] = materialStockInfos[i].copyWith(
        materialNumber: productList[i].getMaterialNumber,
      );
    }
    materialResponse = await MaterialListLocalDataSource().getProductList();

    final priceData = await MaterialPriceLocalDataSource().getPriceList();
    mockPriceMap = {
      for (var i = 0; i <= 2; i++)
        comboDeal.allMaterialNumbers[i]: priceData[i].copyWith(
          zdp5MaxQuota: ZDP5Info('500'),
          zdp5RemainingQuota: ZDP5Info('50'),
        ),
    };
  });
  group('Combo deal material detail bloc test', () {
    blocTest(
      'combo deal material bloc initialState',
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(initialEvent),
      expect: () => [initialState],
    );

    blocTest(
      'combo deal material bloc setPriceInfo',
      setUp: () {
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
        };
        itemsAfterGetMaterials =
            Map<MaterialNumber, PriceAggregate>.from(items);

        for (final materialPrice in mockPriceMap.entries) {
          final materialPriceMap = {
            materialPrice.key: MaterialPriceDetail(
              price: materialPrice.value,
              info: items[materialPrice.key]?.materialInfo ??
                  MaterialInfo.empty(),
            ),
          };
          materialsPrice.addAll(materialPriceMap);
          final material = itemsAfterGetMaterials[materialPrice.key];
          if (material != null) {
            itemsAfterGetMaterials[materialPrice.key] = material.copyWith(
              price: materialPrice.value,
            );
          }
        }
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        isFetchingPrice: true,
        items: {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
        },
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.setPriceInfo(
          priceMap: materialsPrice,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: itemsAfterGetMaterials,
          isFetchingPrice: false,
        ),
      ],
    );

    blocTest(
      'combo deal material bloc updateItemQuantity',
      setUp: () {
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
        };
        items[productList.first.getMaterialNumber] =
            items[productList.first.getMaterialNumber]!.copyWith(quantity: 25);
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
        },
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.updateItemQuantity(
          item: productList.first.getMaterialNumber,
          qty: 25,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: items,
        ),
      ],
    );
    blocTest(
      'combo deal material bloc updateItemQuantity with zero qty',
      setUp: () {
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
              comboDeal: comboDeal,
              quantity: comboDeal
                  .singleDeal(materialNumber: item.getMaterialNumber)
                  .minQty,
            ),
        };
        itemsAfterGetMaterials =
            Map<MaterialNumber, PriceAggregate>.from(items);

        itemsAfterGetMaterials[productList.first.getMaterialNumber] =
            itemsAfterGetMaterials[productList.first.getMaterialNumber]!
                .copyWith(quantity: 30);
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: itemsAfterGetMaterials,
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.updateItemQuantity(
          item: productList.first.getMaterialNumber,
          qty: 0,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: items,
        ),
      ],
    );

    blocTest(
      'combo deal material bloc clearSearch',
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(searchKey: SearchKey.search('dummy')),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        const ComboDealMaterialDetailEvent.clearSearch(),
      ),
      expect: () => [
        initialState.copyWith(
          searchKey: SearchKey.empty(),
        ),
      ],
    );
    blocTest(
      'combo deal material bloc search',
      setUp: () {},
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState,
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.search(
          searchKey: SearchKey.search('dummy'),
        ),
      ),
      expect: () => [
        initialState.copyWith(
          searchKey: SearchKey.search('dummy'),
        ),
      ],
    );
    blocTest(
      'combo deal material bloc cartContainsCurrentCombo = true (edit cart)',
      setUp: () {},
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState,
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        const ComboDealMaterialDetailEvent.cartContainsCurrentCombo(
          contain: true,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          isUpdateCart: true,
        ),
      ],
    );

    blocTest(
      'combo deal material bloc cartContainsCurrentCombo = false (delete cart)',
      setUp: () {
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
              quantity: item.quantity + 2,
              comboDeal: comboDeal,
            ),
        };
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        const ComboDealMaterialDetailEvent.cartContainsCurrentCombo(
          contain: false,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          isUpdateCart: false,
          items: Map.fromEntries(
            items.entries.map(
              (entry) => MapEntry(
                entry.key,
                entry.value.copyWithComboDealMinQty(comboDeal),
              ),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'combo deal material bloc clear selected items',
      setUp: () {
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
              comboDeal: comboDeal,
            ),
        };
        selectionStatus = {
          for (final item in productList)
            item.getMaterialNumber: comboDeal
                .singleDeal(materialNumber: item.getMaterialNumber)
                .mandatory,
        };
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        const ComboDealMaterialDetailEvent.clearSelectedItem(),
      ),
      expect: () => [
        initialState.copyWith(
          items: {
            for (final item in productList)
              item.getMaterialNumber: item.copyWith(
                salesOrgConfig: fakeKHSalesOrgConfigs,
                comboDeal: comboDeal,
              ),
          },
          selectedItems: selectionStatus,
        ),
      ],
    );
  });

  group('Combo deal material detail combo detail test', () {
    blocTest(
      'combo deal material bloc fetchComboDealDetail from product detail success',
      setUp: () {
        when(() => config.pageSize).thenAnswer((invocation) => 1);
        items = comboDeal.allMaterialNumbers.fold(
          <MaterialNumber, PriceAggregate>{},
          (
            Map<MaterialNumber, PriceAggregate> map,
            MaterialNumber materialNumber,
          ) {
            map[materialNumber] = PriceAggregate.empty()
                .copyWith(salesOrgConfig: fakeKHSalesOrgConfigs);

            return map;
          },
        );
        when(
          () => productDetailRepository.getProductListDetail(
            salesOrganisation: fakeKHSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            materialNumber: comboDeal.allMaterialNumbers,
            types: comboDeal.allMaterialNumbers
                .map((e) => MaterialInfoType('material'))
                .toList(),
            language: mockLanguage,
          ),
        ).thenAnswer(
          (_) async => Right(
            materialResponse.products,
          ),
        );

        itemsAfterGetMaterials =
            Map<MaterialNumber, PriceAggregate>.from(items);

        selectedItems = Map<MaterialNumber, bool>.from({});

        for (final materialInfo in materialResponse.products) {
          final material = itemsAfterGetMaterials[materialInfo.materialNumber];
          if (material != null) {
            itemsAfterGetMaterials[materialInfo.materialNumber] = material
                .copyWith(
                  materialInfo: materialInfo.copyWith(
                    parentID: comboDeal.allMaterialNumbers.first
                        .getOrDefaultValue(''),
                  ),
                )
                .copyWithComboDealMinQty(comboDeal);

            selectedItems[materialInfo.materialNumber] = comboDeal
                .singleDeal(materialNumber: materialInfo.materialNumber)
                .mandatory;
          }
        }

        when(
          () => stockInfoRepositoryMock.getStockInfoList(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeKHSalesOrganisation,
            materials:
                materialResponse.products.map((e) => e.materialNumber).toList(),
            shipToInfo: fakeShipToInfo,
          ),
        ).thenAnswer(
          (_) async => Right(
            materialStockInfos,
          ),
        );
        if (materialStockInfos.isNotEmpty) {
          for (final materialStockInfo in materialStockInfos) {
            final material =
                itemsAfterGetMaterials[materialStockInfo.materialNumber];

            if (material != null && materialStockInfo.stockInfos.isNotEmpty) {
              itemsAfterGetMaterials[materialStockInfo.materialNumber] =
                  material.copyWith(
                stockInfo: materialStockInfo.stockInfos.first,
                stockInfoList: materialStockInfo.stockInfos,
              );
            }
          }
        }
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
        user: fakeClientUser,
        salesConfigs: fakeKHSalesOrgConfigs,
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.fetchComboDealDetail(
          comboDeal: comboDeal,
          parentMaterialNumber: comboDeal.allMaterialNumbers.first,
          comboMaterialsCurrentQuantity: {},
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: itemsAfterGetMaterials,
          isFetchingComboInfo: true,
          isFetchingPrice: true,
          searchKey: SearchKey.empty(),
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
        ),
        initialState.copyWith(
          items: itemsAfterGetMaterials,
          selectedItems: selectedItems,
          isFetchingComboInfo: false,
          isFetchingPrice: true,
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
        ),
      ],
    );

    blocTest(
      'combo deal material bloc fetchComboDealDetail from cart success',
      setUp: () {
        when(() => config.pageSize).thenAnswer((invocation) => 1);
        items = comboDeal.allMaterialNumbers.fold(
          <MaterialNumber, PriceAggregate>{},
          (
            Map<MaterialNumber, PriceAggregate> map,
            MaterialNumber materialNumber,
          ) {
            map[materialNumber] = PriceAggregate.empty()
                .copyWith(salesOrgConfig: fakeKHSalesOrgConfigs);

            return map;
          },
        );
        existedItemsInCart = {
          MaterialNumber('000000000023272832'): 26,
        };
        when(
          () => productDetailRepository.getProductListDetail(
            salesOrganisation: fakeKHSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            materialNumber: comboDeal.allMaterialNumbers,
            types: comboDeal.allMaterialNumbers
                .map((e) => MaterialInfoType('material'))
                .toList(),
            language: mockLanguage,
          ),
        ).thenAnswer(
          (_) async => Right(
            materialResponse.products,
          ),
        );

        itemsAfterGetMaterials =
            Map<MaterialNumber, PriceAggregate>.from(items);

        selectedItems = Map<MaterialNumber, bool>.from({});

        for (final materialInfo in materialResponse.products) {
          final material = itemsAfterGetMaterials[materialInfo.materialNumber];
          if (material != null) {
            itemsAfterGetMaterials[materialInfo.materialNumber] =
                material.copyWith(
              materialInfo: materialInfo.copyWith(
                parentID:
                    comboDeal.allMaterialNumbers.first.getOrDefaultValue(''),
              ),
            );

            selectedItems[materialInfo.materialNumber] = comboDeal
                .singleDeal(materialNumber: materialInfo.materialNumber)
                .mandatory;
          }
        }

        when(
          () => stockInfoRepositoryMock.getStockInfoList(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeKHSalesOrganisation,
            materials:
                materialResponse.products.map((e) => e.materialNumber).toList(),
            shipToInfo: fakeShipToInfo,
          ),
        ).thenAnswer(
          (_) async => Right(
            materialStockInfos,
          ),
        );
        if (materialStockInfos.isNotEmpty) {
          for (final materialStockInfo in materialStockInfos) {
            final material =
                itemsAfterGetMaterials[materialStockInfo.materialNumber];

            if (material != null && materialStockInfo.stockInfos.isNotEmpty) {
              itemsAfterGetMaterials[materialStockInfo.materialNumber] =
                  material
                      .copyWith(
                        stockInfo: materialStockInfo.stockInfos.first,
                        stockInfoList: materialStockInfo.stockInfos,
                      )
                      .copyWithComboDealMinQty(comboDeal);
            }
          }
        }

        for (final materialNumber in existedItemsInCart.keys) {
          final material = itemsAfterGetMaterials[materialNumber];
          if (material != null) {
            itemsAfterGetMaterials[materialNumber] = material.copyWith(
              quantity: existedItemsInCart[materialNumber] ?? material.quantity,
            );
          }
        }
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
        user: fakeClientUser,
        salesConfigs: fakeKHSalesOrgConfigs,
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.fetchComboDealDetail(
          comboDeal: comboDeal,
          parentMaterialNumber: comboDeal.allMaterialNumbers.first,
          comboMaterialsCurrentQuantity: existedItemsInCart,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: itemsAfterGetMaterials,
          isFetchingComboInfo: true,
          isFetchingPrice: true,
          searchKey: SearchKey.empty(),
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
        ),
        initialState.copyWith(
          items: itemsAfterGetMaterials,
          selectedItems: selectedItems,
          isFetchingComboInfo: false,
          isFetchingPrice: true,
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
        ),
      ],
    );

    blocTest(
      'combo deal material bloc fetchComboDealDetail from product detail fail with getProductListDetail',
      setUp: () {
        when(() => config.pageSize).thenAnswer((invocation) => 1);
        items = comboDeal.allMaterialNumbers.fold(
          <MaterialNumber, PriceAggregate>{},
          (
            Map<MaterialNumber, PriceAggregate> map,
            MaterialNumber materialNumber,
          ) {
            map[materialNumber] = PriceAggregate.empty()
                .copyWith(salesOrgConfig: fakeKHSalesOrgConfigs);

            return map;
          },
        );
        when(
          () => productDetailRepository.getProductListDetail(
            salesOrganisation: fakeKHSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            materialNumber: comboDeal.allMaterialNumbers,
            types: comboDeal.allMaterialNumbers
                .map((e) => MaterialInfoType('material'))
                .toList(),
            language: mockLanguage,
          ),
        ).thenAnswer(
          (_) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        itemsAfterGetMaterials =
            Map<MaterialNumber, PriceAggregate>.from(items);

        selectedItems = Map<MaterialNumber, bool>.from({});

        selectedItems.addAll(
          {
            for (final item in items.values)
              item.getMaterialNumber: comboDeal
                  .singleDeal(materialNumber: item.getMaterialNumber)
                  .mandatory,
          },
        );

        when(
          () => stockInfoRepositoryMock.getStockInfoList(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeKHSalesOrganisation,
            materials: [],
            shipToInfo: fakeShipToInfo,
          ),
        ).thenAnswer(
          (_) async => Right(
            materialStockInfos,
          ),
        );
        if (materialStockInfos.isNotEmpty) {
          for (final materialStockInfo in materialStockInfos) {
            final material =
                itemsAfterGetMaterials[materialStockInfo.materialNumber];

            if (material != null && materialStockInfo.stockInfos.isNotEmpty) {
              itemsAfterGetMaterials[materialStockInfo.materialNumber] =
                  material
                      .copyWith(
                        stockInfo: materialStockInfo.stockInfos.first,
                        stockInfoList: materialStockInfo.stockInfos,
                      )
                      .copyWithComboDealMinQty(comboDeal);
            }
          }
        }
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
        user: fakeClientUser,
        salesConfigs: fakeKHSalesOrgConfigs,
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.fetchComboDealDetail(
          comboDeal: comboDeal,
          parentMaterialNumber: comboDeal.allMaterialNumbers.first,
          comboMaterialsCurrentQuantity: {},
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: itemsAfterGetMaterials,
          isFetchingComboInfo: true,
          isFetchingPrice: true,
          searchKey: SearchKey.empty(),
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
        ),
        initialState.copyWith(
          items: itemsAfterGetMaterials,
          selectedItems: selectedItems,
          isFetchingComboInfo: false,
          isFetchingPrice: true,
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
        ),
      ],
    );

    blocTest(
      'combo deal material bloc fetchComboDealDetail from product detail fail with getStockInfoList',
      setUp: () {
        when(() => config.pageSize).thenAnswer((invocation) => 1);
        items = comboDeal.allMaterialNumbers.fold(
          <MaterialNumber, PriceAggregate>{},
          (
            Map<MaterialNumber, PriceAggregate> map,
            MaterialNumber materialNumber,
          ) {
            map[materialNumber] = PriceAggregate.empty()
                .copyWith(salesOrgConfig: fakeKHSalesOrgConfigs);

            return map;
          },
        );
        when(
          () => productDetailRepository.getProductListDetail(
            salesOrganisation: fakeKHSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            materialNumber: comboDeal.allMaterialNumbers,
            types: comboDeal.allMaterialNumbers
                .map((e) => MaterialInfoType('material'))
                .toList(),
            language: mockLanguage,
          ),
        ).thenAnswer(
          (_) async => Right(materialResponse.products),
        );

        itemsAfterGetMaterials =
            Map<MaterialNumber, PriceAggregate>.from(items);

        selectedItems = Map<MaterialNumber, bool>.from({});

        for (final materialInfo in materialResponse.products) {
          final material = itemsAfterGetMaterials[materialInfo.materialNumber];
          if (material != null) {
            itemsAfterGetMaterials[materialInfo.materialNumber] = material
                .copyWith(
                  materialInfo: materialInfo.copyWith(
                    parentID: comboDeal.allMaterialNumbers.first
                        .getOrDefaultValue(''),
                  ),
                )
                .copyWithComboDealMinQty(comboDeal);

            selectedItems[materialInfo.materialNumber] = comboDeal
                .singleDeal(materialNumber: materialInfo.materialNumber)
                .mandatory;
          }
        }

        when(
          () => stockInfoRepositoryMock.getStockInfoList(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeKHSalesOrganisation,
            materials:
                materialResponse.products.map((e) => e.materialNumber).toList(),
            shipToInfo: fakeShipToInfo,
          ),
        ).thenAnswer(
          (_) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
        user: fakeClientUser,
        salesConfigs: fakeKHSalesOrgConfigs,
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.fetchComboDealDetail(
          comboDeal: comboDeal,
          parentMaterialNumber: comboDeal.allMaterialNumbers.first,
          comboMaterialsCurrentQuantity: {},
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: itemsAfterGetMaterials,
          isFetchingComboInfo: true,
          isFetchingPrice: true,
          searchKey: SearchKey.empty(),
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
        ),
        initialState.copyWith(
          items: itemsAfterGetMaterials,
          selectedItems: selectedItems,
          isFetchingComboInfo: false,
          isFetchingPrice: true,
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
        ),
      ],
    );
  });

  group('Combo deal material detail combo principal test', () {
    blocTest(
      'combo deal material bloc fetchComboDealPrincipal from product detail success',
      setUp: () {
        when(() => config.pageSize).thenAnswer((invocation) => 1);
        items = {};
        when(
          () => materialListRepository.getComboDealMaterials(
            user: fakeClientUser,
            salesOrganisation: fakeKHSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            pageSize: 1,
            offset: 0,
            principles: [
              materialResponse.products.first.principalData.principalCode
                  .getOrDefaultValue(''),
            ],
            salesOrgConfig: fakeKHSalesOrgConfigs,
          ),
        ).thenAnswer(
          (_) async => Right(
            materialResponse,
          ),
        );

        final newItems = materialResponse.products
            .map(
              (material) => PriceAggregate.empty().copyWith(
                materialInfo: material,
                salesOrgConfig: fakeKHSalesOrgConfigs,
                comboDeal: comboDeal,
              ),
            )
            .toList()
            .mapByMaterialNumber;

        itemsAfterGetMaterials =
            Map<MaterialNumber, PriceAggregate>.from(items);

        selectedItems = Map<MaterialNumber, bool>.from({});

        for (final item in newItems.values) {
          if (!itemsAfterGetMaterials.containsKey(item.getMaterialNumber)) {
            itemsAfterGetMaterials.putIfAbsent(
              item.getMaterialNumber,
              () => item,
            );
            selectedItems.putIfAbsent(
              item.getMaterialNumber,
              () => item.selfComboDeal.mandatory,
            );
          }
        }

        when(
          () => stockInfoRepositoryMock.getStockInfoList(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeKHSalesOrganisation,
            materials: newItems.entries
                .map((e) => e.value.materialInfo)
                .toList()
                .map((e) => e.materialNumber)
                .toList(),
            shipToInfo: fakeShipToInfo,
          ),
        ).thenAnswer(
          (_) async => Right(
            materialStockInfos,
          ),
        );
        if (materialStockInfos.isNotEmpty) {
          for (final materialStockInfo in materialStockInfos) {
            final material =
                itemsAfterGetMaterials[materialStockInfo.materialNumber];

            if (material != null && materialStockInfo.stockInfos.isNotEmpty) {
              itemsAfterGetMaterials[materialStockInfo.materialNumber] =
                  material.copyWith(
                stockInfo: materialStockInfo.stockInfos.first,
                stockInfoList: materialStockInfo.stockInfos,
                materialInfo: material.materialInfo.copyWith(
                  parentID:
                      comboDeal.allMaterialNumbers.first.getOrDefaultValue(''),
                ),
              );
            }
          }
        }
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        user: fakeClientUser,
        salesConfigs: fakeKHSalesOrgConfigs,
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.fetchComboDealPrincipal(
          comboDeal: comboDeal,
          parentMaterialNumber: comboDeal.allMaterialNumbers.first,
          comboMaterialsCurrentQuantity: {},
          principles: [
            materialResponse.products.first.principalData.principalCode
                .getOrDefaultValue(''),
          ],
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: {},
          isFetchingComboInfo: true,
          isFetchingPrice: true,
          searchKey: SearchKey.empty(),
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
        ),
        initialState.copyWith(
          items: itemsAfterGetMaterials,
          isFetchingComboInfo: true,
          isFetchingPrice: true,
          searchKey: SearchKey.empty(),
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
          materialCount: materialResponse.count,
          canLoadMore: materialResponse.products.length >= config.pageSize,
          nextPageIndex: 1,
        ),
        initialState.copyWith(
          items: itemsAfterGetMaterials,
          selectedItems: selectedItems,
          isFetchingComboInfo: false,
          isFetchingPrice: true,
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
          materialCount: materialResponse.count,
          canLoadMore: materialResponse.products.length >= config.pageSize,
          nextPageIndex: 1,
        ),
      ],
    );

    blocTest(
      'combo deal material bloc fetchComboDealPrincipal from cart success',
      setUp: () {
        when(() => config.pageSize).thenAnswer((invocation) => 1);
        items = {};
        existedItemsInCart = {
          MaterialNumber('000000000023272832'): 26,
        };
        final exitedMaterialsFetch = materialResponse.products
            .where(
              (material) =>
                  material.materialNumber == existedItemsInCart.keys.first,
            )
            .toList();
        when(
          () => productDetailRepository.getProductListDetail(
            salesOrganisation: fakeKHSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            materialNumber: existedItemsInCart.keys.toList(),
            types: existedItemsInCart.keys
                .map((e) => MaterialInfoType('material'))
                .toList(),
            language: mockLanguage,
          ),
        ).thenAnswer(
          (_) async => Right(exitedMaterialsFetch),
        );

        final exitedItems = exitedMaterialsFetch
            .map(
              (material) => PriceAggregate.empty().copyWith(
                materialInfo: material,
                salesOrgConfig: fakeKHSalesOrgConfigs,
                comboDeal: comboDeal,
              ),
            )
            .toList()
            .mapByMaterialNumber;

        itemsAfterGetMaterials =
            Map<MaterialNumber, PriceAggregate>.from(items);

        selectedItems = Map<MaterialNumber, bool>.from({});

        for (final item in exitedItems.values) {
          if (!itemsAfterGetMaterials.containsKey(item.getMaterialNumber)) {
            itemsAfterGetMaterials.putIfAbsent(
              item.getMaterialNumber,
              () => item,
            );
            selectedItems.putIfAbsent(
              item.getMaterialNumber,
              () => true,
            );
          }
        }

        when(
          () => materialListRepository.getComboDealMaterials(
            user: fakeClientUser,
            salesOrganisation: fakeKHSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            pageSize: 1,
            offset: 0,
            principles: [
              materialResponse.products.first.principalData.principalCode
                  .getOrDefaultValue(''),
            ],
            salesOrgConfig: fakeKHSalesOrgConfigs,
          ),
        ).thenAnswer(
          (_) async => Right(
            materialResponse,
          ),
        );

        final newItems = materialResponse.products
            .map(
              (material) => PriceAggregate.empty().copyWith(
                materialInfo: material,
                salesOrgConfig: fakeKHSalesOrgConfigs,
                comboDeal: comboDeal,
              ),
            )
            .toList()
            .mapByMaterialNumber;

        for (final item in newItems.values) {
          if (!itemsAfterGetMaterials.containsKey(item.getMaterialNumber)) {
            itemsAfterGetMaterials.putIfAbsent(
              item.getMaterialNumber,
              () => item,
            );
            selectedItems.putIfAbsent(
              item.getMaterialNumber,
              () => item.selfComboDeal.mandatory,
            );
          }
        }

        when(
          () => stockInfoRepositoryMock.getStockInfoList(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeKHSalesOrganisation,
            materials: itemsAfterGetMaterials.entries
                .map((e) => e.value.materialInfo)
                .toList()
                .map((e) => e.materialNumber)
                .toList(),
            shipToInfo: fakeShipToInfo,
          ),
        ).thenAnswer(
          (_) async => Right(
            materialStockInfos,
          ),
        );
        if (materialStockInfos.isNotEmpty) {
          for (final materialStockInfo in materialStockInfos) {
            final material =
                itemsAfterGetMaterials[materialStockInfo.materialNumber];

            if (material != null && materialStockInfo.stockInfos.isNotEmpty) {
              itemsAfterGetMaterials[materialStockInfo.materialNumber] =
                  material.copyWith(
                stockInfo: materialStockInfo.stockInfos.first,
                stockInfoList: materialStockInfo.stockInfos,
                materialInfo: material.materialInfo.copyWith(
                  parentID:
                      comboDeal.allMaterialNumbers.first.getOrDefaultValue(''),
                ),
              );
            }
          }
        }

        for (final materialNumber in existedItemsInCart.keys) {
          final material = itemsAfterGetMaterials[materialNumber];
          if (material != null) {
            itemsAfterGetMaterials[materialNumber] = material.copyWith(
              quantity: existedItemsInCart[materialNumber] ?? material.quantity,
            );
          }
        }
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        user: fakeClientUser,
        salesConfigs: fakeKHSalesOrgConfigs,
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.fetchComboDealPrincipal(
          comboDeal: comboDeal,
          parentMaterialNumber: comboDeal.allMaterialNumbers.first,
          comboMaterialsCurrentQuantity: existedItemsInCart,
          principles: [
            materialResponse.products.first.principalData.principalCode
                .getOrDefaultValue(''),
          ],
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: {},
          isFetchingComboInfo: true,
          isFetchingPrice: true,
          searchKey: SearchKey.empty(),
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
        ),
        initialState.copyWith(
          items: itemsAfterGetMaterials,
          isFetchingComboInfo: true,
          isFetchingPrice: true,
          searchKey: SearchKey.empty(),
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
          materialCount: materialResponse.count,
          canLoadMore: materialResponse.products.length >= config.pageSize,
          nextPageIndex: 1,
        ),
        initialState.copyWith(
          items: itemsAfterGetMaterials,
          selectedItems: selectedItems,
          isFetchingComboInfo: false,
          isFetchingPrice: true,
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
          materialCount: materialResponse.count,
          canLoadMore: materialResponse.products.length >= config.pageSize,
          nextPageIndex: 1,
        ),
      ],
    );

    blocTest(
      'combo deal material bloc loadMoreComboDealPrincipal success',
      setUp: () {
        when(() => config.pageSize).thenAnswer((invocation) => 1);
        items = comboDeal.allMaterialNumbers.fold(
          <MaterialNumber, PriceAggregate>{},
          (
            Map<MaterialNumber, PriceAggregate> map,
            MaterialNumber materialNumber,
          ) {
            map[materialNumber] = PriceAggregate.empty()
                .copyWith(salesOrgConfig: fakeKHSalesOrgConfigs);

            return map;
          },
        );
        when(
          () => materialListRepository.getComboDealMaterials(
            user: fakeClientUser,
            salesOrganisation: fakeKHSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            pageSize: 1,
            offset: 0,
            principles: [
              productList.first.materialInfo.principalData.principalCode
                  .getOrDefaultValue(''),
            ],
            salesOrgConfig: fakeKHSalesOrgConfigs,
          ),
        ).thenAnswer(
          (_) async => Right(
            materialResponse,
          ),
        );
        final newItems = materialResponse.products
            .map(
              (material) => PriceAggregate.empty().copyWith(
                materialInfo: material,
                salesOrgConfig: fakeKHSalesOrgConfigs,
                comboDeal: comboDeal,
              ),
            )
            .toList()
            .mapByMaterialNumber;

        itemsAfterGetMaterials =
            Map<MaterialNumber, PriceAggregate>.from(items);

        selectedItems = Map<MaterialNumber, bool>.from({});

        for (final item in newItems.values) {
          if (!itemsAfterGetMaterials.containsKey(item.getMaterialNumber)) {
            itemsAfterGetMaterials.putIfAbsent(
              item.getMaterialNumber,
              () => item,
            );
            selectedItems.putIfAbsent(
              item.getMaterialNumber,
              () => item.selfComboDeal.mandatory,
            );
          }
        }

        when(
          () => stockInfoRepositoryMock.getStockInfoList(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeKHSalesOrganisation,
            materials: newItems.entries
                .map((e) => e.value.materialInfo)
                .toList()
                .map((e) => e.materialNumber)
                .toList(),
            shipToInfo: fakeShipToInfo,
          ),
        ).thenAnswer(
          (_) async => Right(
            materialStockInfos,
          ),
        );
        if (materialStockInfos.isNotEmpty) {
          for (final materialStockInfo in materialStockInfos) {
            final material =
                itemsAfterGetMaterials[materialStockInfo.materialNumber];

            if (material != null && materialStockInfo.stockInfos.isNotEmpty) {
              itemsAfterGetMaterials[materialStockInfo.materialNumber] =
                  material.copyWith(
                stockInfo: materialStockInfo.stockInfos.first,
                stockInfoList: materialStockInfo.stockInfos,
              );
            }
          }
        }
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
        canLoadMore: true,
        user: fakeClientUser,
        salesConfigs: fakeKHSalesOrgConfigs,
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.loadMoreComboDealPrincipal(
          comboDeal: comboDeal,
          principles: [
            productList.first.materialInfo.principalData.principalCode
                .getOrDefaultValue(''),
          ],
        ),
      ),
      skip: 1,
      expect: () => [
        initialState.copyWith(
          items: itemsAfterGetMaterials,
          selectedItems: selectedItems,
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
          nextPageIndex: 1,
          materialCount: 0,
        ),
      ],
    );

    blocTest(
      'combo deal material bloc fetchComboDealPrincipal from product detail fail',
      setUp: () {
        when(() => config.pageSize).thenAnswer((invocation) => 1);
        items = {};
        when(
          () => materialListRepository.getComboDealMaterials(
            user: fakeClientUser,
            salesOrganisation: fakeKHSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            pageSize: 1,
            offset: 0,
            principles: [
              materialResponse.products.first.principalData.principalCode
                  .getOrDefaultValue(''),
            ],
            salesOrgConfig: fakeKHSalesOrgConfigs,
          ),
        ).thenAnswer(
          (_) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        user: fakeClientUser,
        salesConfigs: fakeKHSalesOrgConfigs,
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.fetchComboDealPrincipal(
          comboDeal: comboDeal,
          parentMaterialNumber: comboDeal.allMaterialNumbers.first,
          comboMaterialsCurrentQuantity: {},
          principles: [
            materialResponse.products.first.principalData.principalCode
                .getOrDefaultValue(''),
          ],
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: {},
          isFetchingComboInfo: true,
          isFetchingPrice: true,
          searchKey: SearchKey.empty(),
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
        ),
        initialState.copyWith(
          items: {},
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          isFetchingComboInfo: false,
          isFetchingPrice: false,
        ),
      ],
    );

    blocTest(
      'combo deal material bloc loadMoreComboDealPrincipal failed',
      setUp: () {
        when(() => config.pageSize).thenAnswer((invocation) => 1);
        items = comboDeal.allMaterialNumbers.fold(
          <MaterialNumber, PriceAggregate>{},
          (
            Map<MaterialNumber, PriceAggregate> map,
            MaterialNumber materialNumber,
          ) {
            map[materialNumber] = PriceAggregate.empty()
                .copyWith(salesOrgConfig: fakeKHSalesOrgConfigs);

            return map;
          },
        );
        when(
          () => materialListRepository.getComboDealMaterials(
            user: fakeClientUser,
            salesOrganisation: fakeKHSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            pageSize: 1,
            offset: 0,
            principles: [
              productList.first.materialInfo.principalData.principalCode
                  .getOrDefaultValue(''),
            ],
            salesOrgConfig: fakeKHSalesOrgConfigs,
          ),
        ).thenAnswer(
          (_) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
        canLoadMore: true,
        user: fakeClientUser,
        salesConfigs: fakeKHSalesOrgConfigs,
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.loadMoreComboDealPrincipal(
          comboDeal: comboDeal,
          principles: [
            productList.first.materialInfo.principalData.principalCode
                .getOrDefaultValue(''),
          ],
        ),
      ),
      skip: 1,
      expect: () => [
        initialState.copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          isLoadMore: false,
          items: items,
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
        ),
      ],
    );
  });

  group('Combo deal material detail updateItemSelection test', () {
    blocTest(
      'combo deal material bloc updateItemSelection K1 update selection status to false',
      setUp: () {
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
        };
        selectionStatus = {
          for (final item in productList) item.getMaterialNumber: true,
        };
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
        selectedItems: {
          for (final item in productList) item.getMaterialNumber: true,
        },
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.updateItemSelection(
          item: productList.first.getMaterialNumber,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: items,
          selectedItems: selectionStatus,
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other(
                'All items in this combo are mandatory.',
              ),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'combo deal material bloc updateItemSelection K1 update selection status to true',
      setUp: () {
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
        };
        selectionStatus = {
          for (final item in productList) item.getMaterialNumber: true,
        };
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
        selectedItems: {
          for (final item in productList)
            item.getMaterialNumber:
                item.getMaterialNumber == productList.first.getMaterialNumber
                    ? false
                    : true,
        },
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.updateItemSelection(
          item: productList.first.getMaterialNumber,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: items,
          selectedItems: selectionStatus,
        ),
      ],
    );

    blocTest(
      'combo deal material bloc updateItemSelection K2.1 scheme update selection status',
      setUp: () async {
        final comboDealOtherScheme = (await ComboDealLocalDataSource()
                .getComboDealList(scheme: ComboDealScheme.k21))
            .first;
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
              comboDeal: comboDealOtherScheme,
            ),
        };
        selectionStatus = {
          for (final item in productList)
            item.getMaterialNumber:
                item.getMaterialNumber == productList.first.getMaterialNumber,
        };
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
        selectedItems: {
          for (final item in productList) item.getMaterialNumber: false,
        },
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.updateItemSelection(
          item: productList.first.getMaterialNumber,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: items,
          selectedItems: selectionStatus,
        ),
      ],
    );

    blocTest(
      'combo deal material bloc updateItemSelection K2.2 scheme update selection status',
      setUp: () async {
        final comboDealOtherScheme = (await ComboDealLocalDataSource()
                .getComboDealList(scheme: ComboDealScheme.k22))
            .first;
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
              comboDeal: comboDealOtherScheme,
            ),
        };
        selectionStatus = {
          for (final item in productList)
            item.getMaterialNumber:
                item.getMaterialNumber != productList.first.getMaterialNumber,
        };
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
        selectedItems: {
          for (final item in productList) item.getMaterialNumber: true,
        },
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.updateItemSelection(
          item: productList.first.getMaterialNumber,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: items,
          selectedItems: selectionStatus,
        ),
      ],
    );

    blocTest(
      'combo deal material bloc updateItemSelection K3 scheme update selection status',
      setUp: () async {
        final comboDealOtherScheme = (await ComboDealLocalDataSource()
                .getComboDealList(scheme: ComboDealScheme.k3))
            .first;
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
              comboDeal: comboDealOtherScheme,
            ),
        };
        selectionStatus = {
          for (final item in productList)
            item.getMaterialNumber:
                item.getMaterialNumber == productList.last.getMaterialNumber,
        };
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
        selectedItems: {
          for (final item in productList) item.getMaterialNumber: false,
        },
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.updateItemSelection(
          item: productList.last.getMaterialNumber,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: items,
          selectedItems: selectionStatus,
        ),
      ],
    );

    blocTest(
      'combo deal material bloc updateItemSelection K4 scheme update selection status',
      setUp: () async {
        final comboDealOtherScheme = (await ComboDealLocalDataSource()
                .getComboDealList(scheme: ComboDealScheme.k4))
            .first;
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
              comboDeal: comboDealOtherScheme,
            ),
        };
        selectionStatus = {
          for (final item in productList)
            item.getMaterialNumber:
                item.getMaterialNumber == productList.last.getMaterialNumber,
        };
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
        selectedItems: {
          for (final item in productList) item.getMaterialNumber: false,
        },
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.updateItemSelection(
          item: productList.last.getMaterialNumber,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: items,
          selectedItems: selectionStatus,
        ),
      ],
    );

    blocTest(
      'combo deal material bloc updateItemSelection K4.2 scheme update selection status',
      setUp: () async {
        final comboDealOtherScheme = (await ComboDealLocalDataSource()
                .getComboDealList(scheme: ComboDealScheme.k42))
            .first;
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
              comboDeal: comboDealOtherScheme,
            ),
        };
        selectionStatus = {
          for (final item in productList)
            item.getMaterialNumber:
                item.getMaterialNumber == productList.last.getMaterialNumber,
        };
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
        selectedItems: {
          for (final item in productList) item.getMaterialNumber: false,
        },
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.updateItemSelection(
          item: productList.last.getMaterialNumber,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: items,
          selectedItems: selectionStatus,
        ),
      ],
    );

    blocTest(
      'combo deal material bloc updateItemSelection K5 scheme update selection status',
      setUp: () async {
        final comboDealOtherScheme =
            (await ComboDealLocalDataSource().getComboDeal());
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
              comboDeal: comboDealOtherScheme,
            ),
        };
        selectionStatus = {
          for (final item in productList)
            item.getMaterialNumber:
                item.getMaterialNumber == productList.last.getMaterialNumber,
        };
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
        selectedItems: {
          for (final item in productList) item.getMaterialNumber: false,
        },
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.updateItemSelection(
          item: productList.last.getMaterialNumber,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: items,
          selectedItems: selectionStatus,
        ),
      ],
    );
  });
}
