import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_in_progress_query.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_in_progress_dto.dart';

class PaymentInProgressRemoteDataSource {
  final HttpService httpService;
  final PaymentInProgressQuery paymentInProgressQuery;
  final Config config;
  final DataSourceExceptionHandler dataSourceExceptionHandler;

  PaymentInProgressRemoteDataSource({
    required this.httpService,
    required this.paymentInProgressQuery,
    required this.config,
    required this.dataSourceExceptionHandler,
  });

  Future<List<StringValue>> getPaymentInProgress({
    required String customerCode,
    required String salesOrg,
    required bool isMarketPlace,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ezpay',
        data: jsonEncode(
          {
            'query': paymentInProgressQuery.getPaymentInProgress(),
            'variables': {
              'request': {
                'customerCode': customerCode,
                'salesOrg': salesOrg,
                if (isMarketPlace) 'isMarketPlace': isMarketPlace,
              },
            },
          },
        ),
      );
      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      final result = res.data['data']['paymentInProgress']['results'];

      return result
          .map<StringValue>(
            (e) => PaymentInProgressDto.fromJson(e).toAmount,
          )
          .toList();
    });
  }
}
