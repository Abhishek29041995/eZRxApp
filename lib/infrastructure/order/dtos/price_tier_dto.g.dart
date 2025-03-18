// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_tier_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceTierDtoImpl _$$PriceTierDtoImplFromJson(Map<String, dynamic> json) =>
    _$PriceTierDtoImpl(
      items: (json['priceTier'] as List<dynamic>?)
              ?.map((e) => PriceTierItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$PriceTierDtoImplToJson(_$PriceTierDtoImpl instance) =>
    <String, dynamic>{
      'priceTier': instance.items.map((e) => e.toJson()).toList(),
    };

_$PriceTierItemDtoImpl _$$PriceTierItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PriceTierItemDtoImpl(
      type: json['type'] as String? ?? '',
      applyBonus: json['applyBonus'] as bool? ?? false,
      sequence: (json['sequence'] as num?)?.toInt() ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      rate: (json['rate'] as num?)?.toDouble() ?? 0,
      percentage: (json['percentage'] as num?)?.toDouble() ?? 0,
      minAmount: (json['minAmount'] as num?)?.toDouble() ?? 0,
      scaleBasis: json['scaleBasis'] as String? ?? '',
      promotionAmount: (json['promotionAmount'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$PriceTierItemDtoImplToJson(
        _$PriceTierItemDtoImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'applyBonus': instance.applyBonus,
      'sequence': instance.sequence,
      'quantity': instance.quantity,
      'rate': instance.rate,
      'percentage': instance.percentage,
      'minAmount': instance.minAmount,
      'scaleBasis': instance.scaleBasis,
      'promotionAmount': instance.promotionAmount,
    };
