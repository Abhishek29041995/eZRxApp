import 'package:ezrxmobile/domain/account/entities/customer_code_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_code_config_dto.freezed.dart';
part 'customer_code_config_dto.g.dart';

@freezed
class CustomerCodeConfigDto with _$CustomerCodeConfigDto {
  CustomerCodeConfigDto._();
  factory CustomerCodeConfigDto({
    @JsonKey(name: 'customerCode', defaultValue: '')
    required String customerCode,
    @JsonKey(name: 'disableReturns', defaultValue: false)
    required bool disableReturns,
    @JsonKey(name: 'disablePayments', defaultValue: false)
    required bool disablePayments,
  }) = _CustomerCodeConfigDto;

  factory CustomerCodeConfigDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerCodeConfigDtoFromJson(json);

  CustomerCodeConfig get toDomain => CustomerCodeConfig(
        customerCode: customerCode,
        disableReturns: disableReturns,
        disablePayments: disablePayments,
      );
}
