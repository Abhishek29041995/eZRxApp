import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart';
import 'package:ezrxmobile/domain/order/repository/i_payment_term_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_remote.dart';

class PaymentTermsRepository implements IPaymentTermsRepository {
  final Config config;
  final PaymentTermLocalDataSource localDataSource;
  final PaymentTermsRemoteDataSource remoteDataSource;

  PaymentTermsRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<PaymentTerm>>> getPaymentTerms({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required PaymentCustomerInformation paymentCustomerInfo,
    required SalesOrganisationConfigs salesOrgConfig,
    required SalesRepresentativeInfo salesRepInfo,
    required Language preferredLanguage,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final paymentTerms = await localDataSource.getPaymentTerms();

        return Right(paymentTerms);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final paymentTerms = await remoteDataSource.getPaymentTerms(
        salesOrganisation: salesOrganisation.salesOrg.getOrCrash(),
        soldToCustomerCode: customerCodeInfo.customerCodeSoldTo,
        basePaymentTermCode: paymentCustomerInfo.paymentTerm,
        language: preferredLanguage.languageCode,
        principalCode: salesRepInfo.uniquePrincipalNumber,
      );

      return Right(paymentTerms);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
