import 'dart:convert';

import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/dtos/announcement_article_info_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

import 'package:ezrxmobile/infrastructure/article_info/datasource/article_info_query_mutation.dart';

import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';

class ArticleInfoRemoteDataSource {
  final HttpService httpService;
  final ArticleInfoQueryMutation queryMutation;
  final DataSourceExceptionHandler exceptionHandler;

  ArticleInfoRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.exceptionHandler,
  });

  Future<AnnouncementArticleInfo> getArticleInfo({
    required String announcementUrlPath,
    required String template,
    required String variablePath,
    required int pageSize,
    required String lang,
    required String after,
  }) async {
    final variableData = {
      'template': template,
      'path': variablePath,
      'pageSize': pageSize,
      'lang': lang,
      'after': after,
    };

    return await exceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: announcementUrlPath,
        data: jsonEncode({
          'query': queryMutation.getArticleInfoQuery(),
          'variables': variableData,
        }),
      );
      exceptionHandler.handleExceptionChecker(res: res);
      if (res.data['data']['search'] == null ||
          res.data['data']['search'].isEmpty) {
        throw OtherException();
      }

      return AnnouncementArticleInfoDto.fromJson(res.data['data']['search'])
          .toDomain;
    });
  }

  Future<AnnouncementArticleInfo> getArticleInfoIdMarket({
    required String announcementUrlPath,
    required String template1,
    required String template2,
    required String variablePath,
    required int pageSize,
    required String lang,
    required String after,
  }) async {
    final variableData = {
      'template1': template1,
      'template2': template2,
      'path': variablePath,
      'pageSize': pageSize,
      'lang': lang,
      'after': after,
    };

    return await exceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: announcementUrlPath,
        data: jsonEncode({
          'query': queryMutation.getArticleInfoQueryIdMarket(),
          'variables': variableData,
        }),
      );
      exceptionHandler.handleExceptionChecker(res: res);
      if (res.data['data']['search'] == null ||
          res.data['data']['search'].isEmpty) {
        throw OtherException();
      }

      return AnnouncementArticleInfoDto.fromJson(res.data['data']['search'])
          .toDomain;
    });
  }
}
