// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apl_promotions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AplPromotionsDtoImpl _$$AplPromotionsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AplPromotionsDtoImpl(
      discountValue: (json['discountValue'] as num?)?.toDouble() ?? 0,
      discountTypeValue: json['discountTypeValue'] as String? ?? '',
    );

Map<String, dynamic> _$$AplPromotionsDtoImplToJson(
        _$AplPromotionsDtoImpl instance) =>
    <String, dynamic>{
      'discountValue': instance.discountValue,
      'discountTypeValue': instance.discountTypeValue,
    };
