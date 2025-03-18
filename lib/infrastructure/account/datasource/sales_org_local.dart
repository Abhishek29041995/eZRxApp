import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_configs_dto.dart';
import 'package:flutter/services.dart';

class SalesOrgLocalDataSource {
  SalesOrgLocalDataSource();

  Future<SalesOrganisationConfigs> getConfig() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_sales_org_configs/getSalesOrgConfigsResponse.json',
      ),
    );

    return SalesOrganisationConfigsDto.fromJson(
      data['data']['salesOrgConfigs'][0],
    ).toDomain();
  }
}
