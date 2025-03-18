import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/about_us/entities/about_us.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IAboutUsRepository {
  Future<Either<ApiFailure, AboutUs>> getAboutUsInfo({
    required SalesOrg salesOrg,
  });

  Future<Either<ApiFailure, AboutUs>> getAboutUsStaticInfo({
    required SalesOrg salesOrg,
  });
}
