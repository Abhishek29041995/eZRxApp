// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outstanding_balance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OutstandingBalanceDtoImpl _$$OutstandingBalanceDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OutstandingBalanceDtoImpl(
      customerCode: json['customerCode'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      amount: json['amount'] as String? ?? '',
      overdue: json['overdue'] as String? ?? '',
      checkDate: json['checkDate'] as String? ?? '',
    );

Map<String, dynamic> _$$OutstandingBalanceDtoImplToJson(
        _$OutstandingBalanceDtoImpl instance) =>
    <String, dynamic>{
      'customerCode': instance.customerCode,
      'currency': instance.currency,
      'amount': instance.amount,
      'overdue': instance.overdue,
      'checkDate': instance.checkDate,
    };
