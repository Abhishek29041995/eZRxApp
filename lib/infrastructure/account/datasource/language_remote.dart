import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/update_language_response.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/language_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/update_language_response_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class LanguageRemoteDataSource {
  final LanguageMutation languageMutation;
  final HttpService httpService;
  final Config config;
  final DataSourceExceptionHandler dataSourceExceptionHandler;

  LanguageRemoteDataSource({
    required this.languageMutation,
    required this.httpService,
    required this.config,
    required this.dataSourceExceptionHandler,
  });

  Future<UpdateLanguageResponse> changeLanguage(String language) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = languageMutation.changeLanguage();

      final variables = {
        'input': {
          'Language': language,
          'Holiday': {
            'monday': false,
            'tuesday': false,
            'wednesday': false,
            'thursday': false,
            'friday': false,
            'saturday': false,
            'sunday': true,
          },
        },
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      final finalData = res.data['data']['updateLanguageAndHoliday'];

      return UpdateLanguageResponseDto.fromJson(finalData).toDomain;
    });
  }
}
