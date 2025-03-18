import 'package:ezrxmobile/domain/order/entities/combo_deal_sku_tier.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_sku_tier_dto.freezed.dart';
part 'combo_deal_sku_tier_dto.g.dart';

@freezed
class ComboDealSKUTierDto with _$ComboDealSKUTierDto {
  const ComboDealSKUTierDto._();

  const factory ComboDealSKUTierDto({
    @StringToDoubleConverter()
    @JsonKey(name: 'rate', defaultValue: 0)
        required double rate,
    @StringToDoubleConverter()
    @JsonKey(name: 'conditionNumber', defaultValue: '')
        required String conditionNumber,
    @StringToIntConverter()
    @JsonKey(name: 'minQty', defaultValue: 0)
        required int minQty,
    @JsonKey(name: 'type', defaultValue: '') required String type,
  }) = _ComboDealSKUTierDto;

  factory ComboDealSKUTierDto.fromJson(Map<String, dynamic> json) =>
      _$ComboDealSKUTierDtoFromJson(json);

  ComboDealSKUTier get toDomain => ComboDealSKUTier(
        rate: rate,
        conditionNumber: conditionNumber,
        minQty: minQty,
        type: DiscountType(type),
      );

  factory ComboDealSKUTierDto.fromDomain(ComboDealSKUTier domain) =>
      ComboDealSKUTierDto(
        rate: domain.rate,
        conditionNumber: domain.conditionNumber,
        minQty: domain.minQty,
        type: domain.type.getOrDefaultValue(''),
      );
}
