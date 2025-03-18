import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_balance.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'outstanding_balance_dto.freezed.dart';
part 'outstanding_balance_dto.g.dart';

@freezed
class OutstandingBalanceDto with _$OutstandingBalanceDto {
  const OutstandingBalanceDto._();
  const factory OutstandingBalanceDto({
    @JsonKey(name: 'customerCode', defaultValue: '')
        required String customerCode,
    @JsonKey(
      name: 'currency',
      defaultValue: '',
    )
        required String currency,
    @JsonKey(name: 'amount', defaultValue: '')
        required String amount,
    @JsonKey(name: 'overdue', defaultValue: '')
        required String overdue,
    @JsonKey(name: 'checkDate', defaultValue: '')
        required String checkDate,
  }) = _OutstandingBalanceDto;

  factory OutstandingBalanceDto.fromDomain(
    OutstandingBalance outstandingBalance,
  ) {
    return OutstandingBalanceDto(
      customerCode: outstandingBalance.customerCode.getOrCrash(),
      currency: outstandingBalance.currency.getOrCrash(),
      amount: outstandingBalance.amount.getOrDefaultValue(''),
      overdue: outstandingBalance.overdue.getOrDefaultValue(''),
      checkDate: outstandingBalance.checkDate,
    );
  }

  OutstandingBalance toDomain() {
    return OutstandingBalance(
      customerCode: CustomerCode(customerCode),
      currency: Currency(currency),
      amount: StringValue(amount),
      overdue: StringValue(overdue),
      checkDate: checkDate,
    );
  }

  factory OutstandingBalanceDto.fromJson(Map<String, dynamic> json) =>
      _$OutstandingBalanceDtoFromJson(json);
}
