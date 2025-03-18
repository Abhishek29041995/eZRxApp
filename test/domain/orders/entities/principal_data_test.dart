import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/claim_management_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late List<PrincipalData> entities;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    entities = await ClaimManagementLocalDataSource().getPrincipalForSalesOrg();
  });
  group('PrincipalData entity -', () {
    test('searchItemText test', () {
      expect(
        entities.first.searchItemText,
        'B. BRAUN MEDICAL INC. - 0000100462',
      );
    });

    test('isEmpty test', () {
      expect(
        entities.first.isEmpty,
        false,
      );
    });

    test('isNotEmpty test', () {
      expect(
        entities.first.isNotEmpty,
        true,
      );
    });

    test('listContainText test', () {
      expect(
        entities.listContainText('braun'),
        [entities.first],
      );
    });

    test('getByText found data test', () {
      expect(
        entities.getByText('B. BRAUN MEDICAL INC. - 0000100462'),
        entities.first,
      );
    });

    test('getByText not found test', () {
      expect(
        entities.getByText('B. BRAUN'),
        PrincipalData.empty(),
      );
    });
  });
}
