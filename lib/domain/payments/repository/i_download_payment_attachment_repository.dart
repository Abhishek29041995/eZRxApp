import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';

import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';

abstract class IDownloadPaymentAttachmentRepository {
  Future<Either<ApiFailure, DownloadPaymentAttachment>> fetchAllInvoiceUrl({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required AllInvoicesFilter queryObject,
    required bool isMarketPlace,
  });

  Future<Either<ApiFailure, DownloadPaymentAttachment>> fetchAllCreditUrl({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required AllCreditsFilter queryObject,
    required bool isMarketPlace,
  });

  Future<Either<ApiFailure, DownloadPaymentAttachment>> fetchFullSummaryUrl({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required FullSummaryFilter queryObject,
    required bool isMarketPlace,
  });

  Future<Either<ApiFailure, DownloadPaymentAttachment>> fetchPaymentSummaryUrl({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required PaymentSummaryFilter paymentSummaryFilter,
    required bool isMarketPlace,
  });

  Future<Either<ApiFailure, File>> downloadFiles({
    required DownloadPaymentAttachment files,
  });

  Future<Either<ApiFailure, File>> soaDownload({
    required SoaData soaData,
  });
  Future<Either<ApiFailure, AttachmentFileBuffer>> eCreditInvoiceDownload({
    required DownloadPaymentAttachment eCreditInvoiceUrl,
  });

  Future<Either<ApiFailure, PermissionStatus>> downloadPermission();

  Future<Either<ApiFailure, DownloadPaymentAttachment>> getECreditDownloadUrl({
    required String eCreditNumber,
  });

  Future<Either<ApiFailure, Unit>> viewSavedFile({
    required AttachmentFileBuffer savedFile,
  });
}
