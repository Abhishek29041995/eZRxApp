import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final zpOrderItem =
      OrderHistoryDetailsOrderItem.empty().copyWith(isMarketPlace: true);
  final mpOrderItem =
      OrderHistoryDetailsOrderItem.empty().copyWith(isMarketPlace: false);
  final zpOrder = OrderHistoryDetails.empty().copyWith(
    isMarketPlace: false,
    orderHistoryDetailsOrderItem: [zpOrderItem],
    totalValue: 10,
    totalDiscount: 11,
    manualFee: 12,
    deliveryFee: 13,
    totalTax: 14,
    orderValue: 9,
    taxRate: 1,
  );
  final mpOrder = OrderHistoryDetails.empty().copyWith(
    isMarketPlace: true,
    orderHistoryDetailsOrderItem: [mpOrderItem],
    totalValue: 20,
    totalDiscount: 21,
    manualFee: 22,
    deliveryFee: 23,
    totalTax: 24,
    orderValue: 19,
  );

  final zpOrderInclTax = zpOrder.copyWith(orderValue: 10);
  final mpOrderInclTax = zpOrder.copyWith(orderValue: 20);

  group('OrderHistoryDetails list', () {
    test(
      'Get only zp orders',
      () => expect([zpOrder, mpOrder].zpOrderOnly, [zpOrder]),
    );

    test(
      'Get only mp orders',
      () => expect([zpOrder, mpOrder].mpOrderOnly, [mpOrder]),
    );

    test(
      'Get all order items',
      () => expect([zpOrder, mpOrder].allItems, [zpOrderItem, mpOrderItem]),
    );

    test(
      'Grand total',
      () => expect(
        [zpOrder, mpOrder].grandTotal,
        zpOrder.totalValue + mpOrder.totalValue,
      ),
    );

    test(
      'Total savings',
      () => expect(
        [zpOrder, mpOrder].totalSaving,
        zpOrder.totalDiscount + mpOrder.totalDiscount,
      ),
    );

    test(
      'Manual fee',
      () => expect(
        [zpOrder, mpOrder].manualFee,
        zpOrder.manualFee + mpOrder.manualFee,
      ),
    );

    test(
      'Small order fee',
      () => expect(
        [zpOrder, mpOrder].smallOrderFee,
        zpOrder.deliveryFee + mpOrder.deliveryFee,
      ),
    );

    test(
      'Tax Rate',
      () => expect(
        zpOrder.taxRate,
        1,
      ),
    );

    test(
      'Total tax',
      () => expect(
        [zpOrder, mpOrder].totalTax,
        zpOrder.totalTax + mpOrder.totalTax,
      ),
    );

    test(
      'Subtotal include tax',
      () => expect(
        [zpOrderInclTax, mpOrderInclTax].subtotal,
        zpOrder.totalValue + mpOrder.totalValue,
      ),
    );

    test(
      'Subtotal exclude tax',
      () => expect(
        [zpOrder, mpOrder].subtotal,
        zpOrder.orderValue + mpOrder.orderValue,
      ),
    );
  });
}
