import 'dart:convert';

import 'package:ezrxmobile/infrastructure/returns/datasource/return_list_local.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ReturnListLocalDataSource localDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = ReturnListLocalDataSource();
    },
  );

  group(
    'Return list Local Datasource => ',
    () {
      test(
        'getFileUrl',
        () async {
          final data = json.decode(
            await rootBundle.loadString(
              'assets/json/request_by_items_excel/requestsByItemsExcelResponse.json',
            ),
          );

          final result = await localDataSource.getFileUrl();

          expect(
            result,
            data['data']['requestsByItemsExcel']['url'],
          );
        },
      );
    },
  );
}
