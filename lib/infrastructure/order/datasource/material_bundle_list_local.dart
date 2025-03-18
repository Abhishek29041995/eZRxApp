import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:flutter/services.dart';

class MaterialBundleListLocalDatasource {
  MaterialBundleListLocalDatasource();

  Future<List<MaterialInfo>> getMaterialBundleList() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_material_bundle_list/getMaterialBundleListResponse.json',
      ),
    );

    return List.from(
      makeResponseCamelCase(
        jsonEncode(data['data']['GetBundles']),
      ),
    ).map((e) => MaterialDto.fromJson(e).toDomain()).toList();
  }

  Future<List<MaterialInfo>> getMaterialBundleListForSalesRep() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_material_bundle_list_for_sales_rep/getMaterialBundleListForSalesRepResponse.json',
      ),
    );

    return List.from(
      makeResponseCamelCase(
        jsonEncode(data['data']['GetBundlesForSalesRep']),
      ),
    ).map((e) => MaterialDto.fromJson(e).toDomain()).toList();
  }
}
