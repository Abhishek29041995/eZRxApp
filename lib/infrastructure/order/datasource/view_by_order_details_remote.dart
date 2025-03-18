import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_dto.dart';

class ViewByOrderDetailsRemoteDataSource {
  HttpService httpService;
  ViewByOrderDetailsQueryMutation viewByOrderDetailsQueryMutation;
  Config config;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  RemoteConfigService remoteConfigService;

  ViewByOrderDetailsRemoteDataSource({
    required this.httpService,
    required this.viewByOrderDetailsQueryMutation,
    required this.config,
    required this.dataSourceExceptionHandler,
    required this.remoteConfigService,
  });

  Future<OrderHistoryDetails> getOrderHistoryDetails({
    required String language,
    required String soldTo,
    required String searchKey,
    required String salesOrg,
    required String shipTo,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = viewByOrderDetailsQueryMutation.getOrderHistoryDetails(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
      );

      final variables = {
        'searchKey': searchKey,
        'language': language,
        'soldTo': soldTo,
        'salesOrg': [salesOrg],
        'shipTo': [shipTo],
        'isDetailsPage': true,
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

      if (res.data['data']['orderHistoryV3']['orderHeaders'].isEmpty) {
        return OrderHistoryDetails.empty();
      }

      final finalData = makeResponseCamelCase(
        jsonEncode(res.data['data']['orderHistoryV3']['orderHeaders'][0]),
      );

      return OrderHistoryDetailsDto.fromJson(
        finalData,
      ).toDomain();
    });
  }

  Future<List<OrderHistoryDetails>> getOrderHistoryDetailsList({
    required String language,
    required String soldTo,
    required List<String> orderNumbers,
    required String salesOrg,
    required String shipTo,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = viewByOrderDetailsQueryMutation.getOrderHistoryDetails(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
      );

      final variables = {
        'orderNumbers': orderNumbers,
        'language': language,
        'soldTo': soldTo,
        'salesOrg': [salesOrg],
        'shipTo': [shipTo],
        'isDetailsPage': true,
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

      final rawOrderHistories = makeResponseCamelCase(
        jsonEncode(res.data['data']['orderHistoryV3']['orderHeaders']),
      );

      if (rawOrderHistories is List<dynamic>) {
        return rawOrderHistories
            .map((e) => OrderHistoryDetailsDto.fromJson(e).toDomain())
            .toList();
      }

      return <OrderHistoryDetails>[];
    });
  }
}
