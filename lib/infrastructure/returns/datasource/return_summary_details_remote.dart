import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/request_information_query.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/request_information_dto.dart';

class ReturnSummaryDetailsRequestInformationRemote {
  final HttpService httpService;
  final RequestInformationQuery requestInformationQuery;
  final DataSourceExceptionHandler dataSourceExceptionHandler;
  final Config config;
  final RemoteConfigService remoteConfigService;

  ReturnSummaryDetailsRequestInformationRemote({
    required this.httpService,
    required this.requestInformationQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
    required this.remoteConfigService,
  });

  Future<RequestInformation> getReturnRequestInformation({
    required String returnRequestId,
    String invoiceId = '',
    String lineNumber = '',
    required String market,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ereturn',
      data: jsonEncode(
        {
          'query': requestInformationQuery.getReturnInformationQuery(
            remoteConfigService.enableMarketPlaceMarkets.contains(market),
          ),
          'variables': {
            'request': {
              'requestID': returnRequestId,
              if (invoiceId.isNotEmpty) 'invoiceID': invoiceId,
              if (lineNumber.isNotEmpty) 'lineItemNumber': lineNumber,
            },
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(
      res: res,
      onCustomExceptionHandler: _returnSummaryDetailsRequestInformationChecker,
    );

    final data = res.data['data']['requestInformationV2'];

    return RequestInformationDto.fromJson(data).toDomain();
  }

  void _returnSummaryDetailsRequestInformationChecker(
    Response<dynamic> res,
  ) {
    final data = res.data;
    if (data['data'] == null ||
        data['data'].isEmpty ||
        data['data']?['requestInformationV2'] == null) {
      throw ServerException(message: 'Some thing went wrong');
    }
  }
}
