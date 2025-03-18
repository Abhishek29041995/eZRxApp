import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/credit_and_invoice_item_dto.dart';

class AllCreditsAndInvoicesRemoteDataSource {
  HttpService httpService;
  AllCreditsAndInvoicesQueryMutation allCreditsAndInvoicesQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  AllCreditsAndInvoicesRemoteDataSource({
    required this.httpService,
    required this.allCreditsAndInvoicesQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<CreditAndInvoiceItem>> filterInvoices({
    required String customerCode,
    required String salesOrg,
    required List<Map<String, String>> filterMap,
    String sortDirection = 'desc',
    required int offset,
    required int pageSize,
    required bool isMarketPlace,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query':
              allCreditsAndInvoicesQueryMutation.getDocumentHeaderListQuery(),
          'variables': {
            'input': {
              'customerCode': customerCode,
              'salesOrg': salesOrg,
              'first': pageSize,
              'after': offset,
              'excelFor': 'Debit',
              'allDebitItems': true,
              'orderBy': [
                {
                  'order': sortDirection,
                  'field': 'documentDate',
                },
              ],
              'filterBy': filterMap,
              if (isMarketPlace) 'isMarketPlace': isMarketPlace,
            },
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(
      res: res,
      property: 'customerDocumentHeaderV2',
    );
    final data =
        res.data['data']['customerDocumentHeaderV2']['documentHeaderList'];

    final result = <CreditAndInvoiceItem>[];
    for (final dynamic item in data) {
      result.add(CreditAndInvoiceItemDto.fromJson(item).toDomain());
    }

    return result;
  }

  Future<List<CreditAndInvoiceItem>> filterCredits({
    required String customerCode,
    required String salesOrg,
    required int offset,
    required int pageSize,
    required List<Map<String, dynamic>> filterMap,
    String sortDirection = 'desc',
    required bool isMarketPlace,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query':
              allCreditsAndInvoicesQueryMutation.getDocumentHeaderListQuery(),
          'variables': {
            'input': {
              'customerCode': customerCode,
              'salesOrg': salesOrg,
              'first': pageSize,
              'after': offset,
              'excelFor': 'Credit',
              'allCreditItems': true,
              'orderBy': [
                {
                  'order': sortDirection,
                  'field': 'documentDate',
                },
              ],
              'filterBy': filterMap,
              if (isMarketPlace) 'isMarketPlace': isMarketPlace,
            },
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(
      res: res,
      property: 'customerDocumentHeaderV2',
    );
    final data =
        res.data['data']['customerDocumentHeaderV2']['documentHeaderList'];

    final result = <CreditAndInvoiceItem>[];
    for (final dynamic item in data) {
      result.add(CreditAndInvoiceItemDto.fromJson(item).toDomain());
    }

    return result;
  }

  Future<List<CreditAndInvoiceItem>> filterFullSummary({
    required String customerCode,
    required String salesOrg,
    required int offset,
    required int pageSize,
    required List<Map<String, dynamic>> filterMap,
    String sortDirection = 'desc',
    required bool isMarketPlace,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query':
              allCreditsAndInvoicesQueryMutation.getDocumentHeaderListQuery(),
          'variables': {
            'input': {
              'customerCode': customerCode,
              'salesOrg': salesOrg,
              'first': pageSize,
              'after': offset,
              'excelFor': 'AccountSummary',
              'orderBy': [
                {
                  'order': sortDirection,
                  'field': 'documentDate',
                },
              ],
              'filterBy': filterMap,
              if (isMarketPlace) 'isMarketPlace': isMarketPlace,
            },
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(
      res: res,
      property: 'customerDocumentHeaderV2',
    );
    final data =
        res.data['data']['customerDocumentHeaderV2']['documentHeaderList'];

    final result = <CreditAndInvoiceItem>[];
    for (final dynamic item in data) {
      result.add(CreditAndInvoiceItemDto.fromJson(item).toDomain());
    }

    return result;
  }
}
