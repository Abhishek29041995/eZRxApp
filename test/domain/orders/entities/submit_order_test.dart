import 'package:ezrxmobile/domain/order/entities/submit_order.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SubmitOrder test - ', () {
    test('Purchase order type', () {
      const fakePurchaseOrderType = 'fake-purchase-order-type';
      final submitOrder = SubmitOrder.empty()
          .copyWith(purchaseOrderType: fakePurchaseOrderType);
      expect(
        submitOrder.purchaseOrderType,
        fakePurchaseOrderType,
      );
    });

    test('Order reason', () {
      const fakeOrderReason = 'fake-order-reason';
      final submitOrder =
          SubmitOrder.empty().copyWith(orderReason: fakeOrderReason);
      expect(
        submitOrder.orderReason,
        fakeOrderReason,
      );
    });
  });

  group('SmallOrderFeeDetail test -', () {
    test('isValid getter', () {
      expect(SmallOrderFeeDetail.empty().isValid, false);

      expect(
        SmallOrderFeeDetail.empty().copyWith(zpSmallOrderFee: 10).isValid,
        true,
      );

      expect(
        SmallOrderFeeDetail.empty().copyWith(mpSmallOrderFee: 10).isValid,
        true,
      );
    });
  });
}
