import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/domain/order/repository/i_payment_customer_information_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_remote_datasource.dart';

class PaymentCustomerInformationRepository
    implements IPaymentCustomerInformationRepository {
  final Config config;
  final PaymentCustomerInformationRemoteDataSource remoteDataSource;
  final PaymentCustomerInformationLocalDataSource localDataSource;

  PaymentCustomerInformationRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, PaymentCustomerInformation>>
      getPaymentCustomerInformation({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final paymentCustomerInformation =
            await localDataSource.getPaymentCustomerInformation();

        return Right(paymentCustomerInformation);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final paymentCustomerInformation =
          await remoteDataSource.getPaymentCustomerInformation(
        customer: customerCodeInfo.customerCodeSoldTo,
        salesOrganisation: salesOrganisation.salesOrg.getOrCrash(),
      );

      return Right(paymentCustomerInformation);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
