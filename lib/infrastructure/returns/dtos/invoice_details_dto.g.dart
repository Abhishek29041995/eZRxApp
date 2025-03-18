// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceDetailsDtoImpl _$$InvoiceDetailsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceDetailsDtoImpl(
      invoiceNumber: json['invoiceNumber'] as String? ?? '',
      salesOrg: json['salesOrg'] as String? ?? '',
      materials: (json['materials'] as List<dynamic>?)
              ?.map((e) =>
                  ReturnItemDetailsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$InvoiceDetailsDtoImplToJson(
        _$InvoiceDetailsDtoImpl instance) =>
    <String, dynamic>{
      'invoiceNumber': instance.invoiceNumber,
      'salesOrg': instance.salesOrg,
      'materials': instance.materials.map((e) => e.toJson()).toList(),
    };
