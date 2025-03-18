import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';

abstract class IReturnSummaryDetailsRepository {
  Future<Either<ApiFailure, RequestInformation>> getReturnInformation({
    required ReturnItem returnItem,
  });

  Future<Either<ApiFailure, RequestInformation>> getReturnRequestById({
    required ReturnRequestsId returnRequestId,
  });
}
