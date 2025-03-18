// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_organisation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesOrganisationDtoImpl _$$SalesOrganisationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SalesOrganisationDtoImpl(
      salesOrg: json['SalesOrg'] as String,
      customerCode: json['CustomerCode'] as String,
      shipToCodes: (json['ShipToCode'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$SalesOrganisationDtoImplToJson(
        _$SalesOrganisationDtoImpl instance) =>
    <String, dynamic>{
      'SalesOrg': instance.salesOrg,
      'CustomerCode': instance.customerCode,
      'ShipToCode': instance.shipToCodes,
    };
