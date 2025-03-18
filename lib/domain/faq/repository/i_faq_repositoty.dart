import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_info.dart';

abstract class IFAQInfoRepository {
  Future<Either<ApiFailure, FAQInfo>> getFAQList({
    required SalesOrg salesOrg,
    required int pageSize,
    required String after,
  });
}
