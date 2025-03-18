import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ezcs_ticket.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/repository/i_ezcs_ticket_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ezcs_ticket_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ezcs_ticket_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/submit_ticket_dto.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';

class EZCSTicketRepository implements IEZCSTicketRepository {
  final Config config;
  final EZCSTicketRemoteDataSource remoteDataSource;
  final EZCSTicketLocalDataSource localDataSource;
  final FileSystemHelper fileSystemHelper;

  EZCSTicketRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
    required this.fileSystemHelper,
  });

  @override
  Future<Either<ApiFailure, bool>> submitTicket({
    required EZCSTicket ezcsTicket,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final result = await localDataSource.submitTicket();

        return Right(result);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    final submitTicketDto = SubmitTicketDto.fromDomain(
      ezcsTicket: ezcsTicket,
      customerCodeInfo: customerCodeInfo,
      shipToInfo: shipToInfo,
    );

    try {
      final res = await remoteDataSource.submitTicket(
        files: ezcsTicket.documents
            .map(
              (e) => fileSystemHelper.toMultipartFile(
                name: e.name,
                path: e.path ?? '',
              ),
            )
            .toList(),
        formDataFields: submitTicketDto.toJson(),
      );

      return Right(res);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
