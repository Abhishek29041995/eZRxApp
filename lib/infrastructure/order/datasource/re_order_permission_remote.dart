import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/re_order_permission.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/re_order_permission_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/re_order_permission_dto.dart';

class ReOrderPermissionRemoteDataSource {
  final HttpService httpService;
  final ReOrderPermissionQuery reOrderPermissionQuery;
  final Config config;
  final DataSourceExceptionHandler dataSourceExceptionHandler;

  ReOrderPermissionRemoteDataSource({
    required this.httpService,
    required this.reOrderPermissionQuery,
    required this.config,
    required this.dataSourceExceptionHandler,
  });

  Future<ReOrderPermission> getPermission({
    required List<String> materialNumbers,
    required String customerCode,
    required String shipToCode,
    required String salesOrg,
    required bool isSalesRepUser,
    required String userName,
    required bool isEnableGimmickMaterial,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode(
          {
            'query': reOrderPermissionQuery.getReOrderPermission(),
            'variables': {
              'request': {
                'materialNumberList': materialNumbers,
                'customerSoldToCode': customerCode,
                'customerShipToCode': shipToCode,
                'salesOrganisation': salesOrg,
                'cached': false,
                'invalidateCache': false,
                if (isSalesRepUser) 'username': userName,
                if (isSalesRepUser) 'gimmickMaterial': isEnableGimmickMaterial,
              },
            },
          },
        ),
      );

      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      return ReOrderPermissionDto.fromJson(
        res.data['data']['validCustomerMaterials'],
      ).toDomain;
    });
  }
}
