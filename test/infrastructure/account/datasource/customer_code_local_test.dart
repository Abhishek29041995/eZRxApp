import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/customer_code_information.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_code_config_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_code_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CustomerCodeLocalDataSource localDataSource;

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    localDataSource = CustomerCodeLocalDataSource();
  });

  group('Customer Code Local DataSource Test', () {
    test(
      '=> getCustomerCodeConfig',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/customer_code_config/customerCodeConfig.json',
          ),
        );
        final result = await localDataSource.getCustomerCodeConfig();

        expect(
          result,
          CustomerCodeConfigDto.fromJson(res['data']['customerConfig'])
              .toDomain,
        );
      },
    );

    test(
      '=> getSalesRepCustomerCodeList',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/get_customer_information_for_sales_rep/getCustomerInformationForSalesRepResponse.json',
          ),
        );
        final result = await localDataSource.getSalesRepCustomerCodeList();

        expect(
          result,
          CustomerInformation(
            shipToCount: 0,
            soldToInformation: List.from(
              res['data']['customerInformationSalesRep']['SoldToInformation'],
            ).map((e) => CustomerCodeDto.fromJson(e).toDomain()).toList(),
          ),
        );
      },
    );
  });
}
