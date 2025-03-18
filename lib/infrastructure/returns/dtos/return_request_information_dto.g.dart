// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_request_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReturnRequestInformationDtoImpl _$$ReturnRequestInformationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ReturnRequestInformationDtoImpl(
      invoiceNo: json['invoiceNo'] as String? ?? '',
      expiryDate: json['expiryDate'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      rejectReason: json['rejectReason'] as String? ?? '',
      returnTypeDesc: json['returnTypeDesc'] as String? ?? '',
      returnType: json['returnType'] as String? ?? '',
      returnQuantity: json['returnQuantity'] as String? ?? '',
      unitPrice: json['unitPrice'] as String? ?? '',
      totalPrice: json['totalPrice'] as String? ?? '',
      materialNumber: json['materialNumber'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      batch: json['batch'] as String? ?? '',
      returnOrderDesc: json['returnOrderDesc'] as String? ?? '',
      materialGroup: json['materialGroup'] as String? ?? '',
      imageUrl: (json['imageUrl'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      attachmentUrl: (json['attachmentUrl'] as List<dynamic>?)
              ?.map((e) =>
                  ReturnAttachmentDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      createdDate: json['createdDate'] as String? ?? '',
      principal: json['principal'] as String? ?? '',
      principalName: json['principalName'] as String? ?? '',
      bapiSalesDocNumber: json['bapiSalesDocNumber'] as String? ?? '',
      bapiStatus: json['bapiStatus'] as String? ?? '',
      status: json['status'] as String? ?? '',
      statusReason: json['statusReason'] as String? ?? '',
      outsidePolicy: json['outsidePolicy'] as bool? ?? false,
      invoiceDate: json['invoiceDate'] as String? ?? '',
      prsfd: json['prsfd'] as String? ?? '',
      remarks: json['remarks'] as String? ?? '',
      bonusInformation: (json['bonusInformation'] as List<dynamic>?)
              ?.map((e) => ReturnRequestInformationDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      overrideValue: json['overrideValue'] == null
          ? 0
          : const StringToDoubleConverter()
              .fromJson(json['overrideValue'] as String),
      initialQuantity: json['initialQuantity'] == null
          ? 0
          : const StringToIntConverter()
              .fromJson(json['initialQuantity'] as String),
      priceOverrideTrail: (json['priceOverrideTrail'] as List<dynamic>?)
              ?.map((e) =>
                  PriceOverrideTrailDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isMarketPlace:
          JsonReadValueHelper.mappingIsMarketPlace(json, 'isMarketPlace')
                  as bool? ??
              false,
      wareHouseStorageCondition:
          json['wareHouseStorageCondition'] as String? ?? '',
    );

Map<String, dynamic> _$$ReturnRequestInformationDtoImplToJson(
        _$ReturnRequestInformationDtoImpl instance) =>
    <String, dynamic>{
      'invoiceNo': instance.invoiceNo,
      'expiryDate': instance.expiryDate,
      'comment': instance.comment,
      'rejectReason': instance.rejectReason,
      'returnTypeDesc': instance.returnTypeDesc,
      'returnType': instance.returnType,
      'returnQuantity': instance.returnQuantity,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'materialNumber': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'batch': instance.batch,
      'returnOrderDesc': instance.returnOrderDesc,
      'materialGroup': instance.materialGroup,
      'imageUrl': instance.imageUrl,
      'attachments': instance.attachments,
      'attachmentUrl': instance.attachmentUrl.map((e) => e.toJson()).toList(),
      'createdDate': instance.createdDate,
      'principal': instance.principal,
      'principalName': instance.principalName,
      'bapiSalesDocNumber': instance.bapiSalesDocNumber,
      'bapiStatus': instance.bapiStatus,
      'status': instance.status,
      'statusReason': instance.statusReason,
      'outsidePolicy': instance.outsidePolicy,
      'invoiceDate': instance.invoiceDate,
      'prsfd': instance.prsfd,
      'remarks': instance.remarks,
      'bonusInformation':
          instance.bonusInformation.map((e) => e.toJson()).toList(),
      'overrideValue':
          const StringToDoubleConverter().toJson(instance.overrideValue),
      'initialQuantity':
          const StringToIntConverter().toJson(instance.initialQuantity),
      'priceOverrideTrail':
          instance.priceOverrideTrail.map((e) => e.toJson()).toList(),
      'isMarketPlace': instance.isMarketPlace,
      'wareHouseStorageCondition': instance.wareHouseStorageCondition,
    };

_$PriceOverrideTrailDtoImpl _$$PriceOverrideTrailDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PriceOverrideTrailDtoImpl(
      overrideValue: json['overrideValue'] == null
          ? 0
          : const StringToDoubleConverter()
              .fromJson(json['overrideValue'] as String),
      overrideRole: json['overriderRole'] as String? ?? '',
    );

Map<String, dynamic> _$$PriceOverrideTrailDtoImplToJson(
        _$PriceOverrideTrailDtoImpl instance) =>
    <String, dynamic>{
      'overrideValue':
          const StringToDoubleConverter().toJson(instance.overrideValue),
      'overriderRole': instance.overrideRole,
    };
