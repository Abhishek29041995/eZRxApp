import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'principal_code_dto.freezed.dart';
part 'principal_code_dto.g.dart';

@freezed
class PrincipalCodeDto with _$PrincipalCodeDto {
  const PrincipalCodeDto._();
  factory PrincipalCodeDto({
    @JsonKey(
      name: 'principalName',
      defaultValue: '',
    )
    required String principalName,
    @JsonKey(
      name: 'principalCode',
      defaultValue: '',
    )
    required String principalCode,
  }) = _PrincipalCodeDto;

  PrincipalData toDomain() {
    return PrincipalData(
      principalName: PrincipalName(principalName),
      principalCode: PrincipalCode(principalCode),
    );
  }

  factory PrincipalCodeDto.fromJson(Map<String, dynamic> json) =>
      _$PrincipalCodeDtoFromJson(json);
}
