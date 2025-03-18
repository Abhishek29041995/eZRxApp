import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/bank_beneficiary_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class BankBeneficiaryMock extends Mock implements BankBeneficiary {}

void main() {
  late BankBeneficiaryRemoteDataSource remoteDataSource;
  late String salesOrg;

  late Map<String, dynamic> getBankBeneficiaryBySaleOrgVariables;

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
      remoteDataSource = BankBeneficiaryRemoteDataSource(
        httpService: service,
        bankBeneficiaryQueryMutation: BankBeneficiaryQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        config: locator.get<Config>(),
      );
      salesOrg = '3050';

      getBankBeneficiaryBySaleOrgVariables = {
        'request': {'salesOrg': salesOrg},
      };
    },
  );

  group('Bank Beneficiary Remote for getBankBeneficiariesBySaleOrg', () {
    test(
      '=> Success',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/get_payment_bank_in_accounts/getPaymentBankInAccountsResponse.json',
          ),
        );

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.bankBeneficiaryQueryMutation
                .getBankBeneficiaryQuery(),
            'variables': getBankBeneficiaryBySaleOrgVariables,
          }),
        );

        final result = await remoteDataSource.getBankBeneficiariesBySaleOrg(
          salesOrg: salesOrg,
        );
        expect(
          result.length,
          List.from(res['data']['bankBeneficiary'])
              .map((e) => BankBeneficiaryDto.fromJson(e).toDomain())
              .toList()
              .length,
        );
      },
    );

    test(
      '=> Failure',
      () async {
        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            204,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.bankBeneficiaryQueryMutation
                .getBankBeneficiaryQuery(),
            'variables': getBankBeneficiaryBySaleOrgVariables,
          }),
        );

        await remoteDataSource
            .getBankBeneficiariesBySaleOrg(
          salesOrg: salesOrg,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(<BankBeneficiaryMock>[]);
        });
      },
    );
  });
}
