import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:flutter/services.dart';

class MaterialListLocalDataSource {
  MaterialListLocalDataSource();

  Future<MaterialResponse> getProductList({
    bool isComboDealMaterials = false,
  }) async {
    final dataPath = isComboDealMaterials
        ? 'get_combo_deal_for_principalK5/getComboDealDetailForPrincipalK5Response.json'
        : 'get_all_products/getAllProductsResponse.json';
    final data = json.decode(
      await rootBundle.loadString('assets/json/$dataPath'),
    );

    final finalData =
        makeResponseCamelCase(jsonEncode(data['data']['GetAllProducts']));

    return MaterialResponseDto.fromJson(finalData).toDomain();
  }

  Future<MaterialInfo> getProductDetails() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_product_details/getProductDetailsResponse.json',
      ),
    );
    final finalData =
        makeResponseCamelCase(jsonEncode(data['data']['GetProductDetails']));

    return MaterialDto.fromJson(finalData).toDomain();
  }
}
