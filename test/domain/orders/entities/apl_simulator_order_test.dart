import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/apl_product.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final fakeMaterialNumber = MaterialNumber('fake-material');
  final fakeSecondMaterialNumber = MaterialNumber('fake-material-2');
  final fakeBonusMaterialNumber = MaterialNumber('fake-bonus');

  final material = PriceAggregate.empty().copyWith(
    materialInfo:
        MaterialInfo.empty().copyWith(materialNumber: fakeMaterialNumber),
  );

  final materialApl = AplProduct.empty().copyWith(
    type: MaterialInfoType.material(),
    materialNumber: fakeMaterialNumber,
    itemNumber: '1',
  );
  final bonusApl = AplProduct.empty().copyWith(
    type: MaterialInfoType.bonus(),
    materialNumber: fakeBonusMaterialNumber,
    itemNumber: '2',
    parentItemNumber: '1',
  );
  final secondMaterialApl = AplProduct.empty().copyWith(
    type: MaterialInfoType.material(),
    materialNumber: fakeSecondMaterialNumber,
    itemNumber: '2',
  );

  group('AplSimulatorOrder entity -', () {
    test('productDeterminationList', () {
      final testedValue = AplSimulatorOrder.empty().copyWith(
        aplProducts: [materialApl, secondMaterialApl],
      ).productDeterminationList(
        [materialApl.toPriceAggregate(material)],
      );
      expect(testedValue, [secondMaterialApl]);
    });
    test('toCartItemList', () {
      final newMaterial = materialApl.toPriceAggregate(material);
      final testedValue = AplSimulatorOrder.empty().copyWith(
        aplProducts: [materialApl, bonusApl],
      ).toCartItemList([material]);

      expect(testedValue, [newMaterial]);
    });
  });
}
