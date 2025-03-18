import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IAnnouncementArticleTagRepository {
  Future<Either<ApiFailure, List<String>>> getAnnouncementArticleTag({
    required SalesOrg salesOrg,
    required String variablePath,
  });
}
