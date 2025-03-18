import 'package:ezrxmobile/infrastructure/aup_tc/datasource/tncdate_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AcceptanceDateLocalDataSource should - ', () {
    late AcceptanceDateLocalDataSource tncLocal;

    setUpAll(() {
      WidgetsFlutterBinding.ensureInitialized();
      tncLocal = AcceptanceDateLocalDataSource();
    });
    test('return valid local data', () async {
      final tncDate = await tncLocal.getAcceptanceDate();

      expect(tncDate.date.year, 2021);
      expect(tncDate.date.month, 7);
      expect(tncDate.date.day, 14);
    });
  });
}
