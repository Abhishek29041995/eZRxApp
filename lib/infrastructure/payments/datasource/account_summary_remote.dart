import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_limit.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_balance.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/account_summary_query.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/credit_limit_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/outstanding_balance_dto.dart';

class AccountSummaryRemoteDataSource {
  HttpService httpService;
  AccountSummaryQuery query;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  AccountSummaryRemoteDataSource({
    required this.httpService,
    required this.query,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<OutstandingBalance> fetchInvoiceSummary({
    required String customerCode,
    required String salesOrg,
    required bool isMarketPlace,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': query.getOutstandingBalanceQuery(),
          'variables': {
            'request': {
              'customerCode': customerCode,
              'salesOrg': salesOrg,
              if (isMarketPlace) 'isMarketPlace': isMarketPlace,
            },
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(
      res: res,
      onCustomExceptionHandler: (res) {
        _accountSummaryExceptionChecker(
          res: res,
          property: 'outstandingBalance',
        );
      },
    );

    final data = res.data['data']['outstandingBalance']['results'];
    if (data.isNotEmpty) {
      final result = <OutstandingBalance>[];
      for (final dynamic element in data) {
        result.add(OutstandingBalanceDto.fromJson(element).toDomain());
      }

      return result.first;
    } else {
      return OutstandingBalance.empty();
    }
  }

  Future<CreditLimit> fetchCreditLimit({
    required String customerCode,
    required String salesOrg,
    required bool isMarketPlace,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': query.getCreditLimitQuery(),
          'variables': {
            'request': {
              'customerCode': customerCode,
              'salesOrg': salesOrg,
              if (isMarketPlace) 'isMarketPlace': isMarketPlace,
            },
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(
      res: res,
      onCustomExceptionHandler: (res) {
        _accountSummaryExceptionChecker(res: res, property: 'creditLimit');
      },
    );
    final data = res.data['data']['creditLimit']['results'];
    if (data.isNotEmpty) {
      final result = <CreditLimit>[];
      for (final dynamic element in data) {
        result.add(CreditLimitDto.fromJson(element).toDomain);
      }

      return result.first;
    } else {
      return CreditLimit.empty();
    }
  }

  void _accountSummaryExceptionChecker({
    required String property,
    required Response<dynamic> res,
  }) {
    final data = res.data;
    if (data['data'] == null ||
        data['data'][property] == null ||
        data['data'][property]['results'] == null) {
      throw ServerException(message: 'Some thing went wrong');
    }
  }
}
