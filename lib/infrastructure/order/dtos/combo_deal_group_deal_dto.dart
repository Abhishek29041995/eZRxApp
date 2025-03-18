import 'package:ezrxmobile/domain/order/entities/combo_deal_group_deal.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_group_deal_dto.freezed.dart';
part 'combo_deal_group_deal_dto.g.dart';

@freezed
class ComboDealGroupDealDto with _$ComboDealGroupDealDto {
  const ComboDealGroupDealDto._();
  const factory ComboDealGroupDealDto({
    @StringToDoubleConverter()
    @JsonKey(name: 'minTotalAmount', defaultValue: 0)
        required double minTotalAmount,
    @StringToDoubleConverter()
    @JsonKey(name: 'maxTotalAmount', defaultValue: 0)
        required double maxTotalAmount,
    @StringToIntConverter()
    @JsonKey(name: 'minTotalQuantity', defaultValue: 0)
        required int minTotalQuantity,
    @StringToDoubleConverter()
    @JsonKey(name: 'rate', defaultValue: 0)
        required double rate,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'conditionNumber', defaultValue: '')
        required String conditionNumber,
  }) = _ComboDealGroupDealDto;

  factory ComboDealGroupDealDto.fromJson(Map<String, dynamic> json) =>
      _$ComboDealGroupDealDtoFromJson(json);

  static const ComboDealGroupDealDto empty = ComboDealGroupDealDto(
    minTotalAmount: 0,
    maxTotalAmount: 0,
    minTotalQuantity: 0,
    rate: 0,
    type: '',
    conditionNumber: '',
  );

  ComboDealGroupDeal get toDomain => ComboDealGroupDeal(
        minTotalAmount: minTotalAmount,
        maxTotalAmount: maxTotalAmount,
        minTotalQuantity: minTotalQuantity,
        rate: rate,
        type: DiscountType(type),
        conditionNumber: conditionNumber,
      );

  factory ComboDealGroupDealDto.fromDomain(ComboDealGroupDeal domain) =>
      ComboDealGroupDealDto(
        minTotalAmount: domain.minTotalAmount,
        maxTotalAmount: domain.maxTotalAmount,
        minTotalQuantity: domain.minTotalQuantity,
        rate: domain.rate,
        type: domain.type.getOrDefaultValue(''),
        conditionNumber: domain.conditionNumber,
      );
}
