import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';

abstract class IAllCreditsAndInvoicesRepository {
  Future<Either<ApiFailure, List<CreditAndInvoiceItem>>> filterInvoices({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required AllInvoicesFilter filter,
    required int pageSize,
    required int offset,
    required bool isMarketPlace,
  });
  Future<Either<ApiFailure, List<CreditAndInvoiceItem>>> filterCredits({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required int pageSize,
    required int offset,
    required AllCreditsFilter filter,
    required bool isMarketPlace,
  });
  Future<Either<ApiFailure, List<CreditAndInvoiceItem>>> filterFullSummary({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required int pageSize,
    required int offset,
    required FullSummaryFilter filter,
    required bool isMarketPlace,
  });
}
