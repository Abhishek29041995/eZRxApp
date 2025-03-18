import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_info.dart';
import 'package:ezrxmobile/domain/faq/repository/i_faq_repositoty.dart';
import 'package:ezrxmobile/infrastructure/faq/datasource/faq_local.dart';
import 'package:ezrxmobile/infrastructure/faq/datasource/faq_remote.dart';

class FAQInfoRepository extends IFAQInfoRepository {
  final FAQInfoRemoteDataSource remoteDataSource;
  final FAQInfoLocalDataSource localDataSource;
  final Config config;

  FAQInfoRepository({
    required this.remoteDataSource,
    required this.config,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, FAQInfo>> getFAQList({
    required SalesOrg salesOrg,
    required int pageSize,
    required String after,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final faqInfo = await localDataSource.getFAQInfo(salesOrg.country);

        return Right(faqInfo);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final announcementInfo = await remoteDataSource.getFAQInfo(
        announcementUrlPath: config.announcementApiUrlPath,
        template: config.faqTemplate,
        pageSize: pageSize,
        variablePath: salesOrg.faqVariablePath,
        lang: salesOrg.languageCodeForHelpAndSupport,
        after: after,
      );

      if (announcementInfo.isFaqListEmpty) {
        return getFAQStaticList(salesOrg: salesOrg);
      }

      return Right(announcementInfo);
    } catch (e) {
      return getFAQStaticList(salesOrg: salesOrg);
    }
  }

  Future<Either<ApiFailure, FAQInfo>> getFAQStaticList({
    required SalesOrg salesOrg,
  }) async {
    try {
      final staticFaqInfo = await localDataSource.getFAQInfo(
        salesOrg.country,
      );

      final updatedFaqList = staticFaqInfo.faqList
          .map(
            (e) => e.answer.contains('baseURL')
                ? e.copyWith(
                    answer: e.answer.replaceAll(
                      'baseURL',
                      config.baseUrl(
                        marketDomain: salesOrg.country.toLowerCase(),
                      ),
                    ),
                  )
                : e,
          )
          .toList();

      return Right(staticFaqInfo.copyWith(faqList: updatedFaqList));
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
