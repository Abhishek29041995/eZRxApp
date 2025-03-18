import 'dart:convert';

import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_local.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_material_list_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ReturnRequestLocalDataSource localDataSource;

  setUpAll(
        () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = ReturnRequestLocalDataSource();
    },
  );

  group(
    'returnRequestLocalDataSource',
        () {
      test(
        'searchReturnMaterialsForSalesRep',
            () async {
          final data = json.decode(
            await rootBundle.loadString(
              'assets/json/search_return_materials_sales_rep_v2/searchReturnMaterialSalesRepV2Response.json',
            ),
          );

          final result = await localDataSource.searchReturnMaterialsForSalesRep();

          expect(
            result,
            ReturnMaterialListDto.fromJson(
              data['data']['searchReturnMaterialsForSalesRepV2'],
            ).toDomain(),
          );
        },
      );

      test(
        'addRequest',
            () async {
          final data = json.decode(
            await rootBundle.loadString(
              'assets/json/add_request_v2/addRequestV2Response.json',
            ),
          );

          final result = await localDataSource.addRequest();

          expect(
            result,
            data['data']['addRequestV2']['requestID'] as String,
          );
        },
      );
    },
  );
}
