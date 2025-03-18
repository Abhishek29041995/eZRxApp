import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';

abstract class IArticleInfoRepository {
  Future<Either<ApiFailure, AnnouncementArticleInfo>> getArticles({
    required User user,
    required SalesOrg salesOrg,
    required int pageSize,
    required String after,
  });
}
