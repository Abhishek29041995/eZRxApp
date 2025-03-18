import 'package:ezrxmobile/domain/account/entities/notification_settings.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Notification Settings', () {
    final notificationSettings = NotificationSettings.empty().copyWith(
      orderConfirmation: NotificationSetting(false),
      paymentConfirmation: NotificationSetting(true),
      ereturnConfirmation: NotificationSetting(true),
    );

    expect(notificationSettings.orderConfirmation.getOrCrash(), false);
    expect(notificationSettings.paymentConfirmation.getOrCrash(), true);
    expect(notificationSettings.ereturnConfirmation.getOrCrash(), true);
  });
}
