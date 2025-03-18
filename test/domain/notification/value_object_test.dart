import 'package:ezrxmobile/domain/notification/value/value_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Notification Type value object', () {
    test(
        'should return isReturn is true when type are ReturnRequestCreated, ReturnRequestCreatedForApprover and ReturnRequestCreated',
        () async {
      const inputs = [
        'ReturnRequestCreated',
        'ReturnRequestCreatedForApprover',
        'ReturnRequestCreated',
      ];
      for (final input in inputs) {
        final type = NotificationType(input);
        final result = type.isReturn;
        expect(result, true);
      }
    });

    test(
        'should return isOrder is true when type are OrderCreated, OrderCancelled',
        () async {
      const inputs = ['OrderCreated', 'OrderCancelled'];
      for (final input in inputs) {
        final type = NotificationType(input);
        final result = type.isOrder;
        expect(result, true);
      }
    });

    test(
        'should return isPayment is true when type are PaymentAdviceCreated, PaymentAdviceConfirmation',
        () async {
      const inputs = ['PaymentAdviceCreated', 'PaymentAdviceConfirmation'];

      for (final input in inputs) {
        final type = NotificationType(input);
        final result = type.isPayment;
        expect(result, true);
      }
    });

    test('should return isAnnouncement is true when type is AnnouncementBanner',
        () async {
      const inputs = ['AnnouncementBanner'];

      for (final input in inputs) {
        final type = NotificationType(input);
        final result = type.isAnnouncement;
        expect(result, true);
      }
    });

    test(
        'type value should return false when type are empty, PaymentAdviceDeleted',
        () async {
      const inputs = ['PaymentAdviceDeleted', ''];

      for (final input in inputs) {
        final type = NotificationType(input);
        expect(type.isReturn, false);
        expect(type.isOrder, false);
        expect(type.isPayment, false);
        expect(type.isAnnouncement, false);
      }
    });
  });
}
