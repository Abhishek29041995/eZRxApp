import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/product_detail_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/product_meta_data_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class RemoteConfigServiceMock extends Mock implements RemoteConfigService {}

void main() {
  late ProductDetailRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);
  final remoteConfigService = RemoteConfigServiceMock();
  const fakeMarket = 'fake-market';
  final fakeEnableMarketPlaceMarkets = [fakeMarket];
  final fakeConfigValue = fakeEnableMarketPlaceMarkets.contains(fakeMarket);

  setUpAll(
    () {
      when(() => remoteConfigService.enableMarketPlaceMarkets)
          .thenReturn(fakeEnableMarketPlaceMarkets);
      when(() => remoteConfigService.enableProductTypeFilter).thenReturn(true);
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = ProductDetailRemoteDataSource(
        httpService: service,
        config: Config(),
        productDetailQuery: ProductDetailQuery(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        remoteConfigService: remoteConfigService,
      );
    },
  );

  group(
    'Product Details',
    () {
      group('Fetch similar product - ', () {
        test('add salesOrg to request body', () async {
          final variables = {
            'request': {
              'Customer': 'fake-customer-code',
              'SalesOrg': 'fake-salesOrg',
              'ShipTo': 'fake-shipTo',
              'First': 4,
              'After': 0,
              'OrderByName': 'asc',
              'Language': 'EN',
              'principalCodeList': '0000102403',
              'excludeMaterialNumber': '000000000021247709',
            },
          };

          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/similar_searches/similarSearchesResponse.json',
            ),
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
              'query': remoteDataSource.productDetailQuery
                  .getSimilarProductQuery(fakeConfigValue),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.getSimilarProduct(
            customerCode: 'fake-customer-code',
            language: 'EN',
            materialNumber: '000000000021247709',
            principalCode: '0000102403',
            shipToCode: 'fake-shipTo',
            salesOrg: 'fake-salesOrg',
            market: fakeMarket,
          );

          final finalData = makeResponseCamelCase(
            jsonEncode(res['data']['GetAllProducts']['Products']),
          );

          expect(
            result,
            List.from(finalData)
                .map((e) => MaterialDto.fromJson(e).toDomain())
                .toList(),
          );
        });
        test('status code !=200', () async {
          final variables = {
            'request': {
              'Customer': 'fake-customer-code',
              'SalesOrg': 'fake-salesOrg',
              'ShipTo': 'fake-shipTo',
              'First': 4,
              'After': 0,
              'OrderByName': 'asc',
              'Language': 'EN',
              'principalCodeList': '0000102403',
              'excludeMaterialNumber': '000000000021247709',
            },
          };

          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/similar_searches/similarSearchesResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/price',
            (server) => server.reply(
              201,
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
              'query': remoteDataSource.productDetailQuery
                  .getSimilarProductQuery(fakeConfigValue),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getSimilarProduct(
            customerCode: 'fake-customer-code',
            language: 'EN',
            materialNumber: '000000000021247709',
            principalCode: '0000102403',
            shipToCode: 'fake-shipTo',
            salesOrg: 'fake-salesOrg',
            market: fakeMarket,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              List.from(
                makeResponseCamelCase(
                  jsonEncode(res['data']['GetAllProducts']['Products']),
                ),
              ).map((e) => MaterialDto.fromJson(e).toDomain()).toList(),
            );
          });
        });
        test('with error', () async {
          final variables = {
            'request': {
              'Customer': 'fake-customer-code',
              'SalesOrg': 'fake-salesOrg',
              'ShipTo': 'fake-shipTo',
              'First': 4,
              'After': 0,
              'OrderByName': 'asc',
              'Language': 'EN',
              'principalCodeList': '0000102403',
              'excludeMaterialNumber': '000000000021247709',
            },
          };

          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/similar_searches/similarSearchesResponse.json',
            ),
          );

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
              'query': remoteDataSource.productDetailQuery
                  .getSimilarProductQuery(fakeConfigValue),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getSimilarProduct(
            customerCode: 'fake-customer-code',
            language: 'EN',
            materialNumber: '000000000021247709',
            principalCode: '0000102403',
            shipToCode: 'fake-shipTo',
            salesOrg: 'fake-salesOrg',
            market: fakeMarket,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              List.from(
                makeResponseCamelCase(
                  jsonEncode(res['data']['GetAllProducts']['Products']),
                ),
              ).map((e) => MaterialDto.fromJson(e).toDomain()).toList(),
            );
          });
        });
      });

      group('Get Product Details', () {
        test('success state', () async {
          final variables = {
            'request': {
              'materialNumber': '000000000021247709',
              'language': 'EN',
              'salesOrg': 'fake-salesOrg',
              'customerCode': 'fake-customer-code',
              'shipToCode': 'fake-shipTo',
            },
          };

          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/material_details/materialDetailsResponse.json',
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
              'query': remoteDataSource.productDetailQuery.getMaterialDetails(
                fakeConfigValue,
                remoteConfigService.enableProductTypeFilter,
              ),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.getProductDetails(
            customerCode: 'fake-customer-code',
            language: 'EN',
            materialNumber: '000000000021247709',
            shipToCode: 'fake-shipTo',
            salesOrg: 'fake-salesOrg',
            market: fakeMarket,
          );
          expect(
            result,
            ProductDetailDto.fromJson(res['data']['materialDetails'])
                .toDomain(),
          );
        });

        test('status code != 200', () async {
          final variables = {
            'request': {
              'materialNumber': '000000000021247709',
              'language': 'EN',
              'salesOrg': 'fake-salesOrg',
              'customerCode': 'fake-customer-code',
              'shipToCode': 'fake-shipTo',
            },
          };

          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/material_details/materialDetailsResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              201,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.productDetailQuery.getMaterialDetails(
                fakeConfigValue,
                remoteConfigService.enableProductTypeFilter,
              ),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getProductDetails(
            customerCode: 'fake-customer-code',
            language: 'EN',
            materialNumber: '000000000021247709',
            shipToCode: 'fake-shipTo',
            salesOrg: 'fake-salesOrg',
            market: fakeMarket,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return ProductDetailDto.fromJson(res['data']['materialDetails'])
                .toDomain();
          });
        });

        test('Error state ', () async {
          final variables = {
            'request': {
              'materialNumber': '000000000021247709',
              'language': 'EN',
              'salesOrg': 'fake-salesOrg',
              'customerCode': 'fake-customer-code',
              'shipToCode': 'fake-shipTo',
            },
          };

          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/material_details/materialDetailsResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              201,
              {
                'data': null,
                'error': {
                  'message': 'fake_error',
                },
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.productDetailQuery.getMaterialDetails(
                fakeConfigValue,
                remoteConfigService.enableProductTypeFilter,
              ),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getProductDetails(
            customerCode: 'fake-customer-code',
            language: 'EN',
            materialNumber: '000000000021247709',
            shipToCode: 'fake-shipTo',
            salesOrg: 'fake-salesOrg',
            market: fakeMarket,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return ProductDetailDto.fromJson(res['data']['materialDetails'])
                .toDomain();
          });
        });
      });

      group('Get Products MetaData', () {
        test('success state', () async {
          final variables = {
            'request': {
              'materialID': ['000000000021247709'],
              'salesOrg': 'fake-salesOrg',
              'customerCode': 'fake-customer-code',
            },
          };

          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_product/getProductResponse.json',
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
              'query': remoteDataSource.productDetailQuery.getProductMetaData(),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.getProductsMetaData(
            customerCode: 'fake-customer-code',
            salesOrg: 'fake-salesOrg',
            materialIDs: ['000000000021247709'],
          );
          expect(
            result,
            ProductMetaDataDto.fromJson(res['data']['getProduct']).toDomain,
          );
        });

        test('status code != 200', () async {
          final variables = {
            'request': {
              'materialID': ['000000000021247709'],
              'salesOrg': 'fake-salesOrg',
              'customerCode': 'fake-customer-code',
            },
          };

          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_product/getProductResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              201,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.productDetailQuery.getProductMetaData(),
              'variables': variables,
            }),
          );

          await remoteDataSource.getProductsMetaData(
            customerCode: 'fake-customer-code',
            salesOrg: 'fake-salesOrg',
            materialIDs: ['000000000021247709'],
          ).onError((error, _) async {
            expect(error, isA<ServerException>());
            return ProductMetaDataDto.fromJson(res['data']['getProduct'])
                .toDomain;
          });
        });

        test('Error state ', () async {
          final variables = {
            'request': {
              'materialID': ['000000000021247709'],
              'salesOrg': 'fake-salesOrg',
              'customerCode': 'fake-customer-code',
            },
          };

          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_product/getProductResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              201,
              {
                'data': null,
                'error': {
                  'message': 'fake_error',
                },
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.productDetailQuery.getProductMetaData(),
              'variables': variables,
            }),
          );

          await remoteDataSource.getProductsMetaData(
            customerCode: 'fake-customer-code',
            salesOrg: 'fake-salesOrg',
            materialIDs: ['000000000021247709'],
          ).onError((error, _) async {
            expect(error, isA<ServerException>());
            return ProductMetaDataDto.fromJson(res['data']['getProduct'])
                .toDomain;
          });
        });
      });
    },
  );
}
