import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_query.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_material_list_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../integration_test/core/test_locator.dart';
import '../../../common_mock_data/mock_other.dart';

class ReturnMaterialListMock extends Mock implements ReturnMaterialList {}

void main() {
  late ReturnRequestRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl:
          'https://zpprodapiportalapimgmt.apimanagement.ap1.hana.ondemand.com',
    ),
  );
  final dioAdapter = DioAdapter(
    dio: dio,
    matcher: const UrlRequestMatcher(),
  );
  final service = HttpService.mockDio(dio);
  late RemoteConfigServiceMock remoteConfigServiceMock;
  late DataSourceExceptionHandler dataSourceExceptionHandler;
  const fakeMarket = 'fake-market';
  final fakeEnableMarketPlaceMarkets = [fakeMarket];
  final fakeConfigValue = fakeEnableMarketPlaceMarkets.contains(fakeMarket);
  final fakeRequestParam = {
    'fake-request-param': 'fake-request-param',
  };

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();

      remoteConfigServiceMock = RemoteConfigServiceMock();
      locator.registerLazySingleton(() => remoteConfigServiceMock);

      dataSourceExceptionHandler = DataSourceExceptionHandler();

      when(() => remoteConfigServiceMock.enableMarketPlaceMarkets)
          .thenReturn(fakeEnableMarketPlaceMarkets);

      remoteDataSource = ReturnRequestRemoteDataSource(
        httpService: service,
        query: ReturnRequestQuery(),
        dataSourceExceptionHandler: dataSourceExceptionHandler,
        config: Config(),
        remoteConfigService: remoteConfigServiceMock,
      );
    },
  );

  group('Return List Remote Test', () {
    test(
      'searchReturnMaterials success',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/search_return_materials_v2/searchReturnMaterialsV2Response.json',
          ),
        );

        final fakeVariables = {
          'searchReturnMaterialsRequestV2': fakeRequestParam,
        };

        dioAdapter.onPost(
          '/api/ereturn',
          (server) => server.reply(
            200,
            res,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.query.searchReturnMaterials(
              fakeConfigValue,
            ),
            'variables': fakeVariables,
          }),
        );

        final result = await remoteDataSource.searchReturnMaterials(
          market: fakeMarket,
          requestParams: fakeRequestParam,
        );

        expect(
          result,
          ReturnMaterialListDto.fromJson(
            res['data']['searchReturnMaterialsV2'],
          ).toDomain(),
        );
      },
    );

    test(
      'searchReturnMaterials failure',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/search_return_materials_v2/searchReturnMaterialsV2Response.json',
          ),
        );

        final fakeVariables = {
          'searchReturnMaterialsRequestV2': fakeRequestParam,
        };

        dioAdapter.onPost(
          '/api/ereturn',
          (server) => server.reply(
            204,
            res,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.query.searchReturnMaterials(
              fakeConfigValue,
            ),
            'variables': fakeVariables,
          }),
        );

        await remoteDataSource
            .searchReturnMaterials(
          market: fakeMarket,
          requestParams: fakeRequestParam,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(ReturnMaterialList.empty());
        });
      },
    );

    test(
      'searchReturnMaterialsForSalesRep success',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/search_return_materials_sales_rep_v2/searchReturnMaterialSalesRepV2Response.json',
          ),
        );

        final variables = {
          'searchReturnMaterialsForSalesRepRequest': fakeRequestParam,
        };

        dioAdapter.onPost(
          '/api/ereturn',
          (server) => server.reply(
            200,
            res,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.query.searchReturnMaterials(
              fakeConfigValue,
            ),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.searchReturnMaterialsForSalesRep(
          market: fakeMarket,
          requestParams: fakeRequestParam,
        );

        expect(
          result,
          ReturnMaterialListDto.fromJson(
            res['data']['searchReturnMaterialsForSalesRepV2'],
          ).toDomain(),
        );
      },
    );

    test(
      'searchReturnMaterialsForSalesRep failure',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/search_return_materials_v2/searchReturnMaterialsV2Response.json',
          ),
        );

        final variables = {
          'searchReturnMaterialsRequestV2': fakeRequestParam,
        };
        variables['searchReturnMaterialsRequestV2']!
            .removeWhere((key, value) => value.toString().isEmpty);

        dioAdapter.onPost(
          '/api/ereturn',
          (server) => server.reply(
            204,
            res,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.query.searchReturnMaterials(
              fakeConfigValue,
            ),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .searchReturnMaterialsForSalesRep(
          market: fakeMarket,
          requestParams: fakeRequestParam,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(ReturnMaterialList.empty());
        });
      },
    );

    test(
      'addRequest success',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/add_request_v2/addRequestV2Response.json',
          ),
        );

        final variables = {
          'returnInput': fakeRequestParam,
        };

        dioAdapter.onPost(
          '/api/ereturn',
          (server) => server.reply(
            200,
            res,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.query.addRequest(),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.addRequest(
          requestParams: fakeRequestParam,
        );

        expect(
          result,
          res['data']['addRequestV2']['requestID'] is String
              ? res['data']['addRequestV2']['requestID']
              : '',
        );
      },
    );

    test(
      'addRequest failure',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/add_request_v2/addRequestV2Response.json',
          ),
        );

        final variables = {
          'returnInput': fakeRequestParam,
        };

        dioAdapter.onPost(
          '/api/ereturn',
          (server) => server.reply(
            204,
            res,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.query.addRequest(),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .addRequest(
          requestParams: fakeRequestParam,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value('');
        });
      },
    );
  });
}
