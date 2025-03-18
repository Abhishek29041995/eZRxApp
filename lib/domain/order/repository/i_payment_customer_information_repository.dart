import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';

abstract class IPaymentCustomerInformationRepository {
  Future<Either<ApiFailure, PaymentCustomerInformation>>
      getPaymentCustomerInformation({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  });
}
