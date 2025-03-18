import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_representative_info_dto.dart';
import 'package:flutter/services.dart';

class SalesRepLocalDataSource {
  SalesRepLocalDataSource();

  Future<SalesRepresentativeInfo> getSalesRepInfo() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_sales_rep_info/getSalesRepInfoResponse.json',
      ),
    );

    return SalesRepresentativeInfoDto.fromJson(
      data['data']['salesRepresentativeInfo']['rawMetaData'],
    ).toDomain();
  }
}
