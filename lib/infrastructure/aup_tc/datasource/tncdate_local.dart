import 'dart:convert';

import 'package:ezrxmobile/domain/aup_tc/entities/tncdate.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/dtos/tncdate_dto.dart';
import 'package:flutter/services.dart';

class AcceptanceDateLocalDataSource {
  Future<TncDate> getAcceptanceDate() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/tnc_date/tncdateResponse.json'),
    );

    return TncDateDto.fromJson(data).toDomain();
  }
}
