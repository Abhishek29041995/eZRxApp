import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_article_tag_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

const pageSize = 1000;

class AnnouncementArticlTagRemoteDataSource {
  final HttpService httpService;
  final AnnouncementArticleTagQueryMutation queryMutation;
  final DataSourceExceptionHandler exceptionHandler;

  AnnouncementArticlTagRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.exceptionHandler,
  });

  Future<List<String>> getAnnouncementArticleTags({
    required String announcementArticleUrlPath,
    required String template,
    required String variablePath,
    required String lang,
  }) async {
    final variableData = {
      'template': template,
      'path': variablePath,
      'pageSize': pageSize,
      'lang': lang,
    };

    return await exceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: announcementArticleUrlPath,
        data: jsonEncode({
          'query': queryMutation.getAnnouncementArticleTagQuery(),
          'variables': variableData,
        }),
      );
      exceptionHandler.handleExceptionChecker(
        res: res,
        onCustomExceptionHandler: _announcementInfoExceptionChecker,
      );
      final finalData = res.data['data']['search']['results'];

      return List.from(finalData)
          .map((e) => e['displayName'].toString())
          .toList();
    });
  }

  void _announcementInfoExceptionChecker(
    Response<dynamic> res,
  ) {
    if (res.data['data']?['search'] == null ||
        (res.data['data']?['search'] ?? []).isEmpty) {
      throw const ApiFailure.articleannuncementTagFetchingError();
    }
  }
}
