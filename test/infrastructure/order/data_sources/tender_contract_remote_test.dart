import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/tender_contract_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class TenderContractMock extends Mock implements TenderContract {}

void main() {
  late TenderContractRemoteDataSource remoteDataSource;
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
      remoteDataSource = TenderContractRemoteDataSource(
        httpService: service,
        config: Config(),
        tenderContractQuery: TenderContractQuery(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Tender Contract',
    () {
      test('Get Tender Contract Details', () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/get_tender_contract_details/getTenderContractDetailsResponse.json',
          ),
        );

        dioAdapter.onPost(
          '/api//order',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query':
                remoteDataSource.tenderContractQuery.getTenderContractDetails(),
            'variables': {
              'request': {
                'materialNumber': '1234567',
                'customerNumber': 'fake-customercode',
                'salesOrg': 'fake-salesorg',
                'shipToCustomer': 'fake-shipto',
              },
            },
          }),
        );

        final result = await remoteDataSource.getTenderContractDetails(
          materialNumber: '1234567',
          shipTo: 'fake-shipto',
          salesOrg: 'fake-salesorg',
          selectedCustomerCode: 'fake-customercode',
        );

        final finalData =
            res['data']['tenderContractDetails']['tenderContractDetails'];

        expect(
          result,
          List.from(finalData)
              .map((e) => TenderContractDto.fromJson(e).toDomain())
              .toList(),
        );
      });

      test('status not equal to 200', () async {
        dioAdapter.onPost(
          '/api//order',
          (server) => server.reply(
            205,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query':
                remoteDataSource.tenderContractQuery.getTenderContractDetails(),
            'variables': {
              'request': {
                'materialNumber': '1234567',
                'customerNumber': 'fake-customercode',
                'salesOrg': 'fake-salesorg',
                'shipToCustomer': 'fake-shipto',
              },
            },
          }),
        );

        await remoteDataSource
            .getTenderContractDetails(
          materialNumber: '1234567',
          shipTo: 'fake-shipto',
          salesOrg: 'fake-salesorg',
          selectedCustomerCode: 'fake-customercode',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(<TenderContractMock>[]);
        });
      });

      test('response with error', () async {
        dioAdapter.onPost(
          '/api//order',
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
                remoteDataSource.tenderContractQuery.getTenderContractDetails(),
            'variables': {
              'request': {
                'materialNumber': '1234567',
                'customerNumber': 'fake-customercode',
                'salesOrg': 'fake-salesorg',
                'shipToCustomer': 'fake-shipto',
              },
            },
          }),
        );

        await remoteDataSource
            .getTenderContractDetails(
          materialNumber: '1234567',
          shipTo: 'fake-shipto',
          salesOrg: 'fake-salesorg',
          selectedCustomerCode: 'fake-customercode',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(<TenderContractMock>[]);
        });
      });
    },
  );
}
