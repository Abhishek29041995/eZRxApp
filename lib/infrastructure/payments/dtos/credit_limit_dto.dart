import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_limit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_limit_dto.freezed.dart';
part 'credit_limit_dto.g.dart';

@freezed
class CreditLimitDto with _$CreditLimitDto {
  const CreditLimitDto._();
  const factory CreditLimitDto({
    @JsonKey(name: 'partner', defaultValue: '')
        required String customerCode,
    @JsonKey(
      name: 'currency',
      defaultValue: '',
    )
        required String currency,
    @JsonKey(name: 'creditLimit', defaultValue: '')
        required String creditLimit,
    @JsonKey(name: 'creditExposure', defaultValue: '')
        required String creditExposure,
    @JsonKey(name: 'creditBalance', defaultValue: '')
        required String creditBalance,
  }) = _CreditLimitDto;

  factory CreditLimitDto.fromDomain(
    CreditLimit creditLimit,
  ) {
    return CreditLimitDto(
      customerCode: creditLimit.customerCode.getOrCrash(),
      currency: creditLimit.currency.getOrCrash(),
      creditLimit: creditLimit.creditLimit.getOrDefaultValue(''),
      creditExposure: creditLimit.creditExposure.getOrDefaultValue(''),
      creditBalance: creditLimit.creditBalance.getOrDefaultValue(''),
    );
  }

  CreditLimit get toDomain => CreditLimit(
      customerCode: CustomerCode(customerCode),
      currency: Currency(currency),
      creditLimit: StringValue(creditLimit),
      creditExposure: StringValue(creditExposure),
        creditBalance: StringValue(creditBalance),
    );
  

  factory CreditLimitDto.fromJson(Map<String, dynamic> json) =>
      _$CreditLimitDtoFromJson(json);
}
