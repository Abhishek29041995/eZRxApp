// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_meta_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductMetaDataDtoImpl _$$ProductMetaDataDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductMetaDataDtoImpl(
      productImages: (json['orderCloudProduct'] as List<dynamic>?)
              ?.map((e) => ProductImagesDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      items: (json['Items'] as List<dynamic>?)
              ?.map((e) => ProductItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$ProductMetaDataDtoImplToJson(
        _$ProductMetaDataDtoImpl instance) =>
    <String, dynamic>{
      'orderCloudProduct':
          instance.productImages.map((e) => e.toJson()).toList(),
      'Items': instance.items.map((e) => e.toJson()).toList(),
    };

_$ProductItemDtoImpl _$$ProductItemDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProductItemDtoImpl(
      promotionMaterial: json['PromotionMaterial'] as String? ?? '',
      materialNumber: json['ID'] as String? ?? '',
      xp: ProductItemXpDto.fromJson(json['XP'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductItemDtoImplToJson(
        _$ProductItemDtoImpl instance) =>
    <String, dynamic>{
      'PromotionMaterial': instance.promotionMaterial,
      'ID': instance.materialNumber,
      'XP': instance.xp.toJson(),
    };

_$ProductItemXpDtoImpl _$$ProductItemXpDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductItemXpDtoImpl(
      dosage: json['Dosage'] as String? ?? '',
      howToUse: json['HowToUse'] as String? ?? '',
      composition: json['Composition'] as String? ?? '',
      deliveryInstructions: json['DeliveryInstructions'] as String? ?? '',
    );

Map<String, dynamic> _$$ProductItemXpDtoImplToJson(
        _$ProductItemXpDtoImpl instance) =>
    <String, dynamic>{
      'Dosage': instance.dosage,
      'HowToUse': instance.howToUse,
      'Composition': instance.composition,
      'DeliveryInstructions': instance.deliveryInstructions,
    };
