// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryDetailsDtoImpl _$$OrderHistoryDetailsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderHistoryDetailsDtoImpl(
      orderValue: (json['orderValue'] as num?)?.toDouble() ?? 0.0,
      totalTax: (json['totalTax'] as num?)?.toDouble() ?? 0,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0,
      manualFee: (json['manualFee'] as num?)?.toDouble() ?? 0,
      totalValue: (json['totalValue'] as num?)?.toDouble() ?? 0,
      totalDiscount: (json['totalDiscount'] as num?)?.toDouble() ?? 0,
      processingStatus: json['processingStatus'] as String? ?? '',
      requestedDeliveryDate: json['requestedDeliveryDate'] as String? ?? '',
      expectedDeliveryDate: json['expectedDeliveryDate'] as String? ?? '',
      type: json['type'] as String? ?? '',
      telephoneNumber: json['telephoneNumber'] as String? ?? '',
      createdDate:
          JsonReadValueHelper.readCreatedDateTimeValue(json, 'createdDate')
              as String,
      eZRXNumber: json['eZRXNumber'] as String? ?? '',
      orderBy: json['orderBy'] as String? ?? '',
      referenceNotes: json['referenceNotes'] as String? ?? '',
      companyName: json['companyName'] as String? ?? '',
      orderNumber: json['orderNumber'] as String? ?? '',
      pOReference: json['pOReference'] as String? ?? '',
      shipTo: json['shipTo'] as String? ?? '',
      soldTo: json['soldTo'] as String? ?? '',
      shipToAddress: json['shipToAddres'] as String? ?? '',
      soldToAddress: json['soldToAddress'] as String? ?? '',
      invoiceNumber: json['invoiceNumber'] as String? ?? '',
      orderReason: json['orderReason'] as String? ?? '',
      orderHistoryDetailsOrderItem:
          (JsonReadValueHelper.readList(json, 'orderItems') as List<dynamic>)
              .map((e) => OrderHistoryDetailsOrderItemDto.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      orderHistoryDetailsPaymentTerm:
          OrderHistoryDetailsPaymentTermDto.fromJson(
              JsonReadValueHelper.readValueMapDynamic(json, 'paymentTerm')
                  as Map<String, dynamic>),
      orderHistoryDetailsSpecialInstructions:
          JsonReadValueHelper.readString(json, 'specialInstructions') as String,
      orderHistoryDetailsPoDocuments:
          (JsonReadValueHelper.readList(json, 'pODocuments') as List<dynamic>)
              .map((e) => PoDocumentsDto.fromJson(e as Map<String, dynamic>))
              .toList(),
      itemCount: (json['itmCount'] as num?)?.toInt() ?? 0,
      isMarketPlace:
          JsonReadValueHelper.mappingIsMarketPlace(json, 'isMarketPlace')
                  as bool? ??
              false,
      taxRate:
          (JsonReadValueHelper.handleTax(json, 'taxRate') as num).toDouble(),
    );

Map<String, dynamic> _$$OrderHistoryDetailsDtoImplToJson(
        _$OrderHistoryDetailsDtoImpl instance) =>
    <String, dynamic>{
      'orderValue': instance.orderValue,
      'totalTax': instance.totalTax,
      'deliveryFee': instance.deliveryFee,
      'manualFee': instance.manualFee,
      'totalValue': instance.totalValue,
      'totalDiscount': instance.totalDiscount,
      'processingStatus': instance.processingStatus,
      'requestedDeliveryDate': instance.requestedDeliveryDate,
      'expectedDeliveryDate': instance.expectedDeliveryDate,
      'type': instance.type,
      'telephoneNumber': instance.telephoneNumber,
      'createdDate': instance.createdDate,
      'eZRXNumber': instance.eZRXNumber,
      'orderBy': instance.orderBy,
      'referenceNotes': instance.referenceNotes,
      'companyName': instance.companyName,
      'orderNumber': instance.orderNumber,
      'pOReference': instance.pOReference,
      'shipTo': instance.shipTo,
      'soldTo': instance.soldTo,
      'shipToAddres': instance.shipToAddress,
      'soldToAddress': instance.soldToAddress,
      'invoiceNumber': instance.invoiceNumber,
      'orderReason': instance.orderReason,
      'orderItems':
          instance.orderHistoryDetailsOrderItem.map((e) => e.toJson()).toList(),
      'paymentTerm': instance.orderHistoryDetailsPaymentTerm.toJson(),
      'specialInstructions': instance.orderHistoryDetailsSpecialInstructions,
      'pODocuments': instance.orderHistoryDetailsPoDocuments
          .map((e) => e.toJson())
          .toList(),
      'itmCount': instance.itemCount,
      'isMarketPlace': instance.isMarketPlace,
      'taxRate': instance.taxRate,
    };
