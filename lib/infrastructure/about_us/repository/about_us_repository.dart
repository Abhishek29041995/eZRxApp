import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/about_us/entities/about_us.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/about_us/repository/i_about_us_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/about_us/datasource/about_us_local.dart';
import 'package:ezrxmobile/infrastructure/about_us/datasource/about_us_remote.dart';

class AboutUsRepository extends IAboutUsRepository {
  final AboutUsLocalDataSource localDataSource;
  final AboutUsRemoteDataSource remoteDataSource;
  final Config config;
  AboutUsRepository({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.config,
  });

  @override
  Future<Either<ApiFailure, AboutUs>> getAboutUsInfo({
    required SalesOrg salesOrg,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final aboutUsInfo = await localDataSource
            .getAboutUsStaticInfo(salesOrg.aboutUsMockFile);

        return Right(aboutUsInfo);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final aboutUsInfo = await remoteDataSource.getAboutUsInfo(
        aboutUsUrlPath: config.announcementApiUrlPath,
        itemId: salesOrg.aboutUsVariablePath,
        lang: salesOrg.languageCodeForHelpAndSupport,
      );

      return Right(aboutUsInfo);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, AboutUs>> getAboutUsStaticInfo({
    required SalesOrg salesOrg,
  }) async {
    try {
      final aboutUsStaticInfo =
          await localDataSource.getAboutUsStaticInfo(salesOrg.aboutUsMockFile);

      return Right(aboutUsStaticInfo);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
