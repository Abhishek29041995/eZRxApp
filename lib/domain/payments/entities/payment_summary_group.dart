import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_summary_group.freezed.dart';

@freezed
class PaymentSummaryGroup with _$PaymentSummaryGroup {
  factory PaymentSummaryGroup({
    required DateTimeStringValue createdDate,
    required List<PaymentSummaryDetails> details,
  }) = _PaymentSummaryGroup;

  factory PaymentSummaryGroup.empty() => PaymentSummaryGroup(
        createdDate: DateTimeStringValue(''),
        details: <PaymentSummaryDetails>[],
      );
}
