import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/soa_dto.dart';
import 'package:flutter/services.dart';

class SoaLocalDataSource {
  SoaLocalDataSource();

  Future<List<Soa>> getSoa() async {
    final res = json.decode(
      await rootBundle.loadString(
        'assets/json/common/listSoaResponse.json',
      ),
    );
    final data = res['data'];

    return List.from(data).map((e) => SoaDto.fromJson(e).toDomain()).toList();
  }
}
