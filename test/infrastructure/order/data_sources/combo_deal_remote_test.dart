import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);
  final remoteDataSource = ComboDealRemoteDataSource(
    httpService: service,
    config: Config(),
    queryMutation: ComboDealQueryMutation(),
    dataSourceExceptionHandler: DataSourceExceptionHandler(),
  );
  const fakeCustomerCode = 'fake-customer-code';
  const fakeSalesOrgCode = 'fake-sales-org-code';
  final fakeMaterialNumbers = ['fake-number'];
  const fakeSalesDeal = 'fake-sales-deal';
  const fakeFlexibleGroup = 'fake-flexible-group';

  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  group(
    'Combo Deal Material',
    () {
      late dynamic fakeJson;

      final fakeQueryVariables = {
        'salesOrg': fakeSalesOrgCode,
        'customerCode': fakeCustomerCode,
        'salesDeal': fakeSalesDeal,
        'flexibleGroup': fakeFlexibleGroup,
        'validatedMatnrList': fakeMaterialNumbers,
      };

      setUpAll(() async {
        fakeJson = json.decode(
          await rootBundle.loadString(
            'assets/json/get_combo_deal_for_material/getComboDealForMaterialResponseK1.json',
          ),
        );
      });

      test(
        'Get Combo Deal List with 200 response status code',
        () async {
          final finalData = fakeJson['data']['comboDealForMaterials'];

          dioAdapter.onPost(
            '/api/price',
            (server) => server.reply(
              200,
              fakeJson,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query':
                  remoteDataSource.queryMutation.getComboDealForMaterials(),
              'variables': fakeQueryVariables,
            }),
          );

          final result = await remoteDataSource.getComboDealList(
            customerCode: fakeCustomerCode,
            salesOrgCode: fakeSalesOrgCode,
            salesDeal: fakeSalesDeal,
            flexibleGroup: fakeFlexibleGroup,
            materialNumbers: fakeMaterialNumbers,
          );

          expect(
            result,
            List.from(finalData)
                .map((e) => ComboDealDto.fromJson(e).toDomain)
                .toList(),
          );
        },
      );

      test(
        'Get Combo Deal List with error response status code',
        () async {
          dioAdapter.onPost(
            '/api/price',
            (server) => server.reply(
              204,
              {},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query':
                  remoteDataSource.queryMutation.getComboDealForMaterials(),
              'variables': fakeQueryVariables,
            }),
          );

          await remoteDataSource
              .getComboDealList(
            customerCode: fakeCustomerCode,
            salesOrgCode: fakeSalesOrgCode,
            salesDeal: fakeSalesDeal,
            flexibleGroup: fakeFlexibleGroup,
            materialNumbers: fakeMaterialNumbers,
          )
              .onError((error, _) {
            expect(error, isA<ServerException>());
            return [];
          });
        },
      );
    },
  );

  group('Combo Deal Principle', () {
    final fakeQueryVariables = {
      'salesOrg': fakeSalesOrgCode,
      'customerCode': fakeCustomerCode,
      'salesDeal': fakeSalesDeal,
      'flexibleGroup': fakeFlexibleGroup,
    };

    late dynamic fakeJson;

    setUpAll(() async {
      fakeJson = json.decode(
        await rootBundle.loadString(
          'assets/json/get_combo_deal_for_principal/getComboDealForPrincipalK5Response.json',
        ),
      );
    });

    test(
      'Get Combo Deal Principle with 200 response status code',
      () async {
        final finalData = fakeJson['data']['comboDealForPrincMatGrp'];

        dioAdapter.onPost(
          '/api/price',
          (server) => server.reply(
            200,
            fakeJson,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query':
                remoteDataSource.queryMutation.getComboDealForPrincipleGroup(),
            'variables': fakeQueryVariables,
          }),
        );

        final result = await remoteDataSource.getComboDeal(
          customerCode: fakeCustomerCode,
          salesOrgCode: fakeSalesOrgCode,
          salesDeal: fakeSalesDeal,
          flexibleGroup: fakeFlexibleGroup,
        );

        expect(
          result,
          ComboDealDto.fromJson(finalData).toDomain,
        );
      },
    );

    test(
      'Get Combo Deal Principle with error response status code',
      () async {
        dioAdapter.onPost(
          '/api/price',
          (server) => server.reply(
            204,
            {},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query':
                remoteDataSource.queryMutation.getComboDealForPrincipleGroup(),
            'variables': fakeQueryVariables,
          }),
        );

        await remoteDataSource
            .getComboDeal(
          customerCode: fakeCustomerCode,
          salesOrgCode: fakeSalesOrgCode,
          salesDeal: fakeSalesDeal,
          flexibleGroup: fakeFlexibleGroup,
        )
            .onError((error, _) {
          expect(error, isA<ServerException>());
          return ComboDeal.empty();
        });
      },
    );
  });
}
