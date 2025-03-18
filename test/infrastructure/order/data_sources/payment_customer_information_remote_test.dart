import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_querymutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/payment_customer_information_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class PaymentCustomerInformationMock extends Mock
    implements PaymentCustomerInformation {}

void main() {
  late PaymentCustomerInformationRemoteDataSource remoteDataSource;
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
      remoteDataSource = PaymentCustomerInformationRemoteDataSource(
        httpService: service,
        config: Config(),
        paymentCustomerInformationQueryMutation:
            PaymentCustomerInformationQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Payment Customer Information',
    () {
      test('Get Payment Customer Information', () async {
        final variables = {
          'customer': 'fake-customer-code',
          'salesOrganisation': 'fake-salesorg',
        };
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/get_payment_customer_info/getPaymentCustomerInfoResponse.json',
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
            'query': remoteDataSource.paymentCustomerInformationQueryMutation
                .getPaymentCustomerInformationQuery(),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getPaymentCustomerInformation(
          customer: 'fake-customer-code',
          salesOrganisation: 'fake-salesorg',
        );
        final finalData = res['data']['customerInformation'];

        expect(
          result,
          PaymentCustomerInformationDto.fromJson(finalData).toDomain(),
        );
      });

      test('statuscode not equal to 200', () async {
        final variables = {
          'customer': 'fake-customer-code',
          'salesOrganisation': 'fake-salesorg',
        };

        dioAdapter.onPost(
          '/api/license',
          (server) => server.reply(
            205,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.paymentCustomerInformationQueryMutation
                .getPaymentCustomerInformationQuery(),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .getPaymentCustomerInformation(
          customer: 'fake-customer-code',
          salesOrganisation: 'fake-salesorg',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(PaymentCustomerInformationMock());
        });
      });

      test('response with error', () async {
        final variables = {
          'customer': 'fake-customer-code',
          'salesOrganisation': 'fake-salesorg',
        };

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
            'query': remoteDataSource.paymentCustomerInformationQueryMutation
                .getPaymentCustomerInformationQuery(),
            'variables': variables,
          }),
        );

        await remoteDataSource
            .getPaymentCustomerInformation(
          customer: 'fake-customer-code',
          salesOrganisation: 'fake-salesorg',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(PaymentCustomerInformationMock());
        });
      });
    },
  );
}
