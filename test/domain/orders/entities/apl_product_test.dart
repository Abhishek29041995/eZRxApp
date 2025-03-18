import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/apl_product.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AplProduct entity -', () {
    test('toPriceAggregate', () {
      const newTax = 11.1;
      final newFinalPrice = MaterialPrice(11);
      final newFinalTotalPrice = MaterialPrice(20);
      const newQty = 3;
      final fakeMaterialNumber = MaterialNumber('fake-material');
      final material = PriceAggregate.empty().copyWith(
        price: Price.empty().copyWith(materialNumber: fakeMaterialNumber),
        materialInfo:
            MaterialInfo.empty().copyWith(materialNumber: fakeMaterialNumber),
      );

      final testedValue = AplProduct.empty()
          .copyWith(
            materialNumber: fakeMaterialNumber,
            tax: newTax,
            finalPrice: newFinalPrice,
            finalPriceTotal: newFinalTotalPrice,
            productQty: MaterialQty(newQty),
          )
          .toPriceAggregate(material);

      final expectedValue = material.copyWith(
        price: Price.empty().copyWith(
          materialNumber: fakeMaterialNumber,
          finalPrice: newFinalPrice,
          finalTotalPrice: newFinalTotalPrice,
        ),
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: fakeMaterialNumber,
          tax: newTax,
        ),
        quantity: newQty,
      );

      expect(testedValue, expectedValue);
    });

    test('toMaterialItemBonus', () {
      final newQty = MaterialQty(5);
      final fakeBonusMaterialNumber = MaterialNumber('fake-bonus');
      final bonus = BonusSampleItem.empty()
          .copyWith(materialNumber: fakeBonusMaterialNumber);

      final testedValue = AplProduct.empty()
          .copyWith(
            materialNumber: fakeBonusMaterialNumber,
            productQty: newQty,
          )
          .toMaterialItemBonus(bonus);

      final expectedValue = bonus.copyWith(qty: newQty);

      expect(testedValue, expectedValue);
    });
  });
}
