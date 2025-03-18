import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  // final data = json.decode(
  //   await rootBundle
  //       .loadString('assets/json/getComboDealForMaterialResponseK2.2.json'),
  // );

  // final comboDeal = List.from(data['data']['comboDealForMaterials'])
  //     .map((e) => ComboDealDto.fromJson(e).toDomain)
  //     .toList()
  //     .first;

  // PriceAggregate comboMaterial(
  //   MaterialNumber materialNumber,
  //   int quantity,
  //   double price,
  //   String discountType,
  // ) =>
  //     PriceAggregate.empty().copyWith(
  //       materialInfo: MaterialInfo.empty().copyWith(
  //         materialNumber: materialNumber,
  //       ),
  //       price: Price.empty().copyWith(
  //         lastPrice: MaterialPrice(price),
  //       ),
  //       quantity: quantity,
  //       comboDeal: comboDeal.copyWith(
  //         flexiQtyTier: [
  //           comboDeal.flexiQtyTier.first.copyWith(
  //             type: DiscountType(discountType),
  //           )
  //         ],
  //       ),
  //     );

  // final percentDealMaterial =
  //     comboMaterial(MaterialNumber('000000000021130726'), 1, 100, '%');
  // final amountDealMaterial =
  //     comboMaterial(MaterialNumber('000000000021222875'), 1, 100, 'USD');
  // final invalidDealMaterial =
  //     comboMaterial(MaterialNumber('000000000021130718'), 1, 100, '');

  ///TODO: Need to revisit

  // group('Cart Item K2.2 -', () {
  //   test('Combo not eligible when total qty is not suffice', () {
  //     expect(
  //       CartItem.comboDeal([amountDealMaterial]).isComboDealEligible,
  //       false,
  //     );
  //   });
  //   test('Combo not eligible when total qty is suffice', () {
  //     expect(
  //       CartItem.comboDeal([percentDealMaterial, amountDealMaterial])
  //           .isComboDealEligible,
  //       true,
  //     );
  //   });

  //   group('Percent deal -', () {
  //     final cartItem = CartItem.comboDeal([
  //       percentDealMaterial,
  //       amountDealMaterial,
  //       invalidDealMaterial,
  //     ]);
  //     test('Eligible tier', () {
  //       expect(
  //         cartItem.eligibleComboDealQtyTier,
  //         ComboDealQtyTier.empty().copyWith(
  //           rate: -15.0,
  //           type: DiscountType('%'),
  //           conditionNumber: '0015958842',
  //           minQty: 2,
  //         ),
  //       );
  //       expect(cartItem.eligibleComboDealSKUTier, ComboDealSKUTier.empty());
  //       expect(cartItem.eligibleComboDealTierRule, ComboDealTierRule.empty());
  //     });

  //     test('Combo rate', () {
  //       expect(
  //         cartItem.comboDealRate(material: percentDealMaterial),
  //         DiscountInfo(type: DiscountType('%'), rate: -15.0),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: amountDealMaterial),
  //         DiscountInfo(type: DiscountType('%'), rate: -15.0),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: invalidDealMaterial),
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
  //       amountDealMaterial,
  //       percentDealMaterial,
  //     ]);
  //     test('Eligible tier', () {
  //       expect(
  //         cartItem.eligibleComboDealQtyTier,
  //         ComboDealQtyTier.empty().copyWith(
  //           rate: -15.0,
  //           type: DiscountType('USD'),
  //           conditionNumber: '0015958842',
  //           minQty: 2,
  //         ),
  //       );
  //       expect(cartItem.eligibleComboDealSKUTier, ComboDealSKUTier.empty());
  //       expect(cartItem.eligibleComboDealTierRule, ComboDealTierRule.empty());
  //     });

  //     test('Combo rate', () {
  //       expect(
  //         cartItem.comboDealRate(material: percentDealMaterial),
  //         DiscountInfo(type: DiscountType('USD'), rate: -15.0),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: amountDealMaterial),
  //         DiscountInfo(type: DiscountType('USD'), rate: -15.0),
  //       );
  //     });

  //     test('List price', () {
  //       expect(cartItem.listPrice, 200.0);
  //     });

  //     test('Unit price', () {
  //       const unitPrice = -15.0 * 1 + -15.0 * 1;
  //       expect(cartItem.unitPrice, unitPrice);
  //       expect(cartItem.grandTotalPrice(), unitPrice);
  //       expect(cartItem.subTotalPrice(), unitPrice);
  //     });
  //   });

  //   group('Invalid deal -', () {
  //     final cartItem = CartItem.comboDeal([
  //       invalidDealMaterial,
  //       percentDealMaterial,
  //     ]);
  //     test('Eligible tier', () {
  //       expect(
  //         cartItem.eligibleComboDealQtyTier,
  //         ComboDealQtyTier.empty().copyWith(
  //           rate: -15.0,
  //           type: DiscountType(''),
  //           conditionNumber: '0015958842',
  //           minQty: 2,
  //         ),
  //       );
  //       expect(cartItem.eligibleComboDealSKUTier, ComboDealSKUTier.empty());
  //       expect(cartItem.eligibleComboDealTierRule, ComboDealTierRule.empty());
  //     });

  //     test('Combo rate', () {
  //       expect(
  //         cartItem.comboDealRate(material: percentDealMaterial),
  //         DiscountInfo(type: DiscountType(''), rate: -15.0),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: amountDealMaterial),
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
