import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/dtos/announcement_article_info_dto.dart';
import 'package:ezrxmobile/infrastructure/article_info/datasource/article_info_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/article_info/datasource/article_info_remote.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class AnnouncementArticleInfoMock extends Mock
    implements AnnouncementArticleInfo {}

void main() {
  late ArticleInfoRemoteDataSource remoteDataSource;
  late Config config;

  final fakeUser = User.empty();

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat-my.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);
  config = Config()..appFlavor = Flavor.uat;

  final salesOrg = SalesOrg('2001');
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    remoteDataSource = ArticleInfoRemoteDataSource(
      queryMutation: ArticleInfoQueryMutation(),
      httpService: service,
      exceptionHandler: DataSourceExceptionHandler(),
    );
  });
  group('Article Info remote data source test', () {
    final variables = {
      'template': config.articleTemplate,
      'path': config.announcementApiUrlPath,
      'pageSize': config.pageSize,
      'lang': fakeUser.preferredLanguage.locale.languageCode,
      'after': '',
    };
    test('Get Article Info ', () async {
      final infoRes = json.decode(
        await rootBundle.loadString('assets/json/get_article_info/getArticleInfoResponse.json'),
      );

      dioAdapter.onPost(
        '/api/announcement',
        (server) => server.reply(
          200,
          infoRes,
          delay: const Duration(seconds: 1),
        ),
        headers: {
          'Content-Type': 'application/json charset=utf-8',
        },
        data: jsonEncode({
          'query': remoteDataSource.queryMutation.getArticleInfoQuery(),
          'variables': variables,
        }),
      );

      final result = await remoteDataSource.getArticleInfo(
        announcementUrlPath: config.announcementApiUrlPath,
        variablePath: salesOrg.articleVariablePath,
        template: config.articleTemplate,
        pageSize: config.pageSize,
        after: '',
        lang: fakeUser.preferredLanguage.locale.languageCode,
      );

      expect(
        result,
        AnnouncementArticleInfoDto.fromJson(infoRes['data']['search']).toDomain,
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
          'query': remoteDataSource.queryMutation.getArticleInfoQuery(),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getArticleInfo(
        announcementUrlPath: config.announcementApiUrlPath,
        variablePath: salesOrg.articleVariablePath,
        template: config.articleTemplate,
        pageSize: config.pageSize,
        after: '',
        lang: fakeUser.preferredLanguage.locale.languageCode,
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(AnnouncementArticleInfoMock());
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
        headers: {
          'Content-Type': 'application/json charset=utf-8',
        },
        data: jsonEncode({
          'query': remoteDataSource.queryMutation.getArticleInfoQuery(),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getArticleInfo(
        announcementUrlPath: config.announcementApiUrlPath,
        variablePath: salesOrg.articleVariablePath,
        template: config.articleTemplate,
        pageSize: config.pageSize,
        after: '',
        lang: fakeUser.preferredLanguage.locale.languageCode,
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(AnnouncementArticleInfoMock());
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
        headers: {
          'Content-Type': 'application/json charset=utf-8',
        },
        data: jsonEncode({
          'query': remoteDataSource.queryMutation.getArticleInfoQuery(),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getArticleInfo(
        announcementUrlPath: config.announcementApiUrlPath,
        variablePath: salesOrg.articleVariablePath,
        template: config.articleTemplate,
        pageSize: config.pageSize,
        after: '',
        lang: fakeUser.preferredLanguage.locale.languageCode,
      )
          .onError((error, _) async {
        expect(error, isA<OtherException>());
        return Future.value(AnnouncementArticleInfoMock());
      });
    });
  });

  group('Article Info ID Market remote data source test', () {
    final variables = {
      'template': config.articleTemplate,
      'path': config.announcementApiUrlPath,
      'pageSize': config.pageSize,
      'lang': fakeUser.preferredLanguage.locale.languageCode,
      'after': '',
    };
    test('Get Article Info ', () async {
      final infoRes = json.decode(
        await rootBundle.loadString('assets/json/get_article_info/getArticleInfoResponse.json'),
      );

      dioAdapter.onPost(
        '/api/announcement',
        (server) => server.reply(
          200,
          infoRes,
          delay: const Duration(seconds: 1),
        ),
        headers: {
          'Content-Type': 'application/json charset=utf-8',
        },
        data: jsonEncode({
          'query': remoteDataSource.queryMutation.getArticleInfoQueryIdMarket(),
          'variables': variables,
        }),
      );

      final result = await remoteDataSource.getArticleInfoIdMarket(
        announcementUrlPath: config.announcementApiUrlPath,
        variablePath: salesOrg.articleVariablePath,
        template1: config.idMarketArticleTemplate1,
        template2: config.idMarketArticleTemplate2,
        pageSize: config.pageSize,
        after: '',
        lang: fakeUser.preferredLanguage.locale.languageCode,
      );

      expect(
        result,
        AnnouncementArticleInfoDto.fromJson(infoRes['data']['search']).toDomain,
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
          'query': remoteDataSource.queryMutation.getArticleInfoQueryIdMarket(),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getArticleInfoIdMarket(
        announcementUrlPath: config.announcementApiUrlPath,
        variablePath: salesOrg.articleVariablePath,
        template1: config.idMarketArticleTemplate1,
        template2: config.idMarketArticleTemplate2,
        pageSize: config.pageSize,
        after: '',
        lang: fakeUser.preferredLanguage.locale.languageCode,
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(AnnouncementArticleInfoMock());
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
        headers: {
          'Content-Type': 'application/json charset=utf-8',
        },
        data: jsonEncode({
          'query': remoteDataSource.queryMutation.getArticleInfoQueryIdMarket(),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getArticleInfoIdMarket(
        announcementUrlPath: config.announcementApiUrlPath,
        variablePath: salesOrg.articleVariablePath,
        template1: config.idMarketArticleTemplate1,
        template2: config.idMarketArticleTemplate2,
        pageSize: config.pageSize,
        after: '',
        lang: fakeUser.preferredLanguage.locale.languageCode,
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(AnnouncementArticleInfoMock());
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
        headers: {
          'Content-Type': 'application/json charset=utf-8',
        },
        data: jsonEncode({
          'query': remoteDataSource.queryMutation.getArticleInfoQueryIdMarket(),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getArticleInfoIdMarket(
        announcementUrlPath: config.announcementApiUrlPath,
        variablePath: salesOrg.articleVariablePath,
        template1: config.idMarketArticleTemplate1,
        template2: config.idMarketArticleTemplate2,
        pageSize: config.pageSize,
        after: '',
        lang: fakeUser.preferredLanguage.locale.languageCode,
      )
          .onError((error, _) async {
        expect(error, isA<OtherException>());
        return Future.value(AnnouncementArticleInfoMock());
      });
    });
  });
}
