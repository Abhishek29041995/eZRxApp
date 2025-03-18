import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';

abstract class ISoaRepository {
  Future<Either<ApiFailure, List<Soa>>> fetchSoa({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrg salesOrg,
    required bool isMarketPlace,
  });
}
