import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_license_dto.dart';
import 'package:flutter/services.dart';

class CustomerLicenseLocalDataSource {
  CustomerLicenseLocalDataSource();

  Future<List<CustomerLicense>> getCustomerLicense() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/customer_licenses/customerLicensesResponse.json'),
    );

    return List.from(data['data']['customerLicenses']['Licenses'])
        .map((e) => CustomerLicenseDto.fromJson(e).toDomain)
        .toList();
  }
}
