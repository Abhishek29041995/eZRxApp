import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_license_query.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_license_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_license_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

void main() {
  late CustomerLicenseRemoteDataSource remoteDataSource;
  late Config config;
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      config = Config()..appFlavor = Flavor.uat;
      locator.registerSingleton<Config>(config);
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = CustomerLicenseRemoteDataSource(
        httpService: service,
        config: Config(),
        customerLicenseQuery: CustomerLicenseQuery(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Customer License Remote DataSource',
    () {
      test('get Customer License', () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/customer_licenses/customerLicensesResponse.json'),
        );
        final variables = {
          'request': {
            'salesOrganisation': fakeSalesOrg.getOrDefaultValue(''),
            'customerCodes': [fakeCustomerCodeInfo.customerCodeSoldTo],
            'filterBlockCustomer': false,
            'first': config.pageSize,
            'after': 0,
            'orderBy': 'DESC',
            'language': 'EN',
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
            'query': remoteDataSource.customerLicenseQuery.getCustomerLicense(),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getCustomerLicense(
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          salesOrg: fakeSalesOrg.getOrDefaultValue(''),
          pageSize: config.pageSize,
          offset: 0,
          language: 'EN',
        );

        expect(
          result,
          List.from(res['data']['customerLicenses']['Licenses'])
              .map((e) => CustomerLicenseDto.fromJson(e).toDomain)
              .toList(),
        );
      });
    },
  );
}
