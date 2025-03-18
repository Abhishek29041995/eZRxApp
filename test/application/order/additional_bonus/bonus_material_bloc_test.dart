import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/stock_info_repository.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_list_repository.dart';

import '../../../common_mock_data/user_mock.dart';
import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class MaterialListRepositoryMock extends Mock
    implements MaterialListRepository {}

class CartRepositoryMock extends Mock implements CartRepository {}

class StockInfoRepositoryMock extends Mock implements StockInfoRepository {}

void main() {
  late final MaterialListRepository materialListRepository;
  late final CartRepository cartRepository;
  late Config config;
  late MaterialResponse fakeMaterialListData;
  late List<BonusSampleItem> fakeSampleBonusItem;
  late Map<MaterialNumber, List<StockInfo>> fakeStockInfoList;
  final fakePrincipalData = PrincipalData.empty().copyWith(
    principalName: PrincipalName('fake-principal-name'),
    principalCode: PrincipalCode('0000101246'),
  );
  const fakeError = ApiFailure.other('fake-error');
  final stockInfoRepositoryMock = StockInfoRepositoryMock();
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    config = Config()..appFlavor = Flavor.mock;
    materialListRepository = MaterialListRepositoryMock();
    cartRepository = CartRepositoryMock();
    fakeMaterialListData = await MaterialListLocalDataSource().getProductList();
    fakeStockInfoList = <MaterialNumber, List<StockInfo>>{};
    fakeSampleBonusItem = [
      BonusSampleItem.empty().copyWith(
        qty: fakeMaterialListData.products.first.quantity,
        materialNumber: fakeMaterialListData.products.first.materialNumber,
        materialDescription:
            fakeMaterialListData.products.first.materialDescription,
        principalData: fakeMaterialListData.products.first.principalData,
      ),
    ];
  });

  group('Bonus Material Bloc', () {
    blocTest(
      'Fetch Bonus material success',
      build: () => BonusMaterialBloc(
        materialListRepository: materialListRepository,
        cartRepository: cartRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      setUp: () {
        when(
          () => materialListRepository.getMaterialBonusList(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            salesOrganisation: fakeMYSalesOrganisation,
            enableGimmickMaterial: false,
            offset: 0,
            pageSize: config.pageSize,
            principalData: fakePrincipalData,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            user: fakeRootAdminUser,
            searchKey: SearchKey.search('fake-searchKey'),
          ),
        ).thenAnswer(
          (_) async => Right(fakeMaterialListData),
        );
        when(
          () => stockInfoRepositoryMock.getMappedStockInfoList(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            items: fakeMaterialListData.products,
          ),
        ).thenAnswer(
          (_) async => Right(
            fakeStockInfoList,
          ),
        );
      },
      act: (BonusMaterialBloc bloc) => bloc.add(
        BonusMaterialEvent.fetch(
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          isGimmickMaterialEnabled: false,
          principalData: fakePrincipalData,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          user: fakeRootAdminUser,
          searchKey: SearchKey.search('fake-searchKey'),
        ),
      ),
      expect: () => [
        BonusMaterialState.initial().copyWith(
          isFetching: true,
          searchKey: SearchKey.search('fake-searchKey'),
        ),
        BonusMaterialState.initial().copyWith(
          bonusItemList: fakeMaterialListData.products,
          failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
          searchKey: SearchKey.search('fake-searchKey'),
        ),
        BonusMaterialState.initial().copyWith(
          isUpdatingStock: true,
          bonusItemList: fakeMaterialListData.products,
          failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
          searchKey: SearchKey.search('fake-searchKey'),
        ),
        BonusMaterialState.initial().copyWith(
          bonusItemList: fakeMaterialListData.products,
          searchKey: SearchKey.search('fake-searchKey'),
        ),
      ],
    );

    blocTest(
      'Fetch Bonus material failure',
      build: () => BonusMaterialBloc(
        materialListRepository: materialListRepository,
        cartRepository: cartRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      setUp: () {
        when(
          () => materialListRepository.getMaterialBonusList(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            salesOrganisation: fakeMYSalesOrganisation,
            enableGimmickMaterial: false,
            offset: 0,
            pageSize: config.pageSize,
            principalData: fakePrincipalData,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            user: fakeRootAdminUser,
            searchKey: SearchKey.search('fake-searchKey'),
          ),
        ).thenAnswer(
          (_) async => const Left(fakeError),
        );
      },
      act: (BonusMaterialBloc bloc) => bloc.add(
        BonusMaterialEvent.fetch(
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          isGimmickMaterialEnabled: false,
          principalData: fakePrincipalData,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          user: fakeRootAdminUser,
          searchKey: SearchKey.search('fake-searchKey'),
        ),
      ),
      expect: () => [
        BonusMaterialState.initial().copyWith(
          isFetching: true,
          searchKey: SearchKey.search('fake-searchKey'),
        ),
        BonusMaterialState.initial().copyWith(
          searchKey: SearchKey.search('fake-searchKey'),
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );

    blocTest(
      'LoadMore Bonus material Success',
      build: () => BonusMaterialBloc(
        materialListRepository: materialListRepository,
        cartRepository: cartRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => BonusMaterialState.initial().copyWith(
        bonusItemList: fakeMaterialListData.products,
        failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
      ),
      setUp: () {
        when(
          () => materialListRepository.getMaterialBonusList(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            salesOrganisation: fakeMYSalesOrganisation,
            enableGimmickMaterial: false,
            offset: fakeMaterialListData.products.length,
            pageSize: config.pageSize,
            principalData: fakePrincipalData,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            user: fakeRootAdminUser,
            searchKey: SearchKey.empty(),
          ),
        ).thenAnswer(
          (_) async => Right(fakeMaterialListData),
        );
        when(
          () => stockInfoRepositoryMock.getMappedStockInfoList(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            items: fakeMaterialListData.products,
          ),
        ).thenAnswer(
          (_) async => Right(
            fakeStockInfoList,
          ),
        );
      },
      act: (BonusMaterialBloc bloc) => bloc.add(
        BonusMaterialEvent.loadMoreBonusItem(
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          isGimmickMaterialEnabled: false,
          principalData: fakePrincipalData,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          user: fakeRootAdminUser,
        ),
      ),
      expect: () => [
        BonusMaterialState.initial().copyWith(
          isFetching: true,
          bonusItemList: fakeMaterialListData.products,
          failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
        ),
        BonusMaterialState.initial().copyWith(
          bonusItemList: [
            ...fakeMaterialListData.products,
            ...fakeMaterialListData.products,
          ],
          failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
        ),
        BonusMaterialState.initial().copyWith(
          isUpdatingStock: true,
          bonusItemList: [
            ...fakeMaterialListData.products,
            ...fakeMaterialListData.products,
          ],
          failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
        ),
        BonusMaterialState.initial().copyWith(
          bonusItemList: [
            ...fakeMaterialListData.products,
            ...fakeMaterialListData.products,
          ],
        ),
      ],
    );

    blocTest(
      'LoadMore Bonus material failure',
      build: () => BonusMaterialBloc(
        materialListRepository: materialListRepository,
        cartRepository: cartRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => BonusMaterialState.initial().copyWith(
        bonusItemList: fakeMaterialListData.products,
        failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
      ),
      setUp: () {
        when(
          () => materialListRepository.getMaterialBonusList(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            salesOrganisation: fakeMYSalesOrganisation,
            enableGimmickMaterial: false,
            offset: fakeMaterialListData.products.length,
            pageSize: config.pageSize,
            principalData: fakePrincipalData,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            user: fakeRootAdminUser,
            searchKey: SearchKey.empty(),
          ),
        ).thenAnswer(
          (_) async => const Left(fakeError),
        );
      },
      act: (BonusMaterialBloc bloc) => bloc.add(
        BonusMaterialEvent.loadMoreBonusItem(
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          isGimmickMaterialEnabled: false,
          principalData: fakePrincipalData,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          user: fakeRootAdminUser,
        ),
      ),
      expect: () => [
        BonusMaterialState.initial().copyWith(
          isFetching: true,
          bonusItemList: fakeMaterialListData.products,
          failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
        ),
        BonusMaterialState.initial().copyWith(
          bonusItemList: fakeMaterialListData.products,
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );

    blocTest(
      'Validate Bonus Quantity',
      build: () => BonusMaterialBloc(
        materialListRepository: materialListRepository,
        cartRepository: cartRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => BonusMaterialState.initial().copyWith(
        bonusItemList: fakeMaterialListData.products,
        failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
      ),
      act: (BonusMaterialBloc bloc) => bloc.add(
        BonusMaterialEvent.validateBonusQuantity(
          bonusMaterial: fakeMaterialListData.products.first,
        ),
      ),
      expect: () => [
        BonusMaterialState.initial().copyWith(
          bonusItemList: fakeMaterialListData.products,
          isBonusQtyValidated:
              fakeMaterialListData.products.first.quantity.intValue > 0,
          failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
        ),
      ],
    );

    blocTest(
      'Update Added Bonus Items',
      build: () => BonusMaterialBloc(
        materialListRepository: materialListRepository,
        cartRepository: cartRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => BonusMaterialState.initial().copyWith(
        bonusItemList: fakeMaterialListData.products,
        addedBonusItemsList: fakeSampleBonusItem,
        failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
      ),
      act: (BonusMaterialBloc bloc) => bloc.add(
        BonusMaterialEvent.updateAddedBonusItems(
          addedBonusItemList: fakeSampleBonusItem,
        ),
      ),
      expect: () => [
        BonusMaterialState.initial().copyWith(
          bonusItemList: fakeMaterialListData.products,
          addedBonusItemsList: [
            ...fakeSampleBonusItem,
            ...fakeSampleBonusItem,
          ],
          failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
        ),
      ],
    );

    blocTest(
      'Update Bonus Item Quantity',
      build: () => BonusMaterialBloc(
        materialListRepository: materialListRepository,
        cartRepository: cartRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => BonusMaterialState.initial().copyWith(
        bonusItemList: [
          fakeMaterialListData.products.first,
          fakeMaterialListData.products.last,
        ],
        failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
      ),
      act: (BonusMaterialBloc bloc) => bloc.add(
        BonusMaterialEvent.updateBonusItemQuantity(
          updatedBonusItem: fakeMaterialListData.products.first
              .copyWith(quantity: MaterialQty(5)),
        ),
      ),
      expect: () => [
        BonusMaterialState.initial().copyWith(
          bonusItemList: [
            fakeMaterialListData.products.first
                .copyWith(quantity: MaterialQty(5)),
            fakeMaterialListData.products.last,
          ],
          failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
        ),
      ],
    );

    blocTest(
      'Update Product Stock Success',
      build: () => BonusMaterialBloc(
        materialListRepository: materialListRepository,
        cartRepository: cartRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => BonusMaterialState.initial().copyWith(
        bonusItemList: [
          fakeMaterialListData.products.first.copyWith(
            stockInfos: [
              StockInfo.empty().copyWith(
                stockQuantity: 10,
              ),
            ],
          ),
        ],
      ),
      setUp: () {
        when(
          () => stockInfoRepositoryMock.getMappedStockInfoList(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            items: [
              fakeMaterialListData.products.first,
            ],
          ),
        ).thenAnswer(
          (_) async => Right({
            MaterialNumber('fake-material-name'): [
              StockInfo.empty().copyWith(
                stockQuantity: 10,
              ),
            ],
          }),
        );
      },
      act: (BonusMaterialBloc bloc) => bloc.add(
        BonusMaterialEvent.updateProductStock(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          salesOrganisation: fakeMYSalesOrganisation,
          configs: fakeMYSalesOrgConfigs,
          items: [
            fakeMaterialListData.products.first,
          ],
        ),
      ),
      expect: () => [
        BonusMaterialState.initial().copyWith(
          isUpdatingStock: true,
          bonusItemList: [
            fakeMaterialListData.products.first.copyWith(
              stockInfos: [
                StockInfo.empty().copyWith(
                  stockQuantity: 10,
                ),
              ],
            ),
          ],
        ),
        BonusMaterialState.initial().copyWith(
          bonusItemList: [
            fakeMaterialListData.products.first.copyWith(
              stockInfos: [
                StockInfo.empty().copyWith(
                  stockQuantity: 10,
                ),
              ],
            ),
          ],
        ),
      ],
    );

    blocTest(
      'Update Product Stock Failed',
      build: () => BonusMaterialBloc(
        materialListRepository: materialListRepository,
        cartRepository: cartRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => BonusMaterialState.initial().copyWith(
        bonusItemList: [
          fakeMaterialListData.products.first,
        ],
      ),
      setUp: () {
        when(
          () => stockInfoRepositoryMock.getMappedStockInfoList(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            items: [
              fakeMaterialListData.products.first,
            ],
          ),
        ).thenAnswer(
          (_) async => const Left(fakeError),
        );
      },
      act: (BonusMaterialBloc bloc) => bloc.add(
        BonusMaterialEvent.updateProductStock(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          salesOrganisation: fakeMYSalesOrganisation,
          configs: fakeMYSalesOrgConfigs,
          items: [
            fakeMaterialListData.products.first,
          ],
        ),
      ),
      expect: () => [
        BonusMaterialState.initial().copyWith(
          isUpdatingStock: true,
          bonusItemList: [
            fakeMaterialListData.products.first,
          ],
        ),
        BonusMaterialState.initial().copyWith(
          bonusItemList: [
            fakeMaterialListData.products.first,
          ],
          failureOrSuccessOption: optionOf(
            const Left(fakeError),
          ),
        ),
      ],
    );

    blocTest(
      'Reset BonusMaterialBloc if searchKey is Empty',
      build: () => BonusMaterialBloc(
        materialListRepository: materialListRepository,
        cartRepository: cartRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => BonusMaterialState.initial().copyWith(
        bonusItemList: fakeMaterialListData.products,
        searchKey: SearchKey.search('fake-search-key'),
      ),
      act: (BonusMaterialBloc bloc) => bloc.add(
        BonusMaterialEvent.fetch(
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          isGimmickMaterialEnabled: false,
          principalData: fakePrincipalData,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          user: fakeRootAdminUser,
          searchKey: SearchKey.empty(),
        ),
      ),
      expect: () => [BonusMaterialState.initial()],
    );

    test('bonusItemID function', () {
      expect(
        BonusMaterialState.initial()
            .copyWith(
              addedBonusItemsList: fakeSampleBonusItem,
            )
            .bonusItemID(fakeMaterialListData.products.first.materialNumber),
        fakeSampleBonusItem.first.itemId,
      );

      expect(
        BonusMaterialState.initial()
            .copyWith(
              addedBonusItemsList: fakeSampleBonusItem,
            )
            .bonusItemID(MaterialNumber('fake-number')),
        StringValue(''),
      );
    });
  });
}
