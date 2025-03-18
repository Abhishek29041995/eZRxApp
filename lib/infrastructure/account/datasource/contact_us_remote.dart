import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/contact_us_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class ContactUsRemoteDataSource {
  HttpService httpService;
  ContactUsQueryMutation mutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  ContactUsRemoteDataSource({
    required this.httpService,
    required this.mutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<bool> submit({
    required Map<String, dynamic> contactUsMap,
    required String sendToEmail,
    required String country,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}sendEmail',
        data: jsonEncode({
          ...contactUsMap,
          'sendToEmail': sendToEmail,
          'country': country,
          'type': 'general',
        }),
      );
      _contactUsExceptionChecker(res: res);

      return isEqualsIgnoreCase(res.data, 'Message sent successfully.');
    });
  }

  void _contactUsExceptionChecker({required Response<dynamic> res}) {
    if (res.data == null || res.data.isEmpty) {
      throw ServerException(message: 'Message not been sent successfully');
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
