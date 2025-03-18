import 'package:ezrxmobile/domain/account/entities/payment_advice_expiry_notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_notification.freezed.dart';

@freezed
class PaymentNotification with _$PaymentNotification {
  const PaymentNotification._();

  const factory PaymentNotification({
    required bool disablePaymentNotification,
    required List<PaymentAdviceExpiryNotification>
        paymentAdviceExpiryNotificationList,
  }) = _PaymentNotification;

  factory PaymentNotification.empty() => const PaymentNotification(
        paymentAdviceExpiryNotificationList: <
            PaymentAdviceExpiryNotification>[],
        disablePaymentNotification: true,
      );

  PaymentAdviceExpiryNotification notificationConfigValue(String dayType) =>
      paymentAdviceExpiryNotificationList
          .firstWhere((element) => element.day == dayType);
}
