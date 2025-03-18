import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_article_tag_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_article_tag_remote.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late AnnouncementArticlTagRemoteDataSource remoteDataSource;

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat-my.ezrxplus.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);
  const template = 'fake-template';
  const lang = 'fake-lang';
  const announcementVariablePath = 'fake-path';
  const announcementApiUrlPath = 'fake-api-path';

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    remoteDataSource = AnnouncementArticlTagRemoteDataSource(
      queryMutation: AnnouncementArticleTagQueryMutation(),
      httpService: service,
      exceptionHandler: DataSourceExceptionHandler(),
    );
  });
  group('Announcement Article Tag Remote Data Source test', () {
    test('Get Announcement Article Tags test', () async {
      final variables = {
        'template': template,
        'path': announcementVariablePath,
        'pageSize': 1000,
        'lang': lang,
      };

      final res = json.decode(
        await rootBundle.loadString('assets/json/announcement_article_tag/announcementArticleTag.json'),
      );

      dioAdapter.onPost(
        announcementApiUrlPath,
        (server) => server.reply(
          200,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {
          'Content-Type': 'application/json charset=utf-8',
        },
        data: jsonEncode({
          'query':
              remoteDataSource.queryMutation.getAnnouncementArticleTagQuery(),
          'variables': variables,
        }),
      );

      final result = await remoteDataSource.getAnnouncementArticleTags(
        announcementArticleUrlPath: announcementApiUrlPath,
        variablePath: announcementVariablePath,
        template: template,
        lang: lang,
      );

      final finalData = res['data']['search']['results'];

      expect(
        result,
        List.from(finalData).map((e) => e['displayName'].toString()).toList(),
      );
    });
  });
}
