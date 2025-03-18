import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  const fakePrice = 12.23;
  final pngPrincipleCode = PrincipalCode('105307');
  final comOrderItemType = OrderItemType('Comm');
  final bonusOrderItemType = OrderItemType('Bonus');
  const priceNotAvailableText = 'Price Not Available';
  const freeText = 'FREE';

  group('OrderHistoryDetailOrderItem entity -', () {
    group('Item unit price -', () {
      test(
          'Display Price not available when is MYExternalSalesRep, material is PnG and invoice number is not valid',
          () {
        expect(
          OrderHistoryDetailsOrderItem.empty()
              .copyWith(
                type: comOrderItemType,
                principalData: PrincipalData.empty().copyWith(
                  principalCode: pngPrincipleCode,
                ),
              )
              .itemUnitPrice(true),
          priceNotAvailableText,
        );
      });

      test('Display 0 when is bonus and market is ID', () {
        expect(
          OrderHistoryDetailsOrderItem.empty()
              .copyWith(type: bonusOrderItemType)
              .itemUnitPrice(true),
          0.toString(),
        );
      });

      test('Display FREE when is bonus and market is not ID', () {
        expect(
          OrderHistoryDetailsOrderItem.empty()
              .copyWith(type: bonusOrderItemType)
              .itemUnitPrice(false),
          freeText,
        );
      });

      test('Display Price not available when price is 0', () {
        expect(
          OrderHistoryDetailsOrderItem.empty()
              .copyWith(unitPrice: 0)
              .itemUnitPrice(false),
          priceNotAvailableText,
        );
      });

      test('Display normal price', () {
        expect(
          OrderHistoryDetailsOrderItem.empty()
              .copyWith(unitPrice: fakePrice)
              .itemUnitPrice(false),
          fakePrice.toString(),
        );
      });
    });

    group('Item total price -', () {
      test('Get Total Price as 0 when total price is 0', () {
        expect(
          OrderHistoryDetailsOrderItem.empty()
              .copyWith(totalPrice: 0)
              .totalPrice,
          0,
        );
      });

      test('Get total price as 0 when hidePrice is true', () {
        expect(
          OrderHistoryDetailsOrderItem.empty()
              .copyWith(hidePrice: true)
              .totalPrice,
          0,
        );
      });

      test('Display normal price', () {
        expect(
          OrderHistoryDetailsOrderItem.empty()
              .copyWith(totalPrice: fakePrice)
              .totalPrice,
          fakePrice,
        );
      });
    });
  });

  group('OrderHistoryDetailOrderItem list', () {
    final zpOrderItem = OrderHistoryDetailsOrderItem.empty().copyWith(
      isMarketPlace: false,
      type: OrderItemType('Comm'),
      unitPrice: 20,
    );
    final mpOrderItem = OrderHistoryDetailsOrderItem.empty().copyWith(
      isMarketPlace: true,
      type: OrderItemType('Comm'),
      unitPrice: 30,
    );

    test(
      'Get only zp items',
      () => expect([zpOrderItem, mpOrderItem].zpItemOnly, [zpOrderItem]),
    );

    test(
      'Get only mp items',
      () => expect([zpOrderItem, mpOrderItem].mpItemOnly, [mpOrderItem]),
    );

    test('Check if contain item has invalid price', () {
      final hidePriceItem = zpOrderItem.copyWith(hidePrice: true);
      final zeroPriceItem = mpOrderItem.copyWith(unitPrice: 0);
      final bonusItem = zpOrderItem.copyWith(
        type: OrderItemType('Bonus'),
        hidePrice: true,
        unitPrice: 0,
      );

      expect(
        [zpOrderItem, mpOrderItem, hidePriceItem]
            .containsMaterialsWithInvalidPrice,
        true,
      );
      expect(
        [zpOrderItem, mpOrderItem, zeroPriceItem]
            .containsMaterialsWithInvalidPrice,
        true,
      );
      expect(
        [zpOrderItem, mpOrderItem, bonusItem].containsMaterialsWithInvalidPrice,
        false,
      );
    });
  });
}
