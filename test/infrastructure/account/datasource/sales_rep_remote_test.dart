import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_representative_info_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late SalesRepRemoteDataSource remoteDataSource;
  late String saleOrgName;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = SalesRepRemoteDataSource(
        httpService: service,
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        salesRepQueryMutation: SalesRepQueryMutation(),
      );
      saleOrgName = '2601';
    },
  );

  group(
    'Sales remote',
    () {
      test(
        'Get sales config details',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/get_sales_rep_info/getSalesRepInfoResponse.json'),
          );
          final data = {'userName': saleOrgName};
          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode(
              {
                'query':
                    remoteDataSource.salesRepQueryMutation.getSalesRepInfo(),
                'variables': data,
              },
            ),
          );

          final result =
              await remoteDataSource.getSalesRepInfo(userName: saleOrgName);
          final resTest = SalesRepresentativeInfoDto.fromJson(
            res['data']['salesRepresentativeInfo']['rawMetaData'],
          ).toDomain();
          expect(
            result.uniquePrincipalNumber.length,
            resTest.uniquePrincipalNumber.length,
          );
        },
      );
    },
  );

  test(
    'Get the server exception',
    () async {
      final data = {'userName': saleOrgName};

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
        data: jsonEncode(
          {
            'query': remoteDataSource.salesRepQueryMutation.getSalesRepInfo(),
            'variables': data,
          },
        ),
      );
      await remoteDataSource
          .getSalesRepInfo(userName: saleOrgName)
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(SalesRepresentativeInfo.empty());
      });
    },
  );
  test(
    'Status code != 200',
    () async {
      final data = {'userName': saleOrgName};

      dioAdapter.onPost(
        '/api/license',
        (server) => server.reply(
          201,
          {
            'data': null,
            'errors': null,
          },
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode(
          {
            'query': remoteDataSource.salesRepQueryMutation.getSalesRepInfo(),
            'variables': data,
          },
        ),
      );
      await remoteDataSource
          .getSalesRepInfo(userName: saleOrgName)
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(SalesRepresentativeInfo.empty());
      });
    },
  );
}
