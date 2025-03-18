import 'package:ezrxmobile/domain/payments/entities/principal_cutoffs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'principal_cutoffs_dto.freezed.dart';
part 'principal_cutoffs_dto.g.dart';

@freezed
class PrincipalCutoffsDto with _$PrincipalCutoffsDto {
  const PrincipalCutoffsDto._();

  const factory PrincipalCutoffsDto({
    @JsonKey(name: 'total', defaultValue: 0) required int total,
  }) = _PrincipalCutoffsDto;

  PrincipalCutoffs toDomain() => PrincipalCutoffs(
        total: total,
      );

  factory PrincipalCutoffsDto.fromJson(Map<String, dynamic> json) =>
      _$PrincipalCutoffsDtoFromJson(json);
}
