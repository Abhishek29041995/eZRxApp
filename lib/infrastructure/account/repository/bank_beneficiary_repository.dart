import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/account/repository/i_bank_beneficiary_repository.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_remote.dart';

class BankBeneficiaryRepository implements IBankBeneficiaryRepository {
  final Config config;
  final BankBeneficiaryRemoteDataSource remoteDataSource;
  final BankBeneficiaryLocalDataSource localDataSource;

  BankBeneficiaryRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, List<BankBeneficiary>>>
      getBankBeneficiariesBySaleOrg({
    required SalesOrg salesOrg,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final manageBeneficiary =
            await localDataSource.getBankBeneficiariesBySaleOrg();

        return Right(manageBeneficiary);
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      final manageBeneficiary =
          await remoteDataSource.getBankBeneficiariesBySaleOrg(
        salesOrg: salesOrg.getOrDefaultValue(''),
      );

      return Right(manageBeneficiary);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
