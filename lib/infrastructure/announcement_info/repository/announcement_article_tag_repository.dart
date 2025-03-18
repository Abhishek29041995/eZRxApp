import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/announcement_info/repository/i_announcement_article_tag_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_article_tag_local.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_article_tag_remote.dart';

class AnnouncementArticleTagRepository
    extends IAnnouncementArticleTagRepository {
  final AnnouncementArticlTagRemoteDataSource remoteDataSource;
  final AnnouncementArticleTagLocalDataSource localDataSource;
  final Config config;

  AnnouncementArticleTagRepository({
    required this.remoteDataSource,
    required this.config,
    required this.localDataSource,
  });
  @override
  Future<Either<ApiFailure, List<String>>> getAnnouncementArticleTag({
    required SalesOrg salesOrg,
    required String variablePath,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final announcementInfo =
            await localDataSource.getAnnouncementArticleTags();

        return Right(announcementInfo);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final announcementInfo =
          await remoteDataSource.getAnnouncementArticleTags(
        announcementArticleUrlPath: config.announcementApiUrlPath,
        template: config.announcementArticleTagTemplate,
        variablePath: variablePath,
        lang: salesOrg.languageCodeForHelpAndSupport,
      );

      return Right(announcementInfo);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
