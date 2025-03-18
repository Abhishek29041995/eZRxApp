import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';

abstract class IEInvoiceRepository {
  Future<Either<ApiFailure, DownloadPaymentAttachment>> getEInvoice({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrg salesOrg,
    required String invoiceNumber,
  });
}
