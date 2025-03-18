// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_payment_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerPaymentFilterDtoImpl _$$CustomerPaymentFilterDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerPaymentFilterDtoImpl(
      paymentBatchAdditionalInfo:
          json['paymentBatchAdditionalInfo'] as String? ?? '',
      createdDateToday: json['createdDateToday'] as String? ?? '',
      createdDateYesterday: json['createdDateYesterday'] as String? ?? '',
    );

Map<String, dynamic> _$$CustomerPaymentFilterDtoImplToJson(
        _$CustomerPaymentFilterDtoImpl instance) =>
    <String, dynamic>{
      'paymentBatchAdditionalInfo': instance.paymentBatchAdditionalInfo,
      'createdDateToday': instance.createdDateToday,
      'createdDateYesterday': instance.createdDateYesterday,
    };
