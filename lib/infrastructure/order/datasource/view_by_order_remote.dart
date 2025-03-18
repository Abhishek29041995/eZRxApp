import 'dart:convert';
import 'dart:core';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_order_dto.dart';

class ViewByOrderRemoteDataSource {
  HttpService httpService;
  ViewByOrderDetailsQueryMutation viewByOrderQuery;
  Config config;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  RemoteConfigService remoteConfigService;

  ViewByOrderRemoteDataSource({
    required this.httpService,
    required this.viewByOrderQuery,
    required this.config,
    required this.dataSourceExceptionHandler,
    required this.remoteConfigService,
  });

  Future<ViewByOrder> getViewByOrders({
    required String soldTo,
    required int pageSize,
    required int offset,
    required String language,
    required String orderBy,
    required String sort,
    required String salesOrg,
    required String shipTo,
    required String searchKey,
    required Map<String, dynamic> filterQuery,
    required isDetailsPage,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = viewByOrderQuery.getOrderHistoryDetails(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
      );

      final variables = {
        'soldTo': soldTo,
        'first': pageSize,
        'after': offset,
        'language': language,
        'orderBy': orderBy,
        'sort': sort,
        'salesOrg': [salesOrg],
        'shipTo': [shipTo],
        'searchKey': searchKey,
        'isDetailsPage': isDetailsPage,
        ...filterQuery,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}order',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );

      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      if (res.data['data']['orderHistoryV3'].isEmpty) {
        return ViewByOrder.empty();
      }

      final finalData = makeResponseCamelCase(
        jsonEncode(res.data['data']['orderHistoryV3']),
      );

      return ViewByOrderDto.fromJson(
        finalData,
      ).toDomain();
    });
  }
}
