import 'dart:convert';

import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_encryption.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/error/order_exception.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_response_dto.dart';

class OrderRemoteDataSource {
  final HttpService httpService;
  final OrderQueryMutation queryMutation;
  final DataSourceExceptionHandler exceptionHandler;

  OrderRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.exceptionHandler,
  });

  Future<SubmitOrderResponse> submitOrder({
    required OrderEncryption orderEncryption,
    required bool enableMarketPlace,
  }) async {
    return await exceptionHandler.handle(() async {
      final variables = {
        'NewOrderInput': {
          'data': orderEncryption.data,
          'hash': orderEncryption.hash,
        },
      };
      final res = await httpService.request(
        method: 'POST',
        url: '/api/order',
        data: jsonEncode({
          'query': queryMutation.submitOrder(enableMarketPlace),
          'variables': variables,
        }),
      );
      exceptionHandler.handleExceptionChecker(
        res: res,
        onCustomExceptionHandler: (res) {
          if (res.data['data'] != null &&
              res.data['data'].isNotEmpty &&
              res.data['data']['submitOrder'] == null) {
            throw const OrderException.submitOrderDataIsEmpty();
          }
        },
      );

      final submitOrderResponse =
          SubmitOrderResponseDto.fromJson(res.data['data']['submitOrder']);
      _submitOrderExceptionChecker(submitOrderResponse: submitOrderResponse);

      return submitOrderResponse.toDomain();
    });
  }

  void _submitOrderExceptionChecker({
    required SubmitOrderResponseDto submitOrderResponse,
  }) {
    if (submitOrderResponse.salesDocument.isEmpty &&
        submitOrderResponse.salesDocuments.isEmpty) {
      final msg = submitOrderResponse.messages
          .map((e) => e.message)
          .toList()
          .join(', ');
      throw OtherException(message: msg);
    }
  }
}
