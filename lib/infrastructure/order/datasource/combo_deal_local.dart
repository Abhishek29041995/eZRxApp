import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_dto.dart';
import 'package:flutter/services.dart';

class ComboDealLocalDataSource {
  ComboDealLocalDataSource();

  Future<List<ComboDeal>> getComboDealList({
    ComboDealScheme scheme = ComboDealScheme.k1,
  }) async {
    await Future.delayed(const Duration(seconds: 4));
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/${scheme.comboDealMockResponsePath}'),
    );
    final finalData = data['data']['comboDealForMaterials'];

    return List.from(finalData)
        .map((e) => ComboDealDto.fromJson(e).toDomain)
        .toList();
  }

  Future<ComboDeal> getComboDeal() async {
    await Future.delayed(const Duration(seconds: 4));
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/${ComboDealScheme.k5.comboDealMockResponsePath}',
      ),
    );
    final finalData = data['data']['comboDealForPrincMatGrp'];

    return ComboDealDto.fromJson(finalData).toDomain;
  }
}
