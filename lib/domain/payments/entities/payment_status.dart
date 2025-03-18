import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_status.freezed.dart';

@freezed
class PaymentStatus with _$PaymentStatus {
  const PaymentStatus._();

  const factory PaymentStatus({
    required String paymentId,
    required String transactionReference,
    required TransactionStatus transactionStatus,
  }) = _PaymentStatus;
}
