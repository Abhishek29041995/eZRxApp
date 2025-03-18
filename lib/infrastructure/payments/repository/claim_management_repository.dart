import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_item.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_submission.dart';
import 'package:ezrxmobile/domain/payments/repository/i_claim_management_repository.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/claim_management_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/claim_management_remote.dart';

class ClaimManagementRepository extends IClaimManagementRepository {
  final Config config;
  final ClaimManagementLocalDataSource localDataSource;
  final ClaimManagementRemoteDataSource remoteDataSource;
  final FileSystemHelper fileSystemHelper;
  ClaimManagementRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
    required this.fileSystemHelper,
  });

  @override
  Future<Either<ApiFailure, List<ClaimItem>>> getClaimSubmissions({
    required EmailAddress email,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.getClaimSubmissions();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final response = await remoteDataSource.getClaimSubmissions(
        email: email.getOrCrash(),
      );

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<PrincipalData>>> getPrincipalForSalesOrg({
    required SalesOrganisation salesOrganisation,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.getPrincipalForSalesOrg();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final response = await remoteDataSource.getPrincipalForSalesOrg(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
      );

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, bool>> submitClaim({
    required User user,
    required CustomerCodeInfo customerCodeInfo,
    required ClaimSubmission data,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.submitClaim();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final response = await remoteDataSource.submitClaim(
        claimAmount: data.claimAmount.toString(),
        claimType: data.claimType.data,
        customerCode: customerCodeInfo.customerCodeSoldTo,
        claimDetail: data.claimDetails,
        principalCode: data.principal.principalCode.getOrDefaultValue(''),
        principalName: data.principal.principalName.getOrDefaultValue(''),
        email: user.email.getOrDefaultValue(''),
        files: data.documents
            .map(
              (e) => fileSystemHelper.toMultipartFile(
                name: e.name,
                path: e.path ?? '',
              ),
            )
            .toList(),
      );

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
