import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SubmitMaterialInfo test - ', () {
    test('Sales district', () {
      const fakeSalesDistrict = 'fake-sales-district';
      final submitMaterialInfo =
          SubmitMaterialInfo.empty().copyWith(salesDistrict: fakeSalesDistrict);
      expect(
        submitMaterialInfo.salesDistrict,
        fakeSalesDistrict,
      );
    });
  });
}
