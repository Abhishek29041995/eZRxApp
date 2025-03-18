import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/credit_and_invoice_details_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_document_detail_dto.dart';

class CreditAndInvoiceDetailsRemoteDataSource {
  HttpService httpService;
  CreditAndInvoiceDetailsQueryMutation creditAndInvoiceDetailsQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  CreditAndInvoiceDetailsRemoteDataSource({
    required this.httpService,
    required this.creditAndInvoiceDetailsQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<CustomerDocumentDetail>> getCreditAndInvoiceDetails({
    required String customerCode,
    required String salesOrg,
    required String searchKey,
    required String fiscalYear,
    required String bpCustomerNumber,
    required String accountingDocumentItem,
    required bool isMarketPlace,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query':
              creditAndInvoiceDetailsQueryMutation.getCreditAndInvoiceDetails(),
          'variables': {
            'input': {
              'customerCode': customerCode,
              'salesOrg': salesOrg,
              'accountingDocument': searchKey,
              'fiscalYear': fiscalYear,
              'bpCustomerNumber': bpCustomerNumber,
              'accountingDocumentItem': accountingDocumentItem,
              if (isMarketPlace) 'isMarketPlace': isMarketPlace,
            },
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(
      res: res,
      property: 'customerDocumentDetails',
    );
    final data = res.data['data']['customerDocumentDetails'];
    final result = <CustomerDocumentDetail>[];
    for (final dynamic element in data) {
      result.add(CustomerDocumentDetailDto.fromJson(element).toDomain());
    }

    return result;
  }
}
