import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_in_progress_dto.freezed.dart';
part 'payment_in_progress_dto.g.dart';

@freezed
class PaymentInProgressDto with _$PaymentInProgressDto {
  const PaymentInProgressDto._();
  factory PaymentInProgressDto({
    @JsonKey(name: 'amount', defaultValue: '') required String amount,
  }) = _PaymentInProgressDto;

  factory PaymentInProgressDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentInProgressDtoFromJson(json);

  StringValue get toAmount => StringValue(amount);
}
