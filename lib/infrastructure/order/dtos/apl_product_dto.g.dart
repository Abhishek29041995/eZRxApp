// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apl_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AplProductDtoImpl _$$AplProductDtoImplFromJson(Map<String, dynamic> json) =>
    _$AplProductDtoImpl(
      type: json['type'] as String? ?? '',
      itemNumber: json['itemNumber'] as String? ?? '',
      parentItemNumber: json['parentItemNumber'] as String? ?? '',
      materialNumber: json['material'] as String? ?? '',
      finalPriceTotal: (json['netValue'] as num?)?.toDouble() ?? 0,
      finalPrice: (json['productPriceNetValue'] as num?)?.toDouble() ?? 0,
      productQty: (json['productQty'] as num?)?.toInt() ?? 0,
      taxValue: (json['taxValue'] as num?)?.toDouble() ?? 0,
      aplPromotions: (json['promotions'] as List<dynamic>?)
              ?.map((e) => AplPromotionsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$AplProductDtoImplToJson(_$AplProductDtoImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'itemNumber': instance.itemNumber,
      'parentItemNumber': instance.parentItemNumber,
      'material': instance.materialNumber,
      'netValue': instance.finalPriceTotal,
      'productPriceNetValue': instance.finalPrice,
      'productQty': instance.productQty,
      'taxValue': instance.taxValue,
      'promotions': instance.aplPromotions.map((e) => e.toJson()).toList(),
    };
