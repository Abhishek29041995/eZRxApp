// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_credit_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvailableCreditFilterDtoImpl _$$AvailableCreditFilterDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AvailableCreditFilterDtoImpl(
      documentDateFrom: json['documentDateFrom'] as String? ?? '',
      documentDateTo: json['documentDateTo'] as String? ?? '',
      amountInTransactionCurrencyFrom:
          json['amountInTransactionCurrencyFrom'] as String? ?? '',
      amountInTransactionCurrencyTo:
          json['amountInTransactionCurrencyTo'] as String? ?? '',
    );

Map<String, dynamic> _$$AvailableCreditFilterDtoImplToJson(
        _$AvailableCreditFilterDtoImpl instance) =>
    <String, dynamic>{
      'documentDateFrom': instance.documentDateFrom,
      'documentDateTo': instance.documentDateTo,
      'amountInTransactionCurrencyFrom':
          instance.amountInTransactionCurrencyFrom,
      'amountInTransactionCurrencyTo': instance.amountInTransactionCurrencyTo,
    };
