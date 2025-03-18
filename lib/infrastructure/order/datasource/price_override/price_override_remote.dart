import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/error/price_override_exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';

class PriceOverrideRemoteDataSource {
  HttpService httpService;
  PriceOverrideQueryMutation priceOverrideQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  PriceOverrideRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.dataSourceExceptionHandler,
    required this.priceOverrideQueryMutation,
  });

  Future<Price> getOverridePrice({
    required String custCode,
    required String salesOrg,
    required Map<String, dynamic> materialQuery,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryMaterialFilters =
          priceOverrideQueryMutation.getItemPriceOverride();

      final inputVariables = {
        'customer': custCode,
        'salesOrganisation': salesOrg,
        'request': [materialQuery],
      };

      final priceList = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}price',
        data: jsonEncode({
          'query': queryMaterialFilters,
          'variables': inputVariables,
        }),
      );

      dataSourceExceptionHandler.handleExceptionChecker(
        res: priceList,
        onCustomExceptionHandler: _priceOverrideExceptionChecker,
      );
      final finalData = priceList.data['data']['price'];

      return List.from(makeResponseCamelCase(jsonEncode(finalData)))
          .map((e) => PriceDto.fromJson(e).toDomain())
          .toList()
          .first;
    });
  }

  void _priceOverrideExceptionChecker(Response<dynamic> res) {
    if (res.data['data'] != null && res.data['data'].isNotEmpty) {
      if (res.data['data']?['price'] == null ||
          (res.data['data']?['price'] ?? []).isEmpty) {
        throw const PriceException.priceNotFound();
      }
    }
  }
}
