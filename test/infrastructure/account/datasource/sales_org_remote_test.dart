import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_configs_dto.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class RemoteConfigServiceMock extends Mock implements RemoteConfigService {}

void main() {
  late SalesOrgRemoteDataSource remoteDataSource;
  late String saleOrgName;
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
  final fakeEnablePromotionBlacklist = ['ID'];
  const fakeEnableOrderType = true;
  const fakeEnableReferenceLength = false;
  final fakeConfigValue = fakeEnableMarketPlaceMarkets.contains(fakeMarket);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      when(() => remoteConfigService.enableMarketPlaceMarkets)
          .thenReturn(fakeEnableMarketPlaceMarkets);
      when(() => remoteConfigService.enablePromotionBlacklist)
          .thenReturn(fakeEnablePromotionBlacklist);
      when(() => remoteConfigService.enableOrderType)
          .thenReturn(fakeEnableOrderType);
      when(() => remoteConfigService.enableReferenceLength)
          .thenReturn(fakeEnableReferenceLength);
      remoteDataSource = SalesOrgRemoteDataSource(
        httpService: service,
        salesOrgQueryMutation: SalesOrgQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        remoteConfigService: remoteConfigService,
      );
      saleOrgName = '2601';
    },
  );

  group('Sales remote', () {
    test(
      'Get sales config details',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/get_sales_org_configs/getSalesOrgConfigsResponse.json',
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
            'query':
                remoteDataSource.salesOrgQueryMutation.getSalesOrgConfigsQuery(
              fakeConfigValue,
              fakeEnableOrderType,
              fakeEnableReferenceLength,
            ),
            'variables': {
              'request': {'salesOrg': saleOrgName},
            },
          }),
        );
        final result = await remoteDataSource.getConfig(
          salesOrg: saleOrgName,
          market: fakeMarket,
        );
        final resTest = SalesOrganisationConfigsDto.fromJson(
          res['data']['salesOrgConfigs'][0],
        ).toDomain();
        expect(result.enableBatchNumber, resTest.enableBatchNumber);
      },
    );
    test(
      'Get sales config details have enablePromotionBlacklist',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/get_sales_org_configs/getSalesOrgConfigsResponse.json',
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
            'query':
                remoteDataSource.salesOrgQueryMutation.getSalesOrgConfigsQuery(
              fakeConfigValue,
              fakeEnableOrderType,
              fakeEnableReferenceLength,
            ),
            'variables': {
              'request': {'salesOrg': saleOrgName},
            },
          }),
        );
        final result = await remoteDataSource.getConfig(
          salesOrg: saleOrgName,
          market: fakeMarket,
        );
        final resTest = SalesOrganisationConfigsDto.fromJson(
          res['data']['salesOrgConfigs'][0],
        ).toDomain(enablePromotionBlacklist: fakeEnablePromotionBlacklist);
        expect(result.disablePromotion, resTest.disablePromotion);
      },
    );
    test(
      'Get sales config details enablePromotionBlacklist empty',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/get_sales_org_configs/getSalesOrgConfigsResponse.json',
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
            'query':
                remoteDataSource.salesOrgQueryMutation.getSalesOrgConfigsQuery(
              fakeConfigValue,
              fakeEnableOrderType,
              fakeEnableReferenceLength,
            ),
            'variables': {
              'request': {'salesOrg': saleOrgName},
            },
          }),
        );
        final result = await remoteDataSource.getConfig(
          salesOrg: saleOrgName,
          market: fakeMarket,
        );
        expect(result.disablePromotion, false);
      },
    );
    test(
      'Get sales config details is empty',
      () async {
        final res = {
          'data': {'salesOrgConfigs': []},
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
            'query':
                remoteDataSource.salesOrgQueryMutation.getSalesOrgConfigsQuery(
              fakeConfigValue,
              fakeEnableOrderType,
              fakeEnableReferenceLength,
            ),
            'variables': {
              'request': {'salesOrg': saleOrgName},
            },
          }),
        );
        final result = await remoteDataSource.getConfig(
          salesOrg: saleOrgName,
          market: fakeMarket,
        );

        expect(result, SalesOrganisationConfigs.empty());
      },
    );

    test(
      'Get the server exception',
      () async {
        // final data = {'userName': saleOrgName};

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
            'query':
                remoteDataSource.salesOrgQueryMutation.getSalesOrgConfigsQuery(
              fakeConfigValue,
              fakeEnableOrderType,
              fakeEnableReferenceLength,
            ),
            'variables': {
              'request': {'salesOrg': saleOrgName},
            },
          }),
        );
        await remoteDataSource
            .getConfig(
          salesOrg: saleOrgName,
          market: fakeMarket,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(SalesOrganisationConfigs.empty());
        });
      },
    );
    test(
      'Status code != 200',
      () async {
        // final data = {'userName': saleOrgName};

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
          data: jsonEncode({
            'query':
                remoteDataSource.salesOrgQueryMutation.getSalesOrgConfigsQuery(
              fakeConfigValue,
              fakeEnableOrderType,
              fakeEnableReferenceLength,
            ),
            'variables': {
              'request': {'salesOrg': saleOrgName},
            },
          }),
        );
        await remoteDataSource
            .getConfig(
          salesOrg: saleOrgName,
          market: fakeMarket,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(SalesOrganisationConfigs.empty());
        });
      },
    );
  });
}
