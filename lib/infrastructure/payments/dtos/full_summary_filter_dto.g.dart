// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_summary_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FullSummaryFilterDtoImpl _$$FullSummaryFilterDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$FullSummaryFilterDtoImpl(
      dueDateFrom: json['dueDateFrom'] as String? ?? '',
      dueDateTo: json['dueDateTo'] as String? ?? '',
      documentDateFrom: json['documentDateFrom'] as String? ?? '',
      documentDateTo: json['documentDateTo'] as String? ?? '',
      filterStatuses: json['filterStatuses'] as String? ?? '',
      searchKey: json['accountingDocument'] as String? ?? '',
    );

Map<String, dynamic> _$$FullSummaryFilterDtoImplToJson(
        _$FullSummaryFilterDtoImpl instance) =>
    <String, dynamic>{
      'dueDateFrom': instance.dueDateFrom,
      'dueDateTo': instance.dueDateTo,
      'documentDateFrom': instance.documentDateFrom,
      'documentDateTo': instance.documentDateTo,
      'filterStatuses': instance.filterStatuses,
      'accountingDocument': instance.searchKey,
    };
