// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_order_items_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryDetailsOrderItemDtoImpl
    _$$OrderHistoryDetailsOrderItemDtoImplFromJson(Map<String, dynamic> json) =>
        _$OrderHistoryDetailsOrderItemDtoImpl(
          type: json['type'] as String? ?? '',
          materialNumber: json['materialCode'] as String,
          materialDescription: json['materialDescription'] as String? ?? '',
          defaultMaterialDescription:
              json['defaultMaterialDescription'] as String? ?? '',
          qty: (json['qty'] as num?)?.toInt() ?? 0,
          unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0.0,
          originPrice: (json['mrp'] as num?)?.toDouble() ?? 0.0,
          totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
          tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
          sAPStatus: json['sAPStatus'] as String? ?? '',
          plannedDeliveryDate: json['plannedDeliveryDate'] as String? ?? '',
          pickedQuantity: (json['pickedQuantity'] as num?)?.toInt() ?? 0,
          lineReferenceNotes: json['lineReferenceNotes'] as String? ?? '',
          lineNumber: json['lineNumber'] as String? ?? '',
          isTenderContractMaterial: JsonReadValueHelper.readBoolStringFormat(
                  json, 'isTenderContractMaterial') as bool? ??
              false,
          parentId: json['parentID'] as String? ?? '',
          details: (json['details'] as List<dynamic>?)
                  ?.map((e) => OrderHistoryDetailsOrderItemDetailsDto.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
          tenderContractDetails: OrderHistoryDetailsTenderContractDto.fromJson(
              JsonReadValueHelper.readValueMapDynamic(
                  json, 'tenderContractDetails') as Map<String, dynamic>),
          principalName: json['principalName'] as String? ?? '',
          principalCode: json['principalCode'] as String? ?? '',
          governmentMaterialCode:
              json['governmentMaterialCode'] as String? ?? '',
          itemRegistrationNumber:
              json['itemRegistrationNumber'] as String? ?? '',
          productType: JsonReadValueHelper.readProductType(json, 'productType')
              as String,
          promosStatus: json['promoStatus'] as bool? ?? false,
          isCounterOffer: json['isCounterOffer'] as bool? ?? false,
          hidePrice: json['hidePrice'] as bool? ?? false,
          isMarketPlace:
              JsonReadValueHelper.mappingIsMarketPlace(json, 'isMarketPlace')
                      as bool? ??
                  false,
          isCovid: json['isCovid'] as bool? ?? false,
          totalUnitPrice: (json['totalUnitPrice'] as num?)?.toDouble() ?? 0.0,
          totalTax: (json['totalTax'] as num?)?.toDouble() ?? 0.0,
          taxRate: (JsonReadValueHelper.handleTax(json, 'taxRate') as num)
              .toDouble(),
          batches: (json['batches'] as List<dynamic>?)
                  ?.map((e) => BatchesDto.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$$OrderHistoryDetailsOrderItemDtoImplToJson(
        _$OrderHistoryDetailsOrderItemDtoImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'materialCode': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'defaultMaterialDescription': instance.defaultMaterialDescription,
      'qty': instance.qty,
      'unitPrice': instance.unitPrice,
      'mrp': instance.originPrice,
      'totalPrice': instance.totalPrice,
      'tax': instance.tax,
      'sAPStatus': instance.sAPStatus,
      'plannedDeliveryDate': instance.plannedDeliveryDate,
      'pickedQuantity': instance.pickedQuantity,
      'lineReferenceNotes': instance.lineReferenceNotes,
      'lineNumber': instance.lineNumber,
      'isTenderContractMaterial': instance.isTenderContractMaterial,
      'parentID': instance.parentId,
      'details': instance.details.map((e) => e.toJson()).toList(),
      'tenderContractDetails': instance.tenderContractDetails.toJson(),
      'principalName': instance.principalName,
      'principalCode': instance.principalCode,
      'governmentMaterialCode': instance.governmentMaterialCode,
      'itemRegistrationNumber': instance.itemRegistrationNumber,
      'productType': instance.productType,
      'promoStatus': instance.promosStatus,
      'isCounterOffer': instance.isCounterOffer,
      'hidePrice': instance.hidePrice,
      'isMarketPlace': instance.isMarketPlace,
      'isCovid': instance.isCovid,
      'totalUnitPrice': instance.totalUnitPrice,
      'totalTax': instance.totalTax,
      'taxRate': instance.taxRate,
      'batches': instance.batches.map((e) => e.toJson()).toList(),
    };
