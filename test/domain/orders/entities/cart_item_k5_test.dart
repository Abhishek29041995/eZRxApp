import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  // final data = json.decode(
  //   await rootBundle
  //       .loadString('assets/json/getComboDealForPrincipleGroupResponseK5.json'),
  // );

  // final comboDeal =
  //     ComboDealDto.fromJson(data['data']['comboDealForPrincMatGrp']).toDomain;

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

  //total order amount:
  //>=200 => invalid deal,
  //>=500 => percent deal,
  //>=700 => amount deal

  // final material1 =
  //     comboMaterial(MaterialNumber('000000000021130726'), 1, 19.99);
  // final material2 = comboMaterial(MaterialNumber('000000000021222875'), 1, 100);

  ///TODO: Need to revisit

  // group('Cart Item K5 -', () {
  //   test('Combo not eligible when total amount is not suffice', () {
  //     expect(CartItem.comboDeal([material2]).isComboDealEligible, false);
  //   });
  //   test('Combo eligible when when total amount is suffice', () {
  //     expect(
  //       CartItem.comboDeal([material1, material2.copyWith(quantity: 2)])
  //           .isComboDealEligible,
  //       true,
  //     );
  //   });

  //   group('Percent deal -', () {
  //     final cartItem =
  //         CartItem.comboDeal([material1.copyWith(quantity: 29), material2]);
  //     test('Eligible tier', () {
  //       expect(cartItem.eligibleComboDealQtyTier, ComboDealQtyTier.empty());
  //       expect(cartItem.eligibleComboDealSKUTier, ComboDealSKUTier.empty());
  //       expect(
  //         cartItem.eligibleComboDealTierRule,
  //         ComboDealTierRule(
  //           rate: -3.00,
  //           type: DiscountType('%'),
  //           minTotalAmount: 500.00,
  //           maxTotalAmount: 700.00,
  //           minTotalCurrency: 'USD',
  //           maxTotalCurrency: 'USD',
  //           minQty: 0,
  //           conditionNumber: '0015959395',
  //         ),
  //       );
  //     });

  //     test('Combo rate', () {
  //       expect(
  //         cartItem.comboDealRate(material: material1),
  //         DiscountInfo(type: DiscountType('%'), rate: -3.0),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: material2),
  //         DiscountInfo(type: DiscountType('%'), rate: -3.0),
  //       );
  //     });

  //     test('List price', () {
  //       expect(cartItem.listPrice, 19.99 * 29 + 100.00);
  //     });

  //     test('Unit price', () {
  //       final unitPrice = NumUtils.priceByRate(19.99, -3) * 29 +
  //           NumUtils.priceByRate(100, -3);
  //       expect(cartItem.unitPrice, unitPrice);
  //       expect(cartItem.grandTotalPrice(), unitPrice);
  //       expect(cartItem.subTotalPrice(), unitPrice);
  //     });
  //   });

  //   group('Amount deal -', () {
  //     final cartItem = CartItem.comboDeal([
  //       material1.copyWith(quantity: 2),
  //       material2.copyWith(quantity: 7),
  //     ]);
  //     test('Eligible tier', () {
  //       expect(cartItem.eligibleComboDealQtyTier, ComboDealQtyTier.empty());
  //       expect(cartItem.eligibleComboDealSKUTier, ComboDealSKUTier.empty());
  //       expect(
  //         cartItem.eligibleComboDealTierRule,
  //         ComboDealTierRule(
  //           rate: 5.10,
  //           type: DiscountType('USD'),
  //           minTotalAmount: 701.00,
  //           maxTotalAmount: 000.00,
  //           minTotalCurrency: 'USD',
  //           maxTotalCurrency: 'USD',
  //           minQty: 0,
  //           conditionNumber: '0015959397',
  //         ),
  //       );
  //     });

  //     test('Combo rate', () {
  //       expect(
  //         cartItem.comboDealRate(material: material1),
  //         DiscountInfo(type: DiscountType('USD'), rate: 5.10),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: material2),
  //         DiscountInfo(type: DiscountType('USD'), rate: 5.10),
  //       );
  //     });

  //     test('List price', () {
  //       expect(cartItem.listPrice, 739.98);
  //     });

  //     test('Unit price', () {
  //       const unitPrice = 5.10 * 2 + 5.10 * 7;
  //       expect(cartItem.unitPrice, unitPrice);
  //       expect(cartItem.grandTotalPrice(), unitPrice);
  //       expect(cartItem.subTotalPrice(), unitPrice);
  //     });
  //   });

  //   group('Invalid deal -', () {
  //     final cartItem = CartItem.comboDeal([
  //       material1.copyWith(quantity: 2),
  //       material2.copyWith(quantity: 2),
  //     ]);
  //     test('Eligible tier', () {
  //       expect(cartItem.eligibleComboDealQtyTier, ComboDealQtyTier.empty());
  //       expect(cartItem.eligibleComboDealSKUTier, ComboDealSKUTier.empty());
  //       expect(
  //         cartItem.eligibleComboDealTierRule,
  //         ComboDealTierRule(
  //           rate: -5.00,
  //           type: DiscountType(''),
  //           minTotalAmount: 200.00,
  //           maxTotalAmount: 499.00,
  //           minTotalCurrency: 'USD',
  //           maxTotalCurrency: 'USD',
  //           minQty: 0,
  //           conditionNumber: '0015959396',
  //         ),
  //       );
  //     });

  //     test('Combo rate', () {
  //       expect(
  //         cartItem.comboDealRate(material: material1),
  //         DiscountInfo(type: DiscountType(''), rate: -5.0),
  //       );
  //       expect(
  //         cartItem.comboDealRate(material: material2),
  //         DiscountInfo(type: DiscountType(''), rate: -5.0),
  //       );
  //     });

  //     test('List price', () {
  //       expect(cartItem.listPrice, 239.98);
  //     });

  //     test('Unit price', () {
  //       const unitPrice = 19.99 * 2 + 100 * 2;
  //       expect(cartItem.unitPrice, unitPrice);
  //       expect(cartItem.grandTotalPrice(), unitPrice);
  //       expect(cartItem.subTotalPrice(), unitPrice);
  //     });
  //   });
  // });
}
