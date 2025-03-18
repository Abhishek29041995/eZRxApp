import 'package:ezrxmobile/domain/order/entities/combo_deal_qty_tier.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_qty_tier_dto.freezed.dart';
part 'combo_deal_qty_tier_dto.g.dart';

@freezed
class ComboDealQtyTierDto with _$ComboDealQtyTierDto {
  const ComboDealQtyTierDto._();

  const factory ComboDealQtyTierDto({
    @StringToDoubleConverter()
    @JsonKey(name: 'rate', defaultValue: 0)
        required double rate,
    @JsonKey(name: 'conditionNumber', defaultValue: '')
        required String conditionNumber,
    @StringToIntConverter()
    @JsonKey(name: 'minQty', defaultValue: 0)
        required int minQty,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'suffix', defaultValue: '') required String suffix,
  }) = _ComboDealQtyTierDto;

  factory ComboDealQtyTierDto.fromJson(Map<String, dynamic> json) =>
      _$ComboDealQtyTierDtoFromJson(json);

  ComboDealQtyTier get toDomain => ComboDealQtyTier(
        rate: rate,
        conditionNumber: conditionNumber,
        minQty: minQty,
        type: DiscountType(type),
        suffix: ComboSuffix(suffix),
      );

  factory ComboDealQtyTierDto.fromDomain(ComboDealQtyTier domain) =>
      ComboDealQtyTierDto(
        rate: domain.rate,
        conditionNumber: domain.conditionNumber,
        minQty: domain.minQty,
        type: domain.type.getOrDefaultValue(''),
        suffix: domain.suffix.stringValue,
      );
}
