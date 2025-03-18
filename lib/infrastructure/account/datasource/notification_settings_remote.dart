import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/notification_settings.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/notification_settings_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/notification_settings_response_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class NotificationSettingsRemoteDataSource {
  final NotificationSettingsMutation notificationSettingsMutation;
  final HttpService httpService;
  final Config config;
  final DataSourceExceptionHandler dataSourceExceptionHandler;

  NotificationSettingsRemoteDataSource({
    required this.notificationSettingsMutation,
    required this.httpService,
    required this.config,
    required this.dataSourceExceptionHandler,
  });

  Future<NotificationSettings> getNotificationSettings() async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = notificationSettingsMutation.getNotificationSettings();

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      final finalData = res.data['data']['getNotificationSettings']['settings'];

      return NotificationSettingsResponseDto.fromJson(finalData).toDomain;
    });
  }

  Future<NotificationSettings> setNotificationSettings({
    required NotificationSettings notificationSettings,
  }) async {
    final queryData = notificationSettingsMutation.setNotificationSettings();

    final variables = {
      'request': {
        'orderConfirmation':
            notificationSettings.orderConfirmation.getOrCrash(),
        'paymentConfirmation':
            notificationSettings.paymentConfirmation.getOrCrash(),
        'ereturnConfirmation':
            notificationSettings.ereturnConfirmation.getOrCrash(),
      },
    };

    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}license',
      data: jsonEncode({
        'query': queryData,
        'variables': variables,
      }),
    );
    dataSourceExceptionHandler.handleExceptionChecker(res: res);

    final finalData = res.data['data']['setNotificationSettings']['settings'];

    return NotificationSettingsResponseDto.fromJson(finalData).toDomain;
  }
}
