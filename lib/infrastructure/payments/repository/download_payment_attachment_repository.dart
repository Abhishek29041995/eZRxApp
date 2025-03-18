import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';

import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_remote_datasource.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';

import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';

import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_local_datasource.dart';

import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';

import 'package:ezrxmobile/infrastructure/payments/dtos/all_invoices_filter_dto.dart';

import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';

import 'package:ezrxmobile/infrastructure/payments/dtos/all_credits_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/full_summary_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_filter_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';

import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';

import 'package:ezrxmobile/domain/payments/repository/i_download_payment_attachment_repository.dart';

class DownloadPaymentAttachmentRepository
    extends IDownloadPaymentAttachmentRepository {
  final Config config;
  final DeviceInfo deviceInfo;
  final PermissionService permissionService;
  final FileSystemHelper fileSystemHelper;
  final DownloadPaymentAttachmentLocalDataSource localDataSource;
  final DownloadPaymentAttachmentRemoteDataSource remoteDataSource;

  DownloadPaymentAttachmentRepository({
    required this.config,
    required this.localDataSource,
    required this.deviceInfo,
    required this.fileSystemHelper,
    required this.permissionService,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, DownloadPaymentAttachment>> fetchAllInvoiceUrl({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required AllInvoicesFilter queryObject,
    required bool isMarketPlace,
  }) async {
    final salesOrgCode = salesOrganization.salesOrg.getOrCrash();
    final customerCode = customerCodeInfo.customerCodeSoldTo;

    if (config.appFlavor == Flavor.mock) {
      try {
        final url = await localDataSource.getFileDownloadUrl();

        return Right(url);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final paymentSummaryStatus = await remoteDataSource.getFileDownloadUrl(
        salesOrg: salesOrgCode,
        customerCode: customerCode,
        excelFor: 'Debit',
        queryObject: AllInvoicesFilterDto.fromDomain(queryObject).toMapList,
        isMarketPlace: isMarketPlace,
      );

      return Right(paymentSummaryStatus);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, DownloadPaymentAttachment>> fetchAllCreditUrl({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required AllCreditsFilter queryObject,
    required bool isMarketPlace,
  }) async {
    final salesOrgCode = salesOrganization.salesOrg.getOrCrash();
    final customerCode = customerCodeInfo.customerCodeSoldTo;

    if (config.appFlavor == Flavor.mock) {
      try {
        final url = await localDataSource.getFileDownloadUrl();

        return Right(url);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final paymentSummaryStatus = await remoteDataSource.getFileDownloadUrl(
        salesOrg: salesOrgCode,
        customerCode: customerCode,
        excelFor: 'Credit',
        queryObject: AllCreditsFilterDto.fromDomain(queryObject).toMapList,
        isMarketPlace: isMarketPlace,
      );

      return Right(paymentSummaryStatus);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, DownloadPaymentAttachment>> fetchFullSummaryUrl({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required FullSummaryFilter queryObject,
    required bool isMarketPlace,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final url = await localDataSource.getFileDownloadUrl();

        return Right(url);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final paymentSummaryStatus = await remoteDataSource.getFileDownloadUrl(
        salesOrg: salesOrganization.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        excelFor: 'AccountSummary',
        queryObject: FullSummaryFilterDto.fromDomain(queryObject).toMapList,
        isMarketPlace: isMarketPlace,
      );

      return Right(paymentSummaryStatus);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, DownloadPaymentAttachment>> fetchPaymentSummaryUrl({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required PaymentSummaryFilter paymentSummaryFilter,
    required bool isMarketPlace,
  }) async {
    final salesOrgCode = salesOrganization.salesOrg.getOrCrash();
    final customerCode = customerCodeInfo.customerCodeSoldTo;

    if (config.appFlavor == Flavor.mock) {
      try {
        final url = await localDataSource.getPaymentSummaryFileDownloadUrl();

        return Right(url);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final paymentSummaryStatus =
          await remoteDataSource.getPaymentSummaryFileDownloadUrl(
        salesOrg: salesOrgCode,
        customerCode: customerCode,
        filterBy:
            PaymentSummaryFilterDto.fromDomain(paymentSummaryFilter).toMapList,
        isMarketPlace: isMarketPlace,
      );

      return Right(paymentSummaryStatus);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, PermissionStatus>> downloadPermission() async {
    try {
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        return const Right(PermissionStatus.granted);
      }
      if (await deviceInfo.checkIfDeviceIsAndroidWithSDK33()) {
        return const Right(PermissionStatus.granted);
      }

      final permissionStatus =
          await permissionService.requestStoragePermission();

      return permissionStatus == PermissionStatus.granted ||
              permissionStatus == PermissionStatus.limited
          ? Right(permissionStatus)
          : const Left(ApiFailure.storagePermissionFailed());
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, File>> downloadFiles({
    required DownloadPaymentAttachment files,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final localFile = await localDataSource.fileDownload();
        final downloadedFile = await fileSystemHelper.getDownloadedFile(
          localFile,
        );

        return Right(downloadedFile);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final localFile = await remoteDataSource.fileDownload(files.url);
      final downloadedFile = await fileSystemHelper.getDownloadedFile(
        localFile,
      );

      return Right(downloadedFile);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, File>> soaDownload({
    required SoaData soaData,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final localFile = await localDataSource.soaDownload();
        final downloadedFile = await fileSystemHelper.getDownloadedFile(
          localFile,
        );

        return Right(downloadedFile);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final localFile = await remoteDataSource.soaDownload(
        soaData.getOrCrash(),
      );
      final downloadedFile = await fileSystemHelper.getDownloadedFile(
        localFile,
      );

      return Right(downloadedFile);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, AttachmentFileBuffer>> eCreditInvoiceDownload({
    required DownloadPaymentAttachment eCreditInvoiceUrl,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final downloadedFile = await localDataSource.eInvoiceDownload();
        await fileSystemHelper.getDownloadedFile(downloadedFile);

        return Right(downloadedFile);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final downloadedFile = await remoteDataSource.eInvoiceDownload(
        eCreditInvoiceUrl.url,
      );
      await fileSystemHelper.getDownloadedFile(downloadedFile);

      return Right(downloadedFile);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, DownloadPaymentAttachment>> getECreditDownloadUrl({
    required String eCreditNumber,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.getECreditDownloadUrl();

        return Right(response);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final response = await remoteDataSource.getECreditDownloadUrl(
        eCreditNumber: eCreditNumber,
      );

      return Right(response);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> viewSavedFile({
    required AttachmentFileBuffer savedFile,
  }) async {
    try {
      final result = await fileSystemHelper.openFile(savedFile);
      if (result.type != ResultType.done) {
        return Left(ApiFailure.openDownloadedFileError(result.message));
      }

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
