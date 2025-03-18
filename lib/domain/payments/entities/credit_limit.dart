import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_limit.freezed.dart';

@freezed
class CreditLimit with _$CreditLimit {
  const CreditLimit._();

  const factory CreditLimit({
    required CustomerCode customerCode,
    required Currency currency,
    required StringValue creditLimit,
    required StringValue creditExposure,
    required StringValue creditBalance,
  }) = _CreditLimit;

  factory CreditLimit.empty() => CreditLimit(
        customerCode: CustomerCode(''),
        currency: Currency(''),
        creditLimit: StringValue(''),
        creditExposure: StringValue(''),
        creditBalance: StringValue(''),
      );
}
