// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_document_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerDocumentDetailDtoImpl _$$CustomerDocumentDetailDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerDocumentDetailDtoImpl(
      billingDocumentItem: json['billingDocumentItem'] as String? ?? '',
      salesDocumentItemType: json['salesDocumentItemType'] as String? ?? '',
      materialNumber: json['material'] as String? ?? '',
      billingDocumentItemText: json['billingDocumentItemText'] as String? ?? '',
      billingQuantity: json['billingQuantity'] as String? ?? '',
      billingQuantityUnit: json['billingQuantityUnit'] as String? ?? '',
      salesMeasureISOUnit: json['salesMeasureISOUnit'] as String? ?? '',
      referenceSDDocument: json['referenceSDDocument'] as String? ?? '',
      referenceSDDocumentItem: json['referenceSDDocumentItem'] as String? ?? '',
      referenceSDDocumentCategory:
          json['referenceSDDocumentCategory'] as String? ?? '',
      grossAmount: (json['grossAmount'] as num?)?.toDouble() ?? 0.0,
      netAmount: (json['netAmount'] as num?)?.toDouble() ?? 0.0,
      taxAmount: (json['taxAmount'] as num?)?.toDouble() ?? 0.0,
      principalName: json['principalName'] as String? ?? '',
      principalCode: json['principalCode'] as String? ?? '',
      batches: (json['batches'] as List<dynamic>?)
              ?.map((e) => BatchesDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$CustomerDocumentDetailDtoImplToJson(
        _$CustomerDocumentDetailDtoImpl instance) =>
    <String, dynamic>{
      'billingDocumentItem': instance.billingDocumentItem,
      'salesDocumentItemType': instance.salesDocumentItemType,
      'material': instance.materialNumber,
      'billingDocumentItemText': instance.billingDocumentItemText,
      'billingQuantity': instance.billingQuantity,
      'billingQuantityUnit': instance.billingQuantityUnit,
      'salesMeasureISOUnit': instance.salesMeasureISOUnit,
      'referenceSDDocument': instance.referenceSDDocument,
      'referenceSDDocumentItem': instance.referenceSDDocumentItem,
      'referenceSDDocumentCategory': instance.referenceSDDocumentCategory,
      'grossAmount': instance.grossAmount,
      'netAmount': instance.netAmount,
      'taxAmount': instance.taxAmount,
      'principalName': instance.principalName,
      'principalCode': instance.principalCode,
      'batches': instance.batches.map((e) => e.toJson()).toList(),
    };
