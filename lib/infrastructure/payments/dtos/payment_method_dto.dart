import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_method_option_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method_dto.freezed.dart';
part 'payment_method_dto.g.dart';

@freezed
class PaymentMethodDto with _$PaymentMethodDto {
  const PaymentMethodDto._();

  const factory PaymentMethodDto({
    @JsonKey(name: 'paymentMethods', defaultValue: '')
        required String paymentMethods,
    @JsonKey(name: 'options', defaultValue: [])
        required List<PaymentMethodOptionDto> options,
  }) = _PaymentMethodDto;

  NewPaymentMethod toDomain() {
    return NewPaymentMethod(
      paymentMethod: PaymentMethodValue(paymentMethods),
      options: options.map((e) => e.toDomain()).toList(),
    );
  }

  factory PaymentMethodDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodDtoFromJson(json);
}
