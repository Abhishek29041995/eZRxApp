import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Return Item Test', () {
    final paymentStatus = ReturnItem.empty().copyWith(
      outsidePolicy: true,
    );

    expect(paymentStatus.outsidePolicy, true);
  });
}
