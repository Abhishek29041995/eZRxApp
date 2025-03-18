import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/ez_point_token.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ez_point_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/ez_point_token_response_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class EZPointRemoteDataSource {
  final EZPointMutation ezPointMutation;
  final HttpService httpService;
  final Config config;
  final DataSourceExceptionHandler dataSourceExceptionHandler;

  EZPointRemoteDataSource({
    required this.ezPointMutation,
    required this.httpService,
    required this.config,
    required this.dataSourceExceptionHandler,
  });

  Future<EZPointToken> getEZPointToken({required customerCode}) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = ezPointMutation.getTokenQuery();

      final variables = {
        'request': {
          'customerCode': customerCode,
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

      final finalData = res.data['data']['getEzPointToken'];

      return EZPointTokenResponseDto.fromJson(finalData).toDomain;
    });
  }
}
