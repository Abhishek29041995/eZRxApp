import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_filter_dto.dart';
import 'package:flutter/services.dart';

class MaterialFilterLocalDataSource {
  MaterialFilterLocalDataSource();

  Future<MaterialFilter> getFilters() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_material_filter/getMaterialFilterResponse.json',
      ),
    );
    final finalData = data['data']['GetFilterList'];

    return MaterialFilterDto.fromJson(finalData).toDomain();
  }
}
