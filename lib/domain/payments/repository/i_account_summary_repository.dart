import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_limit.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_balance.dart';

abstract class IAccountSummaryRepository {
  Future<Either<ApiFailure, OutstandingBalance>> fetchInvoiceSummary({
    required String custCode,
    required SalesOrg salesOrg,
    required bool isMarketPlace,
  });

  Future<Either<ApiFailure, CreditLimit>> fetchCreditSummary({
    required String custCode,
    required SalesOrg salesOrg,
    required bool isMarketPlace,
  });
}
