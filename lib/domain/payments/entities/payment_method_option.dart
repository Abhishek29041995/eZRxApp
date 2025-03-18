import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method_option.freezed.dart';

@freezed
class PaymentMethodOption with _$PaymentMethodOption {
  const PaymentMethodOption._();

  const factory PaymentMethodOption({
    required BankOptionId bankOptionId,
    required StringValue prodiver,
    required StringValue displayName,
    required StringValue type,
  }) = _PaymentMethodOption;

  factory PaymentMethodOption.empty() => PaymentMethodOption(
        bankOptionId: BankOptionId(''),
        prodiver: StringValue(''),
        displayName: StringValue(''),
        type: StringValue(''),
      );

  String get logoPath => bankOptionId.getOrDefaultValue('').isNotEmpty
      ? SvgImage.paymentMethodOptionLogo(
          bankOptionId.getOrDefaultValue('').toLowerCase(),
        )
      : '';
}
