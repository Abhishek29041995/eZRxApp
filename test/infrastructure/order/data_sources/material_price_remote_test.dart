import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class MockPrice extends Mock implements Price {}

void main() {
  late MaterialPriceRemoteDataSource remoteDataSource;
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
      remoteDataSource = MaterialPriceRemoteDataSource(
        httpService: service,
        config: Config(),
        queryMutation: MaterialPriceQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Material Price',
    () {
      test('Get Material List', () async {
        final variables = {
          'salesOrganisation': 'fake-sales-org',
          'customer': 'fake-customer-code',
          'shipToCode': 'fake-ship-to-code',
          'request': [
            {
              'MaterialNumber': 'fake_material_no',
            }
          ],
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/common/getMaterialPriceResponse.json'),
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
            'query': remoteDataSource.queryMutation.getMaterialPrice(
              false,
            ),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getMaterialPriceList(
          customerCode: 'fake-customer-code',
          materialNumbers: ['fake_material_no'],
          salesOrgCode: 'fake-sales-org',
          shipToCode: 'fake-ship-to-code',
          useNewEndpoint: false,
        );
        final priceData = res['data']['price'];

        expect(
          result,
          List.from(makeResponseCamelCase(jsonEncode(priceData)))
              .map((e) => PriceDto.fromJson(e).toDomain())
              .toList(),
        );
      });

      test('Get Material Price test', () async {
        final variables = {
          'salesOrganisation': 'fake-sales-org',
          'customer': 'fake-customer-code',
          'shipToCode': 'fake-ship-to-code',
          'request': {
            'MaterialNumber': 'fake-number',
            'salesDeal': [],
          },
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/common/getMaterialPriceResponse.json'),
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
            'query': remoteDataSource.queryMutation.getMaterialPrice(false),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getMaterialPrice(
          customerCode: 'fake-customer-code',
          materialNumber: 'fake-number',
          salesOrgCode: 'fake-sales-org',
          shipToCode: 'fake-ship-to-code',
          salesDeal: [],
          useNewEndpoint: false,
        );
        final priceData = res['data']['price'][0];

        expect(
          result,
          PriceDto.fromJson(makeResponseCamelCase(jsonEncode(priceData)))
              .toDomain(),
        );
      });

      test('Statuscode not equal to 200', () async {
        final variables = {
          'salesOrganisation': 'fake-sales-org',
          'customer': 'fake-customer-code',
          'shipToCode': 'fake-ship-to-code',
          'request': [],
        };

        dioAdapter.onPost(
          '/api/price',
          (server) => server.reply(
            204,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.queryMutation.getMaterialPrice(false),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .getMaterialPriceList(
          customerCode: 'fake-customer-code',
          materialNumbers: [],
          salesOrgCode: 'fake-sales-org',
          shipToCode: 'fake-ship-to-code',
          useNewEndpoint: false,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(<MockPrice>[]);
        });
      });

      test('response with errors', () async {
        final variables = {
          'salesOrganisation': 'fake-sales-org',
          'customer': 'fake-customer-code',
          'shipToCode': 'fake-ship-to-code',
          'request': {
            'MaterialNumber': 'fake-number',
            'salesDeal': [],
          },
        };

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
            'query': remoteDataSource.queryMutation.getMaterialPrice(false),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .getMaterialPriceList(
          customerCode: 'fake-customer-code',
          materialNumbers: [],
          salesOrgCode: 'fake-sales-org',
          shipToCode: 'fake-ship-to-code',
          useNewEndpoint: false,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(<MockPrice>[]);
        });
      });

      test('Get Material Price For ZDP5 test ', () async {
        final variables = {
          'salesOrganisation': 'fake-sales-org',
          'customer': 'fake-customer-code',
          'shipToCode': 'fake-ship-to-code',
          'request': {
            'MaterialNumber': 'fake-number',
            'exceedQty': true,
          },
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/common/getMaterialPriceResponse.json'),
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
            'query': remoteDataSource.queryMutation.getMaterialPrice(false),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getMaterialPriceForZDP5(
          customerCode: 'fake-customer-code',
          materialNumber: 'fake-number',
          salesOrgCode: 'fake-sales-org',
          shipToCode: 'fake-ship-to-code',
          exceedQty: true,
          useNewEndpoint: false,
        );
        final priceData = res['data']['price'][0];

        expect(
          result,
          PriceDto.fromJson(makeResponseCamelCase(jsonEncode(priceData)))
              .toDomain(),
        );
      });

      test('Get Material Price For ZDP5 test when price is empty', () async {
        final variables = {
          'salesOrganisation': 'fake-sales-org',
          'customer': 'fake-customer-code',
          'shipToCode': 'fake-ship-to-code',
          'request': {
            'MaterialNumber': 'fake-number',
            'exceedQty': true,
          },
        };

        dioAdapter.onPost(
          '/api/price',
          (server) => server.reply(
            200,
            {
              'data': {'price': []},
            },
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.queryMutation.getMaterialPrice(false),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getMaterialPriceForZDP5(
          customerCode: 'fake-customer-code',
          materialNumber: 'fake-number',
          salesOrgCode: 'fake-sales-org',
          shipToCode: 'fake-ship-to-code',
          exceedQty: true,
          useNewEndpoint: false,
        );

        expect(
          result,
          Price.empty(),
        );
      });

      test(
          'Get Material Price For ZDP5 response with status code not equal to 200 test',
          () async {
        final variables = {
          'salesOrganisation': 'fake-sales-org',
          'customer': 'fake-customer-code',
          'shipToCode': 'fake-ship-to-code',
          'request': {
            'MaterialNumber': 'fake-number',
            'exceedQty': true,
          },
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/common/getMaterialPriceResponse.json'),
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
            'query': remoteDataSource.queryMutation.getMaterialPrice(false),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .getMaterialPriceForZDP5(
          customerCode: 'fake-customer-code',
          materialNumber: 'fake-number',
          salesOrgCode: 'fake-sales-org',
          shipToCode: 'fake-ship-to-code',
          exceedQty: true,
          useNewEndpoint: false,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(MockPrice());
        });
      });

      test('Get Material Price For ZDP5 response with errors test', () async {
        final variables = {
          'salesOrganisation': 'fake-sales-org',
          'customer': 'fake-customer-code',
          'shipToCode': 'fake-ship-to-code',
          'request': {
            'MaterialNumber': 'fake-number',
            'exceedQty': true,
          },
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/common/getMaterialPriceResponse.json'),
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
            'query': remoteDataSource.queryMutation.getMaterialPrice(false),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .getMaterialPriceForZDP5(
          customerCode: 'fake-customer-code',
          materialNumber: 'fake-number',
          salesOrgCode: 'fake-sales-org',
          shipToCode: 'fake-ship-to-code',
          exceedQty: true,
          useNewEndpoint: false,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(MockPrice());
        });
      });
    },
  );

  group(
    'Discount Override',
    () {
      test(
        'Get Material Override Price List',
        () async {
          final variables = {
            'salesOrganisation': '',
            'customer': '',
            'request': [{}],
            'shipToCode': '',
          };
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/common/getMaterialPriceResponse.json'),
          );

          final finalData = res['data']['price'];

          dioAdapter.onPost(
            '/api/pricing',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.getMaterialPrice(false),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.getMaterialOverridePriceList(
            customerCode: '',
            materialQuery: {},
            salesOrgCode: '',
            shipToCode: '',
            useNewEndpoint: false,
          );

          expect(
            result,
            List.from(makeResponseCamelCase(jsonEncode(finalData)))
                .map((e) => PriceDto.fromJson(e).toDomain())
                .toList(),
          );
        },
      );

      test(
        'Status not 200',
        () async {
          dioAdapter.onPost(
            '/api/pricing',
            (server) => server.reply(
              204,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.getMaterialPrice(false),
              'variables': {
                'salesOrganisation': '',
                'customer': '',
                'request': [{}],
                'shipToCode': '',
              },
            }),
          );

          await remoteDataSource
              .getMaterialOverridePriceList(
            customerCode: '',
            materialQuery: {},
            salesOrgCode: '',
            shipToCode: '',
            useNewEndpoint: false,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<MockPrice>[]);
          });
        },
      );

      test(
        'response with error',
        () async {
          dioAdapter.onPost(
            '/api/pricing',
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
              'query': remoteDataSource.queryMutation.getMaterialPrice(false),
              'variables': {
                'salesOrganisation': '',
                'customer': '',
                'request': [{}],
                'shipToCode': '',
              },
            }),
          );

          await remoteDataSource
              .getMaterialOverridePriceList(
            customerCode: '',
            materialQuery: {},
            salesOrgCode: '',
            shipToCode: '',
            useNewEndpoint: false,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<MockPrice>[]);
          });
        },
      );

      test(
        'List Empty',
        () async {
          dioAdapter.onPost(
            '/api/pricing',
            (server) => server.reply(
              200,
              {
                'data': {'price': []},
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.getMaterialPrice(false),
              'variables': {
                'salesOrganisation': '',
                'customer': '',
                'request': [{}],
                'shipToCode': '',
              },
            }),
          );

          await remoteDataSource
              .getMaterialOverridePriceList(
            customerCode: '',
            materialQuery: {},
            salesOrgCode: '',
            shipToCode: '',
            useNewEndpoint: false,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<MockPrice>[]);
          });
        },
      );
    },
  );
}
