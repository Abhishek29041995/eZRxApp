import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ezcs_ticket_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class EZCSTicketRemoteDataSource {
  final HttpService httpService;
  final Config config;
  final DataSourceExceptionHandler dataSourceExceptionHandler;
  final EZCSTicketQueryMutation ezcsTicketQueryMutation;

  EZCSTicketRemoteDataSource({
    required this.httpService,
    required this.config,
    required this.dataSourceExceptionHandler,
    required this.ezcsTicketQueryMutation,
  });

  Future<bool> submitTicket({
    required List<MultipartFile> files,
    required Map<String, dynamic> formDataFields,
  }) async {
    final formData = FormData();
    formData.fields.add(
      MapEntry(
        'operations',
        jsonEncode({
          'query': ezcsTicketQueryMutation.submitTicket(),
          'variables': {
            'submitInput': {
              ...formDataFields,
              'attachments': List.generate(
                files.length,
                (_) => null,
              ),
            },
          },
        }),
      ),
    );
    final fileMap = <String, List<String>>{};

    for (var i = 0; i < files.length; i++) {
      fileMap['$i'] = ['variables.submitInput.attachments.$i'];
      formData.files.add(MapEntry('$i', files[i]));
    }
    formData.fields.add(MapEntry('map', jsonEncode(fileMap)));

    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}raise-ticket',
      data: formData,
    );
    dataSourceExceptionHandler.handleExceptionChecker(res: res);

    return res.data['data']['submitEZCSTicket']['success'];
  }
}
