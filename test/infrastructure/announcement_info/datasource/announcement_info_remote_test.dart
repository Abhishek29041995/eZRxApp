import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info_details.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_remote.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/dtos/announcement_article_info_dto.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/dtos/announcement_info_details_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class AnnouncementArticleInfoMock extends Mock
    implements AnnouncementArticleInfo {}

class AnnouncementArticleInfoDetailsMock extends Mock
    implements AnnouncementInfoDetails {}

void main() {
  late AnnouncementInfoRemoteDataSource remoteDataSource;
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
    remoteDataSource = AnnouncementInfoRemoteDataSource(
      queryMutation: AnnouncementInfoQueryMutation(),
      httpService: service,
      exceptionHandler: DataSourceExceptionHandler(),
    );
  });
  group('Announcement Info remote data source test', () {
    final variables = {
      'pageSize': config.pageSize,
      'template': config.announcementTemplate,
      'vntemplate': config.announcementVnTemplate,
      'path': config.announcementApiUrlPath,
      'lang': fakeUser.preferredLanguage.locale.languageCode,
      'after': '',
    };
    test('Get Announcement Info ', () async {
      final infoRes = json.decode(
        await rootBundle
            .loadString('assets/json/get_announcement_info/getAnnouncementInfoResponse.json'),
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
          'query': remoteDataSource.queryMutation.getAnnouncementInfoQuery(),
          'variables': variables,
        }),
      );

      final result = await remoteDataSource.getAnnouncementInfo(
        announcementUrlPath: config.announcementApiUrlPath,
        variablePath: salesOrg.announcementVariablePath,
        template: config.announcementTemplate,
        vnTemplate: config.announcementVnTemplate,
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
          'query': remoteDataSource.queryMutation.getAnnouncementInfoQuery(),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getAnnouncementInfo(
        announcementUrlPath: config.announcementApiUrlPath,
        variablePath: salesOrg.announcementVariablePath,
        template: config.announcementTemplate,
        vnTemplate: config.announcementVnTemplate,
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
          'query': remoteDataSource.queryMutation.getAnnouncementInfoQuery(),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getAnnouncementInfo(
        announcementUrlPath: config.announcementApiUrlPath,
        variablePath: salesOrg.announcementVariablePath,
        vnTemplate: config.announcementVnTemplate,
        template: config.announcementTemplate,
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
          'query': remoteDataSource.queryMutation.getAnnouncementInfoQuery(),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getAnnouncementInfo(
        announcementUrlPath: config.announcementApiUrlPath,
        variablePath: salesOrg.announcementVariablePath,
        vnTemplate: config.announcementVnTemplate,
        template: config.announcementTemplate,
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

  group('Announcement Info Details remote data source test', () {
    final variables = {
      'itemId': 'fake_id',
      'lang': fakeUser.preferredLanguage.locale.languageCode,
    };
    test('Get Announcement Info Details', () async {
      final infoRes = json.decode(
        await rootBundle
            .loadString('assets/json/get_announcement_info_details/getAnnouncementInfoDetailsResponse.json'),
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
          'query':
              remoteDataSource.queryMutation.getAnnouncementInfoDetailsQuery(),
          'variables': variables,
        }),
      );

      final result = await remoteDataSource.getAnnouncementInfoDetails(
        announcementUrlPath: config.announcementApiUrlPath,
        lang: fakeUser.preferredLanguage.locale.languageCode,
        announcementId: 'fake_id',
      );

      expect(
        result,
        AnnouncementInfoDetailsDto.fromJson(infoRes['data']['item']).toDomain,
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
          'query':
              remoteDataSource.queryMutation.getAnnouncementInfoDetailsQuery(),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getAnnouncementInfoDetails(
        announcementUrlPath: config.announcementApiUrlPath,
        lang: fakeUser.preferredLanguage.locale.languageCode,
        announcementId: 'fake_id',
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(AnnouncementArticleInfoDetailsMock());
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
          'query':
              remoteDataSource.queryMutation.getAnnouncementInfoDetailsQuery(),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getAnnouncementInfoDetails(
        announcementUrlPath: config.announcementApiUrlPath,
        lang: fakeUser.preferredLanguage.locale.languageCode,
        announcementId: 'fake_id',
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(AnnouncementArticleInfoDetailsMock());
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
          'query':
              remoteDataSource.queryMutation.getAnnouncementInfoDetailsQuery(),
          'variables': variables,
        }),
      );

      await remoteDataSource
          .getAnnouncementInfoDetails(
        announcementUrlPath: config.announcementApiUrlPath,
        lang: fakeUser.preferredLanguage.locale.languageCode,
        announcementId: 'fake_id',
      )
          .onError((error, _) async {
        expect(error, isA<OtherException>());
        return Future.value(AnnouncementArticleInfoDetailsMock());
      });
    });
  });
}
