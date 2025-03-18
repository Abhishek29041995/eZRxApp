import 'dart:convert';

import 'package:ezrxmobile/domain/auth/entities/update_language_response.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/update_language_response_dto.dart';
import 'package:flutter/services.dart';

class LanguageLocalDataSource {
  LanguageLocalDataSource();

  Future<UpdateLanguageResponse> getCustomerLicense() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/update_language_and_holiday/updateLanguageAndHolidayResponse.json',
      ),
    );

    final finalData = data['data']['updateLanguageAndHoliday'];

    return UpdateLanguageResponseDto.fromJson(finalData).toDomain;
  }
}
