import 'dart:convert';

import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_info.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/faq/datasource/faq_query_mutaion.dart';
import 'package:ezrxmobile/infrastructure/faq/dtos/faq_info_dto.dart';

class FAQInfoRemoteDataSource {
  final HttpService httpService;
  final FAQInfoQueryMutation queryMutation;
  final DataSourceExceptionHandler exceptionHandler;

  FAQInfoRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.exceptionHandler,
  });

  Future<FAQInfo> getFAQInfo({
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
          'query': queryMutation.getFAQInfoQuery(),
          'variables': variableData,
        }),
      );
      exceptionHandler.handleExceptionChecker(res: res);
      if (res.data['data']['search'] == null ||
          res.data['data']['search'].isEmpty) {
        throw OtherException();
      }

      return FAQInfoDto.fromJson(res.data['data']['search']).toDomain;
    });
  }
}
