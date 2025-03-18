import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/error/order_exception.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/stock_info_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class StockInfoLocalDataSourceMock extends Mock
    implements StockInfoLocalDataSource {}

class StockInfoRemoteDataSourceMock extends Mock
    implements StockInfoRemoteDataSource {}

void main() {
  late StockInfoLocalDataSource localDataSource;
  late StockInfoRemoteDataSource remoteDataSource;
  late Config config;
  late StockInfoRepository stockInfoRepository;
  late List<MaterialStockInfo> stockInfoList;
  final error = Exception('fake-error');
  final materialNumbers = [MaterialNumber('fake-material-number')];
  final stream = Stream<bool>.fromIterable([]);

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    localDataSource = StockInfoLocalDataSourceMock();
    remoteDataSource = StockInfoRemoteDataSourceMock();
    config = ConfigMock();
    stockInfoRepository = StockInfoRepository(
      config: config,
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
    stockInfoList = await StockInfoLocalDataSource().getMaterialStockInfoList();
  });

  group('Stock info repository test - ', () {
    test('watchStockApiStatus success', () async {
      when(() => localDataSource.stockApiStatusData).thenAnswer((_) => stream);

      final result = stockInfoRepository.watchStockApiStatus();
      expect(result, stream);
    });

    group('getStockInfoList Test - ', () {
      test('getStockInfoList local success', () async {
        when(() => config.appFlavor).thenReturn(Flavor.mock);

        when(() => localDataSource.getMaterialStockInfoList())
            .thenAnswer((_) async => stockInfoList);

        final result = await stockInfoRepository.getStockInfoList(
          materials: [],
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        );
        expect(result, Right(stockInfoList));
      });

      test('getStockInfoList local failure', () async {
        when(() => config.appFlavor).thenReturn(Flavor.mock);

        when(() => localDataSource.getMaterialStockInfoList()).thenThrow(error);

        final result = await stockInfoRepository.getStockInfoList(
          materials: [],
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        );
        expect(result, Left(FailureHandler.handleFailure(error)));
      });

      test('getStockInfoList remote success when material list empty',
          () async {
        when(() => config.appFlavor).thenReturn(Flavor.uat);

        final result = await stockInfoRepository.getStockInfoList(
          materials: [],
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        );
        expect(result, const Right(<MaterialStockInfo>[]));
      });

      test('getStockInfoList remote success', () async {
        when(() => config.appFlavor).thenReturn(Flavor.uat);

        when(
          () => remoteDataSource.getMaterialStockInfoList(
            materialNumbers:
                materialNumbers.map((e) => e.getOrDefaultValue('')).toList(),
            salesOrg: fakeMYSalesOrganisation.salesOrg.getOrCrash(),
            selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            selectedShipToCode: fakeShipToInfo.shipToCustomerCode,
          ),
        ).thenAnswer((_) async => stockInfoList);

        final result = await stockInfoRepository.getStockInfoList(
          materials: materialNumbers,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        );
        expect(result, Right(stockInfoList));
      });

      test('getStockInfoList remote failure', () async {
        when(() => config.appFlavor).thenReturn(Flavor.uat);

        when(
          () => remoteDataSource.getMaterialStockInfoList(
            materialNumbers:
                materialNumbers.map((e) => e.getOrDefaultValue('')).toList(),
            salesOrg: fakeMYSalesOrganisation.salesOrg.getOrCrash(),
            selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            selectedShipToCode: fakeShipToInfo.shipToCustomerCode,
          ),
        ).thenThrow(StockInfoException());

        final result = await stockInfoRepository.getStockInfoList(
          materials: materialNumbers,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(StockInfoException())),
        );
      });
    });

    group('getStockInfo test - ', () {
      test('getStockInfo local success', () async {
        when(() => config.appFlavor).thenReturn(Flavor.mock);

        when(() => localDataSource.getMaterialStockInfoList())
            .thenAnswer((_) async => stockInfoList);

        final result = await stockInfoRepository.getStockInfo(
          materialNumber: materialNumbers.first,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        );
        expect(result, Right(stockInfoList.first.stockInfos.first));
      });

      test('getStockInfo local failure', () async {
        when(() => config.appFlavor).thenReturn(Flavor.mock);

        when(() => localDataSource.getMaterialStockInfoList()).thenThrow(error);

        final result = await stockInfoRepository.getStockInfo(
          materialNumber: materialNumbers.first,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        );
        expect(result, Left(FailureHandler.handleFailure(error)));
      });

      test('getStockInfo remote success with empty data', () async {
        when(() => config.appFlavor).thenReturn(Flavor.uat);

        when(
          () => remoteDataSource.getMaterialStockInfoList(
            materialNumbers: [materialNumbers.first.getOrDefaultValue('')],
            salesOrg: fakeMYSalesOrganisation.salesOrg.getOrCrash(),
            selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            selectedShipToCode: fakeShipToInfo.shipToCustomerCode,
          ),
        ).thenAnswer((_) async => stockInfoList);

        final result = await stockInfoRepository.getStockInfo(
          materialNumber: materialNumbers.first,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        );
        expect(result, Right(StockInfo.empty()));
      });

      test('getStockInfo remote success', () async {
        when(() => config.appFlavor).thenReturn(Flavor.uat);

        when(
          () => remoteDataSource.getMaterialStockInfoList(
            materialNumbers: [
              stockInfoList.first.materialNumber.getOrDefaultValue(''),
            ],
            salesOrg: fakeMYSalesOrganisation.salesOrg.getOrCrash(),
            selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            selectedShipToCode: fakeShipToInfo.shipToCustomerCode,
          ),
        ).thenAnswer((_) async => stockInfoList);

        final result = await stockInfoRepository.getStockInfo(
          materialNumber: stockInfoList.first.materialNumber,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        );
        expect(result, Right(stockInfoList.first.stockInfos.first));
      });

      test('getStockInfo remote failure', () async {
        when(() => config.appFlavor).thenReturn(Flavor.uat);

        when(
          () => remoteDataSource.getMaterialStockInfoList(
            materialNumbers: [materialNumbers.first.getOrDefaultValue('')],
            salesOrg: fakeMYSalesOrganisation.salesOrg.getOrCrash(),
            selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            selectedShipToCode: fakeShipToInfo.shipToCustomerCode,
          ),
        ).thenThrow(StockInfoException());

        final result = await stockInfoRepository.getStockInfo(
          materialNumber: materialNumbers.first,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(StockInfoException())),
        );
      });
    });

    group('getMappedStockInfoList test - ', () {
      test('getMappedStockInfoList success with empty items', () async {
        final result = await stockInfoRepository.getMappedStockInfoList(
          items: [],
          salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        );
        expect(result, const Right(<MaterialNumber, List<StockInfo>>{}));
      });

      test('getMappedStockInfoList success', () async {
        final items = stockInfoList
            .map(
              (e) => MaterialInfo.empty()
                  .copyWith(materialNumber: e.materialNumber),
            )
            .toList();
        when(() => config.appFlavor).thenReturn(Flavor.mock);

        when(() => localDataSource.getMaterialStockInfoList())
            .thenAnswer((_) async => stockInfoList);

        final result = await stockInfoRepository.getMappedStockInfoList(
          items: items,
          salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        );
        final stockInfoMap = <MaterialNumber, List<StockInfo>>{};
        stockInfoMap.addAll(
          {
            for (final item in items)
              item.materialNumber: stockInfoList
                  .firstWhere(
                    (element) => element.materialNumber == item.materialNumber,
                    orElse: () => MaterialStockInfo.empty(),
                  )
                  .stockInfos,
          },
        );
        expect(
          result.getOrElse(() => <MaterialNumber, List<StockInfo>>{}),
          stockInfoMap,
        );
      });

      test('getMappedStockInfoList return empty if api failure', () async {
        final items = stockInfoList
            .map(
              (e) => MaterialInfo.empty()
                  .copyWith(materialNumber: e.materialNumber),
            )
            .toList();
        when(() => config.appFlavor).thenReturn(Flavor.mock);

        when(() => localDataSource.getMaterialStockInfoList()).thenThrow(error);

        final result = await stockInfoRepository.getMappedStockInfoList(
          items: items,
          salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        );
        final stockInfoMap = <MaterialNumber, List<StockInfo>>{};
        stockInfoMap.addAll(
          {
            for (final item in items) item.materialNumber: <StockInfo>[],
          },
        );
        expect(
          result.getOrElse(() => <MaterialNumber, List<StockInfo>>{}),
          stockInfoMap,
        );
      });
    });

    group('updateStockForMaterialDealBonus test - ', () {
      test('updateStockForMaterialDealBonus success', () async {
        final materials = [
          PriceAggregate.empty().copyWith(
            bonusSampleItems: [
              BonusSampleItem.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-number-1'),
              ),
              BonusSampleItem.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-number-2'),
              ),
            ],
          ),
        ];

        final stockInfoList = [
          MaterialStockInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-material-number-1'),
            stockInfos: [
              StockInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-number-1'),
              ),
            ],
          ),
          MaterialStockInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-material-number-2'),
            stockInfos: [
              StockInfo.empty(),
            ],
          ),
        ];

        final stockForMaterialDealBonus = [
          PriceAggregate.empty().copyWith(
            bonusSampleItems: [
              BonusSampleItem.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-number-1'),
                stockInfo: StockInfo.empty().copyWith(
                  materialNumber: MaterialNumber('fake-material-number-1'),
                ),
              ),
              BonusSampleItem.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-number-2'),
                stockInfo: StockInfo.empty(),
              ),
            ],
          ),
        ];

        when(() => config.appFlavor).thenReturn(Flavor.mock);

        when(() => localDataSource.getMaterialStockInfoList())
            .thenAnswer((_) async => stockInfoList);

        final result =
            await stockInfoRepository.updateStockForMaterialDealBonus(
          materials: materials,
          salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        );

        expect(
          result.getOrElse(() => <PriceAggregate>[]),
          stockForMaterialDealBonus,
        );
      });
    });
  });
}
