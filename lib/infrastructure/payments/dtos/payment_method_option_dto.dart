import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_method_option.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method_option_dto.freezed.dart';
part 'payment_method_option_dto.g.dart';

@freezed
class PaymentMethodOptionDto with _$PaymentMethodOptionDto {
  const PaymentMethodOptionDto._();

  const factory PaymentMethodOptionDto({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'provider', defaultValue: '') required String provider,
    @JsonKey(name: 'displayName', defaultValue: '') required String displayName,
  }) = _PaymentMethodOptionDto;

  factory PaymentMethodOptionDto.fromDomain(
    PaymentMethodOption option,
  ) {
    return PaymentMethodOptionDto(
      displayName: option.displayName.getOrDefaultValue(''),
      id: option.bankOptionId.getOrDefaultValue(''),
      provider: option.prodiver.getOrDefaultValue(''),
      type: option.type.getOrDefaultValue(''),
    );
  }

  PaymentMethodOption toDomain() {
    return PaymentMethodOption(
      displayName: StringValue(displayName),
      bankOptionId: BankOptionId(id),
      prodiver: StringValue(provider),
      type: StringValue(type),
    );
  }

  factory PaymentMethodOptionDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodOptionDtoFromJson(json);
}
