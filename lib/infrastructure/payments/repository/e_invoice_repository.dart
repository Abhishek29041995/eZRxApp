import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/domain/payments/repository/i_e_invoice_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/e_invoice_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/e_invoice_remote.dart';

class EInvoiceRepository extends IEInvoiceRepository {
  final Config config;
  final EInvoiceLocalDataSource localDataSource;
  final EInvoiceRemoteDataSource remoteDataSource;

  EInvoiceRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, DownloadPaymentAttachment>> getEInvoice({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrg salesOrg,
    required String invoiceNumber,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.getEInvoice();

        return Right(response);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final response = await remoteDataSource.getEInvoice(
        invoiceNumber: invoiceNumber,
        salesOrg: salesOrg.getOrCrash(),
        country: salesOrg.country,
        soldTo: customerCodeInfo.customerCodeSoldTo,
      );

      return Right(
        response,
      );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
