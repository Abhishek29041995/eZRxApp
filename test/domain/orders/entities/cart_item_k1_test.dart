import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  // final data = json.decode(
  //   await rootBundle
  //       .loadString('assets/json/getComboDealForMaterialResponseK1.json'),
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
  // final percentDealMaterialNumber = MaterialNumber('000000000021130726');
  // final amountDealMaterialNumber = MaterialNumber('000000000021222875');
  // final invalidDealMaterialNumber = MaterialNumber('000000000021130718');
  // final percentDealMaterial = comboMaterial(percentDealMaterialNumber, 24, 100);
  // final amountDealMaterial = comboMaterial(amountDealMaterialNumber, 20, 100);
  // final invalidDealMaterial = comboMaterial(invalidDealMaterialNumber, 15, 100);

  ///TODO: Need to revisit

  // final cartItem = CartItem.comboDeal([
  //   percentDealMaterial,
  //   amountDealMaterial,
  //   invalidDealMaterial,
  // ]);

  // group('Cart Item K1 -', () {
  // test('Eligible tier', () {
  //   expect(cartItem.eligibleComboDealQtyTier, ComboDealQtyTier.empty());
  //   expect(cartItem.eligibleComboDealSKUTier, ComboDealSKUTier.empty());
  //   expect(cartItem.eligibleComboDealTierRule, ComboDealTierRule.empty());
  // });

  // test('Combo rate', () {
  //   expect(cartItem.comboDealRate(material: percentDealMaterial), null);
  //   expect(cartItem.comboDealRate(material: amountDealMaterial), null);
  //   expect(cartItem.comboDealRate(material: invalidDealMaterial), null);
  // });

  // test('List price', () {
  //   expect(cartItem.listPrice, 5900.0);
  // });

  // test('Unit price', () {
  //   const unitPrice = 91.5 * 24 + 20 * 8 + 15 * 100;
  //   expect(cartItem.unitPrice, unitPrice);
  //   expect(cartItem.grandTotalPrice(), unitPrice);
  //   expect(cartItem.subTotalPrice(), unitPrice);
  // });

  // test('Combo not eligible when materials don\'t conform self deal', () {
  //   expect(cartItem.isComboDealEligible, true);
  //   expect(
  //     CartItem.comboDeal(
  //       [
  //         percentDealMaterial.copyWith(quantity: 1),
  //         amountDealMaterial,
  //         invalidDealMaterial,
  //       ],
  //     ).isComboDealEligible,
  //     false,
  //   );
  // });
  // });
}
