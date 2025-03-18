// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apl_get_total_price_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AplGetTotalPriceDtoImpl _$$AplGetTotalPriceDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AplGetTotalPriceDtoImpl(
      grandTotal: (json['TotalPrice'] as num?)?.toInt() ?? 0,
      tax: (json['Tax'] as num?)?.toInt() ?? 0,
      deliveryFee: (json['DeliveryFee'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$AplGetTotalPriceDtoImplToJson(
        _$AplGetTotalPriceDtoImpl instance) =>
    <String, dynamic>{
      'TotalPrice': instance.grandTotal,
      'Tax': instance.tax,
      'DeliveryFee': instance.deliveryFee,
    };
