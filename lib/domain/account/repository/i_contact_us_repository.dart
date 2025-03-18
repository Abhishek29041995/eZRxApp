import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/account/entities/contact_us.dart';

abstract class IContactUsRepository {
  Future<Either<ApiFailure, bool>> submit({
    required ContactUs contactUs,
    required AppMarket appMarket,
  });
}
