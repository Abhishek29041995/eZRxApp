import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_combo_deal_request_dto.freezed.dart';
part 'price_combo_deal_request_dto.g.dart';

@freezed
class PriceComboDealRequestDto with _$PriceComboDealRequestDto {
  const PriceComboDealRequestDto._();

  const factory PriceComboDealRequestDto({
    @JsonKey(name: 'Eligible', defaultValue: false) required bool isEligible,
    @JsonKey(name: 'FlexibleGroup', defaultValue: '')
        required String flexibleGroup,
    @JsonKey(name: 'SalesDeal', defaultValue: '') required String salesDeal,
    @Default(PriceComboDealCategoryRequestDto.empty)
    @JsonKey(name: 'Category')
        PriceComboDealCategoryRequestDto category,
  }) = _PriceComboDealRequestDto;

  factory PriceComboDealRequestDto.fromDomain(PriceComboDeal domain) {
    return PriceComboDealRequestDto(
      isEligible: domain.isEligible,
      flexibleGroup: domain.flexibleGroup.getOrDefaultValue(''),
      salesDeal: domain.salesDeal.getOrDefaultValue(''),
      category: PriceComboDealCategoryRequestDto.fromDomain(domain.category),
    );
  }

  PriceComboDeal get toDomain => PriceComboDeal(
        isEligible: isEligible,
        flexibleGroup: FlexibleGroup(flexibleGroup),
        salesDeal: SalesDealNumber(salesDeal),
        category: category.toDomain,
      );

  static const empty = PriceComboDealRequestDto(
    isEligible: false,
    flexibleGroup: '',
    salesDeal: '',
    category: PriceComboDealCategoryRequestDto.empty,
  );

  factory PriceComboDealRequestDto.fromJson(Map<String, dynamic> json) =>
      _$PriceComboDealRequestDtoFromJson(json);
}

@freezed
class PriceComboDealCategoryRequestDto with _$PriceComboDealCategoryRequestDto {
  const PriceComboDealCategoryRequestDto._();

  const factory PriceComboDealCategoryRequestDto({
    @JsonKey(name: 'Type', defaultValue: '') required String type,
    @JsonKey(name: 'Value', defaultValue: <String>[])
        required List<String> value,
  }) = _PriceComboDealCategoryRequestDto;

  factory PriceComboDealCategoryRequestDto.fromDomain(
    PriceComboDealCategory domain,
  ) =>
      PriceComboDealCategoryRequestDto(
        type: domain.type.getOrDefaultValue(''),
        value: domain.values,
      );

  PriceComboDealCategory get toDomain => PriceComboDealCategory(
        type: ComboDealCategoryType(type),
        values: value,
      );

  static const empty = PriceComboDealCategoryRequestDto(
    type: '',
    value: <String>[],
  );

  factory PriceComboDealCategoryRequestDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PriceComboDealCategoryRequestDtoFromJson(json);
}
