import 'package:ezrxmobile/infrastructure/returns/datasource/usage_code_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late UsageCodeLocalDataSource usageCodeLocalDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      usageCodeLocalDataSource = UsageCodeLocalDataSource();
    },
  );
  group(
    'Usage Code Local Datasource Test',
    () {
      test(
        '=> getUsages',
        () async {
          final result = await usageCodeLocalDataSource.getUsages();

          expect(
            result.length,
            13,
          );
        },
      );
    },
  );
}
