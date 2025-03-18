import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart';

abstract class IPaymentTermsRepository {
  Future<Either<ApiFailure, List<PaymentTerm>>> getPaymentTerms({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required PaymentCustomerInformation paymentCustomerInfo,
    required SalesOrganisationConfigs salesOrgConfig,
    required SalesRepresentativeInfo salesRepInfo,
    required Language preferredLanguage,
  });
}
