import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class MaterialInfoMock extends Mock implements MaterialInfo {}

void main() {
  late MaterialBundleListRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

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
      remoteDataSource = MaterialBundleListRemoteDataSource(
        httpService: service,
        config: Config(),
        materialBundleQuery: MaterialBundleQuery(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Material BundleList',
    () {
      test('Get Material Bundle List', () async {
        final variables = {
          'customer': '',
          'salesOrganisation': '',
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/get_material_bundle_list/getMaterialBundleListResponse.json'),
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
            'query': remoteDataSource.materialBundleQuery
                .getCustomerMaterialBundleList(),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getMaterialBundleList(
          customerCode: '',
          salesOrganisation: '',
        );

        expect(
          result,
          List.from(
            makeResponseCamelCase(
              jsonEncode(res['data']['GetBundles']),
            ),
          ).map((e) => MaterialDto.fromJson(e).toDomain()).toList(),
        );
      });

      test('Get Material Bundle List For sales rep', () async {
        final variables = {
          'userName': 'fake-username',
          'customer': 'fake-customer-code',
          'shipToCode': 'fake-shipto-code',
          'salesOrganisation': 'fake-sales-org',
        };
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/get_material_bundle_list_for_sales_rep/getMaterialBundleListForSalesRepResponse.json',
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
            'query': remoteDataSource.materialBundleQuery
                .getSalesRepMaterialBundleList(),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getMaterialBundleListForSalesRep(
          customerCode: 'fake-customer-code',
          salesOrganisation: 'fake-sales-org',
          shipToCode: 'fake-shipto-code',
          userName: 'fake-username',
        );

        expect(
          result,
          List.from(
            makeResponseCamelCase(
              jsonEncode(res['data']['GetBundlesForSalesRep']),
            ),
          ).map((e) => MaterialDto.fromJson(e).toDomain()).toList(),
        );
      });

      test('with status code not eqal to 200', () async {
        final variables = {
          'userName': 'fake-username',
          'customer': 'fake-customer-code',
          'shipToCode': 'fake-shipto-code',
          'salesOrganisation': 'fake-sales-org',
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
            'query': remoteDataSource.materialBundleQuery
                .getSalesRepMaterialBundleList(),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .getMaterialBundleListForSalesRep(
          customerCode: 'fake-customer-code',
          salesOrganisation: 'fake-sales-org',
          shipToCode: 'fake-shipto-code',
          userName: 'fake-username',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(<MaterialInfoMock>[]);
        });
      });

      test('respponse with error', () async {
        final variables = {
          'userName': 'fake-username',
          'customer': 'fake-customer-code',
          'shipToCode': 'fake-shipto-code',
          'salesOrganisation': 'fake-sales-org',
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
            'query': remoteDataSource.materialBundleQuery
                .getSalesRepMaterialBundleList(),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .getMaterialBundleListForSalesRep(
          customerCode: 'fake-customer-code',
          salesOrganisation: 'fake-sales-org',
          shipToCode: 'fake-shipto-code',
          userName: 'fake-username',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(<MaterialInfoMock>[]);
        });
      });
    },
  );
}
