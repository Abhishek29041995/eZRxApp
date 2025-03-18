import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/stock_info_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late dynamic data;
  group('Test StockInfoDto Dto', () {
    setUp(() async {
      data = json.decode(
        await rootBundle.loadString(
          'assets/json/get_stock_infomation_list/getStockInformationListResponse.json',
        ),
      );
    });

    test('Test assign default value to stockInfos', () {
      final stockInfoList = List.from(data['data']['getStockInformationLists'])
          .map((e) => MaterialStockInfoDto.fromJson(e).toDomain())
          .toList();
      expect(stockInfoList[3].stockInfos, [StockInfo.empty()]);
    });
  });
}
