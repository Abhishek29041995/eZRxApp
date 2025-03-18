import 'dart:convert';

import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/request_information_dto.dart';
import 'package:flutter/services.dart';

class ReturnSummaryDetailsRequestInformationLocal {
  ReturnSummaryDetailsRequestInformationLocal();

  Future<RequestInformation> getReturnRequestInformation() async {
    final res = json.decode(
      await rootBundle.loadString(
        'assets/json/return_request_information_v2/returnRequestInformationV2Response.json',
      ),
    );
    final data = res['data']['requestInformationV2'];

    return RequestInformationDto.fromJson(data).toDomain();
  }
}
