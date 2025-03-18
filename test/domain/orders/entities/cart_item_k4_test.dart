import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  // final data = json.decode(
  //   await rootBundle
  //       .loadString('assets/json/getComboDealForMaterialResponseK4.json'),
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

  // //total material Qty: 2 => invalid deal, 3 => percent deal, 4 => amount deal

  // final material1 = comboMaterial(MaterialNumber('000000000021130726'), 1, 100);
  // final material2 = comboMaterial(MaterialNumber('000000000021222875'), 1, 100);
  // final material3 = comboMaterial(MaterialNumber('000000000021130718'), 1, 100);
  // final material4 = comboMaterial(MaterialNumber('000000000021130728'), 1, 100);

  ///TODO: Need to revisit

  // group('Cart Item K4 -', () {
  //   test('Combo not eligible when total qty is not suffice', () {
  //     expect(CartItem.comboDeal([material2]).isComboDealEligible, false);
  //   });
  //   test('Combo eligible when when total qty is suffice', () {
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
  //         cartItem.eligibleComboDealQtyTier,
  //         ComboDealQtyTier.empty().copyWith(
  //           rate: -15.00,
  //           type: DiscountType('%'),
  //           conditionNumber: '0015958842',
  //           minQty: 3,
  //           suffix: ComboSuffix('2'),
  //         ),
  //       );
  //       expect(cartItem.eligibleComboDealSKUTier, ComboDealSKUTier.empty());
  //       expect(cartItem.eligibleComboDealTierRule, ComboDealTierRule.empty());
  //     });

  //     test('Combo rate', () {
  //       expect(
  //         cartItem.comboDealRate(material: material1),
  //         DiscountInfo(type: DiscountType('%'), rate: -15.0),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: material2),
  //         DiscountInfo(type: DiscountType('%'), rate: -15.0),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: material3),
  //         DiscountInfo(type: DiscountType('%'), rate: -15.0),
  //       );
  //     });

  //     test('List price', () {
  //       expect(cartItem.listPrice, 300.0);
  //     });

  //     test('Unit price', () {
  //       const unitPrice = 85.0 * 1 + 85.0 * 1 + 85.0 * 1;
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
  //         cartItem.eligibleComboDealQtyTier,
  //         ComboDealQtyTier.empty().copyWith(
  //           rate: -30.00,
  //           type: DiscountType('USD'),
  //           conditionNumber: '0015958842',
  //           minQty: 4,
  //           suffix: ComboSuffix('3'),
  //         ),
  //       );
  //       expect(cartItem.eligibleComboDealSKUTier, ComboDealSKUTier.empty());
  //       expect(cartItem.eligibleComboDealTierRule, ComboDealTierRule.empty());
  //     });

  //     test('Combo rate', () {
  //       expect(
  //         cartItem.comboDealRate(material: material1),
  //         DiscountInfo(type: DiscountType('USD'), rate: -30.0),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: material2),
  //         DiscountInfo(type: DiscountType('USD'), rate: -30.0),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: material3),
  //         DiscountInfo(type: DiscountType('USD'), rate: -30.0),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: material4),
  //         DiscountInfo(type: DiscountType('USD'), rate: -30.0),
  //       );
  //     });

  //     test('List price', () {
  //       expect(cartItem.listPrice, 400.0);
  //     });

  //     test('Unit price', () {
  //       const unitPrice = -30.0 * 1 + -30.0 * 1 + -30.0 * 1 + -30.0 * 1;
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
  //         cartItem.eligibleComboDealQtyTier,
  //         ComboDealQtyTier.empty().copyWith(
  //           rate: -15.00,
  //           type: DiscountType(''),
  //           conditionNumber: '0015958842',
  //           minQty: 2,
  //           suffix: ComboSuffix('1'),
  //         ),
  //       );
  //       expect(cartItem.eligibleComboDealSKUTier, ComboDealSKUTier.empty());
  //       expect(cartItem.eligibleComboDealTierRule, ComboDealTierRule.empty());
  //     });

  //     test('Combo rate', () {
  //       expect(
  //         cartItem.comboDealRate(material: material1),
  //         DiscountInfo(type: DiscountType(''), rate: -15.0),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: material2),
  //         DiscountInfo(type: DiscountType(''), rate: -15.0),
  //       );
  //     });

  //     test('List price', () {
  //       expect(cartItem.listPrice, 200.0);
  //     });

  //     test('Unit price', () {
  //       const unitPrice = 100 * 1 + 100 * 1;
  //       expect(cartItem.unitPrice, unitPrice);
  //       expect(cartItem.grandTotalPrice(), unitPrice);
  //       expect(cartItem.subTotalPrice(), unitPrice);
  //     });
  //   });
  // });
}
