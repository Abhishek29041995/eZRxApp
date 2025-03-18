import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/error/order_exception.dart';
import 'package:ezrxmobile/domain/order/repository/i_stock_info_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';

class StockInfoRepository implements IStockInfoRepository {
  final Config config;
  final StockInfoLocalDataSource localDataSource;
  final StockInfoRemoteDataSource remoteDataSource;
  StockInfoRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Stream<bool> watchStockApiStatus() => localDataSource.stockApiStatusData;

  @override
  Future<Either<ApiFailure, List<MaterialStockInfo>>> getStockInfoList({
    required List<MaterialNumber> materials,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final stockInfoList = await localDataSource.getMaterialStockInfoList();

        return Right(stockInfoList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    } else {
      try {
        final materialList =
            materials.map((e) => e.getOrDefaultValue('')).toList();
        if (materialList.isEmpty) return const Right([]);

        final stockInfoList = await remoteDataSource.getMaterialStockInfoList(
          materialNumbers: materialList,
          salesOrg: salesOrganisation.salesOrg.getOrCrash(),
          selectedCustomerCode: customerCodeInfo.customerCodeSoldTo,
          selectedShipToCode: shipToInfo.shipToCustomerCode,
        );

        localDataSource.notifyStockApiStatusUpdated(false);

        return Right(stockInfoList);
      } catch (e) {
        if (e is StockInfoException) {
          localDataSource.notifyStockApiStatusUpdated(true);
        }

        return Left(FailureHandler.handleFailure(e));
      }
    }
  }

  @override
  Future<Either<ApiFailure, StockInfo>> getStockInfo({
    required MaterialNumber materialNumber,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final stockInfoList = await localDataSource.getMaterialStockInfoList();

        return Right(stockInfoList.first.stockInfos.first);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    } else {
      try {
        final stockInfoList = await remoteDataSource.getMaterialStockInfoList(
          materialNumbers: [materialNumber.getOrCrash()],
          salesOrg: salesOrganisation.salesOrg.getOrCrash(),
          selectedCustomerCode: customerCodeInfo.customerCodeSoldTo,
          selectedShipToCode: shipToInfo.shipToCustomerCode,
        );
        final stockInfo = stockInfoList
            .firstWhere(
              (element) => element.materialNumber == materialNumber,
              orElse: () => MaterialStockInfo.empty(),
            )
            .stockInfos
            .firstWhere(
              (element) => element.materialNumber == materialNumber,
              orElse: () => StockInfo.empty(),
            );

        localDataSource.notifyStockApiStatusUpdated(false);

        return Right(stockInfo);
      } catch (e) {
        if (e is StockInfoException) {
          localDataSource.notifyStockApiStatusUpdated(true);
        }

        return Left(FailureHandler.handleFailure(e));
      }
    }
  }

  @override
  Future<Either<ApiFailure, Map<MaterialNumber, List<StockInfo>>>>
      getMappedStockInfoList({
    required List<MaterialInfo> items,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) async {
    if (items.isEmpty) return const Right({});

    final stockInfoMap = <MaterialNumber, List<StockInfo>>{};

    final response = await getStockInfoList(
      customerCodeInfo: customerCodeInfo,
      materials: items.map((e) => e.materialNumber).toList(),
      salesOrganisation: salesOrganisation,
      shipToInfo: shipToInfo,
    );
    final stockInfo = response.fold(
      (failure) => <MaterialStockInfo>[],
      (stockInfo) => stockInfo,
    );
    stockInfoMap.addAll(
      {
        for (final item in items)
          item.materialNumber: stockInfo
              .firstWhere(
                (element) => element.materialNumber == item.materialNumber,
                orElse: () => MaterialStockInfo.empty(),
              )
              .stockInfos,
      },
    );

    return Right(stockInfoMap);
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>>
      updateStockForMaterialDealBonus({
    required List<PriceAggregate> materials,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) async {
    final materialTemp = [...materials];
    for (var i = 0; i < materialTemp.length; i++) {
      final failureOrSuccess = await getMappedStockInfoList(
        items: materialTemp[i].bonusListToMaterialInfo,
        customerCodeInfo: customerCodeInfo,
        salesOrganisationConfigs: salesOrganisationConfigs,
        salesOrganisation: salesOrganisation,
        shipToInfo: shipToInfo,
      );
      final bonusStockInfoMap = failureOrSuccess.getOrElse(() => {});
      final dealBonusWithStockInfo =
          materialTemp[i].bonusSampleItems.map((bonus) {
        final stockInfoList = bonusStockInfoMap[bonus.materialNumber] ?? [];
        if (stockInfoList.isNotEmpty) {
          final stockInfo = stockInfoList.firstWhere(
            (element) => element.materialNumber == bonus.materialNumber,
            orElse: () => StockInfo.empty(),
          );

          return bonus.copyWith(
            stockInfo: stockInfo,
          );
        }

        return bonus;
      }).toList();

      materialTemp[i] =
          materialTemp[i].copyWith(bonusSampleItems: dealBonusWithStockInfo);
    }

    return Right(materialTemp);
  }
}
