// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_order_customer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmitOrderCustomerDtoImpl _$$SubmitOrderCustomerDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SubmitOrderCustomerDtoImpl(
      customerNumber: json['customerNumber'] as String? ?? '',
      customerNumberShipTo: json['customerNumberShipTo'] as String? ?? '',
      salesOrganisation: json['salesOrganisation'] as String? ?? '',
      division: json['division'] as String? ?? '',
    );

Map<String, dynamic> _$$SubmitOrderCustomerDtoImplToJson(
        _$SubmitOrderCustomerDtoImpl instance) =>
    <String, dynamic>{
      'customerNumber': instance.customerNumber,
      'customerNumberShipTo': instance.customerNumberShipTo,
      'salesOrganisation': instance.salesOrganisation,
      'division': instance.division,
    };
