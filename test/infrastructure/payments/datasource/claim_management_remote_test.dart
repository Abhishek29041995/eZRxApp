import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_item.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/claim_management_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/claim_management_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/claim_item_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/principal_code_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late ClaimManagementRemoteDataSource claimManagementRemoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      claimManagementRemoteDataSource = ClaimManagementRemoteDataSource(
        httpService: service,
        config: Config(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        claimManagementQueryMutation: ClaimManagementQueryMutation(),
      );
    },
  );

  group('Claim Management Remote Data Source Test', () {
    test('getClaimSubmissions success', () async {
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/get_claim_submissions/getClaimSubmissionsResponse.json',
        ),
      );

      dioAdapter.onPost(
        '/api/ezpay',
        (server) => server.reply(
          200,
          res,
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode(
          {
            'query': claimManagementRemoteDataSource
                .claimManagementQueryMutation
                .getClaimList(),
            'variables': {
              'input': {
                'email': 'email@gmail.com',
              },
            },
          },
        ),
      );

      final result = await claimManagementRemoteDataSource.getClaimSubmissions(
        email: 'email@gmail.com',
      );

      final expectResult = <ClaimItem>[];
      for (final dynamic item in res['data']['getClaimList']) {
        expectResult.add(ClaimItemDto.fromJson(item).toDomain());
      }

      expect(
        result,
        expectResult,
      );
    });

    test('getPrincipalForSalesOrg success', () async {
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/principal_sales_org/principalForSalesOrgResponse.json',
        ),
      );

      dioAdapter.onPost(
        '/api/license',
        (server) => server.reply(
          200,
          res,
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': claimManagementRemoteDataSource.claimManagementQueryMutation
              .getPrincipalForSalesOrg(),
          'variables': {
            'salesOrg': 'fake-sales-org',
          },
        }),
      );

      final result =
          await claimManagementRemoteDataSource.getPrincipalForSalesOrg(
        salesOrg: 'fake-sales-org',
      );

      final expectResult = <PrincipalData>[];
      for (final dynamic element in (res['data']['principalForSalesOrg']
          ['principals'])) {
        expectResult.add(PrincipalCodeDto.fromJson(element).toDomain());
      }

      expect(
        result,
        expectResult,
      );
    });

    test('submitClaim success', () async {
      const claimAmount = '100';
      const customerCode = 'fakeCustomerCode';
      const claimType = 'fakeClaimType';
      const claimDetail = 'fakeClaimDetail';
      const principalCode = 'fakePrincipalCode';
      const principalName = 'fakePrincipalName';
      const email = 'fakeEmail';
      final mockFile = MultipartFile.fromBytes(
        Uint8List.fromList([1, 2, 3]),
      );
      final files = [mockFile];

      final res = json.decode(
        await rootBundle
            .loadString('assets/json/submit_claim/submitClaimResponse.json'),
      );

      final formData = FormData();
      formData.fields.add(
        MapEntry(
          'operations',
          jsonEncode({
            'query': claimManagementRemoteDataSource
                .claimManagementQueryMutation
                .submitClaim(),
            'variables': {
              'submitInput': {
                'claimAmount': claimAmount,
                'claimType': claimType,
                'customerCode': customerCode,
                'claimDetail': claimDetail,
                'principalCode': principalCode,
                'principalName': principalName,
                'email': email,
                'attachments': [null],
              },
            },
          }),
        ),
      );

      formData.fields.add(
        MapEntry(
          'map',
          jsonEncode({
            '0': ['variables.submitInput.attachments.0'],
          }),
        ),
      );
      formData.files.add(MapEntry('0', mockFile));

      dioAdapter.onPost(
        '/api/claims',
        (server) => server.reply(
          200,
          res,
        ),
        data: formData,
      );

      final result = await claimManagementRemoteDataSource.submitClaim(
        claimAmount: claimAmount,
        claimDetail: claimDetail,
        claimType: claimType,
        principalCode: principalCode,
        principalName: principalName,
        customerCode: customerCode,
        email: email,
        files: files,
      );

      expect(
        result,
        res['data']['submitClaim']['success'],
      );
    });
  });
}
