// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_basic_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryBasicInfoDtoImpl _$$OrderHistoryBasicInfoDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderHistoryBasicInfoDtoImpl(
      soldTo: json['soldTo'] as String,
      shipTo: json['shipTo'] as String,
      companyName: json['companyName'] as String,
      paymentTerm:
          PaymentTermDto.fromJson(json['paymentTerm'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderHistoryBasicInfoDtoImplToJson(
        _$OrderHistoryBasicInfoDtoImpl instance) =>
    <String, dynamic>{
      'soldTo': instance.soldTo,
      'shipTo': instance.shipTo,
      'companyName': instance.companyName,
      'paymentTerm': instance.paymentTerm.toJson(),
    };
