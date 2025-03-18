import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/account/entities/payment_advice_expiry_notification.dart';

part 'payment_advice_expiry_notification_dto.freezed.dart';
part 'payment_advice_expiry_notification_dto.g.dart';

@freezed
class PaymentAdviceExpiryNotificationDto
    with _$PaymentAdviceExpiryNotificationDto {
  const PaymentAdviceExpiryNotificationDto._();

  const factory PaymentAdviceExpiryNotificationDto({
    @JsonKey(name: 'day') required String day,
    @JsonKey(name: 'disabled', defaultValue: false) required bool disabled,
  }) = _PaymentAdviceExpiryNotificationDto;

  factory PaymentAdviceExpiryNotificationDto.fromDomain(
    PaymentAdviceExpiryNotification paymentAdviceExpiryNotification,
  ) {
    return PaymentAdviceExpiryNotificationDto(
      day: paymentAdviceExpiryNotification.day,
      disabled: paymentAdviceExpiryNotification.disabled,
    );
  }

  PaymentAdviceExpiryNotification toDomain() {
    return PaymentAdviceExpiryNotification(
      day: day,
      disabled: disabled,
    );
  }

  factory PaymentAdviceExpiryNotificationDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PaymentAdviceExpiryNotificationDtoFromJson(json);
}
