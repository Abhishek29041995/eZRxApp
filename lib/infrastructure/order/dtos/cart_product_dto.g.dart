// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartProductDtoImpl _$$CartProductDtoImplFromJson(Map<String, dynamic> json) =>
    _$CartProductDtoImpl(
      productID: json['productID'] as String? ?? '',
      parentID: json['parentID'] as String? ?? '',
      type: json['type'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      materialNumber: json['materialNumber'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      therapeuticClass: json['therapeuticClass'] as String? ?? '',
      taxClassification: json['taxClassification'] as String? ?? '',
      isFOCMaterial: json['isFOCMaterial'] as bool? ?? false,
      itemRegistrationNumber: json['itemRegistrationNumber'] as String? ?? '',
      genericMaterialName: json['genericMaterialName'] as String? ?? '',
      principalName: json['principalName'] as String? ?? '',
      principalCode: json['principalCode'] as String? ?? '',
      counterOfferPrice: (json['counterOfferPrice'] as num?)?.toDouble() ?? 0,
      counterOfferDiscount:
          (json['discountOverridePercentage'] as num?)?.toDouble() ?? 0,
      counterOfferCurrency: json['counterOfferCurrency'] as String? ?? '',
      remarks: json['comment'] as String? ?? '',
      governmentMaterialCode: json['governmentMaterialCode'] as String? ?? '',
      bundleDetails: json['bundleDetails'] == null
          ? BundleDetailsDto.empty
          : BundleDetailsDto.fromJson(
              json['bundleDetails'] as Map<String, dynamic>),
      bundleMaterials: (json['bundleMaterials'] as List<dynamic>?)
              ?.map((e) => MaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      bonusMaterials: (json['bonusMaterials'] as List<dynamic>?)
              ?.map(
                  (e) => BonusSampleItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tax: (JsonReadValueHelper.handleTax(json, 'taxes') as num).toDouble(),
      hidePrice: json['hidePrice'] as bool? ?? false,
      isSuspended: json['suspensionStatus'] as bool? ?? false,
      isPrincipalSuspended: json['principalCutoffStatus'] as bool? ?? false,
      comboDeal: json['comboDeals'] == null
          ? PriceComboDealDto.empty
          : PriceComboDealDto.fromJson(
              json['comboDeals'] as Map<String, dynamic>),
      comboMaterials: (json['comboMaterials'] as List<dynamic>?)
              ?.map((e) =>
                  ComboMaterialItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      maximumQty: (json['maximumQty'] as num?)?.toInt() ?? 99999,
      isMarketPlace:
          JsonReadValueHelper.mappingIsMarketPlace(json, 'isMarketPlace')
                  as bool? ??
              false,
      defaultMaterialDescription:
          json['defaultMaterialDescription'] as String? ?? '',
      materialGroup4: json['materialGroup4'] as String? ?? '',
      materialGroup2: json['materialGroup2'] as String? ?? '',
      is26SeriesMaterial: json['is26SeriesMaterial'] as bool? ?? false,
      isGimmick: json['isGimmick'] as bool? ?? false,
      isPoison: json['isPoison'] as bool? ?? false,
      isSample: json['isSample'] as bool? ?? false,
      tenderContractNumber: json['tenderContractNumber'] as String? ?? '',
      tenderOrderReason: json['tenderOrderReason'] as String? ?? '',
      hasValidTenderContract: json['hasValidTenderContract'] as bool? ?? false,
      hasMandatoryTenderContract:
          json['hasMandatoryTenderContract'] as bool? ?? false,
      isCovid: json['isCovid'] as bool? ?? false,
      isTenderExpired: json['isTenderExpired'] as bool? ?? false,
    );

Map<String, dynamic> _$$CartProductDtoImplToJson(
        _$CartProductDtoImpl instance) =>
    <String, dynamic>{
      'productID': instance.productID,
      'parentID': instance.parentID,
      'type': instance.type,
      'quantity': instance.quantity,
      'materialNumber': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'therapeuticClass': instance.therapeuticClass,
      'taxClassification': instance.taxClassification,
      'isFOCMaterial': instance.isFOCMaterial,
      'itemRegistrationNumber': instance.itemRegistrationNumber,
      'genericMaterialName': instance.genericMaterialName,
      'principalName': instance.principalName,
      'principalCode': instance.principalCode,
      'counterOfferPrice': instance.counterOfferPrice,
      'discountOverridePercentage': instance.counterOfferDiscount,
      'counterOfferCurrency': instance.counterOfferCurrency,
      'comment': instance.remarks,
      'governmentMaterialCode': instance.governmentMaterialCode,
      'bundleDetails': instance.bundleDetails.toJson(),
      'bundleMaterials':
          instance.bundleMaterials.map((e) => e.toJson()).toList(),
      'bonusMaterials': instance.bonusMaterials.map((e) => e.toJson()).toList(),
      'taxes': instance.tax,
      'hidePrice': instance.hidePrice,
      'suspensionStatus': instance.isSuspended,
      'principalCutoffStatus': instance.isPrincipalSuspended,
      'comboDeals': instance.comboDeal.toJson(),
      'comboMaterials': instance.comboMaterials.map((e) => e.toJson()).toList(),
      'maximumQty': instance.maximumQty,
      'isMarketPlace': instance.isMarketPlace,
      'defaultMaterialDescription': instance.defaultMaterialDescription,
      'materialGroup4': instance.materialGroup4,
      'materialGroup2': instance.materialGroup2,
      'is26SeriesMaterial': instance.is26SeriesMaterial,
      'isGimmick': instance.isGimmick,
      'isPoison': instance.isPoison,
      'isSample': instance.isSample,
      'tenderContractNumber': instance.tenderContractNumber,
      'tenderOrderReason': instance.tenderOrderReason,
      'hasValidTenderContract': instance.hasValidTenderContract,
      'hasMandatoryTenderContract': instance.hasMandatoryTenderContract,
      'isCovid': instance.isCovid,
      'isTenderExpired': instance.isTenderExpired,
    };

_$BundleDetailsDtoImpl _$$BundleDetailsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BundleDetailsDtoImpl(
      bundleName: json['bundleName'] as String? ?? '',
      bundleCode: json['bundleCode'] as String? ?? '',
      bundleInfo: (json['bundleInformation'] as List<dynamic>?)
              ?.map((e) => BundleInfoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$BundleDetailsDtoImplToJson(
        _$BundleDetailsDtoImpl instance) =>
    <String, dynamic>{
      'bundleName': instance.bundleName,
      'bundleCode': instance.bundleCode,
      'bundleInformation': instance.bundleInfo.map((e) => e.toJson()).toList(),
    };
