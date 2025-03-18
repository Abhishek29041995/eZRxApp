import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  const fakePrice = 12.23;
  final pngPrincipleCode = PrincipalCode('105307');
  const priceNotAvailableText = 'Price Not Available';
  const freeText = 'FREE';

  group('OrderHistoryItem entity -', () {
    group('Item unit price -', () {
      test(
          'Display Price not available when is MYExternalSalesRep, material is PnG and invoice number is not valid',
          () {
        expect(
          OrderHistoryItem.empty()
              .copyWith
              .principalData(principalCode: pngPrincipleCode)
              .itemUnitPrice(true),
          priceNotAvailableText,
        );
      });

      test('Display 0 when is bonus and market is ID', () {
        expect(
          OrderHistoryItem.empty()
              .copyWith(isBonusMaterial: true)
              .itemUnitPrice(true),
          0.toString(),
        );
      });

      test('Display FREE when is bonus and market is not ID', () {
        expect(
          OrderHistoryItem.empty()
              .copyWith(isBonusMaterial: true)
              .itemUnitPrice(false),
          freeText,
        );
      });

      test('Display Price not available when price is 0', () {
        expect(
          OrderHistoryItem.empty().copyWith(unitPrice: 0).itemUnitPrice(false),
          priceNotAvailableText,
        );
      });

      test('Display normal price', () {
        expect(
          OrderHistoryItem.empty()
              .copyWith(unitPrice: fakePrice)
              .itemUnitPrice(false),
          fakePrice.toString(),
        );
      });
    });

    group('Item total price with tax-', () {
      test(
          'Display Price not available when is MYExternalSalesRep, material is PnG and invoice number is not valid',
          () {
        expect(
          OrderHistoryItem.empty()
              .copyWith
              .principalData(
                principalCode: pngPrincipleCode,
              )
              .itemTotalNetPrice(true),
          priceNotAvailableText,
        );
      });

      test('Display 0 when is bonus and market is ID', () {
        expect(
          OrderHistoryItem.empty()
              .copyWith(isBonusMaterial: true)
              .itemTotalNetPrice(true),
          0.toString(),
        );
      });

      test('Display FREE when is bonus and market is not ID', () {
        expect(
          OrderHistoryItem.empty()
              .copyWith(isBonusMaterial: true)
              .itemTotalNetPrice(false),
          freeText,
        );
      });

      test('Display Price not available when price is 0', () {
        expect(
          OrderHistoryItem.empty()
              .copyWith(totalUnitPrice: 0)
              .itemTotalNetPrice(false),
          priceNotAvailableText,
        );
      });

      test('Display normal price', () {
        expect(
          OrderHistoryItem.empty()
              .copyWith(totalUnitPrice: fakePrice)
              .itemTotalNetPrice(false),
          fakePrice.toString(),
        );
      });

      test('Display tax rate', () {
        expect(
          OrderHistoryItem.empty().copyWith(taxRate: 10).taxRate,
          10,
        );
      });

      test('Display total tax ', () {
        expect(
          OrderHistoryItem.empty().copyWith(totalTax: 50).totalTax,
          50,
        );
      });
    });

    test('manufacturerPrefix', () {
      expect(OrderHistoryItem.empty().manufacturerPrefix, '');
      expect(
        OrderHistoryItem.empty()
            .copyWith(isMarketPlace: true)
            .manufacturerPrefix,
        'Sold by',
      );
    });
  });
}
