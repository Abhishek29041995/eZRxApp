// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_customer_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentCustomerInformationDtoImpl
    _$$PaymentCustomerInformationDtoImplFromJson(Map<String, dynamic> json) =>
        _$PaymentCustomerInformationDtoImpl(
          paymentTerm: json['paymentTerm'] as String,
          shipToDtoList: (json['shipTo'] as List<dynamic>)
              .map((e) => ShipToDto.fromJson(e as Map<String, dynamic>))
              .toList(),
          billToDto: (json['billTo'] as List<dynamic>)
              .map((e) => BillToDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$PaymentCustomerInformationDtoImplToJson(
        _$PaymentCustomerInformationDtoImpl instance) =>
    <String, dynamic>{
      'paymentTerm': instance.paymentTerm,
      'shipTo': instance.shipToDtoList.map((e) => e.toJson()).toList(),
      'billTo': instance.billToDto.map((e) => e.toJson()).toList(),
    };
