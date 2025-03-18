// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_payment_term_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryDetailsPaymentTermDtoImpl
    _$$OrderHistoryDetailsPaymentTermDtoImplFromJson(
            Map<String, dynamic> json) =>
        _$OrderHistoryDetailsPaymentTermDtoImpl(
          paymentTermCode: json['paymentTermCode'] as String? ?? '',
          paymentTermDescription:
              json['paymentTermDescription'] as String? ?? '',
        );

Map<String, dynamic> _$$OrderHistoryDetailsPaymentTermDtoImplToJson(
        _$OrderHistoryDetailsPaymentTermDtoImpl instance) =>
    <String, dynamic>{
      'paymentTermCode': instance.paymentTermCode,
      'paymentTermDescription': instance.paymentTermDescription,
    };
