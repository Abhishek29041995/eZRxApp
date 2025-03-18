import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  // final data = json.decode(
  //   await rootBundle
  //       .loadString('assets/json/getComboDealForMaterialResponseK3.json'),
  // );

  // final comboDeal = List.from(data['data']['comboDealForMaterials'])
  //     .map((e) => ComboDealDto.fromJson(e).toDomain)
  //     .toList()
  //     .first;

  // PriceAggregate comboMaterial(
  //   MaterialNumber materialNumber,
  //   int quantity,
  //   double price,
  // ) =>
  //     PriceAggregate.empty().copyWith(
  //       materialInfo: MaterialInfo.empty().copyWith(
  //         materialNumber: materialNumber,
  //       ),
  //       price: Price.empty().copyWith(
  //         lastPrice: MaterialPrice(price),
  //       ),
  //       quantity: quantity,
  //       comboDeal: comboDeal,
  //     );

  //Unique material: 2 => invalid deal, 3 => percent deal, 4 => amount deal

  // final material1 = comboMaterial(MaterialNumber('000000000021130726'), 5, 100);
  // final material2 = comboMaterial(MaterialNumber('000000000021222875'), 5, 100);
  // final material3 = comboMaterial(MaterialNumber('000000000021130718'), 5, 100);
  // final material4 = comboMaterial(MaterialNumber('000000000021130728'), 5, 100);

  ///TODO: Need to revisit

  // group('Cart Item K3 -', () {
  //   test('Combo not eligible when self deal min qty is not suffice', () {
  //     expect(
  //       CartItem.comboDeal([
  //         material2,
  //         material1.copyWith(quantity: 1),
  //       ]).isComboDealEligible,
  //       false,
  //     );
  //   });
  //   test('Combo not eligible when unique material qty is not suffice', () {
  //     expect(CartItem.comboDeal([material2]).isComboDealEligible, false);
  //   });
  //   test(
  //       'Combo eligible when unique material qty is suffice and min qty is suffice',
  //       () {
  //     expect(
  //       CartItem.comboDeal([material1, material2]).isComboDealEligible,
  //       true,
  //     );
  //   });

  //   group('Percent deal -', () {
  //     final cartItem = CartItem.comboDeal([
  //       material1,
  //       material2,
  //       material3,
  //     ]);
  //     test('Eligible tier', () {
  //       expect(
  //         cartItem.eligibleComboDealSKUTier,
  //         ComboDealSKUTier.empty().copyWith(
  //           rate: -13.00,
  //           type: DiscountType('%'),
  //           conditionNumber: '0015958901',
  //           minQty: 3,
  //         ),
  //       );
  //       expect(cartItem.eligibleComboDealQtyTier, ComboDealQtyTier.empty());
  //       expect(cartItem.eligibleComboDealTierRule, ComboDealTierRule.empty());
  //     });

  //     test('Combo rate', () {
  //       expect(
  //         cartItem.comboDealRate(material: material1),
  //         DiscountInfo(type: DiscountType('%'), rate: -13.0),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: material2),
  //         DiscountInfo(type: DiscountType('%'), rate: -13.0),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: material3),
  //         DiscountInfo(type: DiscountType('%'), rate: -13.0),
  //       );
  //     });

  //     test('List price', () {
  //       expect(cartItem.listPrice, 1500.0);
  //     });

  //     test('Unit price', () {
  //       const unitPrice = 87.0 * 5 + 87.0 * 5 + 87.0 * 5;
  //       expect(cartItem.unitPrice, unitPrice);
  //       expect(cartItem.grandTotalPrice(), unitPrice);
  //       expect(cartItem.subTotalPrice(), unitPrice);
  //     });
  //   });

  //   group('Amount deal -', () {
  //     final cartItem = CartItem.comboDeal([
  //       material1,
  //       material2,
  //       material3,
  //       material4,
  //     ]);
  //     test('Eligible tier', () {
  //       expect(
  //         cartItem.eligibleComboDealSKUTier,
  //         ComboDealSKUTier.empty().copyWith(
  //           rate: -14.00,
  //           type: DiscountType('USD'),
  //           conditionNumber: '0015958902',
  //           minQty: 4,
  //         ),
  //       );
  //       expect(cartItem.eligibleComboDealQtyTier, ComboDealQtyTier.empty());
  //       expect(cartItem.eligibleComboDealTierRule, ComboDealTierRule.empty());
  //     });

  //     test('Combo rate', () {
  //       expect(
  //         cartItem.comboDealRate(material: material1),
  //         DiscountInfo(type: DiscountType('USD'), rate: -14.0),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: material2),
  //         DiscountInfo(type: DiscountType('USD'), rate: -14.0),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: material3),
  //         DiscountInfo(type: DiscountType('USD'), rate: -14.0),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: material4),
  //         DiscountInfo(type: DiscountType('USD'), rate: -14.0),
  //       );
  //     });

  //     test('List price', () {
  //       expect(cartItem.listPrice, 2000.0);
  //     });

  //     test('Unit price', () {
  //       const unitPrice = -14.0 * 5 + -14.0 * 5 + -14.0 * 5 + -14.0 * 5;
  //       expect(cartItem.unitPrice, unitPrice);
  //       expect(cartItem.grandTotalPrice(), unitPrice);
  //       expect(cartItem.subTotalPrice(), unitPrice);
  //     });
  //   });

  //   group('Invalid deal -', () {
  //     final cartItem = CartItem.comboDeal([
  //       material1,
  //       material2,
  //     ]);
  //     test('Eligible tier', () {
  //       expect(
  //         cartItem.eligibleComboDealSKUTier,
  //         ComboDealSKUTier.empty().copyWith(
  //           rate: -12.00,
  //           type: DiscountType(''),
  //           conditionNumber: '0015958900',
  //           minQty: 2,
  //         ),
  //       );
  //       expect(cartItem.eligibleComboDealQtyTier, ComboDealQtyTier.empty());
  //       expect(cartItem.eligibleComboDealTierRule, ComboDealTierRule.empty());
  //     });

  //     test('Combo rate', () {
  //       expect(
  //         cartItem.comboDealRate(material: material1),
  //         DiscountInfo(type: DiscountType(''), rate: -12.0),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: material2),
  //         DiscountInfo(type: DiscountType(''), rate: -12.0),
  //       );
  //     });

  //     test('List price', () {
  //       expect(cartItem.listPrice, 1000.0);
  //     });

  //     test('Unit price', () {
  //       const unitPrice = 100 * 5 + 100 * 5;
  //       expect(cartItem.unitPrice, unitPrice);
  //       expect(cartItem.grandTotalPrice(), unitPrice);
  //       expect(cartItem.subTotalPrice(), unitPrice);
  //     });
  //   });
  // });
}
