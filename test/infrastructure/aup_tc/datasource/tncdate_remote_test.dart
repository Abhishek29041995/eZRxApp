import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/datasource/tncdate_remote.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_other.dart';

void main() {
  group('AcceptanceDateRemoteDataSource should - ', () {
    late AcceptanceDateRemoteDataSource tncRemote;
    late HttpService httpService;
    late DataSourceExceptionHandler dataSourceExceptionHandler;

    setUpAll(() {
      WidgetsFlutterBinding.ensureInitialized();
      httpService = HTTPServiceMock();
      dataSourceExceptionHandler = DataSourceExceptionHandler();
      tncRemote = AcceptanceDateRemoteDataSource(
        httpService: httpService,
        exceptionHandler: dataSourceExceptionHandler,
      );
    });
    test('return valid remote data', () async {
      when(
        () => httpService.request(method: 'GET', url: '/api/tncdate', data: {}),
      ).thenAnswer(
        (invocation) async => Response(
          statusCode: 200,
          data: {'date': '14/07/2021'},
          requestOptions: RequestOptions(
            path: '/api/tncdate',
          ),
        ),
      );
      final tncDate = await tncRemote.getAcceptanceDate();

      expect(tncDate.date.year, 2021);
      expect(tncDate.date.month, 7);
      expect(tncDate.date.day, 14);
    });

    test('handle invalid remote data', () async {
      when(
        () => httpService.request(method: 'GET', url: '/api/tncdate', data: {}),
      ).thenAnswer(
        (invocation) async => Response(
          statusCode: 200,
          data: {'date': ''},
          requestOptions: RequestOptions(
            path: '/api/tncdate',
          ),
        ),
      );
      expect(
        () async => tncRemote.getAcceptanceDate(),
        throwsA(isA<OtherException>()),
      );
    });

    test('handle invalid remote data 2', () async {
      when(
        () => httpService.request(method: 'GET', url: '/api/tncdate', data: {}),
      ).thenAnswer(
        (invocation) async => Response(
          statusCode: 200,
          data: {
            'date': null,
            'errors': [
              {'message': 'mockError'},
            ],
          },
          requestOptions: RequestOptions(
            path: '/api/tncdate',
          ),
        ),
      );
      expect(
        () async => tncRemote.getAcceptanceDate(),
        throwsA(isA<ServerException>()),
      );
    });

    test('handle invalid remote data 3', () async {
      when(
        () => httpService.request(method: 'GET', url: '/api/tncdate', data: {}),
      ).thenAnswer(
        (invocation) async => Response(
          statusCode: 400,
          data: {
            'date': {'date': '14/07/2021'},
          },
          requestOptions: RequestOptions(
            path: '/api/tncdate',
          ),
        ),
      );
      expect(
        () async => tncRemote.getAcceptanceDate(),
        throwsA(isA<ServerException>()),
      );
    });
  });
}
