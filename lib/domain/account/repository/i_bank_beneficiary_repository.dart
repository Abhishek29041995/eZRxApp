import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IBankBeneficiaryRepository {
  Future<Either<ApiFailure, List<BankBeneficiary>>>
      getBankBeneficiariesBySaleOrg({
    required SalesOrg salesOrg,
  });
}
