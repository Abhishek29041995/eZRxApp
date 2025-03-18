import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_query.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_material_list_dto.dart';

class ReturnRequestRemoteDataSource {
  final HttpService httpService;
  final ReturnRequestQuery query;
  final DataSourceExceptionHandler dataSourceExceptionHandler;
  final Config config;
  final RemoteConfigService remoteConfigService;

  ReturnRequestRemoteDataSource({
    required this.httpService,
    required this.query,
    required this.dataSourceExceptionHandler,
    required this.config,
    required this.remoteConfigService,
  });

  Future<ReturnMaterialList> searchReturnMaterials({
    required Map<String, dynamic> requestParams,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = query.searchReturnMaterials(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
      );
      final variables = {
        'searchReturnMaterialsRequestV2': requestParams,
      };
      variables['searchReturnMaterialsRequestV2']!
          .removeWhere((key, value) => value.toString().isEmpty);

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        property: 'searchReturnMaterialsV2',
      );

      return ReturnMaterialListDto.fromJson(
        res.data['data']['searchReturnMaterialsV2'],
      ).toDomain();
    });
  }

  Future<ReturnMaterialList> searchReturnMaterialsForSalesRep({
    required Map<String, dynamic> requestParams,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = query.searchReturnMaterialsForSalesRep(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
      );
      final variables = {
        'searchReturnMaterialsForSalesRepRequest': requestParams,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );

      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        property: 'searchReturnMaterialsForSalesRepV2',
      );

      return ReturnMaterialListDto.fromJson(
        res.data['data']['searchReturnMaterialsForSalesRepV2'],
      ).toDomain();
    });
  }

  Future<String> addRequest({
    required Map<String, dynamic> requestParams,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = query.addRequest();
      final variables = {
        'returnInput': requestParams,
      };
      variables['returnInput']!
          .removeWhere((key, value) => value.toString().isEmpty);

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );

      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        property: 'addRequestV2',
      );

      return res.data['data']['addRequestV2']['requestID'] is String
          ? res.data['data']['addRequestV2']['requestID']
          : '';
    });
  }
}
