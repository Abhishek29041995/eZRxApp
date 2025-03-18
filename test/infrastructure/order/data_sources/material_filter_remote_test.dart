import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_filter_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class MaterialFilterMock extends Mock implements MaterialFilter {}

void main() {
  late MaterialFilterRemoteDataSource remoteDataSource;
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
      remoteDataSource = MaterialFilterRemoteDataSource(
        httpService: service,
        config: Config(),
        materialFilterQueryMutation: MaterialFilterQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Material Filter',
    () {
      test('Get Material Filter List', () async {
        final variables = {
          'request': {
            'Customer': 'fake-customer-code',
            'SalesOrg': 'fake-sales-org',
            'ShipTo': 'fake-shiptocode',
            'Language': 'fake-language',
            'SearchKey': '',
          },
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/get_material_filter/getMaterialFilterResponse.json'),
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
            'query': remoteDataSource.materialFilterQueryMutation
                .getMaterialFilterCategoryList(),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getFilters(
          language: 'fake-language',
          salesOrganisation: 'fake-sales-org',
          shipToCustomerCode: 'fake-shiptocode',
          soldToCustomerCode: 'fake-customer-code',
          searchKey: '',
        );
        final finalData = res['data']['GetFilterList'];

        expect(result, MaterialFilterDto.fromJson(finalData).toDomain());
      });
    },
  );
}
