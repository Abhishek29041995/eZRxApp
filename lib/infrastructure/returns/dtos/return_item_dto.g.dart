// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReturnItemDtoImpl _$$ReturnItemDtoImplFromJson(Map<String, dynamic> json) =>
    _$ReturnItemDtoImpl(
      requestId: json['requestId'] as String? ?? '',
      requestDate: json['requestDate'] as String? ?? '',
      itemQty: json['itemQty'] as String? ?? '0',
      totalPrice: json['totalPrice'] as String? ?? '',
      status: json['status'] as String? ?? '',
      materialNumber: json['materialNumber'] as String? ?? '',
      materialName: json['materialName'] as String? ?? '',
      defaultMaterialDescription:
          json['DefaultMaterialDescription'] as String? ?? '',
      orderNumber: json['orderNumber'] as String? ?? '',
      invoiceID: json['invoiceID'] as String? ?? '',
      customerName: json['customerName'] as String? ?? '',
      batch: json['batch'] as String? ?? '',
      outsidePolicy: json['outsidePolicy'] as bool? ?? false,
      expiry: json['expiry'] as String? ?? '',
      prsfd: json['prsfd'] as String? ?? '',
      isMarketPlace:
          JsonReadValueHelper.mappingIsMarketPlace(json, 'isMarketPlace')
                  as bool? ??
              false,
      lineItemNumber: json['lineItemNumber'] as String? ?? '',
      wareHouseStorageCondition:
          json['wareHouseStorageCondition'] as String? ?? '',
    );

Map<String, dynamic> _$$ReturnItemDtoImplToJson(_$ReturnItemDtoImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'requestDate': instance.requestDate,
      'itemQty': instance.itemQty,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
      'materialNumber': instance.materialNumber,
      'materialName': instance.materialName,
      'DefaultMaterialDescription': instance.defaultMaterialDescription,
      'orderNumber': instance.orderNumber,
      'invoiceID': instance.invoiceID,
      'customerName': instance.customerName,
      'batch': instance.batch,
      'outsidePolicy': instance.outsidePolicy,
      'expiry': instance.expiry,
      'prsfd': instance.prsfd,
      'isMarketPlace': instance.isMarketPlace,
      'lineItemNumber': instance.lineItemNumber,
      'wareHouseStorageCondition': instance.wareHouseStorageCondition,
    };
