import 'package:ezrxmobile/domain/order/entities/apl_promotions.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'apl_promotions_dto.freezed.dart';
part 'apl_promotions_dto.g.dart';


@freezed
class AplPromotionsDto with _$AplPromotionsDto {
  const AplPromotionsDto._();
  const factory AplPromotionsDto({
    @JsonKey(name: 'discountValue', defaultValue: 0)
        required double discountValue,
    @JsonKey(name: 'discountTypeValue', defaultValue: '')
        required String discountTypeValue,
  }) = _AplPromotionsDto;

  AplPromotions get toDomain {
    return AplPromotions(
      discountValue:discountValue,
      discountTypeValue: DiscountType(discountTypeValue),
    );
  }

  factory AplPromotionsDto.fromJson(Map<String, dynamic> json) =>
      _$AplPromotionsDtoFromJson(json);
}
