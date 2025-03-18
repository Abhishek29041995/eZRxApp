// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDetailDtoImpl _$$ProductDetailDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductDetailDtoImpl(
      materialNumber: json['materialNumber'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      principalCode: json['principalCode'] as String? ?? '',
      principalName: json['principalName'] as String? ?? '',
      unitOfMeasurement: json['unitOfMeasurement'] as String? ?? '',
      therapeuticClass: json['therapeuticClass'] as String? ?? '',
      genericMaterialName: json['genericMaterialName'] as String? ?? '',
      itemBrand: json['itemBrand'] as String? ?? '',
      materialBrand: json['materialBrand'] as String? ?? '',
      isFavourite: json['isFavourite'] as bool? ?? false,
      isFOCMaterial: json['isFOCMaterial'] as bool? ?? false,
      defaultMaterialDescription:
          json['defaultMaterialDescription'] as String? ?? '',
      country: json['country'] as String? ?? '',
      countryName: json['countryName'] as String? ?? '',
      hidePrice: json['hidePrice'] as bool? ?? false,
      governmentMaterialCode: json['governmentMaterialCode'] as String? ?? '',
      itemRegistrationNumber: json['itemRegistrationNumber'] as String? ?? '',
      promoType: json['promoType'] as String? ?? '',
      promoStatus: json['promoStatus'] as bool? ?? false,
      isSuspended: json['suspensionStatus'] as bool? ?? false,
      isMarketPlace:
          JsonReadValueHelper.mappingIsMarketPlace(json, 'isMarketPlace')
                  as bool? ??
              false,
      hasMandatoryTenderContract:
          json['hasMandatoryTenderContract'] as bool? ?? false,
      hasValidTenderContract: json['hasValidTenderContract'] as bool? ?? false,
      isGimmick: json['isGimmick'] as bool? ?? false,
      isSampleMaterial: json['isSampleMaterial'] as bool? ?? false,
      isPoison: json['isPoison'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProductDetailDtoImplToJson(
        _$ProductDetailDtoImpl instance) =>
    <String, dynamic>{
      'materialNumber': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'principalCode': instance.principalCode,
      'principalName': instance.principalName,
      'unitOfMeasurement': instance.unitOfMeasurement,
      'therapeuticClass': instance.therapeuticClass,
      'genericMaterialName': instance.genericMaterialName,
      'itemBrand': instance.itemBrand,
      'materialBrand': instance.materialBrand,
      'isFavourite': instance.isFavourite,
      'isFOCMaterial': instance.isFOCMaterial,
      'defaultMaterialDescription': instance.defaultMaterialDescription,
      'country': instance.country,
      'countryName': instance.countryName,
      'hidePrice': instance.hidePrice,
      'governmentMaterialCode': instance.governmentMaterialCode,
      'itemRegistrationNumber': instance.itemRegistrationNumber,
      'promoType': instance.promoType,
      'promoStatus': instance.promoStatus,
      'suspensionStatus': instance.isSuspended,
      'isMarketPlace': instance.isMarketPlace,
      'hasMandatoryTenderContract': instance.hasMandatoryTenderContract,
      'hasValidTenderContract': instance.hasValidTenderContract,
      'isGimmick': instance.isGimmick,
      'isSampleMaterial': instance.isSampleMaterial,
      'isPoison': instance.isPoison,
    };
