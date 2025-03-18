import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/repository/i_combo_deal_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_remote.dart';

class ComboDealRepository implements IComboDealRepository {
  final Config config;
  final ComboDealRemoteDataSource remoteDataSource;
  final ComboDealLocalDataSource localDataSource;

  ComboDealRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, List<ComboDeal>>> getComboDealList({
    required SalesOrg salesOrg,
    required CustomerCodeInfo customerCode,
    required PriceComboDeal comboDealInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final comboDeals = await localDataSource.getComboDealList();

        return Right(comboDeals);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final comboDeals = await remoteDataSource.getComboDealList(
        customerCode: customerCode.customerCodeSoldTo,
        flexibleGroup: comboDealInfo.flexibleGroup.getOrCrash(),
        materialNumbers: comboDealInfo.category.values,
        salesDeal: comboDealInfo.salesDeal.getOrCrash(),
        salesOrgCode: salesOrg.getOrCrash(),
      );

      return Right(comboDeals);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, ComboDeal>> getComboDeal({
    required SalesOrg salesOrg,
    required CustomerCodeInfo customerCode,
    required PriceComboDeal comboDealInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final comboDeal = await localDataSource.getComboDeal();

        return Right(comboDeal);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final comboDeal = await remoteDataSource.getComboDeal(
        customerCode: customerCode.customerCodeSoldTo,
        flexibleGroup: comboDealInfo.flexibleGroup.getOrCrash(),
        salesDeal: comboDealInfo.salesDeal.getOrCrash(),
        salesOrgCode: salesOrg.getOrCrash(),
      );

      return Right(comboDeal);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
