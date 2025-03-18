import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/notification_settings.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/notification_settings_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/notification_settings_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/notification_settings_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/notification_settings_response_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class OrderHistoryMock extends Mock implements OrderHistory {}

void main() {
  late NotificationSettingsRemoteDataSource remoteDataSource;
  late Config config;
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);
  late NotificationSettings fakeNotificationSettings;

  setUpAll(
    () async {
      config = Config()..appFlavor = Flavor.uat;
      locator.registerSingleton<Config>(config);
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = NotificationSettingsRemoteDataSource(
        httpService: service,
        config: Config(),
        notificationSettingsMutation: NotificationSettingsMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
      fakeNotificationSettings =
          await NotificationSettingsLocalDataSource().getNotificationSettings();
    },
  );

  group(
    'NotificationSettingsRemoteDataSource',
    () {
      test(
        'Get Notification Settings',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_notification_settings/getNotificationSettingsResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.notificationSettingsMutation
                  .getNotificationSettings(),
            }),
          );

          final result = await remoteDataSource.getNotificationSettings();

          expect(
            result,
            NotificationSettingsResponseDto.fromJson(
              res['data']['getNotificationSettings']['settings'],
            ).toDomain,
          );
        },
      );

      test(
        'Set Notification Settings',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/set_notification_settings/setNotificationSettingsResponse.json',
            ),
          );
          final variables = {
            'request': {
              'orderConfirmation':
                  fakeNotificationSettings.orderConfirmation.getOrCrash(),
              'paymentConfirmation':
                  fakeNotificationSettings.paymentConfirmation.getOrCrash(),
              'ereturnConfirmation':
                  fakeNotificationSettings.ereturnConfirmation.getOrCrash(),
            },
          };

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.notificationSettingsMutation
                  .setNotificationSettings(),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.setNotificationSettings(
            notificationSettings: fakeNotificationSettings,
          );

          expect(
            result,
            NotificationSettingsResponseDto.fromJson(
              res['data']['setNotificationSettings']['settings'],
            ).toDomain,
          );
        },
      );
    },
  );
}
