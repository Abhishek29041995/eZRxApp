import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/contact_us/entities/contact_us_details.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/contact_us/datasource/contact_us_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/contact_us/dtos/contact_us_details_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class ContactUsDetailsRemoteDataSource {
  final HttpService httpService;
  final ContactUsQuery queryMutation;
  final DataSourceExceptionHandler exceptionHandler;

  ContactUsDetailsRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.exceptionHandler,
  });

  Future<ContactUsDetails> getContactUsDetails({
    required String announcementUrlPath,
    required String lang,
    required String contactUsId,
    required String token,
  }) async {
    final variableData = {
      'itemId': contactUsId,
      'lang': lang,
    };

    return await exceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: announcementUrlPath,
        data: jsonEncode({
          'query': queryMutation.getContactUsQuery(),
          'variables': variableData,
        }),
        headers: {'X-GQL-Token': token},
      );
      exceptionHandler.handleExceptionChecker(
        res: res,
        onCustomExceptionHandler: _contactUsDetailsExceptionChecker,
      );

      return ContactUsDetailsDto.fromJson(res.data['data']['item']).toDomain;
    });
  }

  void _contactUsDetailsExceptionChecker(
    Response<dynamic> res,
  ) {
    if (res.data['data'] != null && res.data['data'].isNotEmpty) {
      if (res.data['data']['item'] == null ||
          (res.data['data']['item'] ?? []).isEmpty) {
        throw OtherException(
          message: 'Contact Us Details is either null or empty!',
        );
      }
    }
  }
}
