import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_method_option.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_payment_method.freezed.dart';

@freezed
class NewPaymentMethod with _$NewPaymentMethod {
  const NewPaymentMethod._();

  const factory NewPaymentMethod({
    required PaymentMethodValue paymentMethod,
    required List<PaymentMethodOption> options,
  }) = _NewPaymentMethod;

  factory NewPaymentMethod.empty() => NewPaymentMethod(
        paymentMethod: PaymentMethodValue(''),
        options: <PaymentMethodOption>[],
      );

  List<PaymentMethodOption> get banksOnlyAllowTransferSameBank => options
      .where((option) => option.bankOptionId.banksOnlyAllowTransferSameBank)
      .toList();

  List<PaymentMethodOption> get banksAllowTransferDifferenceBank => options
      .where((option) => !option.bankOptionId.banksOnlyAllowTransferSameBank)
      .toList();

  PaymentMethodOption get firstSelectedOption => options.firstOrNull ?? PaymentMethodOption.empty();
}
