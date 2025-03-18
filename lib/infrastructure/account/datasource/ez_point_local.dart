import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/ez_point_token.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/ez_point_token_response_dto.dart';
import 'package:flutter/services.dart';

class EZPointLocalDataSource {
  EZPointLocalDataSource();

  Future<EZPointToken> getEZPointToken() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/get_EZ_point/getEZPointResponse.json'),
    );

    return EZPointTokenResponseDto.fromJson(data['data']['getEzPointToken'])
        .toDomain;
  }
}
