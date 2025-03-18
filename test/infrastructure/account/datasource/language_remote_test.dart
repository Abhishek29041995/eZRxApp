import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/language_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/language_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/update_language_response_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late LanguageRemoteDataSource remoteDataSource;
  late Config config;
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      config = Config()..appFlavor = Flavor.uat;
      locator.registerSingleton<Config>(config);
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = LanguageRemoteDataSource(
        httpService: service,
        config: Config(),
        languageMutation: LanguageMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Language Remote DataSource',
    () {
      test('change Language', () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/update_language_and_holiday/updateLanguageAndHolidayResponse.json',
          ),
        );
        final variables = {
          'request': {
            'input': {
              'Language': 'EN',
              'Holiday': {
                'monday': false,
                'tuesday': false,
                'wednesday': false,
                'thursday': false,
                'friday': false,
                'saturday': false,
                'sunday': true,
              },
            },
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
            'query': remoteDataSource.languageMutation.changeLanguage(),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.changeLanguage('EN');

        expect(
          result,
          UpdateLanguageResponseDto.fromJson(
            res['data']['updateLanguageAndHoliday'],
          ).toDomain,
        );
      });
    },
  );
}
