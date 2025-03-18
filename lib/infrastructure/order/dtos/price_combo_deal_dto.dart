import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_combo_deal_dto.freezed.dart';
part 'price_combo_deal_dto.g.dart';

@freezed
class PriceComboDealDto with _$PriceComboDealDto {
  const PriceComboDealDto._();

  const factory PriceComboDealDto({
    @JsonKey(name: 'eligible', defaultValue: false) required bool isEligible,
    @JsonKey(name: 'flexibleGroup', defaultValue: '')
        required String flexibleGroup,
    @JsonKey(name: 'salesDeal', defaultValue: '') required String salesDeal,
    @Default(PriceComboDealCategoryDto.empty)
    @JsonKey(name: 'category')
        PriceComboDealCategoryDto category,
  }) = _PriceComboDealDto;

  factory PriceComboDealDto.fromDomain(PriceComboDeal domain) {
    return PriceComboDealDto(
      isEligible: domain.isEligible,
      flexibleGroup: domain.flexibleGroup.getOrDefaultValue(''),
      salesDeal: domain.salesDeal.getOrDefaultValue(''),
      category: PriceComboDealCategoryDto.fromDomain(domain.category),
    );
  }

  PriceComboDeal get toDomain => PriceComboDeal(
        isEligible: isEligible,
        flexibleGroup: FlexibleGroup(flexibleGroup),
        salesDeal: SalesDealNumber(salesDeal),
        category: category.toDomain,
      );

  static const empty = PriceComboDealDto(
    isEligible: false,
    flexibleGroup: '',
    salesDeal: '',
    category: PriceComboDealCategoryDto.empty,
  );

  factory PriceComboDealDto.fromJson(Map<String, dynamic> json) =>
      _$PriceComboDealDtoFromJson(json);
}

@freezed
class PriceComboDealCategoryDto with _$PriceComboDealCategoryDto {
  const PriceComboDealCategoryDto._();

  const factory PriceComboDealCategoryDto({
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'value', defaultValue: <String>[])
        required List<String> value,
  }) = _PriceComboDealCategoryDto;

  factory PriceComboDealCategoryDto.fromDomain(PriceComboDealCategory domain) =>
      PriceComboDealCategoryDto(
        type: domain.type.getOrDefaultValue(''),
        value: domain.values,
      );

  PriceComboDealCategory get toDomain => PriceComboDealCategory(
        type: ComboDealCategoryType(type),
        values: value,
      );

  static const empty = PriceComboDealCategoryDto(
    type: '',
    value: <String>[],
  );

  factory PriceComboDealCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$PriceComboDealCategoryDtoFromJson(json);
}
