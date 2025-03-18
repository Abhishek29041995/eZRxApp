import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Material Info bundleStockInfoValid', () {
    late final MaterialInfo item;

    setUpAll(() async {
      item = MaterialInfo.empty().copyWith(stockInfos: []);
    });
    test('bundleStockInfoValid When Epiry Date Valid', () {
      final stockInfo = StockInfo.empty()
          .copyWith(expiryDate: DateTimeStringValue('20230917'));
      final validStockItem = item.copyWith(
        stockInfos: [stockInfo],
      );

      expect(
        validStockItem.bundleStockInfoValid,
        stockInfo,
      );
    });

    test('bundleStockInfoValid When Batch Number Valid', () {
      final stockInfo =
          StockInfo.empty().copyWith(batch: StringValue('fake-batch-number'));
      final validStockItem = item.copyWith(
        stockInfos: [stockInfo],
      );

      expect(
        validStockItem.bundleStockInfoValid,
        stockInfo,
      );
    });
    test('bundleStockInfoValid When both Batch Number And Expiry Date Invalid',
        () {
      final validStockItem = item.copyWith(
        stockInfos: [],
      );

      expect(
        validStockItem.bundleStockInfoValid,
        StockInfo.empty(),
      );
    });
  });
}
