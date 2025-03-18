import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';

import 'package:ezrxmobile/infrastructure/article_info/datasource/article_info_remote.dart';

import 'package:ezrxmobile/infrastructure/article_info/datasource/article_info_local.dart';

import 'package:ezrxmobile/domain/article_info/repository/i_article_info_repository.dart';

import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';

class ArticleInfoRepository extends IArticleInfoRepository {
  final ArticleInfoRemoteDataSource remoteDataSource;
  final ArticleInfoLocalDataSource localDataSource;
  final Config config;

  ArticleInfoRepository({
    required this.remoteDataSource,
    required this.config,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, AnnouncementArticleInfo>> getArticles({
    required User user,
    required SalesOrg salesOrg,
    required int pageSize,
    required String after,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final announcementInfo = await localDataSource.getArticles();

        return Right(announcementInfo);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final announcementInfo = salesOrg.isID
          ? await remoteDataSource.getArticleInfoIdMarket(
              announcementUrlPath: config.announcementApiUrlPath,
              template1: config.idMarketArticleTemplate1,
              template2: config.idMarketArticleTemplate2,
              pageSize: pageSize,
              variablePath: salesOrg.articleVariablePath,
              lang: salesOrg.languageCodeForHelpAndSupport,
              after: after,
            )
          : await remoteDataSource.getArticleInfo(
              announcementUrlPath: config.announcementApiUrlPath,
              template: config.articleTemplate,
              pageSize: pageSize,
              variablePath: salesOrg.articleVariablePath,
              lang: salesOrg.languageCodeForHelpAndSupport,
              after: after,
            );

      return Right(announcementInfo);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
