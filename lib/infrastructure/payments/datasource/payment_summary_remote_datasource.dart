import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_query.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_details_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/transaction_item_dto.dart';

class PaymentSummaryRemoteDataSource {
  HttpService httpService;
  PaymentSummaryQuery paymentSummaryQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  PaymentSummaryRemoteDataSource({
    required this.httpService,
    required this.paymentSummaryQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<PaymentSummaryDetails>> getPaymentSummary({
    required String customerCode,
    required String salesOrg,
    required List<Map<String, String>> filterList,
    required int offset,
    required int pageSize,
    required bool isMarketPlace,
  }) async {
    final queryData = paymentSummaryQuery.getPaymentSummaryQuery();
    final request = {
      'customerCode': customerCode,
      'salesOrg': salesOrg,
      'first': pageSize,
      'after': offset,
      'orderBy': [
        {'order': 'desc', 'field': 'createdDate'},
        {'order': 'desc', 'field': 'PaymentBatchAdditionalInfo'},
      ],
      'filterBy': filterList,
      if (isMarketPlace) 'isMarketPlace': isMarketPlace,
    };
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': queryData,
          'variables': {
            'request': request,
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(
      res: res,
    );
    final data = res.data['data']['customerPayment']['customerPaymentResponse'];

    return List.from(data)
        .map((e) => PaymentSummaryDetailsDto.fromJson(e).toDomain())
        .toList();
  }

  Future<List<PaymentSummaryDetails>> getTransactions({
    required Map<String, dynamic> requestParams,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = paymentSummaryQuery.getTransactions();

      final response = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ezpay',
        data: jsonEncode(
          {
            'query': queryData,
            'variables': {
              'request': requestParams,
            },
          },
        ),
      );
      dataSourceExceptionHandler.handleExceptionChecker(
        res: response,
        property: 'listTransactions',
      );

      return List<Map<String, dynamic>>.from(
        response.data['data']['listTransactions']['TxnSummary'],
      ).map((e) => TransactionItemDto.fromJson(e).toDomain()).toList();
    });
  }
}
