import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';

abstract class ICreditAndInvoiceDetailsRepository {
  Future<Either<ApiFailure, List<CustomerDocumentDetail>>>
      getCreditAndInvoiceDetails({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required CreditAndInvoiceItem creditAndInvoiceItem,
    required bool isMarketPlace,
  });
}
