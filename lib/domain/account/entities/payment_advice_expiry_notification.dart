import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_advice_expiry_notification.freezed.dart';

@freezed
class PaymentAdviceExpiryNotification with _$PaymentAdviceExpiryNotification {
  const PaymentAdviceExpiryNotification._();

  const factory PaymentAdviceExpiryNotification({
    required String day,
    required bool disabled,
  }) = _PaymentAdviceExpiryNotification;

  factory PaymentAdviceExpiryNotification.empty() =>
      const PaymentAdviceExpiryNotification(
        day: '',
        disabled: true,
      );
}
