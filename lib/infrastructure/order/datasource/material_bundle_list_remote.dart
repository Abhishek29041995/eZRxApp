import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';

class MaterialBundleListRemoteDataSource {
  HttpService httpService;
  MaterialBundleQuery materialBundleQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  static const _url = '/api/price';
  static const _method = 'POST';

  MaterialBundleListRemoteDataSource({
    required this.httpService,
    required this.materialBundleQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<MaterialInfo>> getMaterialBundleList({
    required String customerCode,
    required String salesOrganisation,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: _method,
        url: _url,
        data: jsonEncode({
          'query': materialBundleQuery.getCustomerMaterialBundleList(),
          'variables': {
            'customer': customerCode,
            'salesOrganisation': salesOrganisation,
          },
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      return List.from(
        makeResponseCamelCase(
          jsonEncode(res.data['data']['GetBundles']),
        ),
      ).map((e) => MaterialDto.fromJson(e).toDomain()).toList();
    });
  }

  Future<List<MaterialInfo>> getMaterialBundleListForSalesRep({
    required String userName,
    required String customerCode,
    required String shipToCode,
    required String salesOrganisation,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: _method,
        url: _url,
        data: jsonEncode({
          'query': materialBundleQuery.getSalesRepMaterialBundleList(),
          'variables': {
            'userName': userName,
            'customer': customerCode,
            'shipToCode': shipToCode,
            'salesOrganisation': salesOrganisation,
          },
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      return List.from(
        makeResponseCamelCase(
          jsonEncode(res.data['data']['GetBundlesForSalesRep']),
        ),
      ).map((e) => MaterialDto.fromJson(e).toDomain()).toList();
    });
  }
}
