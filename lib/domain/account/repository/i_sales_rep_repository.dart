import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class ISalesRepRepository {
  Future<Either<ApiFailure, SalesRepresentativeInfo>> getSalesRepInfo({
    required User user,
  });
}
