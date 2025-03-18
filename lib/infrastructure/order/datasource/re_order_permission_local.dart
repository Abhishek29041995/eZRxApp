import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/re_order_permission.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/re_order_permission_dto.dart';
import 'package:flutter/services.dart';

class ReOrderPermissionLocalDataSource {
  ReOrderPermissionLocalDataSource();

  Future<ReOrderPermission> getPermission() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_material_permissions/getMaterialPermissionsResponse.json',
      ),
    );

    return ReOrderPermissionDto.fromJson(data['data']['validCustomerMaterials'])
        .toDomain;
  }
}
