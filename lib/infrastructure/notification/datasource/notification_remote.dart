import 'dart:convert';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/notification/entities/notification.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/notification/datasource/notification_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/notification/dtos/notification_dto.dart';

class NotificationRemoteDataSource {
  HttpService httpService;
  NotificationQuery notificationQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  RemoteConfigService remoteConfigService;

  NotificationRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.notificationQuery,
    required this.dataSourceExceptionHandler,
    required this.remoteConfigService,
  });

  Future<Notifications> getNotification({
    required int page,
    required int perPage,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = notificationQuery.getNotificationQuery(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
      );

      final variables = {
        'page': page,
        'perPage': perPage,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}notifications',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );

      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      return NotificationDto.fromJson(
        res.data['data']['getClevertapNotifications'],
      ).toDomain();
    });
  }

  Future<void> deleteAllNotifications() async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = notificationQuery.clearNotification();

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}notifications',
        data: jsonEncode({
          'query': queryData,
        }),
      );

      dataSourceExceptionHandler.handleExceptionChecker(res: res);
    });
  }

  Future<bool> readNotification({
    required int notificationId,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = notificationQuery.readNotification();
      final variables = {
        'notificationId': notificationId,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}notifications',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );

      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      return true;
    });
  }
}
