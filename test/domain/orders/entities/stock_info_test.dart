import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Stock Info displayBatchNumber', () {
    late final StockInfo item;

    setUpAll(() async {
      item = StockInfo.empty();
    });
    test('displayBatchNumber When isMarketPlace = true', () {
      expect(
        item.displayBatchNumber(isMarketPlace: true),
        'NA',
      );
    });

    test('displayBatchNumber When isMarketPlace = false', () {
      final validBatchItem =
          item.copyWith(batch: StringValue('fake-batch_number'));
      expect(
        validBatchItem.displayBatchNumber(isMarketPlace: false),
        'fake-batch_number',
      );
    });
  });

  group('Stock Info displayExpiryDate', () {
    test('displayBatchNumber When isMarketPlace = true', () {
      final item = StockInfo.empty();
      expect(
        item.displayExpiryDate(
          isMarketPlace: true,
          isPhMdi: false,
          isAbbotPrincipalCode: false,
        ),
        'NA',
      );
    });
    test('displayBatchNumber When isMarketPlace = false', () {
      final item = StockInfo.empty()
          .copyWith(expiryDate: DateTimeStringValue('20230917'));
      expect(
        item.displayExpiryDate(
          isMarketPlace: false,
          isPhMdi: false,
          isAbbotPrincipalCode: false,
        ),
        '17 Sep 2023',
      );
    });

    test(
        'displayBatchNumber When required bool isPhMdi = true and isAbbotPrincipalCode = true',
        () {
      final item = StockInfo.empty()
          .copyWith(expiryDate: DateTimeStringValue('20230917'));
      expect(
        item.displayExpiryDate(
          isMarketPlace: true,
          isPhMdi: true,
          isAbbotPrincipalCode: false,
        ),
        'NA',
      );
    });
  });
}
