import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_params.freezed.dart';

@freezed
class PaymentParams with _$PaymentParams {
  const PaymentParams._();
  factory PaymentParams({
    required PaymentTab tab,
    required PaymentSubTab subTab,
  }) = _PaymentParams;

  factory PaymentParams.empty() => PaymentParams(
        tab: PaymentTab(''),
        subTab: PaymentSubTab(''),
      );
}
