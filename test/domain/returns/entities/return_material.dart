import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Return Material Test', () {
    final paymentStatus = ReturnMaterial.empty().copyWith(
      outsidePolicy: true,
    );

    expect(paymentStatus.outsidePolicy, true);
  });
}
