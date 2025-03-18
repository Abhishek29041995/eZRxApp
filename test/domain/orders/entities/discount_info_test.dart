import 'package:ezrxmobile/domain/order/entities/discount_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Discount info display text', () {
    final percentDiscount =
        DiscountInfo(type: DiscountType('%'), rate: -10, minQty: 2);
    final amountDiscount =
        DiscountInfo(type: DiscountType('USD'), rate: -10, minQty: 2);

    expect(percentDiscount.text, '-10.0 %');
    expect(amountDiscount.text, 'USD -10.0');
  });
}
