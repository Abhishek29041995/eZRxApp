// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_request_params_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddRequestParamsDtoImpl _$$AddRequestParamsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AddRequestParamsDtoImpl(
      orderSource: json['orderSource'] as String? ?? '',
      purchaseNumberC: json['purchaseNumberC'] as String? ?? '',
      specialInstruction: json['specialInstruction'] as String? ?? '',
      userName: json['username'] as String? ?? '',
      soldToCustomer: json['soldToCustomer'] as String? ?? '',
      invoiceDetails: (json['invoiceDetails'] as List<dynamic>?)
              ?.map(
                  (e) => InvoiceDetailsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$AddRequestParamsDtoImplToJson(
        _$AddRequestParamsDtoImpl instance) =>
    <String, dynamic>{
      'orderSource': instance.orderSource,
      'purchaseNumberC': instance.purchaseNumberC,
      'specialInstruction': instance.specialInstruction,
      'username': instance.userName,
      'soldToCustomer': instance.soldToCustomer,
      'invoiceDetails': instance.invoiceDetails.map((e) => e.toJson()).toList(),
    };
