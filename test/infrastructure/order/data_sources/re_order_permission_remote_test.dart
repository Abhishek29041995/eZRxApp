import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/re_order_permission_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/re_order_permission_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/re_order_permission_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late ReOrderPermissionRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat-my.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = ReOrderPermissionRemoteDataSource(
        httpService: service,
        config: Config(),
        reOrderPermissionQuery: ReOrderPermissionQuery(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'ReOrder Permission Remote DataSource',
    () {
      group('Get Permission-', () {
        test('success state', () async {
          final variables = {
            'request': {
              'materialNumberList': ['fake_mat_no_1', 'fake_mat_no_2'],
              'customerSoldToCode': 'fake_customer_code',
              'customerShipToCode': 'fake_ship_to_code',
              'salesOrganisation': 'fake_sales_org',
              'cached': false,
              'invalidateCache': false,
            },
          };
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_material_permissions/getMaterialPermissionsResponse.json',
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
              'query': remoteDataSource.reOrderPermissionQuery
                  .getReOrderPermission(),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.getPermission(
            materialNumbers: ['fake_mat_no_1', 'fake_mat_no_2'],
            customerCode: 'fake_customer_code',
            shipToCode: 'fake_ship_to_code',
            salesOrg: 'fake_sales_org',
            isSalesRepUser: false,
            userName: 'fake_user_name',
            isEnableGimmickMaterial: false,
          );

          expect(
            result,
            ReOrderPermissionDto.fromJson(
              res['data']['validCustomerMaterials'],
            ).toDomain,
          );
        });

        test('success state when isSalesRepUser is true', () async {
          final variables = {
            'request': {
              'materialNumberList': ['fake_mat_no_1', 'fake_mat_no_2'],
              'customerSoldToCode': 'fake_customer_code',
              'customerShipToCode': 'fake_ship_to_code',
              'salesOrganisation': 'fake_sales_org',
              'cached': false,
              'invalidateCache': false,
              'username': 'fake_user_name',
              'gimmickMaterial': false,
            },
          };
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_material_permissions/getMaterialPermissionsResponse.json',
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
              'query': remoteDataSource.reOrderPermissionQuery
                  .getReOrderPermission(),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.getPermission(
            materialNumbers: ['fake_mat_no_1', 'fake_mat_no_2'],
            customerCode: 'fake_customer_code',
            shipToCode: 'fake_ship_to_code',
            salesOrg: 'fake_sales_org',
            isSalesRepUser: true,
            userName: 'fake_user_name',
            isEnableGimmickMaterial: false,
          );

          expect(
            result,
            ReOrderPermissionDto.fromJson(
              res['data']['validCustomerMaterials'],
            ).toDomain,
          );
        });

        test('statuscode not equal to 200', () async {
          final variables = {
            'request': {
              'materialNumberList': ['fake_mat_no_1', 'fake_mat_no_2'],
              'customerSoldToCode': 'fake_customer_code',
              'customerShipToCode': 'fake_ship_to_code',
              'salesOrganisation': 'fake_sales_org',
              'cached': false,
              'invalidateCache': false,
            },
          };
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_material_permissions/getMaterialPermissionsResponse.json',
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
              'query': remoteDataSource.reOrderPermissionQuery
                  .getReOrderPermission(),
              'variables': variables,
            }),
          );

          await remoteDataSource.getPermission(
            materialNumbers: ['fake_mat_no_1', 'fake_mat_no_2'],
            customerCode: 'fake_customer_code',
            shipToCode: 'fake_ship_to_code',
            salesOrg: 'fake_sales_org',
            isSalesRepUser: false,
            userName: 'fake_user_name',
            isEnableGimmickMaterial: false,
          ).onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              ReOrderPermissionDto.fromJson(
                res['data']['validCustomerMaterials'],
              ).toDomain,
            );
          });
        });

        test('with error', () async {
          final variables = {
            'request': {
              'materialNumberList': ['fake_mat_no_1', 'fake_mat_no_2'],
              'customerSoldToCode': 'fake_customer_code',
              'customerShipToCode': 'fake_ship_to_code',
              'salesOrganisation': 'fake_sales_org',
              'cached': false,
              'invalidateCache': false,
            },
          };
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_material_permissions/getMaterialPermissionsResponse.json',
            ),
          );
          dioAdapter.onPost(
            '/api/license',
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
              'query': remoteDataSource.reOrderPermissionQuery
                  .getReOrderPermission(),
              'variables': variables,
            }),
          );

          await remoteDataSource.getPermission(
            materialNumbers: ['fake_mat_no_1', 'fake_mat_no_2'],
            customerCode: 'fake_customer_code',
            shipToCode: 'fake_ship_to_code',
            salesOrg: 'fake_sales_org',
            isSalesRepUser: false,
            userName: 'fake_user_name',
            isEnableGimmickMaterial: false,
          ).onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(
              ReOrderPermissionDto.fromJson(
                res['data']['validCustomerMaterials'],
              ).toDomain,
            );
          });
        });
      });
    },
  );
}
