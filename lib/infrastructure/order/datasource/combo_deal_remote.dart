import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_dto.dart';

class ComboDealRemoteDataSource {
  HttpService httpService;
  ComboDealQueryMutation queryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  ComboDealRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<ComboDeal>> getComboDealList({
    required String salesOrgCode,
    required String customerCode,
    required String salesDeal,
    required String flexibleGroup,
    required List<String> materialNumbers,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getComboDealForMaterials();

      final variables = {
        'salesOrg': salesOrgCode,
        'customerCode': customerCode,
        'salesDeal': salesDeal,
        'flexibleGroup': flexibleGroup,
        'validatedMatnrList': materialNumbers,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}price',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(res: res);
      final combos = res.data['data']['comboDealForMaterials'];

      return List.from(combos)
          .map((e) => ComboDealDto.fromJson(e).toDomain)
          .toList();
    });
  }

  Future<ComboDeal> getComboDeal({
    required String salesOrgCode,
    required String customerCode,
    required String salesDeal,
    required String flexibleGroup,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getComboDealForPrincipleGroup();

      final variables = {
        'salesOrg': salesOrgCode,
        'customerCode': customerCode,
        'salesDeal': salesDeal,
        'flexibleGroup': flexibleGroup,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}price',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      final combo = res.data['data']['comboDealForPrincMatGrp'];

      return ComboDealDto.fromJson(combo).toDomain;
    });
  }
}
