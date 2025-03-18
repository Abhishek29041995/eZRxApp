import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/repository/i_tender_contract_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_remote.dart';

class TenderContractRepository implements ITenderContractRepository {
  final Config config;
  final TenderContractLocalDataSource tenderContractLocalDataSource;
  final TenderContractRemoteDataSource tenderContractRemoteDataSource;

  TenderContractRepository({
    required this.config,
    required this.tenderContractLocalDataSource,
    required this.tenderContractRemoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<TenderContract>>> getTenderContractDetails({
    required MaterialNumber materialNumber,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final tenderContractDetails =
            await tenderContractLocalDataSource.getTenderContractDetails();

        return Right(tenderContractDetails);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final tenderContractDetails =
          await tenderContractRemoteDataSource.getTenderContractDetails(
        materialNumber: materialNumber.getValue(),
        salesOrg: salesOrganisation.salesOrg.getValue(),
        selectedCustomerCode: customerCodeInfo.customerCodeSoldTo,
        shipTo: shipToInfo.shipToCustomerCode,
      );

      return Right(tenderContractDetails);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Map<MaterialNumber, List<TenderContract>>>>
      getListTenderContractDetails({
    required List<MaterialNumber> materialNumbers,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) async {
    try {
      final futures = materialNumbers.map((materialNumber) async {
        final tenderContractDetail = await getTenderContractDetails(
          customerCodeInfo: customerCodeInfo,
          salesOrganisation: salesOrganisation,
          shipToInfo: shipToInfo,
          materialNumber: materialNumber,
        );

        return MapEntry(
          materialNumber,
          tenderContractDetail.getOrElse(() => []),
        );
      }).toList();

      final tenderContractDetailsMap =
          Map.fromEntries(await Future.wait(futures));

      return right(tenderContractDetailsMap);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
