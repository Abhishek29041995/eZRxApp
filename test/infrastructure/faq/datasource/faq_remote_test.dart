import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_info.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/faq/datasource/faq_query_mutaion.dart';
import 'package:ezrxmobile/infrastructure/faq/datasource/faq_remote.dart';
import 'package:ezrxmobile/infrastructure/faq/dtos/faq_info_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class FAQInfoMock extends Mock implements FAQInfo {}

void main() {
  late FAQInfoRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  const pageSize = 10;

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat-my.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);
  final variableData = {
    'template': '4A583EF3-A105-4A00-BC98-EC96A9967966',
    'path': '51B88D33-B26E-475D-90FC-BEFD9FF0A348',
    'pageSize': pageSize,
    'lang': 'EN',
    'after': '',
  };
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    remoteDataSource = FAQInfoRemoteDataSource(
      httpService: service,
      exceptionHandler: DataSourceExceptionHandler(),
      queryMutation: FAQInfoQueryMutation(),
    );
  });
  group('FAQ remote data source test', () {
    test('Get FAQInfo', () async {
      final res = json.decode(
        await rootBundle.loadString('assets/json/get_faq/getFAQResponse.json'),
      );

      dioAdapter.onPost(
        '/api/announcement',
        (server) => server.reply(
          200,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.queryMutation.getFAQInfoQuery(),
          'variables': variableData,
        }),
      );

      final result = await remoteDataSource.getFAQInfo(
        announcementUrlPath: '/api/announcement',
        variablePath: '51B88D33-B26E-475D-90FC-BEFD9FF0A348',
        template: '4A583EF3-A105-4A00-BC98-EC96A9967966',
        pageSize: pageSize,
        after: '',
        lang: 'EN',
      );

      expect(
        result,
        FAQInfoDto.fromJson(res['data']['search']).toDomain,
      );
    });
    test('statuscode not equal to 200', () async {
      dioAdapter.onPost(
        '/api/announcement',
        (server) => server.reply(
          205,
          {'data': []},
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.queryMutation.getFAQInfoQuery(),
          'variables': variableData,
        }),
      );

      await remoteDataSource
          .getFAQInfo(
        announcementUrlPath: '/api/announcement',
        variablePath: '51B88D33-B26E-475D-90FC-BEFD9FF0A348',
        template: '4A583EF3-A105-4A00-BC98-EC96A9967966',
        pageSize: pageSize,
        after: '',
        lang: 'EN',
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(FAQInfoMock());
      });
    });

    test('response with error', () async {
      dioAdapter.onPost(
        '/api/announcement',
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
          'query': remoteDataSource.queryMutation.getFAQInfoQuery(),
          'variables': variableData,
        }),
      );

      await remoteDataSource
          .getFAQInfo(
        announcementUrlPath: '/api/announcement',
        variablePath: '51B88D33-B26E-475D-90FC-BEFD9FF0A348',
        template: '4A583EF3-A105-4A00-BC98-EC96A9967966',
        pageSize: pageSize,
        after: '',
        lang: 'EN',
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(FAQInfoMock());
      });
    });
    test('response with others error', () async {
      dioAdapter.onPost(
        '/api/announcement',
        (other) => other.reply(
          200,
          {
            'data': {'search': null},
          },
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.queryMutation.getFAQInfoQuery(),
          'variables': variableData,
        }),
      );

      await remoteDataSource
          .getFAQInfo(
        announcementUrlPath: '/api/announcement',
        variablePath: '51B88D33-B26E-475D-90FC-BEFD9FF0A348',
        template: '4A583EF3-A105-4A00-BC98-EC96A9967966',
        pageSize: pageSize,
        after: '',
        lang: 'EN',
      )
          .onError((error, _) async {
        expect(error, isA<OtherException>());
        return Future.value(FAQInfoMock());
      });
    });
  });
}
