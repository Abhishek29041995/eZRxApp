import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ReturnSummaryDetailsRequestInformationLocal localDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = ReturnSummaryDetailsRequestInformationLocal();
    },
  );

  group('Return Summary Details Local DataSource Test', () {
    test(
      '=> getRequestInformation',
      () async {
        final result = await localDataSource.getReturnRequestInformation();
        expect(
          result.returnRequestInformationList.length,
          1,
        );
      },
    );
  });
}
