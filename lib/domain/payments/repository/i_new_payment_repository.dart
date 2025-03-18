import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/create_virtual_account.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_status.dart';
import 'package:ezrxmobile/domain/payments/entities/principal_cutoffs.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_method_option.dart';

abstract class INewPaymentRepository {
  Future<Either<ApiFailure, List<CustomerOpenItem>>> getOutstandingInvoices({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required int pageSize,
    required int offset,
    required OutstandingInvoiceFilter appliedFilter,
    required SearchKey searchKey,
    required bool isMarketPlace,
  });

  Future<Either<ApiFailure, List<CustomerOpenItem>>> getAvailableCreditNotes({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required int pageSize,
    required int offset,
    required AvailableCreditFilter appliedFilter,
    required SearchKey searchKey,
    required bool isMarketPlace,
  });

  Future<Either<ApiFailure, PaymentInfo>> pay({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required List<CustomerOpenItem> customerOpenItems,
    required String paymentMethod,
    required User user,
    required ShipToInfo shipToInfo,
    required bool isMarketPlace,
  });

  Future<Either<ApiFailure, Unit>> updatePaymentGateway({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required bool isMarketPlace,
    required PaymentStatus paymentStatus,
  });

  Future<Either<ApiFailure, PaymentInvoiceInfoPdf>> getPaymentInvoiceInfoPdf({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
    required PaymentInfo paymentInfo,
    required bool isMarketPlace,
  });

  Future<Either<ApiFailure, AttachmentFileBuffer>> saveFile({
    required Uint8List pdfData,
  });

  Future<Either<ApiFailure, Unit>> viewSavedAdvice({
    required AttachmentFileBuffer savedAdvice,
  });

  Future<Either<ApiFailure, List<NewPaymentMethod>>> fetchPaymentMethods({
    required SalesOrganisation salesOrganisation,
    required bool isMarketPlace,
  });

  Future<Either<ApiFailure, CreateVirtualAccount>> createVirtualAccount({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required List<CustomerOpenItem> invoices,
    required PaymentMethodOption paymentMethodOption,
  });

  Future<Either<ApiFailure, PrincipalCutoffs>> getPrincipalCutoffs({
    required ShipToInfo shipToInfo,
  });
}
