import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class PriceMock extends Mock implements Price {}

void main() {
  late PriceOverrideRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat-my.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = PriceOverrideRemoteDataSource(
        httpService: service,
        config: Config(),
        priceOverrideQueryMutation: PriceOverrideQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Price Override',
    () {
      test('Get price override', () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/common/getPriceOverrideResponse.json'),
        );

        dioAdapter.onPost(
          '/api/price',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.priceOverrideQueryMutation
                .getItemPriceOverride(),
            'variables': {
              'customer': 'fake-customercode',
              'salesOrganisation': 'fake-salesorg',
              'request': [{}],
            },
          }),
        );

        final result = await remoteDataSource.getOverridePrice(
          custCode: 'fake-customercode',
          materialQuery: {},
          salesOrg: 'fake-salesorg',
        );

        final finalData = res['data']['price'];

        expect(
          result,
          List.from(makeResponseCamelCase(jsonEncode(finalData)))
              .map((e) => PriceDto.fromJson(e).toDomain())
              .toList()
              .first,
        );
      });

      test(
        '=> PriceOverride Status not 200',
        () async {
          dioAdapter.onPost(
            '/api/price',
            (server) => server.reply(
              204,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.priceOverrideQueryMutation
                  .getItemPriceOverride(),
              'variables': {
                'customer': 'fake-customercode',
                'salesOrganisation': 'fake-salesorg',
                'request': [{}],
              },
            }),
          );

          await remoteDataSource
              .getOverridePrice(
            custCode: 'fake-customercode',
            materialQuery: {},
            salesOrg: 'fake-salesorg',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(PriceMock());
          });
        },
      );

      test(
        'Result with error',
        () async {
          dioAdapter.onPost(
            '/api/price',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'},
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.priceOverrideQueryMutation
                  .getItemPriceOverride(),
              'variables': {
                'customer': 'fake-customercode',
                'salesOrganisation': 'fake-salesorg',
                'request': [{}],
              },
            }),
          );

          await remoteDataSource
              .getOverridePrice(
            custCode: 'fake-customercode',
            materialQuery: {},
            salesOrg: 'fake-salesorg',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(PriceMock());
          });
        },
      );
    },
  );
}
