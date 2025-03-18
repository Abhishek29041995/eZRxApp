import 'dart:convert';

import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_local.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_representative_info_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SalesRepLocalDataSource localDataSource;

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    localDataSource = SalesRepLocalDataSource();
  });

  group('SalesRep Local DataSource Test', () {
    test(
      '=> get SalesRep Info',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/get_sales_rep_info/getSalesRepInfoResponse.json',
          ),
        );
        final result = await localDataSource.getSalesRepInfo();

        expect(
          result,
          SalesRepresentativeInfoDto.fromJson(
            res['data']['salesRepresentativeInfo']['rawMetaData'],
          ).toDomain(),
        );
      },
    );
  });
}
