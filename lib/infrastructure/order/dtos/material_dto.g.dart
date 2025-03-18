// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialDtoImpl _$$MaterialDtoImplFromJson(Map<String, dynamic> json) =>
    _$MaterialDtoImpl(
      governmentMaterialCode: json['governmentMaterialCode'] as String? ?? '',
      therapeuticClass: json['therapeuticClass'] as String? ?? '',
      itemBrand: json['itemBrand'] as String? ?? '',
      principalName: json['principalName'] as String? ?? '',
      taxClassification: json['taxClassification'] as String? ?? '',
      itemRegistrationNumber: json['itemRegistrationNumber'] as String? ?? '',
      unitOfMeasurement: json['unitOfMeasurement'] as String? ?? '',
      materialGroup2: json['materialGroup2'] as String? ?? '',
      materialGroup4: json['materialGroup4'] as String? ?? '',
      isSampleMaterial: json['isSampleMaterial'] as bool? ?? false,
      hasValidTenderContract: json['hasValidTenderContract'] as bool? ?? false,
      hasMandatoryTenderContract:
          json['hasMandatoryTenderContract'] as bool? ?? false,
      taxes: (JsonReadValueHelper.handleTax(json, 'taxes') as num).toDouble(),
      defaultMaterialDescription:
          json['defaultMaterialDescription'] as String? ?? '',
      isFOCMaterial: json['isFOCMaterial'] as bool? ?? false,
      quantity:
          (JsonReadValueHelper.handlevalidateQuantity(json, 'quantity') as num?)
                  ?.toInt() ??
              0,
      remarks: json['remarks'] as String? ?? '',
      genericMaterialName: json['genericMaterialName'] as String? ?? '',
      ean: json['ean'] as String? ?? '',
      bundle: BundleDto.fromJson(
          JsonReadValueHelper.readValueMapDynamic(json, 'bundleInformation')
              as Map<String, dynamic>),
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      principalCode: json['principalCode'] as String? ?? '',
      materialNumber: json['materialNumber'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      manufactured: json['manufactured'] as String? ?? '',
      isFavourite: json['isFavourite'] as bool? ?? false,
      type: json['type'] as String? ?? 'material',
      hidePrice: json['hidePrice'] as bool? ?? false,
      dataTotalCount: (json['dataTotalCount'] as num?)?.toInt() ?? 0,
      dataTotalHidden: (json['dataTotalHidden'] as num?)?.toInt() ?? 0,
      isGimmick: json['isGimmick'] as bool? ?? false,
      isPoison: json['isPoison'] as bool? ?? false,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => MaterialDataDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      bundles: (json['bundles'] as List<dynamic>?)
              ?.map((e) => BundleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isSuspended: json['suspensionStatus'] as bool? ?? false,
      isMarketPlace:
          JsonReadValueHelper.mappingIsMarketPlace(json, 'isMarketPlace')
                  as bool? ??
              false,
    );

Map<String, dynamic> _$$MaterialDtoImplToJson(_$MaterialDtoImpl instance) =>
    <String, dynamic>{
      'governmentMaterialCode': instance.governmentMaterialCode,
      'therapeuticClass': instance.therapeuticClass,
      'itemBrand': instance.itemBrand,
      'principalName': instance.principalName,
      'taxClassification': instance.taxClassification,
      'itemRegistrationNumber': instance.itemRegistrationNumber,
      'unitOfMeasurement': instance.unitOfMeasurement,
      'materialGroup2': instance.materialGroup2,
      'materialGroup4': instance.materialGroup4,
      'isSampleMaterial': instance.isSampleMaterial,
      'hasValidTenderContract': instance.hasValidTenderContract,
      'hasMandatoryTenderContract': instance.hasMandatoryTenderContract,
      'taxes': instance.taxes,
      'defaultMaterialDescription': instance.defaultMaterialDescription,
      'isFOCMaterial': instance.isFOCMaterial,
      'quantity': instance.quantity,
      'remarks': instance.remarks,
      'genericMaterialName': instance.genericMaterialName,
      'ean': instance.ean,
      'bundleInformation': instance.bundle.toJson(),
      'code': instance.code,
      'name': instance.name,
      'principalCode': instance.principalCode,
      'materialNumber': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'manufactured': instance.manufactured,
      'isFavourite': instance.isFavourite,
      'type': instance.type,
      'hidePrice': instance.hidePrice,
      'dataTotalCount': instance.dataTotalCount,
      'dataTotalHidden': instance.dataTotalHidden,
      'isGimmick': instance.isGimmick,
      'isPoison': instance.isPoison,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'bundles': instance.bundles.map((e) => e.toJson()).toList(),
      'suspensionStatus': instance.isSuspended,
      'isMarketPlace': instance.isMarketPlace,
    };

_$MaterialDataDtoImpl _$$MaterialDataDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialDataDtoImpl(
      code: JsonReadValueHelper.readMaterialNumberValue(json, 'code')
              as String? ??
          '',
      manufactured: json['manufactured'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      defaultMaterialDescription:
          json['defaultMaterialDescription'] as String? ?? '',
      genericMaterialName: json['genericMaterialName'] as String? ?? '',
      governmentMaterialCode: json['governmentMaterialCode'] as String? ?? '',
      itemRegistrationNumber: json['itemRegistrationNumber'] as String? ?? '',
      isMarketPlace:
          JsonReadValueHelper.mappingIsMarketPlace(json, 'isMarketPlace')
                  as bool? ??
              false,
    );

Map<String, dynamic> _$$MaterialDataDtoImplToJson(
        _$MaterialDataDtoImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'manufactured': instance.manufactured,
      'materialDescription': instance.materialDescription,
      'defaultMaterialDescription': instance.defaultMaterialDescription,
      'genericMaterialName': instance.genericMaterialName,
      'governmentMaterialCode': instance.governmentMaterialCode,
      'itemRegistrationNumber': instance.itemRegistrationNumber,
      'isMarketPlace': instance.isMarketPlace,
    };

_$MaterialResponseDtoImpl _$$MaterialResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialResponseDtoImpl(
      count: (json['count'] as num?)?.toInt() ?? 0,
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => MaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$MaterialResponseDtoImplToJson(
        _$MaterialResponseDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'products': instance.products.map((e) => e.toJson()).toList(),
    };
