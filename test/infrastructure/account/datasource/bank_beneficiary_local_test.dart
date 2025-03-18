import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BankBeneficiaryLocalDataSource localDataSource;

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    localDataSource = BankBeneficiaryLocalDataSource();
  });

  group('Bank Beneficiary Local DataSource Test', () {
    test(
      '=> getBankBeneficiariesBySaleOrg',
      () async {
        final result = await localDataSource.getBankBeneficiariesBySaleOrg();

        expect(
          result.length,
          2,
        );
      },
    );
  });
}
