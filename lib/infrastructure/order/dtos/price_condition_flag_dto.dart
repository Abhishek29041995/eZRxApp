import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_condition_flag_dto.freezed.dart';
part 'price_condition_flag_dto.g.dart';

@freezed
class PriceConditionFlagDto with _$PriceConditionFlagDto {
  const PriceConditionFlagDto._();
  const factory PriceConditionFlagDto({
    @JsonKey(name: 'isFOC', defaultValue: false) required bool isFOC,
  }) = _PriceConditionFlagDto;

  factory PriceConditionFlagDto.fromJson(Map<String, dynamic> json) =>
      _$PriceConditionFlagDtoFromJson(json);

  static const empty = PriceConditionFlagDto(isFOC: false);
}
