import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/account_selector.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/repository/i_sales_org_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/account_selector_storage_dto.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/account_selector_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';

class SalesOrgRepository implements ISalesOrgRepository {
  final Config config;
  final SalesOrgRemoteDataSource remoteDataSource;
  final SalesOrgLocalDataSource localDataSource;
  final AccountSelectorStorage accountSelectorStorage;
  final DeviceStorage deviceStorage;

  SalesOrgRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
    required this.accountSelectorStorage,
    required this.deviceStorage,
  });

  @override
  Future<Either<ApiFailure, SalesOrganisationConfigs>>
      getSalesOrganisationConfigs(
    SalesOrganisation salesOrganisation,
  ) async {
    final salesOrg = salesOrganisation.salesOrg.getOrCrash();
    if (config.appFlavor == Flavor.mock) {
      try {
        final salesOrgConfigs = await localDataSource.getConfig();

        return Right(salesOrgConfigs);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final salesOrgConfigs = await remoteDataSource.getConfig(
        salesOrg: salesOrg,
        market: deviceStorage.currentMarket(),
      );

      return Right(salesOrgConfigs);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> initSalesOrgStorage() async {
    try {
      await accountSelectorStorage.init();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> storeSalesOrg({
    required String salesOrg,
  }) async {
    try {
      final accountSelectorStorageDto = await accountSelectorStorage.get();
      final accountSelector = accountSelectorStorageDto.toDomain();
      await accountSelectorStorage.set(
        accountSelectorStorageDto: AccountSelectorStorageDto.fromDomain(
          accountSelector: accountSelector.copyWith(
            salesOrg: salesOrg,
          ),
        ),
      );

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, AccountSelector>> getSalesOrg() async {
    try {
      final accountSelectorStorageDto = await accountSelectorStorage.get();

      return Right(accountSelectorStorageDto.toDomain());
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> deleteSalesOrg() async {
    try {
      await accountSelectorStorage.delete();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
