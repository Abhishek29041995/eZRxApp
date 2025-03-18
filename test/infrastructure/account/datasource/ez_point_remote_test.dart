import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ez_point_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ez_point_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/ez_point_token_response_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class OrderHistoryMock extends Mock implements OrderHistory {}

void main() {
  late EZPointRemoteDataSource remoteDataSource;
  late Config config;
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);
  const fakeCustomerCode = 'fake-customer-code';

  setUpAll(
    () {
      config = Config()..appFlavor = Flavor.uat;
      locator.registerSingleton<Config>(config);
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = EZPointRemoteDataSource(
        httpService: service,
        config: Config(),
        ezPointMutation: EZPointMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'EZPointRemoteDataSource',
    () {
      test('Get EzPoint Token', () async {
        final res = json.decode(
          await rootBundle.loadString('assets/json/get_EZ_point/getEZPointResponse.json'),
        );
        final variables = {
          'request': {
            'customerCode': fakeCustomerCode,
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
            'query': remoteDataSource.ezPointMutation.getTokenQuery(),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getEZPointToken(
          customerCode: fakeCustomerCode,
        );

        expect(
          result,
          EZPointTokenResponseDto.fromJson(
            res['data']['getEzPointToken'],
          ).toDomain,
        );
      });
    },
  );
}
