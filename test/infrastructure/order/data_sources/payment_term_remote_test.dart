import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/payment_term_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class PaymentTermMock extends Mock implements PaymentTerm {}

void main() {
  late PaymentTermsRemoteDataSource remoteDataSource;
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
      remoteDataSource = PaymentTermsRemoteDataSource(
        httpService: service,
        config: Config(),
        payemttTermsQueryMutation: PaymentTermsQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Payment Terms',
    () {
      test('Get Payment Terms', () async {
        final variables = {
          'salesOrganisation': 'fake-salesorg',
          'language': 'fake-language',
          'basePaymentTermCode': 'fake-basePaymentTermCode',
          'soldToCustomerCode': 'fake-customercode',
          'principalCode': ['fake-principalcode'],
        };

        final res = json.decode(
          await rootBundle
              .loadString('assets/json/common/getPaymentTermsResponse.json'),
        );

        dioAdapter.onPost(
          '/api/order',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.payemttTermsQueryMutation
                .getAvailablePaymentTerm(),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getPaymentTerms(
          basePaymentTermCode: 'fake-basePaymentTermCode',
          language: 'fake-language',
          soldToCustomerCode: 'fake-customercode',
          principalCode: ['fake-principalcode'],
          salesOrganisation: 'fake-salesorg',
        );
        final finalData = res['data']['availablePaymentTerm'];

        expect(
          result,
          List.from(finalData)
              .map((e) => PaymentTermDto.fromJson(e).toDomain())
              .toList(),
        );
      });

      test('status code not equal to 200', () async {
        final variables = {
          'salesOrganisation': 'fake-salesorg',
          'language': 'fake-language',
          'basePaymentTermCode': 'fake-basePaymentTermCode',
          'soldToCustomerCode': 'fake-customercode',
          'principalCode': ['fake-principalcode'],
        };

        dioAdapter.onPost(
          '/api/order',
          (server) => server.reply(
            205,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.payemttTermsQueryMutation
                .getAvailablePaymentTerm(),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .getPaymentTerms(
          basePaymentTermCode: 'fake-basePaymentTermCode',
          language: 'fake-language',
          soldToCustomerCode: 'fake-customercode',
          principalCode: ['fake-principalcode'],
          salesOrganisation: 'fake-salesorg',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(<PaymentTermMock>[]);
        });
      });

      test('response with erroe', () async {
        final variables = {
          'salesOrganisation': 'fake-salesorg',
          'language': 'fake-language',
          'basePaymentTermCode': 'fake-basePaymentTermCode',
          'soldToCustomerCode': 'fake-customercode',
          'principalCode': ['fake-principalcode'],
        };
        dioAdapter.onPost(
          '/api/order',
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
            'query': remoteDataSource.payemttTermsQueryMutation
                .getAvailablePaymentTerm(),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .getPaymentTerms(
          basePaymentTermCode: 'fake-basePaymentTermCode',
          language: 'fake-language',
          soldToCustomerCode: 'fake-customercode',
          principalCode: ['fake-principalcode'],
          salesOrganisation: 'fake-salesorg',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(<PaymentTermMock>[]);
        });
      });
    },
  );
}
