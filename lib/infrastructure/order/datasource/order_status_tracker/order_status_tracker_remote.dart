import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_status_tracker_dto.dart';

class OrderStatusTrackerRemoteDataSource {
  HttpService httpService;
  OrderStatusTrackerQuery queryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  OrderStatusTrackerRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<OrderStatusTracker>> getOrderStatusTracker({
    required String invoiceNumber,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getOrderStatusTracker();
      final variables = {
        'inv': invoiceNumber,
        'sortByUpdateTimeStamp': 'DESC',
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}order',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        onCustomExceptionHandler: _orderStatusTrackerExceptionChecker,
      );
      final statusData = res.data['data']['zyllemStatusV2']['Entry'];

      return List.from(statusData)
          .map((e) => OrderStatusTrackerDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _orderStatusTrackerExceptionChecker(Response<dynamic> res) {
    if (List.from((res.data['data']?['zyllemStatusV2']?['Entry']) ?? []).isEmpty) {
      throw ServerException(message: 'Error on fetch status');
    }
  }
}
