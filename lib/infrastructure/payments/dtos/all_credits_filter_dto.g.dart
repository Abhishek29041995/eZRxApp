// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_credits_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllCreditsFilterDtoImpl _$$AllCreditsFilterDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AllCreditsFilterDtoImpl(
      documentDateFrom: json['documentDateFrom'] as String? ?? '',
      documentDateTo: json['documentDateTo'] as String? ?? '',
      amountValueFrom: json['amountValueFrom'] as String? ?? '',
      amountValueTo: json['amountValueTo'] as String? ?? '',
      filterStatuses: json['filterStatuses'] as String? ?? '',
      searchKey: json['accountingDocument'] as String? ?? '',
    );

Map<String, dynamic> _$$AllCreditsFilterDtoImplToJson(
        _$AllCreditsFilterDtoImpl instance) =>
    <String, dynamic>{
      'documentDateFrom': instance.documentDateFrom,
      'documentDateTo': instance.documentDateTo,
      'amountValueFrom': instance.amountValueFrom,
      'amountValueTo': instance.amountValueTo,
      'filterStatuses': instance.filterStatuses,
      'accountingDocument': instance.searchKey,
    };
