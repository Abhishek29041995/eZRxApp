import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'apl_promotions.freezed.dart';

@freezed
class AplPromotions with _$AplPromotions {
  const AplPromotions._();

  const factory AplPromotions({
    required double discountValue,
    required DiscountType discountTypeValue,
  }) = _AplPromotions;

  factory AplPromotions.empty() => AplPromotions(
        discountTypeValue: DiscountType(''),
        discountValue: 0,
      );
}
