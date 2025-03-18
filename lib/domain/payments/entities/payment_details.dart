import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_details.freezed.dart';

@freezed
class PaymentDetails with _$PaymentDetails {
  const PaymentDetails._();

  const factory PaymentDetails({
    required StringValue vaNumber,
    required StringValue vaName,
    required DateTimeStringValue expiresAt,
  }) = _PaymentDetails;

  factory PaymentDetails.empty() => PaymentDetails(
        vaNumber: StringValue(''),
        vaName: StringValue(''),
        expiresAt: DateTimeStringValue(''),
      );
}
