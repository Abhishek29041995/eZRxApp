import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_information.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_code_config_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_code_search_dto.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';

class RemoteConfigServiceMock extends Mock implements RemoteConfigService {}

void main() {
  late CustomerCodeRemoteDataSource remoteDataSource;
  late String saleOrgName;
  late int pageSize;
  late bool hideCustomer;
  late String mockCustomerCode;
  final remoteConfigService = RemoteConfigServiceMock();
  const fakeMarket = 'fake-market';
  final fakeEnableMarketPlaceMarkets = [fakeMarket];
  final fakeConfigValue = fakeEnableMarketPlaceMarkets.contains(fakeMarket);

  late Map<String, Object> variables;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(
    dio: dio,
    matcher: const UrlRequestMatcher(),
  );
  final service = HttpService.mockDio(dio);
  final headers = {'Content-Type': 'application/json; charset=utf-8'};
  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      when(() => remoteConfigService.enableMarketPlaceMarkets)
          .thenReturn(fakeEnableMarketPlaceMarkets);
      remoteDataSource = CustomerCodeRemoteDataSource(
        httpService: service,
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        config: Config(),
        customerCodeQueryMutation: CustomerCodeQueryMutation(),
        remoteConfigService: remoteConfigService,
      );
      saleOrgName = '2601';
      pageSize = 20;

      hideCustomer = true;
      mockCustomerCode = '0000002610';

      variables = {
        'searchKey': mockCustomerCode,
        'salesOrganisation': '2203',
        'first': 20,
        'after': 0,
        'filterBlockCustomer': true,
      };
    },
  );

  group(
    'Customer Code',
    () {
      test(
        'get code',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_customer_information/getCustomerInformationResponse.json',
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
              'query': remoteDataSource.customerCodeQueryMutation
                  .getCustomerInfoBySearch(fakeConfigValue),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.getCustomerCodeList(
            searchKey: mockCustomerCode,
            salesOrg: '2203',
            pageSize: pageSize,
            hideCustomer: hideCustomer,
            offset: 0,
            market: fakeMarket,
          );
          expect(
            result.soldToInformation.length,
            res['data']['customerInformationSearch']['SoldToInformation']
                .length,
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
                'data': data,
                'errors': [
                  {'message': 'fake-error'},
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.customerCodeQueryMutation
                  .getCustomerInfoBySearch(fakeConfigValue),
              'variables': variables,
            }),
          );
          await remoteDataSource
              .getCustomerCodeList(
            searchKey: mockCustomerCode,
            salesOrg: '2203',
            pageSize: pageSize,
            hideCustomer: hideCustomer,
            offset: 0,
            market: fakeMarket,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(CustomerInformation.empty());
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
                'data': data,
                'errors': null,
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.customerCodeQueryMutation
                  .getCustomerInfoBySearch(fakeConfigValue),
              'variables': variables,
            }),
          );
          await remoteDataSource
              .getCustomerCodeList(
            searchKey: mockCustomerCode,
            salesOrg: '2203',
            pageSize: pageSize,
            hideCustomer: hideCustomer,
            offset: 0,
            market: fakeMarket,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(CustomerInformation.empty());
          });
        },
      );

      test(
        'Get Saved order with invalid itemlist json',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_customer_information_for_sales_rep/getCustomerInformationForSalesRepResponse.json',
            ),
          );

          final data = {
            'customerInformationSalesRepInput': {
              'salesOrganisation': '2203',
              'searchKey': mockCustomerCode,
              'filterBlockCustomer': false,
              'first': 10,
              'after': 0,
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
              'query': remoteDataSource.customerCodeQueryMutation
                  .getCustomerListForSalesRep(),
              'variables': data,
            }),
          );

          final result = await remoteDataSource.getSalesRepCustomerCodeList(
            request: CustomerCodeSearchDto(
              salesOrg: '2203',
              first: 10,
              filterBlockCustomer: hideCustomer,
              after: 0,
              searchKey: mockCustomerCode,
            ),
          );
          expect(
            result.soldToInformation.length,
            res['data']['customerInformationSalesRep']['SoldToInformation']
                .length,
          );
        },
      );

      test(
        '=> getCustomerCodeConfig',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/customer_code_config/customerCodeConfig.json',
            ),
          );

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: headers,
            data: jsonEncode({
              'query': remoteDataSource.customerCodeQueryMutation
                  .getCustomerCodeConfig(),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.getCustomerCodeConfig(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          );
          expect(
            result,
            CustomerCodeConfigDto.fromJson(res['data']['customerConfig'])
                .toDomain,
          );
        },
      );

      test(
        '=> Server exception',
        () async {
          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              {
                'data': {},
                'errors': [
                  {'message': 'fake-error'},
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: headers,
            data: jsonEncode({
              'query': remoteDataSource.customerCodeQueryMutation
                  .getCustomerCodeConfig(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getCustomerCodeConfig(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(CustomerCodeConfig.empty());
          });
        },
      );

      test(
        '=> Status code != 200',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/customer_code_config/customerCodeConfig.json',
            ),
          );

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              201,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: headers,
            data: jsonEncode({
              'query': remoteDataSource.customerCodeQueryMutation
                  .getCustomerCodeConfig(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getCustomerCodeConfig(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(CustomerCodeConfig.empty());
          });
        },
      );
    },
  );
}
