import 'dart:convert';

import 'package:ezrxmobile/domain/about_us/entities/about_us.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/about_us/datasource/about_us_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/about_us/dtos/about_us_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class AboutUsRemoteDataSource {
  final HttpService httpService;
  final AboutUsQueryMutation queryMutation;
  final DataSourceExceptionHandler exceptionHandler;

  AboutUsRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.exceptionHandler,
  });

  Future<AboutUs> getAboutUsInfo({
    required String aboutUsUrlPath,
    required String itemId,
    required String lang,
  }) async {
    final variableData = {
      'itemId': itemId,
      'lang': lang,
    };

    final res = await httpService.request(
      method: 'POST',
      url: aboutUsUrlPath,
      data: jsonEncode({
        'query': queryMutation.getAboutUsQuery(),
        'variables': variableData,
      }),
    );
    exceptionHandler.handleExceptionChecker(res: res);
    final finalData =
        res.data['data']?['item']?['components'] as Map<String, dynamic>?;
    final templateList = (finalData?['value'] ?? []) as List;
    if (templateList.isEmpty) {
      throw ServerException(message: 'Unable to load About us');
    }

    return AboutUsDto.fromJson(finalData ?? {}).toDomain();
  }
}
