// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_summary_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentSummaryFilterDtoImpl _$$PaymentSummaryFilterDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentSummaryFilterDtoImpl(
      createdDateFrom: json['createdDateFrom'] as String? ?? '',
      createdDateTo: json['createdDateTo'] as String? ?? '',
      amountValueFrom: json['amountValueFrom'] as String? ?? '',
      amountValueTo: json['amountValueTo'] as String? ?? '',
      filterStatuses: json['filterStatuses'] as String? ?? '',
      searchKey: json['zzAdvice'] as String? ?? '',
    );

Map<String, dynamic> _$$PaymentSummaryFilterDtoImplToJson(
        _$PaymentSummaryFilterDtoImpl instance) =>
    <String, dynamic>{
      'createdDateFrom': instance.createdDateFrom,
      'createdDateTo': instance.createdDateTo,
      'amountValueFrom': instance.amountValueFrom,
      'amountValueTo': instance.amountValueTo,
      'filterStatuses': instance.filterStatuses,
      'zzAdvice': instance.searchKey,
    };
