import 'package:ezrxmobile/domain/order/entities/combo_deal_amount_tier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_amount_tier_dto.freezed.dart';
part 'combo_deal_amount_tier_dto.g.dart';

@freezed
class ComboDealAmountTierDto with _$ComboDealAmountTierDto {
  const ComboDealAmountTierDto._();

  const factory ComboDealAmountTierDto({
    @JsonKey(name: 'rate', defaultValue: '') required String rate,
    @JsonKey(name: 'conditionNumber', defaultValue: '')
        required String conditionNumber,
    @JsonKey(name: 'minTotalAmount', defaultValue: '')
        required String minTotalAmount,
    @JsonKey(name: 'minTotalCurrency', defaultValue: '')
        required String minTotalCurrency,
    @JsonKey(name: 'maxTotalAmount', defaultValue: '')
        required String maxTotalAmount,
    @JsonKey(name: 'maxTotalCurrency', defaultValue: '')
        required String maxTotalCurrency,
    @JsonKey(name: 'type', defaultValue: '') required String type,
  }) = _ComboDealAmountTierDto;

  factory ComboDealAmountTierDto.fromJson(Map<String, dynamic> json) =>
      _$ComboDealAmountTierDtoFromJson(json);

  ComboDealAmountTier get toDomain => ComboDealAmountTier(
        rate: rate,
        conditionNumber: conditionNumber,
        minTotalAmount: minTotalAmount,
        minTotalCurrency: minTotalCurrency,
        maxTotalAmount: maxTotalAmount,
        maxTotalCurrency: maxTotalCurrency,
        type: type,
      );

  factory ComboDealAmountTierDto.fromDomain(ComboDealAmountTier domain) =>
      ComboDealAmountTierDto(
        rate: domain.rate,
        conditionNumber: domain.conditionNumber,
        type: domain.type,
        maxTotalAmount: domain.maxTotalAmount,
        maxTotalCurrency: domain.maxTotalCurrency,
        minTotalAmount: domain.minTotalAmount,
        minTotalCurrency: domain.minTotalCurrency,
      );
}
