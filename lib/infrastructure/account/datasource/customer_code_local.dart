import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/customer_code_config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_information.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_code_config_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_code_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_code_information_dto.dart';
import 'package:flutter/services.dart';

class CustomerCodeLocalDataSource {
  CustomerCodeLocalDataSource();

  Future<CustomerInformation> getCustomerCodeList() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_customer_information/getCustomerInformationResponse.json',
      ),
    );
    final finalData = data['data']['customerInformationSearch'];

    return CustomerInformationDTO.fromJson(
      finalData,
    ).toDomain();
  }

  Future<CustomerInformation> getSalesRepCustomerCodeList() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/get_customer_information_for_sales_rep/getCustomerInformationForSalesRepResponse.json',
      ),
    );
    final finalData =
        data['data']['customerInformationSalesRep']['SoldToInformation'];

    return CustomerInformation(
      shipToCount: 0,
      soldToInformation: List.from(finalData)
          .map((e) => CustomerCodeDto.fromJson(e).toDomain())
          .toList(),
    );
  }

  Future<CustomerCodeConfig> getCustomerCodeConfig() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/customer_code_config/customerCodeConfig.json',
      ),
    );
    final finalData = data['data']['customerConfig'];

    return CustomerCodeConfigDto.fromJson(
      finalData,
    ).toDomain;
  }
}
