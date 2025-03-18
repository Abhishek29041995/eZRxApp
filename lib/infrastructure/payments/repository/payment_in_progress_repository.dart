import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/repository/i_payment_in_progress_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_in_progress_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_in_progress_remote.dart';

class PaymentInProgressRepository extends IPaymentInProgressRepository {
  final Config config;
  final PaymentInProgressLocalDataSource localDataSource;
  final PaymentInProgressRemoteDataSource remoteDataSource;
  PaymentInProgressRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, StringValue>> getPaymentInProgress({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required bool isMarketPlace,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.getPaymentInProgress();

        return Right(response.first);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final response = await remoteDataSource.getPaymentInProgress(
        customerCode: customerCodeInfo.customerCodeSoldTo,
        salesOrg: salesOrganization.salesOrg.getOrCrash(),
        isMarketPlace: isMarketPlace,
      );

      return Right(
        response.firstWhere(
          (element) => element.isValid(),
          orElse: () => StringValue(''),
        ),
      );
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
