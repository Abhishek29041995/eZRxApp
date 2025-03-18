import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';

abstract class IPaymentSummaryDetailsRepository {
  Future<Either<ApiFailure, PaymentSummaryDetails>>
      fetchPaymentSummaryDetailsInfo({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required PaymentSummaryDetails details,
    required bool isMarketPlace,
  });

  Future<Either<ApiFailure, List<PaymentItem>>> fetchPaymentList({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required PaymentSummaryDetails details,
    required bool isMarketPlace,
  });

  Future<Either<ApiFailure, bool>> deletePaymentAdvice({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required PaymentSummaryDetails paymentSummaryDetails,
    required bool isMarketPlace,
  });

  Future<Either<ApiFailure, String>> cancelPaymentAdvice({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required String referenceId,
  });
}
