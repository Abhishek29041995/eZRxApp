import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_exception.freezed.dart';

@freezed
class PaymentException with _$PaymentException {
  const factory PaymentException.missingzzHtmcs() = _MissingzzHtmcs;
}
