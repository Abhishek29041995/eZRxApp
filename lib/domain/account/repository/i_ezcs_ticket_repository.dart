import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ezcs_ticket.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IEZCSTicketRepository {
  Future<Either<ApiFailure, bool>> submitTicket({
    required EZCSTicket ezcsTicket,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  });
}
