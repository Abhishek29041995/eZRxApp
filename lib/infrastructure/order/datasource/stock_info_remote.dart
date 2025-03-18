import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/error/order_exception.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/stock_info_dto.dart';

class StockInfoRemoteDataSource {
  HttpService httpService;
  StockInfoQueryMutation stockInfoQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  StockInfoRemoteDataSource({
    required this.httpService,
    required this.stockInfoQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<MaterialStockInfo>> getMaterialStockInfoList({
    required List<String> materialNumbers,
    required String salesOrg,
    required String selectedCustomerCode,
    required String selectedShipToCode,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}/order',
        data: jsonEncode({
          'query': stockInfoQueryMutation.getMaterialStockInfoListQuery(),
          'variables': {
            'request': {
              'materialNumbers': materialNumbers,
              'customerCode': selectedCustomerCode,
              'salesOrganisation': salesOrg,
              'shipToCode': selectedShipToCode,
            },
          },
        }),
      );

      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        onCustomExceptionHandler: _stockInfoExceptionChecker,
      );
      
      return List.from(res.data['data']['getStockInformationLists'])
          .map((e) => MaterialStockInfoDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _stockInfoExceptionChecker(Response<dynamic> res) {
    final isStockInfoError = res.data['errors'] != null &&
        res.data['errors'].isNotEmpty &&
        isEqualsIgnoreCase(
          res.data['errors'][0]['message'],
          'something went wrong in the stock information API',
        );
    if (isStockInfoError) {
      throw StockInfoException();
    } else if (res.statusCode != 200) {
      throw StockInfoException();
    }
  }
}
