import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_combo_deal.freezed.dart';

@freezed
class PriceComboDeal with _$PriceComboDeal {
  const PriceComboDeal._();

  const factory PriceComboDeal({
    required bool isEligible,
    required FlexibleGroup flexibleGroup,
    required SalesDealNumber salesDeal,
    required PriceComboDealCategory category,
  }) = _PriceComboDeal;

  factory PriceComboDeal.empty() => PriceComboDeal(
        isEligible: false,
        flexibleGroup: FlexibleGroup(''),
        salesDeal: SalesDealNumber(''),
        category: PriceComboDealCategory.empty(),
      );

  bool get isAvailable => isEligible && category.values.isNotEmpty;

  String get id =>
      '${flexibleGroup.getOrDefaultValue('')}-${salesDeal.getOrDefaultValue('')}';
}

@freezed
class PriceComboDealCategory with _$PriceComboDealCategory {
  const PriceComboDealCategory._();

  const factory PriceComboDealCategory({
    required ComboDealCategoryType type,
    required List<String> values,
  }) = _PriceComboDealCategory;

  factory PriceComboDealCategory.empty() => PriceComboDealCategory(
        type: ComboDealCategoryType(''),
        values: [],
      );
}
