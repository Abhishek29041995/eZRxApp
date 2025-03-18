import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/domain/payments/repository/i_credit_and_invoice_details_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/credit_and_invoice_details_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/credit_and_invoice_details_remote.dart';

class CreditAndInvoiceDetailsRepository
    extends ICreditAndInvoiceDetailsRepository {
  final Config config;
  final CreditAndInvoiceDetailsLocalDataSource localDataSource;
  final CreditAndInvoiceDetailsRemoteDataSource remoteDataSource;
  CreditAndInvoiceDetailsRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<CustomerDocumentDetail>>>
      getCreditAndInvoiceDetails({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required CreditAndInvoiceItem creditAndInvoiceItem,
    required bool isMarketPlace,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.getCreditAndInvoiceDetails();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final response = await remoteDataSource.getCreditAndInvoiceDetails(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        bpCustomerNumber: creditAndInvoiceItem.bpCustomerNumber,
        fiscalYear: creditAndInvoiceItem.fiscalYear,
        searchKey: creditAndInvoiceItem.searchKey.getOrDefaultValue(''),
        accountingDocumentItem: creditAndInvoiceItem.accountingDocumentItem,
        isMarketPlace: isMarketPlace,
      );

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
