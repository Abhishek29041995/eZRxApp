import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info_details.dart';
import 'package:ezrxmobile/domain/announcement_info/repository/i_announcement_info_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_remote.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_local.dart';

class AnnouncementInfoRepository extends IAnnouncementInfoRepository {
  final AnnouncementInfoRemoteDataSource remoteDataSource;
  final AnnouncementInfoLocalDataSource localDataSource;
  final Config config;

  AnnouncementInfoRepository({
    required this.remoteDataSource,
    required this.config,
    required this.localDataSource,
  });
  @override
  Future<Either<ApiFailure, AnnouncementArticleInfo>> getAnnouncement({
    required User user,
    required SalesOrg salesOrg,
    required int pageSize,
    required String after,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final announcementInfo = await localDataSource.getAnnouncementInfo();

        return Right(announcementInfo);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final announcementInfo = await remoteDataSource.getAnnouncementInfo(
        announcementUrlPath: config.announcementApiUrlPath,
        template: config.announcementTemplate,
        vnTemplate: config.announcementVnTemplate,
        pageSize: pageSize,
        variablePath: salesOrg.announcementVariablePath,
        lang: salesOrg.languageCodeForHelpAndSupport,
        after: after,
      );

      return Right(announcementInfo);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, AnnouncementInfoDetails>> getAnnouncementDetails({
    required String announcementId,
    required SalesOrg salesOrg,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final announcementInfoDetails =
            await localDataSource.getAnnouncementInfoDetails();

        return Right(announcementInfoDetails);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final announcementInfoDetails =
          await remoteDataSource.getAnnouncementInfoDetails(
        announcementUrlPath: config.announcementApiUrlPath,
        lang: salesOrg.announcementLocale.languageCode,
        announcementId: announcementId,
      );

      return Right(announcementInfoDetails);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
