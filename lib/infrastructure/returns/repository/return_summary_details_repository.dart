import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_summary_details_repository.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_remote.dart';

class ReturnSummaryDetailsRepository
    implements IReturnSummaryDetailsRepository {
  final Config config;
  final ReturnSummaryDetailsRequestInformationLocal
      returnRequestInformationLocalDataSource;
  final ReturnSummaryDetailsRequestInformationRemote
      returnRequestInformationRemoteDataSource;
  final DeviceStorage deviceStorage;

  ReturnSummaryDetailsRepository({
    required this.config,
    required this.returnRequestInformationLocalDataSource,
    required this.returnRequestInformationRemoteDataSource,
    required this.deviceStorage,
  });

  @override
  Future<Either<ApiFailure, RequestInformation>> getReturnInformation({
    required ReturnItem returnItem,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final returnRequestInformation =
            await returnRequestInformationLocalDataSource
                .getReturnRequestInformation();

        return Right(returnRequestInformation);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final returnRequestInformation =
          await returnRequestInformationRemoteDataSource
              .getReturnRequestInformation(
        returnRequestId: returnItem.requestId,
        invoiceId: returnItem.invoiceID,
        lineNumber: returnItem.lineNumber,
        market: deviceStorage.currentMarket(),
      );

      return Right(returnRequestInformation);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, RequestInformation>> getReturnRequestById({
    required ReturnRequestsId returnRequestId,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final returnRequestInformation =
            await returnRequestInformationLocalDataSource
                .getReturnRequestInformation();

        return Right(returnRequestInformation);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final returnRequestInformation =
          await returnRequestInformationRemoteDataSource
              .getReturnRequestInformation(
        returnRequestId: returnRequestId.requestId,
        market: deviceStorage.currentMarket(),
      );

      return Right(returnRequestInformation);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
