import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  final parentItem = OrderHistoryItem.empty().copyWith(
    lineNumber: LineNumber('10'),
    isBonusMaterial: false,
    qty: 10,
  );
  final bonusItem = OrderHistoryItem.empty().copyWith(
    lineNumber: LineNumber('12'),
    isBonusMaterial: true,
    qty: 2,
  );
  final entity = OrderHistory.empty().copyWith(
    orderHistoryItems: [parentItem, bonusItem],
  );
  group('OrderHistory entity -', () {
    group('get parent material of bonus -', () {
      test('return empty when input is not bonus', () {
        expect(
          entity.getParentMaterial(bonusItem.copyWith(isBonusMaterial: false)),
          OrderHistoryItem.empty(),
        );
      });

      test('return empty when bonus line number is invalid', () {
        expect(
          entity.getParentMaterial(
            bonusItem.copyWith(lineNumber: LineNumber('')),
          ),
          OrderHistoryItem.empty(),
        );
      });

      test('return empty when line number is matched but is bonus material',
          () {
        expect(
          entity.copyWith(
            orderHistoryItems: [parentItem.copyWith(isBonusMaterial: true)],
          ).getParentMaterial(bonusItem),
          OrderHistoryItem.empty(),
        );
      });

      test('return when line number is matched', () {
        expect(
          entity.getParentMaterial(bonusItem),
          parentItem,
        );
      });
      test('netPrice calculation test', () {
        final orderHistoryItem = OrderHistoryItem.empty().copyWith(
          totalUnitPrice: 100,
          totalPrice: 150,
        );

        expect(
          orderHistoryItem.itemTotalNetPrice(
            false,
          ),
          '100.0',
        );
      });

      test('netPrice calculation test', () {
        final orderHistoryItem = OrderHistoryItem.empty().copyWith(
          totalUnitPrice: 100,
          totalPrice: 150,
        );

        expect(
          orderHistoryItem.itemTotalNetPrice(
            false,
          ),
          '100.0',
        );
      });
      test('taxPercentage calculation test', () {
        final orderHistoryItem = OrderHistoryItem.empty().copyWith(
          unitPrice: 100,
          qty: 10,
          tax: 5.0,
          taxRate: 5,
        );

        expect(orderHistoryItem.taxRate, 5);
      });
    });

    test('filter items by order number', () {
      final itemWithOrderNumber =
          parentItem.copyWith(orderNumber: OrderNumber('fakeOrderNumber'));
      final entity = OrderHistory.empty().copyWith(
        orderHistoryItems: [parentItem, itemWithOrderNumber],
      );

      expect(
        entity.filterItemsByOrderId(itemWithOrderNumber.orderNumber),
        OrderHistory.empty().copyWith(orderHistoryItems: [itemWithOrderNumber]),
      );
    });
  });
}
