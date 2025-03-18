import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  // final data = json.decode(
  //   await rootBundle
  //       .loadString('assets/json/getComboDealForMaterialResponseK2.1.json'),
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
  //       comboDeal:
  //           comboDeal.copyWith.groupDeal(type: DiscountType(discountType)),
  //     );

  //Set 1
  // final percentDealMaterial =
  //     comboMaterial(MaterialNumber('000000000021130726'), 2, 100, '%');
  // //Set 2
  // final amountDealMaterial =
  //     comboMaterial(MaterialNumber('000000000021222875'), 1, 100, 'USD');
  // final invalidDealMaterial =
  //     comboMaterial(MaterialNumber('000000000021130718'), 1, 100, '');

  ///TODO: Need to revisit

  // group('Cart Item K2.1 -', () {
  //   test('Combo not eligible when set 1 unselected', () {
  //     expect(
  //       CartItem.comboDeal([amountDealMaterial, invalidDealMaterial])
  //           .isComboDealEligible,
  //       false,
  //     );
  //   });
  //   test('Combo not eligible when set 2 unselected', () {
  //     expect(
  //       CartItem.comboDeal([percentDealMaterial]).isComboDealEligible,
  //       false,
  //     );
  //   });
  //   test('Combo is eligible when both sets are unselected', () {
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
  //       expect(cartItem.eligibleComboDealQtyTier, ComboDealQtyTier.empty());
  //       expect(cartItem.eligibleComboDealSKUTier, ComboDealSKUTier.empty());
  //       expect(cartItem.eligibleComboDealTierRule, ComboDealTierRule.empty());
  //     });

  //     test('Combo rate', () {
  //       expect(
  //         cartItem.comboDealRate(material: percentDealMaterial),
  //         comboDeal.groupDeal.copyWith(type: DiscountType('%')).discountInfo,
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: amountDealMaterial),
  //         comboDeal.groupDeal.copyWith(type: DiscountType('%')).discountInfo,
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: invalidDealMaterial),
  //         comboDeal.groupDeal.copyWith(type: DiscountType('%')).discountInfo,
  //       );
  //     });

  //     test('List price', () {
  //       expect(cartItem.listPrice, 400.0);
  //     });

  //     test('Unit price', () {
  //       const unitPrice = 85.0 * 2 + 85.0 * 1 + 85.0 * 1;
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
  //       expect(cartItem.eligibleComboDealQtyTier, ComboDealQtyTier.empty());
  //       expect(cartItem.eligibleComboDealSKUTier, ComboDealSKUTier.empty());
  //       expect(cartItem.eligibleComboDealTierRule, ComboDealTierRule.empty());
  //     });

  //     test('Combo rate', () {
  //       expect(
  //         cartItem.comboDealRate(material: percentDealMaterial),
  //         comboDeal.groupDeal.copyWith(type: DiscountType('USD')).discountInfo,
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: amountDealMaterial),
  //         comboDeal.groupDeal.copyWith(type: DiscountType('USD')).discountInfo,
  //       );
  //     });

  //     test('List price', () {
  //       expect(cartItem.listPrice, 300.0);
  //     });

  //     test('Unit price', () {
  //       const unitPrice = -15.0 * 2 + -15.0 * 1;
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
  //       expect(cartItem.eligibleComboDealQtyTier, ComboDealQtyTier.empty());
  //       expect(cartItem.eligibleComboDealSKUTier, ComboDealSKUTier.empty());
  //       expect(cartItem.eligibleComboDealTierRule, ComboDealTierRule.empty());
  //     });

  //     test('Combo rate', () {
  //       expect(
  //         cartItem.comboDealRate(material: percentDealMaterial),
  //         comboDeal.groupDeal.copyWith(type: DiscountType('')).discountInfo,
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: amountDealMaterial),
  //         comboDeal.groupDeal.copyWith(type: DiscountType('')).discountInfo,
  //       );
  //     });

  //     test('List price', () {
  //       expect(cartItem.listPrice, 300.0);
  //     });

  //     test('Unit price', () {
  //       const unitPrice = 100 * 2 + 100 * 1;
  //       expect(cartItem.unitPrice, unitPrice);
  //       expect(cartItem.grandTotalPrice(), unitPrice);
  //       expect(cartItem.subTotalPrice(), unitPrice);
  //     });
  //   });
  // });
}
