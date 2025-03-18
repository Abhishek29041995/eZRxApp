import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_tender_contract.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/re_order_permission.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/re_order_permission_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_price_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/re_order_permission_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class ReOrderPermissionRepositoryMock extends Mock
    implements ReOrderPermissionRepository {}

class MaterialPriceRepositoryMock extends Mock
    implements MaterialPriceRepository {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ReOrderPermissionRepository repository;
  late MaterialPriceRepository priceRepository;
  final mockReOrderPermission =
      await ReOrderPermissionLocalDataSource().getPermission();
  final fakeViewByOrder = await ViewByOrderLocalDataSource().getViewByOrders();
  final fakeViewByItemDetail =
      await ViewByItemLocalDataSource().getViewByItems();
  final fakeOrderHistoryItem = fakeViewByItemDetail.orderHistoryItems.first;
  final fakeOrderHistoryDetailsOrderItems =
      fakeViewByOrder.orderHeaders.first.orderHistoryDetailsOrderItem;
  final fakeOrderHistoryDetailsOrderItemsComm =
      fakeOrderHistoryDetailsOrderItems
          .map((e) => e.copyWith(type: OrderItemType('Comm')))
          .toList();
  final fakeReorderItems = fakeOrderHistoryDetailsOrderItemsComm
      .map(
        (e) => PriceAggregate.empty().copyWith(
          materialInfo: e.reOrderMaterialInfo,
          tenderContract:
              e.tenderContractDetails.contractNumber.isContractNumberEmpty
                  ? TenderContract.empty()
                  : e.orderItemTenderContract,
        ),
      )
      .toList();
  final fakeOrderHistoryDetailsOrderItemsCommWithTender =
      fakeOrderHistoryDetailsOrderItems
          .map(
            (e) => e.copyWith(
              type: OrderItemType('Comm'),
              tenderContractDetails:
                  OrderHistoryDetailsTenderContract.empty().copyWith(
                contractNumber: TenderContractNumber('fake-number'),
              ),
            ),
          )
          .toList();
  final fakeReorderItemsWithTender =
      fakeOrderHistoryDetailsOrderItemsCommWithTender
          .map(
            (e) => PriceAggregate.empty().copyWith(
              materialInfo: e.reOrderMaterialInfo,
              tenderContract:
                  e.tenderContractDetails.contractNumber.isContractNumberEmpty
                      ? TenderContract.empty()
                      : e.orderItemTenderContract,
            ),
          )
          .toList();
  final fakePrice = Price.empty().copyWith(finalPrice: MaterialPrice(12));
  const fakeError = ApiFailure.other('mock-error');
  final initializedState = ReOrderPermissionState.initial().copyWith(
    salesOrganisationConfigs: fakeMYSalesOrgConfigs,
    customerCodeInfo: fakeCustomerCodeInfo,
    salesOrganisation: fakeMYSalesOrganisation,
    shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
    user: fakeSalesRepUser,
  );

  setUp(() async {
    repository = ReOrderPermissionRepositoryMock();
    priceRepository = MaterialPriceRepositoryMock();
  });

  group('ReOrder Permission Bloc', () {
    blocTest(
      'Initialize',
      build: () => ReOrderPermissionBloc(
        reOrderPermissionRepository: repository,
        materialPriceRepository: priceRepository,
      ),
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.initialized(
          salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          user: fakeSalesRepUser,
        ),
      ),
      expect: () => [initializedState],
    );

    blocTest(
      'Fetch order Reorder Permission success',
      build: () => ReOrderPermissionBloc(
        reOrderPermissionRepository: repository,
        materialPriceRepository: priceRepository,
      ),
      seed: () => initializedState,
      setUp: () {
        when(
          () => priceRepository.getMaterialPrice(
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesConfigs: fakeMYSalesOrgConfigs,
            materialNumberList: fakeReorderItems
                .where((e) => e.materialInfo.type.typeMaterial)
                .map((e) => e.getMaterialNumber)
                .toList(),
            comboDealEligible: false,
          ),
        ).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );

        when(
          () => repository.getReorderPermission(
            customerCodeInfo: fakeCustomerCodeInfo,
            materialNumbers: fakeOrderHistoryDetailsOrderItemsComm
                .map((e) => e.materialNumber)
                .toList(),
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeSalesRepUser,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          ),
        ).thenAnswer((_) async => Right(mockReOrderPermission.validMaterials));
      },
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.fetchOrder(
          orderHistoryDetailsOrderItems: fakeOrderHistoryDetailsOrderItemsComm,
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
      ),
      expect: () => [
        initializedState.copyWith(
          isFetching: true,
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
        initializedState.copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
      ],
    );

    blocTest(
      'Fetch order Reorder Permission success with tender',
      build: () => ReOrderPermissionBloc(
        reOrderPermissionRepository: repository,
        materialPriceRepository: priceRepository,
      ),
      seed: () => initializedState,
      setUp: () {
        when(
          () => priceRepository.getMaterialPrice(
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesConfigs: fakeMYSalesOrgConfigs,
            materialNumberList: fakeReorderItemsWithTender
                .where((e) => e.materialInfo.type.typeMaterial)
                .map((e) => e.getMaterialNumber)
                .toList(),
            comboDealEligible: false,
          ),
        ).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );

        when(
          () => repository.getReorderPermission(
            customerCodeInfo: fakeCustomerCodeInfo,
            materialNumbers: fakeOrderHistoryDetailsOrderItemsCommWithTender
                .map((e) => e.materialNumber)
                .toList(),
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeSalesRepUser,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          ),
        ).thenAnswer((_) async => Right(mockReOrderPermission.validMaterials));
      },
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.fetchOrder(
          orderHistoryDetailsOrderItems:
              fakeOrderHistoryDetailsOrderItemsCommWithTender,
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
      ),
      expect: () => [
        initializedState.copyWith(
          isFetching: true,
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
        initializedState.copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
      ],
    );

    blocTest(
      'Fetch order Reorder Permission failure',
      build: () => ReOrderPermissionBloc(
        reOrderPermissionRepository: repository,
        materialPriceRepository: priceRepository,
      ),
      seed: () => initializedState,
      setUp: () {
        when(
          () => repository.getReorderPermission(
            customerCodeInfo: fakeCustomerCodeInfo,
            materialNumbers: fakeOrderHistoryDetailsOrderItems
                .map((e) => e.materialNumber)
                .toList(),
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeSalesRepUser,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          ),
        ).thenAnswer((_) async => const Left(fakeError));
      },
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.fetchOrder(
          orderHistoryDetailsOrderItems: fakeOrderHistoryDetailsOrderItems,
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
      ),
      expect: () => [
        initializedState.copyWith(
          isFetching: true,
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
        initializedState.copyWith(
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );

    blocTest(
      'Fetch order Reorder Permission success when item is not valid',
      build: () => ReOrderPermissionBloc(
        reOrderPermissionRepository: repository,
        materialPriceRepository: priceRepository,
      ),
      seed: () => initializedState,
      setUp: () {
        when(
          () => priceRepository.getMaterialPrice(
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesConfigs: fakeMYSalesOrgConfigs,
            materialNumberList: [],
            comboDealEligible: false,
          ),
        ).thenAnswer((_) async => const Right(<MaterialNumber, Price>{}));

        when(
          () => repository.getReorderPermission(
            customerCodeInfo: fakeCustomerCodeInfo,
            materialNumbers: fakeOrderHistoryDetailsOrderItems
                .map((e) => e.materialNumber)
                .toList(),
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeSalesRepUser,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          ),
        ).thenAnswer(
          (_) async => Right(
            mockReOrderPermission.validMaterials
                .map((e) => e.copyWith(isValid: false))
                .toList(),
          ),
        );
      },
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.fetchOrder(
          orderHistoryDetailsOrderItems: fakeOrderHistoryDetailsOrderItems,
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
      ),
      expect: () => [
        initializedState.copyWith(
          isFetching: true,
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
        initializedState.copyWith(
          isFetching: false,
          validOrderItems: [],
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
      ],
    );

    blocTest(
      'Reset Order Number Will Upsert',
      build: () => ReOrderPermissionBloc(
        reOrderPermissionRepository: repository,
        materialPriceRepository: priceRepository,
      ),
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.resetOrderNumberWillUpsert(
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
      ),
      expect: () => [
        ReOrderPermissionState.initial().copyWith(
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
      ],
    );

    blocTest(
      'Fetch item Reorder Permission failure',
      build: () => ReOrderPermissionBloc(
        reOrderPermissionRepository: repository,
        materialPriceRepository: priceRepository,
      ),
      seed: () => initializedState,
      setUp: () {
        when(
          () => repository.getReorderItemPermission(
            customerCodeInfo: fakeCustomerCodeInfo,
            materialNumber:
                fakeViewByItemDetail.orderHistoryItems.first.materialNumber,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeSalesRepUser,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          ),
        ).thenAnswer((_) async => const Left(fakeError));
      },
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.fetchItem(
          item: fakeViewByItemDetail.orderHistoryItems.first,
          orderHistoryDetail: fakeViewByItemDetail,
        ),
      ),
      expect: () => [
        initializedState.copyWith(
          isFetching: true,
        ),
        initializedState.copyWith(
          isFetching: false,
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );

    blocTest(
      'Fetch item Reorder Permission success when item is not bonus',
      build: () => ReOrderPermissionBloc(
        reOrderPermissionRepository: repository,
        materialPriceRepository: priceRepository,
      ),
      seed: () => initializedState,
      setUp: () {
        when(
          () => priceRepository.getMaterialPrice(
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesConfigs: fakeMYSalesOrgConfigs,
            materialNumberList: [fakeOrderHistoryItem.materialNumber],
            comboDealEligible: false,
          ),
        ).thenAnswer(
          (_) async => Right({fakeOrderHistoryItem.materialNumber: fakePrice}),
        );
        when(
          () => repository.getReorderItemPermission(
            customerCodeInfo: fakeCustomerCodeInfo,
            materialNumber: fakeOrderHistoryItem.materialNumber,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            user: fakeSalesRepUser,
          ),
        ).thenAnswer(
          (_) async => Right(
            ValidMaterial.empty().copyWith(
              materialNumber: fakeOrderHistoryItem.materialNumber,
              isValid: true,
            ),
          ),
        );
      },
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.fetchItem(
          item: fakeOrderHistoryItem,
          orderHistoryDetail: fakeViewByItemDetail,
        ),
      ),
      expect: () => [
        initializedState.copyWith(
          isFetching: true,
        ),
        initializedState.copyWith(
          isFetching: false,
          validOrderItems: [
            PriceAggregate.empty().copyWith(
              materialInfo: fakeOrderHistoryItem.reOrderMaterialInfo,
              tenderContract: fakeOrderHistoryItem.orderItemTenderContract,
              price: fakePrice,
            ),
          ],
        ),
      ],
    );

    blocTest(
      'Fetch item Reorder Permission success when item is bonus',
      build: () => ReOrderPermissionBloc(
        reOrderPermissionRepository: repository,
        materialPriceRepository: priceRepository,
      ),
      seed: () => initializedState,
      setUp: () {
        when(
          () => priceRepository.getMaterialPrice(
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesConfigs: fakeMYSalesOrgConfigs,
            materialNumberList: [fakeOrderHistoryItem.materialNumber],
            comboDealEligible: false,
          ),
        ).thenAnswer(
          (_) async => Right({fakeOrderHistoryItem.materialNumber: fakePrice}),
        );
        when(
          () => repository.getReorderItemPermission(
            customerCodeInfo: fakeCustomerCodeInfo,
            materialNumber: fakeOrderHistoryItem.materialNumber,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeSalesRepUser,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          ),
        ).thenAnswer(
          (_) async => Right(
            ValidMaterial.empty().copyWith(
              materialNumber: fakeOrderHistoryItem.materialNumber,
              isValid: true,
            ),
          ),
        );
      },
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.fetchItem(
          item: fakeOrderHistoryItem.copyWith(
            isBonusMaterial: true,
            lineNumber: LineNumber('12'),
          ),
          orderHistoryDetail: OrderHistory.empty().copyWith(
            orderHistoryItems: [
              fakeOrderHistoryItem.copyWith(
                isBonusMaterial: false,
                lineNumber: LineNumber('10'),
              ),
              fakeOrderHistoryItem.copyWith(
                isBonusMaterial: true,
                lineNumber: LineNumber('12'),
              ),
            ],
          ),
        ),
      ),
      expect: () => [
        initializedState.copyWith(
          isFetching: true,
        ),
        initializedState.copyWith(
          isFetching: false,
          validOrderItems: [
            PriceAggregate.empty().copyWith(
              materialInfo: fakeOrderHistoryItem
                  .copyWith(
                    isBonusMaterial: true,
                    lineNumber: LineNumber('12'),
                  )
                  .reOrderMaterialInfo,
              tenderContract: fakeOrderHistoryItem.orderItemTenderContract,
              price: fakePrice,
            ),
          ],
        ),
      ],
    );

    blocTest(
      'Fetch item Reorder Permission success and fetch price failure',
      build: () => ReOrderPermissionBloc(
        reOrderPermissionRepository: repository,
        materialPriceRepository: priceRepository,
      ),
      seed: () => initializedState,
      setUp: () {
        when(
          () => priceRepository.getMaterialPrice(
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesConfigs: fakeMYSalesOrgConfigs,
            materialNumberList: [fakeOrderHistoryItem.materialNumber],
            comboDealEligible: false,
          ),
        ).thenAnswer((_) async => const Left(fakeError));
        when(
          () => repository.getReorderItemPermission(
            customerCodeInfo: fakeCustomerCodeInfo,
            materialNumber: fakeOrderHistoryItem.materialNumber,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            user: fakeSalesRepUser,
          ),
        ).thenAnswer(
          (_) async => Right(
            ValidMaterial.empty().copyWith(
              materialNumber: fakeOrderHistoryItem.materialNumber,
              isValid: true,
            ),
          ),
        );
      },
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.fetchItem(
          item: fakeOrderHistoryItem,
          orderHistoryDetail: fakeViewByItemDetail,
        ),
      ),
      expect: () => [
        initializedState.copyWith(isFetching: true),
        initializedState.copyWith(
          isFetching: false,
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );

    test('availableTenderContract getter', () {
      final state = ReOrderPermissionState.initial().copyWith(
        validOrderItems: [
          PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-number'),
            ),
            tenderContract: TenderContract.empty(),
          ),
        ],
      );
      expect(state.availableTenderContract, {
        MaterialNumber('fake-number'): TenderContract.empty(),
      });
    });
  });
}
