import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/banner/repository/i_banner_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_local.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_remote.dart';

class BannerRepository implements IBannerRepository {
  final Config config;
  final BannerRemoteDataSource remoteDataSource;
  final BannerLocalDataSource localDataSource;

  BannerRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, List<EZReachBanner>>> getEZReachBanner({
    required SalesOrganisation salesOrganisation,
    required String country,
    required String role,
    required String bannerType,
    required String branchCode,
    required String targetCustomerType,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final ezReachBanners =
            await localDataSource.getEZReachBanners(bannerType: bannerType);

        return Right(ezReachBanners);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final ezReachBanners = await remoteDataSource.getEZReachBanners(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        country: country,
        role: role,
        bannerType: bannerType,
        branchCode: branchCode,
        targetCustomerType: targetCustomerType,
      );

      return Right(ezReachBanners);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
