import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_code_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_code_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/usage_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class MockUsage extends Mock implements Usage {}

void main() {
  late UsageCodeRemoteDataSource usageCodeRemoteDataSource;
  late String salesOrg;
  late Map<String, Object> getUsageCodeVariables;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      usageCodeRemoteDataSource = UsageCodeRemoteDataSource(
        httpService: service,
        usageCodeQueryMutation: UsageCodeQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        config: locator.get<Config>(),
      );
      salesOrg = '2601';
      getUsageCodeVariables = {
        'variables': {
          'salesOrg': salesOrg,
        },
      };
    },
  );

  group(
    'Usage Code Remote SUCCESS',
    () {
      test(
        '=> getUsages',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_usage_list/getUsageListResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/ereturn',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': usageCodeRemoteDataSource.usageCodeQueryMutation
                  .getUsageQuery(),
              'variables': getUsageCodeVariables,
            }),
          );

          final result =
              await usageCodeRemoteDataSource.getUsages(salesOrg: salesOrg);

          expect(
            result.length,
            List.from(res['data']['usage'])
                .map((e) => UsageDto.fromJson(e).toDomain())
                .toList()
                .length,
          );
        },
      );
    },
  );

  group(
    'Usage Code Remote FAILURE',
    () {
      test(
        '=> getUsage StatusCode is not 200',
        () async {
          dioAdapter.onPost(
            '/api/ereturn',
            (server) => server.reply(
              204,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': usageCodeRemoteDataSource.usageCodeQueryMutation
                  .getUsageQuery(),
              'variables': getUsageCodeVariables,
            }),
          );

          await usageCodeRemoteDataSource
              .getUsages(salesOrg: salesOrg)
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<MockUsage>[]);
          });
        },
      );

      test(
        '=> getUsage throws an error',
        () async {
          dioAdapter.onPost(
            '/api/ereturn',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'mock-error'},
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': usageCodeRemoteDataSource.usageCodeQueryMutation
                  .getUsageQuery(),
              'variables': getUsageCodeVariables,
            }),
          );

          await usageCodeRemoteDataSource
              .getUsages(salesOrg: salesOrg)
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<MockUsage>[]);
          });
        },
      );
    },
  );
}
