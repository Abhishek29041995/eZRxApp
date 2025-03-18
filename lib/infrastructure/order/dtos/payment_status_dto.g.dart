// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentStatusDtoImpl _$$PaymentStatusDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentStatusDtoImpl(
      paymentID: json['paymentID'] as String? ?? '',
      txnStatus: json['txnStatus'] as String? ?? '',
      transactionRef: json['transactionRef'] as String? ?? '',
    );

Map<String, dynamic> _$$PaymentStatusDtoImplToJson(
        _$PaymentStatusDtoImpl instance) =>
    <String, dynamic>{
      'paymentID': instance.paymentID,
      'txnStatus': instance.txnStatus,
      'transactionRef': instance.transactionRef,
    };
